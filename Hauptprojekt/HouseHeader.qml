import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4
import QtGraphicalEffects 1.0

Item {
    id: base
    signal newRoom

    width: mainWindow.width
    height: rectangle.height

    HamburgerMenu {
        id: drawer
    }

    Rectangle {
        id: rectangle

        width: mainWindow.width
        height: hamburgerButton.height + hamburgerButton.anchors.topMargin
                + hamburgerButton.anchors.bottomMargin

        color: "white"


        /*
        RoundButton{
            id: closeButton

            text: "<-"
            font.pixelSize: 22

            anchors.topMargin: 5
            anchors.bottomMargin: 5
            anchors.leftMargin: 5
            anchors.top: parent.top
            anchors.left: parent.left

            onClicked: Qt.quit();
        }*/
        RoundButton  {
            id: hamburgerButton
            text: "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                drawer.open()
            }
            background: Rectangle {
                color: "transparent"
            }
            padding: 10
            anchors.bottomMargin: 5
        }

        Text {
            anchors.centerIn: parent
            text: qsTr("Welcome to your House")
            font.pixelSize: 18
        }

    }
    DropShadow {
        anchors.fill: rectangle
        horizontalOffset: 0
        verticalOffset: 2
        radius: 5.0
        samples: 17
        color: "#80000000"
        source: rectangle
    }
}
