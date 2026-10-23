import mq3.platform.win_shared_runtime as win
function main(args)
  clock=win.createClock();print("millis|"+str(win.Sys_Milliseconds(clock,1000))+"|"+str(win.Sys_Milliseconds(clock,1007)))
  print("user|"+win.Sys_GetCurrentUser("Ranger"));print("empty|"+win.Sys_GetCurrentUser(""));print("failure|"+win.Sys_GetCurrentUser(void))
  home=win.Sys_DefaultHomePath();homeText="value";if home==void then homeText="null" end if
  print("paths|"+homeText+"|"+win.Sys_DefaultInstallPath("C:/MiniQuake3"))
  cpu=win.createCpu(1,0,0,0,true);print("processor|"+str(win.Sys_GetProcessorId(cpu,"x64")))
end function
