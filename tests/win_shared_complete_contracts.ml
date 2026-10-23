import mq3.platform.win_shared_runtime as win
function req(ok,name) if not ok then print("FAIL: "+name);return 1 end if;return 0 end function
function main(args)
  failures=0;count=0
  clock=win.createClock();count=count+1;failures=failures+req(win.Sys_Milliseconds(clock,100)==0 and win.Sys_Milliseconds(clock,113)==13,"relative milliseconds")
  wrap=win.createClock();win.Sys_Milliseconds(wrap,0xfffffffe);count=count+1;failures=failures+req(win.Sys_Milliseconds(wrap,2)==4,"milliseconds wraps as DWORD")
  cpu=win.createCpu(1,0x80000001,1<<23,0,true);count=count+1;failures=failures+req(win.CPUID(cpu,1)[3]==1<<23 and win.IsPentium(cpu),"cpuid facade")
  count=count+1;failures=failures+req(win.Sys_GetProcessorId(cpu,"x64")==win.CPUID_GENERIC,"non-x86 generic")
  count=count+1;failures=failures+req(win.Sys_GetProcessorId(win.createCpu(0,0,0,0,false),"x86")==win.CPUID_INTEL_UNSUPPORTED,"unsupported x86")
  count=count+1;failures=failures+req(win.Sys_GetProcessorId(win.createCpu(1,0,0,0,true),"x86")==win.CPUID_INTEL_PENTIUM,"pentium")
  count=count+1;failures=failures+req(win.Sys_GetProcessorId(cpu,"x86")==win.CPUID_INTEL_MMX,"mmx")
  count=count+1;failures=failures+req(win.Sys_GetProcessorId(win.createCpu(1,0,(1<<23)|(1<<25),0,true),"x86")==win.CPUID_INTEL_KATMAI,"katmai")
  count=count+1;failures=failures+req(win.Sys_GetProcessorId(win.createCpu(1,0x80000001,1<<23,1<<31,true),"x86")==win.CPUID_AMD_3DNOW,"3dnow priority")
  count=count+1;failures=failures+req(win.IsMMX(cpu) and not win.IsKNI(cpu) and not win.Is3DNOW(cpu),"feature probes")
  count=count+1;failures=failures+req(win.fastftol(2.5)==2 and win.fastftol(3.5)==4 and win.fastftol(0.0-2.5)==-2,"fistp ties even")
  vector=[1.6,0.0-1.6,4.5];win.Sys_SnapVector(vector);count=count+1;failures=failures+req(vector==[2.0,-2.0,4.0],"snap vector")
  count=count+1;failures=failures+req(win.Sys_GetCurrentUser(void)=="player" and win.Sys_GetCurrentUser("")=="player" and win.Sys_GetCurrentUser("Ranger")=="Ranger","current user fallback")
  count=count+1;failures=failures+req(win.Sys_DefaultHomePath()==void and win.Sys_DefaultInstallPath("D:/Q3")=="D:/Q3","default paths")
  if failures==0 then print("PASS: "+str(count)+" complete win_shared contracts") end if
end function
