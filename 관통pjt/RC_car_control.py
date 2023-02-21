from Raspi_MotorHAT import Raspi_MotorHAT, Raspi_DCMotor
from Raspi_PWM_Servo_Driver import PWM
from sense_emu import SenseHat, ACTION_RELEASED
from threading import Timer
import mysql.connector
from time import sleep
import sys
import signal
import datetime
from collections import deque

def closeDB(signal, frame):
    print("BYE")
    cur.close()
    db.close()
    timer.cancel()
    sys.exit(0)

def polling():
    global cur, db, ready
    
    cur.execute("select * from command order by time desc limit 1")
    for (id, time, cmd_string, arg_string, is_finish) in cur:
        if is_finish == 1 : break
        ready = (cmd_string, arg_string)
        cur.execute("update command set is_finish=1 where is_finish=0")

    db.commit()
     
    global timer
    timer = Timer(0.5, polling)
    timer.start()

def clear():
    global map
    global path
    global y
    global x
    y =0
    x =0
    map = [
    O,O,O,O,O,O,O,O,
    O,O,O,O,O,O,O,O,
    O,O,O,O,O,O,O,O,
    O,O,O,O,O,O,O,O,
    O,O,O,O,O,O,O,O,
    O,O,O,O,O,O,O,O,
    O,O,O,O,O,O,O,O,
    O,O,O,O,O,O,O,T,]
    path = []
    refresh()

def straight():
    pwm.setPWM(0,0,375)
    myMotor.setSpeed(100)
    myMotor.run(Raspi_MotorHAT.BACKWARD)
    sleep(0.5)
    myMotor.run(Raspi_MotorHAT.RELEASE)

def left():
    pwm.setPWM(0,0,330)
    myMotor.setSpeed(100)
    myMotor.run(Raspi_MotorHAT.BACKWARD)
    sleep(0.5)
    myMotor.run(Raspi_MotorHAT.RELEASE)

def right():
    pwm.setPWM(0,0,450)
    myMotor.setSpeed(100)
    myMotor.run(Raspi_MotorHAT.BACKWARD)
    sleep(0.5)
    myMotor.run(Raspi_MotorHAT.RELEASE)

def setMap():
    global y
    global x
    global map
    y = 0
    x= 0
    map = [
    O,O,O,O,O,O,O,O,
    O,O,O,O,O,O,O,O,
    O,O,O,O,O,O,O,O,
    O,O,O,O,O,O,O,O,
    O,O,O,O,O,O,O,O,
    O,O,O,O,O,O,O,O,
    O,O,O,O,O,O,O,O,
    O,O,O,O,O,O,O,T,]
    
    db1 = mysql.connector.connect(host='13.209.98.228', user='joy', password='1234', database='JOYDB', auth_plugin='mysql_native_password')
    cur1 = db1.cursor(buffered=True)
    cur1.execute("select * from command")
    for (id, time, cmd_string, arg_string, is_finish) in cur1:
        if(cmd_string != "start" and cmd_string != "clear"):
            ey = int(cmd_string)
            ex = int(arg_string)
            map[ey*8+ex] = X
    db1.close()
    cur1.close()
    refresh()


def start():
    global path
    global idx
    global y
    global x
    global direction
    global map
    setMap()
    search()
    refresh()
    ti =0
    direction = 0
    direct = [8,-1,-8,1]
    dy = [1,0,-1,0]
    dx = [0,-1,0,1]
    b = 0
    ppath = path
    for io in range(len(ppath)):
        a = ppath[io] - b
        b = ppath[io]
    
        for q in range(4):
            if a == direct[q]:
                ti = q
                break
        if (direction+3)%4 == ti:
            left()
        elif (direction+1)%4 == ti:
            right()
        elif direction == ti:
            straight()
        direction = ti
        move(direction)
        sleep(0.1)



def move(n):
    # down left up right
    global y
    global x
    dy = [1,0,-1,0]
    dx = [0,-1,0,1]
    ny = y+dy[n]
    nx = x+dx[n]
    if ny>7 or ny<0 or nx>7 or nx<0 or map[ny*8+nx] == X:
        ny = y
        nx = x
    y=ny
    x=nx
    search()
    refresh()
    
def refresh():
    global mode
    global path
    global idx
    sense.clear()
    sense.set_pixels(map)
    # least path
    if len(path) != 0:
        for i in range(len(path)):
            py = int(path[i]/8)
            px = path[i]%8
            sense.set_pixel(px,py,0,255,255)
    sense.set_pixel(x,y,0,255,0)
    sense.set_pixel(7,7,0,0,255)
    sleep(0.1)
            
def dfs(py,px,tpath):
    global path
    global cnt
    global used
    if (8*py+px) == 63:
        path.append([])
        path[cnt] = tpath[:]
        cnt+=1  
    dy = [0,0,1,-1]
    dx = [1,-1,0,0]
    for i in range(4):
        ny = py+dy[i]
        nx = px+dx[i]
        if ny>7 or nx>7 or ny<0 or nx<0: continue
        if used[ny*8+nx]==1 : continue
        if map[ny*8+nx] == X : continue
        used[ny*8+nx] = 1
        tpath.append(ny*8+nx)
        dfs(ny,nx,tpath)
        tpath.pop()
        used[ny*8+nx] = 0

def bfs(py,px): # BFS 선언, 입력으로 x와 y의 정보를 받음
    global used
    global path
    queue = deque() # queue 초기화
    used[py*8+px] =1
    path = []
    queue.append((py,px, path)) # 초기 위치
    dx = [-1, 1, 0, 0]
    dy = [0, 0, -1, 1]
    while queue:
        cy, cx, tpath= queue.popleft() # queue에서 꺼내기
        if 8*cy+cx == 63:
            path = tpath
            while queue: queue.pop()
            return
        for i in range(4): # 4 방향에 대해서 이동 check
            nx = cx+ dx[i] # 이동
            ny = cy+ dy[i] # 이동

            if nx < 0 or ny < 0 or nx >7 or ny > 7: # 밖으로 넘어가는 경우,
                continue # continue
            if map[ny*8+nx] == X: # 이동 할 수 없는경우
                continue # continue
            if used[ny*8+nx] == 1:
                continue
            used[ny*8+nx] = 1
            tpath.append(ny*8+nx)
            ttpath = tpath[:]
            queue.append((ny,nx,ttpath)) # 이동 된 nx, ny를 queue에 집어 넣기
            tpath.pop()

def search():
    global path
    global idx
    global cnt
    global y
    global x
    global used
    cnt = 0
    mini = 99999
    idx =0
    used = [
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0]
    path = []
    tpath = []
    used[8*y+x] = 1
    #dfs(y,x,tpath)
    bfs(y,x)
    """mini = 10000
    for i in range(len(path)):
        leng = len(path[i])
        if leng < mini:
            idx = i
            mini = leng"""
#init    
X = [0,0,0]
O = [255,255,255]
T = [0,0,255]
map = [
O,O,O,O,O,O,O,O,
O,O,O,O,O,O,O,O,
O,O,O,O,O,O,O,O,
O,O,O,O,O,O,O,O,
O,O,O,O,O,O,O,O,
O,O,O,O,O,O,O,O,
O,O,O,O,O,O,O,O,
O,O,O,O,O,O,O,T,]
used = [
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0]
x = 0
y = 0
mode =0
cnt = 0
idx = 0
direction = 0
path = []
sense = SenseHat()
sense.low_light = True
db = mysql.connector.connect(host='13.209.98.228', user='joy', password='1234', database='JOYDB', auth_plugin='mysql_native_password')
cur = db.cursor(buffered=True)
ready = None
timer = None
mh = Raspi_MotorHAT(addr=0x6f)
myMotor = mh.getMotor(2)
pwm = PWM(0x6F)
pwm.setPWMFreq(60)
setMap()
signal.signal(signal.SIGINT, closeDB)
polling()


while True:
    if ready == None : continue
    cmd, arg = ready
    ready = None
    if cmd == "start" : start()
    elif cmd == "clear" : clear()
    else:
        ey = int(cmd)
        ex = int(arg)
        map[ey*8+ex] = X
        refresh()
    if y*8+x == 63 :
        sense.show_message("win")
        setMap()
        #break;
    
print("BYE")
cur.close()
db.close()
timer.cancel()
sys.exit(0)
