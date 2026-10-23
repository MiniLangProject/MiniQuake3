import mq3.client.cl_scrn_runtime as scr
import mq3.client.ui_host_lifecycle as ui
import mq3.renderer.tr_cmds_runtime as tr
import mq3.renderer.command_queue as commands

struct Context names events fullscreen catcher tell end struct
function req(ok,label) if not ok then return error(7811,"cl_scrn contract: "+label) end if;return 1 end function
function registerShader(c,name) c.names=c.names+[name];return 100+len(c.names) end function
function stopSounds(c) c.events=c.events+["stop"];return void end function
function console(c) c.events=c.events+["console"];return void end function
function tell(c,file) return c.tell end function
function diagnostic(c,kind,value) c.events=c.events+[kind];return void end function
function fullscreen(c) return c.fullscreen end function
function refresh(c,time) c.events=c.events+["refresh:"+str(time)];return void end function
function menu(c,value) c.events=c.events+["menu:"+str(value)];return void end function
function connect(c,overlay) c.events=c.events+["connect:"+str(overlay)];return void end function
function cgame(c) c.events=c.events+["cgame"];return void end function
function cinematic(c) c.events=c.events+["cinematic"];return void end function
function catcher(c) return c.catcher end function
function makeState(context,width,height)
  queue=commands.create(void,void);render=tr.create(queue,commands.backend(void),tr.settings(),void)
  host=ui.services(context,fullscreen,refresh,menu,connect,cgame,cinematic,catcher);services=scr.services(context);services.registerShaderFn=registerShader;services.stopSoundsFn=stopSounds;services.consoleFn=console;services.fileTellFn=tell;services.diagnosticFn=diagnostic
  return scr.create(render,host,services,width,height,7,9)
end function
function near(a,b) delta=a-b;if delta<0 then delta=0-delta end if;return delta<0.0001 end function

function main(args)
  count=0;c=Context([],[],false,0,4097);state=makeState(c,1280,720)
  count=count+req(scr.SCR_Init(state) and state.initialized and state.graphheight==32,"init")
  adjusted=scr.SCR_AdjustFrom640(state,10.0,20.0,30.0,40.0);count=count+req(near(adjusted[0],20.0) and near(adjusted[1],30.0) and near(adjusted[2],60.0) and near(adjusted[3],60.0),"640 scaling")
  adjusted=scr.SCR_AdjustFrom640(state,void,20.0,void,40.0);count=count+req(adjusted[0]==void and adjusted[2]==void and near(adjusted[1],30.0) and near(adjusted[3],60.0),"nullable 640 pointers")
  shader=scr.SCR_DrawNamedPic(state,4.0,8.0,16.0,32.0,"gfx/2d/bigchars");count=count+req(shader==101 and c.names[0]=="gfx/2d/bigchars","named picture registration")
  command=state.renderer.queue.commands[len(state.renderer.queue.commands)-1];count=count+req(command.id==commands.RC_STRETCH_PIC and near(command.values[0],8.0) and near(command.values[3],48.0) and command.shader==101,"named picture draw")
  before=len(state.renderer.queue.commands);rect=scr.SCR_FillRect(state,1.0,2.0,3.0,4.0,[0.2,0.3,0.4,0.5]);count=count+req(len(state.renderer.queue.commands)==before+3 and rect[2]==6.0,"fill color/draw/reset")
  pic=scr.SCR_DrawPic(state,2.0,4.0,6.0,8.0,22);count=count+req(pic[0]==4.0 and pic[1]==6.0 and pic[2]==12.0 and pic[3]==12.0,"draw picture scaling")
  before=len(state.renderer.queue.commands);count=count+req(not scr.SCR_DrawChar(state,0,-17,16,65) and len(state.renderer.queue.commands)==before,"char vertical clip")
  count=count+req(not scr.SCR_DrawChar(state,0,0,16,32),"space elision")
  count=count+req(scr.SCR_DrawChar(state,10,20,16,65),"big char draw");ch=state.renderer.queue.commands[len(state.renderer.queue.commands)-1];count=count+req(near(ch.values[4],0.0625) and near(ch.values[5],0.25),"char atlas coordinates")
  count=count+req(scr.SCR_DrawSmallChar(state,10,20,66),"small char draw");small=state.renderer.queue.commands[len(state.renderer.queue.commands)-1];count=count+req(small.values[0]==10 and small.values[2]==8 and small.values[3]==16 and near(small.values[4],0.125),"native small char")
  count=count+req(scr.SCR_Strlen("ab^1red^^x")==6,"colored strlen")
  count=count+req(scr.SCR_GetBigStringWidth("ab^1red")==80,"big string width")
  before=len(state.renderer.queue.commands);drawn=scr.SCR_DrawStringExt(state,10,12,8,"A^1B",[1.0,1.0,1.0,0.5],false);count=count+req(drawn==4 and len(state.renderer.queue.commands)==before+8,"string shadow/color draws")
  count=count+req(scr.SCR_DrawBigString(state,0,0,"AB",0.75)==4,"big string")
  count=count+req(scr.SCR_DrawBigStringColor(state,0,0,"A^2B",[0.2,0.4,0.6,1.0])==4,"forced big color")
  before=len(state.renderer.queue.commands);count=count+req(scr.SCR_DrawSmallStringExt(state,1,2,"A^2B",[1.0,1.0,1.0,1.0],false)==2 and len(state.renderer.queue.commands)==before+5,"small colored string")
  state.demoRecording=true;state.demoName="demo";demo=scr.SCR_DrawDemoRecording(state);count=count+req(demo=="RECORDING demo: 4k","demo recording text")
  state.spDemoRecording=true;count=count+req(not scr.SCR_DrawDemoRecording(state),"SP demo hidden");state.spDemoRecording=false
  count=count+req(scr.SCR_DebugGraph(state,-3.0,5)==0 and state.graphValues[0].value==-3.0 and state.graphValues[0].color==5,"debug sample")
  state.vidWidth=4;state.vidHeight=20;state.graphheight=8;state.graphscale=2;state.graphshift=1;before=len(state.renderer.queue.commands);count=count+req(scr.SCR_DrawDebugGraph(state)==4 and len(state.renderer.queue.commands)==before+7,"debug graph background/columns")
  commands.reset(state.renderer.queue);state.vidWidth=1280;state.vidHeight=720;state.connectionState=ui.CA_CONNECTING;state.realtime=123
  frame=scr.SCR_DrawScreenField(state,scr.STEREO_CENTER);count=count+req(frame.connectCalls==1 and frame.refreshCalls==1,"connecting screen lifecycle")
  count=count+req(c.events[len(c.events)-1]=="console","console drawn last")
  hasWide=false;for each command in state.renderer.queue.commands if command.id==commands.RC_STRETCH_PIC and command.values[2]==1280 and command.values[3]==720 then hasWide=true end if end for;count=count+req(hasWide,"widescreen clear")
  commands.reset(state.renderer.queue);c.events=[];state.connectionState=ui.CA_DISCONNECTED;frame=scr.SCR_DrawScreenField(state,scr.STEREO_CENTER);count=count+req(c.events[0]=="stop" and frame.menuCalls==1,"disconnected stops sound and opens menu")
  commands.reset(state.renderer.queue);c.events=[];c.fullscreen=true;frame=scr.SCR_DrawScreenField(state,scr.STEREO_CENTER);count=count+req(frame.fullscreen and len(c.events)==1 and c.events[0]=="console","fullscreen disconnected suppresses stop/menu");c.fullscreen=false
  commands.reset(state.renderer.queue);c.events=[];state.connectionState=ui.CA_ACTIVE;state.demoRecording=true;state.demoName="live";state.debuggraph=1;state.vidWidth=6;state.vidHeight=20;state.graphheight=4;frame=scr.SCR_DrawScreenField(state,scr.STEREO_CENTER);count=count+req(frame.cgameFrames==1 and len(state.renderer.queue.commands)>10,"active cgame/demo/graph")
  commands.reset(state.renderer.queue);c.fullscreen=true;c.events=[];frame=scr.SCR_DrawScreenField(state,scr.STEREO_CENTER);count=count+req(frame.fullscreen and frame.cgameFrames==0,"fullscreen suppression");c.fullscreen=false
  state.uiLoaded=false;c.events=[];value=scr.SCR_DrawScreenField(state,scr.STEREO_CENTER);count=count+req(value==void and c.events[0]=="missingUI","missing UI path");state.uiLoaded=true
  // Update drives the productive BeginFrame/EndFrame queue lifecycle.
  state.connectionState=ui.CA_ACTIVE;state.debuggraph=0;state.vidWidth=640;state.vidHeight=480;state.demoRecording=false;commands.reset(state.renderer.queue);frames=scr.SCR_UpdateScreen(state);count=count+req(len(frames)==1 and state.renderer.frameCount>=1 and state.recursive==0,"center update lifecycle")
  state.stereoEnabled=true;state.renderer.settings.stereoEnabled=true;frames=scr.SCR_UpdateScreen(state);count=count+req(len(frames)==2 and state.currentStereo==scr.STEREO_RIGHT,"stereo update lifecycle")
  state.recursive=2;failure=try(scr.SCR_UpdateScreen(state));count=count+req(failure is error and state.recursive==0,"recursive update guard")
  state.initialized=false;count=count+req(not scr.SCR_UpdateScreen(state),"uninitialized update")
  print("PASS: "+str(count)+" complete cl_scrn contracts");return 0
end function
