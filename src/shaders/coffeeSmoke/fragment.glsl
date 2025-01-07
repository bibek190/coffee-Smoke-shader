uniform float uTime;
uniform sampler2D uPerlinTexture;
uniform float uRedColor;
uniform float uGreenColor;
uniform float uBlueColor;

varying vec2 vUv;

void main(){
// Scale and animate
vec2 smokeUv = vUv;
smokeUv.x *= 0.5;
smokeUv.y *= 0.3;
smokeUv.y -= uTime *0.03;



// Smoke generate 
float smoke = texture(uPerlinTexture,smokeUv).r;

smoke = smoothstep(0.4,1.0,smoke);


// removing edges
smoke *= smoothstep(0.0,0.1, vUv.x);
smoke *= smoothstep(1.0,0.9, vUv.x);
smoke *= smoothstep(0.3,0.4, vUv.y);
smoke *= smoothstep(1.0,0.9, vUv.y);




gl_FragColor = vec4(uRedColor,uGreenColor,uBlueColor,smoke);

#include <tonemapping_fragment>
#include <colorspace_fragment>
}