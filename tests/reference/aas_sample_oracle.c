/* Unchanged pure be_aas_sample.c bodies with typed test scaffolding. */
#include <stdio.h>
typedef float vec3_t[3];
typedef struct { vec3_t normal; float dist; int type; } aas_plane_t;
#define PRESENCE_NORMAL 2
#define PRESENCE_CROUCH 4
#define BBOX_NORMAL_EPSILON 0.001
#define VectorCopy(a,b) do{(b)[0]=(a)[0];(b)[1]=(a)[1];(b)[2]=(a)[2];}while(0)
#define VectorInverse(a) do{(a)[0]=-(a)[0];(a)[1]=-(a)[1];(a)[2]=-(a)[2];}while(0)
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
void AAS_PresenceTypeBoundingBox(int presencetype, vec3_t mins, vec3_t maxs)
{
	int index;
	vec3_t boxmins[3] = {{0, 0, 0}, {-15, -15, -24}, {-15, -15, -24}};
	vec3_t boxmaxs[3] = {{0, 0, 0}, { 15,  15,  32}, { 15,  15,   8}};

	if (presencetype == PRESENCE_NORMAL) index = 1;
	else if (presencetype == PRESENCE_CROUCH) index = 2;
	else index = 2;
	VectorCopy(boxmins[index], mins);
	VectorCopy(boxmaxs[index], maxs);
}
float AAS_BoxOriginDistanceFromPlane(vec3_t normal, vec3_t mins, vec3_t maxs, int side)
{
	vec3_t v1, v2;
	int i;

	if (side)
	{
		for (i = 0; i < 3; i++)
		{
			if (normal[i] > BBOX_NORMAL_EPSILON) v1[i] = maxs[i];
			else if (normal[i] < -BBOX_NORMAL_EPSILON) v1[i] = mins[i];
			else v1[i] = 0;
		}
	}
	else
	{
		for (i = 0; i < 3; i++)
		{
			if (normal[i] > BBOX_NORMAL_EPSILON) v1[i] = mins[i];
			else if (normal[i] < -BBOX_NORMAL_EPSILON) v1[i] = maxs[i];
			else v1[i] = 0;
		}
	}
	VectorCopy(normal, v2);
	VectorInverse(v2);
	return DotProduct(v1, v2);
}
int AAS_BoxOnPlaneSide2(vec3_t absmins, vec3_t absmaxs, aas_plane_t *p)
{
	int i, sides;
	float dist1, dist2;
	vec3_t corners[2];

	for (i = 0; i < 3; i++)
	{
		if (p->normal[i] < 0)
		{
			corners[0][i] = absmins[i];
			corners[1][i] = absmaxs[i];
		}
		else
		{
			corners[1][i] = absmins[i];
			corners[0][i] = absmaxs[i];
		}
	}
	dist1 = DotProduct(p->normal, corners[0]) - p->dist;
	dist2 = DotProduct(p->normal, corners[1]) - p->dist;
	sides = 0;
	if (dist1 >= 0) sides = 1;
	if (dist2 < 0) sides |= 2;

	return sides;
}
int main(void){vec3_t mins,maxs,n={1,0,0},bmin={-2,-2,-2},bmax={2,2,2};aas_plane_t p={{1,0,0},0,0};int c=0;AAS_PresenceTypeBoundingBox(PRESENCE_NORMAL,mins,maxs);c+=(mins[2]==-24&&maxs[2]==32);c+=(mins[0]==-15&&maxs[0]==15);AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH,mins,maxs);c+=(maxs[2]==8);AAS_PresenceTypeBoundingBox(99,mins,maxs);c+=(maxs[2]==8);c+=(AAS_BoxOriginDistanceFromPlane(n,bmin,bmax,0)==2);c+=(AAS_BoxOriginDistanceFromPlane(n,bmin,bmax,1)==-2);c+=(AAS_BoxOnPlaneSide2(bmin,bmax,&p)==3);p.dist=-3;c+=(AAS_BoxOnPlaneSide2(bmin,bmax,&p)==1);p.dist=3;c+=(AAS_BoxOnPlaneSide2(bmin,bmax,&p)==2);p.normal[0]=-1;p.dist=0;c+=(AAS_BoxOnPlaneSide2(bmin,bmax,&p)==3);if(c!=10){printf("FAIL: %d/10\n",c);return 1;}puts("PASS: 10 unchanged-C AAS sample observations");return 0;}
