#include <math.h>
#include <stdio.h>
#include <string.h>

#define SUB 8
#define HALF 4
#define EPS .1f
static float mins_[2][6],maxs_[2][6];
static const float clip_[6][3]={{1,1,0},{1,-1,0},{0,-1,1},{0,1,1},{1,0,1},{-1,0,1}};
static int q(float x){return x<0?(int)(x*10000-.5f):(int)(x*10000+.5f);}
static void emit(float x){printf("%d\n",q(x));}
static void clear(void){int i;for(i=0;i<6;i++){mins_[0][i]=mins_[1][i]=9999;maxs_[0][i]=maxs_[1][i]=-9999;}}
static void make(float s,float t,int axis,float xyz[3],float st[2]){static int m[6][3]={{3,-1,2},{-3,1,2},{1,3,2},{-1,-3,2},{-2,-1,3},{2,-1,-3}};float b[3]={s*(1024.0f/1.75f),t*(1024.0f/1.75f),1024.0f/1.75f};int j,k;for(j=0;j<3;j++){k=m[axis][j];xyz[j]=k<0?-b[-k-1]:b[k-1];}st[0]=(s+1)*.5f;st[1]=1-(t+1)*.5f;}
static void add(int n,float (*v)[3]){static int m[6][3]={{-2,3,1},{2,3,-1},{1,3,2},{-1,3,-2},{-2,-1,3},{-2,1,-3}};float sum[3]={0},a[3],d,s,t;int i,j,axis;for(i=0;i<n;i++)for(j=0;j<3;j++)sum[j]+=v[i][j];for(i=0;i<3;i++)a[i]=fabsf(sum[i]);if(a[0]>a[1]&&a[0]>a[2])axis=sum[0]<0?1:0;else if(a[1]>a[2]&&a[1]>a[0])axis=sum[1]<0?3:2;else axis=sum[2]<0?5:4;for(i=0;i<n;i++){j=m[axis][2];d=j>0?v[i][j-1]:-v[i][-j-1];if(d<.001f)continue;j=m[axis][0];s=(j<0?-v[i][-j-1]:v[i][j-1])/d;j=m[axis][1];t=(j<0?-v[i][-j-1]:v[i][j-1])/d;if(s<mins_[0][axis])mins_[0][axis]=s;if(s>maxs_[0][axis])maxs_[0][axis]=s;if(t<mins_[1][axis])mins_[1][axis]=t;if(t>maxs_[1][axis])maxs_[1][axis]=t;}}
static void clip(int n,float (*v)[3],int stage){float d[66],out[2][66][3],f;int side[66],front=0,back=0,i,j,count[2]={0};if(stage==6){add(n,v);return;}for(i=0;i<n;i++){d[i]=v[i][0]*clip_[stage][0]+v[i][1]*clip_[stage][1]+v[i][2]*clip_[stage][2];side[i]=d[i]>EPS?1:d[i]<-EPS?-1:0;if(side[i]>0)front=1;if(side[i]<0)back=1;}if(!front||!back){clip(n,v,stage+1);return;}side[n]=side[0];d[n]=d[0];memcpy(v[n],v[0],sizeof(v[0]));for(i=0;i<n;i++){if(side[i]>=0)memcpy(out[0][count[0]++],v[i],sizeof(v[i]));if(side[i]<=0)memcpy(out[1][count[1]++],v[i],sizeof(v[i]));if(side[i]==0||side[i+1]==0||side[i+1]==side[i])continue;f=d[i]/(d[i]-d[i+1]);for(j=0;j<3;j++)out[0][count[0]][j]=out[1][count[1]][j]=v[i][j]+f*(v[i+1][j]-v[i][j]);count[0]++;count[1]++;}clip(count[0],out[0],stage+1);clip(count[1],out[1],stage+1);}
int main(void){int axis,i;float xyz[3],st[2];float poly[5][3]={{10,-2,-1},{10,3,-1},{10,3,4},{10,-2,4}};float tri[66][3]={{-4,-2,1},{4,-2,1},{0,5,2}};for(axis=0;axis<6;axis++){make(.25f,-.5f,axis,xyz,st);for(i=0;i<3;i++)emit(xyz[i]);emit(st[0]);emit(st[1]);}clear();add(4,poly);emit(0);emit(mins_[0][0]);emit(mins_[1][0]);emit(maxs_[0][0]);emit(maxs_[1][0]);clear();clip(3,tri,0);for(axis=0;axis<6;axis++){emit(mins_[0][axis]);emit(mins_[1][axis]);emit(maxs_[0][axis]);emit(maxs_[1][axis]);}/* central upper cloud point */{float z=1024.0f/1.75f,r=4096,h=512,p=(-2*z*r+2*sqrtf(z*z*r*r+2*z*z*r*h+z*z*h*h))/(2*z*z);float vz=z*p+r;emit(p);emit(acosf(0));emit(acosf(0));(void)vz;}return 0;}
