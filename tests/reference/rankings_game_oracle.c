#include <stdio.h>
typedef struct {int warmupTime;} level_locals_t;static level_locals_t level;
typedef struct {int a,b,key,value,accum;} event_t;static event_t events[128];static int count;
static void trap_RankReportInt(int a,int b,int key,int value,int accum){events[count++]=(event_t){a,b,key,value,accum};}
static void trap_RankReportStr(int a,int b,int key,char *value){printf("str=%d,%d,%d,%s\n",a,b,key,value);}
#define WP_GAUNTLET 1
#define WP_MACHINEGUN 2
#define WP_SHOTGUN 3
#define WP_GRENADE_LAUNCHER 4
#define WP_ROCKET_LAUNCHER 5
#define WP_LIGHTNING 6
#define WP_RAILGUN 7
#define WP_PLASMAGUN 8
#define WP_BFG 9
#define WP_GRAPPLING_HOOK 10
#define PW_QUAD 1
#define PW_BATTLESUIT 2
#define PW_HASTE 3
#define PW_INVIS 4
#define PW_REGEN 5
#define PW_FLIGHT 6
#define PW_REDFLAG 7
#define PW_BLUEFLAG 8
#define HI_TELEPORTER 1
#define HI_MEDKIT 2
#define EF_AWARD_EXCELLENT 8
#define EF_AWARD_IMPRESSIVE 32768
#define QGR_KEY_SHOT_FIRED 1111020002
#define QGR_KEY_SHOT_FIRED_MACHINEGUN 1111020202
#define QGR_KEY_SHOT_FIRED_SHOTGUN 1111020302
#define QGR_KEY_SHOT_FIRED_GRENADE 1111020402
#define QGR_KEY_SHOT_FIRED_ROCKET 1111020502
#define QGR_KEY_SHOT_FIRED_PLASMA 1111020602
#define QGR_KEY_SHOT_FIRED_RAILGUN 1111020702
#define QGR_KEY_SHOT_FIRED_LIGHTNING 1111020802
#define QGR_KEY_SHOT_FIRED_BFG 1111020902
#define QGR_KEY_SHOT_FIRED_GRAPPLE 1111021002
#define QGR_KEY_HEALTH 1111040000
#define QGR_KEY_HEALTH_TOTAL 1111040001
#define QGR_KEY_HEALTH_5 1111040100
#define QGR_KEY_HEALTH_25 1111040200
#define QGR_KEY_HEALTH_50 1111040300
#define QGR_KEY_HEALTH_MEGA 1111040400
#define QGR_KEY_ARMOR 1111050000
#define QGR_KEY_ARMOR_TOTAL 1111050001
#define QGR_KEY_ARMOR_SHARD 1111050100
#define QGR_KEY_ARMOR_YELLOW 1111050200
#define QGR_KEY_ARMOR_RED 1111050300
#define QGR_KEY_POWERUP 1111060000
#define QGR_KEY_QUAD 1111060100
#define QGR_KEY_SUIT 1111060200
#define QGR_KEY_HASTE 1111060300
#define QGR_KEY_INVIS 1111060400
#define QGR_KEY_REGEN 1111060500
#define QGR_KEY_FLIGHT 1111060600
#define QGR_KEY_FLAG_PICKUP 1111110000
#define QGR_KEY_MEDKIT 1111070000
#define QGR_KEY_TELEPORTER 1111070100
#define QGR_KEY_MEDKIT_USE 1111070001
#define QGR_KEY_TELEPORTER_USE 1111070101
#define QGR_KEY_IMPRESSIVE 1111090000
#define QGR_KEY_EXCELLENT 1111090100
#define QGR_KEY_FLAG_CAPTURE 1111110001
#define QGR_KEY_TEAM_NAME 1100100007
#include "rankings_game_under_test.inc"
static void dump(const char *label){int i;printf("%s=",label);for(i=0;i<count;i++)printf("%s%d:%d",i?"|":"",events[i].key,events[i].value);puts("");count=0;}
int main(void){G_RankFireWeapon(1,WP_ROCKET_LAUNCHER);dump("fire");G_RankFireWeapon(1,WP_GAUNTLET);dump("gauntlet");G_RankPickupHealth(2,100);dump("health");G_RankPickupArmor(2,50);dump("armor");G_RankPickupPowerup(0,PW_REDFLAG);dump("flag");G_RankPickupPowerup(0,PW_REGEN);dump("regen");G_RankPickupHoldable(0,HI_MEDKIT);G_RankUseHoldable(0,HI_MEDKIT);dump("holdable");G_RankReward(0,EF_AWARD_IMPRESSIVE);G_RankCapture(0);dump("reward");G_RankUserTeamName(0,"Red");return 0;}
