/* SPDX-License-Identifier: GPL-2.0-or-later
 * Fixture adapters around unchanged g_svcmds.c and g_mem.c algorithms.
 * Bot creation/listing/podium are explicit host boundaries, not bot models.
 */
static void serverBotBoundary(int kind){
    char text[600000],length[32];int i,at=0,n;
    if(!serverCommandsOutput)G_Error("unexpected server bot command");
    for(i=0;i<cmd_argc;i++){
        n=(int)strlen(cmd_argv[i]);sprintf(length,"%d:",n);
        strcpy(text+at,length);at+=(int)strlen(length);memcpy(text+at,cmd_argv[i],n);at+=n;
    }
    text[at]=0;teamChangeEvent(kind,cmd_argc,text);
}
void Svcmd_AddBot_f(void){serverBotBoundary(22);}
void Svcmd_BotList_f(void){serverBotBoundary(23);}
void Svcmd_AbortPodium_f(void){serverBotBoundary(24);}
static void serverCommandConfigure(void){
    G_InitMemory();g_debugAlloc.integer=0;
    memset(ipFilters,0,sizeof(ipFilters));numIPFilters=0;
    memset(&g_banIPs,0,sizeof(g_banIPs));memset(&g_filterBan,0,sizeof(g_filterBan));
    g_filterBan.integer=1;strcpy(g_filterBan.string,"1");serverBanEngine[0]=0;
}
static void serverCommandState(void){
    word(allocPoint);word(g_debugAlloc.integer);word(numIPFilters);
    words(ipFilters,2048);words(g_banIPs.string,64);word(g_filterBan.integer);string(serverBanEngine);
}
static void serverFixtureBanVm(const char *text){
    if(strlen(text)>255)exit(74);
    memset(g_banIPs.string,0,sizeof(g_banIPs.string));strcpy(g_banIPs.string,text);g_banIPs.modificationCount++;
}
static void serverCommandAction(int *action,const char *request){
    int kind=action[0],slot=action[2],p0=action[3];
    switch(kind){
    case 61:{gclient_t *client=ClientForString(request);word(229);word(client?client-g_clients:-1);break;}
    case 62:{gentity_t *ent=&g_entities[slot];G_InitGentity(ent);ent->s.eType=p0;ent->classname=!strcmp(request,"<null>")?NULL:_strdup(request);if(level.num_entities<=slot)level.num_entities=slot+1;break;}
    case 63:G_InitMemory();break;
    case 64:{char *block=G_Alloc(p0);word(230);word(block-memoryPool);break;}
    case 65:g_debugAlloc.integer=p0;break;
    case 66:Q_strncpyz(serverBanEngine,request,sizeof(serverBanEngine));serverFixtureBanVm(request);g_filterBan.integer=p0;break;
    case 67:G_ProcessIPBans();break;
    case 68:{qboolean rejected=G_FilterPacket((char*)request);word(231);word(rejected);break;}
    case 69:serverFixtureBanVm(serverBanEngine);break;
    default:exit(74);
    }
}
