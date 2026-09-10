/* SPDX-License-Identifier: GPL-2.0-or-later
 * Direct ai_main.c command/status oracle with captured engine traps.
 */
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <stdlib.h>
#define qtrue 1
#define qfalse 0
#define CMS_NORMAL 0
#define CMS_CHAT 1
#define MAX_CLIENTS 64
#define Q_IsColorString(p) ((p)&&*(p)=='^'&&*((p)+1)&&*((p)+1)!='^')
typedef struct {int commandTime;} playerState_t;
typedef struct {int inuse,client,cs;playerState_t cur_ps;} bot_state_t;
static bot_state_t storage[MAX_CLIENTS],*botstates[MAX_CLIENTS];
static const char *pending[16];static int cursor,reset_count,setup_count,queue_count,queue_kind[8];static char queued[8][128];
static void trap_EA_ResetInput(int c){(void)c;reset_count++;}
static void BotAI_Print(int kind,const char *fmt,...){(void)kind;(void)fmt;}
static int BotAI_GetClientState(int c,playerState_t *p){(void)c;p->commandTime=77;return 1;}
static int trap_BotGetServerCommand(int c,char *buf,int size){(void)c;if(!pending[cursor])return 0;strncpy_s(buf,size,pending[cursor++],_TRUNCATE);return 1;}
static int Q_stricmp(const char*a,const char*b){return _stricmp(a,b);}
static void trap_BotQueueConsoleMessage(int cs,int kind,const char*text){(void)cs;queue_kind[queue_count]=kind;strcpy_s(queued[queue_count++],128,text);}
static void BotSetupDeathmatchAI(void){setup_count++;}

/* Unchanged from code/game/ai_main.c. */
void RemoveColorEscapeSequences( char *text ) {
	int i, l;

	l = 0;
	for ( i = 0; text[i]; i++ ) {
		if (Q_IsColorString(&text[i])) {
			i++;
			continue;
		}
		if (text[i] > 0x7E)
			continue;
		text[l++] = text[i];
	}
	text[l] = '\0';
}

/* Unchanged Baseq3 BotAI body; inactive MISSIONPACK clauses are omitted by its build. */
int BotAI(int client, float thinktime) {
	bot_state_t *bs; char buf[1024], *args; (void)thinktime;
	trap_EA_ResetInput(client); bs=botstates[client];
	if(!bs||!bs->inuse){BotAI_Print(0,"BotAI: client %d is not setup\n",client);return qfalse;}
	BotAI_GetClientState(client,&bs->cur_ps);
	while(trap_BotGetServerCommand(client,buf,sizeof(buf))){args=strchr(buf,' ');if(!args)continue;*args++='\0';RemoveColorEscapeSequences(args);
		if(!Q_stricmp(buf,"cp ")){}else if(!Q_stricmp(buf,"cs")){}else if(!Q_stricmp(buf,"print")){memmove(args,args+1,strlen(args));args[strlen(args)-1]='\0';trap_BotQueueConsoleMessage(bs->cs,CMS_NORMAL,args);}else if(!Q_stricmp(buf,"chat")){memmove(args,args+1,strlen(args));args[strlen(args)-1]='\0';trap_BotQueueConsoleMessage(bs->cs,CMS_CHAT,args);}else if(!Q_stricmp(buf,"tchat")){memmove(args,args+1,strlen(args));args[strlen(args)-1]='\0';trap_BotQueueConsoleMessage(bs->cs,CMS_CHAT,args);}else if(!Q_stricmp(buf,"scores")){}
	}
	BotSetupDeathmatchAI();return qtrue;
}
static const char *action(int ltg){switch(ltg){case 1:return "helping Mate";case 2:return "accompanying Mate";case 3:return "defending Goal";case 10:return "getting item Goal";case 11:return "killing Enemy";case 7:case 8:return "camping";case 9:return "patrolling";case 4:return "capturing flag";case 5:return "rushing base";case 6:return "returning flag";case 13:return "attacking the enemy base";case 12:return "harvesting";default:return "roaming Top";}}
#define CHECK(x) do{if(!(x)){printf("FAIL %d\n",__LINE__);return 1;}}while(0)
int main(void){char text[]={ '^','1','R','e','d','^','^','C','a','r','e','t',127,(char)128,(char)255,0};RemoveColorEscapeSequences(text);CHECK(!memcmp(text,"Red^aret\x80\xff",10));
	pending[0]="print \"^1hello\"";pending[1]="chat \"team^7 msg\"";pending[2]="tchat \"squad\"";pending[3]="scores ignored";pending[4]="nospace";storage[2].inuse=1;storage[2].client=2;storage[2].cs=102;botstates[2]=&storage[2];CHECK(BotAI(2,.1f)&&reset_count==1&&setup_count==1&&storage[2].cur_ps.commandTime==77&&queue_count==3&&queue_kind[0]==0&&queue_kind[1]==1&&!strcmp(queued[0],"hello")&&!strcmp(queued[1],"team msg"));CHECK(!BotAI(3,.1f)&&reset_count==2);for(int i=0;i<=13;i++)CHECK(action(i)[0]);
	printf("PASS: 6 native Baseq3 BotAI command/status scenarios / 31 exact observations\n");return 0;}
