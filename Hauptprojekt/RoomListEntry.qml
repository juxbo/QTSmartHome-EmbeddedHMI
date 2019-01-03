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
        height: name.height + subText.height + 20

        border.width: 1
        border.color: "transparent"
        radius: 4
        Column {
            anchors.verticalCenter: parent.verticalCenter
            Text {
                id: name
                text: base.room.name
                font.pixelSize: 16
                anchors.left: parent.left
                anchors.leftMargin: 15
            }
            Text {
                id: subText
                text: base.room.lightsOn() ? qsTr("Lights are on") : qsTr(
                                                 "All lights off")
                color: "gray"
                font.pixelSize: 14

                anchors.left: parent.left
                anchors.leftMargin: 15
            }
        }
        OnOffToggleButton {
            id: toggleBtn
            onToggledSwitch: {
                console.log("State: " + base.room.lightsOn())
                base.room.toggleAllLights()
                console.log("Toggled all lights of room: " + base.room.name + ", new state: " + base.room.lightsOn())
            }
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
