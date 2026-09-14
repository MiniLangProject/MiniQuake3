import mq3.engine.local_qvm_match as match
import mq3.vm.syscall_qagame_world as qworld
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.renderer.shader_remap as shaderRemap

function main(args)
  if len(args)!=2 then return error(7654,"usage: qvm_renderer_trap_retail_probe <pak0.pk3> <qvm-directory>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
  state=match.bootWithQvms(archive,map,1000,args[1]);if state is error then return state end if
  connected=match.connectLocal(state,0);if connected is error then return connected end if
  for frame=1 to 8 command=qworld.userCommand(1000+frame*50,[0,0,0],0,2,127,0,0);submitted=match.submitUsercmd(state,0,command);if submitted is error then return submitted end if;ran=match.runFrame(state,1000+frame*50);if ran is error then return ran end if end for
  snapshot=match.snapshot(state,0);if snapshot is error then return snapshot end if
  // Retail CG_Init parses CS_SHADERSTATE and reaches CG_R_REMAP_SHADER using
  // the exact original QVM parser and syscall ABI.
  state.context.configstrings[24]="gfx/2d/bigchars=gfx/2d/numbers/zero_32b:1.25@"
  client=match.bootCgame(state);if client is error then return client end if
  for frame=0 to 3 drawn=match.drawCgame(state,1450+frame*50);if drawn is error then return drawn end if end for
  report=""
  for op=18 to 89 if state.context.cgameTrapCounts[op]>0 then if report!="" then report=report+"," end if;report=report+str(op)+":"+str(state.context.cgameTrapCounts[op]) end if end for
  if state.context.cgameTrapCounts[79]<1 or shaderRemap.resolve(state.context.shaderRemaps,"gfx/2d/bigchars")!="gfx/2d/numbers/zero_32b" then return error(7654,"retail CG_R_REMAP_SHADER did not reach material registry") end if
  print("PASS: retail QVM renderer traps "+report);match.shutdown(state);return 0
end function
