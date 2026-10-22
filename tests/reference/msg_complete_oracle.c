/* Unchanged MSG_ReportChangeVectors_f from qcommon/msg.c. */
#include <stdarg.h>
#include <stdio.h>
static int pcount[256];
static void Com_Printf(const char *format,...){va_list args;va_start(args,format);vprintf(format,args);va_end(args);}
#include "msg_complete_under_test.inc"
int main(void){pcount[0]=3;pcount[7]=1;pcount[255]=42;MSG_ReportChangeVectors_f();return 0;}
