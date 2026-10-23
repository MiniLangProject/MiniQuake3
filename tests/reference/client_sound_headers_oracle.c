// Unchanged pinned Baseq3 Win32 client/sound ABI oracle.
// SPDX-License-Identifier: GPL-2.0-or-later
#include <stdio.h>
#include <stddef.h>
#include "client.h"
#include "snd_local.h"
#define SIZE(T) printf("size|" #T "|%u\n",(unsigned)sizeof(T))
#define OFF(T,F) printf("off|" #T "|" #F "|%u\n",(unsigned)offsetof(T,F))
#define COUNT(T,F) printf("count|" #T "|" #F "|%u\n",(unsigned)(sizeof(((T*)0)->F)/sizeof(((T*)0)->F[0])))
int main(void){
 printf("clientconst|%d|%d\n",RETRANSMIT_TIMEOUT,MAX_PARSE_ENTITIES);
 SIZE(clSnapshot_t); OFF(clSnapshot_t,valid); OFF(clSnapshot_t,snapFlags); OFF(clSnapshot_t,serverTime); OFF(clSnapshot_t,messageNum); OFF(clSnapshot_t,deltaNum); OFF(clSnapshot_t,ping); OFF(clSnapshot_t,areamask); OFF(clSnapshot_t,cmdNum); OFF(clSnapshot_t,ps); OFF(clSnapshot_t,numEntities); OFF(clSnapshot_t,parseEntitiesNum); OFF(clSnapshot_t,serverCommandNum); COUNT(clSnapshot_t,areamask);
 SIZE(outPacket_t); OFF(outPacket_t,p_cmdNumber); OFF(outPacket_t,p_serverTime); OFF(outPacket_t,p_realtime);
 SIZE(clientActive_t); OFF(clientActive_t,timeoutcount); OFF(clientActive_t,snap); OFF(clientActive_t,serverTime); OFF(clientActive_t,gameState); OFF(clientActive_t,mapname); OFF(clientActive_t,parseEntitiesNum); OFF(clientActive_t,mouseDx); OFF(clientActive_t,joystickAxis); OFF(clientActive_t,cgameUserCmdValue); OFF(clientActive_t,cmds); OFF(clientActive_t,cmdNumber); OFF(clientActive_t,outPackets); OFF(clientActive_t,viewangles); OFF(clientActive_t,serverId); OFF(clientActive_t,snapshots); OFF(clientActive_t,entityBaselines); OFF(clientActive_t,parseEntities); COUNT(clientActive_t,cmds); COUNT(clientActive_t,outPackets); COUNT(clientActive_t,snapshots); COUNT(clientActive_t,entityBaselines); COUNT(clientActive_t,parseEntities);
 SIZE(clientConnection_t); OFF(clientConnection_t,clientNum); OFF(clientConnection_t,serverAddress); OFF(clientConnection_t,serverMessage); OFF(clientConnection_t,reliableCommands); OFF(clientConnection_t,serverCommands); OFF(clientConnection_t,download); OFF(clientConnection_t,downloadTempName); OFF(clientConnection_t,downloadList); OFF(clientConnection_t,demoName); OFF(clientConnection_t,netchan); COUNT(clientConnection_t,reliableCommands); COUNT(clientConnection_t,serverCommands);
 SIZE(ping_t); OFF(ping_t,adr); OFF(ping_t,start); OFF(ping_t,time); OFF(ping_t,info);
 SIZE(serverInfo_t); OFF(serverInfo_t,adr); OFF(serverInfo_t,hostName); OFF(serverInfo_t,mapName); OFF(serverInfo_t,game); OFF(serverInfo_t,netType); OFF(serverInfo_t,punkbuster);
 SIZE(serverAddress_t); OFF(serverAddress_t,ip); OFF(serverAddress_t,port); COUNT(serverAddress_t,ip);
 SIZE(clientStatic_t); OFF(clientStatic_t,state); OFF(clientStatic_t,keyCatchers); OFF(clientStatic_t,servername); OFF(clientStatic_t,rendererStarted); OFF(clientStatic_t,framecount); OFF(clientStatic_t,realtime); OFF(clientStatic_t,numlocalservers); OFF(clientStatic_t,localServers); OFF(clientStatic_t,numglobalservers); OFF(clientStatic_t,globalServers); OFF(clientStatic_t,numGlobalServerAddresses); OFF(clientStatic_t,globalServerAddresses); OFF(clientStatic_t,numfavoriteservers); OFF(clientStatic_t,favoriteServers); OFF(clientStatic_t,nummplayerservers); OFF(clientStatic_t,mplayerServers); OFF(clientStatic_t,updateServer); OFF(clientStatic_t,glconfig); OFF(clientStatic_t,charSetShader); COUNT(clientStatic_t,localServers); COUNT(clientStatic_t,globalServers); COUNT(clientStatic_t,globalServerAddresses); COUNT(clientStatic_t,favoriteServers); COUNT(clientStatic_t,mplayerServers);
 SIZE(kbutton_t); OFF(kbutton_t,down); OFF(kbutton_t,downtime); OFF(kbutton_t,msec); OFF(kbutton_t,active); OFF(kbutton_t,wasPressed); COUNT(kbutton_t,down);
 printf("sndconst|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d\n",PAINTBUFFER_SIZE,SND_CHUNK_SIZE,SND_CHUNK_SIZE_FLOAT,SND_CHUNK_SIZE_BYTE,START_SAMPLE_IMMEDIATE,WAV_FORMAT_PCM,MAX_CHANNELS,MAX_RAW_SAMPLES,SENTINEL_MULAW_ZERO_RUN,SENTINEL_MULAW_FOUR_BIT_RUN);
 SIZE(portable_samplepair_t); OFF(portable_samplepair_t,left); OFF(portable_samplepair_t,right);
 SIZE(adpcm_state_t); OFF(adpcm_state_t,sample); OFF(adpcm_state_t,index);
 SIZE(sndBuffer); OFF(sndBuffer,sndChunk); OFF(sndBuffer,next); OFF(sndBuffer,size); OFF(sndBuffer,adpcm); COUNT(sndBuffer,sndChunk);
 SIZE(sfx_t); OFF(sfx_t,soundData); OFF(sfx_t,defaultSound); OFF(sfx_t,inMemory); OFF(sfx_t,soundCompressed); OFF(sfx_t,soundCompressionMethod); OFF(sfx_t,soundLength); OFF(sfx_t,soundName); OFF(sfx_t,lastTimeUsed); OFF(sfx_t,next); COUNT(sfx_t,soundName);
 SIZE(dma_t); OFF(dma_t,channels); OFF(dma_t,samples); OFF(dma_t,submission_chunk); OFF(dma_t,samplebits); OFF(dma_t,speed); OFF(dma_t,buffer);
 SIZE(loopSound_t); OFF(loopSound_t,origin); OFF(loopSound_t,velocity); OFF(loopSound_t,sfx); OFF(loopSound_t,mergeFrame); OFF(loopSound_t,active); OFF(loopSound_t,kill); OFF(loopSound_t,doppler); OFF(loopSound_t,dopplerScale); OFF(loopSound_t,oldDopplerScale); OFF(loopSound_t,framenum);
 SIZE(channel_t); OFF(channel_t,allocTime); OFF(channel_t,startSample); OFF(channel_t,entnum); OFF(channel_t,entchannel); OFF(channel_t,leftvol); OFF(channel_t,rightvol); OFF(channel_t,master_vol); OFF(channel_t,dopplerScale); OFF(channel_t,oldDopplerScale); OFF(channel_t,origin); OFF(channel_t,fixed_origin); OFF(channel_t,thesfx); OFF(channel_t,doppler);
 SIZE(wavinfo_t); OFF(wavinfo_t,format); OFF(wavinfo_t,rate); OFF(wavinfo_t,width); OFF(wavinfo_t,channels); OFF(wavinfo_t,samples); OFF(wavinfo_t,dataofs);
 return 0;
}
