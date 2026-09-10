// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_input as input
import mq3.game.bot_ai_frame as frame
import mq3.game.bot_lifecycle as bots
import mq3.game.playerstate as ps
import mq3.qcommon.cvar as cv
import mq3.compat.numeric as n

struct Context events nextInput end struct
function require(v,label) if not v then return error(499,"Bot input contract: "+label) end if return 1 end function
function characteristic(s,ch,index,low,high) if index==input.CHARACTERISTIC_VIEW_FACTOR then return 0.5 end if return 100.0 end function
function view(s,client,angles) s.context.events=s.context.events+["view:"+str(client)]; return void end function
function getInput(s,client,time) s.context.events=s.context.events+["get:"+str(client)]; return s.context.nextInput end function
function services(value) s=input.create();s.context=Context([],value);s.characteristicFloatFn=characteristic;s.viewFn=view;s.getInputFn=getInput;return s end function
function command() return frame.UserCommand(9,7,[1,2,3],4,5,6,7) end function
function bot() b=bots.createBot(2);b.curPs=ps.create();b.character=8;return b end function
function close(a,b) d=n.fsub(a,b);if d<0 then d=n.fneg(d) end if return d<0.01 end function
function contracts()
  count=0
  count=count+require(close(input.angleDifference(350.0,10.0),-20.0) and close(input.angleDifference(10.0,350.0),20.0),"wrapped angle difference")
  count=count+require(close(input.changeViewAngle(350.0,10.0,5.0),355.0),"positive shortest turn capped")
  count=count+require(close(input.changeViewAngle(10.0,350.0,5.0),5.0),"negative shortest turn capped")
  count=count+require(input.angleToShort(90.0)==16384 and close(input.shortToAngle(16384),90.0),"short angle conversion")
  count=count+require(input.angleToShort(-0.1)==-18 and input.angleToShort(359.999)==-1 and input.angleToShort(720.5)==91,"MSVC angle truncation and short wrap")
  bi=input.BotInput(0.0,[1.0,0.0,0.0],400.0,[0.0,90.0,0.0],input.ACTION_ATTACK|input.ACTION_TALK|input.ACTION_GESTURE|input.ACTION_USE|input.ACTION_WALK|input.ACTION_AFFIRMATIVE|input.ACTION_NEGATIVE|input.ACTION_GETFLAG|input.ACTION_GUARDBASE|input.ACTION_PATROL|input.ACTION_FOLLOWME,10)
  cmd=command();input.inputToUserCommand(bi,cmd,[0,100,0],123)
  count=count+require(cmd.serverTime==123 and cmd.buttons==2047 and cmd.weapon==10,"button and weapon map")
  count=count+require(cmd.angles[0]==0 and cmd.angles[1]==16284 and cmd.angles[2]==0,"delta angles subtracted as short")
  count=count+require((cmd.forwardmove==0 or cmd.forwardmove==-1) and (cmd.rightmove==127 or cmd.rightmove==126) and cmd.upmove==0,"view-relative movement")
  bi=input.BotInput(0.0,[1.0,0.0,1.0],400.0,[30.0,0.0,0.0],input.ACTION_MOVEFORWARD,300);cmd=command();input.inputToUserCommand(bi,cmd,[0,0,0],0)
  count=count+require(cmd.weapon==44 and cmd.upmove==0 and cmd.forwardmove<0,"byte weapon/move wrap and integer abs pitch quirk")
  bi=input.BotInput(0.0,[0.0,0.0,0.0],0.0,[0.0,0.0,0.0],input.ACTION_DELAYEDJUMP,0);cmd=command();input.inputToUserCommand(bi,cmd,[0,0,0],5)
  count=count+require((bi.actionflags&input.ACTION_DELAYEDJUMP)==0 and (bi.actionflags&input.ACTION_JUMP)!=0 and cmd.upmove==127,"delayed jump becomes jump")
  bi=input.BotInput(0.0,[0.0,0.0,0.0],0.0,[0.0,0.0,0.0],input.ACTION_MOVEFORWARD|input.ACTION_MOVEBACK|input.ACTION_MOVELEFT|input.ACTION_MOVERIGHT|input.ACTION_JUMP|input.ACTION_CROUCH,0);cmd=command();input.inputToUserCommand(bi,cmd,[0,0,0],0)
  count=count+require(cmd.forwardmove==0 and cmd.rightmove==0 and cmd.upmove==0,"opposed keyboard movement cancels")
  b=bot();b.enemy=1;b.viewangles=[0.0,0.0,0.0];b.idealViewangles=[0.9,20.0,0.0];s=services(void);s.challenge=true;input.changeViewAngles(s,b,0.1)
  count=count+require(close(b.viewangles[0],0.0),"challenge path preserves abs float-to-int truncation")
  count=count+require(close(b.viewangles[1],10.0) and s.context.events==["view:2"],"challenge speed factor and view delivery")
  b=bot();b.viewangles=[10.0,20.0,30.0];b.curPs.delta_angles=[16384,-16384,0]
  bi=input.BotInput(0.0,[0.0,0.0,0.0],0.0,[0.0,0.0,0.0],input.ACTION_RESPAWN|input.ACTION_ATTACK,3);s=services(bi);cmd=command();cmd.buttons=input.BUTTON_ATTACK
  input.updateInput(s,b,cmd,1000,0)
  count=count+require(cmd.buttons==0,"held attack suppresses respawn and attack")
  count=count+require(cmd.serverTime==1000 and cmd.weapon==3,"update converts retrieved input")
  count=count+require(close(b.viewangles[0],10.0) and close(b.viewangles[1],20.0) and close(b.viewangles[2],30.0),"delta angles restored around input update")
  count=count+require(s.context.events==["view:2","get:2"],"view update precedes elementary input retrieval")
  return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" bot input contracts\n");return 0 end function
