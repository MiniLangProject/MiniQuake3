import mq3.client.ui_syscalls_missionpack as ui
import mq3.compat.numeric as n
function flag(value) if value then return 1 end if;return 0 end function

function capture(context,opcode,args)
  if opcode==ui.UI_CVAR_SETVALUE then print("cvar|"+str(opcode)+"|"+str(flag(args[0]=="alpha"))+"|"+str(args[1]))
  else if opcode==ui.UI_FS_FOPENFILE then print("fs|"+str(opcode)+"|"+str(flag(args[0]=="alpha"))+"|"+str(flag(args[1]==101))+"|"+str(args[2]))
  else if opcode==ui.UI_R_ADDLIGHTTOSCENE then print("light|"+str(opcode)+"|"+str(flag(args[0]==101))+"|"+str(args[1])+"|"+str(args[2])+"|"+str(args[3])+"|"+str(args[4]))
  else if opcode==ui.UI_R_DRAWSTRETCHPIC then print("stretch|"+str(opcode)+"|"+str(args[0])+"|"+str(args[1])+"|"+str(args[2])+"|"+str(args[3])+"|"+str(args[4])+"|"+str(args[5])+"|"+str(args[6])+"|"+str(args[7])+"|"+str(args[8]))
  else if opcode==ui.UI_CM_LERPTAG then print("tag|"+str(opcode)+"|"+str(flag(args[0]==101))+"|"+str(args[1])+"|"+str(args[2])+"|"+str(args[3])+"|"+str(args[4])+"|"+str(flag(args[5]=="alpha")))
  else if opcode==ui.UI_LAN_ADDSERVER then print("lan|"+str(opcode)+"|"+str(args[0])+"|"+str(flag(args[1]=="alpha"))+"|"+str(flag(args[2]==101)))
  else if opcode==ui.UI_PC_READ_TOKEN then print("parser|"+str(opcode)+"|"+str(args[0])+"|"+str(flag(args[1]==101)))
  else if opcode==ui.UI_CIN_PLAYCINEMATIC then print("cin|"+str(opcode)+"|"+str(flag(args[0]=="alpha"))+"|"+str(args[1])+"|"+str(args[2])+"|"+str(args[3])+"|"+str(args[4])+"|"+str(args[5]))
  else if opcode==ui.UI_VERIFY_CDKEY then print("cd|"+str(opcode)+"|"+str(flag(args[0]=="alpha"))+"|"+str(flag(args[1]==101))) end if
  if opcode==ui.UI_CVAR_VARIABLEVALUE then return 0x3fc00000 end if
  return 700+opcode
end function

function main(args)
  state=ui.dllEntry(capture,void)
  opcodes=[ui.UI_ERROR,ui.UI_PRINT,ui.UI_MILLISECONDS,ui.UI_CVAR_SET,ui.UI_CVAR_VARIABLEVALUE,ui.UI_CVAR_VARIABLESTRINGBUFFER,ui.UI_CVAR_SETVALUE,ui.UI_CVAR_RESET,ui.UI_CVAR_CREATE,ui.UI_CVAR_INFOSTRINGBUFFER,ui.UI_ARGC,ui.UI_ARGV,ui.UI_CMD_EXECUTETEXT,ui.UI_FS_FOPENFILE,ui.UI_FS_READ,ui.UI_FS_WRITE,ui.UI_FS_FCLOSEFILE,ui.UI_FS_GETFILELIST,ui.UI_R_REGISTERMODEL,ui.UI_R_REGISTERSKIN,ui.UI_R_REGISTERSHADERNOMIP,ui.UI_R_CLEARSCENE,ui.UI_R_ADDREFENTITYTOSCENE,ui.UI_R_ADDPOLYTOSCENE,ui.UI_R_ADDLIGHTTOSCENE,ui.UI_R_RENDERSCENE,ui.UI_R_SETCOLOR,ui.UI_R_DRAWSTRETCHPIC,ui.UI_UPDATESCREEN,ui.UI_CM_LERPTAG,ui.UI_S_REGISTERSOUND,ui.UI_S_STARTLOCALSOUND,ui.UI_KEY_KEYNUMTOSTRINGBUF,ui.UI_KEY_GETBINDINGBUF,ui.UI_KEY_SETBINDING,ui.UI_KEY_ISDOWN,ui.UI_KEY_GETOVERSTRIKEMODE,ui.UI_KEY_SETOVERSTRIKEMODE,ui.UI_KEY_CLEARSTATES,ui.UI_KEY_GETCATCHER,ui.UI_KEY_SETCATCHER,ui.UI_GETCLIPBOARDDATA,ui.UI_GETGLCONFIG,ui.UI_GETCLIENTSTATE,ui.UI_GETCONFIGSTRING,ui.UI_LAN_GETPINGQUEUECOUNT,ui.UI_LAN_CLEARPING,ui.UI_LAN_GETPING,ui.UI_LAN_GETPINGINFO,ui.UI_CVAR_REGISTER,ui.UI_CVAR_UPDATE,ui.UI_MEMORY_REMAINING,ui.UI_GET_CDKEY,ui.UI_SET_CDKEY,ui.UI_R_REGISTERFONT,ui.UI_R_MODELBOUNDS,ui.UI_PC_ADD_GLOBAL_DEFINE,ui.UI_PC_LOAD_SOURCE,ui.UI_PC_FREE_SOURCE,ui.UI_PC_READ_TOKEN,ui.UI_PC_SOURCE_FILE_AND_LINE,ui.UI_S_STOPBACKGROUNDTRACK,ui.UI_S_STARTBACKGROUNDTRACK,ui.UI_REAL_TIME,ui.UI_LAN_GETSERVERCOUNT,ui.UI_LAN_GETSERVERADDRESSSTRING,ui.UI_LAN_GETSERVERINFO,ui.UI_LAN_MARKSERVERVISIBLE,ui.UI_LAN_UPDATEVISIBLEPINGS,ui.UI_LAN_RESETPINGS,ui.UI_LAN_LOADCACHEDSERVERS,ui.UI_LAN_SAVECACHEDSERVERS,ui.UI_LAN_ADDSERVER,ui.UI_LAN_REMOVESERVER,ui.UI_CIN_PLAYCINEMATIC,ui.UI_CIN_STOPCINEMATIC,ui.UI_CIN_RUNCINEMATIC,ui.UI_CIN_DRAWCINEMATIC,ui.UI_CIN_SETEXTENTS,ui.UI_R_REMAP_SHADER,ui.UI_VERIFY_CDKEY,ui.UI_LAN_SERVERSTATUS,ui.UI_LAN_GETSERVERPING,ui.UI_LAN_SERVERISVISIBLE,ui.UI_LAN_COMPARESERVERS,ui.UI_FS_SEEK,ui.UI_SET_PBCLSTATUS]
  row="opcodes";for each opcode in opcodes row=row+"|"+str(opcode) end for;print(row)
  print("float|"+str(ui.PASSFLOAT(1.5))+"|"+str(ui.PASSFLOAT(-2.25))+"|"+str(ui.PASSFLOAT(0.0)))
  ui.trap_Cvar_SetValue(state,"alpha",-2.25)
  print("floatret|"+str(ui.PASSFLOAT(ui.trap_Cvar_VariableValue(state,"alpha"))))
  print("openret|"+str(ui.trap_FS_FOpenFile(state,"alpha",101,2)))
  ui.trap_R_AddLightToScene(state,101,100.5,1.0,0.5,0.25)
  ui.trap_R_DrawStretchPic(state,1.0,-2.0,3.5,4.0,0.0,0.25,0.75,1.0,77)
  print("tagret|"+str(ui.trap_CM_LerpTag(state,101,9,10,11,0.375,"alpha")))
  print("lanret|"+str(ui.trap_LAN_AddServer(state,2,"alpha",101)))
  print("pcret|"+str(ui.trap_PC_ReadToken(state,41,101)))
  print("cinret|"+str(ui.trap_CIN_PlayCinematic(state,"alpha",1,2,3,4,5)))
  print("cdret|"+str(ui.trap_VerifyCDKey(state,"alpha",101)))
  return 0
end function
