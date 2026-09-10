/* Host for unchanged Baseq3 huffman.c and compressed msg.c bodies extracted at test time. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
typedef unsigned char byte; typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define HMAX 256
#define NYT HMAX
#define INTERNAL_NODE (HMAX+1)
#define ERR_DROP 1
typedef struct nodetype { struct nodetype *left,*right,*parent,*next,*prev,**head; int weight,symbol; } node_t;
typedef struct { int blocNode,blocPtrs; node_t *tree,*lhead,*ltail,*loc[HMAX+1],**freelist,nodeList[768],*nodePtrs[768]; } huff_t;
typedef struct { huff_t compressor,decompressor; } huffman_t;
typedef struct { qboolean allowoverflow,overflowed,oob; byte *data; int maxsize,cursize,readcount,bit; } msg_t;
static huffman_t msgHuff; static qboolean msgInit=qfalse; int oldsize=0,overflows=0;
static int bloc=0;
void MSG_initHuffman(void);
#define LittleShort(x) (x)
#define LittleLong(x) (x)
static void Com_Memset(void *p,int v,size_t n){memset(p,v,n);}
static void Com_Memcpy(void *d,const void *s,size_t n){memcpy(d,s,n);}
static void Com_Error(int code,const char *fmt,...){(void)code;(void)fmt;abort();}
#include "huffman_under_test.inc"
#include "message_huffman_under_test.inc"

static void hx(const byte *p,int n){int i;for(i=0;i<n;i++)printf("%02x",p[i]);}
static void adaptive(void){
  static const byte input[]={65,66,65,65,67,0,255,66,67,67,67};
  byte data[128]={0}; huffman_t enc,dec; int bit=0,inbit=0,i,ch=0;
  Huff_Init(&enc); Huff_Init(&dec);
  for(i=0;i<(int)sizeof(input);i++){Huff_transmit(&enc.compressor,input[i],data);Huff_addRef(&enc.compressor,input[i]);}
  /* Huff_transmit uses the file-static bloc; expose the exact stream through offset APIs below. */
  memset(data,0,sizeof(data)); bit=0;
  for(i=0;i<(int)sizeof(input);i++){
    if(enc.decompressor.loc[input[i]]){} /* keep both initialized trees live */
  }
  Huff_Init(&enc); Huff_Init(&dec);
  for(i=0;i<(int)sizeof(input);i++){
    if(!enc.compressor.loc[input[i]]){Huff_offsetTransmit(&enc.compressor,NYT,data,&bit);for(int s=7;s>=0;s--)Huff_putBit((input[i]>>s)&1,data,&bit);}
    else Huff_offsetTransmit(&enc.compressor,input[i],data,&bit);
    Huff_addRef(&enc.compressor,input[i]);
  }
  printf("A|%d|",bit);hx(data,(bit+7)/8);printf("|");
  for(i=0;i<(int)sizeof(input);i++){
    Huff_offsetReceive(dec.decompressor.tree,&ch,data,&inbit);
    if(ch==NYT){ch=0;for(int s=0;s<8;s++)ch=(ch<<1)+Huff_getBit(data,&inbit);}
    Huff_addRef(&dec.decompressor,(byte)ch);printf("%s%d",i?",":"",ch);
  }
  printf("|%d\n",inbit);
}
static void packet_codec(void){
  static const byte payload[]={0,1,2,3,65,65,65,32,255,128,0,90,17,34,51,68,85,102,119,136,153};
  byte data[512]={0}; msg_t m; int prefix=12,raw=(int)sizeof(payload),compressed;
  for(int i=0;i<prefix;i++)data[i]=(byte)(0xa0+i);
  memcpy(data+prefix,payload,sizeof(payload));memset(&m,0,sizeof(m));m.data=data;m.maxsize=sizeof(data);m.cursize=prefix+raw;
  Huff_Compress(&m,prefix);compressed=m.cursize;
  printf("C|%d|",compressed);hx(data,compressed);printf("\n");
  Huff_Decompress(&m,prefix);
  printf("D|%d|",m.cursize);hx(data,m.cursize);printf("\n");
}
int main(void){
  byte data[512]={0}; msg_t m; int a,b,c,d,e,f,g,h,i,w; unsigned values[32],v;
  adaptive();packet_codec();
  MSG_Init(&m,data,sizeof(data));
  MSG_WriteBits(&m,1,1); MSG_WriteBits(&m,5,3); MSG_WriteBits(&m,0xa7,8);
  MSG_WriteBits(&m,0xabc,12); MSG_WriteBits(&m,0x1234,16); MSG_WriteBits(&m,0x654321,24);
  MSG_WriteBits(&m,0x89abcdef,32); MSG_WriteBits(&m,-5,-8); MSG_WriteBits(&m,-1234,-16);
  printf("M|%d|%d|%d|",m.cursize,m.bit,m.overflowed);hx(data,m.cursize);printf("\n");
  MSG_BeginReading(&m);
  a=MSG_ReadBits(&m,1);b=MSG_ReadBits(&m,3);c=MSG_ReadBits(&m,8);d=MSG_ReadBits(&m,12);
  e=MSG_ReadBits(&m,16);f=MSG_ReadBits(&m,24);g=MSG_ReadBits(&m,32);h=MSG_ReadBits(&m,-8);i=MSG_ReadBits(&m,-16);
  printf("R|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d\n",a,b,c,d,e,f,g,h,i,m.readcount,m.bit);
  memset(data,0,sizeof(data));MSG_Init(&m,data,sizeof(data));
  for(w=1;w<=32;w++){v=((unsigned)w*1234567u)^0x35aa55aau;if(w<32)v&=(1u<<w)-1u;values[w-1]=v;MSG_WriteBits(&m,(int)v,w);}
  printf("V|%d|%d|",m.cursize,m.bit);MSG_BeginReading(&m);for(w=1;w<=32;w++)printf("%s%d",w==1?"":",",MSG_ReadBits(&m,w));printf("|%d|%d\n",m.readcount,m.bit);
  memset(data,0,sizeof(data));MSG_Init(&m,data,sizeof(data));for(w=0;w<256;w++)MSG_WriteBits(&m,w,8);
  printf("S|%d|%d|",m.cursize,m.bit);hx(data,m.cursize);MSG_BeginReading(&m);a=0;for(w=0;w<256;w++)if(MSG_ReadBits(&m,8)!=w)a++;printf("|%d|%d|%d\n",a,m.readcount,m.bit);
  printf("N|");for(w=1;w<=31;w++){memset(data,0,sizeof(data));MSG_Init(&m,data,sizeof(data));MSG_WriteBits(&m,-1,-w);MSG_BeginReading(&m);printf("%s%d",w==1?"":",",MSG_ReadBits(&m,-w));}printf("\n");
  memset(data,0,sizeof(data));MSG_Init(&m,data,8);MSG_WriteBits(&m,7,3);MSG_WriteBits(&m,255,8);MSG_WriteBits(&m,3,2);
  printf("K|%d|%d|",m.cursize,m.bit);hx(data,m.cursize);printf("\n");
  memset(data,0,sizeof(data));MSG_Init(&m,data,4);MSG_WriteBits(&m,1,1);printf("O|%d|%d|%d\n",m.cursize,m.bit,m.overflowed);
  return 0;
}
