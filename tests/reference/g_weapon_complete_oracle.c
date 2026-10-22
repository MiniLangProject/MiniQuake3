/* SPDX-License-Identifier: GPL-2.0-or-later
 * Native arithmetic oracle for the MISSIONPACK branches in g_weapon.c.
 * Constants and expressions below are kept textually identical to the pinned
 * Weapon_Nailgun_Fire, weapon_proxlauncher_fire and KamikazeDamage bodies.
 */
#include <stdio.h>
#include <math.h>
int main(void) {
    int count, accuracy_shots=0;
    float s_quadFactor=1.5f;
    for (count=0;count<15;count++) { /* NUM_NAILSHOTS */ }
    accuracy_shots += 15;
    printf("nail|%d|%d|%d|%d\n",count,(int)(20*s_quadFactor),11,11000);
    {
        float forward[3]={1,0,0};float length;
        forward[2]+=0.2f;length=(float)sqrt(forward[0]*forward[0]+forward[2]*forward[2]);
        forward[0]/=length;forward[2]/=length;
        printf("prox|%d|%d|%d|%d|%d\n",(int)(forward[0]*700),(int)(forward[1]*700),(int)(forward[2]*700),950,(int)(100*s_quadFactor));
    }
    for(count=100;count<=2000;count+=100) {
        float t=(float)count;int shock=(int)(float)t*1320/(2000-0),boom=0;
        if(count>=250){t=(float)(count-250);boom=(int)(float)t*720/(2000-250);}
        printf("radius|%d|%d|%d\n",count,shock,boom);
    }
    return accuracy_shots==15?0:1;
}
