#!/usr/bin/env python
# -*- coding: utf-8 -*-
import rospy
from std_msgs.msg import String
from ssafy_2.msg import GPS

# my_name_talker 는 Custom Msgs 를 이용한 Topic Publisher(메세지 송신) 예제입니다.
# /my_name 라는 메세지를 Publish 합니다.

# 노드 실행 순서 
# 1. publisher 생성
# 2. ROS 노드 이름 선언
# 3. 코드 반복 시간 설정 및 반복 실행
# 4. 송신 될 메세지 변수 생성 및 터미널 창 출력
# 5. /my_name 메세지 Publish
def talker():
    #TODO: (1) publisher 생성
    '''
    # student 라는 직접 만든 Custom ROS 메세지 형식을 사용하여 Topic Publisher 를 완성한다.
    # Topic 이름은 'my_name' 으로 설정한다.
    publisher = rospy.Publisher( 변수 1 , 변수 2 , queue_size=10)
    '''
    publisher = rospy.Publisher('/start', GPS, queue_size=10)
    publisher2 = rospy.Publisher('/goal', GPS, queue_size=10)
    
    #TODO: (2) ROS 노드 이름 선언
    rospy.init_node('my_name_talker', anonymous=True)

    count = 0

    #TODO: (3) 코드 반복 시간 설정 및 반복 실행    
    rate = rospy.Rate(1) # 1 hz
    while not rospy.is_shutdown():
        #TODO: (4) 송신 될 메세지 변수 생성 및 터미널 창 출력 
        '''
        # 송신 될 메세지 변수를 만든뒤 출력 결과를 확인한다.        
        float64 latitude
float64 longitude
float64 altitude

float64 eastOffset
float64 northOffset
int16 status
#offset_eo: 302459.942000 , no : 4122635.537
 
        '''



        my_mvp = GPS()
        # 카메라로 주행
        # my_mvp.longitude = 126.88709959487771
        # my_mvp.latitude = 37.56917844718765

        my_mvp.longitude = 126.88449058905945
        my_mvp.latitude = 37.58101195252878
        # my_mvp.altitude = 0
        my_mvp.eastOffset = 313201.1956034552
        my_mvp.northOffset = 4161432.837320039
        # my_mvp.age = 27
        # my_mvp.score = 100
        # rospy.loginfo('\n my name : %s %s \n my age : %i \n SSAFY score : %i', my_name.first_name,my_name.last_name,my_name.age,my_name.score)
        # 37.577790,126.881483
        


        #TODO: (5) /my_name 메세지 Publish 
        my_mvp2 = GPS()

        # 카메라주행
        # my_mvp2.longitude = 126.88078762466041
        # my_mvp2.latitude = 37.56979409395636


        my_mvp2.longitude = 126.88680329345645
        my_mvp2.latitude = 37.58032726436007
        my_mvp2.eastOffset = 313201.1956034552
        my_mvp2.northOffset = 4161432.837320039
        publisher.publish(my_mvp)
        publisher2.publish(my_mvp2)
        
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass