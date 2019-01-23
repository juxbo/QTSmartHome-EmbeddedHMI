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

    property alias width: plateMesh.width
    property alias height: plateMesh.height

    property alias tex: material.tex
    property alias vert: material.vert
    property alias frag: material.frag

    property alias color: material.maincolor

    components: [plateMesh, material, transformation]

    PhongMaterial {
        id: material2

    }

    RoomMaterial {
        id: material

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

    PlaneMesh {
        id: plateMesh
        width: 1.0
        height: 1.0
        meshResolution: Qt.size(100, 100)
    }
}
