#include <stdint.h>
#include <stdio.h>

#define AASID (('S'<<24)+('A'<<16)+('A'<<8)+'E')
#define AASVERSION_OLD 4
#define AASVERSION 5
#define AAS_LUMPS 14
#define PRESENCE_NONE 1
#define PRESENCE_NORMAL 2
#define PRESENCE_CROUCH 4
#define MAX_TRAVELTYPES 32
#define TRAVELTYPE_MASK 0xFFFFFF
#define TRAVELFLAG_NOTTEAM1 (1 << 24)
#define TRAVELFLAG_NOTTEAM2 (2 << 24)
#define AREACONTENTS_MODELNUMSHIFT 24
#define AREACONTENTS_MAXMODELNUM 0xFF
#define AREACONTENTS_MODELNUM (AREACONTENTS_MAXMODELNUM << AREACONTENTS_MODELNUMSHIFT)

typedef float vec3_t[3];
typedef struct { int presencetype; int flags; vec3_t mins,maxs; } aas_bbox_t;
typedef struct { int areanum,facenum,edgenum; vec3_t start,end; int traveltype; unsigned short int traveltime; } aas_reachability_t;
typedef struct { int contents,areaflags,presencetype,cluster,clusterareanum,numreachableareas,firstreachablearea; } aas_areasettings_t;
typedef struct { int areanum,frontcluster,backcluster,clusterareanum[2]; } aas_portal_t;
typedef struct { int numareas,numreachabilityareas,numportals,firstportal; } aas_cluster_t;
typedef vec3_t aas_vertex_t;
typedef struct { vec3_t normal; float dist; int type; } aas_plane_t;
typedef struct { int v[2]; } aas_edge_t;
typedef struct { int planenum,faceflags,numedges,firstedge,frontarea,backarea; } aas_face_t;
typedef struct { int areanum,numfaces,firstface; vec3_t mins,maxs,center; } aas_area_t;
typedef struct { int planenum,children[2]; } aas_node_t;
typedef struct { int fileofs,filelen; } aas_lump_t;
typedef struct { int ident,version,bspchecksum; aas_lump_t lumps[AAS_LUMPS]; } aas_header_t;

/* Unchanged from code/botlib/be_aas_file.c. */
void AAS_DData(unsigned char *data, int size)
{
	int i;

	for (i = 0; i < size; i++)
	{
		data[i] ^= (unsigned char) i * 119;
	}
}

int main(void) {
    unsigned char data[16]; unsigned checksum=0; int i;
    for(i=0;i<16;i++) data[i]=(unsigned char)(i*13+7);
    AAS_DData(data,16); for(i=0;i<16;i++) checksum=checksum*33u+data[i];
    AAS_DData(data,16);
    printf("abi|%08x|%d|%d|%d|%zu,%zu,%zu,%zu,%zu,%zu,%zu,%zu,%zu,%zu,%zu,%zu\n",
      (unsigned)AASID,AASVERSION_OLD,AASVERSION,AAS_LUMPS,
      sizeof(aas_bbox_t),sizeof(aas_vertex_t),sizeof(aas_plane_t),sizeof(aas_edge_t),sizeof(int),sizeof(aas_face_t),sizeof(int),sizeof(aas_area_t),sizeof(aas_areasettings_t),sizeof(aas_reachability_t),sizeof(aas_node_t),sizeof(aas_portal_t));
    printf("tail|%zu,%zu,%zu|%d,%d,%d|%d,%08x,%08x|%u\n",sizeof(int),sizeof(aas_cluster_t),sizeof(aas_header_t),PRESENCE_NONE,PRESENCE_NORMAL,PRESENCE_CROUCH,MAX_TRAVELTYPES,(unsigned)TRAVELTYPE_MASK,(unsigned)AREACONTENTS_MODELNUM,checksum);
    for(i=0;i<16;i++) if(data[i]!=(unsigned char)(i*13+7)) return 2;
    return 0;
}
