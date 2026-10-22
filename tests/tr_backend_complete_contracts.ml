import mq3.renderer.tr_backend_runtime as backend
import mq3.renderer.texture_state as textures
import mq3.renderer.command_queue as commands
import mq3.renderer.draw_surfs as drawSurfs

struct Context events surfaces screenshots end struct
function req(ok,message) if not ok then return error(7722,message) end if;return 1 end function
function event(context,kind,value) context.events=context.events+[[kind,value]] end function
function surface(context,value) context.surfaces=context.surfaces+[value] end function
function screenshot(context,value) context.screenshots=context.screenshots+[value] end function
function has(context,kind) for each item in context.events if item[0]==kind then return true end if end for;return false end function
function stateFor(context)
  host=backend.Services(event,surface,screenshot,void,context);texture=textures.create(void,textures.image(10));texture.frameCount=9;return backend.create(texture,640,480,host)
end function
function main(args)
  count=0;context=Context([],[],[]);state=stateFor(context)
  count=count+req(backend.CT_FRONT_SIDED==0 and backend.CT_BACK_SIDED==1 and backend.CT_TWO_SIDED==2,"cull ABI")
  image=textures.image(22);count=count+req(backend.GL_Bind(state,image) and image.frameUsed==9,"GL_Bind productive cache")
  count=count+req(not backend.GL_Bind(state,image),"GL_Bind cache hit")
  count=count+req(backend.GL_SelectTexture(state,1) and state.textureState.currentTmu==1,"GL_SelectTexture")
  image2=textures.image(23);count=count+req(backend.GL_BindMultitexture(state,image,backend.GL_MODULATE,image2,backend.GL_MODULATE)==1,"GL_BindMultitexture")
  state.viewParms.isMirror=false;count=count+req(backend.GL_Cull(state,backend.CT_BACK_SIDED),"GL_Cull change")
  count=count+req(not backend.GL_Cull(state,backend.CT_BACK_SIDED),"GL_Cull cache")
  state.viewParms.isMirror=true;backend.GL_Cull(state,backend.CT_FRONT_SIDED);count=count+req(state.gl.faceCulling==backend.CT_FRONT_SIDED,"GL_Cull mirror")
  backend.GL_Cull(state,backend.CT_TWO_SIDED);count=count+req(state.gl.faceCulling==backend.CT_TWO_SIDED,"GL_Cull two sided")
  count=count+req(backend.GL_TexEnv(state,backend.GL_ADD) and not backend.GL_TexEnv(state,backend.GL_ADD),"GL_TexEnv cache")
  count=count+req(try(backend.GL_TexEnv(state,12345)) is error,"GL_TexEnv rejects unknown")
  bits=backend.GLS_DEPTHMASK_TRUE|backend.GLS_DEPTHFUNC_EQUAL|backend.GLS_POLYMODE_LINE|backend.GLS_DEPTHTEST_DISABLE|backend.GLS_ATEST_GE_80|5|0x60
  count=count+req(backend.GL_State(state,bits),"GL_State transition")
  count=count+req(state.gl.depthEqual and state.gl.depthWrite and state.gl.wireframe and not state.gl.depthTest and state.gl.alphaTest==backend.GLS_ATEST_GE_80,"GL_State depth alpha")
  count=count+req(state.gl.blendEnabled and state.gl.srcBlend==5 and state.gl.dstBlend==6,"GL_State blend decode")
  count=count+req(not backend.GL_State(state,bits),"GL_State cache")
  state.refdef.time=128;c=backend.RB_Hyperspace(state);count=count+req(c>0.5019 and c<0.5021 and state.isHyperspace,"RB_Hyperspace")
  context.events=[];state.viewParms.viewportX=3;state.viewParms.viewportY=4;state.viewParms.viewportWidth=320;state.viewParms.viewportHeight=200;backend.SetViewportAndScissor(state);count=count+req(has(context,"projection") and has(context,"viewport") and has(context,"scissor"),"SetViewportAndScissor")
  state.refdef.rdflags=backend.RDF_HYPERSPACE;count=count+req(not backend.RB_BeginDrawingView(state,0,false,0,false),"hyperspace short circuit")
  state.refdef.rdflags=0;state.viewParms.isPortal=true;state.viewParms.portalNormal=[0.0,0.0,1.0];state.viewParms.portalDist=2.0;count=count+req(backend.RB_BeginDrawingView(state,1,true,2,true),"normal view begin")
  count=count+req(state.finishCalled and not state.projection2D and has(context,"clipPlane"),"view finish clear clip")
  backend.RB_SetGL2D(state,2500);count=count+req(state.projection2D and state.refdef.time==2500 and state.refdef.floatTime==2.5,"RB_SetGL2D time")
  count=count+req(state.gl.blendEnabled and not state.gl.depthTest,"RB_SetGL2D state")
  colorCommand=commands.Command(commands.RC_SET_COLOR,commands.SET_COLOR_BYTES,[0.5,0.25,0.75,1.0],void);color=backend.RB_SetColor(state,colorCommand);count=count+req(color==[127,63,191,255],"RB_SetColor bytes")
  picCommand=commands.Command(commands.RC_STRETCH_PIC,commands.STRETCH_PIC_BYTES,[10.0,20.0,30.0,40.0,0.1,0.2,0.8,0.9],"hud");count=count+req(backend.RB_StretchPic(state,picCommand,2600)==1 and state.numIndexes==6,"RB_StretchPic tessellation")
  pixels=bytes(8*4*4,7);raw=backend.RE_StretchRaw(state,10.0,20.0,100.0,50.0,8,4,pixels,0,true,2700);count=count+req(raw.positions[2]==[110.0,70.0] and raw.texCoords[0]==[0.0625,0.125],"RE_StretchRaw half texels")
  count=count+req(len(state.uploads)==1 and state.uploads[0].fullUpload,"raw initial full upload")
  backend.RE_UploadCinematic(state,1,1,8,4,pixels,0,false);count=count+req(len(state.uploads)==1,"clean same-size cinematic skips upload")
  backend.RE_UploadCinematic(state,1,1,8,4,pixels,0,true);count=count+req(len(state.uploads)==2 and not state.uploads[1].fullUpload,"dirty cinematic sub upload")
  count=count+req(try(backend.RE_StretchRaw(state,0,0,1,1,7,4,pixels,0,true,1)) is error,"raw power-of-two validation")
  infos=[backend.ImageInfo(void,256,128),backend.ImageInfo(void,512,512)];shown=backend.RB_ShowImages(state,infos,2,2800);count=count+req(len(shown)==2 and shown[0].positions[2]==[16.0,8.0],"RB_ShowImages proportional grid")
  shaders=[backend.Shader("zero",false,0.0),backend.Shader("world",false,0.25),backend.Shader("merge",true,0.0)]
  entity0=backend.Entity(0.5,backend.RF_DEPTHHACK,true,backend.identityMatrix());entity1=backend.Entity(0.0,0,false,backend.identityMatrix());state.refdef=backend.Refdef(1000,1.0,0,[entity0,entity1],["light"]);state.viewParms=backend.viewParms(640,480)
  key0=drawSurfs.pack(1,0,2,1);key1=drawSurfs.pack(2,1,2,0);keyWorld=drawSurfs.pack(1,backend.ENTITYNUM_WORLD,0,0)
  surfaces=[backend.Surface(key0,"a"),backend.Surface(key0,"b"),backend.Surface(key1,"c"),backend.Surface(keyWorld,"d")];context.surfaces=[]
  rendered=backend.RB_RenderDrawSurfList(state,surfaces,shaders,0,false,0,false);count=count+req(rendered==4 and context.surfaces==["a","b","c","d"],"RB_RenderDrawSurfList dispatch")
  count=count+req(state.refdef.floatTime==1.0 and state.currentEntity==state.worldEntity,"draw list restores world time/entity")
  count=count+req(has(context,"depthRange") and has(context,"shadowFinish") and has(context,"renderFlares"),"draw list depth and epilogue")
  payload=backend.DrawPayload(state.refdef,state.viewParms,[backend.Surface(keyWorld,"world")],shaders);drawCommand=backend.Command(commands.RC_DRAW_SURFS,payload);count=count+req(backend.RB_DrawSurfs(state,drawCommand,0,false,0,false)==1,"RB_DrawSurfs command")
  bufferCommand=backend.Command(commands.RC_DRAW_BUFFER,1029);count=count+req(backend.RB_DrawBuffer(state,bufferCommand,true),"RB_DrawBuffer")
  state.numIndexes=6;count=count+req(backend.RB_SwapBuffers(state,backend.Command(commands.RC_SWAP_BUFFERS,void),0,[],true,[1,2,3],3000) and state.overdraw==6 and state.frames==1 and not state.projection2D,"RB_SwapBuffers")
  endCommand=backend.Command(commands.RC_END_OF_LIST,void);screenCommand=backend.Command(commands.RC_SCREENSHOT,"shot");stream=[backend.Command(commands.RC_SET_COLOR,colorCommand),backend.Command(commands.RC_STRETCH_PIC,picCommand),bufferCommand,screenCommand,endCommand]
  executed=backend.RB_ExecuteRenderCommands(state,stream,true,true,3100);count=count+req(executed==4 and state.smpFrame==1 and context.screenshots==["shot"],"RB_ExecuteRenderCommands dispatch and stop")
  count=count+req(backend.RB_RenderThread(state,[stream,stream,void],true,3200)==2,"RB_RenderThread lifecycle")
  print("PASS: "+str(count)+" complete tr_backend contracts")
  return 0
end function
