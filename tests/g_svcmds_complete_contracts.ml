// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_svcmds as svc
import mq3.game.ip_filters as ip
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.qcommon.cvar as cv
import mq3.collision.world as cm
import std.fs as fs

struct Context prints commands cvars end struct
function require(ok,label) if not ok then return error(499,"g_svcmds contract: "+label) end if;return 1 end function
function printed(level,text) level.context.prints=level.context.prints+[text];return void end function
function svcConsole(level,when,text) level.context.commands=level.context.commands+[[when,text]];return void end function
function server(level,slot,text) level.context.commands=level.context.commands+[[slot,text]];return void end function
function setCvar(level,name,text) level.context.cvars=level.context.cvars+[[name,text]];return void end function
function setup(world)
  level=game.create(world);spawn.create(level,"");level.context=Context([],[],[]);level.gamePrintFn=printed;level.consoleCommandFn=svcConsole;level.serverCommandFn=server;level.cvarSetFn=setCvar
  ban=cv.createVm();mode=cv.createVm();ban.string="";mode.integer=1;ip.bindVm(level,ban,mode)
  level.maxclients=2;level.maxclientsCvar=2;level.num_entities=64
  for slot=0 to 1 ent=game.initEntity(level.entities[slot]);game.bindClient(level,ent,level.clients[slot]);ent.client.connected=2;ent.client.netname="player"+str(slot) end for
  return level
end function
function contracts(world)
  checks=0;level=setup(world);parsed=ip.Filter(0,0)
  checks=checks+require(svc.StringToFilter(level,"192.168.*.*",parsed) and parsed.mask==65535 and parsed.compare==0x0000a8c0,"StringToFilter")
  svc.AddIP(level,"10.20.*.*");checks=checks+require(ip.get(level).count==1 and level.context.cvars[0][1]=="10.20.*.* ","AddIP and UpdateIPBans")
  checks=checks+require(svc.G_FilterPacket(level,"10.20.1.2"),"G_FilterPacket")
  svc.Svcmd_RemoveIP_f(level,["removeip","10.20.*.*"]);checks=checks+require(ip.get(level).filters[0].compare==0xffffffff,"Svcmd_RemoveIP_f")
  svc.Svcmd_AddIP_f(level,["addip","1.2.3.4"]);checks=checks+require(ip.get(level).filters[0].compare==0x04030201,"Svcmd_AddIP_f")
  checks=checks+require(svc.ClientForString(level,"PLAYER1")==level.clients[1],"ClientForString")
  ent=game.spawn(level);ent.classname="target_test";ent.s.eType=0;svc.Svcmd_EntityList_f(level)
  checks=checks+require(level.context.prints[len(level.context.prints)-2]=="target_test","Svcmd_EntityList_f")
  checks=checks+require(svc.ConsoleCommand(level,["listip"]) and level.context.commands[len(level.context.commands)-1]==[0,"g_banIPs\n"],"ConsoleCommand")
  level.dedicated=1;checks=checks+require(svc.ConsoleCommand(level,["say","hello","arena"]) and level.context.commands[len(level.context.commands)-1]==[-1,"print \"server: hello arena\""],"dedicated chat")
  // G_ProcessIPBans deliberately ignores a final token without a trailing space.
  ban=ip.filterVm(level,"g_banIPs");ban.string="5.6.*.* ";ban.copyGeneration=ban.copyGeneration+1;svc.G_ProcessIPBans(level)
  checks=checks+require(ip.get(level).count>=2,"G_ProcessIPBans")
  return checks
end function
function main(args) world=cm.loadWorld(fs.readAllBytes(args[0]),true);checks=contracts(world);print("PASS: "+str(checks)+" complete g_svcmds contracts");return 0 end function
