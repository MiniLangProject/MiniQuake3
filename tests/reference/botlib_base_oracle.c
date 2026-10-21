/* Host for unchanged Baseq3 botlib/l_crc.c and l_libvar.c functions. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
typedef unsigned char byte;
typedef int qboolean;
#define qfalse 0
#define qtrue 1
typedef struct libvar_s { char *name; char *string; float value; qboolean modified; struct libvar_s *next; } libvar_t;
static libvar_t *libvarlist;
static unsigned short crctable[257];
#define CRC_INIT_VALUE 0xffff
#define CRC_XOR_VALUE 0x0000
static void *GetMemory(size_t size){ return calloc(1,size); }
static void FreeMemory(void *value){ free(value); }
#define Com_Memset memset
#define Q_stricmp _stricmp
#include "l_crc_under_test.inc"
#include "l_libvar_under_test.inc"

static unsigned bits(float value){ union { float f; unsigned u; } cast; cast.f=value; return cast.u; }
static void build_crc_table(void){ int i,b; for(i=0;i<256;i++){ unsigned v=(unsigned)i<<8; for(b=0;b<8;b++) v=(v&0x8000)?((v<<1)^0x1021):(v<<1); crctable[i]=(unsigned short)v; } }
static void crc_record(const char *name,const unsigned char *data,int length){
  unsigned short whole=CRC_ProcessString((unsigned char *)data,length), split; int pivot=length/2;
  CRC_Init(&split);CRC_ContinueProcessString(&split,(char *)data,pivot);CRC_ContinueProcessString(&split,(char *)data+pivot,length-pivot);
  printf("C|%s|%u|%u\n",name,(unsigned)whole,(unsigned)CRC_Value(split));
}
int main(void){
  static const unsigned char empty[]="", digits[]="123456789", quake[]="Quake III Arena", binary[]={0,1,2,3,63,64,126,127};
  const char *values[]={"","0","1","123","12.5","0.125",".5","1.2.3","-1","12x"}; int i; libvar_t *first,*same,*second;
  build_crc_table();crc_record("empty",empty,0);crc_record("digits",digits,9);crc_record("quake",quake,15);crc_record("binary",binary,8);
  { unsigned short crc;CRC_Init(&crc);CRC_ProcessByte(&crc,'A');CRC_ProcessByte(&crc,'B');printf("B|%u|%u\n",(unsigned)crc,(unsigned)CRC_Value(crc)); }
  for(i=0;i<10;i++)printf("V|%s|%u\n",values[i],bits(LibVarStringValue((char *)values[i])));
  first=LibVar("MaxClients","8");same=LibVar("maxclients","99");
  printf("L|first|%s|%s|%u|%d|%d\n",first->name,first->string,bits(first->value),first->modified,first==same);
  LibVarSetNotModified("MAXCLIENTS");printf("L|clean|%d\n",LibVarChanged("maxclients"));
  LibVarSet("maxclients","12.25");printf("L|set|%s|%u|%d\n",LibVarGetString("MAXCLIENTS"),bits(LibVarGetValue("MaxClients")),LibVarChanged("maxclients"));
  second=LibVar("developer","1");printf("L|order|%s|%s|%d\n",libvarlist->name,libvarlist->next->name,second==libvarlist);
  printf("L|missing|%s|%u|%d\n",LibVarGetString("missing"),bits(LibVarGetValue("missing")),LibVarChanged("missing"));
  LibVarDeAllocAll();printf("L|clear|%d\n",libvarlist==NULL);return 0;
}
