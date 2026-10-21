#include <stdio.h>
#include <string.h>
#include <ctype.h>

typedef struct { const char *order; int taskNum; } orderTask_t;
#define TEAMTASK_OFFENSE 1
#define TEAMTASK_DEFENSE 2
#define TEAMTASK_PATROL 3
#define TEAMTASK_FOLLOW 4
#define TEAMTASK_RETRIEVE 5
#define TEAMTASK_ESCORT 6
#define TEAMTASK_CAMP 7
static const orderTask_t validOrders[] = {
  {"getflag",TEAMTASK_OFFENSE},{"offense",TEAMTASK_OFFENSE},
  {"defend",TEAMTASK_DEFENSE},{"defendflag",TEAMTASK_DEFENSE},
  {"patrol",TEAMTASK_PATROL},{"camp",TEAMTASK_CAMP},
  {"followme",TEAMTASK_FOLLOW},{"returnflag",TEAMTASK_RETRIEVE},
  {"followflagcarrier",TEAMTASK_ESCORT}
};
static const int numValidOrders=(int)(sizeof(validOrders)/sizeof(validOrders[0]));
static int Q_stricmp(const char *a,const char *b){
  while(*a&&*b){int x=tolower((unsigned char)*a++),y=tolower((unsigned char)*b++);if(x!=y)return x-y;}
  return (unsigned char)*a-(unsigned char)*b;
}
#include "cgame_servercmds_under_test.inc"

int main(void){
  const char *orders[]={"getflag","OFFENSE","defend","DEFENDFLAG","patrol","camp","followme","returnflag","followflagcarrier","bogus"};
  size_t i;char clean[][16]={"plain","a\x19" "b","\x19\x19","x\x19y\x19z"};
  for(i=0;i<sizeof(orders)/sizeof(orders[0]);++i)printf("order|%s|%d\n",orders[i],CG_ValidOrder(orders[i]));
  for(i=0;i<sizeof(clean)/sizeof(clean[0]);++i){CG_RemoveChatEscapeChar(clean[i]);printf("clean|%u|",(unsigned)strlen(clean[i]));for(size_t j=0;j<strlen(clean[i]);++j)printf("%02x",(unsigned char)clean[i][j]);printf("\n");}
  return 0;
}
