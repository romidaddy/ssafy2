1. set_ctrl_cmd.py 
# longlCmdType 은 차량에 제어 모드를 선택하는 값이다 (1: Throttle control, 2: Velocity control, 3: Acceleration control)
# velocity, acceleration 은 각각 longlCmdType 값이 2,3 일때만 동작하며 차량의 속도 또는 가속도를 제어 입력 값으로 넣는다.
ctrl_cmd = CtrlCmd()
    ctrl_cmd.longlCmdType = 1
    ctrl_cmd.accel = 1
    ctrl_cmd.brake = 0.1
    ctrl_cmd.steering = 0.1
    # ctrl_cmd.velocity = 
    # ctrl_cmd.acceleration = 

    publisher.publish(ctrl_cmd)
2. roslaunch rosdridge_server rosbridge_websocker.launch
3. rosrun ssafy_1 set_ctrl_cmd.py