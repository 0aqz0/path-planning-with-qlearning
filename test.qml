import QtQuick 2.0

Rectangle {
    width: 500; height: 500
    color: "white"

    ListModel {
        id: appModel
        ListElement { name: "(1,1)"; colors : "white" }
        ListElement { name: "(1,2)"; colors : "white" }
        ListElement { name: "(1,3)"; colors : "white" }
        ListElement { name: "(1,4)"; colors : "white" }
        ListElement { name: "(1,5)"; colors : "white" }
        ListElement { name: "(2,1)"; colors : "white" }
        ListElement { name: "(2,2)"; colors : "white" }
        ListElement { name: "(2,3)"; colors : "white" }
        ListElement { name: "(2,4)"; colors : "white" }
        ListElement { name: "(2,5)"; colors : "white" }
        ListElement { name: "(3,1)"; colors : "white" }
        ListElement { name: "(3,2)"; colors : "white" }
        ListElement { name: "(3,3)"; colors : "white" }
        ListElement { name: "(3,4)"; colors : "white" }
        ListElement { name: "(3,5)"; colors : "white" }
        ListElement { name: "(4,1)"; colors : "white" }
        ListElement { name: "(4,2)"; colors : "white" }
        ListElement { name: "(4,3)"; colors : "white" }
        ListElement { name: "(4,4)"; colors : "white" }
        ListElement { name: "(4,5)"; colors : "white" }
        ListElement { name: "(5,1)"; colors : "white" }
        ListElement { name: "(5,2)"; colors : "white" }
        ListElement { name: "(5,3)"; colors : "white" }
        ListElement { name: "(5,4)"; colors : "white" }
        ListElement { name: "(5,5)"; colors : "white" }
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
                id: myIcon
                y: 20; anchors.horizontalCenter: parent.horizontalCenter
//                source: icon
            }
            Text {
                anchors { top: myIcon.bottom; horizontalCenter: parent.horizontalCenter }
                text: name
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log(name);
                    rect.color = "black";
                    }
            }
            Rectangle {
                id : rect
                anchors.fill: parent
                color : colors
                border.color : "grey"
            }
        }
    }
}

//import QtQuick 2.0
//
//Item {
//	width: 400
//	height: 400
//
//	// a dummy model
//	ListModel {
//		id: itemModel
//		ListElement {
//			name: "red"
//		}
//		ListElement {
//			name: "blue"
//		}
//		ListElement {
//			name: "green"
//		}
//		ListElement {
//			name: "tomato"
//		}
//	}
//
//	// our delegate
//	Component {
//		id: rectDelegate
//		Rectangle {
//			id: rect
//
//			width: 50
//			height: 50
//			color: name
//
//			MouseArea {
//				anchors.fill: parent
//				onClicked: grid.currentIndex = index
//			}
//			states: [
//				State {
//					name: "none"
//					when: (grid.currentIndex == -1)
//				},
//				State {
//					name: "selected"
//					when: rect.GridView.isCurrentItem
//					PropertyChanges {
//						target: rect;
//						width: 100;
//						height: 100
//					}
//				}
//			]
////			transitions: Transition {
////				PropertyAnimation {
////					target: rect
////					properties: "width, height"
////				}
////			}
//		}
//	}
//
//	GridView {
//		id: grid
//		x: 50
//		y: 50
//		width: 200
//		height: 200
//		model: itemModel
//		delegate: rectDelegate
//
//		// handle clicks on empty area within the grid.
//		// this adds an element below the grid items but on the grid's flickable surface
//		// (so it won't have mouse events stolen by the grid)
//		flickableChildren: MouseArea {
//			anchors.fill: parent
//			onClicked: grid.currentIndex = -1
//		}
//
//		// sets the initial index to –1, so no item is selected
//		// currentIndex: –1 // not enough, need to check later
//		Component.onCompleted: currentIndex = -1
//	}
//}