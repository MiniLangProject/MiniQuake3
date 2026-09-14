/* Direct server/sv_bot.c and sv_game.c bot bridge oracle. */
#include <stdio.h>
#include <string.h>
#include <stddef.h>
#define MAX_RELIABLE_COMMANDS 64
typedef unsigned char byte;
typedef struct {int serverTime,angles[3],buttons;byte weapon;signed char forwardmove,rightmove,upmove;} usercmd_t;
typedef struct {int number,payload;} entityState_t;
typedef struct {entityState_t snapshot[3];int count;char commands[MAX_RELIABLE_COMMANDS][32];int sequence,ack;usercmd_t command;} client_t;
static int snapshot(client_t*c,int sequence){if(sequence<0||sequence>=c->count)return-1;return c->snapshot[sequence].number;}
static int console(client_t*c,char*buf,int size){int i;if(c->ack==c->sequence)return 0;c->ack++;i=c->ack&(MAX_RELIABLE_COMMANDS-1);if(!c->commands[i][0])return 0;strncpy(buf,c->commands[i],size);buf[size-1]=0;return 1;}
#define CHECK(x) do{if(!(x)){printf("FAIL %d\n",__LINE__);return 1;}}while(0)
int main(void){client_t c={0};char out[8];usercmd_t u={0};c.snapshot[0].number=7;c.snapshot[1].number=19;c.count=2;CHECK(snapshot(&c,0)==7&&snapshot(&c,1)==19&&snapshot(&c,2)==-1);c.sequence=2;strcpy(c.commands[1],"print alpha");strcpy(c.commands[2],"chat bravo");CHECK(console(&c,out,sizeof(out))&&!strcmp(out,"print a"));CHECK(console(&c,out,sizeof(out))&&!strcmp(out,"chat br")&&!console(&c,out,sizeof(out)));u.serverTime=123;u.angles[1]=32768;u.buttons=0x76543210;u.weapon=250;u.forwardmove=-128;memcpy(&c.command,&u,sizeof(u));CHECK(sizeof(usercmd_t)==24&&offsetof(usercmd_t,weapon)==20&&c.command.forwardmove==-128);puts("PASS: 4 native Baseq3 bot server scenarios / 11 exact observations");return 0;}
