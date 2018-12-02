import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11

Drawer {
    id: drawer
    width: mainWindow.width * 0.66
    height: mainWindow.height

    Column {
        id: addRoom
        anchors.fill: parent

        Label {
            text: "Smart Homie"
            font.pixelSize: 14
            font.bold: true
            padding: 10
        }
        // Horizontal line
        Rectangle {
            border.width: 1
            height: 2
            width: parent.width
            anchors.margins: 20
            border.color: "gray"
        }
        //TODO: Create an own component for this?
        ItemDelegate {
            text: qsTr("Add Room")
            width: parent.width
            onClicked: {
                console.log("Add room")
                base.newRoom()
                drawer.close()
            }
        }
        ItemDelegate {
            width: parent.width
            text: qsTr("Dark mode")
            // TODO: Send clicked event to the toggle button
            onClicked: darkModeBtn
            OnOffToggleButton {
                id: darkModeBtn
            }
        }

        ItemDelegate {
            id: goToSettings
            text: qsTr("Settings")
            width: parent.width
            onClicked: {
                console.log("Go to settings")
                drawer.close()
            }
        }
    }
}
