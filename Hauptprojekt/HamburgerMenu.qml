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
            text: qsTr("Smart Homie")
            font.pixelSize: 16
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
        Label {
            anchors.topMargin: 50
            text: qsTr("Settings")
            font.pixelSize: 16
            padding: 10
            topPadding: 25
        }
        // Horizontal line
        Rectangle {
            border.width: 1
            height: 2
            width: parent.width
            anchors.margins: 20
            border.color: "gray"
        }
        ItemDelegate {
            id: darkModeDelegate
            width: parent.width
            text: qsTr("Dark mode")
            // Send clicked event to the toggle button
            onClicked: darkModeBtn.clickToggle()
            OnOffToggleButton {
                id: darkModeBtn
            }
        }
        ComboBox {
            id: langCB
            currentIndex: 0
            model: ["English", "Deutsch"]
            width: parent.width
            background: parent.background
            onCurrentIndexChanged: console.log("Changed lang")
            contentItem: Text {
                text: langCB.displayText
                font: darkModeDelegate.font
                padding: darkModeDelegate.padding
                // TODO: Get the color of the darkModeDelegate text instead
                color: "#393939"
            }
        }
    }
}
