# author : 0aqz0
# date: 2018/11/1
import os
import sys
import time
import threading, multiprocessing

from PyQt5.QtCore import pyqtProperty, QObject, QUrl, QTimer, pyqtSlot
from PyQt5.QtQml import qmlRegisterType, QQmlComponent, QQmlEngine
from PyQt5.QtQuick import QQuickView
from PyQt5.QtGui import QGuiApplication

from RL_brain import QLearningTable

# def print10000():
#     for i in range(100000):
#         print(i)

class Maze(QObject):
    def __init__(self, parent=None):
        super().__init__(parent)
        # Initialise the value of the properties.
        self._robot = [1, 1]
        self._start = [1, 1]
        self._end = [9, 9]
        self._obs = []
        self._maxepisode = 100
        self._learningrate = 0.01
        self._discountfactor = 0.9
        self._egreedy = 0.9
        self.action_space = ['u', 'd', 'l', 'r']
        self.n_actions = len(self.action_space)
        self.newpathplanning = False
        self.finalpath = []

    @pyqtSlot(int, int)
    def setstart(self, x, y):
        global root
        self._start[0] = x
        self._start[1] = y
        self._robot = self._start
        # print(self._start)

    @pyqtSlot(int, int)
    def setend(self, x, y):
        global root
        self._end[0] = x
        self._end[1] = y
        # print(self._end)

    @pyqtSlot(int, int)
    def setobs(self, x, y):
        global root
        if [x,y] not in self._obs:
            self._obs.append([x,y])
        # print(self._obs)

    @pyqtSlot()
    def reset(self):
        global root
        self._robot = [1, 1]
        self._start = [1, 1]
        self._end = [9, 9]
        self._obs = []
        self.finalpath = []
        root.resetqml()

    @pyqtSlot(bool)
    def setnewpathplanning(self, setter):
        self.newpathplanning = setter
        # print(self.newpathplanning)

    @pyqtSlot(result = str)
    def robotstring(self):
        return str("(" + str(int(self._robot[0])) + "," + str(int(self._robot[1])) + ")")

    @pyqtSlot(result = str)
    def endstring(self):
        return str("(" + str(int(self._end[0])) + "," + str(int(self._end[1])) + ")")

    @pyqtSlot(result = 'QStringList')
    def obsstring(self):
        return [str("(" + str(int(obs[0])) + "," + str(int(obs[1])) + ")") for obs in self._obs]

    @pyqtSlot(result = int)
    def obsnum(self):
        return len(self._obs)

    @pyqtSlot()
    def quit(self):
        sys.exit(0)

    @pyqtSlot(int)
    def maxepisode(self, maxepisode):
        self._maxepisode = maxepisode
        # print(self._maxepisode)

    @pyqtSlot(float)
    def learningrate(self, learningrate):
        self._learningrate = learningrate
        # print(self._learningrate)

    @pyqtSlot(float)
    def discountfactor(self, discountfactor):
        self._discountfactor = discountfactor
        # print(self._discountfactor)

    @pyqtSlot(float)
    def egreedy(self, egreedy):
        self._egreedy = egreedy
        # print(self._egreedy)

    @pyqtSlot()
    def printinfo(self):
        print("updated")

    @pyqtSlot(result = 'QStringList')
    def finalpathlist(self):
        return self.finalpath

    @pyqtSlot(result = int)
    def finalpathlen(self):
        return len(self.finalpath)

    # observation after action
    def step(self, action):
        global root
        # next state
        next_s = self._robot
        if action == 0:
            if next_s[1] > 1:
                next_s[1] -= 1
        elif action == 1:
            if next_s[1] < 9:
                next_s[1] += 1
        elif action == 2:
            if next_s[0] > 1:
                next_s[0] -= 1
        elif action == 3:
            if next_s[0] < 9:
                next_s[0] += 1

        # move to next state
        self._robot = next_s

        # reward
        if next_s == self._end:
            reward = 1
            done = True
            next_s = 'terminal'
            # print("win")
            return next_s, reward, done
        # punish
        for obs in self._obs:
            if next_s == obs:
                reward = -1
                done = True
                next_s = 'terminal'
                # print("fail")
                return next_s, reward, done
        # nothing
        reward = 0
        done = False
        return str(next_s), reward, done

    @pyqtSlot()
    def pathplanning(self):
        global root
        global view
        RL = QLearningTable(actions=list(range(self.n_actions)), learning_rate=self._learningrate,
                            reward_decay=self._discountfactor, e_greedy=self._egreedy)
        for episode in range(self._maxepisode):
            # reset
            self._robot = self._start.copy()
            # initialize observation
            observation = str(self._robot)

            while True:
                # record the final path
                if(episode == self._maxepisode - 1):
                    self.finalpath.append(str("(" + str(int(self._robot[0])) + "," + str(int(self._robot[1])) + ")"))


                # choose action
                action = RL.choose_action(observation)
                # get new observation
                next_observation, reward, done = self.step(action)
                # learn from this observation
                RL.learn(observation,action,reward,next_observation)
                # update observation
                observation = next_observation

                # print qtable
                # print(RL.q_table)
                # print(self._robot)
                # thread = threading.Thread(target=root.updateqml())
                # thread.start()
                # thread.join()
                # timer = QTimer()
                # timer.start(2000)
                # root = view.rootObject()
                # timer.timeout.connect(root.updateqml)
                # root.updateqml()
                # view.show()
                if done:
                    break

        # print(RL.q_table)
        # self.finalpath.append("(9,9)")
        # print(self.finalpath)
        root.finalroot()


if __name__ == '__main__':
    # create application instance
    app = QGuiApplication(sys.argv)
    view = QQuickView()

    # register the python type
    # qmlRegisterType(Maze, 'Maze', 1, 0, 'Maze')

    qmlFile = os.path.join(os.path.dirname(__file__), 'view.qml')

    maze = Maze()
    context = view.rootContext()
    context.setContextProperty("maze", maze)

    view.setSource(QUrl.fromLocalFile(os.path.abspath(qmlFile)))
    if view.status() == QQuickView.Error:
        sys.exit(-1)
    view.show()

    root = view.rootObject()
    # root.updateqml()
    # def loop():
    #     while 1:
    #         root.updateqml()
    #         time.sleep(0.5)
    # loop()
    # t = threading.Thread(target=loop)
    # t2 = threading.Thread(target=view.show)
    # t.start()
    # t2.start()
    # t.join()
    # t2.join()
    # timer = QTimer()
    # timer.start(2000)
    # root = view.rootObject()
    # timer.timeout.connect(root.updateqml)

    # while True:
        # root.updateqml()
        # time.sleep(1)
        # if(maze.newpathplanning):
        #     pass



    res = app.exec_()

    # delete the view
    del view
    sys.exit(res)
