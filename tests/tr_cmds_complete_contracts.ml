import mq3.renderer.tr_cmds_runtime as runtime
import mq3.renderer.command_queue as commands

struct Context events sleeps wakes batches toggles textureModes gammaCalls glError spawn end struct
function req(ok,message) if not ok then return error(7741,message) end if;return 1 end function
function event(context,kind,value) context.events=context.events+[[kind,value]] end function
function spawn(context) return context.spawn end function
function sleep(context) context.sleeps=context.sleeps+1 end function
function wake(context,batch) context.wakes=context.wakes+[batch] end function
function execute(context,batch) context.batches=context.batches+[batch];return len(batch) end function
function textureMode(context,value) context.textureModes=context.textureModes+[value] end function
function gamma(context) context.gammaCalls=context.gammaCalls+1 end function
function getError(context) return context.glError end function
function toggle(context,frame) context.toggles=context.toggles+[frame] end function
function makeState(context)
  host=runtime.Services(event,spawn,sleep,wake,execute,textureMode,gamma,getError,toggle,context)
  return runtime.create(void,void,void,host)
end function
function main(args)
  count=0;context=Context([],0,[],[],[],[],0,0,true);state=makeState(context)
  count=count+req(runtime.STEREO_CENTER==0 and runtime.STEREO_LEFT==1 and runtime.STEREO_RIGHT==2,"stereo ABI")
  count=count+req(state.queue.used==0 and state.frameCount==0 and not state.smpActive,"initial lifecycle")
  count=count+req(runtime.R_GetCommandBuffer(state,8) and state.queue.used==8,"R_GetCommandBuffer delegates budget")
  commands.reset(state.queue);state.queue.used=commands.MAX_RENDER_COMMANDS-commands.END_COMMAND_BYTES
  count=count+req(not runtime.R_GetCommandBuffer(state,4),"command overflow drops")
  count=count+req(try(runtime.R_GetCommandBuffer(state,commands.MAX_RENDER_COMMANDS)) is error,"oversize command fatal")
  commands.reset(state.queue)
  count=count+req(runtime.RE_SetColor(state,void) and state.queue.commands[0].values==[1.0,1.0,1.0,1.0],"RE_SetColor white")
  count=count+req(runtime.RE_StretchPic(state,1,2,3,4,0.1,0.2,0.8,0.9,7),"RE_StretchPic queued")
  count=count+req(runtime.R_AddDrawSurfCmd(state,["a","b"],2,"refdef","view"),"R_AddDrawSurfCmd queued")
  count=count+req(state.queue.commands[2].id==commands.RC_DRAW_SURFS and state.queue.commands[2].values[1]==2,"draw payload snapshot")
  commands.reset(state.queue);state.settings.smp=true
  count=count+req(runtime.R_InitCommandBuffers(state) and state.smpActive,"R_InitCommandBuffers SMP")
  state.renderThreadActive=true;commands.setColor(state.queue,[1.0,0.0,0.0,1.0]);issued=runtime.R_IssueRenderCommands(state,false)
  count=count+req(issued==1 and state.blockedOnRender==1 and context.sleeps==1,"active render thread wait")
  count=count+req(len(context.wakes)==1 and context.wakes[0][0].id==commands.RC_SET_COLOR and state.queue.used==0,"SMP wake receives batch")
  commands.setColor(state.queue,void);state.renderThreadActive=false;runtime.R_IssueRenderCommands(state,false)
  count=count+req(state.blockedOnMain==1 and context.events[len(context.events)-1][1]=="main","idle SMP accounting")
  count=count+req(runtime.R_SyncRenderThread(state) and context.sleeps==4 and not state.renderThreadActive,"R_SyncRenderThread drains")
  runtime.R_ShutdownCommandBuffers(state);count=count+req(not state.smpActive and context.wakes[len(context.wakes)-1]==void,"R_Shutdown wakes sentinel")
  state.settings.smp=false;runtime.R_InitCommandBuffers(state);commands.setColor(state.queue,void);count=count+req(runtime.R_IssueRenderCommands(state,false)==1 and len(context.batches)==1,"single-thread execute")
  state.front.leafs=9;state.back.shaders=2;state.back.surfaces=7;state.back.vertexes=20;state.back.indexes=30;state.back.totalIndexes=60;state.back.imageBytes=2500000;state.back.overDraw=640*480;state.settings.speeds=1
  perf=runtime.R_PerformanceCounters(state);count=count+req(perf[0]=="general" and perf[1]==2 and perf[4]==20,"general performance counters")
  count=count+req(state.back.shaders==0 and state.front.leafs==0,"performance counters clear")
  state.settings.speeds=2;state.front.spherePatchIn=3;count=count+req(runtime.R_PerformanceCounters(state)[1]==3,"cull performance counters")
  state.settings.speeds=4;count=count+req(runtime.R_PerformanceCounters(state)==void,"empty dlight report suppressed")
  state.settings.speeds=6;state.back.flareAdds=4;count=count+req(runtime.R_PerformanceCounters(state)[1]==4,"flare performance counters")
  state.settings.speeds=0;state.settings.measureOverdraw=true;state.settings.measureOverdrawModified=true;state.settings.stencilBits=3
  count=count+req(runtime.RE_BeginFrame(state,runtime.STEREO_CENTER) and not state.settings.measureOverdraw,"insufficient stencil disables overdraw")
  count=count+req(state.frameCount==1 and state.frameSceneNum==0 and state.queue.commands[0].id==commands.RC_DRAW_BUFFER,"RE_BeginFrame queues buffer")
  commands.reset(state.queue);state.settings.measureOverdraw=true;state.settings.measureOverdrawModified=true;state.settings.stencilBits=8;state.settings.shadows=2
  runtime.RE_BeginFrame(state,runtime.STEREO_CENTER);count=count+req(not state.settings.measureOverdraw,"shadow conflict disables overdraw")
  commands.reset(state.queue);state.settings.measureOverdraw=false;state.settings.measureOverdrawModified=false;state.settings.shadows=0;state.settings.textureMode="nearest";state.settings.textureModeModified=true;state.settings.gammaModified=true
  runtime.RE_BeginFrame(state,runtime.STEREO_CENTER);count=count+req(context.textureModes==["nearest"] and context.gammaCalls==1,"texture and gamma updates")
  count=count+req(not state.settings.textureModeModified and not state.settings.gammaModified,"modified flags clear")
  commands.reset(state.queue);state.settings.stereoEnabled=true
  count=count+req(runtime.RE_BeginFrame(state,runtime.STEREO_LEFT) and state.queue.commands[0].values==["GL_BACK_LEFT"],"left stereo buffer")
  commands.reset(state.queue);count=count+req(runtime.RE_BeginFrame(state,runtime.STEREO_RIGHT) and state.queue.commands[0].values==["GL_BACK_RIGHT"],"right stereo buffer")
  commands.reset(state.queue);count=count+req(try(runtime.RE_BeginFrame(state,runtime.STEREO_CENTER)) is error,"invalid stereo center rejected")
  state.settings.stereoEnabled=false;state.settings.drawBuffer="GL_FRONT";commands.reset(state.queue);runtime.RE_BeginFrame(state,runtime.STEREO_CENTER);count=count+req(state.queue.commands[0].values==["GL_FRONT"],"front draw buffer")
  commands.reset(state.queue);count=count+req(try(runtime.RE_BeginFrame(state,runtime.STEREO_LEFT)) is error,"mono stereo frame rejected")
  state.settings.drawBuffer="GL_BACK";state.frontEndMsec=12;state.back.msec=34;state.settings.speeds=0;commands.reset(state.queue);commands.setColor(state.queue,void)
  times=runtime.RE_EndFrame(state);count=count+req(times==[12,34] and state.frontEndMsec==0 and state.back.msec==0,"RE_EndFrame timing")
  count=count+req(state.smpFrame==1 and context.toggles[len(context.toggles)-1]==1,"RE_EndFrame toggles SMP frame")
  count=count+req(context.batches[len(context.batches)-1][1].id==commands.RC_SWAP_BUFFERS,"swap terminates frame batch")
  state.settings.registered=false;commands.reset(state.queue);count=count+req(not runtime.RE_BeginFrame(state,runtime.STEREO_CENTER) and not runtime.RE_EndFrame(state),"unregistered frame ignored")
  count=count+req(not runtime.R_SyncRenderThread(state),"unregistered sync ignored")
  state.settings.registered=true;context.glError=1280;count=count+req(try(runtime.RE_BeginFrame(state,runtime.STEREO_CENTER)) is error,"GL error propagated")
  print("PASS: "+str(count)+" complete tr_cmds contracts")
  return 0
end function
