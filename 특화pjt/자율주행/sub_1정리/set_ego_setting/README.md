1. roslaunch rosdridge_server rosbridge_websocker.launch
2. rosrun ssafy_1 get_traffic_status.py
3. publisher = rospy.Publisher( '/ego_setting' , MultiEgoSetting , queue_size=10)
4. publisher.publish(ego_setting_msg)