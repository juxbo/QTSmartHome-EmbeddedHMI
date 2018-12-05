import QtQuick 2.0
import QtQuick.Controls 2.4

Item {
    signal clickToggle();

    //property var value
    //id: onOffBtn

    width: parent.width / 4
    height: parent.height
    anchors.right: parent.right
    anchors.rightMargin: 10
    onClickToggle: switchi.toggle()

    Switch {
        //TODO: Checked should get its value from a var
        id: switchi
        checked: false
        width: parent.width

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 5
    }
    // XXX: The already existing SWITCH functionality seems superior and easier to use
    //        Slider {
    //            id: slider

    //            from: 0
    //            to: 1
    //            // TODO: Signals
    //            //value: onOffBtn.value
    //            stepSize: 1
    //            width: parent.width

    //            anchors.right: parent.right
    //            anchors.verticalCenter: parent.verticalCenter
    //            anchors.rightMargin: 5
    //        }
}
