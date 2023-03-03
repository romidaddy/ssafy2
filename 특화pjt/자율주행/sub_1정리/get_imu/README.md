rospy.loginfo('------------------ IMU Sensor Status ------------------')
    rospy.loginfo("orientation:")
    rospy.loginfo("x : {} y : {} z : {} w : {}".format( data.orientation.x , data.orientation.y , data.orientation.z , data.orientation.w ))
    rospy.loginfo("angular_velocity:")
    rospy.loginfo("x : {} y : {} z : {}".format( data.angular_velocity.x , data.angular_velocity.y , data.angular_velocity.z ))
    rospy.loginfo("linear_acceleration:")
    rospy.loginfo("x : {} y : {} z : {}".format( data.linear_acceleration.x , data.linear_acceleration.y , data.linear_acceleration.z ))
rospy.Subscriber('/imu',Imu,imu_callback)

roslaunch rosdridge_server rosbridge_websocker.launch
rosrun ssafy_1 get_imu.py