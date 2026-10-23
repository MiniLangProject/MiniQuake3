#include <stdio.h>
#include <stddef.h>
#define WIN32 1
#include "../../Quake-III-Arena-original-source/code/q3_ui/ui_local.h"
int main(void) {
 printf("api %d %d %d %d %d %d %d\n", UI_API_VERSION,RCOLUMN_OFFSET,LCOLUMN_OFFSET,SLIDER_RANGE,MAX_EDIT_LINE,MAX_MENUDEPTH,MAX_MENUITEMS);
 printf("types %d %d %d %d %d %d %d %d %d %d %d\n", MTYPE_NULL,MTYPE_SLIDER,MTYPE_ACTION,MTYPE_SPINCONTROL,MTYPE_FIELD,MTYPE_RADIOBUTTON,MTYPE_BITMAP,MTYPE_TEXT,MTYPE_SCROLLLIST,MTYPE_PTEXT,MTYPE_BTEXT);
 printf("flags %u %u %u %u %u %u %u %u\n", QMF_BLINK,QMF_NUMBERSONLY,QMF_PULSEIFFOCUS,QMF_HIDDEN,QMF_OWNERDRAW,QMF_LOWERCASE,QMF_SILENT,MAX_FAVORITESERVERS);
 printf("events %d %d %d awards %d %d\n", QM_GOTFOCUS,QM_LOSTFOCUS,QM_ACTIVATED,AWARD_ACCURACY,AWARD_PERFECT);
 printf("sizes %u %u %u %u %u %u %u %u %u %u %u %u %u %u\n", (unsigned)sizeof(menuframework_s),(unsigned)sizeof(menucommon_s),(unsigned)sizeof(mfield_t),(unsigned)sizeof(menufield_s),(unsigned)sizeof(menuslider_s),(unsigned)sizeof(menulist_s),(unsigned)sizeof(menuaction_s),(unsigned)sizeof(menuradiobutton_s),(unsigned)sizeof(menubitmap_s),(unsigned)sizeof(menutext_s),(unsigned)sizeof(lerpFrame_t),(unsigned)sizeof(playerInfo_t),(unsigned)sizeof(uiStatic_t),(unsigned)sizeof(voidfunc_f));
 printf("offsets %u %u %u %u %u %u\n",(unsigned)offsetof(menuframework_s,items),(unsigned)offsetof(menucommon_s,flags),(unsigned)offsetof(mfield_t,buffer),(unsigned)offsetof(playerInfo_t,weaponModel),(unsigned)offsetof(playerInfo_t,realWeapon),(unsigned)offsetof(uiStatic_t,scale));
 return 0;
}
