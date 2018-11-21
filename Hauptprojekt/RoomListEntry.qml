import QtQuick 2.0
import QtQuick.Controls 2.4

import RoomClass 1.0;

Item {
    id: base

    property RoomClass room;

    signal selectRoom(RoomClass room)

    width: parent.width
    height: rectangle.height

    AbstractButton{
        anchors.left: rectangle.left
        anchors.right: rectangle.right
        anchors.top: rectangle.top
        anchors.bottom: rectangle.bottom
        onClicked: selectRoom(base.room)
    }

    Rectangle {
        id: rectangle

        width: parent.width
        height: name.height > slider.height ? name.height : slider.height

        border.width: 2
        border.color: "black"
        Text{
            id: name

            text: base.room.name

            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 5
        }

        Slider{
            id: slider

            from: 0
            to: 1
            value: base.room.lightsOn()
            stepSize: 1
            width: parent.width / 4

            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 5
        }
    }
}
