/* SPDX-License-Identifier: GPL-2.0-or-later
 * Direct unchanged-g_bot.c differential for the two helpers that were not
 * covered by the existing registry/client/population oracles. */
#include "../../Quake-III-Arena-original-source/code/game/g_bot.c"

gentity_t g_entities[MAX_GENTITIES];
gclient_t g_clients[MAX_CLIENTS];
level_locals_t level;
vmCvar_t g_gametype, g_maxclients, g_spSkill;
gentity_t *podium1, *podium2, *podium3;
static char cvar_text[128];

void QDECL G_Printf(const char *fmt, ...) { (void)fmt; }
void QDECL Com_Printf(const char *fmt, ...) { (void)fmt; }
void QDECL G_Error(const char *fmt, ...) { (void)fmt; exit(71); }
void QDECL Com_Error(int code, const char *fmt, ...) { (void)code; (void)fmt; exit(72); }
void *G_Alloc(int size) { return calloc(1, (size_t)size); }
void trap_Printf(const char *fmt) { (void)fmt; }
int trap_FS_FOpenFile(const char *qpath, fileHandle_t *f, fsMode_t mode) { (void)qpath;(void)mode;*f=0;return -1; }
void trap_FS_Read(void *buffer, int len, fileHandle_t f) { (void)buffer;(void)len;(void)f; }
void trap_FS_FCloseFile(fileHandle_t f) { (void)f; }
int trap_FS_GetFileList(const char *path,const char *ext,char *buf,int size) { (void)path;(void)ext;(void)buf;(void)size;return 0; }
void trap_Cvar_Register(vmCvar_t *c,const char *n,const char *v,int f) { (void)c;(void)n;(void)v;(void)f; }
int trap_Cvar_VariableIntegerValue(const char *name) { (void)name; return 1; }
void trap_Cvar_VariableStringBuffer(const char *name,char *buffer,int size) { (void)name; Q_strncpyz(buffer,cvar_text,size); }
team_t PickTeam(int ignore) { (void)ignore; return TEAM_FREE; }
char *ClientConnect(int num,qboolean first,qboolean bot) { (void)num;(void)first;(void)bot;return NULL; }
void ClientBegin(int num) { (void)num; }
int BotAISetupClient(int client,struct bot_settings_s *settings,qboolean restart) { (void)client;(void)settings;(void)restart;return qtrue; }
void trap_Argv(int n,char *buffer,int size) { (void)n;if(size)buffer[0]=0; }
void trap_SendConsoleCommand(int when,const char *text) { printf("cmd:%d:%s",when,text); }
void trap_Cvar_Update(vmCvar_t *c) { (void)c; }
void trap_Cvar_Set(const char *name,const char *value) { (void)name;(void)value; }
void trap_DropClient(int num,const char *reason) { (void)num;(void)reason; }
void trap_SendServerCommand(int num,const char *text) { (void)num;(void)text; }
void trap_GetUserinfo(int num,char *buffer,int size) { (void)num;if(size)buffer[0]=0; }
void trap_SetUserinfo(int num,const char *buffer) { (void)num;(void)buffer; }
void trap_GetServerinfo(char *buffer,int size) { if(size)buffer[0]=0; }
int trap_BotAllocateClient(void) { return -1; }

int main(void) {
  strcpy(cvar_text," -12.75junk");
  printf("value:%.2f\n",(double)trap_Cvar_VariableValue("test"));
  PlayerIntroSound("sarge/default");
  PlayerIntroSound("models/players/visor/blue");
  PlayerIntroSound("major");
  return 0;
}
