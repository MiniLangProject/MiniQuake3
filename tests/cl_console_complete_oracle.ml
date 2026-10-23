// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.cl_console as con
import mq3.client.console_input as input
import mq3.compat.numeric as numeric
function ch(state,line,column) return state.text[con.lineOffset(state,line)+column]&255 end function
function color(state,line,column) return (state.text[con.lineOffset(state,line)+column]>>8)&7 end function
function main(args)
  state=con.create(input.create(78,input.services(void)),con.services(void));state.realtime=100;con.CL_ConsolePrint(state,"alpha ^1red\nline",640);print("print|"+str(state.linewidth)+"|"+str(state.totallines)+"|"+str(state.current)+"|"+str(state.display)+"|"+str(state.x)+"|"+decode(bytes(1,ch(state,state.current-1,0)))+"|"+decode(bytes(1,ch(state,state.current-1,6)))+"|"+str(color(state,state.current-1,6))+"|"+decode(bytes(1,ch(state,state.current,0)))+"|"+str(state.times[state.current%4]))
  before=state.current;state.realtime=200;con.CL_ConsolePrint(state,"[skipnotify] hidden\n",640);print("skip|"+str(state.current-before)+"|"+str(state.times[(state.current+3)%4])+"|"+str(state.times[state.current%4]))
  con.Con_Bottom(state);before=state.display;con.Con_PageUp(state);first=state.display-before;con.Con_PageDown(state);second=state.display-before;con.Con_Top(state);print("scroll|"+str(first)+"|"+str(second)+"|"+str(state.current-state.display))
  state.keyCatchers=1;state.realFrametime=50;state.displayFrac=0.0;con.Con_RunConsole(state);print("animate|"+str(numeric.trunc32(state.displayFrac*100.0))+"|"+str(numeric.trunc32(state.finalFrac*100.0)));con.Con_RunConsole(state);con.Con_RunConsole(state);con.Con_RunConsole(state);print("clamp|"+str(numeric.trunc32(state.displayFrac*100.0)))
  con.Con_CheckResize(state,800);print("resize|"+str(state.linewidth)+"|"+str(state.totallines)+"|"+decode(bytes(1,ch(state,state.current-2,0)))+"|"+decode(bytes(1,ch(state,state.current-1,0))));return 0
end function
