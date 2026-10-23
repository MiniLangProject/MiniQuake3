// SPDX-License-Identifier: GPL-2.0-or-later
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef int qboolean;
typedef struct { int integer; } cvar_t;
typedef struct { int local; char text[64]; } netadr_t;
typedef struct { netadr_t remoteAddress; } netchan_t;
typedef struct client_s { char userinfo[1024]; char name[32]; int rate; int snapshotMsec; netchan_t netchan; } client_t;

static cvar_t dedicatedStore, lanRateStore;
cvar_t *com_dedicated=&dedicatedStore, *sv_lanForceRate=&lanRateStore;

static char values[2][1024];
static int valueSlot;
char *Info_ValueForKey(const char *text,const char *key) {
  const char *at=text;char *out=values[valueSlot++&1];out[0]=0;
  while (*at) { const char *ks,*vs;size_t kn,vn;if(*at=='\\')at++;ks=at;while(*at&&*at!='\\')at++;kn=(size_t)(at-ks);if(!*at)break;at++;vs=at;while(*at&&*at!='\\')at++;vn=(size_t)(at-vs);if(strlen(key)==kn&&!strncmp(ks,key,kn)){memcpy(out,vs,vn);out[vn]=0;return out;} }
  return out;
}
void Info_SetValueForKey(char *text,const char *key,const char *value) {
  char rebuilt[1024]="";const char *at=text;
  while (*at) { const char *ks,*vs;size_t kn,vn;if(*at=='\\')at++;ks=at;while(*at&&*at!='\\')at++;kn=(size_t)(at-ks);if(!*at)break;at++;vs=at;while(*at&&*at!='\\')at++;vn=(size_t)(at-vs);if(strlen(key)!=kn||strncmp(ks,key,kn)){strcat(rebuilt,"\\");strncat(rebuilt,ks,kn);strcat(rebuilt,"\\");strncat(rebuilt,vs,vn);} }
  if (*value) { char joined[1024];snprintf(joined,sizeof(joined),"\\%s\\%s%s",key,value,rebuilt);strcpy(rebuilt,joined); }
  strcpy(text,rebuilt);
}
void Q_strncpyz(char *dst,const char *src,int cap){if(cap<=0)return;strncpy(dst,src,(size_t)cap-1);dst[cap-1]=0;}
int Sys_IsLANAddress(netadr_t address){return address.local;}
int NET_IsLocalAddress(netadr_t address){return address.local;}
char *NET_AdrToString(netadr_t address){static char text[64];strcpy(text,address.text);return text;}

#include "sv_client_userinfo_under_test.inc"

static void run(const char *label,const char *text,int local,int dedicated,int force) {
  client_t client;memset(&client,0,sizeof(client));Q_strncpyz(client.userinfo,text,sizeof(client.userinfo));client.netchan.remoteAddress.local=local;strcpy(client.netchan.remoteAddress.text,"1.2.3.4:27960");com_dedicated->integer=dedicated;sv_lanForceRate->integer=force;SV_UserinfoChanged(&client);
  printf("%s|%s|%d|%d|%s\n",label,client.name,client.rate,client.snapshotMsec,client.userinfo);
}
int main(void){
  run("defaults","\\name\\Ranger",0,0,1);
  run("clamps","\\name\\ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789\\rate\\999999\\snaps\\99\\handicap\\-2",0,2,1);
  run("low","\\name\\Sarge\\rate\\2\\snaps\\0\\handicap\\100",0,0,1);
  run("lan","\\name\\LAN\\rate\\1200\\snaps\\20",1,1,1);
  run("dedicated","\\name\\Net\\rate\\1200\\snaps\\20",1,2,1);
  run("ip-kept","\\name\\Keep\\ip\\9.8.7.6\\rate\\25000\\snaps\\30",0,0,1);
  return 0;
}
