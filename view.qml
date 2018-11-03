// author : 0aqz0
// date: 2018/11/1
import Maze 1.0 as Maze
import QtQuick 2.6
import QtQuick.Controls 1.1
//import QtQuick.Controls.Styles 1.4

Rectangle{
    id : root

    width : 1400; height: 930

    SystemPalette { id: activePalette }

    Maze.Maze{
        id : maze
    }

    property int mode : 0

//  1-----set the start
//  2-----set the end
//  3-----set obstacle
//  4-----set new path-planning
//  5-----reset
//  6-----quit

//    Timer{
//        id:globaltimer;
//        interval:15;//15ms启动一次
//        running:true;
//        repeat:true;
//        onTriggered: {
//            startID = maze.stringstart
//        }
//    }
    Rectangle {
        id : map
        width: 900; height: 900
        color: "white"

        ListModel {
            id: appModel
            ListElement { name: "(1,1)"; colors : "white"; ix : 1; iy : 1 }
            ListElement { name: "(1,2)"; colors : "white"; ix : 1; iy : 2 }
            ListElement { name: "(1,3)"; colors : "white"; ix : 1; iy : 3 }
            ListElement { name: "(1,4)"; colors : "white"; ix : 1; iy : 4 }
            ListElement { name: "(1,5)"; colors : "white"; ix : 1; iy : 5 }
            ListElement { name: "(1,6)"; colors : "white"; ix : 1; iy : 6 }
            ListElement { name: "(1,7)"; colors : "white"; ix : 1; iy : 7 }
            ListElement { name: "(1,8)"; colors : "white"; ix : 1; iy : 8 }
            ListElement { name: "(1,9)"; colors : "white"; ix : 1; iy : 9 }
           
            ListElement { name: "(2,1)"; colors : "white"; ix : 2; iy : 1 }
            ListElement { name: "(2,2)"; colors : "white"; ix : 2; iy : 2 }
            ListElement { name: "(2,3)"; colors : "white"; ix : 2; iy : 3 }
            ListElement { name: "(2,4)"; colors : "white"; ix : 2; iy : 4 }
            ListElement { name: "(2,5)"; colors : "white"; ix : 2; iy : 5 }
            ListElement { name: "(2,6)"; colors : "white"; ix : 2; iy : 6 }
            ListElement { name: "(2,7)"; colors : "white"; ix : 2; iy : 7 }
            ListElement { name: "(2,8)"; colors : "white"; ix : 2; iy : 8 }
            ListElement { name: "(2,9)"; colors : "white"; ix : 2; iy : 9 }
            
            ListElement { name: "(3,1)"; colors : "white"; ix : 3; iy : 1 }
            ListElement { name: "(3,2)"; colors : "white"; ix : 3; iy : 2 }
            ListElement { name: "(3,3)"; colors : "white"; ix : 3; iy : 3 }
            ListElement { name: "(3,4)"; colors : "white"; ix : 3; iy : 4 }
            ListElement { name: "(3,5)"; colors : "white"; ix : 3; iy : 5 }
            ListElement { name: "(3,6)"; colors : "white"; ix : 3; iy : 6 }
            ListElement { name: "(3,7)"; colors : "white"; ix : 3; iy : 7 }
            ListElement { name: "(3,8)"; colors : "white"; ix : 3; iy : 8 }
            ListElement { name: "(3,9)"; colors : "white"; ix : 3; iy : 9 }
            
            ListElement { name: "(4,1)"; colors : "white"; ix : 4; iy : 1 }
            ListElement { name: "(4,2)"; colors : "white"; ix : 4; iy : 2 }
            ListElement { name: "(4,3)"; colors : "white"; ix : 4; iy : 3 }
            ListElement { name: "(4,4)"; colors : "white"; ix : 4; iy : 4 }
            ListElement { name: "(4,5)"; colors : "white"; ix : 4; iy : 5 }
            ListElement { name: "(4,6)"; colors : "white"; ix : 4; iy : 6 }
            ListElement { name: "(4,7)"; colors : "white"; ix : 4; iy : 7 }
            ListElement { name: "(4,8)"; colors : "white"; ix : 4; iy : 8 }
            ListElement { name: "(4,9)"; colors : "white"; ix : 4; iy : 9 }
            
            ListElement { name: "(5,1)"; colors : "white"; ix : 5; iy : 1 }
            ListElement { name: "(5,2)"; colors : "white"; ix : 5; iy : 2 }
            ListElement { name: "(5,3)"; colors : "white"; ix : 5; iy : 3 }
            ListElement { name: "(5,4)"; colors : "white"; ix : 5; iy : 4 }
            ListElement { name: "(5,5)"; colors : "white"; ix : 5; iy : 5 }
            ListElement { name: "(5,6)"; colors : "white"; ix : 5; iy : 6 }
            ListElement { name: "(5,7)"; colors : "white"; ix : 5; iy : 7 }
            ListElement { name: "(5,8)"; colors : "white"; ix : 5; iy : 8 }
            ListElement { name: "(5,9)"; colors : "white"; ix : 5; iy : 9 }
            
            ListElement { name: "(6,1)"; colors : "white"; ix : 6; iy : 1 }
            ListElement { name: "(6,2)"; colors : "white"; ix : 6; iy : 2 }
            ListElement { name: "(6,3)"; colors : "white"; ix : 6; iy : 3 }
            ListElement { name: "(6,4)"; colors : "white"; ix : 6; iy : 4 }
            ListElement { name: "(6,5)"; colors : "white"; ix : 6; iy : 5 }
            ListElement { name: "(6,6)"; colors : "white"; ix : 6; iy : 6 }
            ListElement { name: "(6,7)"; colors : "white"; ix : 6; iy : 7 }
            ListElement { name: "(6,8)"; colors : "white"; ix : 6; iy : 8 }
            ListElement { name: "(6,9)"; colors : "white"; ix : 6; iy : 9 }
            
            ListElement { name: "(7,1)"; colors : "white"; ix : 7; iy : 1 }
            ListElement { name: "(7,2)"; colors : "white"; ix : 7; iy : 2 }
            ListElement { name: "(7,3)"; colors : "white"; ix : 7; iy : 3 }
            ListElement { name: "(7,4)"; colors : "white"; ix : 7; iy : 4 }
            ListElement { name: "(7,5)"; colors : "white"; ix : 7; iy : 5 }
            ListElement { name: "(7,6)"; colors : "white"; ix : 7; iy : 6 }
            ListElement { name: "(7,7)"; colors : "white"; ix : 7; iy : 7 }
            ListElement { name: "(7,8)"; colors : "white"; ix : 7; iy : 8 }
            ListElement { name: "(7,9)"; colors : "white"; ix : 7; iy : 9 }

            ListElement { name: "(8,1)"; colors : "white"; ix : 8; iy : 1 }
            ListElement { name: "(8,2)"; colors : "white"; ix : 8; iy : 2 }
            ListElement { name: "(8,3)"; colors : "white"; ix : 8; iy : 3 }
            ListElement { name: "(8,4)"; colors : "white"; ix : 8; iy : 4 }
            ListElement { name: "(8,5)"; colors : "white"; ix : 8; iy : 5 }
            ListElement { name: "(8,6)"; colors : "white"; ix : 8; iy : 6 }
            ListElement { name: "(8,7)"; colors : "white"; ix : 8; iy : 7 }
            ListElement { name: "(8,8)"; colors : "white"; ix : 8; iy : 8 }
            ListElement { name: "(8,9)"; colors : "white"; ix : 8; iy : 9 }
            
            ListElement { name: "(9,1)"; colors : "white"; ix : 9; iy : 1 }
            ListElement { name: "(9,2)"; colors : "white"; ix : 9; iy : 2 }
            ListElement { name: "(9,3)"; colors : "white"; ix : 9; iy : 3 }
            ListElement { name: "(9,4)"; colors : "white"; ix : 9; iy : 4 }
            ListElement { name: "(9,5)"; colors : "white"; ix : 9; iy : 5 }
            ListElement { name: "(9,6)"; colors : "white"; ix : 9; iy : 6 }
            ListElement { name: "(9,7)"; colors : "white"; ix : 9; iy : 7 }
            ListElement { name: "(9,8)"; colors : "white"; ix : 9; iy : 8 }
            ListElement { name: "(9,9)"; colors : "white"; ix : 9; iy : 9 }
        }
        GridView {
            anchors.fill: parent
            cellWidth: 100; cellHeight: 100
            focus: true
            model: appModel

            highlight: Rectangle { width: 100; height: 100; color: "lightsteelblue" }

            delegate: Item {
                width: 100; height: 100

                Image {
                    width: 100; height: 100
                    source: "image/end"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
//                        console.log(ix)
//                        console.log(iy)
//                        console.log(name)
                        if (root.mode == 1){
                            maze.start = [ix,iy]
//                            console.log("set the start position to " + maze.stringstart)
                            root.mode = 0;
                        }
                        else if (root.mode == 2){
                            maze.end = [ix,iy]
//                            console.log("set the end position to " + maze.stringend)
                            root.mode = 0
                        }
                        else if (root.mode == 3){
                            maze.obs = [ix, iy]
//                            console.log("set the obstacle position to " + maze.stringobs)
//                            root.mode = 0
                        }
                        }
                }
                Rectangle {
                    id : rect
                    anchors.fill: parent
                    color : colors
                    border.color : "grey"
                }
                Timer{
                    interval:5;
                    running:true;
                    repeat:true;
                    property string startID : ""
                    property string endID : ""
                    property var obsID
                    onTriggered: {
                        startID = maze.stringstart
                        endID = maze.stringend
                        obsID = maze.stringobs
                        if (startID == name){
                            rect.color = "red"
                        }
                        else if (endID == name){
                            rect.color = "green"
                        }
                        else{
                            rect.color = "white"
                        }
                        for (var i = 0; i < obsID.length; i++){
                            if (obsID[i] == name)
                                rect.color = "black"
                        }
                    }
                }
            }
        }
    }

    Rectangle{
        id : infoBar
        width : parent.width; height : 30
        color : activePalette.window
        anchors.bottom : root.bottom
        Text {
            id : episodeText
            anchors { right : parent.right; verticalCenter : parent.verticalCenter }
            color : activePalette.buttonText
            text : "Episodes: ?"
        }
    }
    GroupBox{
        id : toolBar
        width : 500; height : 500
        anchors { right : root.right; top : root.top }
        title : "settings"

        Grid{
            height: 200
            id : settingListView;
            verticalItemAlignment: Grid.AlignVCenter;
            horizontalItemAlignment: Grid.AlignLeft;
            anchors.horizontalCenter: parent.horizontalCenter;
            columnSpacing: 5;
            rowSpacing: 30;
            columns:2;
            rows:3;
            Button {
                id : newButton
                width : 230
                text : "New Path-Planning"
                onClicked : {
                    root.mode = 4
                    console.log(root.mode)
                }
            }
            Button {
                id : setStartButton
                width : 230
                text : "Set Startpoint"
                onClicked : {
                    root.mode = 1
                    console.log(root.mode)
                }
            }
            Button {
                id : setObsButton
                width : 230
                text : "Set Obstacles"
                onClicked : {
                    root.mode = 3
                    console.log(root.mode)
                }
            }
            Button {
                id : setEndButton
                width : 230
                text : "Set Endpoint"
                onClicked : {
                    root.mode = 2
                    console.log(root.mode)
                }
            }
            Button {
                id : resetButton
                width : 230
                text : "Reset All"
                onClicked : {
                    maze.start = [1,1]
                    maze.end = [9,9]
                    maze.resetobs
                }
            }
            Button {
                id : quitButton
                width : 230
                text : "Quit"
                onClicked : {
//                    root.mode = 6
//                    console.log(root.mode)
                    maze.quit()
                }
            }
        }
        Grid{
//            height:300;
            id : paramListView;
            anchors {top: settingListView.bottom}
            verticalItemAlignment: Grid.AlignVCenter;
            horizontalItemAlignment: Grid.AlignLeft;
            anchors.horizontalCenter: parent.horizontalCenter;
            columnSpacing: 5;
            rowSpacing: 30;
            columns:3;
            rows:5;

            Text{
                text : "Max Episode: "
            }
            Slider {
                id : episode
                maximumValue: 100
                stepSize: 1
                value : 100
                onValueChanged: {
                    maze.maxepisode = value.toFixed(0)
                }
            }
            Text{
                text : episode.value.toFixed(0)
            }

            Text{
                text : "Learning rate: "
            }
            Slider {
                id : learningrate
                maximumValue: 1
                stepSize: 0.01
                value : 0.01
                onValueChanged: {
                    maze.learningrate = value.toFixed(2)
                }
            }
            Text{
                text : learningrate.value.toFixed(2)
            }

            Text{
                text : "Discount factor: "
            }
            Slider {
                id : discountfactor
                maximumValue: 1
                stepSize: 0.01
                value : 0.9
                onValueChanged: {
                    maze.discountfactor = value.toFixed(2)
                }
            }
            Text{
                text : discountfactor.value.toFixed(2)
            }

            Text{
                text : "E_greedy: "
            }
            Slider {
                id : egreedy
                maximumValue: 1
                stepSize: 0.01
                value : 0.9
                onValueChanged: {
                    maze.egreedy = value.toFixed(2)
                }
            }
            Text{
                text : egreedy.value.toFixed(2)
            }
        }
    }
//    Rectangle{
//        id : toolBar
//        width : parent.width; height : 30
//        color : activePalette.window
//        anchors.bottom : root.bottom
//
//        Button {
//            id : newButton
//            anchors { left : parent.left; verticalCenter: parent.verticalCenter }
//            text : "New Path-Planning"
//            onClicked : console.log("This doesn't do anything yet...")
//        }
//        Rectangle{
//            id : button2
//            width : 100; height : 30
//            anchors.bottom : toolBar.bottom
//            Button {
//                anchors { left : parent.right; verticalCenter: parent.verticalCenter; }
//                text : "Set obstacles"
//                onClicked : {
//                    console.log("emmmm")
//                }
//            }
//        }

//        gradient : Gradient {
//            GradientStop{
//                position : 0.0
//                color: {
//                    if (mouseArea.pressed)
//                        return activePalette.dark
//                    else
//                        return activePalette.light
//                }
//            }
//            GradientStop { position : 1.0; color: activePalette.button }
//        }
//        Text {
//            id : episode
//            anchors { right : parent.right; verticalCenter : parent.verticalCenter }
//            color : activePalette.buttonText
//            text : "Episodes: ?"
//        }
//    }
}
