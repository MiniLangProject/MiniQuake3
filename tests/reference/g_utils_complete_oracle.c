/* SPDX-License-Identifier: GPL-2.0-or-later */
/* Selected helpers are compiled directly from the pinned unchanged g_utils.c. */
#include "../../Quake-III-Arena-original-source/code/game/g_utils.c"

level_locals_t level;
gentity_t g_entities[MAX_GENTITIES];
vec3_t vec3_origin;
void QDECL Com_sprintf(char *dest,int size,const char *fmt,...){va_list ap;va_start(ap,fmt);_vsnprintf(dest,size,fmt,ap);dest[size-1]=0;va_end(ap);}
int Q_stricmp(const char *s1,const char *s2){return _stricmp(s1,s2);}
void Q_strcat(char *dest,int size,const char *src){strncat(dest,src,size-strlen(dest)-1);}
void AngleVectors(const vec3_t angles,vec3_t forward,vec3_t right,vec3_t up){
 float angle,sr,sp,sy,cr,cp,cy;
 angle=angles[YAW]*(M_PI*2/360);sy=sin(angle);cy=cos(angle);
 angle=angles[PITCH]*(M_PI*2/360);sp=sin(angle);cp=cos(angle);
 angle=angles[ROLL]*(M_PI*2/360);sr=sin(angle);cr=cos(angle);
 if(forward){forward[0]=cp*cy;forward[1]=cp*sy;forward[2]=-sp;}
 (void)right;(void)up;(void)sr;(void)cr;
}
vec_t VectorNormalize(vec3_t v){double length=sqrt(v[0]*v[0]+v[1]*v[1]+v[2]*v[2]);if(length){double inv=1.0/length;v[0]=(float)(v[0]*inv);v[1]=(float)(v[1]*inv);v[2]=(float)(v[2]*inv);}return (vec_t)length;}
char *QDECL va(char *format,...){static char text[32000];va_list ap;va_start(ap,format);_vsnprintf(text,sizeof(text),format,ap);text[sizeof(text)-1]=0;va_end(ap);return text;}
void BG_AddPredictableEventToPlayerstate(int event,int parm,playerState_t *ps){int slot=ps->eventSequence&1;ps->events[slot]=event;ps->eventParms[slot]=parm;ps->eventSequence++;}
void G_Damage(gentity_t *t,gentity_t *i,gentity_t *a,vec3_t d,vec3_t p,int damage,int flags,int mod){(void)t;(void)i;(void)a;(void)d;(void)p;(void)damage;(void)flags;(void)mod;}
void QDECL G_Printf(const char *fmt,...){(void)fmt;}
void QDECL G_Error(const char *fmt,...){(void)fmt;}
void trap_LocateGameData(gentity_t *e,int n,int se,playerState_t *p,int sp){(void)e;(void)n;(void)se;(void)p;(void)sp;}
void trap_SendServerCommand(int clientNum,const char *text){(void)clientNum;(void)text;}
void trap_SetConfigstring(int num,const char *text){(void)num;(void)text;}
void trap_GetConfigstring(int num,char *buffer,int size){(void)num;if(size)buffer[0]=0;}
void trap_LinkEntity(gentity_t *ent){(void)ent;}
void trap_UnlinkEntity(gentity_t *ent){(void)ent;}
int trap_EntitiesInBox(const vec3_t mins,const vec3_t maxs,int *list,int maxcount){(void)mins;(void)maxs;(void)list;(void)maxcount;return 0;}
int trap_DebugPolygonCreate(int color,int numPoints,vec3_t *points){(void)color;(void)numPoints;(void)points;return 0;}
static unsigned bits(float value){union{float f;unsigned u;}v;v.f=value;return v.u;}
int main(void){
 vec3_t vectors[]={{0,0,0},{1,0,0},{0,1,0},{0,-1,0},{-2,3,7}};size_t i;
 for(i=0;i<sizeof(vectors)/sizeof(vectors[0]);i++)printf("yaw|%u\n",bits(vectoyaw(vectors[i])));
 {vec3_t a={0,-1,0},m={9,9,9};G_SetMovedir(a,m);printf("move|%u|%u|%u|%u\n",bits(m[0]),bits(m[1]),bits(m[2]),bits(a[1]));}
 {vec3_t a={10,20,30},m={0,0,0};G_SetMovedir(a,m);printf("move|%u|%u|%u|%u\n",bits(m[0]),bits(m[1]),bits(m[2]),bits(a[1]));}
 printf("vtos|%s\n",vtos(vectors[4]));
 {float *v=tv(1.25f,-2.5f,3.75f);printf("tv|%u|%u|%u\n",bits(v[0]),bits(v[1]),bits(v[2]));}
 AddRemap("textures/a","textures/b",1.25f);AddRemap("TEXTURES/A","textures/c",2.5f);AddRemap("x","y",0.0f);
 printf("shader|%s\n",BuildShaderStateConfig());
 return 0;
}
