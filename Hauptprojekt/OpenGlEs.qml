import QtQuick 2.0
import QtQuick.Scene3D 2.0
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Logic 2.0
import Qt3D.Extras 2.0

import RoomClass 1.0

    Scene3D {
        id: roomEntity
        property RoomClass room
        anchors.fill: parent
        aspects: ["render", "logic", "input"]

         property alias room: roomEntity.room

        Entity {
            Camera {
                id: camera
                projectionType: CameraLens.PerspectiveProjection
                fieldOfView: 45
                nearPlane: 0.1
                farPlane: 1000.0
                position: Qt.vector3d(0.0, 4.0, 15.0)
                upVector: Qt.vector3d(0.0, 1.0, 0.0)
                viewCenter: Qt.vector3d(0.0, -2.0, 0.0)
            }
            FirstPersonCameraController {
                camera: camera
            }

            components: [
                RenderSettings {
                    activeFrameGraph: ForwardRenderer {
                        id: renderer
                        clearColor: "black"
                        camera: camera
                    }

                },
                InputSettings { },
                GeometryRenderer{
                    id: geometryRenderer

                            instanceCount: roomEntity.room.model.count
                            primitiveType: GeometryRenderer.Triangles

                            geometry: Geometry{

                                Attribute{
                                    name: "vertexPosition" // Name of attribute in the shader
                                    attributeType: Attribute.VertexAttribute
                                    vertexBaseType: Attribute.Float
                                    vertexSize: 3
                                    byteOffset: 0 // See OpenGL doc for details about these properties
                                    byteStride: 0
                                    count: roomEntity.room.model.count
                                    buffer : roomEntity.room.model.buffer // The actual QBuffer which holds the vertex data
                                }
                            }
                }
            ]


        }
    }
