import Qt3D.Core 2.0
import Qt3D.Render 2.0

Material {
    id: root

    //! [0]
    property color maincolor: Qt.rgba(0.0, 0.0, 0.0, 1.0)
    property alias tex: textureImage.source

    property alias vert: shaders.vertexES
    property alias frag: shaders.fragmentES

    parameters: [
        Parameter {
            name: "maincolor"
            value: Qt.vector3d(root.maincolor.r, root.maincolor.g, root.maincolor.b)
        },
        Parameter {
            name: "texture"
            value: Texture2D {
                id: texture
                minificationFilter: Texture.LinearMipMapLinear
                magnificationFilter: Texture.Linear
                wrapMode {
                    x: WrapMode.Repeat
                    y: WrapMode.Repeat
                }
                generateMipMaps: true
                maximumAnisotropy: 16.0
                TextureImage {
                    id: textureImage
                    source: "qrc:/assets/boden.jpg"
                }
            }
        }
    ]

    //! [0]

    effect: Effect {
        id: shaders

        property string vertexES: "qrc:/vert.vert"
        property string fragmentES: "qrc:/frag.frag"
        //! [1]

        FilterKey {
            id: forward
            name: "renderingStyle"
            value: "forward"
        }

        ShaderProgram {
            id: es2Shader
            vertexShaderCode: loadSource(parent.vertexES)
            fragmentShaderCode: loadSource(parent.fragmentES)
        }
        //! [2]

        techniques: [
            //! [3]
            // OpenGL 2.0
            Technique {
                filterKeys: [forward]
                graphicsApiFilter {
                    api: GraphicsApiFilter.OpenGL
                    profile: GraphicsApiFilter.NoProfile
                    majorVersion: 2
                    minorVersion: 0
                }
                renderPasses: RenderPass {
                    shaderProgram: es2Shader
                    renderStates: [
                        CullFace {
                            mode: CullFace.NoCulling
                        }
                    ]
                }
            },
            // ES 2.0
            Technique {
                filterKeys: [forward]
                graphicsApiFilter {
                    api: GraphicsApiFilter.OpenGLES
                    profile: GraphicsApiFilter.CoreProfile
                    majorVersion: 2
                    minorVersion: 0
                }
                renderPasses: RenderPass {
                    shaderProgram: es2Shader
                    renderStates: [
                        CullFace {
                            mode: CullFace.NoCulling
                        }
                    ]
                }
            }
        ]
    }
}
