#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include "q_shared.h"
#include "g_public.h"

static void dump(const char *tag,const void *value,size_t size) {
  const unsigned char *p=(const unsigned char *)value;size_t i;
  printf("%s|",tag);for(i=0;i<size;i++)printf("%02x",p[i]);putchar('\n');
}

int main(void) {
  trace_t tr;usercmd_t cmd;
  printf("ops|%d|%d|%d|%d|%d|%d|%d\n",G_TRACE,G_POINT_CONTENTS,G_ENTITIES_IN_BOX,
    G_ENTITY_CONTACT,G_GET_USERCMD,G_TRACECAPSULE,G_ENTITY_CONTACTCAPSULE);
  printf("trace-layout|%u|%u|%u|%u|%u|%u|%u|%u|%u|%u|%u\n",(unsigned)sizeof(trace_t),
    (unsigned)offsetof(trace_t,allsolid),(unsigned)offsetof(trace_t,startsolid),
    (unsigned)offsetof(trace_t,fraction),(unsigned)offsetof(trace_t,endpos),
    (unsigned)offsetof(trace_t,plane),(unsigned)offsetof(trace_t,plane.dist),
    (unsigned)offsetof(trace_t,plane.type),(unsigned)offsetof(trace_t,surfaceFlags),
    (unsigned)offsetof(trace_t,contents),(unsigned)offsetof(trace_t,entityNum));
  printf("usercmd-layout|%u|%u|%u|%u|%u|%u|%u|%u|%u\n",(unsigned)sizeof(usercmd_t),
    (unsigned)offsetof(usercmd_t,serverTime),(unsigned)offsetof(usercmd_t,angles),
    (unsigned)offsetof(usercmd_t,buttons),(unsigned)offsetof(usercmd_t,weapon),
    (unsigned)offsetof(usercmd_t,forwardmove),(unsigned)offsetof(usercmd_t,rightmove),
    (unsigned)offsetof(usercmd_t,upmove),(unsigned)sizeof(cmd.angles));
  memset(&tr,0,sizeof(tr));tr.allsolid=qtrue;tr.startsolid=qfalse;tr.fraction=.375f;
  tr.endpos[0]=-1.25f;tr.endpos[1]=2.5f;tr.endpos[2]=300.0f;
  tr.plane.normal[0]=1.0f;tr.plane.normal[1]=-.5f;tr.plane.normal[2]=.25f;tr.plane.dist=64.5f;
  tr.plane.type=2;tr.plane.signbits=5;tr.surfaceFlags=0x12345678;tr.contents=(int)0x89abcdefu;tr.entityNum=1022;
  dump("trace",&tr,sizeof(tr));
  memset(&cmd,0,sizeof(cmd));cmd.serverTime=0x10203040;cmd.angles[0]=-1;cmd.angles[1]=32768;
  cmd.angles[2]=65535;cmd.buttons=0x76543210;cmd.weapon=255;cmd.forwardmove=-128;cmd.rightmove=127;cmd.upmove=-1;
  dump("usercmd",&cmd,sizeof(cmd));
  return 0;
}
