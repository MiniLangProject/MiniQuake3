// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_ai_frame as frame
import mq3.game.bot_lifecycle as lifecycle
import mq3.game.entities as game
import mq3.game.constants as c
import mq3.game.entitystate as entitystate
import mq3.collision.world as cm
import mq3.qcommon.cvar as cv
import mq3.game.bot_fight_state as fight
import mq3.game.bot_combat_ai as combat
import std.fs as fs
import std.string as strings

struct Context
  events
  nullEntities
  liveEntities
  aas
  clock
  snapshot
  captured
end struct
function require(value,label) if not value then return error(499,"Bot AI frame contract: "+label) end if return 1 end function
function event(s,text) s.context.events=s.context.events+[text]; return void end function
function spawn(s) return event(s,"spawn") end function
function updateFrameCvar(s,name) return event(s,"update:"+name) end function
function report(s) return event(s,"report") end function
function usercmd(s,client,cmd) return event(s,"cmd:"+str(client)+":"+str(cmd.serverTime)+":"+str(cmd.buttons)+":"+str(cmd.forwardmove)) end function
function varset(s,name,value) return event(s,"var:"+name+"="+value) end function
function cvarset(s,name,value) return event(s,"cvar:"+name+"="+value) end function
function interbreed(s) return event(s,"interbreed") end function
function schedule(s) return event(s,"schedule") end function
function libstart(s,time) return event(s,"libstart:"+str(time)) end function
function aas(s) event(s,"aas"); return s.context.aas end function
function updateEntity(s,index,state)
  if state == void then s.context.nullEntities=s.context.nullEntities+1
  else s.context.liveEntities=s.context.liveEntities+1; if index==0 or index==70 then s.context.captured=state end if end if
  return void
end function
function floattime(s) return s.context.clock end function
function items(s) return event(s,"items") end function
function aastime(s) event(s,"aastime"); return 7.25 end function
function ai(s,client,think) return event(s,"ai:"+str(client)+":"+str(think)) end function
function input(s,bot,cmd,time,elapsed) cmd.serverTime=time; cmd.buttons=9; cmd.forwardmove=elapsed; return event(s,"input:"+str(bot.client)+":"+str(time)+":"+str(elapsed)) end function
function snapshot(s,client,sequence) return s.context.snapshot end function
function defaultReset(cs,client) return event(cs.context,"default-reset:"+str(client)) end function
function defaultNext(cs,client) return void end function
function defaultQueue(cs,chat,kind,message) return event(cs.context,"default-queue") end function
function defaultSetup(cs) return event(cs.context,"default-setup") end function
function battleObserver(f,b) event(f.context,"battle-observer");return true end function
function battleEnter(f,b,node,reason) event(f.context,"battle-enter:"+str(node));b.inuse=false;return void end function

function fixture(world)
  level=game.create(world); ls=lifecycle.create(cv.create()); s=frame.create(ls)
  s.context=Context([],0,0,true,1.0,-1,void)
  s.checkSpawnFn=spawn; s.updateCvarFn=updateFrameCvar; s.reportFn=report; s.userCommandFn=usercmd
  s.botLibVarSetFn=varset; s.cvarSetFn=cvarset; s.interbreedFn=interbreed; s.scheduleThinkFn=schedule
  s.botLibStartFrameFn=libstart; s.aasInitializedFn=aas; s.updateEntityFn=updateEntity
  s.floatTimeFn=floattime; s.updateEntityItemsFn=items; s.aasTimeFn=aastime; s.botAiFn=ai
  s.updateInputFn=input; s.snapshotEntityFn=snapshot
  ls.thinktime.integer=100; return [level,s]
end function
function bindBot(level,s,slot)
  bot=lifecycle.createBot(slot); s.lifecycleState.botstates[slot]=bot
  level.entities[slot].inuse=true; level.entities[slot].client=level.clients[slot]; level.clients[slot].connected=2
  return bot
end function
function has(events,wanted) for each value in events if value==wanted then return true end if end for return false end function
function containsEvent(events,wanted) for each value in events if strings.contains(value,wanted) then return true end if end for return false end function

function contracts(world)
  count=0; pair=fixture(world); level=pair[0]; s=pair[1]
  result=frame.getClientState(level,0)
  count=count+require(not result[0] and result[1].commandTime==0,"inactive client returns zero state")
  level.entities[0].inuse=true; level.entities[0].client=level.clients[0]; level.clients[0].ps.commandTime=77
  result=frame.getClientState(level,0); level.clients[0].ps.commandTime=88
  count=count+require(result[0] and result[1].commandTime==77,"client state is copied")
  count=count+require(try(frame.getClientState(level,64)) is error,"client slot guard")

  ent=level.entities[70]; ent.inuse=true; ent.r.linked=true; ent.s.number=70; ent.s.event=23
  result=frame.getEntityState(level,70); ent.s.event=24
  count=count+require(result[0] and result[1].number==70 and result[1].event==23,"entity state is copied")
  ent.r.linked=false; result=frame.getEntityState(level,70)
  count=count+require(not result[0] and result[1].number==0,"unlinked entity returns zero state")
  ent.r.linked=true; ent.r.svFlags=1; count=count+require(not frame.getEntityState(level,70)[0],"noclient entity filtered")

  s.context.snapshot=-1; snap=frame.getSnapshotEntity(level,s,0,9)
  count=count+require(snap[0]==-1 and snap[1].number==0,"snapshot end zeroes output")
  ent.r.svFlags=0; s.context.snapshot=70; snap=frame.getSnapshotEntity(level,s,0,9)
  count=count+require(snap[0]==10 and snap[1].number==70,"snapshot advances and resolves entity")

  pair=fixture(world); level=pair[0]; s=pair[1]; bindBot(level,s,2)
  s.lifecycleState.pause.integer=1; s.runtimes[2].lastucmd.buttons=5; s.runtimes[2].lastucmd.forwardmove=12
  count=count+require(frame.startFrame(level,s,250),"paused frame succeeds")
  count=count+require(has(s.context.events,"cmd:2:250:0:0"),"pause sends neutral command")
  count=count+require(not has(s.context.events,"interbreed") and s.localTime==0,"pause returns before scheduler time")
  count=count+require(len(s.context.events)==12,"pause performs spawn, ten updates and one command")

  pair=fixture(world); level=pair[0]; s=pair[1]; bindBot(level,s,1)
  s.lifecycleState.memorydump.integer=1; s.lifecycleState.saveroutingcache.integer=1; s.lifecycleState.report.integer=1
  level.entities[1].r.linked=true; level.entities[1].r.currentOrigin=[1.0,2.0,3.0]; level.entities[1].s.apos.trBase=[4.0,5.0,6.0]
  ent=level.entities[70]; ent.inuse=true; ent.r.linked=true; ent.r.currentOrigin=[7.0,8.0,9.0]; ent.r.currentAngles=[10.0,11.0,12.0]
  ent.r.mins=[-1.0,-2.0,-3.0]; ent.r.maxs=[1.0,2.0,3.0]; ent.r.bmodel=true; ent.s.eType=c.ET_MOVER; ent.s.modelindex2=17
  missile=level.entities[71]; missile.inuse=true; missile.r.linked=true; missile.s.eType=c.ET_MISSILE; missile.s.weapon=2
  hook=level.entities[72]; hook.inuse=true; hook.r.linked=true; hook.s.eType=c.ET_MISSILE; hook.s.weapon=c.WP_GRAPPLING_HOOK
  eventOnly=level.entities[73]; eventOnly.inuse=true; eventOnly.r.linked=true; eventOnly.s.eType=c.ET_EVENTS+1
  count=count+require(frame.startFrame(level,s,100),"scheduled frame succeeds")
  count=count+require(has(s.context.events,"report") and has(s.context.events,"var:memorydump=1") and has(s.context.events,"var:saveroutingcache=1"),"one-shot controls and report")
  count=count+require(has(s.context.events,"schedule") and has(s.context.events,"items") and s.botlibResidual==0,"library cadence and regular item update")
  count=count+require(s.context.liveEntities==3 and s.context.nullEntities==1021,"entity feed filters missile and event-only entities")
  count=count+require(s.context.captured.origin==[7.0,8.0,9.0] and s.context.captured.angles==[10.0,11.0,12.0] and s.context.captured.solid==frame.SOLID_BSP and s.context.captured.modelindex2==17,"bot entity mapping")
  count=count+require(containsEvent(s.context.events,"ai:1:") and has(s.context.events,"input:1:100:100") and has(s.context.events,"cmd:1:100:9:100"),"AI then input command execution")
  count=count+require(s.floattime==7.25 and s.botlibResidual==0 and s.runtimes[1].botthinkResidual==0,"frame time state")

  s.context.events=[]; s.context.liveEntities=0; s.context.nullEntities=0; s.context.clock=1.1
  frame.startFrame(level,s,150)
  count=count+require(s.context.liveEntities==0 and has(s.context.events,"input:1:150:50"),"sub-think frame only updates input")
  s.context.events=[]; frame.startFrame(level,s,200)
  count=count+require(s.context.liveEntities==3 and not has(s.context.events,"items") and containsEvent(s.context.events,"ai:1:"),"residual cadence and 0.3-second item throttle")

  pair=fixture(world); level=pair[0]; s=pair[1]; bindBot(level,s,3); s.context.aas=false
  count=count+require(not frame.startFrame(level,s,100) and not has(s.context.events,"aastime") and s.botlibResidual==0,"AAS failure stops after library start")
  pair=fixture(world); level=pair[0]; s=pair[1]; bindBot(level,s,3); s.lifecycleState.thinktime.integer=250
  frame.startFrame(level,s,250)
  count=count+require(has(s.context.events,"cvar:bot_thinktime=200") and containsEvent(s.context.events,"ai:3:"),"think cap preserves current snapshot until next update")
  count=count+require(try(frame.startFrame(level,s,1.5)) is error,"integer time guard")
  pair=fixture(world);level=pair[0];s=pair[1];b=bindBot(level,s,4);b.aiNode=1;s.botAiFn=void
  cs=s.commandServices;cs.context=s;cs.resetInputFn=defaultReset;cs.nextServerCommandFn=defaultNext;cs.queueMessageFn=defaultQueue;cs.deathmatchSetupFn=defaultSetup
  f=fight.create(combat.create());f.context=s;f.observerFn=battleObserver;f.enterNodeFn=battleEnter;s.fightServices=f
  frame.startFrame(level,s,100)
  count=count+require(has(s.context.events,"default-reset:4") and has(s.context.events,"default-setup"),"default BotAI command path")
  count=count+require(has(s.context.events,"battle-observer") and has(s.context.events,"battle-enter:5"),"frame reaches default battle-node dispatcher")
  return count
end function
function main(args)
  world=cm.loadWorld(fs.readAllBytes(args[0]),true); count=contracts(world)
  print("PASS: "+str(count)+" bot AI frame contracts\n"); return 0
end function
