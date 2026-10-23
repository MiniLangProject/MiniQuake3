import mq3.platform.win_glimp_runtime as gl

function req(value,label) if not value then return error(7960,"win glimp contract: "+label) end if;return 1 end function
function main(args)
  count=0
  state=gl.create();count=count+req(state.osSupported and not state.driverLoaded and not state.windowCreated and not state.contextCreated,"cold lifecycle")
  pfd=gl.GLW_CreatePFD(24,24,8,false);count=count+req(pfd.flags==(gl.PFD_DRAW_TO_WINDOW|gl.PFD_SUPPORT_OPENGL|gl.PFD_DOUBLEBUFFER) and pfd.pixelType==gl.PFD_TYPE_RGBA,"base PFD flags")
  stereo=gl.GLW_CreatePFD(32,24,8,true);count=count+req((stereo.flags&gl.PFD_STEREO)!=0 and stereo.colorBits==32 and stereo.depthBits==24 and stereo.stencilBits==8,"stereo PFD")
  desired=gl.GLW_CreatePFD(24,24,8,false)
  candidates=[gl.PFD(desired.flags|gl.PFD_GENERIC_FORMAT,0,32,24,8,0,1),gl.PFD(desired.flags,1,32,24,8,0,2),gl.PFD(desired.flags,0,32,8,8,0,3),gl.PFD(desired.flags,0,32,24,0,0,4),gl.PFD(desired.flags,0,16,16,4,0,5),gl.PFD(desired.flags,0,24,24,8,0,6)]
  count=count+req(gl.GLW_ChoosePFD(candidates,desired,false)==6,"PFD rejection and exact selection")
  count=count+req(gl.GLW_ChoosePFD([candidates[0]],desired,false)==0,"software PFD rejected")
  count=count+req(gl.GLW_ChoosePFD([candidates[0]],desired,true)==1,"software PFD allowed")
  desiredStereo=gl.GLW_CreatePFD(24,24,8,true);stereoCandidate=gl.PFD(desiredStereo.flags,0,24,24,8,0,9)
  count=count+req(gl.GLW_ChoosePFD([gl.PFD(desired.flags,0,24,24,8,0,8),stereoCandidate],desiredStereo,false)==9,"stereo selection priority")
  count=count+req(gl.GLW_MakeContext(state,pfd,false,true,true,true)==gl.TRY_PFD_FAIL_SOFT,"choose failure is soft")
  count=count+req(gl.GLW_MakeContext(state,pfd,true,false,true,true)==gl.TRY_PFD_FAIL_SOFT,"set failure is soft")
  count=count+req(gl.GLW_MakeContext(state,pfd,true,true,false,true)==gl.TRY_PFD_FAIL_HARD,"create failure is hard")
  count=count+req(gl.GLW_MakeContext(state,pfd,true,true,true,false)==gl.TRY_PFD_FAIL_HARD,"make current failure is hard")
  count=count+req(gl.GLW_MakeContext(state,pfd,true,true,true,true)==gl.TRY_PFD_SUCCESS and state.contextCreated,"context success")
  count=count+req(gl.PrintCDSError(0)=="DISP_CHANGE_SUCCESSFUL" and gl.PrintCDSError(-5)=="DISP_CHANGE_BADMODE" and gl.PrintCDSError(77)=="unknown error","display error strings")
  modes=[[640,480,60],[800,600,75]]
  count=count+req(gl.GLW_SetMode(state,"opengl32",-1,24,false,modes,true)==gl.RSERR_INVALID_MODE,"negative mode rejected")
  count=count+req(gl.GLW_SetMode(state,"opengl32",2,24,false,modes,true)==gl.RSERR_INVALID_MODE,"large mode rejected")
  count=count+req(gl.GLW_SetMode(state,"opengl32",1,24,true,modes,false)==gl.RSERR_INVALID_FULLSCREEN,"fullscreen mode rejection")
  count=count+req(gl.GLW_SetMode(state,"opengl32",1,24,true,modes,true)==gl.RSERR_OK and state.mode.width==800 and state.mode.height==600 and state.mode.frequency==75 and state.displayChanged,"fullscreen mode success")
  extensions="GL_EXT_texture_compression_s3tc GL_EXT_texture_env_add GL_ARB_multitexture GL_EXT_compiled_vertex_array WGL_EXT_swap_control"
  ext=gl.GLW_InitExtensions(state,extensions,true);count=count+req(ext.textureCompression and ext.textureEnvAdd and ext.multitexture and ext.compiledVertexArray and ext.swapControl and ext.maxActiveTextures==2,"extension initialization")
  fresh=gl.create();ext=gl.GLW_InitExtensions(fresh,extensions,false);count=count+req(not ext.textureCompression and not ext.multitexture and ext.maxActiveTextures==1,"extensions disabled")
  count=count+req(gl.hasExtension("GL_EXT_foobar GL_EXT_foo","GL_EXT_foo") and not gl.hasExtension("GL_EXT_foobar","GL_EXT_foo"),"extension token boundaries")
  count=count+req(gl.GLW_CheckOSVersion(2,4) and gl.GLW_CheckOSVersion(2,10) and not gl.GLW_CheckOSVersion(1,10) and not gl.GLW_CheckOSVersion(2,3),"OS version gate")
  failed=gl.create();count=count+req(not gl.GLW_LoadOpenGL(failed,"opengl32",false,modes,0,24,false) and not failed.driverLoaded,"driver load failure")
  started=gl.create();count=count+req(gl.GLW_StartOpenGL(started,"opengl32",modes,0) and started.driverLoaded and started.windowCreated and started.contextCreated,"OpenGL startup")
  initialized=gl.create();count=count+req(gl.GLimp_Init(initialized,2,10,"opengl32",modes,1,extensions) and initialized.active and initialized.extensions.multitexture,"GLimp initialization")
  count=count+req(gl.GLimp_EndFrame(initialized,"GL_BACK") and initialized.swaps==1,"back buffer swap")
  count=count+req(not gl.GLimp_EndFrame(initialized,"GL_FRONT") and initialized.swaps==1,"front buffer no swap")
  gl.GLimp_LogComment(initialized,"frame complete");count=count+req(len(initialized.logs)==1 and initialized.logs[0]=="frame complete","logging")
  count=count+req(gl.GLimp_SpawnRenderThread(initialized,true) and initialized.rendererThread and gl.GLimp_FrontEndSleep(initialized),"renderer thread spawn")
  gl.GLimp_WakeRenderer(initialized,"draw-1");gl.GLimp_WakeRenderer(initialized,"draw-2");count=count+req(not gl.GLimp_FrontEndSleep(initialized) and gl.GLimp_RendererSleep(initialized)=="draw-1","renderer wake and sleep")
  gl.GLimp_RenderThreadWrapper(initialized);count=count+req(initialized.renderCompleted and len(initialized.renderCommands)==0,"renderer wrapper completion")
  gl.GLimp_Shutdown(initialized);count=count+req(not initialized.active and not initialized.driverLoaded and not initialized.windowCreated and not initialized.contextCreated and not initialized.displayChanged and not initialized.rendererThread,"complete shutdown")
  print "PASS: "+str(count)+" complete win_glimp contracts";return 0
end function
