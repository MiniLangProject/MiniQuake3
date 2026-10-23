// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.cl_console as console
import mq3.client.console_input as input
import std.fs as fs

struct Capture demos crosshair attacker end struct
function startDemo(c) c.demos=c.demos+1;return void end function
function crosshair(c) return c.crosshair end function
function attacker(c) return c.attacker end function
function req(value,label) if not value then return error(7743,"cl_console: "+label) end if;return 1 end function
function make()
  capture=Capture(0,5,7);host=console.services(capture);host.startDemoLoopFn=startDemo;host.crosshairPlayerFn=crosshair;host.lastAttackerFn=attacker
  edit=input.create(78,input.services(void));state=console.create(edit,host);console.Con_Init(state,640);return [state,capture]
end function
function main(args)
  pair=make();state=pair[0];capture=pair[1];count=0
  count=count+req(state.initialized and state.linewidth==78 and state.totallines==420,"init geometry")
  count=count+req(len(state.commands)==7 and state.commands[0]=="toggleconsole" and state.commands[6]=="condump","command registration")
  state.realtime=100;console.CL_ConsolePrint(state,"alpha beta",640);count=count+req(console.lineText(state,state.current)=="alpha beta","basic transcript")
  console.CL_ConsolePrint(state,"\rZ",640);count=count+req(console.lineText(state,state.current)=="Zlpha beta","carriage return")
  console.CL_ConsolePrint(state,"\n^1red ^7white",640);count=count+req(console.lineText(state,state.current)=="red white","newline and color stripping")
  base=console.lineOffset(state,state.current);count=count+req(((state.text[base]>>8)&7)==1 and ((state.text[base+4]>>8)&7)==7,"color cells")
  current=state.current;state.realtime=200;console.CL_ConsolePrint(state,"[skipnotify]hidden\n",640);count=count+req(state.times[(state.current-1)%4]==0 and state.current==current+1,"skip notify")
  state.realtime=300;console.CL_ConsolePrint(state,"visible",640);notify=console.Con_DrawNotify(state);count=count+req(len(notify.lines)>=1 and notify.lines[len(notify.lines)-1].text=="visible","notify visible")
  state.realtime=3401;notify=console.Con_DrawNotify(state);count=count+req(len(notify.lines)==0,"notify expiry")
  console.Con_ClearNotify(state);count=count+req(state.times==[0,0,0,0],"clear notify")
  console.Con_Bottom(state);bottom=state.display;console.Con_PageUp(state);count=count+req(state.display==bottom-2,"page up");console.Con_PageDown(state);count=count+req(state.display==bottom,"page down")
  console.Con_Top(state);count=count+req(state.current-state.display<state.totallines,"top clamp");console.Con_Bottom(state);count=count+req(state.display==state.current,"bottom")
  oldCurrent=state.current;console.CL_ConsolePrint(state,"\nresize-kept",640);console.Con_CheckResize(state,800);count=count+req(state.linewidth==98 and console.lineText(state,state.current)=="resize-kept","resize preservation")
  console.Con_Clear_f(state);count=count+req(console.lineText(state,state.current)=="" and state.display==state.current,"clear")
  console.CL_ConsolePrint(state,"first\nsecond   ",800);dump=console.dumpText(state);count=count+req(dump=="first\nsecond\n","dump trim")
  target="build/cl_console_contract-condump.txt";written=console.Con_Dump_f(state,target);count=count+req(written==len(bytes(dump)) and decode(fs.readAllBytes(target))==dump,"dump file")
  state.connectionState=console.CA_ACTIVE;count=count+req(console.Con_ToggleConsole_f(state) and (state.keyCatchers&input.KEYCATCH_CONSOLE)!=0,"toggle open")
  state.realFrametime=50;state.conSpeed=3.0;frac=console.Con_RunConsole(state);count=count+req(frac==0.15 and state.finalFrac==0.5,"animate open")
  console.Con_RunConsole(state);console.Con_RunConsole(state);console.Con_RunConsole(state);count=count+req(state.displayFrac==0.5,"animation clamp")
  state.connectionState=console.CA_DISCONNECTED;state.keyCatchers=input.KEYCATCH_CONSOLE;state.consoleInput.catcher=state.keyCatchers;count=count+req(not console.Con_ToggleConsole_f(state) and capture.demos==1,"disconnected demo loop")
  state.connectionState=console.CA_ACTIVE;state.keyCatchers=0;state.consoleInput.catcher=0;count=count+req(console.Con_MessageMode_f(state) and not state.consoleInput.chatTeam and state.consoleInput.chat.widthInChars==30,"message mode")
  console.Con_MessageMode_f(state);count=count+req(console.Con_MessageMode2_f(state) and state.consoleInput.chatTeam and state.consoleInput.chat.widthInChars==25,"team message")
  console.Con_MessageMode2_f(state);count=count+req(console.Con_MessageMode3_f(state) and state.consoleInput.chatPlayerNum==5,"crosshair tell")
  console.Con_MessageMode3_f(state);count=count+req(console.Con_MessageMode4_f(state) and state.consoleInput.chatPlayerNum==7,"attacker tell")
  console.Con_MessageMode4_f(state);capture.crosshair=99;count=count+req(not console.Con_MessageMode3_f(state) and state.consoleInput.chatPlayerNum==-1,"invalid tell ignored")
  state.keyCatchers=input.KEYCATCH_CONSOLE;state.consoleInput.catcher=state.keyCatchers;state.connectionState=console.CA_ACTIVE;view=console.Con_DrawInput(state);count=count+req(view.active and view.kind=="console","draw input bridge")
  state.display=state.current-1;solid=console.Con_DrawSolidConsole(state,0.5,640,480,"Q3 1.32");count=count+req(solid.scanlines==240 and solid.backscrolled and len(solid.glyphs)>0,"solid render model")
  state.displayFrac=0.5;draw=console.Con_DrawConsole(state,800,640,480,"Q3 1.32");count=count+req(draw.mode=="solid","draw solid selection")
  state.displayFrac=0.0;state.connectionState=console.CA_ACTIVE;state.realtime=400;console.CL_ConsolePrint(state,"\nnotify",800);draw=console.Con_DrawConsole(state,800,640,480,"Q3");count=count+req(draw.mode=="notify" and len(draw.notify.lines)>0,"draw notify selection")
  state.keyCatchers=input.KEYCATCH_CONSOLE;state.displayFrac=0.3;count=count+req(console.Con_Close(state) and (state.keyCatchers&input.KEYCATCH_CONSOLE)==0 and state.displayFrac==0.0,"close")
  state.clientRunning=false;count=count+req(not console.Con_Close(state),"close ignored while stopped")
  print("PASS: "+str(count)+" complete cl_console contracts");return 0
end function
