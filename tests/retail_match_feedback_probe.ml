// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.engine.local_qvm_match as match
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.client.cl_console as feedbackConsole
import mq3.client.cgame_servercmds as feedbackCgameCommands
import mq3.botlib.ai_chat_output as feedbackChat
import mq3.botlib.ai_resource_pools as feedbackPools
import mq3.botlib.elementary_actions as feedbackActions
import mq3.audio.snd_channels as feedbackChannels
import mq3.compat.numeric as numeric
import mq3.vm.syscall_qagame_world as qworld
import std.string as strings

function fail(text) return error(7705,"Retail match feedback: "+text) end function

function frame(state,now)
  advanced=match.runServerFrame(state,now);if advanced is error then return advanced end if
  snapshot=match.snapshotProductive(state,0);if snapshot is error then return snapshot end if
  // Draw with a newly issued command ahead of the last server snapshot,
  // matching the desktop frame order and exercising CG_TransitionPlayerState.
  command=qworld.userCommand(now+1,[0,0,0],0,2,0,0,0)
  submitted=match.submitUsercmd(state,0,command);if submitted is error then return submitted end if
  return match.drawCgameProductive(state,now+1)
end function

function main(args)
  if len(args)!=2 then return fail("expected base data and QVM directories") end if
  archive=pk3.openStandard(args[0])
  map=bsp.load(pk3.read(archive,"maps/q3dm0.bsp"))
  settings=match.UserSettings([["g_gametype","2","0",void,0],["fraglimit","5","20",void,0],["g_spSkill","2","0",void,0],["sv_maxclients","12","8",void,0],["bot_fastchat","1","0",void,0]],array(256,void),array(match.MAX_CLIENTS,"\\name\\Sarge\\rate\\25000"),[])
  state=match.bootWithQvmsSettingsNamed(archive,map,"q3dm0",1000,args[1],settings);if state is error then return state end if
  context=state.context
  joined=match.connectLocal(state,0);if joined is error then return joined end if
  for tick=1 to 81
    advanced=match.runFrame(state,1000+tick*50);if advanced is error then return advanced end if
  end for
  if context.clientStates[1]!=2 then return fail("arena opponent did not connect") end if
  snapshot=match.snapshotProductive(state,0);if snapshot is error then return snapshot end if
  booted=match.bootCgame(state);if booted is error then return booted end if
  drawn=match.drawCgameProductive(state,5050);if drawn is error then return drawn end if

  message="retail bot chat delivery"
  spoken=feedbackActions.say(context.elementaryActions,1,message);if spoken is error then return spoken end if
  broadcast=false
  for each entry in context.console
    if entry[0]==0 and strings.startsWith(entry[1],"chat ") and strings.contains(entry[1],message) then broadcast=true end if
  end for
  if not broadcast then return fail("bot chat was not broadcast by qagame") end if

  expected=["sound/feedback/3_frags.wav","sound/feedback/2_frags.wav","sound/feedback/1_frag.wav"]
  now=5050
  for score=2 to 4
    context.soundCommands=[]
    sequence=context.cgameServerCommands.commandSequence
    match.setConfigstring(context,feedbackCgameCommands.CS_SCORES1,str(score))
    match.setConfigstring(context,feedbackCgameCommands.CS_SCORES1,str(score))
    if context.cgameServerCommands.commandSequence!=sequence+1 then return fail("changed score must be sent exactly once") end if
    for tick=1 to 30
      now=now+50
      drawn=frame(state,now);if drawn is error then return drawn end if
    end for
    count=0
    for each sound in context.soundCommands
      if sound.kind=="local" and sound.channel==feedbackChannels.CHAN_ANNOUNCER and sound.handle>0 and context.assets[sound.handle-1]==expected[score-2] then count=count+1 end if
    end for
    if count!=1 then return fail("expected exactly one cgame voice command for "+expected[score-2]+", got "+str(count)) end if
  end for
  if not strings.contains(feedbackConsole.dumpText(context.clientTextInput.consoleRuntime),message) then return fail("bot message did not reach the client console") end if
  // Let the original bot finish its delayed spawn and initialize its chat identity.
  for tick=1 to 305
    now=now+100
    advanced=match.runServerFrame(state,now);if advanced is error then return advanced end if
  end for
  handle=0
  for index=1 to len(context.aiResources.chatStates)-1
    profile=feedbackPools.chatState(context.aiResources,index)
    if profile!=void and profile.chat!=void and profile.client==1 and strings.toLowerAscii(profile.name)=="crash" then handle=index;break end if
  end for
  if handle==0 then return fail("retail opponent did not initialize its chat profile") end if
  profile=feedbackPools.chatState(context.aiResources,handle)
  // Trigger a line deterministically to verify its text through the client console.
  prepared=feedbackChat.initialChat(context.aiChatOutput,handle,"level_start",0,["Crash",void,void,void,void,void,void,void]);if prepared is error then return prepared end if
  if feedbackChat.chatLength(context.aiChatOutput,handle)==0 then return fail("retail chat profile produced no text") end if
  rendered=feedbackChat.removeTildes(profile.chatMessage)
  entered=feedbackChat.enterChat(context.aiChatOutput,handle,0,feedbackChat.CHAT_ALL);if entered is error then return entered end if
  drawn=frame(state,now+50);if drawn is error then return drawn end if
  if not strings.contains(feedbackConsole.dumpText(context.clientTextInput.consoleRuntime),rendered) then return fail("retail chat text did not reach the client console") end if
  // Reach the fraglimit in the original game and let its intermission AI choose the bot's own chat.
  firstCommand=len(context.console)
  scoreOffset=248 // offsetof(playerState_t, persistant[PERS_SCORE])
  numeric.writeU32(state.game.slot.machine.data,context.gameClients+scoreOffset,5)
  for tick=1 to 40
    now=now+100
    drawn=frame(state,now);if drawn is error then return drawn end if
  end for
  automatic=false
  for index=firstCommand to len(context.console)-1
    entry=context.console[index]
    if entry[0]==0 and strings.startsWith(entry[1],"chat ") and strings.contains(entry[1],profile.name) then automatic=true;break end if
  end for
  if not automatic then return fail("original intermission did not send a bot chat") end if
  stopped=match.shutdown(state);if stopped is error then return stopped end if
  print "PASS: original single-player cgame announced 3/2/1 frags and displayed retail bot chat"
  return 0
end function
