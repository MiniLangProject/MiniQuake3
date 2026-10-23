#include <stdint.h>
#include <stdio.h>
#include <string.h>
#define WIN32 1
#define NDEBUG 1
#include "../../Quake-III-Arena-original-source/code/game/q_shared.h"

void QDECL Com_Error(int level, const char *error, ...) { (void)level; (void)error; }
void QDECL Com_Printf(const char *message, ...) { (void)message; }
static uint32_t fb(float value) { uint32_t bits; memcpy(&bits,&value,4); return bits; }
int main(void) {
  float f=1.2345f; vec3_t a={1.25f,-2.5f,3.75f},b={-4.0f,5.5f,6.25f},cross,inverse={1.25f,-2.5f,3.75f},fast={3.0f,4.0f,12.0f};
  CrossProduct(a,b,cross); VectorInverse(inverse); VectorNormalizeFast(fast);
  printf("endian %d %d %d %d %u %u\n",(int)BigShort((short)0x1234),(int)LittleShort((short)0x1234),LongSwap(0x12345678),LittleLong(0x12345678),fb(FloatSwap(&f)),fb(LittleFloat(f)));
  printf("cross %u %u %u\n",fb(cross[0]),fb(cross[1]),fb(cross[2]));
  printf("metric %u %u %u %u %u\n",fb(VectorLength(a)),fb(VectorLengthSquared(a)),fb(Distance(a,b)),fb(DistanceSquared(a,b)),fb(Q_fabs(-3.5f)));
  printf("misc %d %u %u %u %u %u %u %u\n",VectorCompare(a,a),fb(Q_rsqrt(9.0f)),fb(inverse[0]),fb(inverse[1]),fb(inverse[2]),fb(fast[0]),fb(fast[1]),fb(fast[2]));
  return 0;
}
