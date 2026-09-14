#include <stdio.h>
#include <string.h>
typedef struct {const char *name;int valid;} weapon_t;
static int find(const char **weights,int count,const char *name){int i;for(i=0;i<count;i++)if(!strcmp(weights[i],name))return i;return -1;}
int main(void){weapon_t weapons[32]={{0}};const char *weights[]={"Gauntlet","Machinegun","Rocket Launcher"};int index[32],i,bad=0;weapons[1]=(weapon_t){"Gauntlet",1};weapons[2]=(weapon_t){"Machinegun",1};weapons[5]=(weapon_t){"Rocket Launcher",1};for(i=0;i<32;i++)index[i]=weapons[i].valid?find(weights,3,weapons[i].name):-1;bad+=index[0]!=-1;bad+=index[1]!=0;bad+=index[2]!=1;bad+=index[5]!=2;bad+=sizeof(index)/sizeof(index[0])!=32;if(bad){printf("FAIL: %d\n",bad);return 1;}puts("PASS: 5 native weapon-index observations");return 0;}
