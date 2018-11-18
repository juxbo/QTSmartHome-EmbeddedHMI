import QtQuick 2.0

import Room 1.0;

Item {
    id: base

    property Room room;

    width: parent.width
    height: 100

    Rectangle {
        width: parent.width
        height: 100

        border.width: 2
        border.color: "black"
        Row {
            Text{
                text: base.room.name
            }
        }
    }
    onRoomChanged: {
        room.addLight();
    }
}
