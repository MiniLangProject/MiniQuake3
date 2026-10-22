/* SPDX-License-Identifier: GPL-2.0-or-later
 * Native MISSIONPACK arithmetic retained from Pickup_PersistantPowerup.
 */
#include <stdio.h>
int main(void){int handicap,tag,max,health,armor;
 for(tag=10;tag<=13;tag++){
  handicap=75;max=handicap;health=100;armor=99;
  if(tag==11){max=(int)(2*handicap);health=max;armor=max;}
  else if(tag==10){armor=0;}
  printf("persistent|%d|%d|%d|%d\n",tag,max,health,armor);
 }
 return 0;
}
