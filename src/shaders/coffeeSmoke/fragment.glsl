uniform sampler2D uPerlinTexture;
uniform float uTime;
uniform float uRcolor;
uniform float uGcolor;
uniform float uBcolor;

varying vec2 vUv;

void main(){
// Scale and animate
vec2 smokeUv = vUv;
smokeUv.x *= 0.5;
smokeUv.y *= 0.3;
smokeUv.y -= uTime * 0.03;

// Smoke 
float smoke = texture(uPerlinTexture,smokeUv).r;

// Remap
smoke = smoothstep(0.4,1.0,smoke);

// Edges
// smoke = 1.0;
smoke *= smoothstep(0.0,0.1,vUv.x);
smoke *= smoothstep(1.0,0.9,vUv.x);
smoke *= smoothstep(1.0,0.9,vUv.y);
smoke *= smoothstep(0.0,0.1,vUv.y);

// Final Code
gl_FragColor = vec4(uRcolor,uGcolor,uBcolor,smoke);

#include <tonemapping_fragment>
#include <colorspace_fragment>
}