/* Host for unchanged R_GetCommandBuffer, RE_SetColor and RE_StretchPic. */
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>

#define MAX_RENDER_COMMANDS 0x40000
#define ERR_FATAL 0
typedef int qhandle_t;
typedef struct shader_s { int handle; } shader_t;
typedef enum { RC_END_OF_LIST,RC_SET_COLOR,RC_STRETCH_PIC,RC_DRAW_SURFS,RC_DRAW_BUFFER,RC_SWAP_BUFFERS,RC_SCREENSHOT } renderCommand_t;
typedef struct { unsigned char cmds[MAX_RENDER_COMMANDS];int used; } renderCommandList_t;
typedef struct { renderCommandList_t commands; } backEndData_t;
typedef struct { int commandId;float color[4]; } setColorCommand_t;
typedef struct { int commandId;shader_t *shader;float x,y,w,h,s1,t1,s2,t2; } stretchPicCommand_t;
static backEndData_t storage,*backEndData[2]={&storage,&storage};
static struct { int smpFrame;int registered; } tr={0,1};
static shader_t shaders[256];
static shader_t *R_GetShaderByHandle(qhandle_t handle) { shaders[handle].handle=handle+100;return &shaders[handle]; }
static void hostError(int level,const char *format,...) { (void)level;(void)format;exit(76); }
static struct { void (*Error)(int,const char *,...); } ri={hostError};

#include "renderer_command_under_test.inc"

static void command(const char *name,int offset) {
  int id=*(int *)(storage.commands.cmds+offset);
  if(id==RC_SET_COLOR) {
    setColorCommand_t *cmd=(setColorCommand_t *)(storage.commands.cmds+offset);
    printf("%s|%d|%d|[%d, %d, %d, %d]|void\n",name,storage.commands.used,id,(int)(cmd->color[0]*1000),(int)(cmd->color[1]*1000),(int)(cmd->color[2]*1000),(int)(cmd->color[3]*1000));
  } else {
    stretchPicCommand_t *cmd=(stretchPicCommand_t *)(storage.commands.cmds+offset);
    printf("%s|%d|%d|[%d, %d, %d, %d, %d, %d, %d, %d]|%d\n",name,storage.commands.used,id,(int)(cmd->x*1000),(int)(cmd->y*1000),(int)(cmd->w*1000),(int)(cmd->h*1000),(int)(cmd->s1*1000),(int)(cmd->t1*1000),(int)(cmd->s2*1000),(int)(cmd->t2*1000),cmd->shader->handle);
  }
}
int main(void) {
  int offset=0;float rgba[4]={0.5f,0.25f,0.75f,1.0f};
  RE_SetColor(NULL);command("white",offset);offset=storage.commands.used;
  RE_SetColor(rgba);command("color",offset);offset=storage.commands.used;
  RE_StretchPic(1,2,3,4,0,0.1f,0.9f,1,7);command("pic",offset);
  /* Remaining records exercise unchanged R_GetCommandBuffer directly. */
  if(R_GetCommandBuffer(8)) { int *p=(int *)(storage.commands.cmds+storage.commands.used-8);p[0]=RC_DRAW_BUFFER;p[1]=1029;printf("buffer|%d|%d|[%d]|void\n",storage.commands.used,p[0],p[1]); }
  if(R_GetCommandBuffer(4)) { int *p=(int *)(storage.commands.cmds+storage.commands.used-4);p[0]=RC_SWAP_BUFFERS;printf("swap|%d|%d|[]|void\n",storage.commands.used,p[0]); }
  storage.commands.used=MAX_RENDER_COMMANDS-4;printf("drop|%s|%d|5\n",R_GetCommandBuffer(4)?"true":"false",storage.commands.used);
  storage.commands.used=MAX_RENDER_COMMANDS-8;printf("edge|%s|%d|1\n",R_GetCommandBuffer(4)?"true":"false",storage.commands.used);
  return 0;
}
