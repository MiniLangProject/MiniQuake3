/* Unchanged Baseq3 ai_main.c function bodies below, isolated by typed stubs. */
#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <stdlib.h>
#define MAX_CLIENTS 64
#define MAX_STRING_CHARS 1024
#define qfalse 0
#define qtrue 1
typedef int qboolean;
typedef struct { int areanum,entitynum,flags,iteminfo,number; float origin[3],mins[3],maxs[3]; } bot_goal_t;
typedef struct { int inuse,client,botthink_residual; char teamleader[64]; int lastgoal_decisionmaker,lastgoal_ltgtype,lastgoal_teammate; bot_goal_t lastgoal_teamgoal; } bot_state_t;
static bot_state_t *botstates[MAX_CLIENTS]; static int numbots; static int bot_thinktime_integer;
#define bot_thinktime bot_thinktime_proxy
static struct { int integer; } bot_thinktime_proxy;
static char stored_name[64],stored_value[1024];
static const char *va(const char *fmt,...) { static char b[2][2048]; static int i; char *out=b[(i++)&1]; va_list ap;va_start(ap,fmt);vsnprintf(out,2048,fmt,ap);va_end(ap);return out; }
static void trap_Cvar_Set(const char *name,const char *value) { strcpy(stored_name,name);strcpy(stored_value,value); }
static void trap_Cvar_VariableStringBuffer(const char *name,char *out,int size) { (void)name;strncpy(out,stored_value,(size_t)size);out[size-1]=0; }
static int ClientFromName(const char *name) { return strcmp(name,"Alpha")==0?3:-1; }

int NumBots(void) {
	return numbots;
}

int BotTeamLeader(bot_state_t *bs) {
	int leader;

	leader = ClientFromName(bs->teamleader);
	if (leader < 0) return qfalse;
	if (!botstates[leader] || !botstates[leader]->inuse) return qfalse;
	return qtrue;
}

float AngleDifference(float ang1, float ang2) {
	float diff;

	diff = ang1 - ang2;
	if (ang1 > ang2) {
		if (diff > 180.0) diff -= 360.0;
	}
	else {
		if (diff < -180.0) diff += 360.0;
	}
	return diff;
}

void BotScheduleBotThink(void) {
	int i, botnum;

	botnum = 0;

	for( i = 0; i < MAX_CLIENTS; i++ ) {
		if( !botstates[i] || !botstates[i]->inuse ) {
			continue;
		}
		botstates[i]->botthink_residual = bot_thinktime.integer * botnum / numbots;
		botnum++;
	}
}

void BotWriteSessionData(bot_state_t *bs) {
	const char	*s;
	const char	*var;

	s = va(
			"%i %i %i %i %i %i %i %i"
			" %f %f %f"
			" %f %f %f"
			" %f %f %f",
		bs->lastgoal_decisionmaker,
		bs->lastgoal_ltgtype,
		bs->lastgoal_teammate,
		bs->lastgoal_teamgoal.areanum,
		bs->lastgoal_teamgoal.entitynum,
		bs->lastgoal_teamgoal.flags,
		bs->lastgoal_teamgoal.iteminfo,
		bs->lastgoal_teamgoal.number,
		bs->lastgoal_teamgoal.origin[0],
		bs->lastgoal_teamgoal.origin[1],
		bs->lastgoal_teamgoal.origin[2],
		bs->lastgoal_teamgoal.mins[0],
		bs->lastgoal_teamgoal.mins[1],
		bs->lastgoal_teamgoal.mins[2],
		bs->lastgoal_teamgoal.maxs[0],
		bs->lastgoal_teamgoal.maxs[1],
		bs->lastgoal_teamgoal.maxs[2]
		);

	var = va( "botsession%i", bs->client );

	trap_Cvar_Set( var, s );
}

void BotReadSessionData(bot_state_t *bs) {
	char	s[MAX_STRING_CHARS];
	const char	*var;

	var = va( "botsession%i", bs->client );
	trap_Cvar_VariableStringBuffer( var, s, sizeof(s) );

	sscanf(s,
			"%i %i %i %i %i %i %i %i"
			" %f %f %f"
			" %f %f %f"
			" %f %f %f",
		&bs->lastgoal_decisionmaker,
		&bs->lastgoal_ltgtype,
		&bs->lastgoal_teammate,
		&bs->lastgoal_teamgoal.areanum,
		&bs->lastgoal_teamgoal.entitynum,
		&bs->lastgoal_teamgoal.flags,
		&bs->lastgoal_teamgoal.iteminfo,
		&bs->lastgoal_teamgoal.number,
		&bs->lastgoal_teamgoal.origin[0],
		&bs->lastgoal_teamgoal.origin[1],
		&bs->lastgoal_teamgoal.origin[2],
		&bs->lastgoal_teamgoal.mins[0],
		&bs->lastgoal_teamgoal.mins[1],
		&bs->lastgoal_teamgoal.mins[2],
		&bs->lastgoal_teamgoal.maxs[0],
		&bs->lastgoal_teamgoal.maxs[1],
		&bs->lastgoal_teamgoal.maxs[2]
		);
}

int main(void) {
  bot_state_t a={0},b={0},c={0};int checks=0;
  numbots=3;checks+=(NumBots()==3);
  strcpy(a.teamleader,"Alpha");botstates[3]=&b;b.inuse=1;checks+=BotTeamLeader(&a);b.inuse=0;checks+=!BotTeamLeader(&a);strcpy(a.teamleader,"missing");checks+=!BotTeamLeader(&a);
  checks+=(AngleDifference(10,350)==20);checks+=(AngleDifference(350,10)==-20);checks+=(AngleDifference(180,0)==180);
  a.inuse=b.inuse=c.inuse=1;botstates[0]=&a;botstates[3]=&b;botstates[9]=&c;bot_thinktime.integer=100;numbots=3;BotScheduleBotThink();checks+=(a.botthink_residual==0);checks+=(b.botthink_residual==33);checks+=(c.botthink_residual==66);
  a.client=7;a.lastgoal_decisionmaker=1;a.lastgoal_ltgtype=2;a.lastgoal_teammate=3;a.lastgoal_teamgoal.areanum=4;a.lastgoal_teamgoal.entitynum=5;a.lastgoal_teamgoal.flags=6;a.lastgoal_teamgoal.iteminfo=7;a.lastgoal_teamgoal.number=8;a.lastgoal_teamgoal.origin[0]=1.25f;a.lastgoal_teamgoal.origin[1]=-2.5f;a.lastgoal_teamgoal.origin[2]=3.75f;a.lastgoal_teamgoal.mins[0]=-4;a.lastgoal_teamgoal.mins[1]=-5;a.lastgoal_teamgoal.mins[2]=-6;a.lastgoal_teamgoal.maxs[0]=4;a.lastgoal_teamgoal.maxs[1]=5;a.lastgoal_teamgoal.maxs[2]=6;
  BotWriteSessionData(&a);checks+=(strcmp(stored_name,"botsession7")==0);checks+=(strstr(stored_value,"1 2 3 4 5 6 7 8")==stored_value);checks+=(strstr(stored_value,"1.250000 -2.500000 3.750000")!=NULL);memset(&a.lastgoal_decisionmaker,0,sizeof(a)-((char*)&a.lastgoal_decisionmaker-(char*)&a));a.client=7;BotReadSessionData(&a);checks+=(a.lastgoal_decisionmaker==1&&a.lastgoal_teamgoal.number==8);checks+=(a.lastgoal_teamgoal.origin[1]==-2.5f&&a.lastgoal_teamgoal.maxs[2]==6.0f);
  if(checks!=15){printf("FAIL: %d/15\n",checks);return 1;}puts("PASS: 15 unchanged-C ai_main observations");return 0;
}



