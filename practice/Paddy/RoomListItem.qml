import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4

import Room 1.0;

Item {
    id: base

    property Room room;

    width: parent.width
    height: 100

    Rectangle {
        width: parent.width
        height: 100
        border.width: 1
        border.color: "black"
        RowLayout {
            width: parent.width - 10
            height: parent.height
            //TODO: somehow add left padding

            Text{
                text: base.room.name
                Layout.fillWidth: true
            }
            Button {
                text: "On / Off"
                onClicked: room.toggleAllLights()
            }
        }
    }
    onRoomChanged: {
        room.addLight();
    }
}
