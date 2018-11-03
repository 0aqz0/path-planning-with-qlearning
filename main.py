# author : 0aqz0
# date: 2018/11/1
import os
import sys

from PyQt5.QtCore import pyqtProperty, QObject, QUrl
from PyQt5.QtQml import qmlRegisterType, QQmlComponent, QQmlEngine
from PyQt5.QtQuick import QQuickView
from PyQt5.QtGui import QGuiApplication

from RL_brain import QLearningTable

class Maze(QObject):
    def __init__(self, parent=None):
        super().__init__(parent)

        # Initialise the value of the properties.
        self._name = 'aqz'
        self._start = [1, 1]
        self._end = [9, 9]
        self._obs = []
        self._maxepisode = 100
        self._learningrate = 0.01
        self._discountfactor = 0.9
        self._egreedy = 0.9

    # Define the getter of the 'name' property.  The C++ type of the
    # property is QString which Python will convert to and from a string.
    @pyqtProperty('QString')
    def name(self):
        return self._name

    # Define the setter of the 'name' property.
    @name.setter
    def name(self, name):
        self._name = name

    @pyqtProperty(list)
    def start(self):
        return self._start

    @start.setter
    def start(self, start):
        self._start = start
        print(self._start)

    @pyqtProperty(str)
    def stringstart(self):
        return str("(" + str(int(self._start[0])) + "," + str(int(self._start[1])) + ")")

    @pyqtProperty(list)
    def end(self):
        return self._end

    @end.setter
    def end(self, end):
        self._end = end
        # print(self._end)

    @pyqtProperty(str)
    def stringend(self):
        return str("(" + str(int(self._end[0])) + "," + str(int(self._end[1])) + ")")

    @pyqtProperty(list)
    def obs(self):
        return self._obs

    @obs.setter
    def obs(self, obs):
        if obs not in self._obs:
            self._obs.append(obs)
        print(self._obs)

    @pyqtProperty('QStringList')
    def stringobs(self):
        return [str("(" + str(int(obs[0])) + "," + str(int(obs[1])) + ")") for obs in self._obs]

    @pyqtProperty(bool)
    def resetobs(self):
        self._obs = []
        print("reset success")
        return True

    @pyqtProperty(bool)
    def quit(self):
        sys.exit(0)

    @pyqtProperty(int)
    def maxepisode(self):
        return self._maxepisode

    @maxepisode.setter
    def maxepisode(self, maxepisode):
        self._maxepisode = maxepisode
        # print(self._maxepisode)

    @pyqtProperty(float)
    def learningrate(self):
        return self._learningrate

    @learningrate.setter
    def learningrate(self, learningrate):
        self._learningrate = learningrate
        # print(self._learningrate)

    @pyqtProperty(float)
    def discountfactor(self):
        return self._discountfactor

    @discountfactor.setter
    def discountfactor(self, discountfactor):
        self._discountfactor = discountfactor
        # print(self._discountfactor)

    @pyqtProperty(float)
    def egreedy(self):
        return self._egreedy

    @egreedy.setter
    def egreedy(self, egreedy):
        self._egreedy = egreedy
        # print(self._egreedy)


    # 走一步（机器人实施 action）
    def step(self, action):
        pass


if __name__ == '__main__':
    # create application instance
    app = QGuiApplication(sys.argv)
    view = QQuickView()

    # register the python type
    qmlRegisterType(Maze, 'Maze', 1, 0, 'Maze')

    qmlFile = os.path.join(os.path.dirname(__file__), 'view.qml')
    view.setSource(QUrl.fromLocalFile(os.path.abspath(qmlFile)))
    if view.status() == QQuickView.Error:
        sys.exit(-1)
    view.show()
    res = app.exec_()

    # delete the view
    del view
    sys.exit(res)
