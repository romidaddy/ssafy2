#!/usr/bin/env python
#-*- coding:utf-8 -*-

import rospy
import cv2
import numpy as np
import math
import time
from sensor_msgs.msg import PointCloud2, CompressedImage
import sensor_msgs.point_cloud2 as pc2
from numpy.linalg import inv


# lidar_ex_calib_velodyne 은 MORAI SIM에서 송신하는 LiDAR PointCloud2 Data를 Camera Image Data에 정합하는 예제입니다.
# 정합을 위해서는 LiDAR와 Camera 간의 위치 자세 관계성을 나타내는 Transformation Matrix(Extrinsic)와 Image Plane에 대한 정보인 Camera Matrix(Intrinsic)가 필요합니다.
# Transformation Matrix, Camera Matrix는 Camera, LiDAR 센서의 설치 위치 및 스펙을 이용해 계산합니다.
# 계산된 Matrix 들을 활용하여 LiDAR PointCloud2 Data를 Image Data에 정합한 결과를 시각화 합니다.
# 정합 시에는 불필요한 Point들을 제거해야 하며 각 Sensor Data의 좌표계가 어떤 형태인지 명심해야 합니다. 
# LiDAR는 VLP-16을 사용합니다.

#노드 실행 순서
# 1. Camera, LiDAR의 설치 좌표, Camera Parameter 입력
# 2. Extrinsic : Transformation Matrix(LiDAR to Camera Frame) 계산
#   2.1 Sensor to Vehicle Tranformation Matrix 계산 함수 구현
#       2.1.1 Rotation Matrix 계산 함수 구현
#       2.1.2 Transformation Matrix 계산 함수 구현
#   2.2 LiDAR to Camera Transformation Matrix 계산       
# 3. Intrinsic : Camera Matrix (Camera to Image Plane) 계산
# 4. LiDAR의 PointCloud2, Camera의 Image data 수신
# 6. 수신된 PointCloud2 data를 2D Image Plane으로 정합
# 5. PointCloud가 Image에 투영된 Processed Image 시각화

#TODO: (1) Camera, LiDAR의 설치 좌표, Camera Parameter 입력
# 시뮬레이터에서 설치한 Camera와 LiDAR의 정보를 입력하는 영역입니다.
# 차량 뒷축 중심을 기준으로 설치된 센서들의 위치를 입력해줍니다. (X,Y,Z,Roll,Pitch,Yaw)
# Roll, Pitch, Yaw 입력 시에는 Radian 값으로 변환하여 입력해주어야 합니다.
# Camera는 추가로 Width, Height, Horizontal FOV 값을 입력합니다.

parameters_cam = {
    "WIDTH": 640, # image width
    "HEIGHT": 480, # image height
    "FOV": 90, # Field of view
    "X": 3.31, # meter
    "Y": 0.08,
    "Z": 0.6,
    "YAW": 0, # radian    
    "PITCH": 0,
    "ROLL": 0,
}

parameters_lidar = {
    "X": 0.43, # meter
    "Y": 0.0,
    "Z": 1.57,
    "YAW": 0.0, # radian
    "PITCH": 0.0,
    "ROLL": 0,
}
def getRotMat(RPY):
    cosR = math.cos(RPY[0])
    cosP = math.cos(RPY[1])
    cosY = math.cos(RPY[2])
    sinR = math.sin(RPY[0])
    sinP = math.sin(RPY[1])
    sinY = math.sin(RPY[2])
    
    rotRoll = np.array([1,0,0, 0,cosR,-sinR, 0,sinR,cosR]).reshape(3,3)
    rotPitch = np.array([cosP,0,sinP, 0,1,0, -sinP,0,cosP]).reshape(3,3)
    rotYaw = np.array([cosY,-sinY,0, sinY,cosY,0, 0,0,1]).reshape(3,3)
    
    rotMat = rotYaw.dot(rotPitch.dot(rotRoll))
    
    return rotMat
def getTransformMat(params_cam, params_lidar):
    #With Respect to Vehicle ISO Coordinate
    lidarPosition = np.array([params_lidar.get(i) for i in (["X","Y","Z"])])
    camPosition = np.array([params_cam.get(i) for i in (["X","Y","Z"])])
    lidarRPY = np.array([params_lidar.get(i) for i in (["ROLL","PITCH","YAW"])])
    camRPY = np.array([params_cam.get(i) for i in (["ROLL","PITCH","YAW"])])
    camRPY = camRPY + np.array([-90*math.pi/180,0,-90*math.pi/180])
    #lidarPositionOffset = np.array([0.02883,0,0.09081])
    lidarPositionOffset = np.array([0, 0, -0.25])
    lidarPosition = lidarPosition + lidarPositionOffset
    camPositionOffset = np.array([0.1085, 0, 0])
    camPosition = camPosition + camPositionOffset
    camRot = getRotMat(camRPY)
    camTransl = np.array([camPosition])
    Tr_cam_to_vehicle = np.concatenate((camRot,camTransl.T),axis = 1)
    Tr_cam_to_vehicle = np.insert(Tr_cam_to_vehicle, 3, values=[0,0,0,1],axis = 0)
    lidarRot = getRotMat(lidarRPY)
    lidarTransl = np.array([lidarPosition]) 
    Tr_lidar_to_vehicle = np.concatenate((lidarRot,lidarTransl.T),axis = 1)
    Tr_lidar_to_vehicle = np.insert(Tr_lidar_to_vehicle, 3, values=[0,0,0,1],axis = 0)
    invTr = inv(Tr_cam_to_vehicle)
    Tr_lidar_to_cam = invTr.dot(Tr_lidar_to_vehicle).round(6)
    print(Tr_lidar_to_cam)
    return Tr_lidar_to_cam
def getCameraMat(params_cam):
    # Camera Intrinsic Parameters
    focalLength = params_cam["WIDTH"]/(2*np.tan(np.deg2rad(params_cam["FOV"]/2)))
    principalX = params_cam["WIDTH"]/2
    principalY = params_cam["HEIGHT"]/2
    CameraMat = np.array([focalLength,0.,principalX,0,focalLength,principalY,0,0,1]).reshape(3,3)
    print(CameraMat)
    return CameraMat
class LiDARToCameraTransform:
    def __init__(self, params_cam, params_lidar):        
        self.scan_sub = rospy.Subscriber("/velodyne_points", PointCloud2, self.scan_callback)
        self.image_sub = rospy.Subscriber("/image_jpeg/compressed", CompressedImage, self.img_callback)
        self.pc_np = None
        self.img = None
        self.width = params_cam["WIDTH"]
        self.height = params_cam["HEIGHT"]
        self.TransformMat = getTransformMat(params_cam, params_lidar)
        self.CameraMat = getCameraMat(params_cam)
    def img_callback(self, msg):
        np_arr = np.frombuffer(msg.data, np.uint8)
        self.img = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
    def scan_callback(self, msg):
        point_list = []        
        for point in pc2.read_points(msg, skip_nans=True):      
            point_list.append((point[0], point[1], point[2], 1))
        self.pc_np = np.array(point_list, np.float32)        
    def transformLiDARToCamera(self, pc_lidar):
        cam_temp = self.TransformMat.dot(pc_lidar)
        cam_temp = np.delete(cam_temp, 3, axis=0)
        return cam_temp
    def transformCameraToImage(self, pc_camera):
        cam_temp = self.CameraMat.dot(pc_camera)
        cam_temp = np.delete(cam_temp,np.where(cam_temp[2,:]<0),axis=1)
        cam_temp /= cam_temp[2,:]
        cam_temp = np.delete(cam_temp,np.where(cam_temp[0,:]>self.width),axis=1)
        cam_temp = np.delete(cam_temp,np.where(cam_temp[1,:]>self.height),axis=1)
        return cam_temp
def draw_pts_img(img, xi, yi):
    point_np = img    
    for ctr in zip(xi, yi):
        point_np = cv2.circle(point_np, ctr, 2, (0,255,0),-1)
    return point_np
if __name__ == '__main__':    
    rospy.init_node('ex_calib', anonymous=True)
    Transformer = LiDARToCameraTransform(parameters_cam, parameters_lidar)
    time.sleep(1)
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
            
        xyz_p = Transformer.pc_np[:, 0:3]
        xyz_p = np.insert(xyz_p,3,1,axis=1).T
        xyz_p = np.delete(xyz_p,np.where(xyz_p[0,:]<0),axis=1)
        xyz_p = np.delete(xyz_p,np.where(xyz_p[0,:]>10),axis=1)
        xyz_p = np.delete(xyz_p,np.where(xyz_p[2,:]<-1.2),axis=1) #Ground Filter
        #print(xyz_p[0])
        xyz_c = Transformer.transformLiDARToCamera(xyz_p)
        #print(np.size(xyz_c[0]))
        xy_i = Transformer.transformCameraToImage(xyz_c)
        #print(np.size(xy_i[0]))
        xy_i = xy_i.astype(np.int32)
        projectionImage = draw_pts_img(Transformer.img, xy_i[0,:], xy_i[1,:])
                                            
        cv2.imshow("LidartoCameraProjection", projectionImage)
        cv2.waitKey(1)