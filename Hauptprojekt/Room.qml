import QtQuick 2.0
import RoomClass 1.0

Item {
    id: base

    property RoomClass room

    signal roomBack()
    anchors.fill: parent;


    OpenGlEs {
        id: opengles
        anchors.top: base.top
        anchors.bottom: base.verticalCenter

    }

    RoomHeader{
        room: base.room
        onBack: roomBack()

        anchors.top: base.top
    }

   /* RoomSettings {
        anchors.top: base.verticalCenter
        anchors.bottom: base.bottom
        width: base.width
    }*/
}
