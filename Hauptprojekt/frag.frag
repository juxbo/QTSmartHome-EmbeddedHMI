#define FP highp

uniform FP sampler2D texture;

const int MAX_LIGHTS = 8;
struct Light {
    int type;
    FP vec3 position;
    FP vec3 color;
    FP float intensity;
    FP vec3 direction;
    FP vec3 attenuation;
    FP float cutOffAngle;
};

uniform Light lights[MAX_LIGHTS];
uniform int lightCount;

varying FP vec2 texCoord;
varying FP vec4 coord;

void main()
{
    FP vec4 textureColor = texture2D(texture, texCoord);

    FP float r = 0.0;
    FP float g = 0.0;
    FP float b = 0.0;

    for(int i = 0; i < lightCount; ++i){
        FP vec3 distVec = lights[i].position - coord.xyz;
        FP float dist = sqrt(pow(distVec.x, 2.0) + pow(distVec.y, 2.0) + pow(distVec.z, 2.0));
        dist /= 2.0;
        if(dist > 1.0){
            dist = 1.0;
        }
        FP float multi = lights[i].intensity * (1.0 - dist);
        r += lights[i].color.r * multi;
        g += lights[i].color.g * multi;
        b += lights[i].color.b * multi;
    }

    FP vec3 tmp = textureColor.rgb + vec3(r,g,b);
    FP float max_value = max(tmp.r, tmp.g);
    max_value = max(max_value, tmp.b);
    if(max_value > 1.0){
        FP float less = max_value - 1.0;
        less = max_value / less;

        FP float anteil = tmp.r / less;
        tmp.r -= anteil;

        anteil = tmp.g / less;
        tmp.g -= anteil;

        anteil = tmp.b / less;
        tmp.b -= anteil;
    }

    gl_FragColor = vec4(tmp, textureColor.a);
}


