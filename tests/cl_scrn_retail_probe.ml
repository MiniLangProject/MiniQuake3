import mq3.client.cl_scrn_runtime as scr
import mq3.client.ui_host_lifecycle as ui
import mq3.renderer.tr_cmds_runtime as tr
import mq3.renderer.command_queue as commands
import mq3.renderer.qvm_2d_batch as batch
import mq3.renderer.shader_remap as remap
import mq3.format.pk3 as pk3

struct Context assets kinds fullscreen catcher events end struct
function req(ok,label) if not ok then return error(7812,"Retail cl_scrn: "+label) end if;return 1 end function
function shader(c,name)
  if len(c.assets)>0 then for index=0 to len(c.assets)-1 if c.assets[index]==name and c.kinds[index]=="shaderNoMip" then return index+1 end if end for end if
  c.assets=c.assets+[name];c.kinds=c.kinds+["shaderNoMip"];return len(c.assets)
end function
function fullscreen(c) return c.fullscreen end function
function refresh(c,time) c.events=c.events+["refresh"];return void end function
function menu(c,value) c.events=c.events+["menu"];return void end function
function connect(c,overlay) c.events=c.events+["connect"];return void end function
function cgame(c) c.events=c.events+["cgame"];return void end function
function cinematic(c) c.events=c.events+["cinematic"];return void end function
function catcher(c) return c.catcher end function
function stop(c) c.events=c.events+["stop"];return void end function
function console(c) c.events=c.events+["console"];return void end function
function tell(c,file) return 16384 end function

function main(args)
  if len(args)!=1 then return error(7812,"usage: cl_scrn_retail_probe <pak0.pk3>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  c=Context([],[],false,0,[]);charShader=shader(c,"gfx/2d/bigchars");whiteShader=shader(c,"white")
  queue=commands.create(void,void);render=tr.create(queue,commands.backend(void),tr.settings(),void);host=ui.services(c,fullscreen,refresh,menu,connect,cgame,cinematic,catcher);services=scr.services(c);services.registerShaderFn=shader;services.stopSoundsFn=stop;services.consoleFn=console;services.fileTellFn=tell
  state=scr.create(render,host,services,1280,720,charShader,whiteShader);scr.SCR_Init(state);checks=0
  checks=checks+req(scr.SCR_DrawNamedPic(state,20.0,20.0,64.0,64.0,"icons/iconh_green")==3,"Retail named shader registration")
  checks=checks+req(scr.SCR_DrawBigString(state,100,100,"^1MINI^7QUAKE 3",1.0)>0,"Retail colored bigchars")
  scr.SCR_FillRect(state,0.0,0.0,16.0,16.0,[0.1,0.2,0.3,1.0]);state.demoRecording=true;state.demoName="retail";checks=checks+req(scr.SCR_DrawDemoRecording(state)=="RECORDING retail: 16k","Retail recording overlay")
  extracted=batch.extract(queue.commands,c.assets,c.kinds,1280.0,720.0,1280.0,720.0);if extracted is error then return extracted end if
  checks=checks+req(len(extracted.quads)>=25 and extracted.setColors>=8,"productive renderer command stream")
  catalog=batch.build(archive,queue.commands,c.assets,c.kinds,0,128,1280.0,720.0,1280.0,720.0,remap.create());if catalog is error then return catalog end if
  checks=checks+req(catalog.sourceQuads==len(extracted.quads) and catalog.resolvedQuads==catalog.sourceQuads and catalog.unresolvedQuads==0,"Retail material resolution")
  checks=checks+req(len(catalog.materials)>=3 and len(catalog.textures)>=3 and catalog.emittedTriangles>=catalog.sourceQuads*2,"Retail native batches")
  commands.reset(queue);state.connectionState=ui.CA_ACTIVE;state.demoRecording=false;state.realtime=1500;frame=scr.SCR_DrawScreenField(state,scr.STEREO_CENTER);checks=checks+req(frame.cgameFrames==1 and c.events[0]=="cgame" and c.events[1]=="console","productive active screen lifecycle")
  print("PASS: "+str(checks)+" Retail cl_scrn contracts / "+str(catalog.sourceQuads)+" quads / "+str(len(catalog.textures))+" textures / "+str(catalog.emittedTriangles)+" triangles");return 0
end function
