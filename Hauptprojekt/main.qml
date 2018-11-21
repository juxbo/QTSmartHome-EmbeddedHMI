import QtQuick 2.11
import QtQuick.Window 2.11

Window {
    id: mainWindow

    visible: true
    width: 320
    height: 480
    title: qsTr("Smart Home App")

    color: "lightblue"

    MainScreen{
        id: housePage

        visible: true
        onSelectRoom: {
            visible = false;
            roomPage.visible = true;
            roomPage.room = room;
        }
    }

    Room{
        id: roomPage

        visible: false;
        onRoomBack: {
            visible = false;
            housePage.visible = true;
        }
    }

}
