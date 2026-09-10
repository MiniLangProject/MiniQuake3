/* SPDX-License-Identifier: GPL-2.0-or-later
 * Deterministic host for the unchanged Baseq3 g_arenas.c bodies.
 */
#include "../../Quake-III-Arena-original-source/code/game/g_arenas.c"

gentity_t g_entities[MAX_GENTITIES];
gclient_t g_clients[MAX_CLIENTS];
level_locals_t level;
vmCvar_t g_gametype;

static FILE *arena_out;
static int spawn_slot, rank_calls, model_calls, link_count, event_calls;
static int link_slots[8];
static int console_when = -1;
static char console_text[MAX_STRING_CHARS];
static int podium_dist = 80, podium_drop = 70;

static void word(int value) { fwrite(&value, 4, 1, arena_out); }
static void real(float value) { fwrite(&value, 4, 1, arena_out); }
static void vector(const vec3_t value) { real(value[0]); real(value[1]); real(value[2]); }
static void text(const char *value) {
	int i, size = (int)strlen(value); word(size);
	for (i = 0; i < size; ++i) word((unsigned char)value[i]);
}
static int slot_of(gentity_t *ent) { return ent ? (int)(ent - g_entities) : -1; }
static int think_tag(void (*think)(gentity_t *)) {
	if (think == CelebrateStart) return 1;
	if (think == CelebrateStop) return 2;
	if (think == PodiumPlacementThink) return 3;
	return 0;
}

void QDECL G_Error(const char *fmt, ...) { (void)fmt; exit(72); }
void QDECL G_Printf(const char *fmt, ...) { (void)fmt; }
void QDECL Com_Error(int code, const char *fmt, ...) { (void)code; (void)fmt; exit(72); }
void QDECL Com_Printf(const char *fmt, ...) { (void)fmt; }
float vectoyaw(const vec3_t vec) {
	float yaw;
	if (vec[YAW] == 0 && vec[PITCH] == 0) yaw = 0;
	else {
		if (vec[PITCH]) yaw = (float)(atan2(vec[YAW], vec[PITCH]) * 180 / M_PI);
		else if (vec[YAW] > 0) yaw = 90;
		else yaw = 270;
		if (yaw < 0) yaw += 360;
	}
	return yaw;
}
void CalculateRanks(void) {
	int i, playing = 0; rank_calls++; level.numConnectedClients = 0; level.numNonSpectatorClients = 0;
	/* This fixture has descending scores. Preserve the real comparator's only
	 * interesting branch here: spectators sort behind all playing clients. */
	for (i = 0; i < level.maxclients; ++i) if (g_clients[i].pers.connected != CON_DISCONNECTED && g_clients[i].sess.sessionTeam != TEAM_SPECTATOR) {
		level.sortedClients[level.numConnectedClients++] = i; level.numNonSpectatorClients++; playing++;
	}
	for (i = 0; i < level.maxclients; ++i) if (g_clients[i].pers.connected != CON_DISCONNECTED && g_clients[i].sess.sessionTeam == TEAM_SPECTATOR)
		level.sortedClients[level.numConnectedClients++] = i;
	for (i = 0; i < playing; ++i) g_clients[level.sortedClients[i]].ps.persistant[PERS_RANK] = i;
}
gentity_t *G_Spawn(void) {
	gentity_t *ent = &g_entities[spawn_slot++];
	memset(ent, 0, sizeof(*ent)); ent->inuse = qtrue; ent->classname = "noclass";
	ent->s.number = (int)(ent - g_entities); ent->r.ownerNum = ENTITYNUM_NONE;
	if (spawn_slot > level.num_entities) level.num_entities = spawn_slot;
	return ent;
}
int G_ModelIndex(char *name) { model_calls++; return !strcmp(name, SP_PODIUM_MODEL) ? 1 : -1; }
void G_SetOrigin(gentity_t *ent, vec3_t origin) {
	VectorCopy(origin, ent->s.pos.trBase); ent->s.pos.trType = TR_STATIONARY;
	ent->s.pos.trTime = 0; ent->s.pos.trDuration = 0; VectorClear(ent->s.pos.trDelta);
	VectorCopy(origin, ent->r.currentOrigin);
}
void G_AddEvent(gentity_t *ent, int event, int parm) {
	int bits; event_calls++;
	if (ent->client) {
		bits = ((ent->client->ps.externalEvent & EV_EVENT_BITS) + EV_EVENT_BIT1) & EV_EVENT_BITS;
		ent->client->ps.externalEvent = event | bits; ent->client->ps.externalEventParm = parm;
		ent->client->ps.externalEventTime = level.time;
	} else {
		bits = ((ent->s.event & EV_EVENT_BITS) + EV_EVENT_BIT1) & EV_EVENT_BITS;
		ent->s.event = event | bits; ent->s.eventParm = parm;
	}
	ent->eventTime = level.time;
}
int trap_Cvar_VariableIntegerValue(const char *name) {
	if (!strcmp(name, "g_podiumDist")) return podium_dist;
	if (!strcmp(name, "g_podiumDrop")) return podium_drop;
	return 0;
}
void trap_LinkEntity(gentity_t *ent) {
	int i; for (i=0;i<3;i++) {
		ent->r.absmin[i] = ent->r.currentOrigin[i] + ent->r.mins[i] - 1.0f;
		ent->r.absmax[i] = ent->r.currentOrigin[i] + ent->r.maxs[i] + 1.0f;
	}
	link_slots[link_count++] = slot_of(ent);
}
void trap_SendConsoleCommand(int when, const char *text_value) {
	console_when = when; Q_strncpyz(console_text, text_value, sizeof(console_text));
}

static void setup(void) {
	int i; memset(g_entities, 0, sizeof(g_entities)); memset(g_clients, 0, sizeof(g_clients));
	memset(&level, 0, sizeof(level)); memset(link_slots, 0, sizeof(link_slots));
	spawn_slot = level.num_entities = 64; rank_calls = model_calls = link_count = event_calls = 0;
	console_when = -1; console_text[0] = '\0'; podium1 = podium2 = podium3 = NULL;
	g_gametype.integer = GT_SINGLE_PLAYER; level.clients = g_clients; level.maxclients = 3; level.time = 7000;
	VectorSet(level.intermission_origin, 100.25f, -200.5f, 300.75f);
	VectorSet(level.intermission_angle, 13.0f, 91.0f, -7.0f);
	for (i = 0; i < 3; ++i) {
		gentity_t *ent = &g_entities[i]; ent->inuse = qtrue; ent->s.number = i;
		ent->client = &g_clients[i]; g_clients[i].pers.connected = CON_CONNECTED;
		g_clients[i].sess.sessionTeam = TEAM_FREE; Com_sprintf(g_clients[i].pers.netname, MAX_NETNAME, "player%i", i);
		VectorSet(ent->r.mins, -15-i, -16-i, -24-i); VectorSet(ent->r.maxs, 15+i, 16+i, 32+i);
		VectorSet(ent->r.absmin, -20-i, -21-i, -25-i); VectorSet(ent->r.absmax, 20+i, 21+i, 33+i);
		ent->r.ownerNum = 40+i; ent->r.svFlags = 0x10+i; ent->s.weapon = i == 0 ? WP_GAUNTLET : WP_NONE;
		ent->s.eFlags = 0x55+i; ent->s.powerups = 0x66+i; ent->s.loopSound = 70+i; ent->s.event = 80+i;
		level.sortedClients[i] = i; g_clients[i].ps.persistant[PERS_RANK] = i;
		g_clients[i].ps.persistant[PERS_SCORE] = 30-i*7;
	}
	level.numNonSpectatorClients = 3;
}
static void snapshot_entity(int slot) {
	gentity_t *ent = &g_entities[slot]; word(ent->inuse); word(ent->s.number); word(ent->s.eType); word(ent->s.eFlags);
	word(ent->s.powerups); word(ent->s.loopSound); word(ent->s.event); word(ent->s.eventParm); word(ent->s.weapon);
	word(ent->s.legsAnim); word(ent->s.torsoAnim); word(ent->s.modelindex); word(ent->s.groundEntityNum);
	vector(ent->s.pos.trBase); word(ent->s.pos.trType); word(ent->s.pos.trTime); word(ent->s.pos.trDuration); vector(ent->s.pos.trDelta);
	vector(ent->s.apos.trBase); vector(ent->r.currentOrigin); vector(ent->r.mins); vector(ent->r.maxs); vector(ent->r.absmin); vector(ent->r.absmax);
	word(ent->r.svFlags); word(ent->r.contents); word(ent->r.ownerNum); word(ent->clipmask); word(ent->timestamp);
	word(ent->physicsObject); real(ent->physicsBounce); word(ent->takedamage); word(ent->count); word(ent->nextthink); word(think_tag(ent->think));
	word(ent->client ? (int)(ent->client-g_clients) : -1); text(ent->classname ? ent->classname : "");
}
static void finish(int id) {
	int i; word(0x4152454e); word(id); word(rank_calls); word(console_when); text(console_text);
	word(level.num_entities); word(model_calls); word(link_count); for (i=0;i<link_count;i++) word(link_slots[i]);
	word(slot_of(podium1)); word(slot_of(podium2)); word(slot_of(podium3)); word(event_calls);
	for (i=64;i<68;i++) snapshot_entity(i);
	for (i=0;i<3;i++) { word(g_clients[i].ps.externalEvent); word(g_clients[i].ps.externalEventParm); word(g_clients[i].ps.externalEventTime); }
}
int main(int argc, char **argv) {
	int id; if (argc != 3) return 2; id = atoi(argv[1]); arena_out = fopen(argv[2], "wb"); if (!arena_out) return 3; setup();
	if (id == 1) {
		g_clients[0].accuracy_hits=17; g_clients[0].accuracy_shots=23;
		g_clients[0].ps.persistant[PERS_IMPRESSIVE_COUNT]=4; g_clients[0].ps.persistant[PERS_EXCELLENT_COUNT]=5;
		g_clients[0].ps.persistant[PERS_GAUNTLET_FRAG_COUNT]=6; g_clients[0].ps.persistant[PERS_KILLED]=0;
		g_entities[1].r.svFlags |= SVF_BOT; g_entities[2].r.svFlags |= SVF_BOT; UpdateTournamentInfo();
	} else if (id == 2) {
		g_clients[0].sess.sessionTeam=TEAM_SPECTATOR; g_entities[1].r.svFlags |= SVF_BOT; g_entities[2].r.svFlags |= SVF_BOT; UpdateTournamentInfo();
	} else if (id == 3) {
		SpawnModelsOnVictoryPads();
	} else if (id == 4) {
		SpawnModelsOnVictoryPads(); level.time=8100; PodiumPlacementThink(&g_entities[64]); CelebrateStart(podium1);
		level.time += TIMER_GESTURE; CelebrateStop(podium1);
	} else if (id == 5) {
		SpawnModelsOnVictoryPads(); podium1->nextthink=99999; podium1->think=CelebrateStart; level.time=12345; Svcmd_AbortPodium_f();
		g_gametype.integer=GT_FFA; podium1->nextthink=22222; podium1->think=CelebrateStart; Svcmd_AbortPodium_f();
	} else return 4;
	finish(id); fclose(arena_out); return 0;
}
