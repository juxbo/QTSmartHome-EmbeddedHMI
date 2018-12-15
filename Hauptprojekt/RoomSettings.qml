import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.1
import RoomClass 1.0;
Item {
    anchors.fill: parent

    width: 320
    height: 240
    SystemPalette { id: palette }
    clip: true

    //! [colordialog]
    ColorDialog {
        id: colorDialog
        visible: colorDialogVisible.checked
        title: "Choose a color"
        color: "green"
        onAccepted: { console.log("Accepted: " + color) }
        onRejected: { console.log("Rejected") }


    }
    //! [colordialog]
    Column {
        anchors.fill: parent
        anchors.margins: 30
        spacing: 30


        Button {
            id: button_on
            text: qsTr("An/Off")
            anchors.left: parent.left
            anchors.right:parent.right
            width: parent.width
            anchors.topMargin: 20
        }

    }
    Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: 8
        }
        height: buttonRow.height * 1.2
        color: Qt.darker(palette.window, 1.1)
        border.color: Qt.darker(palette.window, 1.3)
        Row {
            id: buttonRow
            spacing: 6
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            height: implicitHeight
            width: parent.width
            Button {
                text: "Choose a Color"
                anchors.verticalCenter: parent.verticalCenter
                onClicked: colorDialog.open()
            }

            Rectangle {
                color: colorDialog.color
                height: parent.height
                width: parent.width/4
                anchors.verticalCenter: parent.verticalCenter
                border.color: "white"

            }

            Button {
                id: setButton
                text: "apply"
                anchors.verticalCenter: parent.verticalCenter
               // onClicked: colorDialog.color = "green"
                }
        }
    }

}






