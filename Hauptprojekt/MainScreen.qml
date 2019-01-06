import QtQuick 2.0

import RoomClass 1.0

Item {
    id: base

    signal roomSelected(RoomClass room)

    anchors.fill: parent
    Component.onCompleted: house.reconnectMqtt()

    NewRoom {
        id: newRoomPopup

        z: 200
        onCreateNewRoom: house.addRoom(roomName)
    }

    MQTTSettings {
        id: mqttPopup
        z: 200

        onSaveMqttSettings: {
            house.setClientHost(host)
            house.setClientPort(port)
            house.reconnectMqtt()
        }
    }

    ToastNotification {
        id: toast
        z: 500
    }

    HouseHeader {
        id: houseHeader
        onNewRoom: newRoomPopup.visible = true
        onOpenMqttSettings: mqttPopup.visible = true

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    RoomList {
        id: houseRoomList

        anchors.top: houseHeader.bottom
        anchors.bottom: base.bottom

        onSelectRoom: {
            roomSelected(room)
        }
    }
}
