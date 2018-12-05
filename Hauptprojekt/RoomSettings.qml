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
       // modality: colorDialogModal.checked ? Qt.WindowModal : Qt.NonModal
        title: "Choose a color"
        color: "green"
      //  showAlphaChannel: colorDialogAlpha.checked
        onAccepted: { console.log("Accepted: " + color) }
        onRejected: { console.log("Rejected") }


    }
    //! [colordialog]
    Column {
        anchors.fill: parent
        anchors.margins: 12
        spacing: 8
//    Slider{
//        id: slider

//        from: 0
//        to: 100
//        value: 0
//        stepSize: 5
//        width: parent.width

//       // anchors.topMargin: 20
//        //anchors.top: p
//    }

    Button {
        id: button_on
        text: qsTr("An/Off")
        anchors.left: parent.left
        anchors.right:parent.right
        width: parent.width
   // anchors.top: slider.bottom
      //  anchors.topMargin: 20
    }


    CheckBox {
        id: colorDialogVisible
        text: "Choose a Color"
        Binding on checked { value: colorDialog.visible }
        anchors.left: parent.left
        anchors.right:parent.right
        anchors.top: button_on.bottom
        anchors.leftMargin: 30
    }

    Row {
        id: colorRow
            spacing: parent.spacing
           // height: colorLabel.implicitHeight * 2.0
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.right:parent.right
            anchors.top: colorDialogVisible.bottom
        Rectangle {
            color: colorDialog.color
            height: parent.height/5
            width: parent.width///4
            border.color: "black"
            MouseArea {
                anchors.fill: parent
                onClicked: colorDialog.open()
            }
//            Label {
//                id: colorLabel
//                text: "<b>current color:</b> " + colorDialog.color
//                anchors.verticalCenter: parent.verticalCenter
//                anchors.left:parent.right
//            }
        }

       }
    Button {

        id: buttonRow
        text: "set to current color"
        anchors.leftMargin: 12
        anchors.left: parent.left
        anchors.right:parent.right
        anchors.top: colorRow.bottom
        }
    }

    }






