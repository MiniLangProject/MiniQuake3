import mq3.platform.macosx_headers as m

function req(value,label) if not value then return error(7983,"macOS header contract: "+label) end if;return 1 end function
function main(args)
  count=0
  count=count+req(len(m.mouseDeltaSymbols())==2 and len(m.controllerSymbols())==4 and len(m.displaySymbols())==9,"small header surfaces")
  count=count+req(len(m.localSymbols())==12 and len(m.timerSymbols())==19,"local/timer surfaces")
  names=m.qglSymbols();count=count+req(len(names)==337 and names[0]=="_glGetError" and names[1]=="qglAccum" and names[336]=="qglViewport","QGL surface")
  count=count+req(m.kCGSEventNotificationMouseMoved==715 and m.kCGSEventNotificationOtherMouseDragged==737,"private notification constants")
  s=m.create();m.CGFix_Initialize(s);m.CGFix_RecordMouseDelta(s,-4,7);count=count+req(m.CGFix_GetLastMouseDelta(s)==[-4,7],"mouse delta")
  m.CGSNotify(s,m.kCGSEventNotificationMouseMoved,[1],1,"arg");count=count+req(len(s.notifications)==1 and s.notifications[0][0]==715,"private notification callback")
  count=count+req(m.eventRecord(5,99,[10,20],3,[7])==[5,99,[10,20],3,[7]],"event record")
  m.paste(s,"connect localhost");m.showBanner(s);count=count+req(s.clipboard=="connect localhost" and s.bannerVisible and m.quakeMain(s,3)==3,"controller lifecycle")
  m.requestTerminate(s);count=count+req(m.quakeMain(s,2)==3 and s.terminateRequested,"controller termination")
  s.displayModes=[[1,"wide"],[2,"native"]];s.stretchedModes=[true,false];count=count+req(m.Sys_GetMatchingDisplayMode(s,false)==[2,"native"] and m.Sys_GetMatchingDisplayMode(s,true)==[1,"wide"],"display selection")
  table=m.GammaTable(2,2,[1,2],[3,4],[5,6]);m.Sys_StoreGammaTables(s,[table]);m.Sys_SetScreenFade(s,table,2.0);count=count+req(m.Sys_GetGammaTable(s,2)==table and s.fadeFraction==1.0,"gamma/fade clamp")
  m.Sys_FadeScreens(s);count=count+req(len(s.fadedDisplays)==2,"fade all displays");m.Sys_UnfadeScreen(s,1,table);count=count+req(s.fadedDisplays==[2],"unfade display")
  m.Sys_InitInput(s);m.Sys_SetMouseInputRect(s,[1,2,3,4]);s.display=2;count=count+req(s.inputInitialized and s.mouseRect==[1,2,3,4] and m.Sys_DisplayToUse(s)==2,"input/display")
  m.Sys_QueEvent(s,12,"key",13,1,"x");count=count+req(s.events[len(s.events)-1].kind=="key","system event")
  m.Sys_Hide(s);count=count+req(m.Sys_IsHidden(s) and m.Sys_Unhide(s) and not m.Sys_IsHidden(s),"hide/unhide")
  m.OSX_SetGLContext(s,"ns",42);count=count+req(m.OSX_GLContextSetCurrent(s) and m.OSX_GetNSGLContext(s)=="ns" and m.OSX_GetCGLContext(s)==42,"GL context")
  m.Sys_PauseGL(s);m.Sys_PauseGL(s);m.Sys_ResumeGL(s);count=count+req(s.pauseCount==1 and not s.contextCurrent,"nested GL pause");m.Sys_ResumeGL(s);count=count+req(s.pauseCount==0 and s.contextCurrent,"GL resume")
  count=count+req(m.qglCall(s,"qglBegin",[4]) and m.qglCall(s,"qglVertex3f",[1,2,3]) and not m.qglCall(s,"qglMissing",[]),"QGL dispatch")
  m.QGLRaiseError(s,1280);count=count+req(m.QGLCheckError(s,"inside begin")==0,"begin suppresses error check");m.qglCall(s,"qglEnd",[]);count=count+req(m.QGLCheckError(s,"after end")==1280,"QGL error boundary")
  m.QGLRaiseError(s,1281);count=count+req(m._glGetError(s)==1281 and m._glGetError(s)==0,"raw GL error")
  m.InitializeTimers(s);m.OTSTART(s,"world");m.GLSTAMP(s,"frame",3);m.OTSTOP(s);count=count+req(s.timers and len(s.timerStack)==0 and s.timerStamps==[["frame",3]],"timer lifecycle")
  print "PASS: "+str(count)+" macOS header contracts";return 0
end function
