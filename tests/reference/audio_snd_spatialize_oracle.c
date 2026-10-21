/* Host for unchanged S_SpatializeOrigin from client/snd_dma.c. */
#define _CRT_SECURE_NO_WARNINGS
#include <math.h>
#include <stdio.h>

typedef float vec_t;
typedef float vec3_t[3];
typedef struct { int channels; } dma_t;
static dma_t dma;
static vec3_t listener_origin;
static vec3_t listener_axis[3];

#define SOUND_FULLVOLUME 80
#define SOUND_ATTENUATE 0.0008f
#define VectorSubtract(a,b,c) do {(c)[0]=(a)[0]-(b)[0];(c)[1]=(a)[1]-(b)[1];(c)[2]=(a)[2]-(b)[2];} while(0)
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#define VectorRotate(in,matrix,out) do {(out)[0]=DotProduct((in),(matrix)[0]);(out)[1]=DotProduct((in),(matrix)[1]);(out)[2]=DotProduct((in),(matrix)[2]);} while(0)
static vec_t VectorNormalize(vec3_t value) {
  float length=value[0]*value[0]+value[1]*value[1]+value[2]*value[2];float inverse;
  length=(float)sqrt(length);if(length){inverse=1.0f/length;value[0]*=inverse;value[1]*=inverse;value[2]*=inverse;}return length;
}

#include "audio_snd_spatialize_under_test.inc"

static void axes(float f0,float f1,float f2,float l0,float l1,float l2,float u0,float u1,float u2) {
  listener_axis[0][0]=f0;listener_axis[0][1]=f1;listener_axis[0][2]=f2;
  listener_axis[1][0]=l0;listener_axis[1][1]=l1;listener_axis[1][2]=l2;
  listener_axis[2][0]=u0;listener_axis[2][1]=u1;listener_axis[2][2]=u2;
}
static void run(const char *label,float x,float y,float z,int master,int channels) {
  vec3_t origin={x,y,z};int left=-1,right=-1;dma.channels=channels;
  S_SpatializeOrigin(origin,master,&left,&right);printf("%s|%d|%d\n",label,left,right);
}
int main(void) {
  listener_origin[0]=10.0f;listener_origin[1]=-20.0f;listener_origin[2]=30.0f;
  axes(1,0,0,0,1,0,0,0,1);
  run("coincident",10,-20,30,127,2);run("front",90,-20,30,127,2);
  run("left",10,80,30,127,2);run("right",10,-120,30,127,2);
  run("near-left",10,20,30,90,2);run("far-front",1340,-20,30,127,2);
  run("beyond",2010,-20,30,127,2);run("mono",10,180,30,127,1);
  axes(0,1,0,-1,0,0,0,0,1);
  run("yaw90-front",10,180,30,127,2);run("yaw90-left",-90,-20,30,127,2);
  run("diagonal",110,80,130,127,2);run("quiet",110,80,30,17,2);
  return 0;
}
