import QtQuick 2.0
import QtQuick.Controls 2.4

import RoomClass 1.0
import LightClass 1.0

Item {
    id: base
    signal back();
    signal lightSelected(LightClass light);

    property RoomClass room;

    LightList {
        id: drawer
        room: base.room

        onSelectLight: {
            base.lightSelected(light)
        }
    }

    width: mainWindow.width
    height: rectangle.height
    Rectangle{
        id: rectangle

        width: mainWindow.width
        height: hamburgerButton.height + hamburgerButton.anchors.topMargin + hamburgerButton.anchors.bottomMargin

        color: "white"

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
            anchors.topMargin: 5
            anchors.bottomMargin: 5
            anchors.rightMargin: 5
            anchors.top: parent.top
            anchors.right: parent.right
        }

        RoundButton{
            id: backButton

            text: "🡐"
            font.pixelSize: 22
            background: Rectangle {
                color: "transparent"
            }

            anchors.topMargin: 5
            anchors.bottomMargin: 5
            anchors.leftMargin: 5
            anchors.top: parent.top
            anchors.left: parent.left

            onClicked: base.back()
        }

        Text{
            anchors.centerIn: parent;
            text: base.room ? base.room.name : qsTr("Placeholder")
        }
    }
}
