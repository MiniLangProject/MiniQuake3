#include <stdarg.h>
#include <stdio.h>

typedef struct { int integer; } cvar_t;
typedef struct { int readcount; } msg_t;
static cvar_t shownet_store;
static cvar_t *cl_shownet=&shownet_store;
static void Com_Printf(const char *format,...) { va_list ap;va_start(ap,format);vprintf(format,ap);va_end(ap); }

#include "cl_parse_shownet_under_test.inc"

int main(void) {
  msg_t msg={7};
  shownet_store.integer=0;SHOWNET(&msg,"silent-zero");
  shownet_store.integer=1;SHOWNET(&msg,"silent-one");
  shownet_store.integer=2;SHOWNET(&msg,"alpha");
  msg.readcount=1;shownet_store.integer=3;SHOWNET(&msg,"beta");
  return 0;
}
