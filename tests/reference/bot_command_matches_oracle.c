#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define MAX_CLIENTS 64
#define MAX_INFO_STRING 1024
typedef float vec3_t[3];
static const char *names[MAX_CLIENTS];
static int maxclients=4;
static int Q_stricmp(const char*a,const char*b){return _stricmp(a,b);}
static char *stristr(const char*s,const char*f){size_t n=strlen(f);for(;*s;s++)if(!_strnicmp(s,f,n))return(char*)s;return NULL;}
static void ClientName(int i,char*b,int n){snprintf(b,n,"%s",names[i]?names[i]:"");}
static int trap_Cvar_VariableIntegerValue(const char*x){(void)x;return maxclients;}
static void BotAI_Print(int x,const char*f,...){(void)x;(void)f;}

/* Unchanged bodies from code/game/ai_cmd.c, with only linkage made static. */
static int FindClientByName(char *name) {
	int i; char buf[MAX_INFO_STRING]; static int maxclients;
	if (!maxclients) maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) { ClientName(i, buf, sizeof(buf)); if (!Q_stricmp(buf, name)) return i; }
	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) { ClientName(i, buf, sizeof(buf)); if (stristr(buf, name)) return i; }
	return -1;
}
static int BotGPSToPosition(char *buf, vec3_t position) {
	int i, j = 0; int num, sign;
	for (i = 0; i < 3; i++) { num = 0; while(buf[j] == ' ') j++; if (buf[j] == '-') { j++; sign = -1; } else { sign = 1; }
		while (buf[j]) { if (buf[j] >= '0' && buf[j] <= '9') { num = num * 10 + buf[j] - '0'; j++; } else { j++; break; } }
		BotAI_Print(0, "%d\n", sign * num); position[i] = (float) sign * num; }
	return 1;
}
int main(void){vec3_t p;names[0]="Ranger";names[1]="Major Tom";names[2]="Sarge";names[3]="";
 printf("find=%d,%d,%d,%d\n",FindClientByName("Sarge"),FindClientByName("major"),FindClientByName("Rang"),FindClientByName("Xaero"));
 BotGPSToPosition(" -12 34 005",p);printf("gps=%.0f,%.0f,%.0f\n",p[0],p[1],p[2]);
 BotGPSToPosition("1,-2;3",p);printf("punct=%.0f,%.0f,%.0f\n",p[0],p[1],p[2]);return 0;}
