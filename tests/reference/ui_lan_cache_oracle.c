/* Deterministic servercache.dat image using the exact Baseq3 x86 layouts. */
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_GLOBAL_SERVERS 4096
#define MAX_OTHER_SERVERS 128
#define NA_LOOPBACK 2
#define NA_BROADCAST 3
#define NA_IP 4

typedef struct { int32_t type; uint8_t ip[4]; uint8_t ipx[10]; uint16_t port; } netadr_t;
typedef struct {
  netadr_t adr; char hostName[32]; char mapName[32]; char game[32];
  int32_t netType, gameType, clients, maxClients, minPing, maxPing, ping, visible, punkbuster;
} serverInfo_t;

_Static_assert(sizeof(netadr_t) == 20, "Baseq3 netadr_t layout changed");
_Static_assert(sizeof(serverInfo_t) == 152, "Baseq3 serverInfo_t layout changed");
_Static_assert(offsetof(serverInfo_t, hostName) == 20, "hostName offset");
_Static_assert(offsetof(serverInfo_t, netType) == 116, "netType offset");

static uint16_t network_port(unsigned value) { return (uint16_t)(((value & 255u) << 8) | ((value >> 8) & 255u)); }
static void fill(serverInfo_t *s, int type, unsigned a, unsigned b, unsigned c, unsigned d, unsigned port,
                 const char *host, const char *map, const char *game) {
  memset(s, 0, sizeof(*s)); s->adr.type = type; s->adr.ip[0]=(uint8_t)a; s->adr.ip[1]=(uint8_t)b; s->adr.ip[2]=(uint8_t)c; s->adr.ip[3]=(uint8_t)d; s->adr.port=network_port(port);
  strncpy(s->hostName,host,sizeof(s->hostName)-1); strncpy(s->mapName,map,sizeof(s->mapName)-1); strncpy(s->game,game,sizeof(s->game)-1);
}
int main(int argc, char **argv) {
  serverInfo_t *global, *mplayer, *favorite; int32_t ng=2,nm=1,nf=1,size; FILE *out;
  if (argc != 2) return 2;
  global=(serverInfo_t*)calloc(MAX_GLOBAL_SERVERS,sizeof(*global)); mplayer=(serverInfo_t*)calloc(MAX_OTHER_SERVERS,sizeof(*mplayer)); favorite=(serverInfo_t*)calloc(MAX_OTHER_SERVERS,sizeof(*favorite));
  if (!global || !mplayer || !favorite) return 3;
  fill(&global[0],NA_IP,1,2,3,4,27960,"Alpha","q3dm1","baseq3"); global[0].netType=1; global[0].clients=3; global[0].maxClients=8; global[0].minPing=5; global[0].maxPing=250; global[0].ping=42; global[0].visible=0; global[0].punkbuster=1;
  fill(&global[1],NA_IP,10,20,30,40,27961,"Beta","",""); global[1].ping=-1; global[1].visible=1;
  fill(&mplayer[0],NA_LOOPBACK,0,0,0,0,27962,"Legacy","",""); mplayer[0].ping=-1; mplayer[0].visible=1;
  fill(&favorite[0],NA_BROADCAST,255,255,255,255,27963,"Favorite","",""); favorite[0].ping=-1; favorite[0].visible=1;
  size=(int32_t)(MAX_GLOBAL_SERVERS*sizeof(*global)+MAX_OTHER_SERVERS*sizeof(*favorite)+MAX_OTHER_SERVERS*sizeof(*mplayer));
  out=fopen(argv[1],"wb"); if(!out) return 4;
  fwrite(&ng,4,1,out); fwrite(&nm,4,1,out); fwrite(&nf,4,1,out); fwrite(&size,4,1,out);
  fwrite(global,sizeof(*global),MAX_GLOBAL_SERVERS,out); fwrite(mplayer,sizeof(*mplayer),MAX_OTHER_SERVERS,out); fwrite(favorite,sizeof(*favorite),MAX_OTHER_SERVERS,out);
  if(fclose(out)!=0) return 5; free(global); free(mplayer); free(favorite); puts("PASS: Baseq3 servercache oracle"); return 0;
}
