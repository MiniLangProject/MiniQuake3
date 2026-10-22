import mq3.client.cgame_syscalls as traps
import mq3.vm.syscall_common as common
import mq3.vm.syscall_cgame as cgame
import mq3.qcommon.cvar as cvars
import mq3.qcommon.command_buffer as commands
import mq3.compat.numeric as numeric
struct Capture calls end struct
struct Machine data mask end struct
struct Context events ops end struct
function req(value,message) if not value then return error(7905,message) end if;return 1 end function
function capture(c,words) c.calls=c.calls+[words];return words[0]+500 end function
function put(vm,at,text) data=bytes(text);if len(data)>0 then copyBytes(vm.data,at,data,0,len(data)) end if;vm.data[at+len(data)]=0;return at end function
function output(context,text) context.events=context.events+[text];return void end function
function openFile(context,name,mode) context.events=context.events+["open:"+name+":"+str(mode)];return common.OpenResult(23,321) end function
function closeFile(context,handle) context.events=context.events+["close:"+str(handle)];return void end function
function extended(context,vm,base,op) context.ops=context.ops+[op];return op+1000 end function
function main(args)
 count=0;captureState=Capture([]);gateway=traps.dllEntry(captureState,capture,false)
 count=count+req(traps.PASSFLOAT(-0.0)==numeric.i32(numeric.floatBits(-0.0)) and traps.PASSFLOAT(1.25)==1067450368,"PASSFLOAT bit identity")
 count=count+req(traps.trap_Milliseconds(gateway)==502 and captureState.calls[0]==[traps.CG_MILLISECONDS],"no-argument result wrapper")
 traps.trap_Cvar_Register(gateway,100,200,300,4);count=count+req(captureState.calls[1]==[traps.CG_CVAR_REGISTER,100,200,300,4],"cvar register words")
 count=count+req(traps.trap_FS_FOpenFile(gateway,100,200,2)==510 and captureState.calls[2]==[traps.CG_FS_FOPENFILE,100,200,2],"filesystem result wrapper")
 traps.trap_CM_TransformedCapsuleTrace(gateway,1,2,3,4,5,6,7,8,9);count=count+req(captureState.calls[3]==[traps.CG_CM_TRANSFORMEDCAPSULETRACE,1,2,3,4,5,6,7,8,9],"collision pointer order")
 traps.trap_S_Respatialize(gateway,7,100,200,1);count=count+req(captureState.calls[4]==[traps.CG_S_RESPATIALIZE,7,100,200,1],"audio argument order")
 traps.trap_R_DrawStretchPic(gateway,1.0,2.0,3.0,4.0,0.0,0.25,0.5,1.0,9);draw=captureState.calls[5];count=count+req(draw[0]==46 and draw[1]==numeric.floatBits(1.0) and draw[6]==numeric.floatBits(0.25) and draw[9]==9,"renderer float words")
 count=count+req(traps.trap_R_LerpTag(gateway,10,11,12,13,0.75,14)==548 and captureState.calls[6][5]==numeric.floatBits(0.75),"lerp float and result")
 traps.trap_SetUserCmdValue(gateway,17,1.5);count=count+req(captureState.calls[7]==[56,17,numeric.floatBits(1.5)],"input sensitivity bits")
 count=count+req(traps.trap_PC_ReadToken(gateway,4,500)==567 and captureState.calls[8]==[67,4,500],"parser result wrapper")
 count=count+req(traps.trap_CIN_PlayCinematic(gateway,100,1,2,3,4,5)==574,"cinematic result wrapper")
 count=count+req(traps.trap_loadCamera(gateway,700)==590 and traps.trap_getCameraInfo(gateway,1,2,3)==592,"dormant camera ordinals")
 retailCapture=Capture([]);retail=traps.dllEntry(retailCapture,capture,true);count=count+req(traps.trap_R_RegisterModel(retail,10)==0 and len(retailCapture.calls)==0 and len(retail.calls)==1 and not retail.calls[0].dispatched,"retail duplicate suppression")
 vm=Machine(bytes(8192,0),8191);context=Context([],[]);shared=common.services(cvars.create(),commands.create(),context);shared.printFn=output;shared.errorFn=output;shared.openFn=openFile;shared.closeFn=closeFile;host=cgame.services(shared,context);host.extendedFn=extended;qgateway=traps.qvmGateway(host,vm,8000,false)
 put(vm,100,"native cgame");traps.trap_Print(qgateway,100);count=count+req(context.events[0]=="native cgame","existing common print host")
 put(vm,200,"maps/q3dm1.bsp");count=count+req(traps.trap_FS_FOpenFile(qgateway,200,300,0)==321 and numeric.readI32(vm.data,300)==23 and context.events[1]=="open:maps/q3dm1.bsp:0","existing filesystem host")
 put(vm,400,"cg_drawGun");put(vm,450,"0");traps.trap_Cvar_Set(qgateway,400,450);count=count+req(cvars.find(shared.cvars,"cg_drawGun").integer==0,"existing cvar host")
 traps.trap_CM_PointContents(qgateway,500,1);traps.trap_S_StartLocalSound(qgateway,2,3);traps.trap_R_AddRefEntityToScene(qgateway,600);traps.trap_Key_IsDown(qgateway,13);traps.trap_PC_LoadSource(qgateway,700);count=count+req(context.ops==[23,29,41,60,65],"collision audio renderer input parser forwarding")
 count=count+req(try(traps.qvmGateway(host,vm,8188,false).syscallFn(traps.DispatcherContext(host,vm,8188),[1,2])) is error,"QVM argument span validation")
 print("PASS: "+str(count)+" native cgame_syscalls contracts");return 0
end function
