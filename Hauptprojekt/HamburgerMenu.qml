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
            text: "Content goes here!"
            anchors.verticalCenter: parent
        }
        //TODO: Create an own component for this
        ItemDelegate {
            text: qsTr("Add Room")
            width: parent.width
            onClicked: {
                console.log(height)
                stackView.push("Page2Form.ui.qml")
                drawer.close()
            }
        }
        ItemDelegate {
            width: parent.width
            text: qsTr("Add Room")
            OnOffToggleButton {
                anchors.verticalCenter: parent
                // value: base.room.lightsOn()
            }
        }
        /*
            onClicked: {
                stackView.push("Page 1.ui.qml")
                drawer.close()
            }*/

        ItemDelegate {
            id: goToSettings
            text: qsTr("Settings")
            width: parent.width
            onClicked: {
                stackView.push("Page 1.ui.qml")
                drawer.close()
            }
        }
    }
}
