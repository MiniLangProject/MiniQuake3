#include <stddef.h>
#include <stdio.h>
#define WIN32 1
#include "../../Quake-III-Arena-original-source/code/cgame/cg_local.h"
#define U(v) ((unsigned)(v))
#define OFF(t,f) U(offsetof(t,f))
int main(void) {
#ifdef MISSIONPACK
  printf("mode missionpack\n");
  printf("font %g\n", (double)CG_FONT_THRESHOLD);
#else
  printf("mode baseq3\n");
#endif
  printf("strings %s|%s|%s|%s|%s\n", DEFAULT_MODEL, DEFAULT_TEAM_MODEL, DEFAULT_TEAM_HEAD, DEFAULT_REDTEAM_NAME, DEFAULT_BLUETEAM_NAME);
  printf("timing %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n", POWERUP_BLINKS, POWERUP_BLINK_TIME, FADE_TIME, PULSE_TIME, DAMAGE_DEFLECT_TIME, DAMAGE_RETURN_TIME, DAMAGE_TIME, LAND_DEFLECT_TIME, LAND_RETURN_TIME, STEP_TIME, DUCK_TIME, PAIN_TWITCH_TIME, WEAPON_SELECT_TIME, ITEM_SCALEUP_TIME, ZOOM_TIME, ITEM_BLOB_TIME, MUZZLE_FLASH_TIME, SINK_TIME);
  printf("limits %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n", MAX_STEP_CHANGE, MAX_VERTS_ON_POLY, MAX_MARK_POLYS, STAT_MINUS, ICON_SIZE, CHAR_WIDTH, CHAR_HEIGHT, TEXT_ICON_SPACE, TEAMCHAT_WIDTH, TEAMCHAT_HEIGHT, NUM_CROSSHAIRS, MAX_CUSTOM_SOUNDS, MAX_SKULLTRAIL, MAX_REWARDSTACK, MAX_SOUNDBUFFER);
  printf("footsteps %d %d %d %d %d %d %d %d\n", FOOTSTEP_NORMAL, FOOTSTEP_BOOT, FOOTSTEP_FLESH, FOOTSTEP_MECH, FOOTSTEP_ENERGY, FOOTSTEP_METAL, FOOTSTEP_SPLASH, FOOTSTEP_TOTAL);
  printf("impact %d %d %d\n", IMPACTSOUND_DEFAULT, IMPACTSOUND_METAL, IMPACTSOUND_FLESH);
  printf("local %d %d %d %d %d %d %d %d %d", LE_MARK, LE_EXPLOSION, LE_SPRITE_EXPLOSION, LE_FRAGMENT, LE_MOVE_SCALE_FADE, LE_FALL_SCALE_FADE, LE_FADE_RGB, LE_SCALE_FADE, LE_SCOREPLUM);
#ifdef MISSIONPACK
  printf(" %d %d %d %d", LE_KAMIKAZE, LE_INVULIMPACT, LE_INVULJUICED, LE_SHOWREFENTITY);
#endif
  printf("\nflags %d %d %d %d|%d %d %d|%d %d %d\n", LEF_PUFF_DONT_SCALE, LEF_TUMBLE, LEF_SOUND1, LEF_SOUND2, LEMT_NONE, LEMT_BURN, LEMT_BLOOD, LEBS_NONE, LEBS_BLOOD, LEBS_BRASS);
  printf("sizes");
  printf(" lerpFrame_t=%u", U(sizeof(lerpFrame_t)));
  printf(" playerEntity_t=%u", U(sizeof(playerEntity_t)));
  printf(" centity_t=%u", U(sizeof(centity_t)));
  printf(" markPoly_t=%u", U(sizeof(markPoly_t)));
  printf(" localEntity_t=%u", U(sizeof(localEntity_t)));
  printf(" score_t=%u", U(sizeof(score_t)));
  printf(" clientInfo_t=%u", U(sizeof(clientInfo_t)));
  printf(" weaponInfo_t=%u", U(sizeof(weaponInfo_t)));
  printf(" itemInfo_t=%u", U(sizeof(itemInfo_t)));
  printf(" powerupInfo_t=%u", U(sizeof(powerupInfo_t)));
  printf(" skulltrail_t=%u", U(sizeof(skulltrail_t)));
  printf(" cg_t=%u", U(sizeof(cg_t)));
  printf(" cgMedia_t=%u", U(sizeof(cgMedia_t)));
  printf(" cgs_t=%u", U(sizeof(cgs_t)));
  printf("\n");
  printf("offset lerpFrame_t");
  printf(" oldFrame=%u", OFF(lerpFrame_t,oldFrame));
  printf(" animation=%u", OFF(lerpFrame_t,animation));
  printf(" animationTime=%u", OFF(lerpFrame_t,animationTime));
  printf("\n");
  printf("offset playerEntity_t");
  printf(" legs=%u", OFF(playerEntity_t,legs));
  printf(" railgunImpact=%u", OFF(playerEntity_t,railgunImpact));
  printf(" barrelSpinning=%u", OFF(playerEntity_t,barrelSpinning));
  printf("\n");
  printf("offset centity_t");
  printf(" currentState=%u", OFF(centity_t,currentState));
  printf(" pe=%u", OFF(centity_t,pe));
  printf(" lerpAngles=%u", OFF(centity_t,lerpAngles));
  printf("\n");
  printf("offset markPoly_t");
  printf(" prevMark=%u", OFF(markPoly_t,prevMark));
  printf(" poly=%u", OFF(markPoly_t,poly));
  printf(" verts=%u", OFF(markPoly_t,verts));
  printf("\n");
  printf("offset localEntity_t");
  printf(" prev=%u", OFF(localEntity_t,prev));
  printf(" pos=%u", OFF(localEntity_t,pos));
  printf(" refEntity=%u", OFF(localEntity_t,refEntity));
  printf("\n");
  printf("offset score_t");
  printf(" client=%u", OFF(score_t,client));
  printf(" accuracy=%u", OFF(score_t,accuracy));
  printf(" team=%u", OFF(score_t,team));
  printf("\n");
  printf("offset clientInfo_t");
  printf(" infoValid=%u", OFF(clientInfo_t,infoValid));
  printf(" modelName=%u", OFF(clientInfo_t,modelName));
  printf(" sounds=%u", OFF(clientInfo_t,sounds));
  printf("\n");
  printf("offset weaponInfo_t");
  printf(" registered=%u", OFF(weaponInfo_t,registered));
  printf(" missileTrailFunc=%u", OFF(weaponInfo_t,missileTrailFunc));
  printf(" loopFireSound=%u", OFF(weaponInfo_t,loopFireSound));
  printf("\n");
  printf("offset itemInfo_t");
  printf(" registered=%u", OFF(itemInfo_t,registered));
  printf(" models=%u", OFF(itemInfo_t,models));
  printf(" icon=%u", OFF(itemInfo_t,icon));
  printf("\n");
  printf("offset powerupInfo_t");
  printf(" itemNum=%u", OFF(powerupInfo_t,itemNum));
  printf("\n");
  printf("offset skulltrail_t");
  printf(" positions=%u", OFF(skulltrail_t,positions));
  printf(" numpositions=%u", OFF(skulltrail_t,numpositions));
  printf("\n");
  printf("offset cg_t");
  printf(" clientFrame=%u", OFF(cg_t,clientFrame));
  printf(" predictedPlayerState=%u", OFF(cg_t,predictedPlayerState));
  printf(" scores=%u", OFF(cg_t,scores));
  printf(" rewardStack=%u", OFF(cg_t,rewardStack));
  printf(" testGun=%u", OFF(cg_t,testGun));
  printf("\n");
  printf("offset cgMedia_t");
  printf(" charsetShader=%u", OFF(cgMedia_t,charsetShader));
  printf(" numberShaders=%u", OFF(cgMedia_t,numberShaders));
  printf(" footsteps=%u", OFF(cgMedia_t,footsteps));
  printf(" wstbactvSound=%u", OFF(cgMedia_t,wstbactvSound));
  printf("\n");
  printf("offset cgs_t");
  printf(" gameState=%u", OFF(cgs_t,gameState));
  printf(" mapname=%u", OFF(cgs_t,mapname));
  printf(" gameModels=%u", OFF(cgs_t,gameModels));
  printf(" clientinfo=%u", OFF(cgs_t,clientinfo));
  printf(" media=%u", OFF(cgs_t,media));
  printf("\n");
  return 0;
}
