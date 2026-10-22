#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

typedef float vec3_t[3];
typedef int qboolean;
#define qtrue 1
#define qfalse 0
#define VectorMA(v,s,b,o) do { (o)[0]=(v)[0]+(s)*(b)[0]; (o)[1]=(v)[1]+(s)*(b)[1]; (o)[2]=(v)[2]+(s)*(b)[2]; } while(0)
static float normalize(vec3_t v) {
  float length = sqrtf(v[0]*v[0]+v[1]*v[1]+v[2]*v[2]);
  if (length) { float ilength=1.0f/length; v[0]*=ilength;v[1]*=ilength;v[2]*=ilength; }
  return length;
}
#define VectorNormalize(v) normalize(v)

/* Textually unchanged body from code/game/g_combat.c. */
static int RaySphereIntersections( vec3_t origin, float radius, vec3_t point, vec3_t dir, vec3_t intersections[2] ) {
	float b, c, d, t;
	VectorNormalize(dir);
	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
	c = (point[0] - origin[0]) * (point[0] - origin[0]) +
		(point[1] - origin[1]) * (point[1] - origin[1]) +
		(point[2] - origin[2]) * (point[2] - origin[2]) -
		radius * radius;
	d = b * b - 4 * c;
	if (d > 0) {
		t = (- b + sqrt(d)) / 2;
		VectorMA(point, t, dir, intersections[0]);
		t = (- b - sqrt(d)) / 2;
		VectorMA(point, t, dir, intersections[1]);
		return 2;
	}
	else if (d == 0) {
		t = (- b ) / 2;
		VectorMA(point, t, dir, intersections[0]);
		return 1;
	}
	return 0;
}

static void print_case(vec3_t origin,float radius,vec3_t point,vec3_t dir) {
  vec3_t intersections[2]={{0}}; int count=RaySphereIntersections(origin,radius,point,dir,intersections);
  printf("%d %08x %08x %08x %08x %08x %08x\n",count,
    ((uint32_t*)intersections[0])[0],((uint32_t*)intersections[0])[1],((uint32_t*)intersections[0])[2],
    ((uint32_t*)intersections[1])[0],((uint32_t*)intersections[1])[1],((uint32_t*)intersections[1])[2]);
}
int main(void) {
  vec3_t origin={0,0,0}, point={-100,0,0}, dir={1,0,0}; print_case(origin,42,point,dir);
  { vec3_t p={42,0,0},d={0,1,0}; print_case(origin,42,p,d); }
  { vec3_t p={50,50,0},d={1,0,0}; print_case(origin,42,p,d); }
  { vec3_t p={1.25f,-2.5f,3.75f},d={-4,5,-6}; print_case(origin,9.5f,p,d); }
  return 0;
}
