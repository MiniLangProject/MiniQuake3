/* SPDX-License-Identifier: GPL-2.0-or-later
 * Independent C binary32 arithmetic, including subnormals and ties.
 */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
static uint32_t state=68;
static uint32_t next(void){state=state*1664525u+1013904223u;return state;}
static void pair(FILE *out,uint32_t a,uint32_t b){
    float x,y,z;uint32_t row[7];
    memcpy(&x,&a,4);memcpy(&y,&b,4);row[0]=a;row[1]=b;
    z=x+y;memcpy(&row[2],&z,4);
    z=x-y;memcpy(&row[3],&z,4);
    z=x*y;memcpy(&row[4],&z,4);
    z=x/y;memcpy(&row[5],&z,4);
    z=(float)sqrt((double)x);memcpy(&row[6],&z,4);
    fwrite(row,sizeof(row),1,out);
}
int main(int argc,char**argv){
    FILE *out;int i,j;
    uint32_t edge[]={0,0x80000000,1,0x80000001,0x007fffff,0x00800000,0x3f800000,0xbf800000,
        0x3f800001,0x33800000,0x3effffff,0x7f7fffff,0xff7fffff,0x7f800000,0xff800000,0x7fc00000,0xffc00000};
    if(argc!=2||!(out=fopen(argv[1],"wb")))return 2;
    for(i=0;i<17;i++)for(j=0;j<17;j++)pair(out,edge[i],edge[j]);
    for(i=0;i<20000;i++){
        uint32_t a=next(),b=next();
        if((a&0x7fffffff)>0x7f800000)a&=0xfeffffff;
        if((b&0x7fffffff)>0x7f800000)b&=0xfeffffff;
        pair(out,a,b);
    }
    fclose(out);return 0;
}
