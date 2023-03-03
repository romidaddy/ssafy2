rospy.Subscriber('/image_jpeg/compressed',CompressedImage,Camera_callback)

roslaunch rosdridge_server rosbridge_websocker.launch
rosrun ssafy_1 get_camera.py