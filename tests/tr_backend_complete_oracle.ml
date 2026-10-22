import mq3.renderer.tr_backend_runtime as backend
import mq3.renderer.texture_state as textures
import mq3.renderer.command_queue as commands
import mq3.compat.numeric as n
struct Context events end struct
function event(context,kind,value) context.events=context.events+[[kind,value]] end function
function find(context,kind)
  for each item in context.events if item[0]==kind then return item[1] end if end for;return void
end function
function main(args)
  context=Context([]);host=backend.Services(event,void,void,void,context);state=backend.create(textures.create(void,textures.image(1)),640,480,host)
  backend.GL_Cull(state,backend.CT_BACK_SIDED);value=find(context,"cull");print("cullBack|"+str(state.gl.faceCulling)+"|2884|1029")
  state.viewParms.isMirror=true;backend.GL_Cull(state,backend.CT_FRONT_SIDED);print("cullMirror|"+str(state.gl.faceCulling)+"|1029")
  backend.GL_Cull(state,backend.CT_TWO_SIDED);print("cullTwo|"+str(state.gl.faceCulling)+"|2884")
  state.textureState.currentTmu=1;backend.GL_TexEnv(state,backend.GL_ADD);print("texEnv|"+str(state.gl.texEnv[1])+"|"+str(backend.GL_ADD))
  context.events=[];state.refdef.time=128;c=backend.RB_Hyperspace(state);print("hyper|"+str(n.trunc32(c*1000000.0))+"|16384|1")
  state.viewParms.projectionMatrix=[1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0];state.viewParms.viewportX=3;state.viewParms.viewportY=4;state.viewParms.viewportWidth=640;state.viewParms.viewportHeight=360;backend.SetViewportAndScissor(state);print("viewport|3,4,640,360|3,4,640,360|16|5888")
  cmd=commands.Command(commands.RC_SET_COLOR,commands.SET_COLOR_BYTES,[0.5,0.25,0.75,1.0],void);color=backend.RB_SetColor(state,cmd);print("color|"+str(color[0])+","+str(color[1])+","+str(color[2])+","+str(color[3]))
  return 0
end function
