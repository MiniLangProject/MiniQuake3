import mq3.platform.win_qgl_runtime as win
import mq3.renderer.qgl as qgl

function req(value,label) if not value then return error(7964,"win qgl contract: "+label) end if;return 1 end function
function main(args)
  count=0;registry=qgl.createRegistry();state=win.create()
  count=count+req(not win.QGL_Init(state,registry,"opengl32",false) and not state.loaded,"load failure")
  count=count+req(win.QGL_Init(state,registry,"opengl32",true) and state.loaded and registry.loaded,"complete load")
  count=count+req(len(registry.bindings)>300 and len(qgl.missingRequired(registry))==0,"complete binding table")
  count=count+req(qgl.has(registry,"qglBegin") and qgl.has(registry,"qwglCreateContext"),"core and WGL binding")
  count=count+req(not qgl.has(registry,"qglActiveTextureARB") and not qgl.has(registry,"qwglSwapIntervalEXT"),"extensions deferred")
  count=count+req(not win.QGL_Init(state,registry,"opengl32",true),"double load rejected")
  count=count+req(win.QGL_EnableLogging(state,true,3) and state.logging and state.logOpen,"logging enabled")
  count=count+req(win.dispatch(state,registry,"qglBegin",[win.GL_TRIANGLES]) and len(state.calls)==1 and len(state.logLines)==2,"logged dispatch")
  count=count+req(win.QGL_EnableLogging(state,true,2) and state.logCounter==1,"logging countdown")
  count=count+req(not win.QGL_EnableLogging(state,true,1) and not state.logging,"logging countdown close")
  count=count+req(not win.dispatch(state,registry,"qglActiveTextureARB",[]) and len(state.calls)==1,"unbound extension rejected")
  count=count+req(len(win.logFunctionNames())==336,"wrapper inventory")
  win.QGL_Shutdown(state,registry)
  count=count+req(not state.loaded and not registry.loaded and len(registry.bindings)==0,"complete shutdown")
  print "PASS: "+str(count)+" win_qgl contracts";return 0
end function
