#include <stdio.h>
#include <string.h>
#define QM_ACTIVATED 3
#define ID_PREVPAGE 100
#define ID_NEXTPAGE 101
#define ID_BACK 102
typedef struct {int id;} menucommon_s;
typedef struct {int modelpage,numpages;char modelskin[64];} playermodel_t;
static playermodel_t s_playermodel;static int updates,pops,writes;static char last[64];
static void PlayerModel_UpdateGrid(void){updates++;}static void UI_PopMenu(void){pops++;}static void trap_Cvar_Set(const char*n,const char*v){(void)n;writes++;strcpy(last,v);}
#include "ui_playermodel_under_test.inc"
static void reset(void){memset(&s_playermodel,0,sizeof(s_playermodel));s_playermodel.numpages=3;strcpy(s_playermodel.modelskin,"sarge/default");updates=pops=writes=0;last[0]=0;}
int main(void){menucommon_s item;reset();item.id=ID_PREVPAGE;PlayerModel_MenuEvent(&item,1);printf("ignore %d %d\n",s_playermodel.modelpage,updates);reset();s_playermodel.modelpage=1;PlayerModel_MenuEvent(&item,QM_ACTIVATED);printf("prev %d %d\n",s_playermodel.modelpage,updates);reset();item.id=ID_NEXTPAGE;PlayerModel_MenuEvent(&item,QM_ACTIVATED);printf("next %d %d\n",s_playermodel.modelpage,updates);reset();item.id=ID_BACK;PlayerModel_MenuEvent(&item,QM_ACTIVATED);printf("back %d %d %s\n",writes,pops,last);return 0;}
