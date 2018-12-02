import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

Item {
    id: base
    signal newRoom

    width: mainWindow.width
    height: rectangle.height

    HamburgerMenu {
        id: drawer
    }

    Rectangle {
        id: rectangle

        width: mainWindow.width
        height: hamburgerButton.height + hamburgerButton.anchors.topMargin
                + hamburgerButton.anchors.bottomMargin

        color: "white"


        /*
        RoundButton{
            id: closeButton

            text: "<-"
            font.pixelSize: 22

            anchors.topMargin: 5
            anchors.bottomMargin: 5
            anchors.leftMargin: 5
            anchors.top: parent.top
            anchors.left: parent.left

            onClicked: Qt.quit();
        }*/
        RoundButton  {
            id: hamburgerButton
            text: "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                drawer.open()
            }
            background: Rectangle {
                color: "transparent"
            }
            padding: 10
        }

        Text {
            anchors.centerIn: parent
            text: qsTr("Welcome to your House")
        }

//        RoundButton {
//            id: newRoomButton

//            text: "+"
//            font.pixelSize: 22

////            anchors.topMargin: 5
////            anchors.bottomMargin: 5
////            anchors.rightMargin: 5
////            anchors.top: parent.top
////            anchors.right: parent.right
//            onClicked: base.newRoom()
//        }

    }
}
