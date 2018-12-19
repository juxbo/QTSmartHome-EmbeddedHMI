#define FP highp

attribute highp vec3 vertexPosition;
attribute highp vec3 vertexNormal;
attribute highp vec2 vertexTexCoord;
attribute highp vec4 vertexTangent;

varying highp vec3 worldPosition;
varying highp vec3 worldNormal;
varying highp vec4 worldTangent;
varying highp vec2 texCoord;
varying highp vec2 movtexCoord;
varying highp vec2 multexCoord;
varying highp vec2 waveTexCoord;
varying highp vec2 skyTexCoord;
varying highp vec3 vpos;

uniform highp mat4 modelMatrix;
uniform highp mat3 modelNormalMatrix;
uniform highp mat4 mvp;

uniform highp float offsetx;
uniform highp float offsety;
uniform highp float vertYpos;
uniform highp float texCoordScale;
uniform highp float waveheight;
uniform highp float waveRandom;


void main()
{
    // Scale texture coordinates for for fragment shader
    texCoord = vertexTexCoord * texCoordScale;
    movtexCoord = vertexTexCoord * texCoordScale;
    multexCoord = vertexTexCoord * (texCoordScale*0.5);
    waveTexCoord = vertexTexCoord * (texCoordScale * 6.0);
    skyTexCoord = vertexTexCoord * (texCoordScale * 0.2);

    // Add Animated x and y Offset to SKY, MOV and MUL texCoords
    movtexCoord = vec2(texCoord.x+offsetx,texCoord.y+offsety);
    multexCoord = vec2(texCoord.x-offsetx,texCoord.y+offsety);
    skyTexCoord = vec2(texCoord.x-(offsetx/2.0),texCoord.y-(offsety/2.0));

    // Transform position, normal, and tangent to world coords
    worldPosition = vec3(modelMatrix * vec4(vertexPosition, 1.0));
    worldNormal = normalize(modelNormalMatrix * vertexNormal);
    worldTangent.xyz = normalize(vec3(modelMatrix * vec4(vertexTangent.xyz, 0.0)));
    worldTangent.w = vertexTangent.w;

    // Calculate animated vertex positions

    highp vec3 vertMod = vec3(vertexPosition.x,vertexPosition.y,vertexPosition.z);



    // Calculate vertex position in clip coordinates
    gl_Position = mvp * vec4(vertMod, 1.0);
}
