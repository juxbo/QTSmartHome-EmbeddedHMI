import QtQuick 2.0
import Qt3D.Core 2.0
import Qt3D.Extras 2.0
import Qt3D.Render 2.0

Entity {
    id: plate

    property real rotX: 0
    property real rotY: 0
    property real rotZ: 0

    property vector3d trans: Qt.vector3d(0, 0, 0)

    property alias tex: material.tex
    property alias vert: material.vert
    property alias frag: material.frag

    property alias color: pointL.color
    property alias intense: pointL.intensity

    components: [pointL, sphereMesh, material, transformation]

    RoomMaterial {
        id: material

        frag: "qrc:/lightfrag.frag"
        maincolor: Qt.rgba(255,255,255,1)
    }

    PointLight {
        id: pointL
        color: Qt.rgba(0,0,0,1)
        intensity: 1.0
    }

    Transform {
        id: transformation
        matrix: {
            var m = Qt.matrix4x4()
            m.translate(trans)
            m.rotate(rotX, Qt.vector3d(1,0,0))
            m.rotate(rotY, Qt.vector3d(0,1,0))
            m.rotate(rotZ, Qt.vector3d(0,0,1))
            return m
        }
    }

    SphereMesh {
        id: sphereMesh
        radius: 0.1
        rings: 100
        slices: 100
    }
}
