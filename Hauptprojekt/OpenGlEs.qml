import QtQuick.Scene3D 2.0
import QtQuick.Controls 2.4
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0
import Qt3D.Input 2.0
import QtQuick 2.0 as QQ2

import RoomClass 1.0

Scene3D {
    id: scene3d
    anchors.fill: parent
    anchors.leftMargin: 10
    anchors.topMargin: 10
    anchors.rightMargin: 10
    anchors.bottomMargin: 10
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
            position: Qt.vector3d(0.0, 0.0, -150.0)
            upVector: Qt.vector3d(0.0, 1.0, 0.0)
            viewCenter: Qt.vector3d(0.0, 0.0, 1.0)

        }

        FirstPersonCameraController {
            camera: camera
        }

        Entity {
            DirectionalLight {
                id: directional
                worldDirection: Qt.vector3d(0.0, 0.0, 1.0).normalized();
                color: "#fff2a3"
                intensity: 0.01
            }
            Transform {
                id: lightpostransform
                translation: Qt.vector3d(0.0, 0.0, -60.0)
            }
            components: [lightpostransform, directional]
        }

        Entity {
            PointLight {
                id: pointL
                color: "#fff2a3"
            }
            Transform{
                id: plightpostransform
                translation: Qt.vector3d(0.0, 0.0, -15.0)
            }
            components: [plightpostransform, pointL]
        }

        components: [
            RenderSettings {
                activeFrameGraph: ForwardRenderer {
                    id: renderer
                    clearColor: "blue"
                    camera: camera
                }
            },
            InputSettings { }
        ]

        Entity {
           id: water

           WaterMaterial {
               id: watermaterial

               property real tox: 0.0
               property real toy: 0.0
               property real vertY: 1.0
               property real waveRandomAnim: 0.0

               normal: "qrc:/assets/foam.jpg"

               textureScale: 1
               wavescale: vertY * 1
               specularity: 1
               offsetx: tox * 1
               offsety: toy * 1
               normalAmount: 1
               waveheight: 1
               waveStrenght: 1
               shininess: 100
               waveRandom: waveRandomAnim
           }

           Mesh {
               id: watermesh
               source: "qrc:/assets/waterPlane.obj"
           }

           Transform {
               id: waterTransform
               property real scale: 1.0
               property real rotx: 0.0
               scale3D: Qt.vector3d(scale, scale, scale)
               rotationY: 0
               translation: Qt.vector3d(0.0, 0.0, 60.0)
           }

           Entity {
               id: waterEntity
               components: [watermesh, watermaterial, waterTransform]
           }
        }
    }
}
