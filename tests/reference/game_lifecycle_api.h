/* SPDX-License-Identifier: GPL-2.0-or-later */
void Cvar_Init(void);
void Cvar_Register(vmCvar_t*,const char*,const char*,int);
void Cvar_Update(vmCvar_t*);
void Cvar_VariableStringBuffer(const char*,char*,int);
int Cvar_VariableIntegerValue(const char*);
extern cvar_t cvar_indexes[];
extern int cvar_numIndexes,cvar_modifiedFlags;
cvar_t *Cvar_Set2(const char*,const char*,qboolean);
cvar_t *lifecycleCollisionCvarGet(const char*,const char*,int);
static int lifecycleOutput,lifecycleSpawnDepth,lifecycleEngineDepth;
static void lifecycleEvent(int,int,int,const char*,const char*);
static void lifecycleConfig(int,const char*);
static void lifecycleCvarSet(const char*,const char*);
void G_SpawnEntitiesFromString(void);
static char *readString(FILE *in);
