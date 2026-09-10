// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.timeouts as timeout
struct Context drops diagnostics end struct
function drop(h,c,reason) if reason=="timed out" then h.context.drops=h.context.drops+1 end if;return void end function
function diagnostic(h,index) h.context.diagnostics=h.context.diagnostics+1;return void end function
function run(tag,now,dropSeconds,zombieSeconds,specs)
 clients=[];for each spec in specs clients=clients+[timeout.client(spec[0],spec[1],spec[2])] end for
 state=timeout.runtime(clients);state.time=now;state.timeoutSeconds=dropSeconds;state.zombieSeconds=zombieSeconds
 host=timeout.services();host.context=Context(0,0);host.dropFn=drop;host.diagnosticFn=diagnostic
 timeout.check(state,host);line=tag+"|"+str(host.context.drops)+"|"+str(host.context.diagnostics)
 for each c in clients line=line+"|"+str(c.state)+":"+str(c.lastPacketTime)+":"+str(c.timeoutCount) end for
 print line;return void
end function
function main(args)
 run("mixed",10000,2,2,[[2,9000,4],[4,7999,5],[1,7000,9],[0,12000,7]])
 run("edges",10000,2,2,[[2,8000,4],[1,8000,4],[3,8001,3],[1,7999,8]])
 run("future",10000,2,2,[[4,10001,4],[1,10001,4],[0,10001,4]])
 run("timewrap",-2147483648,2,2,[[2,-2147483647,0],[1,-2147483647,7]])
 run("mulwrap",123,2147484,2147484,[[2,0,5],[1,0,5]])
 run("zero",100,0,0,[[2,99,5],[1,99,5]])
 return 0
end function
