/* SPDX-License-Identifier: GPL-2.0-or-later
 * The original game-facing engine registry. CM retains its separate legacy
 * host registry; only filesystem/console helpers never used here are inert.
 */
#undef Cvar_Get
#include "../../Quake-III-Arena-original-source/code/qcommon/cvar.c"
char *CopyString(const char *text){return _strdup(text);}
char *Cmd_Args(void){return "";}
char *Cmd_ArgsFrom(int index){(void)index;return "";}
void Cmd_AddCommand(const char *name,xcommand_t function){(void)name;(void)function;}
int Com_Filter(char *filter,char *name,int sensitive){(void)filter;(void)name;(void)sensitive;fprintf(stderr,"unexpected registry listing");exit(74);return 0;}
void QDECL FS_Printf(fileHandle_t handle,const char *format,...){(void)handle;(void)format;fprintf(stderr,"unexpected registry file serialization");exit(74);}
