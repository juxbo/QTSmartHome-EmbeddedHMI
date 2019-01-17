import QtQuick 2.0
import RoomClass 1.0
import LightClass 1.0

Item {
    id: base

    property RoomClass room

    property LightClass light

    signal roomBack()
    anchors.fill: parent;


    OpenGlEs {
        id: opengles
        room: base.room;

        anchors.bottomMargin: parent.height / 2;
        anchors.topMargin: 50;

    }

    RoomHeader{
        room: base.room
        onBack: roomBack()

        anchors.top: base.top

        onLightSelected: {
            roomsettings.light = light;
            console.log("test")
        }
    }

    RoomSettings {
        id: roomsettings
        anchors.top: base.verticalCenter
        anchors.bottom: base.bottom
        width: base.width

    }
}
