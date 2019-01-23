import QtQuick 2.11
import Qt3D.Core 2.0
import Qt3D.Extras 2.0
import Qt3D.Render 2.0

Entity {
    id: root

    components: [transform, floor, back, left]

    property real size: 1

    Transform {
        id: transform
        rotationX: 90
    }

    PlateModel {
        id: floor

        width: 2 * root.size
        height: 1 * root.size

        color: Qt.rgba(1.0, 0.0, 0.0, 0)
    }
    PlateModel {
        id: back

        width: 2 * root.size
        height: 1 * root.size

        rotX: -90

        trans:  Qt.vector3d(0.0, 0.5, 0.5)
        color: Qt.rgba(0, 1.0, 0.0,  0)
        tex: "qrc:/assets/wand.jpg"
    }
    PlateModel {
        id: left

        width: 1 * root.size
        height: 1 * root.size

        rotZ: 90

        trans:  Qt.vector3d(1., 0.5, 0.)
        color: Qt.rgba(0, 1.0, 0,  0)
        tex: "qrc:/assets/wand.jpg"
    }
    PlateModel {
        id: right

        width: 1 * root.size
        height: 1 * root.size

        rotZ: -90

        trans:  Qt.vector3d(-1., 0.5, 0.)
        color: Qt.rgba(0, 1.0, 0.0,  0)
        tex: "qrc:/assets/wand.jpg"
    }

}
