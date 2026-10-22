#include <stdio.h>
#include <stdarg.h>
#include "cg_local.h"

/* Dormant slots occur as commented enumerators in the retail source. */
#define CG_LOADCAMERA 90
#define CG_STARTCAMERA 91
#define CG_GETCAMERAINFO 92

#include "cgame_syscalls_under_test.inc"

static int last_opcode,last_count,last_args[16];
static int argument_count(int opcode) {
 switch(opcode) {
  case CG_PRINT:return 1;case CG_CVAR_REGISTER:return 4;case CG_FS_SEEK:return 3;
  case CG_CM_BOXTRACE:return 7;case CG_S_REGISTERSOUND:return 2;
  case CG_R_DRAWSTRETCHPIC:return 9;case CG_R_ADDLIGHTTOSCENE:return 5;
  case CG_R_LERPTAG:return 6;case CG_SETUSERCMDVALUE:return 2;
  case CG_PC_SOURCE_FILE_AND_LINE:return 3;case CG_R_ADDADDITIVELIGHTTOSCENE:return 5;
  case CG_R_ADDPOLYSTOSCENE:return 4;case CG_GET_ENTITY_TOKEN:return 2;
  case CG_LOADCAMERA:return 1;case CG_STARTCAMERA:return 1;case CG_GETCAMERAINFO:return 3;
  default:return 0;
 }
}
static int QDECL capture(int opcode,...) {
 va_list values;int index;last_opcode=opcode;last_count=argument_count(opcode);va_start(values,opcode);
 for(index=0;index<last_count;index++)last_args[index]=va_arg(values,int);va_end(values);return opcode+7000;
}
static void dump(const char *name) {
 int index;printf("%s|%d|%d",name,last_opcode,last_count);for(index=0;index<last_count;index++)printf("|%d",last_args[index]);printf("\n");
}
int main(void) {
 int value;dllEntry(capture);printf("passfloat|%d|%d|%d\n",PASSFLOAT(1.25f),PASSFLOAT(-0.5f),PASSFLOAT(0.0f));
 trap_Print((char*)0x1000);dump("print");
 trap_Cvar_Register((vmCvar_t*)0x1100,(char*)0x1200,(char*)0x1300,9);dump("cvar");
 value=trap_FS_Seek(7,-12,2);dump("seek");printf("return|%d\n",value);
 trap_CM_BoxTrace((trace_t*)0x2000,(float*)0x2100,(float*)0x2200,(float*)0x2300,(float*)0x2400,5,0x101);dump("trace");
 value=trap_S_RegisterSound((char*)0x3000,1);dump("sound");printf("return|%d\n",value);
 trap_R_DrawStretchPic(1.25f,-0.5f,640.0f,480.0f,0.0f,0.25f,1.0f,0.75f,19);dump("stretch");
 trap_R_AddLightToScene((float*)0x4000,300.0f,1.0f,0.5f,0.25f);dump("light");
 value=trap_R_LerpTag((orientation_t*)0x4100,4,2,3,0.75f,(char*)0x4200);dump("lerptag");printf("return|%d\n",value);
 trap_SetUserCmdValue(17,1.5f);dump("usercmd");
 value=trap_PC_SourceFileAndLine(8,(char*)0x5000,(int*)0x5100);dump("parser");printf("return|%d\n",value);
 trap_R_AddAdditiveLightToScene((float*)0x6000,64.0f,0.1f,0.2f,0.3f);dump("additive");
 trap_R_AddPolysToScene(11,4,(polyVert_t*)0x6100,3);dump("polys");
 value=trap_GetEntityToken((char*)0x6200,1024);dump("entity");printf("return|%d\n",value);
 value=trap_loadCamera((char*)0x7000);dump("camera-load");printf("return|%d\n",value);
 trap_startCamera(1234);dump("camera-start");value=trap_getCameraInfo(55,(vec3_t*)0x7100,(vec3_t*)0x7200);dump("camera-info");printf("return|%d\n",value);
 return 0;
}
