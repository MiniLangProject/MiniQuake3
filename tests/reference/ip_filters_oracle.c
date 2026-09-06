/* Copyright (C) 1999-2005 Id Software, Inc.
 * SPDX-License-Identifier: GPL-2.0-or-later
 * Unchanged Baseq3 IP functions and actual original engine Cvar storage.
 * Direct state writes below are input fixtures, not replacements for gameplay.
 */
#define main unused_ip_core_main
#define Com_Printf unused_ip_core_print
#include "core_oracle.c"
#undef Com_Printf
#undef main
#include "g_local.h"
extern cvar_t cvar_indexes[];
extern int cvar_numIndexes;
vmCvar_t g_banIPs, g_filterBan;
static FILE *ip_output;
static int ip_argc;
static char *ip_argument;
static void ip_snapshot(void);
static void ip_word(int value) { word(ip_output,value); }
static void ip_text(const char *value) { string(ip_output,value); }
static void ip_print(const char *fmt,va_list args) {
    char text[4096];int count=vsnprintf(text,sizeof(text),fmt,args);
    /* The original G_Printf has msg[1024] and unbounded vsprintf. Larger
       diagnostics are an invalid oracle fixture, never native parity. */
    if(count<0 || count>=1024){fprintf(stderr,"IP fixture exceeds original G_Printf storage\n");exit(74);}
    ip_word(200);ip_word(1);ip_text("");ip_text(text);ip_snapshot();
}
void QDECL Com_Printf(const char *fmt,...) { va_list args;va_start(args,fmt);ip_print(fmt,args);va_end(args); }
void QDECL G_Printf(const char *fmt,...) { va_list args;va_start(args,fmt);ip_print(fmt,args);va_end(args); }
void trap_Cvar_Set(const char *name,const char *value) {
    ip_word(200);ip_word(2);ip_text(name);ip_text(value);ip_snapshot();
    Cvar_Set2(name,value,qtrue);
}
int trap_Argc(void) { return ip_argc; }
void trap_Argv(int index,char *buffer,int capacity) {
    Q_strncpyz(buffer,index==1 && ip_argc>1?ip_argument:"",capacity);
}
#include "ip_filter_functions.inc"
static void ip_vm(vmCvar_t *vm) {
    ip_word(vm->handle);ip_word(vm->modificationCount);fwrite(&vm->value,4,1,ip_output);
    ip_word(vm->integer);ip_text(vm->string);
}
static cvar_t *ip_lookup(const char *name) {
    cvar_t *var;for(var=cvar_vars;var;var=var->next)if(!Q_stricmp(name,var->name))return var;
    exit(74);return NULL;
}
static void ip_engine(const char *name) {
    cvar_t *var=ip_lookup(name);
    ip_word((int)(var-cvar_indexes));ip_word(var->flags);ip_word(var->modified);ip_word(var->modificationCount);
    fwrite(&var->value,4,1,ip_output);ip_word(var->integer);
    ip_text(var->string);ip_text(var->resetString);ip_text(var->latchedString);
}
static void ip_snapshot(void) {
    int index;ip_word(201);ip_word(numIPFilters);
    for(index=0;index<MAX_IPFILTERS;index++){ip_word(ipFilters[index].mask);ip_word(ipFilters[index].compare);}
    fwrite(g_banIPs.string,MAX_CVAR_VALUE_STRING,1,ip_output);
    ip_vm(&g_banIPs);ip_vm(&g_filterBan);ip_word(cvar_numIndexes);ip_word(cvar_modifiedFlags);
    ip_engine("g_banIPs");ip_engine("g_filterBan");
}
static int ip_read_int(FILE *input) {
    int value;if(fread(&value,4,1,input)!=1)exit(74);return value;
}
static char *ip_read_text(FILE *input) {
    int size=ip_read_int(input);char *value;
    if(size<0 || size>65536)exit(74);value=calloc(1,size+1);
    if(fread(value,1,size,input)!=(size_t)size)exit(74);return value;
}
int main(int argc,char **argv) {
    FILE *input;int count,action,kind,result,index,maximum,which;unsigned mask,compare,step;
    char *text,*name;ipFilter_t parsed;
    if(argc!=3 || !(input=fopen(argv[1],"rb")) || !(ip_output=fopen(argv[2],"wb")))return 2;
    Cvar_Init();Cvar_Register(&g_banIPs,"g_banIPs","",CVAR_ARCHIVE);Cvar_Register(&g_filterBan,"g_filterBan","1",CVAR_ARCHIVE);
    count=ip_read_int(input);
    for(action=0;action<count;action++) {
        kind=ip_read_int(input);result=0;parsed.mask=parsed.compare=0;
        switch(kind) {
        case 1:text=ip_read_text(input);AddIP(text);free(text);break;
        case 2:case 3:
            ip_argc=ip_read_int(input);ip_argument=ip_read_text(input);
            if(kind==2)Svcmd_AddIP_f();else Svcmd_RemoveIP_f();free(ip_argument);ip_argument=NULL;break;
        case 4:text=ip_read_text(input);result=G_FilterPacket(text);free(text);break;
        case 5:G_ProcessIPBans();break;
        case 6:name=ip_read_text(input);text=ip_read_text(input);Cvar_Set2(name,text,qtrue);free(name);free(text);break;
        case 7:
            which=ip_read_int(input);if(which==0 || which==1)Cvar_Update(&g_banIPs);if(which==0 || which==2)Cvar_Update(&g_filterBan);break;
        case 8:
            maximum=ip_read_int(input);mask=ip_read_int(input);compare=ip_read_int(input);step=ip_read_int(input);
            if(maximum<0 || maximum>MAX_IPFILTERS)exit(74);memset(ipFilters,0,sizeof(ipFilters));numIPFilters=maximum;
            for(index=0;index<maximum;index++){ipFilters[index].mask=mask;ipFilters[index].compare=compare+index*step;}break;
        case 9:
            index=ip_read_int(input);mask=ip_read_int(input);compare=ip_read_int(input);
            if(index<0 || index>=MAX_IPFILTERS)exit(74);ipFilters[index].mask=mask;ipFilters[index].compare=compare;break;
        case 10:
            text=ip_read_text(input);parsed.mask=ip_read_int(input);parsed.compare=ip_read_int(input);
            result=StringToFilter(text,&parsed);free(text);break;
        case 11:UpdateIPBans();break;
        case 12:name=ip_read_text(input);ip_lookup(name)->modificationCount=ip_read_int(input);free(name);break;
        default:exit(74);
        }
        ip_word(202);ip_word(kind);ip_word(result);ip_word(parsed.mask);ip_word(parsed.compare);ip_snapshot();
    }
    if(fgetc(input)!=EOF)return 3;fclose(input);fclose(ip_output);return 0;
}
