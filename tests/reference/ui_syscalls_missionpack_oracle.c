#include <stdarg.h>
#include <stdio.h>
#include <stdint.h>
#include "ui_local.h"

void dllEntry(int (QDECL *syscallptr)(int arg,...));
int PASSFLOAT(float x);

static const char *text_a = "alpha";
static int pointer_a;
static int pointer_b;

static int QDECL capture(int op, ...) {
  va_list ap;
  va_start(ap,op);
  switch (op) {
    case UI_CVAR_SETVALUE: {
      const char *name=va_arg(ap,const char *);int bits=va_arg(ap,int);
      printf("cvar|%d|%d|%d\n",op,name==text_a,bits);break;
    }
    case UI_FS_FOPENFILE: {
      const char *path=va_arg(ap,const char *);fileHandle_t *handle=va_arg(ap,fileHandle_t *);int mode=va_arg(ap,int);
      printf("fs|%d|%d|%d|%d\n",op,path==text_a,handle==(fileHandle_t *)&pointer_a,mode);break;
    }
    case UI_R_ADDLIGHTTOSCENE: {
      const float *org=va_arg(ap,const float *);int intensity=va_arg(ap,int);int r=va_arg(ap,int);int g=va_arg(ap,int);int b=va_arg(ap,int);
      printf("light|%d|%d|%d|%d|%d|%d\n",op,org==(float *)&pointer_a,intensity,r,g,b);break;
    }
    case UI_R_DRAWSTRETCHPIC: {
      int values[8],i,shader;for(i=0;i<8;i++)values[i]=va_arg(ap,int);shader=va_arg(ap,int);
      printf("stretch|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d\n",op,values[0],values[1],values[2],values[3],values[4],values[5],values[6],values[7],shader);break;
    }
    case UI_CM_LERPTAG: {
      void *tag=va_arg(ap,void *);int model=va_arg(ap,int);int first=va_arg(ap,int);int last=va_arg(ap,int);int frac=va_arg(ap,int);const char *name=va_arg(ap,const char *);
      printf("tag|%d|%d|%d|%d|%d|%d|%d\n",op,tag==&pointer_a,model,first,last,frac,name==text_a);break;
    }
    case UI_LAN_ADDSERVER: {
      int source=va_arg(ap,int);const char *name=va_arg(ap,const char *);const char *address=va_arg(ap,const char *);
      printf("lan|%d|%d|%d|%d\n",op,source,name==text_a,address==(const char *)&pointer_a);break;
    }
    case UI_PC_READ_TOKEN: {
      int handle=va_arg(ap,int);void *token=va_arg(ap,void *);
      printf("parser|%d|%d|%d\n",op,handle,token==&pointer_a);break;
    }
    case UI_CIN_PLAYCINEMATIC: {
      const char *name=va_arg(ap,const char *);int x=va_arg(ap,int);int y=va_arg(ap,int);int w=va_arg(ap,int);int h=va_arg(ap,int);int bits=va_arg(ap,int);
      printf("cin|%d|%d|%d|%d|%d|%d|%d\n",op,name==text_a,x,y,w,h,bits);break;
    }
    case UI_VERIFY_CDKEY: {
      const char *key=va_arg(ap,const char *);const char *sum=va_arg(ap,const char *);
      printf("cd|%d|%d|%d\n",op,key==text_a,sum==(const char *)&pointer_a);break;
    }
  }
  va_end(ap);
  if(op==UI_CVAR_VARIABLEVALUE)return 0x3fc00000;
  return 700+op;
}

int main(void) {
  static const int opcodes[] = {
    UI_ERROR,UI_PRINT,UI_MILLISECONDS,UI_CVAR_SET,UI_CVAR_VARIABLEVALUE,UI_CVAR_VARIABLESTRINGBUFFER,UI_CVAR_SETVALUE,UI_CVAR_RESET,UI_CVAR_CREATE,UI_CVAR_INFOSTRINGBUFFER,
    UI_ARGC,UI_ARGV,UI_CMD_EXECUTETEXT,UI_FS_FOPENFILE,UI_FS_READ,UI_FS_WRITE,UI_FS_FCLOSEFILE,UI_FS_GETFILELIST,UI_R_REGISTERMODEL,UI_R_REGISTERSKIN,UI_R_REGISTERSHADERNOMIP,
    UI_R_CLEARSCENE,UI_R_ADDREFENTITYTOSCENE,UI_R_ADDPOLYTOSCENE,UI_R_ADDLIGHTTOSCENE,UI_R_RENDERSCENE,UI_R_SETCOLOR,UI_R_DRAWSTRETCHPIC,UI_UPDATESCREEN,UI_CM_LERPTAG,
    UI_S_REGISTERSOUND,UI_S_STARTLOCALSOUND,UI_KEY_KEYNUMTOSTRINGBUF,UI_KEY_GETBINDINGBUF,UI_KEY_SETBINDING,UI_KEY_ISDOWN,UI_KEY_GETOVERSTRIKEMODE,UI_KEY_SETOVERSTRIKEMODE,
    UI_KEY_CLEARSTATES,UI_KEY_GETCATCHER,UI_KEY_SETCATCHER,UI_GETCLIPBOARDDATA,UI_GETGLCONFIG,UI_GETCLIENTSTATE,UI_GETCONFIGSTRING,UI_LAN_GETPINGQUEUECOUNT,UI_LAN_CLEARPING,
    UI_LAN_GETPING,UI_LAN_GETPINGINFO,UI_CVAR_REGISTER,UI_CVAR_UPDATE,UI_MEMORY_REMAINING,UI_GET_CDKEY,UI_SET_CDKEY,UI_R_REGISTERFONT,UI_R_MODELBOUNDS,UI_PC_ADD_GLOBAL_DEFINE,
    UI_PC_LOAD_SOURCE,UI_PC_FREE_SOURCE,UI_PC_READ_TOKEN,UI_PC_SOURCE_FILE_AND_LINE,UI_S_STOPBACKGROUNDTRACK,UI_S_STARTBACKGROUNDTRACK,UI_REAL_TIME,UI_LAN_GETSERVERCOUNT,
    UI_LAN_GETSERVERADDRESSSTRING,UI_LAN_GETSERVERINFO,UI_LAN_MARKSERVERVISIBLE,UI_LAN_UPDATEVISIBLEPINGS,UI_LAN_RESETPINGS,UI_LAN_LOADCACHEDSERVERS,UI_LAN_SAVECACHEDSERVERS,
    UI_LAN_ADDSERVER,UI_LAN_REMOVESERVER,UI_CIN_PLAYCINEMATIC,UI_CIN_STOPCINEMATIC,UI_CIN_RUNCINEMATIC,UI_CIN_DRAWCINEMATIC,UI_CIN_SETEXTENTS,UI_R_REMAP_SHADER,
    UI_VERIFY_CDKEY,UI_LAN_SERVERSTATUS,UI_LAN_GETSERVERPING,UI_LAN_SERVERISVISIBLE,UI_LAN_COMPARESERVERS,UI_FS_SEEK,UI_SET_PBCLSTATUS
  };
  unsigned i;
  dllEntry(capture);
  printf("opcodes");for(i=0;i<sizeof(opcodes)/sizeof(opcodes[0]);i++)printf("|%d",opcodes[i]);printf("\n");
  printf("float|%d|%d|%d\n",PASSFLOAT(1.5f),PASSFLOAT(-2.25f),PASSFLOAT(0.0f));
  trap_Cvar_SetValue(text_a,-2.25f);
  printf("floatret|%d\n",PASSFLOAT(trap_Cvar_VariableValue(text_a)));
  printf("openret|%d\n",trap_FS_FOpenFile(text_a,(fileHandle_t *)&pointer_a,FS_APPEND));
  trap_R_AddLightToScene((float *)&pointer_a,100.5f,1.0f,0.5f,0.25f);
  trap_R_DrawStretchPic(1.0f,-2.0f,3.5f,4.0f,0.0f,0.25f,0.75f,1.0f,77);
  printf("tagret|%d\n",trap_CM_LerpTag((orientation_t *)&pointer_a,9,10,11,0.375f,text_a));
  printf("lanret|%d\n",trap_LAN_AddServer(2,text_a,(const char *)&pointer_a));
  printf("pcret|%d\n",trap_PC_ReadToken(41,(pc_token_t *)&pointer_a));
  printf("cinret|%d\n",trap_CIN_PlayCinematic(text_a,1,2,3,4,5));
  printf("cdret|%d\n",trap_VerifyCDKey(text_a,(const char *)&pointer_a));
  (void)pointer_b;
  return 0;
}
