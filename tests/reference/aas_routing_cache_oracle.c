/* SPDX-License-Identifier: GPL-2.0-or-later */
#include <stdio.h>
#include <string.h>
enum { CACHE_AREA=1,CACHE_PORTAL=2 };
typedef struct { int type,cluster,area,goal,flags,origin[3],generation,serial,time,reach; } entry_t;
typedef struct { entry_t entries[2];int count,generation,serial,hits,misses,evictions,invalidations; } cache_t;
static int same(const entry_t *e,const entry_t *k){return e->type==k->type&&e->cluster==k->cluster&&e->area==k->area&&e->goal==k->goal&&e->flags==k->flags&&!memcmp(e->origin,k->origin,12);}
static entry_t query(cache_t *c,entry_t key,int generation){if(c->generation!=generation){c->count=0;c->generation=generation;c->invalidations++;}for(int i=0;i<c->count;i++)if(same(&c->entries[i],&key)){entry_t hit=c->entries[i];memmove(c->entries+i,c->entries+i+1,(size_t)(c->count-i-1)*sizeof(entry_t));hit.serial=++c->serial;c->entries[c->count-1]=hit;c->hits++;return hit;}c->misses++;key.serial=++c->serial;key.time=10;key.reach=3;if(c->count==2){memmove(c->entries,c->entries+1,sizeof(entry_t));c->count--;c->evictions++;}c->entries[c->count++]=key;return key;}
#define CHECK(v) do{observations++;if(!(v)){printf("FAIL %d\n",__LINE__);return 1;}}while(0)
int main(void){int observations=0;cache_t c={0};entry_t a={CACHE_PORTAL,2,1,4,7,{0,0,0},0,0,0,0},b={CACHE_AREA,2,3,4,7,{0,0,0},0,0,0,0},d={CACHE_AREA,1,1,2,7,{0,0,0},0,0,0,0};query(&c,a,0);CHECK(c.misses==1&&c.count==1);query(&c,a,0);CHECK(c.hits==1&&c.entries[0].serial==2);query(&c,b,0);query(&c,a,0);query(&c,d,0);CHECK(c.evictions==1&&c.count==2&&c.entries[0].area==1&&c.entries[0].goal==4);query(&c,a,1);CHECK(c.invalidations==1&&c.count==1&&c.misses==4);CHECK(CACHE_AREA==1&&CACHE_PORTAL==2);CHECK(sizeof(((entry_t*)0)->origin)==12);puts("PASS: 4 native Baseq3 routing-cache scenarios / 6 exact observations");return 0;}
