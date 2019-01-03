import QtQuick 2.0
import QtQuick.Controls 2.4

Item {
    // OUT Signal for whener
    signal toggledSwitch();
    // IN Signal to toggle on click
    signal clickToggle();

    width: parent.width / 4
    height: switchi.height
    anchors.right: parent.right
    anchors.rightMargin: 10
    anchors.verticalCenter: parent.verticalCenter

    // Toggle when clicking the corresponding hamburger item delegate
    onClickToggle: switchi.toggle()

    Switch {
        //TODO: Checked should get its value from a var
        id: switchi
        checked: false
        width: parent.width

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 5
        onToggled: toggledSwitch()
    }
}
