import QtQuick 2.0
import RoomClass 1.0

Item {
    id: base

    property RoomClass room

    signal roomBack()
    anchors.fill: parent;

    RoomHeader{
        room: base.room
        onBack: roomBack()
    }

}
