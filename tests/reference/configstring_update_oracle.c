/* SPDX-License-Identifier: GPL-2.0-or-later
 * Host for the unchanged CL_ConfigstringModified function. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include "q_shared.h"
#define ERR_DROP 1
#define CS_SYSTEMINFO 1
static struct { gameState_t gameState; } cl;
static char indexText[32];
static const char *replacement;
static const char *Cmd_Argv(int index) { return index==1 ? indexText : ""; }
static char *Cmd_ArgsFrom(int index) { (void)index; return (char *)replacement; }
void Com_Memset(void *d,int v,size_t n) { memset(d,v,n); }
void Com_Memcpy(void *d,const void *s,size_t n) { memcpy(d,s,n); }
void Com_Error(int code,const char *format,...) { (void)code;(void)format;abort(); }
static void CL_SystemInfoChanged(void) {}
#include "configstring_update_under_test.inc"
static void step(int index,const char *value) {
    int i;
    sprintf(indexText,"%d",index);replacement=value;CL_ConfigstringModified();
    printf("%d|",cl.gameState.dataCount);
    for(i=0;i<MAX_CONFIGSTRINGS;i++)printf("%d,",cl.gameState.stringOffsets[i]);
    putchar('|');
    for(i=0;i<cl.gameState.dataCount;i++)printf("%02x",(unsigned char)cl.gameState.stringData[i]);
    putchar('\n');
}
int main(void) {
    static char large[MAX_GAMESTATE_CHARS-1];
    cl.gameState.dataCount=1;
    step(5,"five");step(2,"two");step(2,"two");step(5,"");
    step(1,"\\sv_serverid\\123\\sv_pure\\0");step(12,"alpha beta gamma");
    memset(&cl,0,sizeof(cl));cl.gameState.dataCount=1;
    memset(large,'x',sizeof(large)-1);large[sizeof(large)-1]=0;
    step(0,large);step(0,"");return 0;
}
