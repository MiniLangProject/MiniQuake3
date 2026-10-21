/* SPDX-License-Identifier: GPL-2.0-or-later */
#include "q_shared.h"
#include "qcommon.h"
#include <stdint.h>
extern cvar_t *cvar_vars;
extern int cvar_modifiedFlags;
extern cvar_t *Cvar_Set2(const char *, const char *, qboolean);
void QDECL Com_Printf(const char *fmt, ...) { (void)fmt; }
void QDECL Com_DPrintf(const char *fmt, ...) { (void)fmt; }
void QDECL Com_Error(int code,const char *fmt,...) { (void)fmt; exit(20+code); }
void Z_Free(void *p) { free(p); }
void Com_Memset(void *p,int c,size_t count) { memset(p,c,count); }
char *CopyString(const char *s) { return _strdup(s); }
int Cmd_Argc(void) { return 0; }
char *Cmd_Argv(int n) { (void)n; return ""; }
char *Cmd_Args(void) { return ""; }
char *Cmd_ArgsFrom(int n) { (void)n; return ""; }
void Cmd_AddCommand(const char *n,xcommand_t fn) { (void)n; (void)fn; }
int Com_Filter(char *f,char *n,int cs) { (void)f; (void)n; (void)cs; return 0; }
void QDECL FS_Printf(fileHandle_t f,const char *fmt,...) { (void)f; (void)fmt; }

static const char *nz(const char *s) { return s ? s : "<null>"; }
static void dump(const char *label,cvar_t *v) {
    uint32_t bits=0;if(v) memcpy(&bits,&v->value,4);
    printf("%s|%s|%s|%s|%s|%d|%d|%d|%d|%u\n",label,
      v?nz(v->name):"<missing>",v?nz(v->string):"<missing>",
      v?nz(v->resetString):"<missing>",v?nz(v->latchedString):"<missing>",
      v?v->flags:-1,v?v->modified:-1,v?v->modificationCount:-1,
      v?v->integer:-1,bits);
}
/* Cvar_Restart_f frees the four strings and then clears only sizeof(pointer)
 * bytes of the cvar_t.  Reading the three dangling string pointers makes this
 * differential depend on the CRT allocator.  The cleared name and untouched
 * scalar tail are the defined, shipped x86 behavior that the port preserves. */
static void dump_old_user(cvar_t *v) {
    printf("oldUser|%s|flags=%d|modified=%d|count=%d|integer=%d\n",
      v && !v->name ? "<cleared>" : "<not-cleared>",v?v->flags:-1,
      v?v->modified:-1,v?v->modificationCount:-1,v?v->integer:-1);
}
static void order(const char *label) {
    cvar_t *v;printf("%s|",label);
    for(v=cvar_vars;v;v=v->next) printf("%s,",nz(v->name));
    printf("|flags=%d\n",cvar_modifiedFlags);
}
int main(void) {
    cvar_t *normal,*unchanged,*pending,*changedLatch,*rom,*init,*keep,*user,*reborn;
    Cvar_Init();
    normal=Cvar_Get("normal","base",CVAR_ARCHIVE);Cvar_Set("normal","changed");
    unchanged=Cvar_Get("unchanged","base",0);
    pending=Cvar_Get("pending","base",CVAR_LATCH);Cvar_Set2("pending","next",qfalse);
    changedLatch=Cvar_Get("changedLatch","base",CVAR_LATCH);Cvar_Set("changedLatch","live");Cvar_Set2("changedLatch","next",qfalse);
    rom=Cvar_Get("rom","base",CVAR_ROM);Cvar_Set("rom","live");
    init=Cvar_Get("init","base",CVAR_INIT);Cvar_Set("init","live");
    keep=Cvar_Get("keep","base",CVAR_NORESTART);Cvar_Set("keep","live");
    user=Cvar_Set2("user","temp",qfalse);
    order("before");Cvar_Restart_f();order("after");
    dump("normal",normal);dump("unchanged",unchanged);dump("pending",pending);
    dump("changedLatch",changedLatch);dump("rom",rom);dump("init",init);dump("keep",keep);dump_old_user(user);
    reborn=Cvar_Get("user","reborn",0);dump("reborn",reborn);order("recreated");
    return 0;
}
