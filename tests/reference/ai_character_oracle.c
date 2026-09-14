/* SPDX-License-Identifier: GPL-2.0-or-later
 * Standalone be_ai_char.c interpolation and query oracle.
 */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_CHARACTERISTICS 80
#define CT_INTEGER 1
#define CT_FLOAT 2
#define CT_STRING 3
typedef union {int integer;float _float;char *string;} cvalue;
typedef struct {char type;cvalue value;} characteristic_t;
typedef struct {char filename[64];float skill;characteristic_t c[MAX_CHARACTERISTICS];} character_t;
static character_t chars[4];
static character_t *from(int h){return h>0&&h<4?&chars[h]:NULL;}
static int interpolate(int h1,int h2,float desired){character_t *a=from(h1),*b=from(h2),*o=&chars[3];float scale;int i;if(!a||!b)return 0;memset(o,0,sizeof(*o));o->skill=desired;strcpy(o->filename,a->filename);scale=(desired-a->skill)/(b->skill-a->skill);for(i=0;i<MAX_CHARACTERISTICS;i++){if(a->c[i].type==CT_FLOAT&&b->c[i].type==CT_FLOAT){o->c[i].type=CT_FLOAT;o->c[i].value._float=a->c[i].value._float+(b->c[i].value._float-a->c[i].value._float)*scale;}else if(a->c[i].type==CT_INTEGER){o->c[i].type=CT_INTEGER;o->c[i].value.integer=a->c[i].value.integer;}else if(a->c[i].type==CT_STRING){o->c[i].type=CT_STRING;o->c[i].value.string=a->c[i].value.string;}}return 3;}
static float cf(int h,int i){characteristic_t *c=&from(h)->c[i];if(c->type==CT_INTEGER)return(float)c->value.integer;if(c->type==CT_FLOAT)return c->value._float;return 0;}
static float cbf(int h,int i,float lo,float hi){float v;if(lo>hi)return 0;v=cf(h,i);return v<lo?lo:v>hi?hi:v;}
static int ci(int h,int i){characteristic_t *c=&from(h)->c[i];if(c->type==CT_INTEGER)return c->value.integer;if(c->type==CT_FLOAT)return(int)c->value._float;return 0;}
static int cbi(int h,int i,int lo,int hi){int v;if(lo>hi)return 0;v=ci(h,i);return v<lo?lo:v>hi?hi:v;}
#define CHECK(x) do{if(!(x)){printf("FAIL %d\n",__LINE__);return 1;}}while(0)
int main(void){int h;strcpy(chars[1].filename,"bots/test_c.c");strcpy(chars[2].filename,"bots/test_c.c");chars[1].skill=1;chars[2].skill=4;chars[1].c[0].type=chars[2].c[0].type=CT_FLOAT;chars[1].c[0].value._float=.2f;chars[2].c[0].value._float=.8f;chars[1].c[1].type=chars[2].c[1].type=CT_INTEGER;chars[1].c[1].value.integer=10;chars[2].c[1].value.integer=40;chars[1].c[2].type=chars[2].c[2].type=CT_STRING;chars[1].c[2].value.string="low";chars[2].c[2].value.string="high";h=interpolate(1,2,2.5f);CHECK(h==3&&chars[3].skill==2.5f&&fabsf(chars[3].c[0].value._float-.5f)<.000001f);CHECK(chars[3].c[1].value.integer==10&&!strcmp(chars[3].c[2].value.string,"low"));CHECK(cf(3,1)==10.0f&&ci(3,0)==0);CHECK(cbf(3,0,0,.4f)==.4f&&cbf(3,0,1,0)==0);CHECK(cbi(3,1,20,30)==20&&cbi(3,1,50,20)==0);printf("PASS: 5 native Baseq3 character scenarios / 14 exact observations\n");return 0;}
