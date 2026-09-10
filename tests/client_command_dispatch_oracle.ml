import mq3.server.client_command_dispatch as dispatch
struct C event end struct
function bi(h,c,n,p) h.context.event="builtin";return void end function
function game(h,c,p) h.context.event="game";return void end function
function ignored(h,c,n) h.context.event="ignored";return void end function
function run(tag,text,ok,state) h=dispatch.services();h.context=C("");h.builtinFn=bi;h.gameFn=game;h.ignoredFn=ignored;dispatch.execute(h,C(""),text,ok,state);print tag+"|"+h.context.event;return void end function
function main(args) run("userinfo","userinfo x",true,dispatch.SS_GAME);run("disconnect","disconnect",false,dispatch.SS_GAME);run("cp","cp abc",true,dispatch.SS_GAME);run("donedl","donedl",true,dispatch.SS_GAME);run("game","say hi",true,dispatch.SS_GAME);run("nogame","say hi",true,1);run("ignored","say hi",false,dispatch.SS_GAME);run("case","UserInfo x",true,dispatch.SS_GAME);run("empty","   ",false,dispatch.SS_GAME);return 0 end function
