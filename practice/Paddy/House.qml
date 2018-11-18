import QtQuick 2.0

Item {

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
        height: 100
    }

    ListView{
        model: house.modelRooms

        anchors.top: houseHeader.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        spacing: 1

        delegate: RoomListItem {
            room: model.modelData
        }

//        Connections {
//            target: house
//            onRoomsChanged:{
//                console.log("Rooms changed")
//                console.log(house.modelRooms)
//            }
//        }
    }
}
