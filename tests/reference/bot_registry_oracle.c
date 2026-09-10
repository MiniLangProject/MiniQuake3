/* SPDX-License-Identifier: GPL-2.0-or-later
 * Differential host for the unchanged Baseq3 registry bodies in g_bot.c.
 */
#include "../../Quake-III-Arena-original-source/code/game/g_bot.c"

gentity_t g_entities[MAX_GENTITIES];
gclient_t g_clients[MAX_CLIENTS];
level_locals_t level;
vmCvar_t g_gametype, g_maxclients, g_spSkill;
gentity_t *podium1, *podium2, *podium3;

typedef struct { const char *name; const char *body; } fixture_file_t;
static fixture_file_t files[8];
static int file_count, open_file, print_count;
static const char *bot_names[8], *arena_names[8];
static int bot_name_count, arena_name_count;
static char prints[32][2048];
static const char *bots_cvar, *arenas_cvar;
static FILE *output_file;

static void word(int value) { fwrite(&value, 4, 1, output_file); }
static void text(const char *value) {
	int i, size;
	if (!value) { word(-1); return; }
	size = (int)strlen(value); word(size);
	for (i = 0; i < size; ++i) word((unsigned char)value[i]);
}
static void snapshot(int id, const char *lookup1, const char *lookup2) {
	int i; word(0x42524547); word(id); word(print_count);
	for (i = 0; i < print_count; ++i) text(prints[i]);
	word(g_numBots); for (i = 0; i < g_numBots; ++i) text(g_botInfos[i]);
	word(g_numArenas); for (i = 0; i < g_numArenas; ++i) text(g_arenaInfos[i]);
	text(lookup1); text(lookup2);
}
static void add_file(const char *name, const char *body) {
	files[file_count].name = name; files[file_count].body = body; file_count++;
}
static void append_print(const char *message) {
	Q_strncpyz(prints[print_count], message, sizeof(prints[print_count])); print_count++;
}

void QDECL G_Printf(const char *fmt, ...) {
	char message[2048]; va_list ap; va_start(ap, fmt); vsprintf(message, fmt, ap); va_end(ap); append_print(message);
}
void QDECL Com_Printf(const char *fmt, ...) {
	char message[2048]; va_list ap; va_start(ap, fmt); vsprintf(message, fmt, ap); va_end(ap); append_print(message);
}
void QDECL G_Error(const char *fmt, ...) { (void)fmt; exit(71); }
void QDECL Com_Error(int code, const char *fmt, ...) { (void)code; (void)fmt; exit(72); }
void *G_Alloc(int size) { void *p = calloc(1, (size_t)size); if (!p) exit(73); return p; }
void trap_Printf(const char *fmt) { append_print(fmt); }

int trap_FS_FOpenFile(const char *qpath, fileHandle_t *f, fsMode_t mode) {
	int i; (void)mode; *f = 0;
	for (i = 0; i < file_count; ++i) if (!strcmp(files[i].name, qpath)) {
		open_file = i; *f = 1; return (int)strlen(files[i].body);
	}
	return -1;
}
void trap_FS_Read(void *buffer, int len, fileHandle_t f) { (void)f; memcpy(buffer, files[open_file].body, (size_t)len); }
void trap_FS_FCloseFile(fileHandle_t f) { (void)f; }
int trap_FS_GetFileList(const char *path, const char *extension, char *listbuf, int bufsize) {
	const char **names; int count, i, used = 0; (void)path;
	if (!strcmp(extension, ".bot")) { names = bot_names; count = bot_name_count; }
	else { names = arena_names; count = arena_name_count; }
	for (i = 0; i < count; ++i) {
		int size = (int)strlen(names[i]) + 1; if (used + size > bufsize) break;
		memcpy(listbuf + used, names[i], (size_t)size); used += size;
	}
	return i;
}
void trap_Cvar_Register(vmCvar_t *cvar, const char *name, const char *value, int flags) {
	const char *chosen = value; (void)flags;
	if (!strcmp(name, "g_botsFile") && bots_cvar) chosen = bots_cvar;
	if (!strcmp(name, "g_arenasFile") && arenas_cvar) chosen = arenas_cvar;
	Q_strncpyz(cvar->string, chosen, sizeof(cvar->string)); cvar->integer = atoi(chosen); cvar->value = (float)atof(chosen);
}
int trap_Cvar_VariableIntegerValue(const char *name) { return !strcmp(name, "bot_enable") ? 1 : 0; }
void trap_Cvar_VariableStringBuffer(const char *name, char *buffer, int bufsize) { (void)name; Q_strncpyz(buffer, "0", bufsize); }
team_t PickTeam(int ignoreClientNum) { (void)ignoreClientNum; return TEAM_FREE; }
char *ClientConnect(int clientNum, qboolean firstTime, qboolean isBot) { (void)clientNum; (void)firstTime; (void)isBot; return NULL; }
void ClientBegin(int clientNum) { (void)clientNum; }
int BotAISetupClient(int client, struct bot_settings_s *settings, qboolean restart) { (void)client; (void)settings; (void)restart; return qtrue; }
void trap_Argv(int n, char *buffer, int bufferLength) { (void)n; if (bufferLength) buffer[0] = 0; }
void trap_SendConsoleCommand(int exec_when, const char *text) { (void)exec_when; (void)text; }
void trap_Cvar_Update(vmCvar_t *cvar) { (void)cvar; }
void trap_Cvar_Set(const char *name, const char *value) { (void)name; (void)value; }
void trap_DropClient(int clientNum, const char *reason) { (void)clientNum; (void)reason; }
void trap_SendServerCommand(int clientNum, const char *text) { (void)clientNum; (void)text; }
void trap_GetUserinfo(int num, char *buffer, int bufferSize) { (void)num; if (bufferSize) buffer[0] = 0; }
void trap_SetUserinfo(int num, const char *buffer) { (void)num; (void)buffer; }
void trap_GetServerinfo(char *buffer, int bufferSize) { if (bufferSize) buffer[0] = 0; }
int trap_BotAllocateClient(void) { return -1; }

int main(int argc, char **argv) {
	int id; char *parsed[4] = {0}; char *large; const char *a = NULL, *b = NULL;
	if (argc != 3) return 2; id = atoi(argv[1]); output_file = fopen(argv[2], "wb"); if (!output_file) return 3;
	if (id == 1) {
		char input[] = "{ first one second two } { name \"Line Value\" }";
		g_numBots = G_ParseInfos(input, 4, g_botInfos); a = G_GetBotInfoByName("line value"); b = G_GetBotInfoByNumber(0);
	} else if (id == 2) {
		char input[] = "{ key\nnext value } { ignored yes }";
		g_numBots = G_ParseInfos(input, 1, g_botInfos); a = G_GetBotInfoByName("missing"); b = G_GetBotInfoByNumber(1);
	} else if (id == 3) {
		add_file("scripts/bots.txt", "{ name Sarge model sarge/default }"); add_file("scripts/extra.bot", "{ name \"Major Major\" }");
		add_file("scripts/arenas.txt", "{ map q3dm1 longname \"Arena Gate\" }"); add_file("scripts/bonus.arena", "{ map q3dm2 type ffa }");
		bot_names[0] = "extra.bot"; bot_name_count = 1; arena_names[0] = "bonus.arena"; arena_name_count = 1;
		G_LoadBots(); G_LoadArenas(); a = G_GetBotInfoByName("MAJOR MAJOR"); b = G_GetArenaInfoByMap("Q3DM2");
	} else if (id == 4) {
		bots_cvar = "custom.cfg"; arenas_cvar = "maps.cfg";
		add_file("custom.cfg", "{ name Custom } { name Second }"); add_file("maps.cfg", "{ map custom fraglimit 7 }");
		G_LoadBots(); G_LoadArenas(); a = G_GetBotInfoByNumber(-1); b = G_GetArenaInfoByMap("CUSTOM");
	} else if (id == 5) {
		large = (char *)malloc(MAX_BOTS_TEXT + 1); memset(large, 'A', MAX_BOTS_TEXT); large[MAX_BOTS_TEXT] = 0;
		add_file("huge.bot", large); g_numBots = 0; G_LoadBotsFromFile("huge.bot"); G_LoadBotsFromFile("missing.bot");
	} else return 4;
	snapshot(id, a, b); fclose(output_file); return 0;
}
