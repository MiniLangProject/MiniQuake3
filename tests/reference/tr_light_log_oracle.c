#include <stdarg.h>
#include <stdio.h>
typedef float vec3_t[3];
typedef struct { int renderfx; } refEntity_t;
typedef struct { refEntity_t e; vec3_t ambientLight; vec3_t directedLight; } trRefEntity_t;
typedef struct { void (*Printf)(int,const char *,...); } refimport_t;
#define RF_FIRST_PERSON 4
#define PRINT_ALL 0
static char record[128];
static void print_record(int level,const char *format,...){(void)level;va_list args;va_start(args,format);vsnprintf(record,sizeof(record),format,args);va_end(args);}
static refimport_t ri={print_record};
#include "tr_light_log_under_test.inc"
static void run(int flags,float ax,float ay,float az,float dx,float dy,float dz){trRefEntity_t value={0};record[0]=0;value.e.renderfx=flags;value.ambientLight[0]=ax;value.ambientLight[1]=ay;value.ambientLight[2]=az;value.directedLight[0]=dx;value.directedLight[1]=dy;value.directedLight[2]=dz;LogLight(&value);for(int i=0;record[i];i++)if(record[i]=='\n')record[i]=0;puts(record[0]?record:"-");}
int main(void){run(0,1,2,3,4,5,6);run(4,9,10,99,4,5,88);run(4,9,8,99,7,6,77);run(4,1.9f,1.1f,1.2f,2.9f,2.1f,2.2f);return 0;}
