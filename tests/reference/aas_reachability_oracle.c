/* Unchanged pure function bodies from be_aas_reach.c, with typed globals. */
#include <math.h>
#include <stdio.h>
typedef float vec3_t[3];
typedef struct { float phys_gravity,phys_maxvelocity,rs_maxjumpfallheight,phys_jumpvel; } settings_t;
static settings_t aassettings;
#define VectorSubtract(a,b,c) do{(c)[0]=(a)[0]-(b)[0];(c)[1]=(a)[1]-(b)[1];(c)[2]=(a)[2]-(b)[2];}while(0)
#define VectorAdd(a,b,c) do{(c)[0]=(a)[0]+(b)[0];(c)[1]=(a)[1]+(b)[1];(c)[2]=(a)[2]+(b)[2];}while(0)
#define VectorScale(a,s,c) do{(c)[0]=(a)[0]*(s);(c)[1]=(a)[1]*(s);(c)[2]=(a)[2]*(s);}while(0)
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#define VectorLength(a) sqrtf(DotProduct((a),(a)))

int AAS_FallDamageDistance(void)
{
	float maxzvelocity, gravity, t;

	maxzvelocity = sqrt(30 * 10000);
	gravity = aassettings.phys_gravity;
	t = maxzvelocity / gravity;
	return 0.5 * gravity * t * t;
}
float AAS_FallDelta(float distance)
{
	float t, delta, gravity;

	gravity = aassettings.phys_gravity;
	t = sqrt(fabs(distance) * 2 / gravity);
	delta = t * gravity;
	return delta * delta * 0.0001;
}
float AAS_MaxJumpHeight(float phys_jumpvel)
{
	float phys_gravity;

	phys_gravity = aassettings.phys_gravity;
	return 0.5 * phys_gravity * (phys_jumpvel / phys_gravity) * (phys_jumpvel / phys_gravity);
}
float AAS_MaxJumpDistance(float phys_jumpvel)
{
	float phys_gravity, phys_maxvelocity, t;

	phys_gravity = aassettings.phys_gravity;
	phys_maxvelocity = aassettings.phys_maxvelocity;
	t = sqrt(aassettings.rs_maxjumpfallheight / (0.5 * phys_gravity));
   return phys_maxvelocity * (t + phys_jumpvel / phys_gravity);
}
float VectorDistance(vec3_t v1, vec3_t v2)
{
	vec3_t dir;

	VectorSubtract(v2, v1, dir);
	return VectorLength(dir);
}
int VectorBetweenVectors(vec3_t v, vec3_t v1, vec3_t v2)
{
	vec3_t dir1, dir2;

	VectorSubtract(v, v1, dir1);
	VectorSubtract(v, v2, dir2);
	return (DotProduct(dir1, dir2) <= 0);
}
void VectorMiddle(vec3_t v1, vec3_t v2, vec3_t middle)
{
	VectorAdd(v1, v2, middle);
	VectorScale(middle, 0.5, middle);
}
int main(void){vec3_t a={0,0,0},b={3,4,0},m,p={1.5f,2,0},outside={4,5,0};int c=0;aassettings.phys_gravity=800;aassettings.phys_maxvelocity=320;aassettings.rs_maxjumpfallheight=450;aassettings.phys_jumpvel=270;
c+=(VectorDistance(a,b)==5);c+=VectorBetweenVectors(p,a,b);c+=!VectorBetweenVectors(outside,a,b);VectorMiddle(a,b,m);c+=(m[0]==1.5f&&m[1]==2);c+=(AAS_FallDamageDistance()==187);c+=(fabsf(AAS_FallDelta(100)-16)<.001f);c+=(fabsf(AAS_MaxJumpHeight(270)-45.5625f)<.001f);c+=(AAS_MaxJumpDistance(270)>447&&AAS_MaxJumpDistance(270)<448);if(c!=8){printf("FAIL: %d/8\n",c);return 1;}puts("PASS: 8 unchanged-C reachability observations");return 0;}

