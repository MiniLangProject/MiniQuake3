/* SPDX-License-Identifier: GPL-2.0-or-later */
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#define qtrue 1
#define qfalse 0
#define AAS_MAX_PORTALINDEXSIZE 65536
#define AREACONTENTS_CLUSTERPORTAL 8
#define AREACONTENTS_VIEWPORTAL 512

typedef struct { int contents, areaflags, presencetype, cluster, clusterareanum, numreachableareas, firstreachablearea; } aas_areasettings_t;
typedef struct { int areanum, frontcluster, backcluster, clusterareanum[2]; } aas_portal_t;
typedef int aas_portalindex_t;
typedef struct { int numareas, numreachabilityareas, numportals, firstportal; } aas_cluster_t;
typedef struct {
  int numareas, numportals, portalindexsize, numclusters;
  aas_areasettings_t *areasettings;
  aas_portal_t *portals;
  aas_portalindex_t *portalindex;
  aas_cluster_t *clusters;
} aasworld_t;
static aas_areasettings_t settings[8];
static aas_portal_t portals[8];
static aas_portalindex_t portalindex[16];
static aas_cluster_t clusters[8];
static aasworld_t aasworld;
static void AAS_Error(const char *fmt, ...) { (void)fmt; }
static void Log_Write(const char *fmt, ...) { (void)fmt; }

#include "be_aas_cluster_under_test.inc"

static void reset_world(void) {
  memset(settings, 0, sizeof(settings)); memset(portals, 0, sizeof(portals));
  memset(portalindex, 0, sizeof(portalindex)); memset(clusters, 0, sizeof(clusters));
  aasworld.numareas=6; aasworld.areasettings=settings; aasworld.numportals=3;
  aasworld.portals=portals; aasworld.portalindex=portalindex; aasworld.clusters=clusters;
  aasworld.portalindexsize=0; aasworld.numclusters=4;
}

int main(void) {
  reset_world(); settings[1].cluster=1; settings[2].cluster=2; settings[3].cluster=2; settings[4].cluster=1;
  AAS_ClearCluster(2); printf("clear:%d,%d,%d,%d\n",settings[1].cluster,settings[2].cluster,settings[3].cluster,settings[4].cluster);
  AAS_RemoveClusterAreas(); printf("remove:%d,%d\n",settings[1].cluster,settings[4].cluster);
  portals[1].areanum=2;portals[1].frontcluster=1;portals[1].backcluster=2;portals[2].areanum=4;portals[2].frontcluster=2;portals[2].backcluster=3;
  AAS_RemovePortalsClusterReference(2);printf("refs:%d,%d,%d,%d\n",portals[1].frontcluster,portals[1].backcluster,portals[2].frontcluster,portals[2].backcluster);
  reset_world();portals[1].areanum=2;clusters[1].firstportal=0;clusters[2].firstportal=1;
  AAS_UpdatePortal(2,1);AAS_UpdatePortal(2,2);printf("update:%d,%d,%d,%d,%d\n",portals[1].frontcluster,portals[1].backcluster,settings[2].cluster,clusters[1].numportals,clusters[2].numportals);
  clusters[1].numareas=3;clusters[1].firstportal=0;clusters[1].numportals=1;portalindex[0]=1;AAS_NumberClusterPortals(1);printf("number:%d,%d\n",portals[1].clusterareanum[0],clusters[1].numareas);
  settings[1].contents=AREACONTENTS_CLUSTERPORTAL;settings[2].contents=AREACONTENTS_CLUSTERPORTAL;AAS_CreateViewPortals();AAS_RemoveAllPortals();AAS_SetViewPortalsAsClusterPortals();printf("view:%d,%d\n",settings[1].contents,settings[2].contents);
  settings[2].contents|=AREACONTENTS_CLUSTERPORTAL;portals[1].areanum=2;portals[1].frontcluster=1;portals[1].backcluster=0;printf("test:%d,",AAS_TestPortals());printf("%d\n",settings[2].contents);
  return 0;
}
