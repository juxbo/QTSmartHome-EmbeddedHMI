import QtQuick 2.0

import RoomClass 1.0

Item {
    id: base

    signal selectRoom(RoomClass room)

    anchors.fill: parent;
    NewRoom{
        id: newRoomPopup

        z: 200
        onCreateNewRoom: house.addRoom(roomName)
    }

    HouseHeader{
        id: houseHeader
        onNewRoom: newRoomPopup.visible = true;

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    ListView{
        model: house.modelRooms

        anchors.top: houseHeader.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        spacing: 10

        delegate: RoomListItem {
            room: model.modelData

            onSelectRoom: {
                base.selectRoom(room)
            }
        }
    }
}
