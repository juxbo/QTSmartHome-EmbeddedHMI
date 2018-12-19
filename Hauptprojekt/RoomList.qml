import QtQuick 2.0
import RoomClass 1.0

Item {
    id: base
    width: parent.width

    signal selectRoom(RoomClass room)

    RoomListHeader{
        id: roomListHeader

        anchors.top: base.top
        width: base.width

    }

    ListView{
        model: house.modelRooms

        anchors.top: roomListHeader.bottom
        anchors.bottom: base.bottom
        anchors.left: base.left
        anchors.right: base.right

        spacing: 10

        delegate: RoomListEntry {
            room: model.modelData

            onSelectRoom: {
                base.selectRoom(room)
            }
        }
    }
}
