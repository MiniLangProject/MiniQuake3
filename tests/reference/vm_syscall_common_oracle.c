#include <stddef.h>
#include <stdio.h>
#include "q_shared.h"
#include "g_public.h"
#include "cg_public.h"
#include "ui_public.h"

int main(void) {
  printf("qagame|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d\n",
    G_PRINT,G_ERROR,G_MILLISECONDS,G_CVAR_REGISTER,G_CVAR_UPDATE,G_CVAR_SET,
    G_CVAR_VARIABLE_INTEGER_VALUE,G_CVAR_VARIABLE_STRING_BUFFER,G_ARGC,G_ARGV,
    G_FS_FOPEN_FILE,G_FS_READ,G_FS_WRITE,G_FS_FCLOSE_FILE,G_SEND_CONSOLE_COMMAND);
  printf("cgame|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d\n",
    CG_PRINT,CG_ERROR,CG_MILLISECONDS,CG_CVAR_REGISTER,CG_CVAR_UPDATE,CG_CVAR_SET,
    CG_CVAR_VARIABLESTRINGBUFFER,CG_ARGC,CG_ARGV,CG_ARGS,CG_FS_FOPENFILE,
    CG_FS_READ,CG_FS_WRITE,CG_FS_FCLOSEFILE,CG_SENDCONSOLECOMMAND);
  printf("ui|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d\n",
    UI_ERROR,UI_PRINT,UI_MILLISECONDS,UI_CVAR_SET,UI_CVAR_VARIABLEVALUE,
    UI_CVAR_VARIABLESTRINGBUFFER,UI_ARGC,UI_ARGV,UI_CMD_EXECUTETEXT,
    UI_FS_FOPENFILE,UI_FS_READ,UI_FS_WRITE,UI_FS_FCLOSEFILE,
    UI_FS_GETFILELIST,UI_CVAR_REGISTER,UI_CVAR_UPDATE,UI_FS_SEEK);
  printf("vmcvar|%u|%u|%u|%u|%u\n",(unsigned)sizeof(vmCvar_t),
    (unsigned)offsetof(vmCvar_t,handle),(unsigned)offsetof(vmCvar_t,modificationCount),
    (unsigned)offsetof(vmCvar_t,value),(unsigned)offsetof(vmCvar_t,string));
  return 0;
}
