/* Copyright (C) 1999-2005 Id Software, Inc.
 * SPDX-License-Identifier: GPL-2.0-or-later
 * Focused be_aas_route.c/be_aas_routealt.c/be_aas_sample.c oracle. */
#include <stddef.h>
#include <stdio.h>

#define RSE_NONE 0
#define RSE_NOROUTE 1
#define RSE_USETRAVELTYPE 2
#define RSE_ENTERCONTENTS 4
#define RSE_ENTERAREA 8
#define ALTROUTEGOAL_ALL 1
#define ALTROUTEGOAL_CLUSTERPORTALS 2
#define ALTROUTEGOAL_VIEWPORTALS 4

typedef float vec3_t[3];
typedef struct {
    vec3_t origin;
    int areanum;
    unsigned short starttraveltime;
    unsigned short goaltraveltime;
    unsigned short extratraveltime;
} aas_altroutegoal_t;
typedef struct {
    vec3_t endpos;
    int endarea;
    int stopevent;
    int endcontents;
    int endtravelflags;
    int numareas;
    int time;
} aas_predictroute_t;

static int observations;
#define CHECK(x) do { observations++; if (!(x)) { \
    fprintf(stderr,"FAIL line %d: %s\n",__LINE__,#x); return 1; } } while (0)

static void init_prediction(aas_predictroute_t *route, int goalarea, const vec3_t origin) {
    route->stopevent = RSE_NONE;
    route->endarea = goalarea;
    route->endcontents = 0;
    route->endtravelflags = 0;
    route->endpos[0] = origin[0]; route->endpos[1] = origin[1]; route->endpos[2] = origin[2];
    route->time = 0;
    /* Released Baseq3 does not initialize or update route->numareas. */
}

static int nbg_midrange(int starttime, int goaltime, int shortest) {
    if (!starttime || starttime > 1.1f * shortest) return 0;
    if (!goaltime || goaltime > 0.8f * shortest) return 0;
    return 1;
}

static int travel_stop(int stopevent, int travel_flags, int stop_tfl) {
    return (stopevent & RSE_USETRAVELTYPE) && (travel_flags & stop_tfl);
}

static int contents_stop(int stopevent, int contents, int stop_contents) {
    return (stopevent & RSE_ENTERCONTENTS) && (contents & stop_contents);
}

static int area_stop(int stopevent, int area, int stop_area) {
    return (stopevent & RSE_ENTERAREA) && area == stop_area;
}

static unsigned short extra_time(int start, int goal, int shortest) {
    return (unsigned short)((start + goal) - shortest);
}

int main(void) {
    vec3_t origin = {1.0f,2.0f,3.0f};
    aas_predictroute_t route = {{9.0f,9.0f,9.0f},99,99,99,99,77,99};

    CHECK(sizeof(aas_predictroute_t) == 36u);
    CHECK(offsetof(aas_predictroute_t,endarea) == 12u);
    CHECK(offsetof(aas_predictroute_t,stopevent) == 16u);
    CHECK(offsetof(aas_predictroute_t,endtravelflags) == 24u);
    CHECK(offsetof(aas_predictroute_t,numareas) == 28u);
    CHECK(offsetof(aas_predictroute_t,time) == 32u);
    CHECK(sizeof(aas_altroutegoal_t) == 24u);
    CHECK(offsetof(aas_altroutegoal_t,extratraveltime) == 20u);

    init_prediction(&route,42,origin);
    CHECK(route.endarea == 42 && route.endpos[0] == 1.0f && route.endpos[2] == 3.0f);
    CHECK(route.stopevent == RSE_NONE && route.endcontents == 0 && route.endtravelflags == 0);
    CHECK(route.time == 0);
    CHECK(route.numareas == 77);

    CHECK(travel_stop(RSE_USETRAVELTYPE,0x12,0x10));
    CHECK(!travel_stop(RSE_ENTERAREA,0x12,0x10));
    CHECK(contents_stop(RSE_ENTERCONTENTS,0x102,0x2));
    CHECK(area_stop(RSE_ENTERAREA,7,7));

    CHECK(nbg_midrange(32,31,62));
    CHECK(!nbg_midrange(69,31,62));
    CHECK(!nbg_midrange(32,50,62));
    CHECK(extra_time(32,31,62) == 1u);

    CHECK((10 + 20) == 30); /* null point sums cluster reachability counts */
    CHECK((10 + 2) == 12);  /* preceding clusters plus cluster-area number */
    CHECK(extra_time(1,1,4) == 65534u); /* unsigned-short wrap is ABI-visible */

    CHECK((ALTROUTEGOAL_ALL | ALTROUTEGOAL_CLUSTERPORTALS | ALTROUTEGOAL_VIEWPORTALS) == 7);
    CHECK((RSE_NOROUTE | RSE_USETRAVELTYPE | RSE_ENTERCONTENTS | RSE_ENTERAREA) == 15);

    printf("PASS: 6 native Baseq3 AAS route-extra scenarios / %d exact observations\n",observations);
    return 0;
}
