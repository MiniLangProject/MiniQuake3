// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.engine.local_qvm_match as match
import mq3.client.cl_console as console
import mq3.client.console_input as input
import mq3.client.baseq3_console_background as background
import mq3.renderer.playable_materials as materials
import mq3.vm.cgame_key_traps as keyTraps
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp

function main(args)
  if len(args)!=2 then return error(7744,"usage: cl_console_retail_probe <pak0.pk3> <qvm-dir>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if;retail=pk3.read(archive,"vm/qagame.qvm");if retail is error or len(retail)<10000 then return error(7744,"retail qagame.qvm missing") end if
  consoleMedia=background.load(archive,493);if consoleMedia is error or consoleMedia.shaderName!="console" or len(consoleMedia.layers)!=2 then return error(7744,"Retail console shader did not resolve both stages") end if
  if consoleMedia.layers[0].imageName!="gfx/misc/console01.tga" or consoleMedia.layers[1].imageName!="gfx/misc/console02.jpg" then return error(7744,"Retail console shader artwork mismatch") end if
  first=consoleMedia.layers[0].stage;second=consoleMedia.layers[1].stage
  scrolled=materials.transformUVAt(first,[0.0,0.0],[0.0,0.0,0.0],1000)
  if scrolled is error or scrolled[0]<0.039 or scrolled[0]>0.041 or scrolled[1]!=0.0 or len(first.uvMods)!=2 or len(second.uvMods)!=3 or second.blend!=materials.BLEND_ADD then
    return error(7744,"Retail console runtime stages lost their UV animation or blend")
  end if
  map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));state=match.bootWithQvms(archive,map,1000,args[1]);if state is error then return state end if
  runtime=match.clientConsoleState(state);if runtime==void or not runtime.initialized then return error(7744,"productive console runtime missing") end if
  transcript=console.dumpText(runtime);if len(state.context.prints)==0 or len(bytes(transcript))==0 then return error(7744,"retail VM prints did not enter console transcript") end if
  match.connectLocal(state,0);match.snapshot(state,0);opened=match.toggleClientConsole(state);draw=match.clientConsoleView(state,1050,50,"MiniQuake3")
  if not opened or draw.mode!="solid" or runtime.displayFrac<=0.0 or len(draw.solid.glyphs)==0 then return error(7744,"productive console toggle/animation/draw failed") end if
  scaledLines=draw.solid.scanlines*720/480;if draw.solid.scanlines<70 or draw.solid.scanlines>72 or scaledLines<105 or scaledLines>108 then return error(7744,"productive 1280x720 console applied reference scaling more than once") end if
  before=runtime.display;if not match.clientTextKey(state,input.K_PGUP,false,false) or runtime.display!=before-2 then return error(7744,"productive console page-up callback missing") end if
  if not match.clientTextKey(state,input.K_MWHEELUP,false,true) or runtime.display!=before-8 then return error(7744,"productive accelerated console scroll callback missing") end if
  match.clientTextKey(state,input.K_END,false,true);if runtime.display!=runtime.current then return error(7744,"productive console bottom callback missing") end if
  console.Con_Close(runtime);if runtime.displayFrac!=0.0 then return error(7744,"productive console close failed") end if
  console.CL_ConsolePrint(runtime,"\ncatcher-notify",640);keyTraps.setCatcher(state.context.cgameKeys,console.KEYCATCH_UI);state.context.clientTextInput.catcher=console.KEYCATCH_UI;match.updateClientConsole(state,1060,10)
  if runtime.uiOrCgameCatcher!=console.KEYCATCH_UI or len(console.Con_DrawNotify(runtime).lines)!=0 then return error(7744,"productive UI catcher did not suppress notify") end if
  state.context.commandState.buffer="";state.context.uiClient.connState=console.CA_DISCONNECTED;state.context.clientTextInput.connectionState=console.CA_DISCONNECTED;keyTraps.setCatcher(state.context.cgameKeys,input.KEYCATCH_CONSOLE);state.context.clientTextInput.catcher=input.KEYCATCH_CONSOLE;match.toggleClientConsole(state)
  if state.context.commandState.buffer!="d1\n" then return error(7744,"productive disconnected console did not start demo loop") end if
  print("PASS: retail cl_console qvmBytes="+str(len(retail))+" prints="+str(len(state.context.prints))+" transcriptBytes="+str(len(bytes(transcript)))+" glyphs="+str(len(draw.solid.glyphs)));match.shutdown(state);return 0
end function
