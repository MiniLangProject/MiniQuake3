// SPDX-License-Identifier: GPL-2.0-or-later
import std.fs as fs
import mq3.client.desktop_session as desktop
import mq3.client.original_ui_session as session
import mq3.client.cinematic_runtime as cinematics
import mq3.client.ui_vm as uiVm
import mq3.engine.local_qvm_match as match
import mq3.format.bsp as bsp
import mq3.format.pk3 as pk3
import mq3.qcommon.command_buffer as commands
import mq3.qcommon.cvar as cvar

function fail(message) return error(7688,"desktop session probe: "+message) end function

function main(args)
  if len(args)!=3 then print "usage: desktop_session_retail_probe <baseq3> <qvms> <empty-config-directory>";return 2 end if
  archive=pk3.openStandard(args[0]);qvms=args[1];dataRoot=args[2]
  original=desktop.create(dataRoot)
  menu=match.bootUiShell(archive,void,1000,qvms)
  attached=desktop.attach(menu,original)
  started=match.bootUi(menu)
  if started is error then return started end if
  uiVm.setActiveMenu(menu.ui,session.UIMENU_MAIN)
  match.executeClientConsole(menu,"bind F12 \"say ready; +scores\"")
  match.executeClientConsole(menu,"seta sensitivity 6.25")
  match.executeClientConsole(menu,"set volume_preset \"seta s_volume 0.25\"")
  match.consoleCommand(menu.context,commands.EXEC_APPEND,"vstr volume_preset; spmap q3dm0\n")
  commands.execute(menu.context.commandState)
  if original.action!="map" or original.mapName!="q3dm0" or not original.singlePlayer then return fail("single-player map request") end if
  if cvar.variableValue(menu.context.cvars,"s_volume")!=0.25 then return fail("vstr command service") end if
  desktop.capture(menu,original);match.shutdown(menu)
  if not fs.isFile(fs.joinPath(dataRoot,"q3config.cfg")) then return fail("startup settings were not persisted") end if

  original.action=""
  map=bsp.load(pk3.read(archive,"maps/q3dm0.bsp"))
  game=match.bootWithQvmsSettingsNamed(archive,map,"q3dm0",1000,qvms,original.settings)
  connected=match.connectLocal(game,0)
  attached=desktop.attach(game,original)
  started=match.bootUi(game)
  if started is error then return started end if
  game.context.configstrings[0]="\\mapname\\q3dm0"
  match.executeClientConsole(game,"postgame 1 0 0 0 0 0 0 0 0 0 10")
  score=cvar.variableString(game.context.cvars,"g_spScores2")
  if score=="" then return fail("original ui.qvm did not store an arena placement") end if

  match.consoleCommand(game.context,commands.EXEC_APPEND,"map_restart 0\n")
  commands.execute(game.context.commandState)
  if original.action!="restart" then return fail("map_restart did not reach the desktop host") end if
  original.action="";match.consoleCommand(game.context,commands.EXEC_APPEND,"disconnect; levelselect\n")
  commands.execute(game.context.commandState)
  if original.action!="levelselect" then return fail("post-game disconnect did not carry the level selection") end if
  original.action="";cvar.set(game.context.cvars,"nextmap","levelselect")
  match.consoleCommand(game.context,commands.EXEC_APPEND,"disconnect; cinematic tier1.RoQ\n")
  commands.execute(game.context.commandState)
  if original.action!="cinematic" or original.target!="tier1.RoQ" or original.cinematicNext!="levelselect" then return fail("tier video command lost the pending level selection") end if
  movie=cinematics.create(archive);clip=cinematics.play(movie,original.target,0,0,640,480,cinematics.CIN_SYSTEM,1000)
  if clip is error or clip<0 then return fail("Retail tier1.RoQ did not load") end if
  if cinematics.run(movie,clip,1000)!=cinematics.FMV_PLAY or cinematics.draw(movie,clip)==void then return fail("Retail tier video produced no frame") end if
  if cinematics.run(movie,clip,14000)!=cinematics.FMV_EOF then return fail("Retail tier video did not finish") end if
  cinematics.closeAll(movie)
  if desktop.finishCinematic(original)!="levelselect" then return fail("finished tier video did not open the level selection") end if
  desktop.capture(game,original);match.shutdown(game)

  // Fresh registry, command buffer and VM. None of the previous session's
  // in-memory state can make these checks pass.
  reloaded=desktop.create(dataRoot)
  menu=match.bootUiShell(archive,void,1000,qvms)
  attached=desktop.attach(menu,reloaded)
  started=match.bootUi(menu);if started is error then return started end if
  if cvar.variableValue(menu.context.cvars,"sensitivity")!=6.25 or cvar.variableString(menu.context.cvars,"g_spScores2")!=score then return fail("settings or QVM score did not survive restart") end if
  if match.keyBinding(menu,156)!="say ready; +scores" then return fail("binding with a quoted semicolon did not survive restart") end if
  match.executeClientConsole(menu,"writeconfig named")
  if not fs.isFile(fs.joinPath(dataRoot,"named.cfg")) then return fail("writeconfig did not use the configured directory") end if
  match.executeClientConsole(menu,"exec named")
  commands.execute(menu.context.commandState)
  match.executeClientConsole(menu,"vid_restart")
  if not reloaded.videoRestart then return fail("video action was not forwarded") end if
  match.shutdown(menu)
  print "PASS: Retail q3dm0 commands hand off menu/map/restart/tier video/levelselect, unmodified ui.qvm placement survives a fresh session, binding and config commands persist"
  return 0
end function
