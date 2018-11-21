import QtQuick 2.0
import QtQuick.Controls 2.4

import RoomClass 1.0

Item {
    id: base
    signal newLight();
    signal back();

    property RoomClass room;

    width: mainWindow.width
    height: rectangle.height
    Rectangle{
        id: rectangle

        width: mainWindow.width
        height: newLightButton.height + newLightButton.anchors.topMargin + newLightButton.anchors.bottomMargin

        color: "white"

        RoundButton{
            id: backButton

            text: "<-"
            font.pixelSize: 22

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

        RoundButton{
            id: newLightButton

            text: "+"
            font.pixelSize: 22

            anchors.topMargin: 5
            anchors.bottomMargin: 5
            anchors.rightMargin: 5
            anchors.top: parent.top
            anchors.right: parent.right
            onClicked: base.room.addLight()
        }
    }
}
