import mq3.client.ui_atoms_missionpack as atoms
import mq3.client.ui_syscalls_missionpack as ui
import mq3.compat.numeric as n

function bit(value) return ui.PASSFLOAT(value) end function
function host(context,opcode,args)
  if opcode==ui.UI_CMD_EXECUTETEXT then print("cmd|"+str(args[0])+"|d1")
  else if opcode==ui.UI_R_REGISTERSHADERNOMIP then print("shader|"+args[0]);return 77
  else if opcode==ui.UI_R_DRAWSTRETCHPIC then row="draw";for each value in args row=row+"|"+str(value) end for;print(row)
  else if opcode==ui.UI_R_SETCOLOR then if args[0]==void then print("color|null") else row="color";for each value in args[0] row=row+"|"+str(bit(value)) end for;print(row) end if
  else if opcode==ui.UI_UPDATESCREEN then print("update") end if
  return 0
end function
function flag(value) if value then return 1 end if;return 0 end function
function main(args)
  sys=ui.dllEntry(host,void);state=atoms.create(sys);atoms.setDisplayContext(state,2.0,0.5,50,70,9)
  print("clamp|"+str(bit(atoms.UI_ClampCvar(1.0,3.0,0.0)))+"|"+str(bit(atoms.UI_ClampCvar(1.0,3.0,2.0)))+"|"+str(bit(atoms.UI_ClampCvar(1.0,3.0,4.0))))
  atoms.UI_StartDemoLoop(state);value=atoms.UI_AdjustFrom640(state,10.0,20.0,30.0,40.0);print("adjust|"+str(bit(value[0]))+"|"+str(bit(value[1]))+"|"+str(bit(value[2]))+"|"+str(bit(value[3])))
  atoms.UI_DrawNamedPic(state,1.0,2.0,3.0,4.0,"gfx/2d/bigchars");atoms.UI_DrawHandlePic(state,1.0,2.0,-3.0,-4.0,5);atoms.UI_FillRect(state,1.0,2.0,3.0,4.0,[0.0,0.0,0.0,1.0]);atoms.UI_DrawSides(state,1.0,2.0,3.0,4.0);atoms.UI_DrawTopBottom(state,1.0,2.0,3.0,4.0);atoms.UI_DrawRect(state,1.0,2.0,3.0,4.0,[1.0,1.0,1.0,1.0]);atoms.UI_SetColor(state,[0.0,0.0,0.0,1.0]);atoms.UI_UpdateScreen(state);atoms.UI_DrawTextBox(state,2,3,4,5)
  print("cursor|"+str(flag(atoms.UI_CursorInRect(state,50,70,0,0)))+"|"+str(flag(atoms.UI_CursorInRect(state,0,0,50,70)))+"|"+str(flag(atoms.UI_CursorInRect(state,51,70,10,10))))
  return 0
end function
