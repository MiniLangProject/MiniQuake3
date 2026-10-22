// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_utils as utils
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.playerstate as ps
import mq3.game.constants as c
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs

struct Context
  commands
  diagnostics
  uses
  damage
  polygons
end struct
function require(ok,message) if not ok then return error(7691,message) end if;return 1 end function
function serverCommand(level,slot,text) level.context.commands=level.context.commands+[[slot,text]];return void end function
function diagnostic(level,text) level.context.diagnostics=level.context.diagnostics+[text];return void end function
function used(level,self,other,activator) level.context.uses=level.context.uses+[[self.slot,other.slot,activator.slot]];return void end function
function damage(level,hit,inflictor,attacker,dir,point,amount,flags,mod) level.context.damage=level.context.damage+[[hit.slot,inflictor.slot,attacker.slot,amount,flags,mod]];return void end function
function polygon(context,color,points) context.polygons=context.polygons+[[color,points]];return 77 end function
function setup(world)
  level=game.create(world);spawn.create(level,"");level.context=Context([],[],[],[],[])
  level.serverCommandFn=serverCommand;level.gamePrintFn=diagnostic;level.damageFn=damage
  return level
end function
function client(level,slot,team,connected)
  ent=level.entities[slot];utils.G_InitGentity(ent);cl=game.createClient(ps.create(),team,[0,0,0]);cl.connected=connected;game.bindClient(level,ent,cl)
  return ent
end function
function contracts(world)
  count=0;level=setup(world)
  count=count+require(utils.G_FindConfigstringIndex(level,"alpha",100,4,true)==1 and utils.G_FindConfigstringIndex(level,"alpha",100,4,false)==1,"config index")
  count=count+require(utils.G_ModelIndex(level,"models/a.md3")==1 and utils.G_SoundIndex(level,"sound/a.wav")==1,"model/sound indexes")
  red=client(level,0,c.TEAM_RED,2);blue=client(level,1,c.TEAM_BLUE,2);connecting=client(level,2,c.TEAM_RED,1);level.maxclients=3
  utils.G_TeamCommand(level,c.TEAM_RED,"cp test")
  count=count+require(len(level.context.commands)==1 and level.context.commands[0][0]==0 and level.context.commands[0][1]=="cp test","team command")
  first=utils.G_Spawn(level);first.classname="trigger";first.targetname="DoOr";first.target="unused"
  second=utils.G_Spawn(level);second.classname="trigger";second.targetname="door";second.use=used
  count=count+require(utils.G_Find(level,void,"targetname","door")==first and utils.G_Find(level,first,"targetname","door")==second,"G_Find resume and case")
  count=count+require(utils.G_Find(level,void,"classname","TRIGGER")==first and utils.G_Find(level,second,"targetname","missing")==void,"G_Find fields")
  single=utils.G_Spawn(level);single.targetname="single";count=count+require(utils.G_PickTarget(level,"single")==single,"pick target")
  count=count+require(utils.G_PickTarget(level,void)==void and level.context.diagnostics[len(level.context.diagnostics)-1]=="G_PickTarget called with NULL targetname\n","pick diagnostic")
  source=utils.G_Spawn(level);source.target="door";source.targetShaderName="old";source.targetShaderNewName="new";level.time=2500
  utils.G_UseTargets(level,source,red)
  count=count+require(len(level.context.uses)==1 and level.context.uses[0][0]==second.slot,"use targets")
  count=count+require(utils.BuildShaderStateConfig(level)=="old=new: 2.50@" and level.spawner.configstrings[24]=="old=new: 2.50@","shader remap")
  utils.AddRemap(level,"OLD","next",3.0);count=count+require(utils.BuildShaderStateConfig(level)=="old=next: 3.00@","shader update")
  vector=utils.tv(1.25,-2.5,3.75);count=count+require(n.floatBits(vector[0])==1067450368 and utils.vtos(level,[-2.9,3.9,7.1])=="(-2 3 7)","temporary formatting")
  angles=[0.0,-2.0,0.0];movedir=[0.0,0.0,0.0];utils.G_SetMovedir(angles,movedir)
  count=count+require(movedir==[0.0,0.0,-1.0] and angles==[0.0,0.0,0.0] and utils.vectoyaw([0.0,-1.0,0.0])==270.0,"direction helpers")
  lifecycle=utils.G_Spawn(level);slot=lifecycle.slot;count=count+require(lifecycle.inuse and lifecycle.classname=="noclass" and not utils.G_EntitiesFree(level),"spawn/init/free query")
  utils.G_FreeEntity(level,lifecycle);count=count+require(not lifecycle.inuse and lifecycle.classname=="freed" and lifecycle.freetime==level.time,"free entity")
  temp=utils.G_TempEntity(level,[1.6,-2.6,3.4],9);count=count+require(temp.s.eType==c.ET_EVENTS+9 and temp.freeAfterEvent and temp.r.linked and temp.r.currentOrigin==[1.0,-2.0,3.0],"temporary entity")
  player=red;player.client.ps.eventSequence=0;utils.G_AddPredictableEvent(level,player,12,34)
  count=count+require(player.client.ps.events[0]==12 and player.client.ps.eventParms[0]==34 and player.client.ps.eventSequence==1,"predictable event")
  utils.G_AddEvent(level,player,15,7);count=count+require((player.client.ps.externalEvent&255)==15 and player.client.ps.externalEventParm==7 and player.eventTime==level.time,"client event")
  plain=utils.G_Spawn(level);utils.G_AddEvent(level,plain,16,8);count=count+require((plain.s.event&255)==16 and plain.s.eventParm==8,"entity event")
  before=len(level.context.diagnostics);utils.G_AddEvent(level,plain,0,0);count=count+require(len(level.context.diagnostics)==before+1,"zero event diagnostic")
  plain.r.currentOrigin=[10.0,20.0,30.0];before=level.num_entities;utils.G_Sound(level,plain,3,55);sound=level.entities[level.num_entities-1]
  count=count+require(level.num_entities==before+1 and sound.s.eType==c.ET_EVENTS+c.EV_GENERAL_SOUND and sound.s.eventParm==55,"sound event")
  utils.G_SetOrigin(plain,[4.0,5.0,6.0]);count=count+require(plain.s.pos.trBase==[4.0,5.0,6.0] and plain.r.currentOrigin==[4.0,5.0,6.0] and plain.s.pos.trType==c.TR_STATIONARY,"set origin")
  victim=blue;victim.client.ps.origin=[0.0,0.0,0.0];victim.r.currentOrigin=[0.0,0.0,0.0];victim.r.mins=[-15.0,-15.0,-24.0];victim.r.maxs=[15.0,15.0,32.0];game.link(level,victim)
  player.client.ps.origin=[0.0,0.0,0.0];player.r.mins=[-15.0,-15.0,-24.0];player.r.maxs=[15.0,15.0,32.0];utils.G_KillBox(level,player)
  count=count+require(len(level.context.damage)==1 and level.context.damage[0]==[victim.slot,player.slot,player.slot,100000,8,c.MOD_TELEFRAG],"kill box")
  id=utils.DebugLine([0.0,0.0,0.0],[10.0,0.0,0.0],5,polygon,level.context)
  points=level.context.polygons[0][1];count=count+require(id==77 and points[0]==[0.0,-2.0,0.0] and points[3]==[10.0,-2.0,0.0],"debug line")
  return count
end function
function main(args)
  world=cm.loadWorld(fs.readAllBytes(args[0]),true);count=contracts(world);print("PASS: "+str(count)+" g_utils complete contracts");return 0
end function
