import mq3.client.cgame_syscalls as traps
struct Capture last result end struct
function syscall(capture,words) capture.last=words;capture.result=words[0]+7000;return capture.result end function
function dump(name,capture) text=name+"|"+str(capture.last[0])+"|"+str(len(capture.last)-1);if len(capture.last)>1 then for index=1 to len(capture.last)-1 text=text+"|"+str(capture.last[index]) end for end if;print(text);return void end function
function main(args)
 capture=Capture([],0);gateway=traps.dllEntry(capture,syscall,false);print("passfloat|"+str(traps.PASSFLOAT(1.25))+"|"+str(traps.PASSFLOAT(-0.5))+"|"+str(traps.PASSFLOAT(0.0)))
 traps.trap_Print(gateway,0x1000);dump("print",capture);traps.trap_Cvar_Register(gateway,0x1100,0x1200,0x1300,9);dump("cvar",capture)
 value=traps.trap_FS_Seek(gateway,7,-12,2);dump("seek",capture);print("return|"+str(value));traps.trap_CM_BoxTrace(gateway,0x2000,0x2100,0x2200,0x2300,0x2400,5,0x101);dump("trace",capture)
 value=traps.trap_S_RegisterSound(gateway,0x3000,1);dump("sound",capture);print("return|"+str(value));traps.trap_R_DrawStretchPic(gateway,1.25,-0.5,640.0,480.0,0.0,0.25,1.0,0.75,19);dump("stretch",capture)
 traps.trap_R_AddLightToScene(gateway,0x4000,300.0,1.0,0.5,0.25);dump("light",capture);value=traps.trap_R_LerpTag(gateway,0x4100,4,2,3,0.75,0x4200);dump("lerptag",capture);print("return|"+str(value));traps.trap_SetUserCmdValue(gateway,17,1.5);dump("usercmd",capture)
 value=traps.trap_PC_SourceFileAndLine(gateway,8,0x5000,0x5100);dump("parser",capture);print("return|"+str(value));traps.trap_R_AddAdditiveLightToScene(gateway,0x6000,64.0,0.1,0.2,0.3);dump("additive",capture);traps.trap_R_AddPolysToScene(gateway,11,4,0x6100,3);dump("polys",capture)
 value=traps.trap_GetEntityToken(gateway,0x6200,1024);dump("entity",capture);print("return|"+str(value));value=traps.trap_loadCamera(gateway,0x7000);dump("camera-load",capture);print("return|"+str(value));traps.trap_startCamera(gateway,1234);dump("camera-start",capture);value=traps.trap_getCameraInfo(gateway,55,0x7100,0x7200);dump("camera-info",capture);print("return|"+str(value));return 0
end function
