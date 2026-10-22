import mq3.client.ui_atoms_missionpack as atoms
import mq3.client.ui_syscalls_missionpack as ui
import mq3.client.ui_gameinfo_missionpack as gameinfo
import mq3.format.pk3 as pk3
import mq3.compat.numeric as n

struct Host archive argv opened assets commands cvars internalActions end struct
function req(ok,label) if not ok then return error(7832,"Retail Missionpack UI atoms: "+label) end if;return 1 end function
function syscall(host,opcode,args)
  if opcode==ui.UI_ARGC then return len(host.argv)
  else if opcode==ui.UI_ARGV then args[1][0]=host.argv[args[0]];return 0
  else if opcode==ui.UI_CVAR_VARIABLEVALUE then if args[0]=="protocol" then return n.floatBits(68.0) end if;return 0
  else if opcode==ui.UI_CVAR_VARIABLESTRINGBUFFER then args[1][0]="retail";return 0
  else if opcode==ui.UI_CVAR_SET then host.cvars=host.cvars+[[args[0],args[1]]];return 0
  else if opcode==ui.UI_FS_FOPENFILE then host.opened=host.opened+[args[0]];args[1][0]=1;return -1
  else if opcode==ui.UI_R_REGISTERSHADERNOMIP then name=args[0];path=name;data=try(pk3.read(host.archive,path));if data is error then path=name+".tga";data=pk3.read(host.archive,path) end if;if data is error then return data end if;host.assets=host.assets+[[path,len(data)]];return len(host.assets)+10
  else if opcode==ui.UI_CMD_EXECUTETEXT then host.commands=host.commands+[[args[0],args[1]]];return 0
  else if opcode==ui.UI_R_DRAWSTRETCHPIC or opcode==ui.UI_R_SETCOLOR then return 0 end if
  return 0
end function
function capture(host,kind,args) host.internalActions=host.internalActions+[[kind,args]];return 1 end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if;arenaText=pk3.read(archive,"scripts/arenas.txt");if arenaText is error then return arenaText end if;catalog=gameinfo.create(false);gameinfo.UI_LoadArenas(catalog,"scripts/arenas.txt",decode(arenaText),[]);map=catalog.maps[0].mapLoadName
  host=Host(archive,["ui_cache"],[],[],[],[],[]);sys=ui.dllEntry(syscall,host);state=atoms.create(sys);atoms.setInternalHandler(state,host,capture);atoms.setDisplayContext(state,1.6,1.5,320,240,1);count=0
  atoms.UI_StartDemoLoop(state);count=count+req(host.commands[0][0]==atoms.EXEC_APPEND and host.commands[0][1]=="d1\n","demo command")
  shader=atoms.UI_DrawNamedPic(state,0.0,0.0,640.0,480.0,"gfx/2d/bigchars");count=count+req(shader==11 and host.assets[0][0]=="gfx/2d/bigchars.tga" and host.assets[0][1]>1000,"Retail UI shader")
  atoms.UI_DrawHandlePic(state,0.0,0.0,640.0,480.0,shader);count=count+req(sys.lastOpcode==ui.UI_R_DRAWSTRETCHPIC and sys.lastArguments[2]==ui.PASSFLOAT(1024.0) and sys.lastArguments[3]==ui.PASSFLOAT(720.0),"display-context output")
  atoms.UI_LoadBestScores(state,map,4);count=count+req(host.opened[0]=="games/q3dm1_4.game" and host.opened[1]=="demos/q3dm1_4.dm_68","Retail map/version score paths")
  count=count+req(atoms.UI_ConsoleCommand(state,1000) and host.internalActions[0][0]=="display-cache-all","Missionpack display cache command")
  count=count+req(atoms.UI_CursorInRect(state,300,200,40,80),"display-context cursor")
  print("PASS: "+str(count)+" Retail Missionpack UI atoms probes map="+map+" shaderBytes="+str(host.assets[0][1]));return 0
end function
