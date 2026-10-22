// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_main as g
import mq3.game.entities as game
import mq3.collision.world as cm
import std.fs as fs
struct Record called a0 a1 a2 end struct
function gmainOracleHit(runtime,kind,a,b,c) state=runtime.gmainContext;state.called=kind;state.a0=a;state.a1=b;state.a2=c;return void end function
function gmainOracleInit(runtime,a,b,c) return gmainOracleHit(runtime,g.GAME_INIT,a,b,c) end function
function gmainOracleShutdown(runtime,a) return gmainOracleHit(runtime,g.GAME_SHUTDOWN,a,-1,-1) end function
function gmainOracleConnect(runtime,a,b,c) gmainOracleHit(runtime,g.GAME_CLIENT_CONNECT,a,b,c);return 42 end function
function gmainOracleBegin(runtime,a) return gmainOracleHit(runtime,g.GAME_CLIENT_BEGIN,a,-1,-1) end function
function gmainOracleUserinfo(runtime,a) return gmainOracleHit(runtime,g.GAME_CLIENT_USERINFO_CHANGED,a,-1,-1) end function
function gmainOracleDisconnect(runtime,a) return gmainOracleHit(runtime,g.GAME_CLIENT_DISCONNECT,a,-1,-1) end function
function gmainOracleCommand(runtime,a) return gmainOracleHit(runtime,g.GAME_CLIENT_COMMAND,a,-1,-1) end function
function gmainOracleThink(runtime,a) return gmainOracleHit(runtime,g.GAME_CLIENT_THINK,a,-1,-1) end function
function gmainOracleFrame(runtime,a) return gmainOracleHit(runtime,g.GAME_RUN_FRAME,a,-1,-1) end function
function gmainOracleConsole(runtime) gmainOracleHit(runtime,g.GAME_CONSOLE_COMMAND,-1,-1,-1);return 43 end function
function gmainOracleBot(runtime,a) gmainOracleHit(runtime,g.BOTAI_START_FRAME,a,-1,-1);return 44 end function
function main(args)
  level=game.create(cm.loadWorld(fs.readAllBytes(args[0]),true));runtime=g.createRuntime(level)
  state=Record(-1,-1,-1,-1);runtime.gmainContext=state;runtime.gmainInitFn=gmainOracleInit;runtime.gmainShutdownFn=gmainOracleShutdown;runtime.gmainConnectFn=gmainOracleConnect
  runtime.gmainBeginFn=gmainOracleBegin;runtime.gmainUserinfoFn=gmainOracleUserinfo;runtime.gmainDisconnectFn=gmainOracleDisconnect;runtime.gmainCommandFn=gmainOracleCommand
  runtime.gmainThinkFn=gmainOracleThink;runtime.gmainFrameFn=gmainOracleFrame;runtime.gmainConsoleFn=gmainOracleConsole;runtime.gmainBotFrameFn=gmainOracleBot
  for commandValue=0 to 11
    state.called=-1;state.a0=-1;state.a1=-1;state.a2=-1
    value=g.vmMain(runtime,commandValue,[100+commandValue,200+commandValue,300+commandValue])
    print(str(commandValue)+"|"+str(value)+"|"+str(state.called)+"|"+str(state.a0)+"|"+str(state.a1)+"|"+str(state.a2))
  end for
  return 0
end function
