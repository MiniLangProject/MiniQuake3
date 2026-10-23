// Compile-time/runtime audit of the pinned Baseq3 server.h Win32 ABI.
// SPDX-License-Identifier: GPL-2.0-or-later
#include <stdio.h>
#include <stddef.h>
#include "server.h"

#define SIZE(type) printf("size|" #type "|%u\n", (unsigned)sizeof(type))
#define OFF(type, field) printf("off|" #type "|" #field "|%u\n", (unsigned)offsetof(type, field))
#define COUNT(type, field) printf("count|" #type "|" #field "|%u\n", (unsigned)(sizeof(((type*)0)->field)/sizeof(((type*)0)->field[0])))

int main(void) {
  printf("const|PERS_SCORE|%d\n", PERS_SCORE);
  printf("const|MAX_ENT_CLUSTERS|%d\n", MAX_ENT_CLUSTERS);
  printf("const|MAX_CHALLENGES|%d\n", MAX_CHALLENGES);
  printf("const|AUTHORIZE_TIMEOUT|%d\n", AUTHORIZE_TIMEOUT);
  printf("const|MAX_MASTERS|%d\n", MAX_MASTERS);
  printf("const|MAX_MASTER_SERVERS|%d\n", MAX_MASTER_SERVERS);
  printf("serverState|%d|%d|%d\n", SS_DEAD, SS_LOADING, SS_GAME);
  printf("clientState|%d|%d|%d|%d|%d\n", CS_FREE, CS_ZOMBIE, CS_CONNECTED, CS_PRIMED, CS_ACTIVE);

  SIZE(svEntity_t); OFF(svEntity_t,worldSector); OFF(svEntity_t,nextEntityInWorldSector); OFF(svEntity_t,baseline); OFF(svEntity_t,numClusters); OFF(svEntity_t,clusternums); OFF(svEntity_t,lastCluster); OFF(svEntity_t,areanum); OFF(svEntity_t,areanum2); OFF(svEntity_t,snapshotCounter); COUNT(svEntity_t,clusternums);
  SIZE(server_t); OFF(server_t,state); OFF(server_t,restarting); OFF(server_t,serverId); OFF(server_t,restartedServerId); OFF(server_t,checksumFeed); OFF(server_t,checksumFeedServerId); OFF(server_t,snapshotCounter); OFF(server_t,timeResidual); OFF(server_t,nextFrameTime); OFF(server_t,models); OFF(server_t,configstrings); OFF(server_t,svEntities); OFF(server_t,entityParsePoint); OFF(server_t,gentities); OFF(server_t,gentitySize); OFF(server_t,num_entities); OFF(server_t,gameClients); OFF(server_t,gameClientSize); OFF(server_t,restartTime); COUNT(server_t,models); COUNT(server_t,configstrings); COUNT(server_t,svEntities);
  SIZE(clientSnapshot_t); OFF(clientSnapshot_t,areabytes); OFF(clientSnapshot_t,areabits); OFF(clientSnapshot_t,ps); OFF(clientSnapshot_t,num_entities); OFF(clientSnapshot_t,first_entity); OFF(clientSnapshot_t,messageSent); OFF(clientSnapshot_t,messageAcked); OFF(clientSnapshot_t,messageSize); COUNT(clientSnapshot_t,areabits);
  SIZE(netchan_buffer_t); OFF(netchan_buffer_t,msg); OFF(netchan_buffer_t,msgBuffer); OFF(netchan_buffer_t,next); COUNT(netchan_buffer_t,msgBuffer);
  SIZE(client_t); OFF(client_t,state); OFF(client_t,userinfo); OFF(client_t,reliableCommands); OFF(client_t,reliableSequence); OFF(client_t,reliableAcknowledge); OFF(client_t,reliableSent); OFF(client_t,messageAcknowledge); OFF(client_t,gamestateMessageNum); OFF(client_t,challenge); OFF(client_t,lastUsercmd); OFF(client_t,lastMessageNum); OFF(client_t,lastClientCommand); OFF(client_t,lastClientCommandString); OFF(client_t,gentity); OFF(client_t,name); OFF(client_t,downloadName); OFF(client_t,download); OFF(client_t,downloadSize); OFF(client_t,downloadCount); OFF(client_t,downloadClientBlock); OFF(client_t,downloadCurrentBlock); OFF(client_t,downloadXmitBlock); OFF(client_t,downloadBlocks); OFF(client_t,downloadBlockSize); OFF(client_t,downloadEOF); OFF(client_t,downloadSendTime); OFF(client_t,deltaMessage); OFF(client_t,nextReliableTime); OFF(client_t,lastPacketTime); OFF(client_t,lastConnectTime); OFF(client_t,nextSnapshotTime); OFF(client_t,rateDelayed); OFF(client_t,timeoutCount); OFF(client_t,frames); OFF(client_t,ping); OFF(client_t,rate); OFF(client_t,snapshotMsec); OFF(client_t,pureAuthentic); OFF(client_t,gotCP); OFF(client_t,netchan); OFF(client_t,netchan_start_queue); OFF(client_t,netchan_end_queue); COUNT(client_t,reliableCommands); COUNT(client_t,downloadBlocks); COUNT(client_t,downloadBlockSize); COUNT(client_t,frames);
  SIZE(challenge_t); OFF(challenge_t,adr); OFF(challenge_t,challenge); OFF(challenge_t,time); OFF(challenge_t,pingTime); OFF(challenge_t,firstTime); OFF(challenge_t,connected);
  SIZE(serverStatic_t); OFF(serverStatic_t,initialized); OFF(serverStatic_t,time); OFF(serverStatic_t,snapFlagServerBit); OFF(serverStatic_t,clients); OFF(serverStatic_t,numSnapshotEntities); OFF(serverStatic_t,nextSnapshotEntities); OFF(serverStatic_t,snapshotEntities); OFF(serverStatic_t,nextHeartbeatTime); OFF(serverStatic_t,challenges); OFF(serverStatic_t,redirectAddress); OFF(serverStatic_t,authorizeAddress); COUNT(serverStatic_t,challenges);
  return 0;
}
