import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Dialogs 1.2

import Room 1.0

ColumnLayout {
    Frame {
        id: frame

        ListView {
            id: listView
            x: 0
            y: 0
            implicitWidth: 376
            implicitHeight: 376
            clip: true
            delegate: RowLayout {
                ColorDialog {
                    id: colorDia
                    modality: Qt.WindowModal
                    title: "Choose color"
                    color: model.color
                    onAccepted: model.color = colorDia.color
                }

                width: parent.width
                CheckBox {
                    enabled: false
                    checked: model.on
                }
                Text {
                    text: model.description
                    Layout.fillWidth: true
                }
                Button {
                    text: "On/Off"
                    onClicked: model.on = !model.on
                }
                Button {
                    Rectangle {
                        width: 10
                        height: parent.height - 1
                        color: model.color
                    }
                    text: "Color"
                    onClicked: {
                        colorDia.open()
                    }
                }
            }
            model: RoomModel {
                list: roomList
            }
        }
    }
    RowLayout {
        Button {
            text: qsTr("Add room")
            Layout.fillWidth: true
        }
    }
}
