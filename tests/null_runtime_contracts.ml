import mq3.platform.null_runtime as n

struct Context calls end struct
function frame(context) context.calls=context.calls+1;return void end function
function req(value,label) if not value then return error(7980,"null runtime contract: "+label) end if;return 1 end function
function main(args)
  count=0
  count=count+req(len(n.macNetSymbols())==3 and len(n.nullNetSymbols())==3,"network surfaces")
  count=count+req(len(n.nullClientSymbols())==21 and len(n.nullGlimpSymbols())==7,"client/GL surfaces")
  count=count+req(len(n.nullInputSymbols())==4 and len(n.nullMainSymbols())==18 and len(n.nullSoundSymbols())==8,"input/system/sound surfaces")
  state=n.create();n.CL_Init(state);count=count+req(state.clientInitialized and not n.CL_GameCommand(state) and not n.UI_GameCommand(state),"headless client")
  count=count+req(n.CL_CDKeyValidate("","") and n.CL_CDKeyValidate("x","bad"),"null CD validation")
  n.CL_ConsolePrint(state,"server");n.Sys_EarlyOutput(state," ready");count=count+req(state.consoleText=="server ready","console output")
  n.IN_Init(state);n.IN_Frame(state);n.IN_Shutdown(state);count=count+req(state.inputFrames==1 and not state.inputInitialized,"null input lifecycle")
  count=count+req(n.GLimp_Init(state)==0 and n.QGL_Init(state,"")==true and state.glInitialized and state.qglInitialized,"null GL init")
  n.GLimp_EnableLogging(state,true);n.GLimp_LogComment(state," gl");n.GLimp_EndFrame(state);count=count+req(state.glFrames==1 and state.consoleText=="server ready gl","null GL frame")
  n.GLimp_Shutdown(state);n.QGL_Shutdown(state);count=count+req(not state.glInitialized and not state.qglInitialized,"null GL shutdown")
  address=n.NET_StringToAdr("localhost");count=count+req(address.type==n.NA_LOOPBACK and n.NET_StringToAdr("127.0.0.1")==void,"loopback-only network")
  n.Sys_SendPacket(state,3,bytes([1,2,3,4]),address);count=count+req(len(state.sentPackets)==1 and len(state.sentPackets[0].data)==3 and n.Sys_GetPacket(state)==void,"null packet I/O")
  count=count+req(not n.SNDDMA_Init(state) and n.SNDDMA_GetDMAPos(state)==0,"null DMA")
  count=count+req(n.S_RegisterSound(state,"sound/test.wav",false)==0 and state.soundRegistrations==1,"null sound registration")
  n.S_StartLocalSound(state,0,0);count=count+req(state.localSounds==1,"null local sound")
  count=count+req(n.Sys_Milliseconds(state)==0 and n.Sys_GetGameAPI(state,void)==void and n.Sys_GetClipboardData(state)==void,"null system values")
  context=Context(0);count=count+req(n.headlessMain(state,5,frame,context)==5 and context.calls==5,"bounded headless loop")
  n.Sys_Quit(state);count=count+req(state.quitRequested and n.headlessMain(state,5,frame,context)==6 and context.calls==6,"quit stops loop")
  count=count+req(try(n.Sys_Error(state,"fatal")) is error and len(state.errors)==1,"safe fatal error")
  n.CL_ShutdownAll(state);count=count+req(not state.clientInitialized,"client shutdown")
  print "PASS: "+str(count)+" null platform contracts";return 0
end function
