// SPDX-License-Identifier: GPL-2.0-or-later
// Replay a protocol-68 demo recorded by the original executable on q3dm1.
import mq3.client.demo_playback as demoPlayback
import mq3.client.server_stream as stream
import mq3.client.desktop_session as desktopSession
import mq3.client.original_ui_session as uiSession
import mq3.client.ui_vm as uiVm
import mq3.compat.numeric as n
import mq3.engine.local_qvm_match as match
import mq3.format.bsp as bsp
import mq3.format.pk3 as pk3
import mq3.qcommon.cvar as cvar
import mq3.qcommon.command_buffer as commands
import std.string as strings

function fail(message) return error(7692,message) end function

function click(state,x,y)
  uiVm.mouseEvent(state.ui,-10000,-10000)
  uiVm.mouseEvent(state.ui,x,y)
  uiVm.keyEvent(state.ui,uiSession.K_MOUSE1,true)
  return uiVm.keyEvent(state.ui,uiSession.K_MOUSE1,false)
end function

function testArchive(path,archive,map,qvmRoot,dataRoot,name)
  demoArchive=pk3.open(path)
  modRoot=dataRoot+"/../fixturemod";mounted=pk3.overlay(modRoot,archive,demoArchive)
  fallback=demoPlayback.open(modRoot,mounted,name,1000)
  demoPlayback.close(fallback)
  shell=match.bootUiShell(mounted,void,1000,qvmRoot)
  shell.context.uiLanCacheHost.context.root=modRoot
  listed=false
  for each leaf in match.uiFileList(shell.context,"demos",".dm_68")
    if stringEqualsIgnoreCaseAscii(leaf,name) then listed=true end if
  end for
  match.shutdown(shell)
  if not listed then return fail("active mod hid the loose Baseq3 demo in the UI") end if
  damaged=try(demoPlayback.open("",demoArchive,"truncated",1000))
  if not (damaged is error) then demoPlayback.close(damaged);return fail("truncated DVD/PK3 demo was accepted") end if
  rollover=demoPlayback.open("",demoArchive,"ROLLOVER.DM_68",1000)
  defer demoPlayback.close(rollover)
  value=match.bootServerStream(archive,map,rollover.mapName,qvmRoot,void,rollover.protocol,true,"rollover",1000)
  defer match.shutdown(value)
  first=rollover.protocol.dispatcher.snapshotState.snap
  renewed=true
  for batchIndex=1 to 8
    demoPlayback.advance(rollover,first.serverTime+10000,3000)
    renewed=match.refreshServerStream(value,3000)
    if not renewed or rollover.completed then break end if
  end for
  if rollover.completed or renewed or not stream.ready(rollover.protocol) or rollover.mapName!="q3dm1" then
    return fail("Cgame did not detect the new demo gamestate")
  end if
  restarted=match.bootServerStream(archive,map,rollover.mapName,qvmRoot,void,rollover.protocol,true,"rollover",3000)
  defer match.shutdown(restarted)
  time=rollover.protocol.dispatcher.snapshotState.snap.serverTime
  match.drawCgameProductive(restarted,time)
  if len(restarted.context.renderViews)==0 then return fail("Cgame did not draw after demo gamestate reload") end if
  return true
end function

function main(args)
  if len(args)!=5 then
    print("usage: desktop_demo_retail_probe <pak0.pk3> <qvm-directory> <demo-baseq3> <demo-name> <demo-edge-cases.pk3>")
    return 2
  end if
  archive=pk3.open(args[0])
  shell=match.bootUiShell(archive,void,1000,args[1])
  session=desktopSession.create(args[2]);desktopSession.attach(shell,session)
  extension=".dm_"+cvar.variableString(shell.context.cvars,"protocol")
  listed=false
  for each name in match.uiFileList(shell.context,"demos",extension)
    if stringEqualsIgnoreCaseAscii(name,args[3]+extension) then listed=true end if
  end for
  if not listed then match.shutdown(shell);return fail("original UI file-list port did not expose the demo") end if
  match.bootUi(shell);uiVm.setActiveMenu(shell.ui,uiSession.UIMENU_MAIN)
  match.refreshUi(shell,1016);click(shell,320,241)
  match.refreshUi(shell,1032);click(shell,570,450)
  commands.execute(shell.context.commandState)
  match.shutdown(shell)
  if session.action!="demo" or not stringEqualsIgnoreCaseAscii(session.target,args[3]+extension) then
    return fail("original DEMOS > GO did not queue playback: "+session.action+" "+session.target)
  end if

  unsafe=try(demoPlayback.open(args[2],archive,"../"+args[3],1000))
  if not (unsafe is error) then demoPlayback.close(unsafe);return fail("demo accepted a parent directory") end if
  playback=demoPlayback.open(args[2],archive,session.target,1000)
  defer demoPlayback.close(playback)
  if playback.mapName!="q3dm1" then return fail("unexpected original demo map "+playback.mapName) end if
  map=bsp.load(pk3.read(archive,"maps/"+playback.mapName+".bsp"))
  value=match.bootServerStream(archive,map,playback.mapName,args[1],void,playback.protocol,true,args[3],1000)
  defer match.shutdown(value)
  if value.game!=void or value.cgame==void then return fail("playback did not start client-only Cgame") end if
  first=playback.protocol.dispatcher.snapshotState.snap;firstTime=first.serverTime
  draws=0;records=0;olderSnapshots=0;moved=false;receivedChat=false
  for index=0 to 1000
    time=firstTime+index*16
    consumed=demoPlayback.advance(playback,time,index*16)
    records=records+consumed
    if playback.completed then break end if
    stable=match.refreshServerStream(value,time)
    if not stable then return fail("unexpected gamestate change in original demo") end if
    current=playback.protocol.dispatcher.snapshotState.snap
    if current.serverTime<=time then return fail("playback did not read the interpolation snapshot") end if
    if current.messageNum>first.messageNum then
      older=stream.at(value.context.serverStream,current.messageNum-1)
      if older!=void then
        encoded=match.snapshotBytes(value.context,older.messageNum)
        if not encoded.found or n.readU32(encoded.data,8)!=older.serverTime or n.readU32(encoded.data,53768)!=older.serverCommandNum then return fail("Cgame received wrong historical snapshot ABI") end if
        olderSnapshots=olderSnapshots+1
      end if
    end if
    match.drawCgameProductive(value,time)
    if len(value.context.renderViews)>0 then draws=draws+1 end if
    if current.playerState.origin[0]!=first.playerState.origin[0] or current.playerState.origin[1]!=first.playerState.origin[1] then moved=true end if
    executed=value.context.cgameServerCommands.lastExecuted
    if executed>first.serverCommandNum and strings.indexOf(value.context.cgameServerCommands.commands[executed&63],"MiniQuake3 retail replay check",0)>=0 then receivedChat=true end if
  end for
  if not playback.completed or records<15 or draws<30 or olderSnapshots<15 then return fail("short or failed original replay records="+str(records)+" draws="+str(draws)+" history="+str(olderSnapshots)) end if
  if not moved or not receivedChat then return fail("recorded movement or reliable chat was lost") end if
  testArchive(args[4],archive,map,args[1],args[2],session.target)
  match.sendClientCommand(value.context,"say demo outbox")
  if len(match.takeStreamCommands(value))!=0 then return fail("demo playback sent a live command") end if
  print("PASS: original Retail demo map="+playback.mapName+" records="+str(records)+" Cgame frames="+str(draws)+" historical snapshots="+str(olderSnapshots)+" movement=ok chat=ok UI=ok PK3-rollover=ok mod-fallback=ok")
  return 0
end function
