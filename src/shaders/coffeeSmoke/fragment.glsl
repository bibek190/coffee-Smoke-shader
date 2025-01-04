
uniform sampler2D uPerlinTexture;

varying vec2 vUv;

void main(){

// Smoke generate 
vec4 smoke = texture(uPerlinTextures,vUv).r;

gl_FragColor = vec4(smoke,1.0,1.0);

#include <tonemapping_fragment>
#include <colorspace_fragment>
}