/* SPDX-License-Identifier: GPL-2.0-or-later
 * Read-only state observer after Com_Frame, linked only into the reference build.
 * Serializes through the original protocol writer; never writes game state.
 */
#include "server.h"
#include <stdint.h>
void Com_Quit_f(void);

void MQ3_ReferenceFrame(void) {
    static FILE *output;
    static int frame;
    static byte storage[1024*1024];
    static entityState_t emptyEntity;
    static playerState_t emptyPlayer;
    msg_t msg;
    int i,count,limit;
    char *path=getenv("MQ3_TRACE_FILE");
    if(!path || !*path) return;
    if(!output) {
        output=fopen(path,"wb");
        if(!output) Com_Error(ERR_FATAL,"Cannot open reference trace");
        fwrite("MQ3STATE",8,1,output);
    }
    if(!sv.gentities) return;
    MSG_Init(&msg,storage,sizeof(storage));
    MSG_WriteLong(&msg,frame);
    MSG_WriteLong(&msg,svs.time);
    MSG_WriteLong(&msg,sv.num_entities);
    for(i=0;i<sv.num_entities;i++) {
        sharedEntity_t *entity=SV_GentityNum(i);
        MSG_WriteBits(&msg,entity->r.linked,1);
        if(entity->r.linked) MSG_WriteDeltaEntity(&msg,&emptyEntity,&entity->s,qtrue);
    }
    count=Cvar_VariableIntegerValue("sv_maxclients");
    MSG_WriteLong(&msg,count);
    for(i=0;i<count;i++) {
        MSG_WriteByte(&msg,svs.clients[i].state);
        if(svs.clients[i].state==CS_ACTIVE) MSG_WriteDeltaPlayerstate(&msg,&emptyPlayer,SV_GameClientNum(i));
    }
    if(msg.bit & 7) storage[msg.bit >> 3] &= (1u << (msg.bit & 7))-1;
    fwrite(&msg.cursize,4,1,output);fwrite(storage,msg.cursize,1,output);fflush(output);
    frame++;
    limit=getenv("MQ3_TRACE_FRAMES")?atoi(getenv("MQ3_TRACE_FRAMES")):120;
    if(frame>=limit) { fclose(output); output=NULL; Com_Quit_f(); }
}
