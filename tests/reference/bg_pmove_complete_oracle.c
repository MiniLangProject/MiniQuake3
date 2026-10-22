#include <stdio.h>

typedef float vec3_t[3];
typedef struct { int serverTime,angles[3],buttons; unsigned char weapon; signed char forwardmove,rightmove,upmove; } usercmd_t;
typedef struct { vec3_t velocity; } playerState_t;
typedef struct { playerState_t *ps; usercmd_t cmd; } pmove_t;
static pmove_t *pm;
#define VectorClear(v) ((v)[0]=(v)[1]=(v)[2]=0.0f)

#include "bg_pmove_complete_under_test.inc"

int main(void) {
    playerState_t ps={{120.5f,-31.25f,480.0f}};
    pmove_t move={&ps,{0,{0,0,0},0,0,127,-80,20}};
    pm=&move;
    PM_InvulnerabilityMove();
    printf("invulnerability=%d,%d,%d;%08x,%08x,%08x\n",
        move.cmd.forwardmove,move.cmd.rightmove,move.cmd.upmove,
        *(unsigned int*)&ps.velocity[0],*(unsigned int*)&ps.velocity[1],*(unsigned int*)&ps.velocity[2]);
    return 0;
}
