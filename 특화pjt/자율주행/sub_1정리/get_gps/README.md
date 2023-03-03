 os.system('clear')
    print("\n ------------------------------------ \n")
    rospy.loginfo("latitude {}".format( data.latitude ))
    rospy.loginfo("longitude {}".format( data.longitude ))
    rospy.loginfo("eastOffset {}".format( data.eastOffset ))
    rospy.loginfo("northOffset {}".format( data.northOffset ))
rospy.Subscriber('/gps',GPSMessage,gps_callback)

roslaunch rosdridge_server rosbridge_websocker.launch
rosrun ssafy_1 get_gps.py