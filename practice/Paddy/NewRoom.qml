import QtQuick 2.0
import QtQuick.Controls 2.4

Item {
    id: base;

    visible: false;

    anchors.fill: parent;

    signal createNewRoom(string roomName)

    Rectangle{
        id: rectangle

        height: mainWindow.height / 3
        width: mainWindow.width / 1.5

        anchors.centerIn: parent;

        border.color: "black"
        border.width: 2

        color: "white"

        radius: 20

        Column{
            anchors.centerIn: parent

            spacing: 10

            Label{
                id: inputLabel
                anchors.horizontalCenter: parent.horizontalCenter

                text: qsTr("New room")
                font.pixelSize: 22
            }

            TextField{
                id: inputField
                anchors.horizontalCenter: parent.horizontalCenter

                placeholderText: qsTr("Room name")
            }

            Row{
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
                    text: qsTr("Ok")

                    width: rectangle.width / 3

                    onClicked: {
                        base.createNewRoom(inputField.text)
                        base.visible = false
                    }
                }
            }
        }
    }
    onVisibleChanged: visible ? inputField.focus = true : inputField.text = ""
}
