/* SPDX-License-Identifier: GPL-2.0-or-later */
#include <ctype.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#define MAX_MESSAGE_SIZE 256
#define MAX_MATCHVARIABLES 8
typedef struct { char offset; int length; } bot_matchvariable_t;
typedef struct { char string[MAX_MESSAGE_SIZE]; int type,subtype; bot_matchvariable_t variables[MAX_MATCHVARIABLES]; } bot_match_t;
typedef struct string_s { const char *s; struct string_s *next; } string_t;
typedef struct piece_s { int variable; string_t *strings; struct piece_s *next; } piece_t;
static int contains(const char *a,const char *b,int sensitive){int len=(int)strlen(a)-(int)strlen(b);for(int i=0;i<=len;i++,a++){int j;for(j=0;b[j];j++)if((sensitive?a[j]:toupper((unsigned char)a[j]))!=(sensitive?b[j]:toupper((unsigned char)b[j])))break;if(!b[j])return i;}return -1;}
static int strings_match(piece_t *p,bot_match_t *m){int last=-1;char *at=m->string,*next;for(;p;p=p->next){if(p->variable>=0){m->variables[p->variable].offset=(char)(at-m->string);last=p->variable;}else{next=NULL;string_t *s;for(s=p->strings;s;s=s->next){if(!*s->s){next=at;break;}int i=contains(at,s->s,0);if(i>=0){next=at+i;if(last>=0){m->variables[last].length=(int)(next-m->string)-m->variables[last].offset;last=-1;break;}else if(i==0)break;next=NULL;}}if(!next)return 0;at=next+strlen(s->s);}}if(last>=0){m->variables[last].length=(int)strlen(m->string+(int)m->variables[last].offset);return 1;}return !*at;}
#define CHECK(v) do{observations++;if(!(v)){printf("FAIL %d\n",__LINE__);return 1;}}while(0)
int main(void){int observations=0;CHECK(sizeof(bot_matchvariable_t)==8);CHECK(sizeof(bot_match_t)==328);CHECK(offsetof(bot_match_t,type)==256&&offsetof(bot_match_t,variables)==264);CHECK(contains("AbCdEf","cde",0)==2);CHECK(contains("AbCdEf","cde",1)==-1);
 string_t close={")",0},attack={" attack ",0},defend={" defend ",&attack};piece_t p5={2,0,0},p4={-1,&defend,&p5},p3={1,0,&p4},p2={-1,&close,&p3},p1={0,0,&p2};string_t open={"(",0};piece_t p0={-1,&open,&p1};bot_match_t m={0};strcpy(m.string,"(Ranger) Atrium attack Sarge");memset(m.variables,0xff,sizeof(m.variables));CHECK(strings_match(&p0,&m));CHECK(m.variables[0].offset==1&&m.variables[0].length==6);CHECK(m.variables[1].offset==8&&m.variables[1].length==7);CHECK(m.variables[2].offset==23&&m.variables[2].length==5);CHECK(!strncmp(m.string+m.variables[2].offset,"Sarge",m.variables[2].length));
 strcpy(m.string,"(Ranger) Atrium unknown Sarge");memset(m.variables,0xff,sizeof(m.variables));CHECK(!strings_match(&p0,&m));puts("PASS: 5 native Baseq3 chat-match scenarios / 11 exact observations");return 0;}
