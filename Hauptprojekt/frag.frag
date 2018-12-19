
varying highp vec3 worldPosition;
varying highp vec3 worldNormal;
varying highp vec4 worldTangent;
varying highp vec2 texCoord;
varying highp vec2 waveTexCoord;
varying highp vec2 movtexCoord;
varying highp vec2 multexCoord;
varying highp vec2 skyTexCoord;

varying highp vec3 vpos;

varying highp vec3 color;

uniform highp sampler2D diffuseTexture;
uniform highp sampler2D specularTexture;
uniform highp sampler2D normalTexture;

uniform highp float offsetx;
uniform highp float offsety;
uniform highp float specularity;
uniform highp float waveStrenght;
uniform highp vec4 ka;
uniform highp float shininess;
uniform highp float normalAmount;
uniform highp vec3 eyePosition;



void main()
{
    gl_FragColor = vec4(255,255,255,1.0);
}

