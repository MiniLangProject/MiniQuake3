/* Host for the unchanged Baseq3 animated-image selection routine. */
#include <stdio.h>

#define FUNCTABLE_SIZE 1024
#define FUNCTABLE_SIZE2 10

typedef struct image_s { int id; } image_t;
typedef struct {
    int isVideoMap;
    int videoMapHandle;
    int numImageAnimations;
    float imageAnimationSpeed;
    image_t *image[8];
} textureBundle_t;
typedef void (*stageIteratorFunc_t)(void);
typedef struct shader_s {
    struct shader_s *remappedShader;
    void *stages[8];
    int numUnfoggedPasses;
    stageIteratorFunc_t optimalStageIteratorFunc;
    float clampTime;
    float timeOffset;
} shader_t;
typedef struct {
    int numIndexes;
    int numVertexes;
    shader_t *shader;
    int fogNum;
    int dlightBits;
    void **xstages;
    int numPasses;
    stageIteratorFunc_t currentStageIteratorFunc;
    float shaderTime;
} shaderCommands_t;
typedef struct { struct { float floatTime; } refdef; } backEndData_t;
typedef struct {
    void (*CIN_RunCinematic)(int handle);
    void (*CIN_UploadCinematic)(int handle);
} refimport_t;

static shaderCommands_t tess;
static backEndData_t backEnd;
static int bound_id = -1;
static void no_cinematic(int handle) { (void)handle; }
static refimport_t ri = { no_cinematic, no_cinematic };
static int myftol(float value) { return (int)value; }
static void GL_Bind(image_t *image) { bound_id = image->id; }

#include "shader_entity_time_under_test.inc"

static void run(const char *name, textureBundle_t *bundle, float shader_time) {
    tess.shaderTime = shader_time;
    bound_id = -1;
    R_BindAnimatedImage(bundle);
    printf("%s|%d\n", name, bound_id);
}

static void run_begin(const char *name, float now, float offset, float clamp,
                      int remapped) {
    shader_t source = {0};
    shader_t replacement = {0};
    shader_t *active = &source;
    source.timeOffset = offset;
    source.clampTime = clamp;
    if (remapped) {
        replacement.timeOffset = offset;
        replacement.clampTime = clamp;
        source.remappedShader = &replacement;
        active = &replacement;
    }
    backEnd.refdef.floatTime = now;
    RB_BeginSurface(&source, 3);
    printf("begin-%s|%08x,%d\n", name, *(unsigned *)&tess.shaderTime,
           tess.shader == active);
}

int main(void) {
    image_t images[4] = {{10}, {11}, {12}, {13}};
    textureBundle_t one = {0};
    textureBundle_t four = {0};
    int index;
    one.numImageAnimations = 1;
    one.imageAnimationSpeed = 99.0f;
    one.image[0] = &images[0];
    four.numImageAnimations = 4;
    four.imageAnimationSpeed = 2.0f;
    for (index = 0; index < 4; ++index) four.image[index] = &images[index];
    run("single", &one, 123.0f);
    run("zero", &four, 0.0f);
    run("before-boundary", &four, 0.49f);
    run("boundary", &four, 0.5f);
    run("wrap", &four, 2.0f);
    run("negative", &four, -0.5f);
    run("entity-offset", &four, 1.25f);
    run_begin("plain", 1.5f, 0.0f, 0.0f, 0);
    run_begin("offset", 1.5f, 0.25f, 0.0f, 0);
    run_begin("clamp", 1.5f, 0.0f, 0.75f, 0);
    run_begin("offset-clamp", 1.5f, 0.25f, 1.0f, 0);
    run_begin("negative", 0.1f, 0.5f, 1.0f, 0);
    run_begin("remapped", 2.0f, 0.5f, 1.0f, 1);
    return 0;
}
