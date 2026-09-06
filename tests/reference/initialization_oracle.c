/* SPDX-License-Identifier: GPL-2.0-or-later
 * Fixtures and host delivery for unchanged Baseq3 map-initialization bodies.
 * No entity grouping, item registration or team initialization is stubbed.
 */
#include "g_local.h"
gentity_t g_entities[MAX_GENTITIES];
gclient_t g_clients[MAX_CLIENTS];
level_locals_t level;
vmCvar_t g_gametype;
qboolean itemRegistered[MAX_ITEMS];
#include "initialization_team_state.inc"
static FILE *out, *raw;
static int normalizationCount, initializationDepth;
static char configs[MAX_CONFIGSTRINGS][1024];
static void initWord(int value){fwrite(&value,4,1,out);}
static void initText(const char *text){int n=text?(int)strlen(text):-1;initWord(n);if(n>0)fwrite(text,1,n,out);}
static void initializationSnapshot(void){
    int i;initWord(700);initWord(level.num_entities);initWord(g_gametype.integer);
    fwrite(&teamgame,4,9,out);fwrite(level.teamScores,4,4,out);fwrite(itemRegistered,4,MAX_ITEMS,out);
    initText(configs[CS_FLAGSTATUS]);initText(configs[CS_ITEMS]);
    for(i=0;i<level.num_entities;i++){
        gentity_t *e=&g_entities[i];initWord(e->inuse);initWord(e->flags);
        initWord(e->teammaster?(int)(e->teammaster-g_entities):-1);initWord(e->teamchain?(int)(e->teamchain-g_entities):-1);
        initWord(e->health);initWord(e->count);initWord(e->s.number);
        initText(e->team);initText(e->targetname);initText(e->classname);
    }
}
void QDECL G_Printf(const char *format,...){
    char text[4096];va_list args;va_start(args,format);vsnprintf(text,sizeof(text),format,args);va_end(args);
    initializationSnapshot();initWord(710);initText(text);
}
void QDECL G_Error(const char *format,...){
    va_list args;initializationSnapshot();initWord(799);va_start(args,format);vfprintf(stderr,format,args);va_end(args);exit(72);
}
void QDECL Com_Error(int code,const char *format,...){
    va_list args;initializationSnapshot();initWord(799);va_start(args,format);vfprintf(stderr,format,args);va_end(args);exit(72);
}
void QDECL Com_Printf(const char *format,...){(void)format;}
void trap_SetConfigstring(int index,const char *value){
    int normalized=initializationDepth && index==CS_FLAGSTATUS && g_gametype.integer==GT_CTF
        && teamgame.redStatus==FLAG_ATBASE && teamgame.blueStatus==-1;
    if(index<0 || index>=MAX_CONFIGSTRINGS)exit(74);
    if(normalized){
        /* The unchanged first CTF call reads ctfFlagStatusRemap[-1].
         * Archive its raw 3-byte stack string before defining that byte as NUL
         * at the host boundary. The guaranteed red prefix is never masked. */
        if(value[0]!='0' || value[2]!=0)exit(74);
        fprintf(raw,"{\"normalization\":%d,\"raw_hex\":\"%02x%02x%02x\",\"red\":%d,\"blue\":%d}\n",
            ++normalizationCount,(unsigned char)value[0],(unsigned char)value[1],(unsigned char)value[2],
            teamgame.redStatus,teamgame.blueStatus);
        value="0";
    }
    Q_strncpyz(configs[index],value,sizeof(configs[index]));
    initializationSnapshot();initWord(711);initWord(index);initWord(normalized);initText(value);
}
#include "initialization_functions.inc"
static int initializationReadInt(FILE *in){int v;if(fread(&v,4,1,in)!=1)exit(74);return v;}
static char *initializationReadText(FILE *in){
    int n=initializationReadInt(in);char *value;if(n==-1)return NULL;if(n<0 || n>4095)exit(74);
    value=calloc(1,n+1);if(!value || fread(value,1,n,in)!=n)exit(74);return value;
}
static gentity_t *initializationPointer(int slot){if(slot < -1 || slot>=MAX_GENTITIES)exit(74);return slot<0?NULL:&g_entities[slot];}
int main(int argc,char **argv){
    FILE *in;int i,count,kind,a,b,c;char *text;
    if(argc!=4 || !(in=fopen(argv[1],"rb")) || !(out=fopen(argv[2],"wb")) || !(raw=fopen(argv[3],"wb")))return 2;
    if(sizeof(teamgame)!=36 || bg_numItems!=36)return 3;
    level.num_entities=initializationReadInt(in);g_gametype.integer=initializationReadInt(in);
    if(level.num_entities<0 || level.num_entities>MAX_GENTITIES)exit(74);
    if(fread(&teamgame,4,9,in)!=9 || fread(level.teamScores,4,4,in)!=4 || fread(itemRegistered,4,MAX_ITEMS,in)!=MAX_ITEMS)exit(74);
    text=initializationReadText(in);Q_strncpyz(configs[CS_FLAGSTATUS],text,sizeof(configs[0]));free(text);
    text=initializationReadText(in);Q_strncpyz(configs[CS_ITEMS],text,sizeof(configs[0]));free(text);
    for(i=0;i<level.num_entities;i++){
        gentity_t *e=&g_entities[i];e->inuse=initializationReadInt(in);e->flags=initializationReadInt(in);
        e->teammaster=initializationPointer(initializationReadInt(in));e->teamchain=initializationPointer(initializationReadInt(in));
        e->health=initializationReadInt(in);e->count=initializationReadInt(in);e->s.number=initializationReadInt(in);
        e->team=initializationReadText(in);e->targetname=initializationReadText(in);e->classname=initializationReadText(in);
    }
    count=initializationReadInt(in);if(count<1)exit(74);
    while(count--){
        kind=initializationReadInt(in);a=initializationReadInt(in);b=initializationReadInt(in);c=initializationReadInt(in);text=initializationReadText(in);
        switch(kind){
        case 1:G_FindTeams();break;
        case 2:ClearRegisteredItems();break;
        case 3:if(a < -1 || a>36)exit(74);RegisterItem(a<0?NULL:bg_itemlist+a);break;
        case 4:SaveRegisteredItems();break;
        case 5:initializationDepth++;Team_InitGame();initializationDepth--;break;
        case 6:initializationDepth++;G_CheckTeamItems();initializationDepth--;break;
        case 7:if(a<0 || a>=MAX_ITEMS)exit(74);itemRegistered[a]=b;break;
        case 8:if(a<0 || a>=9)exit(74);memcpy((char*)&teamgame+a*4,&b,4);break;
        case 9:g_gametype.integer=a;break;
        case 10:{
            gentity_t *e=initializationPointer(a);if(!e)exit(74);
            switch(b){case 0:e->inuse=c;break;case 1:e->flags=c;break;case 2:e->teammaster=initializationPointer(c);break;
                case 3:e->teamchain=initializationPointer(c);break;case 4:e->health=c;break;case 5:e->count=c;break;case 6:e->s.number=c;break;default:exit(74);}break;
        }
        case 11:{
            gentity_t *e=initializationPointer(a);if(!e)exit(74);
            switch(b){case 0:e->team=text;break;case 1:e->targetname=text;break;case 2:e->classname=text;break;default:exit(74);}text=NULL;break;
        }
        case 12:Team_SetFlagStatus(a,b);break;
        case 13:if(a<0 || a>=MAX_CONFIGSTRINGS)exit(74);Q_strncpyz(configs[a],text,sizeof(configs[a]));break;
        default:exit(74);
        }
        free(text);initializationSnapshot();
    }
    initWord(730);initWord(normalizationCount);
    if(fgetc(in)!=EOF)exit(74);fclose(in);fclose(raw);fclose(out);return 0;
}
