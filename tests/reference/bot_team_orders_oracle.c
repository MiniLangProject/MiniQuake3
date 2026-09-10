#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#define MAX_MESSAGE_SIZE 256
#define MAX_NETNAME 36
#define CMS_CHAT 1
#define CHAT_TELL 2
#define EC "\x19"
typedef struct { int client,cs; } bot_state_t;
static char names[64][MAX_NETNAME];
static void trap_BotGetChatMessage(int cs,char *buf,int size){printf("get:%d\n",cs);strncpy(buf,"defend",(size_t)size);buf[size-1]=0;}
static void ClientName(int client,char *name,int size){strncpy(name,names[client],(size_t)size);name[size-1]=0;}
static int Com_sprintf(char *dest,int size,const char *fmt,...){int n;va_list ap;va_start(ap,fmt);n=vsnprintf(dest,(size_t)size,fmt,ap);va_end(ap);return n;}
static void trap_BotQueueConsoleMessage(int cs,int kind,const char *text){printf("queue:%d:%d:%s\n",cs,kind,text);}
static void trap_BotEnterChat(int cs,int client,int kind){printf("enter:%d:%d:%d\n",cs,client,kind);}
#include "bot_team_orders_under_test.inc"
int main(void){bot_state_t bs={3,17};strcpy(names[3],"Ranger");BotSayTeamOrderAlways(&bs,3);BotSayTeamOrderAlways(&bs,5);BotSayTeamOrder(&bs,3);BotSayTeamOrder(&bs,5);BotVoiceChat(&bs,-1,"yes");BotVoiceChatOnly(&bs,2,"no");BotSayVoiceTeamOrder(&bs,1,"attack");puts("voice-events=0");return 0;}
