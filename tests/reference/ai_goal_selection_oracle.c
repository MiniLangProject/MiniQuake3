/* Copyright (C) 1999-2005 Id Software, Inc.
 * SPDX-License-Identifier: GPL-2.0-or-later
 * Focused extraction of be_ai_goal.c / be_ai_weight.c released semantics. */
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#define GFL_ITEM 1
#define GFL_DROPPED 4
#define IFL_NOTBOT 8
#define WT_BALANCE 1

typedef float vec3_t[3];
typedef struct {
    vec3_t origin;
    int areanum;
    vec3_t mins, maxs;
    int entitynum, number, flags, iteminfo;
} bot_goal_t;

typedef struct fuzzy_s {
    int index, value, type;
    float weight, minweight, maxweight;
    struct fuzzy_s *child, *next;
} fuzzy_t;

static int observations;
#define CHECK(x) do { observations++; if (!(x)) { \
    fprintf(stderr, "FAIL line %d: %s\n", __LINE__, #x); return 1; } } while (0)

static float normalized(float weight, int travel, float avoid) {
    if (weight <= 0.0f || travel <= 0 || avoid - travel * 0.009f > 0.0f) return 0.0f;
    return weight / ((float)travel * 0.01f);
}

static int nbg_eligible(int travel, float max_time, int return_time, int ltg_time) {
    return travel > 0 && travel < max_time && return_time <= ltg_time;
}

/* Preserve the released VectorAdd(mins, mins), Scale(.5), Add(origin). */
static void released_middle(const bot_goal_t *goal, vec3_t middle) {
    int i;
    for (i = 0; i < 3; ++i) middle[i] = goal->origin[i] + goal->mins[i];
}

static int stale_visible(float fraction, int entitynum, float ltime, float now) {
    return fraction >= 1.0f && entitynum > 0 && ltime < now - 0.5f;
}

static int interbreed(fuzzy_t *one, fuzzy_t *two, fuzzy_t *result) {
    if (one->child) {
        if (!two->child || !result->child) return 0;
        /* This is the exact released Baseq3 argument bug. */
        if (!interbreed(two->child, two->child, result->child)) return 0;
    } else if (one->type == WT_BALANCE) {
        if (two->type != WT_BALANCE || result->type != WT_BALANCE) return 0;
        result->weight = (one->weight + two->weight) / 2.0f;
        if (result->weight > result->maxweight) result->maxweight = result->weight;
        if (result->weight > result->minweight) result->minweight = result->weight;
    }
    if (one->next) {
        if (!two->next || !result->next) return 0;
        if (!interbreed(one->next, two->next, result->next)) return 0;
    }
    return 1;
}

static uint32_t random_seed;
static float baseq3_random(void) {
    random_seed = random_seed * 214013u + 2531011u;
    return (float)((random_seed >> 16) & 0x7fffu) / (float)0x7fff;
}

static void evolve(fuzzy_t *fs) {
    if (fs->child) evolve(fs->child);
    else if (fs->type == WT_BALANCE) {
        if (baseq3_random() < 0.01) fs->weight = (float)(fs->weight + (2.0 * (baseq3_random() - 0.5)) * (fs->maxweight - fs->minweight));
        else fs->weight = (float)(fs->weight + (2.0 * (baseq3_random() - 0.5)) * (fs->maxweight - fs->minweight) * 0.5);
        if (fs->weight < fs->minweight) fs->minweight = fs->weight;
        else if (fs->weight > fs->maxweight) fs->maxweight = fs->weight;
    }
    if (fs->next) evolve(fs->next);
}

static int genetic_selection(int numranks, float *rankings) {
    float sum = 0.0f, select;
    int i, index;
    for (i = 0; i < numranks; ++i) if (rankings[i] >= 0.0f) sum += rankings[i];
    if (sum > 0.0f) {
        select = baseq3_random() * sum;
        (void)select;
        for (i = 0; i < numranks; ++i) if (rankings[i] >= 0.0f) {
            sum -= rankings[i]; if (sum <= 0.0f) return i;
        }
    }
    index = (int)(baseq3_random() * numranks);
    for (i = 0; i < numranks; ++i) {
        if (rankings[index] >= 0.0f) return index;
        index = (index + 1) % numranks;
    }
    return 0;
}

static int genetic_family(int numranks, const float *ranks, int *p1, int *p2, int *child) {
    float rankings[256], max;
    int i, valid = 0;
    if (numranks > 256) { *p1 = *p2 = *child = 0; return 0; }
    for (i = 0; i < numranks; ++i) if (ranks[i] >= 0.0f) ++valid;
    if (valid < 3) { *p1 = *p2 = *child = 0; return 0; }
    memcpy(rankings,ranks,sizeof(float)*(size_t)numranks);
    *p1=genetic_selection(numranks,rankings);rankings[*p1]=-1.0f;
    *p2=genetic_selection(numranks,rankings);rankings[*p2]=-1.0f;
    max=0.0f;for(i=0;i<numranks;++i)if(rankings[i]>=0.0f&&rankings[i]>max)max=rankings[i];
    for(i=0;i<numranks;++i)if(rankings[i]>=0.0f)rankings[i]=max-rankings[i];
    *child=genetic_selection(numranks,rankings);return 1;
}

static int ascii_case_equal(const char *a, const char *b) {
    while (*a && *b) {
        char ca = *a++, cb = *b++;
        if (ca >= 'A' && ca <= 'Z') ca = (char)(ca + ('a' - 'A'));
        if (cb >= 'A' && cb <= 'Z') cb = (char)(cb + ('a' - 'A'));
        if (ca != cb) return 0;
    }
    return *a == *b;
}

int main(void) {
    bot_goal_t goal = {{10.0f,20.0f,30.0f},20,{-2.0f,-4.0f,-6.0f},
                       {2.0f,4.0f,6.0f},22,202,GFL_ITEM,1};
    vec3_t middle;
    fuzzy_t one_leaf = {0,2,WT_BALANCE,2.0f,0.0f,3.0f,NULL,NULL};
    fuzzy_t two_leaf = {0,2,WT_BALANCE,6.0f,0.0f,8.0f,NULL,NULL};
    fuzzy_t out_leaf = {0,2,WT_BALANCE,0.0f,0.0f,3.0f,NULL,NULL};
    fuzzy_t one_child = {0,1,WT_BALANCE,10.0f,0.0f,20.0f,NULL,NULL};
    fuzzy_t two_child = {0,1,WT_BALANCE,30.0f,0.0f,40.0f,NULL,NULL};
    fuzzy_t out_child = {0,1,WT_BALANCE,0.0f,0.0f,1.0f,NULL,NULL};
    fuzzy_t one_top = {0,1,0,0.0f,0.0f,0.0f,&one_child,&one_leaf};
    fuzzy_t two_top = {0,1,0,0.0f,0.0f,0.0f,&two_child,&two_leaf};
    fuzzy_t out_top = {0,1,0,0.0f,0.0f,0.0f,&out_child,&out_leaf};
    fuzzy_t mutation = {0,1,WT_BALANCE,10.0f,0.0f,20.0f,NULL,NULL};
    float ranks[4] = {1.0f,2.0f,3.0f,4.0f};
    int parent1, parent2, child;
    union { float f; uint32_t u; } mutation_bits;

    CHECK(sizeof(bot_goal_t) == 56u);
    CHECK(offsetof(bot_goal_t, areanum) == 12u);
    CHECK(offsetof(bot_goal_t, mins) == 16u);
    CHECK(offsetof(bot_goal_t, maxs) == 28u);
    CHECK(offsetof(bot_goal_t, entitynum) == 40u);
    CHECK(offsetof(bot_goal_t, number) == 44u);
    CHECK(offsetof(bot_goal_t, flags) == 48u);
    CHECK(offsetof(bot_goal_t, iteminfo) == 52u);

    CHECK(normalized(10.0f,100,0.0f) == 10.0f);
    CHECK(normalized(30.0f,200,0.0f) == 15.0f);
    CHECK(normalized(30.0f,200,2.0f) == 0.0f);
    CHECK(normalized(1010.0f,100,0.0f) == 1010.0f); /* DROPPEDWEIGHT */

    CHECK(nbg_eligible(199,200.0f,250,250));
    CHECK(!nbg_eligible(200,200.0f,250,250));
    CHECK(!nbg_eligible(100,200.0f,251,250));

    CHECK(ascii_case_equal("Armor", "armor"));
    CHECK(!ascii_case_equal("Ammo", "Armor"));
    CHECK((IFL_NOTBOT & IFL_NOTBOT) != 0);
    CHECK((goal.flags | GFL_DROPPED) == (GFL_ITEM | GFL_DROPPED));

    released_middle(&goal,middle);
    CHECK(middle[0] == 8.0f && middle[1] == 16.0f && middle[2] == 24.0f);
    CHECK(stale_visible(1.0f,22,8.0f,10.0f));
    CHECK(!stale_visible(1.0f,22,9.5f,10.0f));
    CHECK(!stale_visible(0.5f,22,8.0f,10.0f));

    CHECK(interbreed(&one_top,&two_top,&out_top));
    CHECK(out_child.weight == 30.0f); /* parent two is passed twice for child */
    CHECK(out_leaf.weight == 4.0f);
    CHECK(out_leaf.minweight == 4.0f && out_leaf.maxweight == 4.0f);

    random_seed=1;evolve(&mutation);mutation_bits.f=mutation.weight;
    CHECK(mutation_bits.u == 0x4148b1d2u);
    CHECK(mutation.minweight == 0.0f && mutation.maxweight == 20.0f);
    random_seed=1;CHECK(genetic_family(4,ranks,&parent1,&parent2,&child));
    CHECK(parent1 == 3 && parent2 == 2 && child == 0);
    CHECK(!genetic_family(2,ranks,&parent1,&parent2,&child));
    CHECK(parent1 == 0 && parent2 == 0 && child == 0);
    parent1=9;parent2=9;child=9;CHECK(!genetic_family(257,ranks,&parent1,&parent2,&child));
    CHECK(parent1 == 0 && parent2 == 0 && child == 0);

    printf("PASS: 8 native Baseq3 goal-selection scenarios / %d exact observations\n", observations);
    return 0;
}
