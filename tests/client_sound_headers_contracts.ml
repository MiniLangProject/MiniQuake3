import mq3.client.client_abi as clientAbi
import mq3.audio.snd_local as sndLocal
import mq3.audio.snd_public as sndPublic
import mq3.client.client_main as clientMain
import mq3.audio.snd_channels as channels
import mq3.audio.qvm_playback as playback
function req(ok,label) if not ok then return error(7963,"client/sound headers: "+label) end if;return 1 end function
function main(args)
 count=0
 count=count+req(clientAbi.RETRANSMIT_TIMEOUT==3000 and clientMain.RETRANSMIT_TIMEOUT==clientAbi.RETRANSMIT_TIMEOUT,"client constants wired")
 count=count+req(clientAbi.MAX_PARSE_ENTITIES==2048 and clientAbi.parseEntitySlot(2049)==1 and try(clientAbi.parseEntitySlot(-1)) is error,"parse entity ring")
 count=count+req(not clientAbi.retransmitDue(2999,0) and clientAbi.retransmitDue(3000,0),"retransmit timing")
 count=count+req(clientAbi.validServerPort(0) and clientAbi.validServerPort(65535) and not clientAbi.validServerPort(65536),"network port")
 count=count+req(len(clientAbi.typeNames())==9 and len(clientAbi.allRecordFields())==133,"client record inventory")
 count=count+req(len(clientAbi.declarationNames())==93 and clientAbi.declarationNames()[0]=="CL_Init" and clientAbi.declarationNames()[92]=="CL_Netchan_Process","client declarations")
 count=count+req(len(clientAbi.externalNames())==41 and clientAbi.externalNames()[40]=="cl_connectedToPureServer","client externals")
 packet=clientAbi.OutPacket(7,800,900);button=clientAbi.KButton([1,2],10,20,true,false);address=clientAbi.ServerAddress([127,0,0,1],27960)
 count=count+req(packet.p_realtime==900 and button.active and address.port==27960,"client managed records")
 count=count+req(sndLocal.PAINTBUFFER_SIZE==4096 and sndLocal.SND_CHUNK_SIZE==1024 and sndLocal.SND_CHUNK_SIZE_FLOAT==512 and sndLocal.SND_CHUNK_SIZE_BYTE==2048,"sound chunk constants")
 count=count+req(sndLocal.MAX_CHANNELS==96 and channels.MAX_CHANNELS==sndLocal.MAX_CHANNELS and sndLocal.MAX_RAW_SAMPLES==16384,"sound storage wired")
 count=count+req(sndLocal.START_SAMPLE_IMMEDIATE==2147483647 and sndLocal.WAV_FORMAT_PCM==1,"sound sentinels")
 count=count+req(sndLocal.SENTINEL_MULAW_ZERO_RUN==127 and sndLocal.SENTINEL_MULAW_FOUR_BIT_RUN==126 and sndLocal.NXSTREAM_IS_BYTE,"codec sentinels")
 count=count+req(sndLocal.chunkCount(0)==0 and sndLocal.chunkCount(1)==1 and sndLocal.chunkCount(1025)==2 and try(sndLocal.chunkCount(-1)) is error,"chunk sizing")
 count=count+req(sndLocal.clampVolume(-1)==0 and sndLocal.clampVolume(128)==128 and sndLocal.clampVolume(300)==255,"volume clamp")
 count=count+req(sndLocal.rawSampleSlot(16385)==1 and try(sndLocal.rawSampleSlot(-1)) is error,"raw sample ring")
 count=count+req(len(sndLocal.typeNames())==8 and len(sndLocal.allRecordFields())==52 and len(sndLocal.declarationNames())==20 and len(sndLocal.externalNames())==21,"private sound inventory")
 count=count+req(len(sndPublic.declarationNames())==22 and sndPublic.soundCommandKind("S_Init")==0 and sndPublic.soundCommandKind("S_UpdateBackgroundTrack")==21 and sndPublic.soundCommandKind("missing")==-1,"public sound inventory")
 count=count+req(sndPublic.validRawFormat(22050,1,1) and sndPublic.validRawFormat(44100,2,2) and not sndPublic.validRawFormat(0,2,2) and not sndPublic.validRawFormat(44100,3,2),"raw audio formats")
 count=count+req(playback.validSoundEntity(0) and playback.validSoundEntity(1023) and not playback.validSoundEntity(1024),"public sound wired")
 pair=sndLocal.PortableSamplePair(100,-100);wav=sndLocal.WavInfo(1,22050,2,1,16,44)
 count=count+req(pair.left==100 and pair.right==-100 and wav.dataofs==44,"sound managed records")
 print("PASS: "+str(count)+" client/sound header contracts")
 return 0
end function

