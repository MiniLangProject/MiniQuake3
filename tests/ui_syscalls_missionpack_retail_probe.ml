import mq3.client.ui_syscalls_missionpack as ui
import mq3.format.pk3 as pk3
import mq3.vm.pc_parser as pc
import mq3.compat.numeric as n

struct Retail archive parser cvars binding servers cdkey renderer sound filesystem cinematic parserCalls end struct
function req(ok,label) if not ok then return error(7822,"Retail UI syscalls: "+label) end if;return 1 end function
function loadFile(context,name) return pk3.read(context.archive,name) end function
function asset(context,name,kind)
  data=pk3.read(context.archive,name);if data is error then return data end if
  if kind==1 then context.renderer=context.renderer+1 else if kind==2 then context.sound=context.sound+1 else if kind==3 then context.filesystem=context.filesystem+1 else context.cinematic=context.cinematic+1 end if
  return len(data)
end function
function host(context,opcode,args)
  if opcode==ui.UI_FS_FOPENFILE then return asset(context,args[0],3)
  else if opcode==ui.UI_R_REGISTERMODEL or opcode==ui.UI_R_REGISTERSHADERNOMIP then result=asset(context,args[0],1);if result is error then return result end if;return context.renderer+100
  else if opcode==ui.UI_S_REGISTERSOUND then result=asset(context,args[0],2);if result is error then return result end if;return context.sound+200
  else if opcode==ui.UI_CVAR_SET then context.cvars=context.cvars+[[args[0],args[1]]];return 0
  else if opcode==ui.UI_CVAR_VARIABLEVALUE then return n.floatBits(90.0)
  else if opcode==ui.UI_KEY_SETBINDING then context.binding=[args[0],args[1]];return 0
  else if opcode==ui.UI_LAN_ADDSERVER then context.servers=context.servers+[[args[0],args[1],args[2]]];return len(context.servers)
  else if opcode==ui.UI_CIN_PLAYCINEMATIC then result=asset(context,args[0],4);if result is error then return result end if;return 1
  else if opcode==ui.UI_SET_CDKEY then context.cdkey=args[0];return 0
  else if opcode==ui.UI_GET_CDKEY then args[0][0]=context.cdkey;return 0
  else if opcode==ui.UI_VERIFY_CDKEY then if args[0]==context.cdkey and len(bytes(args[0]))==16 then return 1 end if;return 0
  else if opcode==ui.UI_PC_ADD_GLOBAL_DEFINE then return pc.addDefine(context.parser,args[0])
  else if opcode==ui.UI_PC_LOAD_SOURCE then context.parserCalls=context.parserCalls+1;return pc.load(context.parser,args[0])
  else if opcode==ui.UI_PC_READ_TOKEN then token=pc.read(context.parser,args[0]);if token==void or token is error then return 0 end if;args[1][0]=token;return 1
  else if opcode==ui.UI_PC_FREE_SOURCE then return pc.free(context.parser,args[0]) end if
  return 0
end function

function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if
  context=Retail(archive,void,[],void,[],"",0,0,0,0,0);context.parser=pc.create(context,loadFile);state=ui.dllEntry(host,context);count=0
  size=ui.trap_FS_FOpenFile(state,"scripts/arenas.txt",[0],0);count=count+req(size>1000 and context.filesystem==1,"Retail filesystem")
  model=ui.trap_R_RegisterModel(state,"models/ammo/grenade1.md3");shader=ui.trap_R_RegisterShaderNoMip(state,"gfx/2d/bigchars.tga");count=count+req(model==101 and shader==102 and context.renderer==2,"Retail renderer assets")
  sound=ui.trap_S_RegisterSound(state,"sound/feedback/1_frag.wav",0);count=count+req(sound==201 and context.sound==1,"Retail sound asset")
  ui.trap_Cvar_Set(state,"s_volume","0.8");volume=ui.trap_Cvar_VariableValue(state,"r_gamma");count=count+req(context.cvars[0][0]=="s_volume" and n.floatBits(volume)==n.floatBits(90.0),"cvar ABI")
  ui.trap_Key_SetBinding(state,32,"+moveup");count=count+req(context.binding[0]==32 and context.binding[1]=="+moveup","input binding")
  added=ui.trap_LAN_AddServer(state,1,"localhost","127.0.0.1:27960");count=count+req(added==1 and context.servers[0][2]=="127.0.0.1:27960","LAN server")
  cinematic=ui.trap_CIN_PlayCinematic(state,"video/demoEnd.RoQ",0,0,640,480,0);count=count+req(cinematic==1 and context.cinematic==1,"Retail cinematic")
  ui.trap_SetCDKey(state,"1234567890ABCDEF");key=[""];ui.trap_GetCDKey(state,key,17);count=count+req(key[0]=="1234567890ABCDEF" and ui.trap_VerifyCDKey(state,key[0],"")==1,"CD-key ABI")
  count=count+req(ui.trap_PC_AddGlobalDefine(state,"MISSIONPACK 1")==1,"parser define");source=ui.trap_PC_LoadSource(state,"scripts/arenas.txt");token=[void];read=ui.trap_PC_ReadToken(state,source,token);count=count+req(source>0 and read==1 and token[0].text=="{" and context.parserCalls==1,"Retail parser")
  count=count+req(ui.trap_PC_FreeSource(state,source)==1,"parser free")
  count=count+req(state.calls==16,"native wrapper accounting")
  print("PASS: "+str(count)+" Retail Missionpack UI syscall probes renderer="+str(context.renderer)+" sound="+str(context.sound)+" fs="+str(context.filesystem)+" cinematic="+str(context.cinematic));return 0
end function
