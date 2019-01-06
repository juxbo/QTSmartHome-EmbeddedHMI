import QtQuick 2.0
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0

Item {
    id: base

    visible: false
    height: 50
    width: parent.width/1.2
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 30

    function show(message, duration) {
        console.log("Showing toast "+message)
        lblTxt.text = message
        timer.interval = duration
        base.visible = true
        timer.start()
    }

    Timer {
        id: timer

        repeat: false
        onTriggered: {
            base.visible = false
            timer.stop()
        }
    }

    Rectangle {
        id: rectangle

        anchors.centerIn: parent
        anchors.fill: parent

        color: "gray"
        opacity: 0.4
        radius: 20
    }
    Label {
        id: lblTxt
        anchors.centerIn: rectangle
        text: "TEST"
        color: "black"
    }
}
