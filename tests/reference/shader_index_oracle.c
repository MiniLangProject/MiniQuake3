/* Host for unchanged generateHashValue and FindShaderInShaderText from tr_shader.c. */
#define _CRT_SECURE_NO_WARNINGS
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../../Quake-III-Arena-original-source/code/game/q_shared.h"
void QDECL Com_Error(int level,const char *fmt,...){(void)level;(void)fmt;exit(72);}
void QDECL Com_Printf(const char *fmt,...){(void)fmt;}
#define MAX_SHADERTEXT_HASH 2048
#define PATH_SEP '\\'
static char *s_shaderText;
static char **shaderTextHashTable[MAX_SHADERTEXT_HASH];
#include "shader_index_under_test.inc"

static char script[] =
 "// deterministic shader fixture\n"
 "textures/base/wall { { map textures/base/a.tga } }\n"
 "Textures\\Mixed\\Path.JPG { surfaceparm metalsteps { map $lightmap } }\n"
 "textures/duplicate { { map first } }\n"
 "textures/duplicate { { map second } }\n"
 "textures/deep { { { map nested } } deformVertexes wave 1 sin 0 1 0 1 }\n";

static void make_index(void) {
 static char *storage[4096]; int sizes[MAX_SHADERTEXT_HASH]={0}, fill[MAX_SHADERTEXT_HASH]={0};
 char *p=script,*oldp,*token; int hash,i,total=0;
 while (1) { oldp=p; token=COM_ParseExt(&p,qtrue); if (!token[0]) break;
   hash=(int)generateHashValue(token,MAX_SHADERTEXT_HASH); sizes[hash]++; total++; SkipBracedSection(&p); }
 total=0; for(i=0;i<MAX_SHADERTEXT_HASH;i++){shaderTextHashTable[i]=&storage[total];total+=sizes[i]+1;}
 memset(storage,0,sizeof(storage));p=script;
 while(1){oldp=p;token=COM_ParseExt(&p,qtrue);if(!token[0])break;hash=(int)generateHashValue(token,MAX_SHADERTEXT_HASH);
   shaderTextHashTable[hash][fill[hash]++]=oldp;SkipBracedSection(&p);}
 s_shaderText=script;
}
int main(void){const char *hashes[]={"textures/base/wall","Textures\\Mixed\\Path.JPG","A.B","a/b","a\\b"};
 const char *lookups[]={"TEXTURES/BASE/WALL","textures\\mixed\\path.jpg","textures/duplicate","textures/deep","missing"};
 int i;char *found;make_index();
 for(i=0;i<5;i++)printf("H|%s|%ld\n",hashes[i],generateHashValue(hashes[i],MAX_SHADERTEXT_HASH));
 for(i=0;i<5;i++){found=FindShaderInShaderText(lookups[i]);printf("F|%s|%ld\n",lookups[i],found?(long)(found-script):-1L);}
 return 0;}
