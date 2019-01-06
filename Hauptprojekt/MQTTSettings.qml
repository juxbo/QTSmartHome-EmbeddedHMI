import QtQuick 2.0
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0

Item {
    id: base

    visible: false

    anchors.fill: parent
    signal saveMqttSettings(string host, int port)

    Rectangle {
        height: mainWindow.height
        width: mainWindow.width

        color: "gray"
        opacity: 0.5

        MouseArea {
            anchors.fill: parent
            onClicked: {} // Do nothing on click outside of popup
        }
    }
    Rectangle {
        id: rectangle

        height: mainWindow.height / 2
        width: mainWindow.width / 1.2

        anchors.centerIn: parent

        color: "white"

        border.width: 1
        border.color: "transparent"
        radius: 4

        Column {
            anchors.centerIn: parent

            spacing: 10

            Label {
                id: inputLabel
                anchors.horizontalCenter: parent.horizontalCenter

                text: qsTr("MQTT settings")
                font.pixelSize: 22
            }

            TextField {
                id: urlField
                anchors.horizontalCenter: parent.horizontalCenter

                placeholderText: qsTr("URL / IP")
                text: house.getClientHost()
            }
            TextField {
                id: portField
                anchors.horizontalCenter: parent.horizontalCenter
                validator: IntValidator {
                }

                placeholderText: qsTr("Port")
                text: house.getClientPort()
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10
                Button {
                    text: qsTr("Cancel")

                    width: rectangle.width / 3

                    onClicked: {
                        base.visible = false
                    }
                }

                Button {
                    text: qsTr("Save")

                    width: rectangle.width / 3

                    onClicked: {
                        // TODO:
                        base.saveMqttSettings(urlField.text,
                                              parseInt(portField.text))
                        base.visible = false
                    }
                }
            }
        }
    }
    DropShadow {
        anchors.fill: rectangle
        horizontalOffset: 1
        verticalOffset: 1
        radius: 3.0
        samples: 17
        color: "#80000000"
        source: rectangle
    }

    onVisibleChanged: visible ? urlField.focus = true : false //XXX: Else do nothing
}
