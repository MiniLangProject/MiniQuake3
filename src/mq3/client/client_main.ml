// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native ownership/adapter for the client/cl_main.c outer client runtime.
package mq3.client.client_main

import std.string as strings
import mq3.client.demo as demo
import mq3.client.frame as clientFrame
import mq3.client.connectionless as connectionless
import mq3.client.network_ingress as networkIngress
import mq3.client.client_abi as clientAbi

const CA_UNINITIALIZED=0
const CA_DISCONNECTED=1
const CA_AUTHORIZING=2
const CA_CONNECTING=3
const CA_CHALLENGING=4
const CA_CONNECTED=5
const CA_LOADING=6
const CA_PRIMED=7
const CA_ACTIVE=8
const MAX_RELIABLE_COMMANDS=64
const MAX_PINGREQUESTS=32
const MAX_SERVERSTATUSREQUESTS=16
const MAX_STRING_CHARS=1024
const PORT_SERVER=27960
const RETRANSMIT_TIMEOUT=clientAbi.RETRANSMIT_TIMEOUT
const CDKEY_LEN=16
const CDCHKSUM_LEN=2

struct Action kind text address dispatched end struct
struct Reliable sequence acknowledge commands end struct
struct Ping address start time info end struct
struct ServerInfo address clients hostName mapName maxClients maxPing minPing ping game gameType netType visible end struct
struct ServerStatus address text start pending retrieved end struct
struct Downloads queue index name tempName restarted completed end struct
struct DemoState recording playing file name nextDemo serverMessageSequence offset end struct
struct Lifecycle initialized state renderer sound hunk realtime framecount lastPacketTime timeoutCount timeoutSeconds serverRunning uiStarted cgameStarted connectTime connectPacketCount end struct

// Platform-specific I/O remains explicit. The native state changes are always
// performed; actionFn is skipped when a retail QVM already owns the operation.
struct Host actionFn millisecondsFn allocFn freeFn readFn writeFn closeFn existsFn context end struct
function host() return Host(void,void,void,void,void,void,void,void,void) end function

struct State lifecycle reliable pings servers statuses downloads demo cvars configstrings actions serverName reconnectName userinfo pureChecksums openedPaks referencedPaks retailActive frameRuntime frameHost connectionRuntime connectionHost packetRuntime packetHost lanRuntime end struct

function create()
  life=Lifecycle(false,CA_UNINITIALIZED,false,false,false,0,0,0,0,30,false,false,false,0,0)
  reliable=Reliable(0,0,array(MAX_RELIABLE_COMMANDS,""))
  downloads=Downloads([],0,"","",false,false)
  demos=DemoState(false,false,void,"","",0,0)
  return State(life,reliable,[],[],[],downloads,demos,[],array(1024,""),[],"","","","","","",false,void,void,void,void,void,void,void)
end function

function emit(state,services,kind,text,address)
  dispatched=not state.retailActive;action=Action(kind,text,address,dispatched);state.actions=state.actions+[action]
  if dispatched and services!=void and services.actionFn!=void then services.actionFn(services.context,state,action) end if
  return action
end function
function now(state,services) if services!=void and services.millisecondsFn!=void then return services.millisecondsFn(services.context) end if;return state.lifecycle.realtime end function
function clampText(text,limit)
  raw=bytes(text);if len(raw)<limit then return text end if;result=bytes(limit-1,0);for i=0 to limit-2 result[i]=raw[i] end for;return decode(result)
end function
function lower(text) r="";for each value in bytes(text) if value>=65 and value<=90 then value=value+32 end if;r=r+decode(bytes([value])) end for;return r end function
function addressEqual(a,b) return lower(a)==lower(b) end function
function infoValue(text,key)
  values=strings.split(text,"\\");i=1
  while i<len(values)-1 if lower(values[i])==lower(key) then return values[i+1] end if;i=i+2 end while
  return ""
end function
function toInt(text) raw=bytes(text);if len(raw)==0 then return 0 end if;sign=1;i=0;if raw[0]==45 then sign=-1;i=1 end if;value=0;while i<len(raw) if raw[i]<48 or raw[i]>57 then return 0 end if;value=value*10+raw[i]-48;i=i+1 end while;return value*sign end function
function hexDigit(value) if value<10 then return 48+value end if;return 87+value end function

function attachFrame(state,runtime,services) state.frameRuntime=runtime;state.frameHost=services;return state end function
function attachConnection(state,runtime,services) state.connectionRuntime=runtime;state.connectionHost=services;return state end function
function attachNetworkIngress(state,runtime) state.packetRuntime=runtime;return state end function
function CL_PacketEventLive(state,address,data)
  if state.packetRuntime==void then return error(7301,"client main: missing live network ingress") end if
  networkIngress.setRealtime(state.packetRuntime,state.lifecycle.realtime);return networkIngress.clientPacket(state.packetRuntime,address,data)
end function

function CL_AddReliableCommand(state,cmd)
  if state.reliable.sequence-state.reliable.acknowledge>MAX_RELIABLE_COMMANDS then return error(7300,"Client command overflow") end if
  state.reliable.sequence=state.reliable.sequence+1;index=state.reliable.sequence&(MAX_RELIABLE_COMMANDS-1);state.reliable.commands[index]=clampText(cmd,MAX_STRING_CHARS);return state.reliable.sequence
end function
function CL_ChangeReliableCommand(state)
  index=state.reliable.sequence&(MAX_RELIABLE_COMMANDS-1);text=state.reliable.commands[index];if len(bytes(text))>=MAX_STRING_CHARS-1 then text=clampText(text,MAX_STRING_CHARS-1) end if;state.reliable.commands[index]=text+"\n";return state.reliable.commands[index]
end function

function CL_WriteDemoMessage(state,messageData,headerBytes)
  return demo.encodeMessage(state.demo.serverMessageSequence,messageData,headerBytes)
end function
function CL_StopRecord_f(state,services)
  if not state.demo.recording then emit(state,services,"print","Not recording a demo.\n","");return false end if
  if services!=void and services.writeFn!=void then services.writeFn(services.context,state.demo.file,demo.encodeEnd()) end if
  if services!=void and services.closeFn!=void then services.closeFn(services.context,state.demo.file) end if
  state.demo.file=void;state.demo.recording=false;emit(state,services,"print","Stopped demo.\n","");return true
end function
function CL_DemoFilename(number) return demo.demoFilename(number) end function
function CL_Record_f(state,services,name,file)
  if state.lifecycle.state!=CA_ACTIVE then emit(state,services,"print","You must be in a level to record.\n","");return false end if
  if state.demo.recording then emit(state,services,"print","Already recording.\n","");return false end if
  state.demo.name=name;state.demo.file=file;state.demo.recording=true;emit(state,services,"record",name,"");return true
end function
function CL_DemoCompleted(state,services)
  state.demo.playing=false;state.demo.offset=0;if state.demo.nextDemo!="" then CL_NextDemo(state,services) end if;return true
end function
function CL_WalkDemoExt(state,services,base,protocols)
  for each protocol in protocols name=base+".dm_"+str(protocol);exists=false;if services!=void and services.existsFn!=void then exists=services.existsFn(services.context,name) end if;if exists then return name end if end for;return ""
end function
function CL_PlayDemo_f(state,services,name,data)
  state.demo.playing=true;state.demo.name=name;state.demo.offset=0;state.lifecycle.state=CA_CONNECTED;emit(state,services,"playdemo",name,"");return data
end function
function CL_ReadDemoMessage(state,data)
  playback=demo.playback();playback.offset=state.demo.offset;playback.serverMessageSequence=state.demo.serverMessageSequence;result=demo.readDemoMessage(playback,data,state.lifecycle.realtime);state.demo.offset=playback.offset;state.demo.serverMessageSequence=playback.serverMessageSequence;if playback.completed then state.demo.playing=false end if;return result
end function
function CL_StartDemoLoop(state,services) state.demo.nextDemo="d1";return CL_NextDemo(state,services) end function
function CL_NextDemo(state,services) command=state.demo.nextDemo;state.demo.nextDemo="";if command!="" then emit(state,services,"command",command+"\n","") end if;return command end function

function CL_DisconnectPacket(state,services,address)
  if state.lifecycle.state<CA_AUTHORIZING or not addressEqual(address,state.serverName) or state.lifecycle.realtime-state.lifecycle.lastPacketTime<3000 then return false end if
  emit(state,services,"print","Server disconnected for unknown reason\n",address);CL_Disconnect(state,services,true);return true
end function
function CL_CheckForResend(state,services)
  if state.connectionRuntime!=void and state.connectionHost!=void then
    state.connectionRuntime.realtime=state.lifecycle.realtime;result=connectionless.checkForResend(state.connectionRuntime,state.connectionHost);state.lifecycle.state=state.connectionRuntime.connectionState;return result
  end if
  if state.demo.playing or (state.lifecycle.state!=CA_CONNECTING and state.lifecycle.state!=CA_CHALLENGING) then return false end if
  if state.lifecycle.realtime-state.lifecycle.connectTime<RETRANSMIT_TIMEOUT then return false end if
  state.lifecycle.connectTime=state.lifecycle.realtime;state.lifecycle.connectPacketCount=state.lifecycle.connectPacketCount+1
  if state.lifecycle.state==CA_CONNECTING then emit(state,services,"oob","getchallenge",state.serverName) else emit(state,services,"oob","connect \""+state.userinfo+"\"",state.serverName) end if;return true
end function
function CL_ConnectionlessPacket(state,services,address,command,payload)
  name=lower(command)
  if name=="disconnect" then CL_DisconnectPacket(state,services,address);return "disconnect" end if
  if name=="inforesponse" then CL_ServerInfoPacket(state,services,address,payload);return "infoResponse" end if
  if name=="statusresponse" then CL_ServerStatusResponse(state,services,address,payload);return "statusResponse" end if
  if name=="getserversresponse" then CL_ServersResponsePacket(state,services,payload);return "getserversResponse" end if
  if name=="motd" then CL_MotdPacket(state,services,address,payload);return "motd" end if
  if name=="challengeresponse" and state.lifecycle.state==CA_CONNECTING then state.lifecycle.state=CA_CHALLENGING;emit(state,services,"challenge",payload,address);return "challengeResponse" end if
  if name=="connectresponse" and state.lifecycle.state==CA_CHALLENGING and addressEqual(address,state.serverName) then state.lifecycle.state=CA_CONNECTED;return "connectResponse" end if
  if name=="print" then emit(state,services,"print",payload,address);return "print" end if
  return "unknown"
end function
function CL_PacketEvent(state,services,address,command,payload)
  state.lifecycle.lastPacketTime=state.lifecycle.realtime;if command!="" then return CL_ConnectionlessPacket(state,services,address,command,payload) end if;emit(state,services,"sequenced",payload,address);return "sequenced"
end function

function CL_ClearState(state)
  state.configstrings=array(1024,"");state.reliable=Reliable(0,0,array(MAX_RELIABLE_COMMANDS,""));state.lifecycle.timeoutCount=0;state.demo.serverMessageSequence=0;return state
end function
function CL_Disconnect(state,services,showMainMenu)
  if state.demo.recording then CL_StopRecord_f(state,services) end if
  if state.lifecycle.state>=CA_CONNECTED then CL_AddReliableCommand(state,"disconnect");emit(state,services,"send","disconnect",state.serverName) end if
  CL_ClearState(state);state.lifecycle.state=CA_DISCONNECTED;state.serverName="";if showMainMenu then emit(state,services,"menu","main","") end if;return true
end function
function CL_MapLoading(state,services,mapName)
  if state.lifecycle.state>=CA_CONNECTED and infoValue(state.userinfo,"mapname")==mapName then state.lifecycle.state=CA_CONNECTED;state.lifecycle.lastPacketTime=state.lifecycle.realtime;return "reuse" end if
  CL_Disconnect(state,services,false);state.serverName="localhost";state.lifecycle.state=CA_CHALLENGING;state.userinfo="\\mapname\\"+mapName;return "localhost"
end function
function CL_ForwardCommandToServer(state,services,command)
  if state.lifecycle.state<CA_CONNECTED or command=="" or bytes(command)[0]==45 then return false end if;CL_AddReliableCommand(state,command);emit(state,services,"reliable",command,state.serverName);return true
end function
function CL_ForwardToServer_f(state,services,args) return CL_ForwardCommandToServer(state,services,args) end function
function CL_Setenv_f(state,services,name,value) emit(state,services,"setenv",name+"="+value,"");return true end function
function CL_Disconnect_f(state,services) return CL_Disconnect(state,services,true) end function
function CL_Reconnect_f(state,services)
  if state.reconnectName=="" then return false end if;return CL_Connect_f(state,services,state.reconnectName)
end function
function CL_Connect_f(state,services,address)
  if address=="" then return false end if;CL_Disconnect(state,services,false);state.serverName=address;state.reconnectName=address;state.lifecycle.state=CA_CONNECTING;state.lifecycle.connectTime=-99999;state.lifecycle.connectPacketCount=0;emit(state,services,"connect",address,address);return true
end function
function CL_Rcon_f(state,services,password,command,address)
  target=address;if target=="" then target=state.serverName end if;if target=="" or password=="" then return false end if;emit(state,services,"oob","rcon "+password+" "+command,target);return true
end function
function CL_SetModel_f(state,services,model,headmodel) state.userinfo="\\model\\"+model+"\\headmodel\\"+headmodel;emit(state,services,"userinfo",state.userinfo,"");return true end function

function CL_RefPrintf(state,services,level,text) return emit(state,services,"refprint",str(level)+":"+text,"") end function
function CL_RefMalloc(state,services,size) if services!=void and services.allocFn!=void then return services.allocFn(services.context,size) end if;return bytes(size,0) end function
function CL_InitRef(state,services) state.lifecycle.renderer=true;emit(state,services,"renderer-init","","");return true end function
function CL_ShutdownRef(state,services) if state.lifecycle.renderer then emit(state,services,"renderer-shutdown","","") end if;state.lifecycle.renderer=false;return true end function
function CL_InitRenderer(state,services) if not state.lifecycle.renderer then CL_InitRef(state,services) end if;emit(state,services,"renderer-register","","");return true end function
function CL_StartHunkUsers(state,services)
  if not state.lifecycle.hunk then state.lifecycle.hunk=true;CL_InitRenderer(state,services);state.lifecycle.sound=true;emit(state,services,"sound-init","","") end if;return true
end function
function CL_Vid_Restart_f(state,services)
  state.lifecycle.uiStarted=false;state.lifecycle.cgameStarted=false;CL_ShutdownRef(state,services);emit(state,services,"hunk-clear","","");state.lifecycle.hunk=false;return CL_StartHunkUsers(state,services)
end function
function CL_Snd_Restart_f(state,services) emit(state,services,"sound-shutdown","","");state.lifecycle.sound=false;emit(state,services,"sound-init","","");state.lifecycle.sound=true;return true end function
function CL_ShutdownAll(state,services) state.lifecycle.cgameStarted=false;state.lifecycle.uiStarted=false;CL_ShutdownRef(state,services);state.lifecycle.sound=false;state.lifecycle.hunk=false;return true end function
function CL_FlushMemory(state,services) CL_ShutdownAll(state,services);emit(state,services,"hunk-clear","","");return CL_StartHunkUsers(state,services) end function
function CL_Init(state,services)
  if state.lifecycle.initialized then return false end if;state.lifecycle.initialized=true;state.lifecycle.state=CA_DISCONNECTED;emit(state,services,"client-init","","");CL_StartHunkUsers(state,services);return true
end function
function CL_Shutdown(state,services)
  if not state.lifecycle.initialized then return false end if;CL_Disconnect(state,services,false);CL_ShutdownAll(state,services);state.lifecycle.initialized=false;state.lifecycle.state=CA_UNINITIALIZED;emit(state,services,"client-shutdown","","");return true
end function
function CL_CDDialog(state) return state.lifecycle.state==CA_DISCONNECTED end function
function CL_ScaledMilliseconds(state,services,timeScale) return now(state,services)*timeScale end function
function CL_CheckUserinfo(state,services,modified)
  if state.frameRuntime!=void and state.frameHost!=void then state.frameRuntime.state=state.lifecycle.state;return clientFrame.checkUserinfo(state.frameRuntime,state.frameHost) end if
  if not modified or state.lifecycle.state<CA_CHALLENGING then return false end if;return CL_ForwardCommandToServer(state,services,"userinfo \""+state.userinfo+"\"")
end function
function CL_CheckTimeout(state,services)
  if state.frameRuntime!=void and state.frameHost!=void then state.frameRuntime.state=state.lifecycle.state;state.frameRuntime.realtime=state.lifecycle.realtime;state.frameRuntime.lastPacketTime=state.lifecycle.lastPacketTime;result=clientFrame.checkTimeout(state.frameRuntime,state.frameHost);state.lifecycle.timeoutCount=state.frameRuntime.timeoutCount;return result end if
  timedOut=state.lifecycle.state>=CA_CONNECTED and state.lifecycle.realtime-state.lifecycle.lastPacketTime>state.lifecycle.timeoutSeconds*1000
  if timedOut then state.lifecycle.timeoutCount=state.lifecycle.timeoutCount+1;if state.lifecycle.timeoutCount>5 then CL_Disconnect(state,services,true);return true end if else state.lifecycle.timeoutCount=0 end if;return false
end function
function CL_Frame(state,services,msec)
  if not state.lifecycle.initialized then return "not-running" end if
  if state.frameRuntime!=void and state.frameHost!=void then result=clientFrame.run(state.frameRuntime,msec,state.frameHost);state.lifecycle.realtime=state.frameRuntime.realtime;state.lifecycle.framecount=state.frameRuntime.framecount;state.lifecycle.state=state.frameRuntime.state;return result end if
  state.lifecycle.realtime=state.lifecycle.realtime+msec;CL_CheckTimeout(state,services);CL_CheckForResend(state,services);emit(state,services,"send-cmd","",state.serverName);state.lifecycle.framecount=state.lifecycle.framecount+1;return "frame"
end function

function CL_BeginDownload(state,services,localName,remoteName)
  state.downloads.name=localName;state.downloads.tempName=localName+".tmp";state.downloads.completed=false;emit(state,services,"download","download "+remoteName,state.serverName);return state.downloads.tempName
end function
function CL_NextDownload(state,services)
  if state.downloads.index>=len(state.downloads.queue) then return CL_DownloadsComplete(state,services) end if
  remote=state.downloads.queue[state.downloads.index];state.downloads.index=state.downloads.index+1;return CL_BeginDownload(state,services,remote,remote)
end function
function CL_InitDownloads(state,services,downloads)
  state.downloads.queue=downloads;state.downloads.index=0;state.downloads.completed=false;if len(downloads)==0 then return CL_DownloadsComplete(state,services) end if;return CL_NextDownload(state,services)
end function
function CL_DownloadsComplete(state,services)
  state.downloads.completed=true;state.downloads.name="";state.downloads.tempName="";if state.downloads.restarted then emit(state,services,"filesystem-restart","","");state.downloads.restarted=false end if;return true
end function

function CL_InitServerInfo(address) return ServerInfo(address,0,"","",0,0,0,-1,"",0,0,true) end function
function CL_SetServerInfo(server,infoText,ping)
  if infoText!="" then server.clients=toInt(infoValue(infoText,"clients"));server.hostName=infoValue(infoText,"hostname");server.mapName=infoValue(infoText,"mapname");server.maxClients=toInt(infoValue(infoText,"sv_maxclients"));server.game=infoValue(infoText,"game");server.gameType=toInt(infoValue(infoText,"gametype"));server.netType=toInt(infoValue(infoText,"nettype"));server.minPing=toInt(infoValue(infoText,"minping"));server.maxPing=toInt(infoValue(infoText,"maxping")) end if
  server.ping=ping;return server
end function
function findServer(state,address) if len(state.servers)>0 then for i=0 to len(state.servers)-1 if addressEqual(state.servers[i].address,address) then return i end if end for end if;return -1 end function
function CL_SetServerInfoByAddress(state,address,infoText,ping)
  index=findServer(state,address);if index<0 then server=CL_InitServerInfo(address);state.servers=state.servers+[server];index=len(state.servers)-1 end if;return CL_SetServerInfo(state.servers[index],infoText,ping)
end function
function CL_UpdateServerInfo(state,n) if n<0 or n>=len(state.pings) then return false end if;p=state.pings[n];CL_SetServerInfoByAddress(state,p.address,p.info,p.time);return true end function
function CL_ServerInfoPacket(state,services,address,infoText) CL_SetServerInfoByAddress(state,address,infoText,0);emit(state,services,"server-info",infoText,address);return true end function
function CL_ServersResponsePacket(state,services,addresses)
  added=0;for each address in addresses if findServer(state,address)<0 then state.servers=state.servers+[CL_InitServerInfo(address)];added=added+1 end if end for;emit(state,services,"servers-response",str(added),"");return added
end function
function CL_LocalServers_f(state,services) state.servers=[];for port=PORT_SERVER to PORT_SERVER+3 emit(state,services,"broadcast","getinfo xxx","255.255.255.255:"+str(port));emit(state,services,"broadcast","getinfo xxx","255.255.255.255:"+str(port)) end for;return 8 end function
function CL_GlobalServers_f(state,services,master,protocol,keywords) state.servers=[];emit(state,services,"master","getservers "+str(protocol)+" "+keywords,master);return true end function

function CL_GetPingQueueCount(state) count=0;for each ping in state.pings if ping.address!="" then count=count+1 end if end for;return count end function
function CL_GetFreePing(state)
  if len(state.pings)<MAX_PINGREQUESTS then state.pings=state.pings+[Ping("",0,0,"")];return len(state.pings)-1 end if
  best=0;oldest=-2147483648;for i=0 to len(state.pings)-1 p=state.pings[i];if p.address=="" or (p.time==0 and state.lifecycle.realtime-p.start>=500) or p.time>=500 then p.address="";return i end if;age=state.lifecycle.realtime-p.start;if age>oldest then oldest=age;best=i end if end for;return best
end function
function CL_ClearPing(state,n) if n>=0 and n<len(state.pings) then state.pings[n].address="";return true end if;return false end function
function CL_GetPing(state,n,maxPing)
  if n<0 or n>=len(state.pings) or state.pings[n].address=="" then return ["",0] end if;p=state.pings[n];time=p.time;if time==0 then elapsed=state.lifecycle.realtime-p.start;if maxPing<100 then maxPing=100 end if;if elapsed>=maxPing then time=elapsed end if end if;CL_SetServerInfoByAddress(state,p.address,p.info,p.time);return [p.address,time]
end function
function CL_GetPingInfo(state,n) if n<0 or n>=len(state.pings) or state.pings[n].address=="" then return "" end if;return state.pings[n].info end function
function CL_Ping_f(state,services,address)
  index=CL_GetFreePing(state);state.pings[index]=Ping(address,state.lifecycle.realtime,0,"");emit(state,services,"oob","getinfo xxx",address);return index
end function
function CL_UpdateVisiblePings_f(state,services,maxPing)
  active=false;for each server in state.servers if server.visible and server.ping==-1 then CL_Ping_f(state,services,server.address);active=true;if CL_GetPingQueueCount(state)>=MAX_PINGREQUESTS then break end if end if end for;return active
end function

function findStatus(state,address) if len(state.statuses)>0 then for i=0 to len(state.statuses)-1 if addressEqual(state.statuses[i].address,address) then return i end if end for end if;return -1 end function
function CL_ServerStatus(state,services,address,resendTime)
  index=findStatus(state,address);if index<0 then state.statuses=state.statuses+[ServerStatus(address,"",state.lifecycle.realtime,true,false)];emit(state,services,"oob","getstatus",address);return "" end if;s=state.statuses[index];if s.text!="" then s.retrieved=true;return s.text end if;if s.start<state.lifecycle.realtime-resendTime then s.start=state.lifecycle.realtime;emit(state,services,"oob","getstatus",address) end if;return ""
end function
function CL_GetServerStatus(state,address) index=findStatus(state,address);if index<0 then return "" end if;return state.statuses[index].text end function
function CL_ServerStatusResponse(state,services,address,text)
  index=findStatus(state,address);if index<0 then state.statuses=state.statuses+[ServerStatus(address,text,state.lifecycle.realtime,false,false)] else state.statuses[index].text=text;state.statuses[index].pending=false end if;emit(state,services,"server-status",text,address);return true
end function
function CL_ServerStatus_f(state,services,address) return CL_ServerStatus(state,services,address,750) end function
function CL_MotdPacket(state,services,address,text) emit(state,services,"motd",text,address);return text end function

function CL_SendPureChecksums(state,services) return CL_ForwardCommandToServer(state,services,"cp "+state.pureChecksums) end function
function CL_ResetPureClientAtServer(state,services) return CL_ForwardCommandToServer(state,services,"vdr") end function
function CL_OpenedPK3List_f(state,services) emit(state,services,"print",state.openedPaks+"\n","");return state.openedPaks end function
function CL_ReferencedPK3List_f(state,services) emit(state,services,"print",state.referencedPaks+"\n","");return state.referencedPaks end function
function CL_RequestMotd(state,services,address,challenge) emit(state,services,"oob","getmotd "+challenge,address);return true end function
function CL_ShowIP_f(state,services,addresses)
  return len(addresses)
end function
function CL_Clientinfo_f(state,services)
  return state.serverName
end function
function CL_Configstrings_f(state,services)
  values=state.configstrings;count=0
  for each value in values if len(bytes(value))>0 then count=count+1 end if end for
  return count
end function

function CL_CDKeyValidate(key,checksum)
  if len(bytes(key))!=CDKEY_LEN then return false end if;if checksum!=void and len(bytes(checksum))!=CDCHKSUM_LEN then return false end if
  chars=bytes([50,51,55,65,66,67,68,71,72,74,76,80,82,83,84,87])
  sum=0
  for each ch in bytes(key)
    if ch>=97 and ch<=122 then ch=ch-32 end if
    found=false
    for each allowed in chars
      if ch==allowed then found=true end if
    end for
    if not found then return false end if
    sum=(sum+ch)&255
  end for
  high=(sum>>4)&15;low=sum&15
  wanted=decode(bytes([hexDigit(high),hexDigit(low)]))
  return checksum==void or lower(checksum)==wanted
end function

// Static storage marker from the C file. Kept explicit for source/ledger parity.
function packets(state) return state.lifecycle.framecount end function
