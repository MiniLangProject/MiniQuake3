import mq3.engine.local_qvm_match as match
import mq3.vm.syscall_qagame_world as qworld
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
function anyCount(counts,first,last) for op=first to last if counts[op]>0 then return true end if end for;return false end function
function main(args)
 if len(args)!=2 then return error(7906,"usage: cgame_syscalls_retail_probe <pak0.pk3> <qvm-directory>") end if
 archive=pk3.open(args[0]);if archive is error then return archive end if;map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
 state=match.bootWithQvms(archive,map,1000,args[1]);if state is error then return state end if;connected=match.connectLocal(state,0);if connected is error then return connected end if
 for frame=1 to 8 command=qworld.userCommand(1000+frame*50,[0,0,0],0,2,127,0,0);submitted=match.submitUsercmd(state,0,command);if submitted is error then return submitted end if;ran=match.runFrame(state,1000+frame*50);if ran is error then return ran end if end for
 snapshot=match.snapshot(state,0);if snapshot is error then return snapshot end if;beforeCvars=state.context.cvars.numIndexes;beforeFile=state.context.nextFile;client=match.bootCgame(state);if client is error then return client end if
 for frame=0 to 3 drawn=match.drawCgame(state,1450+frame*50);if drawn is error then return drawn end if end for
 counts=state.context.cgameTrapCounts;report="";for op=0 to 89 if counts[op]>0 then if report!="" then report=report+"," end if;report=report+str(op)+":"+str(counts[op]) end if end for
 if state.context.cvars.numIndexes<=beforeCvars then return error(7906,"retail cgame did not register cvars") end if
 if state.context.nextFile<=beforeFile then return error(7906,"retail cgame did not open files") end if
 if not anyCount(counts,18,27) then return error(7906,"retail cgame did not reach collision traps") end if
 if not anyCount(counts,28,35) and not anyCount(counts,69,69) and not anyCount(counts,80,81) then return error(7906,"retail cgame did not reach audio traps") end if
 if not anyCount(counts,36,48) and not anyCount(counts,57,59) and not anyCount(counts,73,73) and not anyCount(counts,79,79) and not anyCount(counts,85,85) and not anyCount(counts,87,88) then return error(7906,"retail cgame did not reach renderer traps") end if
 print("PASS: retail cg_syscalls traps "+report);match.shutdown(state);return 0
end function
