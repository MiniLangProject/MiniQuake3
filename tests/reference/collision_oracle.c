/* SPDX-License-Identifier: GPL-2.0-or-later
 * Test host for the unmodified original collision subsystem. All map loading,
 * brush/patch generation, BSP traversal and tracing execute original C code.
 * Only allocation, file IO, diagnostics and a small Cvar registry are hosted.
 */
#include "cm_local.h"
#include <stdint.h>
static byte *arena;
static size_t used;
void *Hunk_Alloc(int size, ha_pref preference) {
    void *p; size_t aligned = ((size_t)size+31)&~(size_t)31;
    (void)preference;
    if(size<0 || used+aligned>128*1024*1024) exit(30);
    if(!arena) arena=calloc(1,128*1024*1024);
    if(!arena) exit(31);
    p=arena+used; used+=aligned; return p;
}
void *Z_Malloc(int size) { void *p=calloc(1,size); if(!p) exit(32); return p; }
void Z_Free(void *p) { free(p); }
void Com_Memset(void *p,int value,size_t size) { memset(p,value,size); }
void Com_Memcpy(void *p,const void *q,size_t size) { memcpy(p,q,size); }
void QDECL Com_Printf(const char *fmt,...) { (void)fmt; }
void QDECL Com_DPrintf(const char *fmt,...) { (void)fmt; }
void QDECL Com_Error(int code,const char *fmt,...) {
    va_list a; va_start(a,fmt);vfprintf(stderr,fmt,a);va_end(a);exit(40+code);
}
cvar_t *Cvar_Get(const char *name,const char *value,int flags) {
    static cvar_t vars[32];static int count;int i;
    for(i=0;i<count;i++) if(!strcmp(vars[i].name,name)) return &vars[i];
    if(count==32) exit(33);
    vars[count].name=_strdup(name);vars[count].string=_strdup(value);
    vars[count].integer=atoi(value);vars[count].value=(float)atof(value);
    vars[count].flags=flags;return &vars[count++];
}
int FS_ReadFile(const char *name,void **buffer) {
    FILE *f=fopen(name,"rb");long size;
    if(!f) { *buffer=NULL;return -1; }
    fseek(f,0,SEEK_END);size=ftell(f);rewind(f);*buffer=malloc(size+1);
    if(!*buffer || fread(*buffer,1,size,f)!=(size_t)size) exit(34);
    ((byte*)*buffer)[size]=0;fclose(f);return (int)size;
}
void FS_FreeFile(void *p) { free(p); }
void BotDrawDebugPolygons(void (*drawPoly)(int,int,float *),int value) { exit(36); }
static void word(FILE *out,int value) { if(fwrite(&value,4,1,out)!=1) exit(35); }
static void real(FILE *out,float value) { if(fwrite(&value,4,1,out)!=1) exit(35); }
#ifndef MQ3_ORACLE_LIBRARY
int main(int argc,char **argv) {
    FILE *input,*output;int checksum,i;trace_t tr;
    struct { vec3_t start,end,mins,maxs; int model,mask,capsule; } query;
    if(argc!=5) return 2;
    CM_LoadMap(argv[1],qfalse,&checksum);
    cm_noCurves->integer=atoi(argv[4]);
    input=fopen(argv[2],"rb");output=fopen(argv[3],"wb");
    if(!input || !output) return 3;
    while(fread(&query,sizeof(query),1,input)==1) {
        CM_BoxTrace(&tr,query.start,query.end,query.mins,query.maxs,query.model,query.mask,query.capsule);
        real(output,tr.fraction);for(i=0;i<3;i++) real(output,tr.plane.normal[i]);
        real(output,tr.plane.dist);word(output,tr.surfaceFlags);word(output,tr.contents);
        word(output,tr.startsolid);word(output,tr.allsolid);
        for(i=0;i<3;i++) real(output,tr.endpos[i]);
        word(output,CM_PointLeafnum(query.start));
        word(output,CM_PointContents(query.start,query.model));
        word(output,CM_PointContents(query.end,query.model));
        word(output,tr.plane.type | (tr.plane.signbits<<8));
    }
    fclose(input);fclose(output);return 0;
}
#endif
