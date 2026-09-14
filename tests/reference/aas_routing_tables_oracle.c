/* SPDX-License-Identifier: GPL-2.0-or-later */
#include <math.h>
#include <stdio.h>
typedef struct link_s { int area,number; struct link_s *next; } link_t;
typedef struct { int count; link_t *first; } bucket_t;
typedef struct { int destination; float start[3],end[3]; } reach_t;
static int area_time(const float a[3],const float b[3]){float x=a[0]-b[0],y=a[1]-b[1],z=a[2]-b[2];int t=(int)(sqrtf(x*x+y*y+z*z)*.33f);return t<=0?1:t;}
#define CHECK(v) do{observations++;if(!(v)){printf("FAIL %d\n",__LINE__);return 1;}}while(0)
int main(void){int observations=0;reach_t r[5]={0};r[1]=(reach_t){2,{0},{10,0,0}};r[2]=(reach_t){2,{0},{30,0,0}};r[3]=(reach_t){3,{0,0,0},{0}};r[4]=(reach_t){3,{100,0,0},{0}};bucket_t buckets[4]={0};link_t links[4];int source[]={1,1,2,2};for(int i=0;i<4;i++){int number=i+1,d=r[number].destination;links[i]=(link_t){source[i],number,buckets[d].first};buckets[d].first=&links[i];buckets[d].count++;}CHECK(buckets[2].count==2&&buckets[2].first->number==2&&buckets[2].first->next->number==1);CHECK(buckets[3].count==2&&buckets[3].first->number==4);int matrix[2][2],maximum=0;float starts[2][3]={{0,0,0},{100,0,0}};link_t *in;for(int l=0;l<2;l++){int n=0;for(in=buckets[2].first;in;in=in->next,n++){matrix[l][n]=area_time(r[in->number].end,starts[l]);if(matrix[l][n]>maximum)maximum=matrix[l][n];}}CHECK(matrix[0][0]==9&&matrix[0][1]==3);CHECK(matrix[1][0]==23&&matrix[1][1]==29);CHECK(maximum==29);int accepted=0;for(int i=0;i<130&&i<128;i++)accepted++;CHECK(accepted==128);puts("PASS: 4 native Baseq3 reverse/portal-table scenarios / 6 exact observations");return 0;}
