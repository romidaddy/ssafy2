#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import rospy
import rospkg
from math import cos,sin,pi,sqrt,pow,atan2
from geometry_msgs.msg import Point,PoseWithCovarianceStamped
from nav_msgs.msg import Odometry,Path
from morai_msgs.msg import CtrlCmd,EgoVehicleStatus,ObjectStatusList, GetTrafficLightStatus , GPSMessage
import numpy as np
import tf
from tf.transformations import euler_from_quaternion,quaternion_from_euler
from ssafyrari.msg import global_data, Velo
from lib.mgeo.class_defs import *

### 다익으로부터 받는 메시지(globalpath1,2/ data 1,2  현출도/)

### 1. dik으로부터 현출도 메시지 받기
### 2. 따로 저장후 이후 오는 데이터 계속 비교
### 3. 다르면 새로 저장후 속도 계획 새로계산
### 4. 속도계획 다시 송신

### 5. 출발지에 가까워질시 현출 -> 출도 (current.position 필요)
### 5.1 두개의 속도계획 가지고 있다가 전환하는 코드.

# MSG - Velo 타입 리스트
# 글로벌 데이터에 현출도를 넣기 global_data.hcd

class velo_hcd_pub:
    def __init__(self):
        rospy.init_node("velo_hcd_pub", anonymous=True)
        self.velo_hcd_pub = rospy.Publisher("/velo_hcd", Velo, queue_size = 1)

        self.global_data = []
        self.current_position = Point()
        self.change = 0
        

        rospy.Subscriber("/global_path", Path, self.global_path_callback)
        rospy.Subscriber("/global_path2", Path, self.global_path_callback2)
        rospy.Subscriber("/global_data", global_data, self.global_data_callback)
        rospy.Subscriber("/odom", Odometry, self.odom_callback)
        # self.global_path_pub = rospy.Publisher('/global_path',Path, queue_size = 1)
        self.global_data_pub = rospy.Publisher('/global_data2', global_data, queue_size = 1)
        self.is_global_path = False
        self.is_global_path2 = False
        self.target_velocity = 40
        self.road_friction = 0.8
        self.vel_planning = velocityPlanning(self.target_velocity/3.6, self.road_friction)


        while True:
            if self.is_global_path == True and self.is_global_path2 == True:
                self.velocity_list_1 = self.vel_planning.curvedBaseVelocity(self.global_path, 50)
                self.velocity_list_2 = self.vel_planning.curvedBaseVelocity(self.global_path2, 50)
                self.velocity_list = self.velocity_list_1
                break
            else:
                rospy.loginfo('Waiting global path data')
        self.change = self.global_data.change

        self.velo_hcd_msg = Velo()
        self.global_data_msg = global_data()

        self.global_data_msg.nodes_idx = self.global_data.nodes_idx1
        self.global_data_msg.links_idx = self.global_data.links_idx1

        rate = rospy.Rate(5)
        while not rospy.is_shutdown():

            user_dst = ((self.current_position.x - self.global_data.CC[0])**2 + (self.current_position.y - self.global_data.CC[1])**2)**0.5
            print(user_dst)
            print(self.current_position.x ,self.current_position.y)
            print( self.global_data.CC[0],  self.global_data.CC[1])
            if user_dst < 10:
                print('까깝')
                self.velocity_list = self.velocity_list_2
                self.global_data_msg.nodes_idx = self.global_data.nodes_idx2
                self.global_data_msg.links_idx = self.global_data.links_idx2

            if self.change != self.global_data.change:  # 출발지가 다르다면 새로운 속도계획 생성 판단을 다익에서 하고 트리거를 걸자
                self.velocity_list_1 = self.vel_planning.curvedBaseVelocity(self.global_path, 50)
                self.velocity_list_2 = self.vel_planning.curvedBaseVelocity(self.global_path2, 50)
                self.velocity_list = self.velocity_list_1
                self.change = self.global_data.change

                self.global_data_msg.nodes_idx = self.global_data.nodes_idx1
                self.global_data_msg.links_idx = self.global_data.links_idx1

            self.velo_hcd_msg.velo = self.velocity_list

            self.velo_hcd_pub.publish(self.velo_hcd_msg)
            self.global_data_pub.publish(self.global_data_msg)

            rate.sleep()

    def global_data_callback(self, msg):
        self.global_data = msg

    def global_path_callback(self, msg):
        self.global_path = msg
        self.is_global_path = True

    def global_path_callback2(self, msg):
        self.global_path2 = msg
        self.is_global_path2 = True

    def odom_callback(self,msg):
        self.is_odom=True
        odom_quaternion=(msg.pose.pose.orientation.x,msg.pose.pose.orientation.y,msg.pose.pose.orientation.z,msg.pose.pose.orientation.w)
        _,_,self.vehicle_yaw=euler_from_quaternion(odom_quaternion)
        self.current_position.x = msg.pose.pose.position.x
        self.current_position.y = msg.pose.pose.position.y



class velocityPlanning:
    def __init__ (self, car_max_speed, road_friciton):   
        self.car_max_speed = car_max_speed
        self.road_friction = road_friciton
        
    def curvedBaseVelocity(self, gloabl_path, point_num):
        out_vel_plan = []

        for i in range(0,point_num):
            out_vel_plan.append(self.car_max_speed)

        for i in range(point_num, len(gloabl_path.poses) - point_num):
            x_list = []
            y_list = []
            for box in range(-point_num, point_num):
                x = gloabl_path.poses[i+box].pose.position.x
                y = gloabl_path.poses[i+box].pose.position.y
                x_list.append([-2*x, -2*y ,1])
                y_list.append((-x*x) - (y*y))

            A = np.array(x_list)
            B = np.array(y_list)
            a, b, c = np.dot(np.linalg.pinv(A), B)
            
            r = (a**2 + b**2 - c)**0.5

            v_max = (r * 9.8 * self.road_friction) ** 0.5

            if v_max > self.car_max_speed:
                v_max = self.car_max_speed
            out_vel_plan.append(v_max)

        for i in range(len(gloabl_path.poses) - point_num, len(gloabl_path.poses)-8):
            out_vel_plan.append(10)

        for i in range(len(gloabl_path.poses) - 8, len(gloabl_path.poses)):
            out_vel_plan.append(0)

        return out_vel_plan
    

if __name__ == '__main__':
    
    velo_hcd_pub = velo_hcd_pub()
