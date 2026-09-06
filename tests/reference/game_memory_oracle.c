/* SPDX-License-Identifier: GPL-2.0-or-later
 * The unchanged g_mem.c arena, G_NewString and G_ParseField bodies.
 * All pool-byte reads/writes below are test stimuli or observations.
 */
#include "../../Quake-III-Arena-original-source/code/game/g_mem.c"
#include <setjmp.h>
static FILE *result;
static jmp_buf dropped;
vmCvar_t g_debugAlloc;
#include "game_memory_functions.inc"
static unsigned char *blocks[4096];
static int sizes[4096], numBlocks;
static gentity_t entity;
static void emit(int value){fwrite(&value,4,1,result);}
static void emitText(const char *text){int n=text?(int)strlen(text):-1;emit(n);if(n>0)fwrite(text,1,n,result);}
void QDECL G_Printf(const char *fmt,...){
    char text[4096];va_list args;va_start(args,fmt);vsnprintf(text,sizeof(text),fmt,args);va_end(args);
    emit(310);emit(allocPoint);emitText(text);
}
void QDECL G_Error(const char *fmt,...){
    char text[4096];va_list args;va_start(args,fmt);vsnprintf(text,sizeof(text),fmt,args);va_end(args);
    fprintf(stderr,"%s",text);longjmp(dropped,1);
}
void QDECL Com_Printf(const char *fmt,...){fprintf(stderr,"Unexpected shared diagnostic: %s",fmt);exit(74);}
void QDECL Com_Error(int code,const char *fmt,...){fprintf(stderr,"Unexpected shared error: %s",fmt);exit(74);}
static int readInt(FILE *in){int value;if(fread(&value,4,1,in)!=1)exit(74);return value;}
static char *readText(FILE *in){int n=readInt(in);char *text;if(n<0||n>1048576)exit(74);text=calloc(n+1,1);if(fread(text,1,n,in)!=n)exit(74);return text;}
static void remember(unsigned char *block,int size){if(numBlocks==4096)exit(74);blocks[numBlocks]=block;sizes[numBlocks++]=size;emit(311);emit((int)(block-(unsigned char*)memoryPool));emit(size);}
static void snapshot(void){
    int i;emit(319);emit(allocPoint);emit(g_debugAlloc.integer);emit(numBlocks);
    for(i=0;i<numBlocks;i++){emit((int)(blocks[i]-(unsigned char*)memoryPool));emit(sizes[i]);}
    emitText(entity.classname);emitText(entity.message);emitText(entity.team);emitText(entity.target);emitText(entity.targetname);
    emitText(entity.model);emitText(entity.model2);emitText(entity.targetShaderName);emitText(entity.targetShaderNewName);
}
int main(int argc,char **argv){
    FILE *in;int count,step,kind,size,index,value,offset,i;char *text,*key;unsigned char *block;
    if(argc!=3 || !(in=fopen(argv[1],"rb")) || !(result=fopen(argv[2],"wb")))return 2;
    count=readInt(in);
    for(step=0;step<count;step++){
        kind=readInt(in);
        switch(kind){
        case 1:G_InitMemory();break;
        case 2:
            size=readInt(in);
            if(setjmp(dropped))emit(312);else remember(G_Alloc(size),size);
            break;
        case 3:g_debugAlloc.integer=readInt(in);break;
        case 4:Svcmd_GameMem_f();break;
        case 5:
            index=readInt(in);offset=readInt(in);value=readInt(in);
            if(index<0||index>=numBlocks||offset<0||offset>=sizes[index])return 74;
            blocks[index][offset]=(unsigned char)value;break;
        case 6:
            offset=readInt(in);size=readInt(in);if(offset<0||size<0||offset+size>POOLSIZE)return 74;
            emit(313);emit(offset);emit(size);for(i=0;i<size;i++)emit((unsigned char)memoryPool[offset+i]);break;
        case 7:
            text=readText(in);size=(int)strlen(text)+1;
            if(setjmp(dropped))emit(312);else {block=(unsigned char*)G_NewString(text);remember(block,size);emit(314);emitText((char*)block);}
            free(text);break;
        case 8:memset(&entity,0,sizeof(entity));break;
        case 9:
            key=readText(in);text=readText(in);
            if(setjmp(dropped))emit(312);else G_ParseField(key,text,&entity);
            free(key);free(text);break;
        case 10:
            index=readInt(in);value=readInt(in);if(index<0||index>=numBlocks)return 74;
            for(i=0;i<sizes[index];i++)blocks[index][i]=(unsigned char)(value+i);break;
        default:return 74;
        }
        snapshot();
    }
    if(fgetc(in)!=EOF)return 74;fclose(in);fclose(result);return 0;
}
