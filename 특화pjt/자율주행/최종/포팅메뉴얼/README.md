# 포팅 매뉴얼

# 1. 개발 환경

**형상 관리**

- Gitlab

**이슈 관리**

- Jira

**IDE**

- Visual Studio Code

**기타 편의 툴**

- MobaXterm v22.3

**Communication**

- Mattermost
- Webex
- Notion

**OS**

- Ubuntu 18.04
- Window 10

**DataBase**

- Google Firebase FireStore

**Server**

- AWS EC2
    - Ubuntu 20.04 LTS
    - Docker 23.00
    - Jenkins 2.387.1

**Front-End**

- React v18.2.0
- Nginx Stable-alphin

**Back-End**

- Node.js 16.18.0
- ROS melodic
- Python 2.7

Simulator

- MORAI SIM 22R4.1

# 2. 가상환경 세팅

1. Oracle VM VirtualBox 설치
    - [https://www.virtualbox.org/](https://www.virtualbox.org/)
2. Ubuntu 18.04 다운로드
    - [https://releases.ubuntu.com/18.04/](https://releases.ubuntu.com/18.04/)
3. 메모리 4096MB이상, 하드디스크 30GB이상 권장
4. VirtualBox의 네트워크 설정에서 어댑터2를 호스트전용어댑터로 설정
5. ubuntu를 실행시킨 후 2번째 Ethernet의 IPv4를 manual로 설정한 후 Address에는 ifconfig에 나오는 ip를 netmask 에는 255.255.255.0. Gateway에는 192.168.56.1을 적어준다.
6. Windows 기능 켜기/끄기에서 Hyper-V가 켜져있는지 확인 후 켜져있다면 끈다.

# 3. 백엔드 & 프런트엔드 실행

gitlab master branch를 clone해오면 됩니다!

node.js version : 16.18.0

python version : 2.7

## 백엔드

1. VirtualBox의 Ubuntu 터미널에서 차례대로 실행

```bash
$ sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
$ sudo apt install curl
$ curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
$ sudo apt update
$ sudo apt install ros-melodic-desktop-full
$ sudo apt-get install python-rosdep
$ sudo rosdep init
$ rosdep update
$ echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
$ source ~/.bashrc
$ sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential
$ sudo apt-get install python-pip
$ sudo apt-get install net-tools
$ sudo apt-get install ros-melodic-rosbridge-server
$ sudo apt-get install ros-melodic-velodyne
$ sudo apt install terminator
$ pip install pyproj
$ pip install scikit-learn
$ pip install pyopenssl --upgrade
$ pip install firebase-admin --upgrade
```

1. GitLab에서 코드를 Clone 해온 후 아래 명령어들을 실행합니다.

```bash
$ source '클론해온 위치'/ssafy_ad/devel/setup.bash
$ cd '클론해온 위치'/ssafy_ad
$ catkin_make
$ rospack profile
$ roslaunch rosbridge_server rosbridge_websocket.launch
$ roslaunch ssafyrari ssafyrari.launch
```

## 프런트

/S08P22C108/FrontEnd/ssafyrari에서

npm install → npm start 하면 실행됩니다!

※ 412px * 869px 뷰포트에 최적화 되어있음

### MORAI 설정

- Cmd Control
    - UDP → ROS로 설정 후 각 컴퓨터의 IPv4 주소를 Bridge IP에 작성
- Publisher, Subscriber, Service
    - UDP → ROS로 설정 후 각 컴퓨터의 IPv4 주소를 Bridge IP에 작성
    - 모든 기능들을 켜준다.
- Sensor 들
    - UDP → ROS로 설정 후 각 컴퓨터의 IPv4 주소를 Bridge IP에 작성

# 4. DataBase / Authentication

- DB
    - FireBase FireStore DB사용
- Authentication
    - FireBase Authentication - Google Login 사용

# 5. test용 ID&PW

### WEB

- Google Login

### MORAI

- ID : ssafy_ad_006
- PW : ssafy_4990