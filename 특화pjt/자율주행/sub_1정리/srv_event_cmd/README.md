
ros_srv = rospy.ServiceProxy( '/Service_MoraiEventCmd' , MoraiEventCmdSrv)
result = ros_srv(set_Event_control )
roslaunch rosdridge_server rosbridge_websocker.launch
rosrun ssafy_1 srv_event_cmd.py