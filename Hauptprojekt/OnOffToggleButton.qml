import QtQuick 2.0
import QtQuick.Controls 2.4

Item {
    //property var value
    //id: onOffBtn
    width: parent.width / 4
    height: parent.height
    Slider {
        id: slider

        from: 0
        to: 1
        // TODO: Signals
        //value: onOffBtn.value
        stepSize: 1
        width: parent.width

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 5
    }
}
