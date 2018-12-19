import QtQuick 2.0
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0

import RoomClass 1.0

Item {
    id: base

    property RoomClass room

    signal selectRoom(RoomClass room)

    width: parent.width - 4
    height: rectangle.height
    anchors.horizontalCenter: parent.horizontalCenter

    AbstractButton {
        anchors.left: rectangle.left
        anchors.right: rectangle.right
        anchors.top: rectangle.top
        anchors.bottom: rectangle.bottom
        onClicked: selectRoom(base.room)
    }

    Rectangle {
        id: rectangle

        width: parent.width
        height: name.height > darkModeBtn.height ? name.height : darkModeBtn.height
        //height: darkModeBtn.height

        border.width: 1
        border.color: "transparent"
        radius: 4

        Text {
            id: name
            text: base.room.name
            font.pixelSize: 16

            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 15
        }
        OnOffToggleButton {
            id: darkModeBtn
        }
    }
    DropShadow {
        anchors.fill: rectangle
        horizontalOffset: 1
        verticalOffset: 1
        radius: 3.0
        samples: 17
        color: "#80000000"
        source: rectangle
    }
}
