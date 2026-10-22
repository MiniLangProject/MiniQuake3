/* SPDX-License-Identifier: GPL-2.0-or-later */
/* The functions under test are compiled directly from the pinned unchanged C. */
#include "../../Quake-III-Arena-original-source/code/game/g_team.c"

level_locals_t level;
gentity_t g_entities[MAX_GENTITIES];
vmCvar_t g_gametype, g_maxclients;
vec3_t vec3_origin;
void QDECL Com_sprintf(char *dest, int size, const char *fmt, ...) { va_list ap; va_start(ap, fmt); _vsnprintf(dest, size, fmt, ap); va_end(ap); }
char *QDECL va(char *format, ...) { static char buffer[1024]; va_list ap; va_start(ap, format); _vsnprintf(buffer, sizeof(buffer), format, ap); va_end(ap); return buffer; }
void RespawnItem(gentity_t *ent) { (void)ent; }
gentity_t *G_Find(gentity_t *from, int fieldofs, const char *match) { (void)from; (void)fieldofs; (void)match; return NULL; }
gentity_t *G_TempEntity(vec3_t origin, int event) { (void)origin; (void)event; return &g_entities[0]; }
void G_FreeEntity(gentity_t *ent) { (void)ent; }
gentity_t *SelectSpawnPoint(vec3_t avoid, vec3_t origin, vec3_t angles) { (void)avoid; (void)origin; (void)angles; return NULL; }
void AddScore(gentity_t *ent, vec3_t origin, int score) { (void)ent; (void)origin; (void)score; }
void CalculateRanks(void) {}
qboolean SpotWouldTelefrag(gentity_t *spot) { (void)spot; return qfalse; }
void QDECL G_Printf(const char *fmt, ...) { (void)fmt; }
void QDECL G_Error(const char *fmt, ...) { (void)fmt; }
void trap_SendServerCommand(int clientNum, const char *text) { (void)clientNum; (void)text; }
void trap_SetConfigstring(int num, const char *string) { (void)num; (void)string; }
qboolean trap_InPVS(const vec3_t p1, const vec3_t p2) { (void)p1; (void)p2; return qtrue; }

int main(void) {
    int values[] = { TEAM_FREE, TEAM_RED, TEAM_BLUE, TEAM_SPECTATOR, -1, 99 };
    int clients[] = { 63, 1, 31, 0, -1, 999 };
    size_t i;
    for (i = 0; i < sizeof(values) / sizeof(values[0]); ++i) {
        int team = values[i];
        printf("team %d %d %s %s %s\n", team, OtherTeam(team), TeamName(team),
               OtherTeamName(team), TeamColorString(team));
    }
    qsort(clients, sizeof(clients) / sizeof(clients[0]), sizeof(clients[0]), SortClients);
    printf("sort");
    for (i = 0; i < sizeof(clients) / sizeof(clients[0]); ++i) printf(" %d", clients[i]);
    printf("\n");
    return 0;
}
