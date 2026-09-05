/* SPDX-License-Identifier: GPL-2.0-or-later
 * Deterministic host boundaries around the verbatim Baseq3 G_RunFrame.
 */
void Original_G_RunFrame(int levelTime);
static void frameThink(gentity_t *ent){frameWord(15,(int)(ent-g_entities));ent->count++;}
static void runFullFrame(FILE *in){
    int q[8],i;if(fread(q,4,8,in)!=8)exit(74);
    level.time=q[0];level.previousTime=q[1];level.framenum=q[2];level.restarted=q[3];level.maxclients=q[4];g_maxclients.integer=q[4];g_listEntity.integer=q[5]==2;
    for(i=0;i<MAX_CLIENTS;i++)g_entities[i].client=&g_clients[i];
    if(q[5]){
        gentity_t *e=&g_entities[0];G_InitGentity(e);e->client=&g_clients[0];g_clients[0].pers.connected=CON_CONNECTED;
        e=&g_entities[64];G_InitGentity(e);e->s.eType=ET_MISSILE;
        e=&g_entities[65];G_InitGentity(e);e->s.eType=ET_ITEM;
        e=&g_entities[66];G_InitGentity(e);e->s.eType=ET_MOVER;
        e=&g_entities[67];G_InitGentity(e);e->think=frameThink;e->nextthink=q[6];level.num_entities=68;
    }
    Original_G_RunFrame(q[7]);
    word(120);word(level.framenum);word(level.previousTime);word(level.time);word(level.num_entities);
    for(i=0;i<4;i++)word(g_entities[64+i].count);
}
