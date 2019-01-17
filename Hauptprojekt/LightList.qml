import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11

import RoomClass 1.0
import LightClass 1.0

Drawer {
    property RoomClass room;

    signal selectLight(LightClass light);

    id: drawer
    width: mainWindow.width * 0.66
    height: mainWindow.height

    Column {
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
            text: qsTr("Add Light")
            width: parent.width
            onClicked: {
                console.log("Add Light")
                drawer.room.addLight()
                drawer.close()
            }
        }
        Label {
            anchors.topMargin: 50
            text: qsTr("Lights")
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
        Repeater {
            model: drawer.room.modelLights
            ItemDelegate {
                text: model.modelData.name
                width: parent.width
                onClicked: {
                    selectLight(model.modelData)
                }
            }
        }
    }
}
