import mq3.server.client_command_dispatch as dispatch
struct Context events args end struct
function builtin(h,c,name,p) h.context.events="builtin:"+name;h.context.args=p.argv;return void end function
function game(h,c,p) h.context.events="game";h.context.args=p.argv;return void end function
function ignored(h,c,name) h.context.events="ignored:"+name;return void end function
function host() h=dispatch.services();h.context=Context("",[]);h.builtinFn=builtin;h.gameFn=game;h.ignoredFn=ignored;return h end function
function req(v,label) if not v then return error(499,"client command dispatch: "+label) end if;return 1 end function
function main(args)
 n=0;c=Context("",[])
 for each name in dispatch.builtinNames() h=host();n=n+req(dispatch.execute(h,c,name+" arg",true,dispatch.SS_GAME)=="builtin" and h.context.events=="builtin:"+name and h.context.args[1]=="arg","builtin "+name) end for
 h=host();n=n+req(dispatch.execute(h,c,"say hello world",true,dispatch.SS_GAME)=="game" and h.context.args==["say","hello","world"],"game fallback")
 h=host();n=n+req(dispatch.execute(h,c,"say hi",true,1)=="unknown" and h.context.events=="","non-game unknown")
 h=host();n=n+req(dispatch.execute(h,c,"say hi",false,dispatch.SS_GAME)=="ignored" and h.context.events=="ignored:say","flooded unknown")
 h=host();n=n+req(dispatch.execute(h,c,"userinfo x",false,dispatch.SS_GAME)=="builtin" and h.context.events=="builtin:userinfo","builtin bypasses flood gate")
 h=host();n=n+req(dispatch.execute(h,c,"UserInfo x",true,dispatch.SS_GAME)=="game","case sensitive builtin")
 h=host();n=n+req(dispatch.execute(h,c,"   ",false,dispatch.SS_GAME)=="ignored" and h.context.events=="ignored:","empty command")
 h=host();h.builtinFn=void;n=n+req(try(dispatch.execute(h,c,"cp x",true,dispatch.SS_GAME)) is error,"missing builtin")
 h=host();h.gameFn=void;n=n+req(try(dispatch.execute(h,c,"say x",true,dispatch.SS_GAME)) is error,"missing game")
 print "PASS: "+str(n)+" client-command dispatch contracts";return 0
end function
