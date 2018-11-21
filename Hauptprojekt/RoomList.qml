import QtQuick 2.0

Item {

    RoomListHeader{
        id: roomListHeader

    }

    ListView{
        model: house.modelRooms

        anchors.top: roomListHeader.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        spacing: 10

        delegate: RoomListEntry {
            room: model.modelData

            onSelectRoom: {
                base.selectRoom(room)
            }
        }
    }
}
