/* Copyright (C) 1999-2005 Id Software, Inc.
 * SPDX-License-Identifier: GPL-2.0-or-later
 * Unchanged G_LogPrintf/G_Printf with the original Com_sprintf implementation.
 * The x86 variadic call bridge renders every payload byte with %c so embedded
 * NUL and the complete formatted length are real native formatter behavior.
 */
#include "g_local.h"
level_locals_t level;
vmCvar_t g_dedicated;
static FILE *log_result;
static int log_flags, log_print_time, log_print_dedicated, log_print_handle;
static int log_write_time, log_write_dedicated, log_write_handle;
static char *log_nested;
static int log_nested_size;
static void log_call(char *payload,int size);
static void log_word(int value){fwrite(&value,4,1,log_result);}
static void log_bytes(const void *data,int size){log_word(size);if(size)fwrite(data,1,size,log_result);}
static void log_state(void){log_word(level.time);log_word(g_dedicated.integer);log_word(level.logFile);log_word(log_flags);}
void trap_Printf(const char *text){
    log_word(410);log_bytes(text,(int)strlen(text));log_state();
    if(log_flags&1){level.time=log_print_time;g_dedicated.integer=log_print_dedicated;level.logFile=log_print_handle;}
    if(log_flags&4){log_flags&=~4;log_call(log_nested,log_nested_size);}
}
void trap_FS_Write(const void *buffer,int length,fileHandle_t handle){
    log_word(411);log_word(handle);log_bytes(buffer,length);log_state();
    if(log_flags&2){level.time=log_write_time;g_dedicated.integer=log_write_dedicated;level.logFile=log_write_handle;}
}
void QDECL Com_Error(int code,const char *fmt,...){fprintf(stderr,"Unexpected logging shared error: %s",fmt);exit(74);}
void QDECL Com_Printf(const char *fmt,...){fprintf(stderr,"Unexpected logging shared diagnostic: %s",fmt);exit(74);}
#include "game_logging_functions.inc"
static void log_call(char *payload,int payloadSize){
    int i,stackBytes;int *arguments;char *format;
    if(payloadSize<0 || payloadSize>1016){fprintf(stderr,"Logging fixture exceeds original format storage\n");exit(74);}
    arguments=calloc(payloadSize+1,sizeof(int));format=calloc(payloadSize*2+1,1);
    for(i=0;i<payloadSize;i++){format[i*2]='%';format[i*2+1]='c';arguments[i+1]=(unsigned char)payload[i];}
    arguments[0]=(int)format;stackBytes=(payloadSize+1)*4;
    __asm {
        mov ecx,payloadSize
        mov esi,arguments
    log_push:
        push dword ptr [esi+ecx*4]
        dec ecx
        jns log_push
        call G_LogPrintf
        add esp,stackBytes
    }
    free(format);free(arguments);
}
static int log_read_int(FILE *input){int value;if(fread(&value,4,1,input)!=1)exit(74);return value;}
static char *log_read_bytes(FILE *input,int *size){
    char *data;*size=log_read_int(input);if(*size<0 || *size>65536)exit(74);
    data=calloc(*size+1,1);if(fread(data,1,*size,input)!=(size_t)*size)exit(74);return data;
}
int main(int argc,char **argv){
    FILE *input;int actions,index,size;char *payload;
    if(argc!=3 || !(input=fopen(argv[1],"rb")) || !(log_result=fopen(argv[2],"wb")))return 2;
    actions=log_read_int(input);
    for(index=0;index<actions;index++){
        level.time=log_read_int(input);g_dedicated.integer=log_read_int(input);level.logFile=log_read_int(input);log_flags=log_read_int(input);
        log_print_time=log_read_int(input);log_print_dedicated=log_read_int(input);log_print_handle=log_read_int(input);
        log_write_time=log_read_int(input);log_write_dedicated=log_read_int(input);log_write_handle=log_read_int(input);
        payload=log_read_bytes(input,&size);log_nested=log_read_bytes(input,&log_nested_size);
        log_call(payload,size);log_word(419);log_state();free(payload);free(log_nested);
    }
    if(fgetc(input)!=EOF)return 74;fclose(input);fclose(log_result);return 0;
}
