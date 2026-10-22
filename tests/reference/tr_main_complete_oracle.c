/* Host for unchanged myGlMultMatrix from renderer/tr_main.c. */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "tr_main_complete_under_test.inc"
static uint32_t bits(float value){uint32_t result;memcpy(&result,&value,4);return result;}
static void emit(const char *name,const float *m){printf("%s",name);for(int i=0;i<16;i++)printf("|%08x",bits(m[i]));putchar('\n');}
int main(void){
 float identity[16]={1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1};
 float affine[16]={2,0,0,0,0,3,0,0,0,0,4,0,5,6,7,1};
 float mixed[16]={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
 float out[16];myGlMultMatrix(identity,affine,out);emit("I",out);myGlMultMatrix(affine,mixed,out);emit("A",out);myGlMultMatrix(mixed,affine,out);emit("M",out);return 0;
}
