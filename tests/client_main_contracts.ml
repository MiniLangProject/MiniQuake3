import mq3.client.client_main as cl
import mq3.client.frame as clientFrame
import mq3.compat.numeric as n

struct Context calls lastKind lastText end struct
function require(value,label) if not value then return error(499,"client_main contract: "+label) end if;return 1 end function
function action(ctx,state,value) ctx.calls=ctx.calls+1;ctx.lastKind=value.kind;ctx.lastText=value.text;return void end function
function millis(ctx) return 1250 end function
function exists(ctx,name) return name=="demo.dm_68" end function
function services()
  ctx=Context(0,"","");h=cl.host();h.context=ctx;h.actionFn=action;h.millisecondsFn=millis;h.existsFn=exists;return [h,ctx]
end function
function info()
  slash=decode(bytes([92]));return slash+"hostname"+slash+"Arena"+slash+"mapname"+slash+"q3dm1"+slash+"clients"+slash+"3"+slash+"sv_maxclients"+slash+"8"+slash+"gametype"+slash+"1"+slash+"nettype"+slash+"2"
end function
function contracts()
  count=0;x=services();h=x[0];ctx=x[1];s=cl.create()
  count=count+require(cl.CL_Init(s,h),"init");count=count+require(s.lifecycle.initialized and s.lifecycle.renderer and s.lifecycle.sound and s.lifecycle.hunk,"hunk users");count=count+require(ctx.calls>=4,"typed host actions")
  before=ctx.calls;s.retailActive=true;cl.CL_RefPrintf(s,h,1,"owned");count=count+require(ctx.calls==before and not s.actions[len(s.actions)-1].dispatched,"retail suppression");s.retailActive=false
  count=count+require(cl.CL_AddReliableCommand(s,"say hello")==1 and s.reliable.commands[1]=="say hello","reliable add");count=count+require(cl.CL_ChangeReliableCommand(s)=="say hello\n","reliable mutation");s.reliable.acknowledge=1
  count=count+require(cl.CL_CDKeyValidate("2222222222222222",void),"cd key alphabet");count=count+require(cl.CL_CDKeyValidate("2222222222222222","20"),"cd key checksum");count=count+require(cl.CL_CDKeyValidate("aaaaaaaaaaaaaaaa","10"),"lowercase cd key");count=count+require(not cl.CL_CDKeyValidate("2222","20") and not cl.CL_CDKeyValidate("EEEEEEEEEEEEEEEE",void),"invalid cd keys")
  count=count+require(cl.CL_DemoFilename(0)=="demo0000" and cl.CL_DemoFilename(42)=="demo0042" and cl.CL_DemoFilename(10000)=="demo9999.tga","demo filenames")
  s.demo.serverMessageSequence=7;record=cl.CL_WriteDemoMessage(s,bytes([1,2,3,4]),2);count=count+require(len(record)==10 and n.readI32(record,0)==7 and n.readI32(record,4)==2 and record[8]==3,"demo framing")
  s.lifecycle.state=cl.CA_ACTIVE;count=count+require(cl.CL_Record_f(s,h,"run",11) and s.demo.recording,"record start");count=count+require(cl.CL_StopRecord_f(s,h) and not s.demo.recording,"record stop")
  count=count+require(cl.CL_WalkDemoExt(s,h,"demo",[67,68])=="demo.dm_68","demo extension walk")
  count=count+require(cl.CL_Connect_f(s,h,"127.0.0.1:27960") and s.lifecycle.state==cl.CA_CONNECTING,"connect");s.lifecycle.realtime=4000;count=count+require(cl.CL_CheckForResend(s,h) and ctx.lastText=="getchallenge","challenge resend")
  count=count+require(cl.CL_ConnectionlessPacket(s,h,"127.0.0.1:27960","challengeResponse","77")=="challengeResponse" and s.lifecycle.state==cl.CA_CHALLENGING,"challenge response");count=count+require(cl.CL_ConnectionlessPacket(s,h,"127.0.0.1:27960","connectResponse","")=="connectResponse" and s.lifecycle.state==cl.CA_CONNECTED,"connect response")
  s.lifecycle.lastPacketTime=4000;s.lifecycle.realtime=5000;count=count+require(not cl.CL_DisconnectPacket(s,h,"127.0.0.1:27960"),"spoof-delay disconnect");s.lifecycle.realtime=8001;count=count+require(cl.CL_DisconnectPacket(s,h,"127.0.0.1:27960") and s.lifecycle.state==cl.CA_DISCONNECTED,"validated disconnect")
  si=cl.CL_InitServerInfo("1.2.3.4:27960");count=count+require(si.ping==-1 and si.clients==0 and si.hostName=="","server defaults");cl.CL_SetServerInfo(si,info(),42);count=count+require(si.hostName=="Arena" and si.mapName=="q3dm1" and si.clients==3 and si.maxClients==8 and si.gameType==1 and si.netType==2 and si.ping==42,"server info parse")
  count=count+require(cl.CL_SetServerInfoByAddress(s,"1.2.3.4:27960",info(),15).ping==15 and len(s.servers)==1,"server catalog upsert");count=count+require(cl.CL_ServersResponsePacket(s,h,["1.2.3.4:27960","5.6.7.8:27960"])==1 and len(s.servers)==2,"master dedupe")
  s.lifecycle.realtime=100;pi=cl.CL_Ping_f(s,h,"1.2.3.4:27960");count=count+require(pi==0 and cl.CL_GetPingQueueCount(s)==1,"ping enqueue");count=count+require(cl.CL_GetPing(s,0,800)[1]==0,"pending ping");s.pings[0].time=37;s.pings[0].info=info();count=count+require(cl.CL_GetPing(s,0,800)[1]==37 and cl.CL_GetPingInfo(s,0)==info(),"ping result");count=count+require(cl.CL_UpdateServerInfo(s,0),"ping updates server");count=count+require(cl.CL_ClearPing(s,0) and cl.CL_GetPingQueueCount(s)==0,"ping clear")
  s.lifecycle.realtime=200;count=count+require(cl.CL_ServerStatus(s,h,"1.2.3.4:27960",750)=="","status request");cl.CL_ServerStatusResponse(s,h,"1.2.3.4:27960","status-body");count=count+require(cl.CL_GetServerStatus(s,"1.2.3.4:27960")=="status-body" and cl.CL_ServerStatus_f(s,h,"1.2.3.4:27960")=="status-body","status response")
  count=count+require(cl.CL_InitDownloads(s,h,["pak1.pk3","pak2.pk3"])=="pak1.pk3.tmp" and s.downloads.index==1,"download queue");count=count+require(cl.CL_NextDownload(s,h)=="pak2.pk3.tmp" and s.downloads.index==2,"next download");count=count+require(cl.CL_NextDownload(s,h) and s.downloads.completed,"downloads complete")
  s.lifecycle.state=cl.CA_CONNECTED;s.serverName="server";s.pureChecksums="123 456";count=count+require(cl.CL_SendPureChecksums(s,h) and s.reliable.commands[s.reliable.sequence&63]=="cp 123 456","pure checksums");count=count+require(cl.CL_ResetPureClientAtServer(s,h),"pure reset")
  count=count+require(cl.CL_LocalServers_f(s,h)==8,"local scan packets");count=count+require(cl.CL_GlobalServers_f(s,h,"master.quake3arena.com:27950",68,"empty full"),"global scan")
  count=count+require(cl.CL_ScaledMilliseconds(s,h,2)==2500,"scaled milliseconds");s.lifecycle.initialized=true;s.lifecycle.state=cl.CA_CONNECTED;s.lifecycle.timeoutSeconds=1;s.lifecycle.lastPacketTime=0;s.lifecycle.realtime=7000;s.lifecycle.timeoutCount=5;count=count+require(cl.CL_CheckTimeout(s,h) and s.lifecycle.state==cl.CA_DISCONNECTED,"timeout disconnect")
  s.lifecycle.initialized=true;s.lifecycle.state=cl.CA_DISCONNECTED;frames=s.lifecycle.framecount;count=count+require(cl.CL_Frame(s,h,16)=="frame" and s.lifecycle.framecount==frames+1,"outer frame")
  fr=clientFrame.runtime();fr.running=1;fh=clientFrame.services();cl.attachFrame(s,fr,fh);count=count+require(cl.CL_Frame(s,h,5)=="frame" and s.lifecycle.realtime==fr.realtime and s.lifecycle.framecount==fr.framecount,"existing frame path integration");s.frameRuntime=void;s.frameHost=void
  count=count+require(cl.CL_Vid_Restart_f(s,h) and s.lifecycle.renderer,"video restart");count=count+require(cl.CL_Snd_Restart_f(s,h) and s.lifecycle.sound,"sound restart")
  count=count+require(cl.CL_MapLoading(s,h,"q3dm1")=="localhost" and s.lifecycle.state==cl.CA_CHALLENGING,"map loading")
  count=count+require(cl.CL_Shutdown(s,h) and not s.lifecycle.initialized and s.lifecycle.state==cl.CA_UNINITIALIZED,"shutdown")
  return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" client_main native contracts\n");return 0 end function
