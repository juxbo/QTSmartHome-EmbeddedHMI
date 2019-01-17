import QtQuick.Scene3D 2.0
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0

import RoomClass 1.0

Scene3D {
    id: scene3d
    anchors.fill: parent
    anchors.margins: 10
    focus: true
    aspects: ["input", "logic"]
    cameraAspectRatioMode: Scene3D.AutomaticAspectRatio

    Entity {
        id: sceneRoot

        Camera {
            id: camera
            projectionType: CameraLens.PerspectiveProjection
            fieldOfView: 90
            nearPlane: 0.1
            farPlane: 1000.0
            position: Qt.vector3d(0.0, 2.0, 2.0)
            upVector: Qt.vector3d(0.0, -1.0, 1.0)
            viewCenter: Qt.vector3d(0.0, 0.0, 0.0)
        }

        components: [
            RenderSettings {
                activeFrameGraph: ForwardRenderer {
                    id: renderer
                    clearColor: "#2d2d2d"
                    camera: camera
                }
            }
        ]

        RoomModel {}

        LightModel {
            trans: Qt.vector3d(0.5,0,1)
            color: Qt.rgba(0,255,0,1);
            intense: 0.1
        }
        LightModel {
            trans: Qt.vector3d(0,0,1)
            color: Qt.rgba(255,0,0,1);
            intense: 0.5
        }
    }
}
