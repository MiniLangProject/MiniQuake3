/* Deterministic host for the unchanged botlib be_aas_optimize.c implementation. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

#define FACE_LADDER 2
#define TRAVELTYPE_MASK 0xffffff
#define TRAVEL_ELEVATOR 11
#define TRAVEL_JUMPPAD 18
#define TRAVEL_FUNCBOB 19
#define PRT_MESSAGE 2

typedef float aas_vertex_t[3];
typedef struct { int v[2]; } aas_edge_t;
typedef int aas_edgeindex_t;
typedef struct { int planenum, faceflags, numedges, firstedge, frontarea, backarea; } aas_face_t;
typedef int aas_faceindex_t;
typedef struct { int areanum, numfaces, firstface; float mins[3], maxs[3], center[3]; } aas_area_t;
typedef struct { int areanum, facenum, edgenum; float start[3], end[3]; int traveltype; unsigned short traveltime; } aas_reachability_t;
typedef struct {
    int numvertexes; aas_vertex_t *vertexes;
    int numedges; aas_edge_t *edges;
    int edgeindexsize; aas_edgeindex_t *edgeindex;
    int numfaces; aas_face_t *faces;
    int faceindexsize; aas_faceindex_t *faceindex;
    int numareas; aas_area_t *areas;
    int reachabilitysize; aas_reachability_t *reachability;
} aasworld_t;

static aasworld_t aasworld;
static int printCount;
static int lastSeverity;
static char lastPrint[256];

static void *GetClearedMemory(size_t size) { return calloc(1, size ? size : 1); }
static void FreeMemory(void *memory) { free(memory); }
#define VectorCopy(a,b) memcpy((b),(a),sizeof(float)*3)
#define Com_Memcpy memcpy

static void BotPrint(int severity, const char *format, ...) {
    va_list args;lastSeverity=severity;printCount++;
    va_start(args,format);vsnprintf(lastPrint,sizeof(lastPrint),format,args);va_end(args);
}
static struct { void (*Print)(int,const char *,...); } botimport = { BotPrint };

typedef struct optimized_s {
    int numvertexes; aas_vertex_t *vertexes;
    int numedges; aas_edge_t *edges;
    int edgeindexsize; aas_edgeindex_t *edgeindex;
    int numfaces; aas_face_t *faces;
    int faceindexsize; aas_faceindex_t *faceindex;
    int numareas; aas_area_t *areas;
    int *vertexoptimizeindex, *edgeoptimizeindex, *faceoptimizeindex;
} optimized_t;
int AAS_KeepEdge(aas_edge_t *edge);
int AAS_OptimizeEdge(optimized_t *optimized, int edgenum);
int AAS_KeepFace(aas_face_t *face);
int AAS_OptimizeFace(optimized_t *optimized, int facenum);
void AAS_OptimizeArea(optimized_t *optimized, int areanum);
void AAS_OptimizeAlloc(optimized_t *optimized);
void AAS_OptimizeStore(optimized_t *optimized);
void AAS_Optimize(void);

#include "be_aas_optimize_under_test.inc"

static void fixture(void) {
    int i;
    memset(&aasworld,0,sizeof(aasworld));printCount=0;lastSeverity=0;lastPrint[0]=0;
    aasworld.numvertexes=5;aasworld.vertexes=calloc(5,sizeof(aas_vertex_t));
    for(i=0;i<5;i++){aasworld.vertexes[i][0]=(float)(i*10+1);aasworld.vertexes[i][1]=(float)(i*10+2);aasworld.vertexes[i][2]=(float)(i*10+3);}
    aasworld.numedges=4;aasworld.edges=calloc(4,sizeof(aas_edge_t));
    aasworld.edges[1].v[0]=1;aasworld.edges[1].v[1]=2;
    aasworld.edges[2].v[0]=2;aasworld.edges[2].v[1]=3;
    aasworld.edges[3].v[0]=3;aasworld.edges[3].v[1]=4;
    aasworld.edgeindexsize=4;aasworld.edgeindex=calloc(4,sizeof(int));
    aasworld.edgeindex[0]=1;aasworld.edgeindex[1]=2;aasworld.edgeindex[2]=-1;aasworld.edgeindex[3]=3;
    aasworld.numfaces=4;aasworld.faces=calloc(4,sizeof(aas_face_t));
    aasworld.faces[1]=(aas_face_t){7,FACE_LADDER,2,0,1,2};
    aasworld.faces[2]=(aas_face_t){8,0,1,2,1,0};
    aasworld.faces[3]=(aas_face_t){9,FACE_LADDER,1,3,2,0};
    aasworld.faceindexsize=3;aasworld.faceindex=calloc(3,sizeof(int));
    aasworld.faceindex[0]=1;aasworld.faceindex[1]=2;aasworld.faceindex[2]=-3;
    aasworld.numareas=3;aasworld.areas=calloc(3,sizeof(aas_area_t));
    aasworld.areas[1].areanum=1;aasworld.areas[1].numfaces=2;aasworld.areas[1].firstface=0;
    aasworld.areas[2].areanum=2;aasworld.areas[2].numfaces=1;aasworld.areas[2].firstface=2;
    aasworld.reachabilitysize=4;aasworld.reachability=calloc(4,sizeof(aas_reachability_t));
    aasworld.reachability[0]=(aas_reachability_t){2,1,-2,{0,0,0},{1,2,3},1,17};
    aasworld.reachability[1]=(aas_reachability_t){2,-3,-3,{0,0,0},{0,0,0},TRAVEL_ELEVATOR,18};
    aasworld.reachability[2]=(aas_reachability_t){2,333,444,{0,0,0},{0,0,0},TRAVEL_JUMPPAD,19};
    aasworld.reachability[3]=(aas_reachability_t){2,-222,-111,{0,0,0},{0,0,0},TRAVEL_FUNCBOB,20};
}

int main(void) {
    int i;aas_edge_t edge={{1,2}};aas_face_t ladder={0,2,0,0,0,0}, plain={0,0,0,0,0,0};
    printf("keep|%d|%d|%d\n",AAS_KeepEdge(&edge),AAS_KeepFace(&ladder),AAS_KeepFace(&plain));
    fixture();AAS_Optimize();
    printf("counts|%d|%d|%d|%d|%d|%d\n",aasworld.numvertexes,aasworld.numedges,aasworld.edgeindexsize,aasworld.numfaces,aasworld.faceindexsize,aasworld.numareas);
    printf("areas|%d,%d,%d|%d,%d,%d\n",aasworld.areas[1].areanum,aasworld.areas[1].numfaces,aasworld.areas[1].firstface,aasworld.areas[2].areanum,aasworld.areas[2].numfaces,aasworld.areas[2].firstface);
    printf("indexes|");for(i=0;i<aasworld.edgeindexsize;i++)printf("%s%d",i?",":"",aasworld.edgeindex[i]);printf("|");for(i=0;i<aasworld.faceindexsize;i++)printf("%s%d",i?",":"",aasworld.faceindex[i]);printf("\n");
    printf("edges|");for(i=1;i<aasworld.numedges;i++)printf("%s%d,%d",i>1?";":"",aasworld.edges[i].v[0],aasworld.edges[i].v[1]);printf("\n");
    printf("faces|");for(i=1;i<aasworld.numfaces;i++)printf("%s%d,%d,%d,%d,%d,%d",i>1?";":"",aasworld.faces[i].planenum,aasworld.faces[i].faceflags,aasworld.faces[i].numedges,aasworld.faces[i].firstedge,aasworld.faces[i].frontarea,aasworld.faces[i].backarea);printf("\n");
    printf("vertices|");for(i=0;i<aasworld.numvertexes;i++)printf("%s%.0f,%.0f,%.0f",i?";":"",aasworld.vertexes[i][0],aasworld.vertexes[i][1],aasworld.vertexes[i][2]);printf("\n");
    for(i=0;i<aasworld.reachabilitysize;i++)printf("reach%d|%d|%d|%d|%u\n",i,aasworld.reachability[i].facenum,aasworld.reachability[i].edgenum,aasworld.reachability[i].traveltype,aasworld.reachability[i].traveltime);
    printf("print|%d|%d|%s",printCount,lastSeverity,lastPrint);
    free(aasworld.vertexes);free(aasworld.edges);free(aasworld.edgeindex);free(aasworld.faces);free(aasworld.faceindex);free(aasworld.areas);free(aasworld.reachability);return 0;
}
