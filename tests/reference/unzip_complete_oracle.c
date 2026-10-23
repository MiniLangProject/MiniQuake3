#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef unsigned char Byte;
typedef unsigned int uInt;
typedef unsigned long uLong;
typedef struct { unsigned int tm_sec,tm_min,tm_hour,tm_mday,tm_mon,tm_year; } tm_unz;
#define UNZ_OK 0
#define UNZ_EOF 0
#define CASESENSITIVITYDEFAULTVALUE 1
#define STRCMPCASENOSENTIVEFUNCTION strcmpcasenosensitive_internal
#define Z_NULL NULL
#define LittleShort(x) (x)
#define LittleLong(x) (x)
#define BASE 65521L
#define NMAX 5552
#define DO1(buf,i)  {s1 += buf[i]; s2 += s1;}
#define DO2(buf,i)  DO1(buf,i); DO1(buf,i+1);
#define DO4(buf,i)  DO2(buf,i); DO2(buf,i+2);
#define DO8(buf,i)  DO4(buf,i); DO4(buf,i+4);
#define DO16(buf)   DO8(buf,0); DO8(buf,8);
#include "unzip_complete_under_test.inc"
int main(void) {
  tm_unz d; unsigned char raw[]={0x34,0x12,0x78,0x56,0x34,0x12}; uLong s=0,l=0;
  unsigned long dos=(44ul<<25)|(7ul<<21)|(9ul<<16)|(13ul<<11)|(27ul<<5)|15ul;
  printf("cmp %d %d %d\n",strcmpcasenosensitive_internal("maps/Q3DM1.BSP","MAPS/q3dm1.bsp"),unzStringFileNameCompare("A","a",1),unzStringFileNameCompare("A","a",2));
  unzlocal_DosDateToTmuDate(dos,&d);printf("date %u %u %u %u %u %u\n",d.tm_year,d.tm_mon,d.tm_mday,d.tm_hour,d.tm_min,d.tm_sec);
  printf("adler %lu %lu\n",adler32(1,(const Byte*)"Wikipedia",9),adler32(1,(const Byte*)"Quake III Arena",15));
  { FILE *f=tmpfile(); fwrite(raw,1,sizeof(raw),f); rewind(f); unzlocal_getShort(f,&s); unzlocal_getLong(f,&l); fclose(f); }
  printf("little %lu %lu\n",s,l);
  return 0;
}
