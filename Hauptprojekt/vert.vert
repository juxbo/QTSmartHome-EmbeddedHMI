#define FP highp

attribute FP vec3 vertexPosition;
attribute FP vec2 vertexTexCoord;

varying FP vec2 texCoord;
varying FP vec4 coord;

uniform FP mat4 mvp;



void main()
{
    texCoord = vertexTexCoord;
    coord = vec4(vertexPosition, 1.0);

    gl_Position =  mvp * coord;
}
