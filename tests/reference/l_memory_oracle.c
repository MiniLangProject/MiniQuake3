#include <assert.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MEM_ID 0x12345678l
#define HUNK_ID 0x87654321l
#define PRT_FATAL 1
#define PRT_MESSAGE 2
#define Com_Memset memset
typedef struct memoryblock_s { unsigned long id; void *ptr; int size; struct memoryblock_s *prev,*next; } memoryblock_t;
static int allocatedmemory,totalmemorysize,numblocks;static memoryblock_t *memory;
static void *hostGet(int size){return malloc((size_t)size);}static void *hostHunk(int size){return malloc((size_t)size);}static void hostFree(void *p){free(p);}static int hostAvailable(void){return 123456;}
static void hostPrint(int level,const char *fmt,...){(void)level;(void)fmt;}static void Log_Write(const char *fmt,...){(void)fmt;}
static struct {void *(*GetMemory)(int);void *(*HunkAlloc)(int);void (*FreeMemory)(void*);int (*AvailableMemory)(void);void (*Print)(int,const char*,...);} botimport={hostGet,hostHunk,hostFree,hostAvailable,hostPrint};
#include "l_memory_under_test.inc"
int main(void){void *a=GetMemory(10);printf("heap|%d|%d|%d|%d\n",MemoryByteSize(a),allocatedmemory,totalmemorysize,numblocks);void *b=GetClearedHunkMemory(5);unsigned char *bytes=b;printf("hunk|%d|%d|%d|%d|%d\n",MemoryByteSize(b),allocatedmemory,totalmemorysize,numblocks,bytes[0]);printf("available|%d\n",AvailableMemory());FreeMemory(a);printf("freeheap|%d|%d|%d\n",allocatedmemory,totalmemorysize,numblocks);FreeMemory(b);printf("freehunk|%d|%d|%d\n",allocatedmemory,totalmemorysize,numblocks);void *c=GetMemory(3);(void)c;DumpMemory();printf("dump|%d|%d|%d\n",allocatedmemory,totalmemorysize,numblocks);return 0;}
