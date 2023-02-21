from PySide6.QtWidgets import *
from PySide6.QtCore import *
from mainUI import Ui_MainWindow
import mysql.connector
import sys

class MyApp(QMainWindow, Ui_MainWindow):
    def __init__(self):
        super().__init__()
        self.ui = Ui_MainWindow()
        self.ui.setupUi(self)
        self.init()

    def init(self):
        self.db = mysql.connector.connect(host='13.209.98.228', user='joy', password='1234', database='JOYDB', auth_plugin='mysql_native_password')
        self.cur = self.db.cursor()
        """
        self.timer = QTimer()
        self.timer.setInterval(500)  # 500ms
        self.timer.timeout.connect(self.pollingQuery)
        """


    def start(self):
        self.insertCommand("start", "0")
        #self.timer.start()
    """
    def pollingQuery(self):
        a =1
        #self.cur.execute("select * from command order by time desc limit 15")
        #self.ui.logText.clear()
        #for (id, time, cmd_string, arg_string, is_finish) in self.cur:
            #str = "%d | %s | %6s | %6s | %4d" % (id, time.strftime("%Y%m%d %H:%M:%S"), cmd_string, arg_string, is_finish)
            #self.ui.logText.appendPlainText(str)
    """

    def map(self):
        query1 = "drop table if exists `command`;"
        query2 = ("CREATE TABLE `command` ("
                  "`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,"
                  "`time` DATETIME NULL,"
                  "`cmd_string` VARCHAR(50) NULL DEFAULT NULL,"
                  "`arg_string` VARCHAR(50) NULL DEFAULT NULL,"
                  "`is_finish` INT NULL);")
        self.cur.execute(query1)
        self.cur.execute(query2)
        self.db.commit()
        self.cur.close()
        self.db.close()
        self.db = mysql.connector.connect(host='13.209.98.228', user='joy', password='1234', database='JOYDB',
                                          auth_plugin='mysql_native_password')
        self.cur = self.db.cursor()
        self.insertCommand("clear", "0")
        QCoreApplication.quit()
        status = QProcess.startDetached(sys.executable, sys.argv)
        print (status)



    def closeEvent(self, event):
        self.cur.close()
        self.db.close()


    def insertCommand(self, cmd_string, arg_string):
        time = QDateTime().currentDateTime().toPython()
        is_finish = 0
        query = "insert into command(time, cmd_string, arg_string, is_finish) values (%s, %s, %s, %s)"
        value = (time, cmd_string, arg_string, is_finish)
        self.cur.execute(query, value)
        self.db.commit()

    def send00(self):
        self.insertCommand("0", "0")
    def send01(self):
        self.insertCommand("0", "1")
    def send02(self):
        self.insertCommand("0", "2")
    def send03(self):
        self.insertCommand("0", "3")
    def send04(self):
        self.insertCommand("0", "4")
    def send05(self):
        self.insertCommand("0", "5")
    def send06(self):
        self.insertCommand("0", "6")
    def send07(self):
        self.insertCommand("0", "7")
    def send10(self):
        self.insertCommand("1", "0")
    def send11(self):
        self.insertCommand("1", "1")
    def send12(self):
        self.insertCommand("1", "2")
    def send13(self):
        self.insertCommand("1", "3")
    def send14(self):
        self.insertCommand("1", "4")
    def send15(self):
        self.insertCommand("1", "5")
    def send16(self):
        self.insertCommand("1", "6")
    def send17(self):
        self.insertCommand("1", "7")
    def send20(self):
        self.insertCommand("2", "0")
    def send21(self):
        self.insertCommand("2", "1")
    def send22(self):
        self.insertCommand("2", "2")
    def send23(self):
        self.insertCommand("2", "3")
    def send24(self):
        self.insertCommand("2", "4")
    def send25(self):
        self.insertCommand("2", "5")
    def send26(self):
        self.insertCommand("2", "6")
    def send27(self):
        self.insertCommand("2", "7")
    def send30(self):
        self.insertCommand("3", "0")
    def send31(self):
        self.insertCommand("3", "1")
    def send32(self):
        self.insertCommand("3", "2")
    def send33(self):
        self.insertCommand("3", "3")
    def send34(self):
        self.insertCommand("3", "4")
    def send35(self):
        self.insertCommand("3", "5")
    def send36(self):
        self.insertCommand("3", "6")
    def send37(self):
        self.insertCommand("3", "7")
    def send40(self):
        self.insertCommand("4", "0")
    def send41(self):
        self.insertCommand("4", "1")
    def send42(self):
        self.insertCommand("4", "2")
    def send43(self):
        self.insertCommand("4", "3")
    def send44(self):
        self.insertCommand("4", "4")
    def send45(self):
        self.insertCommand("4", "5")
    def send46(self):
        self.insertCommand("4", "6")
    def send47(self):
        self.insertCommand("4", "7")
    def send50(self):
        self.insertCommand("5", "0")
    def send51(self):
        self.insertCommand("5", "1")
    def send52(self):
        self.insertCommand("5", "2")
    def send53(self):
        self.insertCommand("5", "3")
    def send54(self):
        self.insertCommand("5", "4")
    def send55(self):
        self.insertCommand("5", "5")
    def send56(self):
        self.insertCommand("5", "6")
    def send57(self):
        self.insertCommand("5", "7")
    def send60(self):
        self.insertCommand("6", "0")
    def send61(self):
        self.insertCommand("6", "1")
    def send62(self):
        self.insertCommand("6", "2")
    def send63(self):
        self.insertCommand("6", "3")
    def send64(self):
        self.insertCommand("6", "4")
    def send65(self):
        self.insertCommand("6", "5")
    def send66(self):
        self.insertCommand("6", "6")
    def send67(self):
        self.insertCommand("6", "7")
    def send70(self):
        self.insertCommand("7", "0")
    def send71(self):
        self.insertCommand("7", "1")
    def send72(self):
        self.insertCommand("7", "2")
    def send73(self):
        self.insertCommand("7", "3")
    def send74(self):
        self.insertCommand("7", "4")
    def send75(self):
        self.insertCommand("7", "5")
    def send76(self):
        self.insertCommand("7", "6")
    def send77(self):
        self.insertCommand("7", "7")


app = QApplication()
win = MyApp()
win.show()
app.exec()