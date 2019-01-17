import QtQuick.Scene3D 2.0
import Qt3D.Core 2.5
import Qt3D.Render 2.0
import Qt3D.Extras 2.0

import RoomClass 1.0

Scene3D {

    property RoomClass room;

    id: scene3d
    anchors.fill: parent
    focus: true
    aspects: ["input", "logic"]
    cameraAspectRatioMode: Scene3D.AutomaticAspectRatio

    Entity {
        id: sceneRoot

        Camera {
            id: camera
            projectionType: CameraLens.PerspectiveProjection
            fieldOfView: 45
            nearPlane: 0.1
            farPlane: 1000.0
            position: Qt.vector3d(0.0, 1.0, 1.8)
            upVector: Qt.vector3d(0.0, -1.0, 1.0)
            viewCenter: Qt.vector3d(0.0, 0.0, 0.5)
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

        NodeInstantiator {
            model: room.modelLights;
            LightModel {
                trans: Qt.vector3d(model.modelData.position.x,model.modelData.position.y, 1)
                color: model.modelData.color;
                intense: 0.2
            }
        }
    }
}
