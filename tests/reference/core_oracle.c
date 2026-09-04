/* SPDX-License-Identifier: GPL-2.0-or-later
 * Original registry/parser harness. Non-exercised console/file APIs are stubs.
 */
#include "q_shared.h"
#include "qcommon.h"
#include <stdint.h>
extern cvar_t *cvar_vars;
extern int cvar_modifiedFlags;
extern cvar_t *Cvar_Set2(const char *, const char *, qboolean);
void QDECL Com_Printf(const char *fmt, ...) { (void)fmt; }
void QDECL Com_DPrintf(const char *fmt, ...) { (void)fmt; }
void QDECL Com_Error(int code,const char *fmt,...) { va_list a; va_start(a,fmt); vfprintf(stderr,fmt,a); va_end(a); exit(20+code); }
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

static void word(FILE *out,int v) { fwrite(&v,4,1,out); }
static void string(FILE *out,const char *s) {
    int n=s?(int)strlen(s):-1; word(out,n); if(n>0) fwrite(s,n,1,out);
}
int main(int argc,char **argv) {
    FILE *in,*out;
    char line[2048];
    if(argc!=4 || !(in=fopen(argv[2],"rb")) || !(out=fopen(argv[3],"wb"))) return 2;
    if(!strcmp(argv[1],"parser")) {
        char *data,*p; int length,i;
        fseek(in,0,SEEK_END);length=ftell(in);rewind(in);
        data=(char*)calloc(1,length+16);fread(data,1,length,in);p=data;
        COM_BeginParseSession("test");
        for(i=0;i<64;i++) {
            char *token=COM_ParseExt(&p,(i%3)!=0);
            string(out,token);word(out,COM_GetCurrentParseLine());word(out,p?(int)(p-data):-1);
        }
        free(data);
    } else {
        Cvar_Init();
        while(fgets(line,sizeof(line),in)) {
            char *op,*name,*value,*flags; cvar_t *v;
            line[strcspn(line,"\r\n")]=0;
            op=strtok(line,"\t");name=strtok(NULL,"\t");value=strtok(NULL,"\t");flags=strtok(NULL,"\t");
            if(!op||!name||!value||!flags) return 3;
            if(!strcmp(value,"<empty>")) value="";
            if(!strcmp(op,"get")) Cvar_Get(name,value,atoi(flags));
            else if(!strcmp(op,"set")) Cvar_Set2(name,value,atoi(flags));
            else if(!strcmp(op,"reset")) Cvar_Set2(name,NULL,qfalse);
            else if(!strcmp(op,"cheats")) Cvar_SetCheatState();
            if(strpbrk(name,"\\\";")) name="BADNAME";
            for(v=cvar_vars;v;v=v->next) if(!Q_stricmp(v->name,name)) break;
            if(!v) return 4;
            string(out,v->name);string(out,v->string);string(out,v->resetString);string(out,v->latchedString);
            word(out,v->flags);word(out,v->modified);word(out,v->modificationCount);word(out,v->integer);
            fwrite(&v->value,4,1,out);word(out,cvar_modifiedFlags);
        }
    }
    fclose(in);fclose(out);return 0;
}
