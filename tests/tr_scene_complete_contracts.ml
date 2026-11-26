import mq3.renderer.tr_scene_runtime as runtime
import mq3.renderer.scene_queue as queue

struct Context events time views draws shaders end struct
function req(ok,message) if not ok then return error(7751,message) end if;return 1 end function
function event(context,kind,value) context.events=context.events+[[kind,value]] end function
function clock(context) value=context.time;context.time=context.time+7;return value end function
function render(context,parms,refdef) context.views=context.views+[[parms,refdef]];return refdef.numDrawSurfs+len(refdef.polys)+3 end function
function draw(context,poly,shader,fog,dlight,entity) context.draws=context.draws+[[poly,shader,fog,dlight,entity]] end function
function shader(context,handle) context.shaders=context.shaders+[handle];return "shader:"+str(handle) end function
function pv(x,y,z) return queue.PolyVert([x,y,z],[x,y],[255,255,255,255]) end function
function makeInput(flags,mask) return runtime.RefdefInput(10,20,320,200,90.0,75.0,[1.0,2.0,3.0],[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]],1250,flags,mask,"text") end function
function main(args)
  count=0;scene=queue.create(8,32);scene.registered=true;context=Context([],100,[],[],[]);host=runtime.Services(clock,render,draw,shader,event,context);state=runtime.create(scene,480,host);state.registered=true;state.worldLoaded=true
  count=count+req(runtime.RDF_NOWORLDMODEL==1 and runtime.ENTITYNUM_WORLD==1022,"ABI constants")
  scene.entities.add(queue.RefEntity(0,"old",false));scene.dlights.add(queue.DLight([0,0,0],1,[1,1,1],false));scene.polys.add(queue.Poly(1,[],0));scene.numPolyVerts=3;state.commandUsed=[5,9]
  count=count+req(runtime.R_ToggleSmpFrame(state)==0 and scene.entities.len()==0 and scene.dlights.len()==0 and scene.polys.len()==0,"non-SMP frame reset")
  count=count+req(state.commandUsed[0]==0 and state.firstSceneDrawSurf==0,"command and draw reset")
  state.smpEnabled=true;state.commandUsed=[4,8];count=count+req(runtime.R_ToggleSmpFrame(state)==1 and state.commandUsed[1]==0,"SMP buffer toggle")
  count=count+req(runtime.R_ToggleSmpFrame(state)==0 and state.commandUsed[0]==0,"SMP toggles back")
  runtime.RE_ClearScene(state);count=count+req(scene.firstSceneEntity==0 and scene.firstSceneDlight==0 and scene.firstScenePoly==0,"clear empty marks")
  verts=[pv(0,0,0),pv(1,0,0),pv(0,1,0)]
  count=count+req(runtime.RE_AddPolyToScene(state,4,3,verts,1)==1,"poly submission")
  count=count+req(runtime.RE_AddRefEntityToScene(state,queue.RefEntity(1,"model",false)),"entity submission")
  count=count+req(runtime.RE_AddLightToScene(state,[1,2,3],64,1,0.5,0.25),"normal light")
  count=count+req(runtime.RE_AddAdditiveLightToScene(state,[4,5,6],32,0,1,0),"additive light")
  count=count+req(scene.dlights.len()==2 and not scene.dlights.get(0).additive and scene.dlights.get(1).additive,"light wrappers")
  added=runtime.R_AddPolygonSurfaces(state);count=count+req(added==1 and len(context.draws)==1,"polygon surfaces added")
  count=count+req(context.draws[0][1]=="shader:4" and context.draws[0][2]==0 and context.draws[0][4]==runtime.ENTITYNUM_WORLD,"polygon draw fields")
  count=count+req(state.firstSceneDrawSurf==1 and context.shaders==[4],"draw count and shader lookup")
  runtime.RE_ClearScene(state);runtime.RE_AddPolyToScene(state,5,3,verts,1);runtime.RE_AddRefEntityToScene(state,queue.RefEntity(2,"sprite",false));runtime.RE_AddLightToScene(state,[0,0,0],20,1,1,1)
  state.firstSceneDrawSurf=6;parms=runtime.RE_RenderScene(state,makeInput(0,[1,2,3,4]))
  count=count+req(parms.viewportX==10 and parms.viewportY==260 and parms.viewportWidth==320 and parms.viewportHeight==200,"viewport conversion")
  count=count+req(parms.fovX==90.0 and parms.fovY==75.0 and parms.origin==[1.0,2.0,3.0],"view parameters")
  count=count+req(len(context.views)==1 and len(context.views[0][1].entities)==1 and len(context.views[0][1].dlights)==1 and len(context.views[0][1].polys)==1,"scene ranges copied")
  count=count+req(context.views[0][1].areamaskModified and context.views[0][1].floatTime==1.25,"area change and float time")
  count=count+req(state.frameSceneNum==1 and state.sceneCount==1 and state.firstSceneDrawSurf==10,"scene counters and render result")
  count=count+req(state.frontEndMsec==7 and queue.sceneEntities(scene)==[] and queue.sceneLights(scene)==[] and queue.scenePolys(scene)==[],"timing and range advance")
  runtime.RE_AddPolyToScene(state,6,3,verts,1);runtime.RE_AddRefEntityToScene(state,queue.RefEntity(3,"next",false));parms2=runtime.RE_RenderScene(state,makeInput(0,[1,2,3,4]))
  count=count+req(not context.views[1][1].areamaskModified and len(context.views[1][1].entities)==1,"unchanged mask and isolated next scene")
  count=count+req(state.frameSceneNum==2 and state.sceneCount==2 and state.frontEndMsec==14,"multiple scenes in frame")
  state.dynamicLight=false;runtime.RE_AddLightToScene(state,[0,0,0],5,1,1,1);runtime.RE_RenderScene(state,makeInput(0,[1,2,3,4]));count=count+req(len(context.views[2][1].dlights)==0,"dynamic-light global disable")
  state.dynamicLight=true;state.vertexLight=true;runtime.RE_AddLightToScene(state,[0,0,0],5,1,1,1);runtime.RE_RenderScene(state,makeInput(0,[1,2,3,4]));count=count+req(len(context.views[3][1].dlights)==0,"vertex-light global disable")
  state.vertexLight=false;state.hardwareType=queue.GLHW_PERMEDIA2;scene.dlights.clear();scene.dlights.add(queue.DLight([0,0,0],5,[1,1,1],false));scene.firstSceneDlight=0;runtime.RE_RenderScene(state,makeInput(0,[1,2,3,4]));count=count+req(len(context.views[4][1].dlights)==0,"Permedia dynamic-light disable")
  state.hardwareType=0;state.worldLoaded=false;count=count+req(try(runtime.RE_RenderScene(state,makeInput(0,[]))) is error,"missing world rejected")
  count=count+req(runtime.RE_RenderScene(state,makeInput(runtime.RDF_NOWORLDMODEL,[]))!=false,"noworldmodel accepted")
  state.noRefresh=true;before=len(context.views);count=count+req(not runtime.RE_RenderScene(state,makeInput(runtime.RDF_NOWORLDMODEL,[])) and len(context.views)==before,"norefresh skips")
  state.noRefresh=false;state.registered=false;count=count+req(not runtime.RE_RenderScene(state,makeInput(runtime.RDF_NOWORLDMODEL,[])),"unregistered render skips")
  scene.registered=false;count=count+req(runtime.RE_AddPolyToScene(state,1,3,verts,1)==0 and not runtime.RE_AddRefEntityToScene(state,queue.RefEntity(0,"x",false)),"unregistered scene submissions skip")
  count=count+req(try(runtime.create(scene,0,void)) is error,"video height validated")
  count=count+req(try(runtime.RE_AddRefEntityToScene(state,void)) is error,"missing entity rejected")
  print("PASS: "+str(count)+" complete tr_scene contracts")
  return 0
end function
