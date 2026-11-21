/* SPDX-License-Identifier: GPL-2.0-or-later
 * Hardware consumer of the retained 128-byte MiniLang batch ABI. All game,
 * shader, animation and visibility decisions remain owned by MiniLang.
 * The compatibility GL context supplies clipping and perspective interpolation.
 */
#define MQ_GL_TEXTURE0 0x84C0
#define MQ_GL_TEXTURE1 0x84C1
#define MQ_GL_ACTIVE_TEXTURE 0x84E0
#define MQ_GL_CLAMP_TO_EDGE 0x812F
#define MQ_GL_MAX_TEXTURE_UNITS 0x84E2
#define MQ_GL_CLIENT_ACTIVE_TEXTURE 0x84E1
#define MQ_GL_ARRAY_BUFFER_BINDING 0x8894
#define MQ_GL_ARRAY_BUFFER 0x8892
#define MQ_GL_SECONDARY_COLOR_ARRAY 0x845E
#define MQ_GL_FOG_COORD_ARRAY 0x8457
#define HARDWARE_PACK_TRIANGLES 4096

#define MQ_GL_PROC(ret,name,args) typedef ret (APIENTRY *mq_##name##_proc) args; static mq_##name##_proc mq_##name
MQ_GL_PROC(void,glBegin,(GLenum));
MQ_GL_PROC(void,glEnd,(void));
MQ_GL_PROC(void,glVertex4d,(GLdouble,GLdouble,GLdouble,GLdouble));
MQ_GL_PROC(void,glVertex3fv,(const GLfloat *));
MQ_GL_PROC(void,glLoadMatrixd,(const GLdouble *));
MQ_GL_PROC(void,glColor4d,(GLdouble,GLdouble,GLdouble,GLdouble));
MQ_GL_PROC(void,glMultiTexCoord2f,(GLenum,GLfloat,GLfloat));
MQ_GL_PROC(void,glActiveTexture,(GLenum));
MQ_GL_PROC(void,glClientActiveTexture,(GLenum));
MQ_GL_PROC(void,glVertexPointer,(GLint,GLenum,GLsizei,const GLvoid *));
MQ_GL_PROC(void,glColorPointer,(GLint,GLenum,GLsizei,const GLvoid *));
MQ_GL_PROC(void,glTexCoordPointer,(GLint,GLenum,GLsizei,const GLvoid *));
MQ_GL_PROC(void,glEnableClientState,(GLenum));
MQ_GL_PROC(void,glDisableClientState,(GLenum));
MQ_GL_PROC(void,glDrawArrays,(GLenum,GLint,GLsizei));
MQ_GL_PROC(void,glPushClientAttrib,(GLbitfield));
MQ_GL_PROC(void,glPopClientAttrib,(void));
MQ_GL_PROC(void,glPushAttrib,(GLbitfield));
MQ_GL_PROC(void,glPopAttrib,(void));
MQ_GL_PROC(void,glBindBuffer,(GLenum,GLuint));
MQ_GL_PROC(void,glSecondaryColorPointer,(GLint,GLenum,GLsizei,const GLvoid *));
MQ_GL_PROC(void,glFogCoordPointer,(GLenum,GLsizei,const GLvoid *));
MQ_GL_PROC(void,glEnable,(GLenum));
MQ_GL_PROC(void,glDisable,(GLenum));
MQ_GL_PROC(void,glDepthFunc,(GLenum));
MQ_GL_PROC(void,glDepthMask,(GLboolean));
MQ_GL_PROC(void,glDepthRange,(GLclampd,GLclampd));
MQ_GL_PROC(void,glClearDepth,(GLclampd));
MQ_GL_PROC(void,glColorMask,(GLboolean,GLboolean,GLboolean,GLboolean));
MQ_GL_PROC(void,glBlendFunc,(GLenum,GLenum));
MQ_GL_PROC(void,glBlendFuncSeparate,(GLenum,GLenum,GLenum,GLenum));
MQ_GL_PROC(void,glAlphaFunc,(GLenum,GLclampf));
MQ_GL_PROC(void,glPolygonOffset,(GLfloat,GLfloat));
MQ_GL_PROC(void,glCullFace,(GLenum));
MQ_GL_PROC(void,glFrontFace,(GLenum));
MQ_GL_PROC(void,glScissor,(GLint,GLint,GLsizei,GLsizei));
MQ_GL_PROC(void,glStencilFunc,(GLenum,GLint,GLuint));
MQ_GL_PROC(void,glStencilOp,(GLenum,GLenum,GLenum));
MQ_GL_PROC(void,glStencilMask,(GLuint));
MQ_GL_PROC(void,glClearStencil,(GLint));
MQ_GL_PROC(void,glGenTextures,(GLsizei,GLuint *));
MQ_GL_PROC(void,glDeleteTextures,(GLsizei,const GLuint *));
MQ_GL_PROC(void,glBindTexture,(GLenum,GLuint));
MQ_GL_PROC(void,glTexParameteri,(GLenum,GLenum,GLint));
MQ_GL_PROC(void,glTexEnvi,(GLenum,GLenum,GLint));
MQ_GL_PROC(void,glTexImage2D,(GLenum,GLint,GLint,GLsizei,GLsizei,GLint,GLenum,GLenum,const GLvoid *));
MQ_GL_PROC(void,glReadPixels,(GLint,GLint,GLsizei,GLsizei,GLenum,GLenum,GLvoid *));
MQ_GL_PROC(void,glReadBuffer,(GLenum));
MQ_GL_PROC(void,glGetIntegerv,(GLenum,GLint *));
MQ_GL_PROC(void,glGetDoublev,(GLenum,GLdouble *));
MQ_GL_PROC(GLenum,glGetError,(void));
#undef MQ_GL_PROC

static int hardwareRenderer;
static GLuint hardwareTextures[PLAYABLE_TEXTURE_SLOTS];
static unsigned int hardwareDrawCalls;
static unsigned int hardwareTriangles;
static double hardwareNear = 1.0;
/* Keep the exact double position/color values sent by the immediate path.
 * Unlike the retained triangle ABI these records have a uniform vertex stride.
 * Packing is bounded to one 4096-triangle chunk and reused between frames. */
typedef struct hardwarePackedVertex_s {
    GLdouble position[4], color[4];
    GLfloat baseUV[2], lightmapUV[2];
} hardwarePackedVertex;
typedef struct hardwarePackedState_s { int base, lightmap, overlay; } hardwarePackedState;
static hardwarePackedVertex *hardwarePackedVertices;
static hardwarePackedState *hardwarePackedStates;
static int hardwarePackedCapacity;
static GLint hardwareClientTextureUnits;

/* Opt-in CPU timing. The normal path performs no profile clock queries or
 * file I/O. Records are bounded, retained in native memory and written once
 * during shutdown, after rendering has finished. */
#define HARDWARE_PROFILE_MAX_FRAMES 4096
#ifndef MQ3_PROFILE_COUNTER
#define MQ3_PROFILE_COUNTER QueryPerformanceCounter
#endif
typedef struct hardwareProfileFrame_s {
    LONGLONG span,draw,swap;
    unsigned int drawCalls,triangles;
} hardwareProfileFrame;
typedef struct hardwareProfile_s {
    int enabled,frameActive;
    char path[32768];
    LONGLONG frequency,frameStarted,frameDraw;
    LONGLONG totalSpan,totalDraw,totalSwap;
    unsigned int frameCount;
    hardwareProfileFrame frames[HARDWARE_PROFILE_MAX_FRAMES];
} hardwareProfileState;
static hardwareProfileState hardwareProfile;
static LONGLONG hardwareProfileCounter(void) {
    LARGE_INTEGER value;
    MQ3_PROFILE_COUNTER(&value);return value.QuadPart;
}
static void hardwareProfileInitialize(void) {
    LARGE_INTEGER frequency;
    DWORD length;
    char requested[32];
    hardwareProfile.enabled=hardwareProfile.frameActive=0;
    hardwareProfile.frameCount=0;
    hardwareProfile.totalSpan=hardwareProfile.totalDraw=hardwareProfile.totalSwap=0;
    hardwareProfile.frameDraw=0;
    hardwareProfile.path[0]=0;
    length=GetEnvironmentVariableA("MQ3_RENDER_PROFILE",requested,sizeof(requested));
    if(!length || length>=sizeof(requested) || _stricmp(requested,"0")==0) return;
    length=GetEnvironmentVariableA("MQ3_RENDER_PROFILE_FILE",hardwareProfile.path,sizeof(hardwareProfile.path));
    if(length>=sizeof(hardwareProfile.path)) hardwareProfile.path[0]=0;
    if(!QueryPerformanceFrequency(&frequency) || frequency.QuadPart<=0) { hardwareProfile.path[0]=0;return; }
    hardwareProfile.frequency=frequency.QuadPart;hardwareProfile.enabled=1;
}
static void hardwareProfilePresent(LONGLONG swapStarted,LONGLONG finished) {
    LONGLONG span,swap;
    if(!hardwareProfile.frameActive) return;
    span=finished-hardwareProfile.frameStarted;swap=finished-swapStarted;
    if(hardwareProfile.frameCount<HARDWARE_PROFILE_MAX_FRAMES) {
        hardwareProfileFrame *frame=&hardwareProfile.frames[hardwareProfile.frameCount];
        frame->span=span;frame->draw=hardwareProfile.frameDraw;frame->swap=swap;
        frame->drawCalls=hardwareDrawCalls;frame->triangles=hardwareTriangles;
    }
    hardwareProfile.totalSpan+=span;hardwareProfile.totalDraw+=hardwareProfile.frameDraw;hardwareProfile.totalSwap+=swap;
    ++hardwareProfile.frameCount;hardwareProfile.frameActive=0;
}
static void hardwareProfileDump(void) {
    FILE *file=stderr;
    unsigned int index,recorded=hardwareProfile.frameCount;
    double scale;
    if(!hardwareProfile.enabled) return;
    hardwareProfile.enabled=hardwareProfile.frameActive=0;
    if(hardwareProfile.path[0]) {
        FILE *requested=0;
        if(!fopen_s(&requested,hardwareProfile.path,"wb") && requested) file=requested;
    }
    scale=1000.0/hardwareProfile.frequency;
    if(recorded>HARDWARE_PROFILE_MAX_FRAMES) recorded=HARDWARE_PROFILE_MAX_FRAMES;
    fprintf(file,"MQ3_RENDER_PROFILE version=1 frames=%u recorded=%u maxRecords=%u\n",
        hardwareProfile.frameCount,recorded,HARDWARE_PROFILE_MAX_FRAMES);
    fprintf(file,"SCOPE CPU timings only; nativeDraw=hardwareDrawBatch; swap=SwapBuffers; span=hardwareBeginFrame-through-present; outsideDrawSwap includes MiniLang and other native work, not GPU time\n");
    for(index=0;index<recorded;++index) {
        const hardwareProfileFrame *frame=&hardwareProfile.frames[index];
        fprintf(file,"FRAME index=%u spanMs=%.9f nativeDrawMs=%.9f swapMs=%.9f outsideDrawSwapMs=%.9f drawCalls=%u triangles=%u\n",
            index,frame->span*scale,frame->draw*scale,frame->swap*scale,
            (frame->span-frame->draw-frame->swap)*scale,frame->drawCalls,frame->triangles);
    }
    fprintf(file,"TOTAL frames=%u spanMs=%.9f nativeDrawMs=%.9f swapMs=%.9f outsideDrawSwapMs=%.9f\n",
        hardwareProfile.frameCount,hardwareProfile.totalSpan*scale,hardwareProfile.totalDraw*scale,
        hardwareProfile.totalSwap*scale,(hardwareProfile.totalSpan-hardwareProfile.totalDraw-hardwareProfile.totalSwap)*scale);
    if(file!=stderr) fclose(file);else fflush(file);hardwareProfile.path[0]=0;
}

static int hardwareEnsurePacking(int triangles) {
    hardwarePackedVertex *replacement;
    SIZE_T bytes;
    int capacity = hardwarePackedCapacity ? hardwarePackedCapacity : 64;
    if (triangles < 1 || triangles > HARDWARE_PACK_TRIANGLES) return 0;
    if (triangles <= hardwarePackedCapacity) return 1;
    while (capacity < triangles) capacity *= 2;
    if (capacity > HARDWARE_PACK_TRIANGLES) capacity = HARDWARE_PACK_TRIANGLES;
    bytes = (SIZE_T)capacity * (3u * sizeof(hardwarePackedVertex) + sizeof(hardwarePackedState));
    replacement = hardwarePackedVertices ? (hardwarePackedVertex *)HeapReAlloc(GetProcessHeap(),0,hardwarePackedVertices,bytes) :
        (hardwarePackedVertex *)HeapAlloc(GetProcessHeap(),0,bytes);
    if (!replacement) return 0;
    hardwarePackedVertices = replacement;
    hardwarePackedStates = (hardwarePackedState *)(hardwarePackedVertices + (SIZE_T)capacity * 3u);
    hardwarePackedCapacity = capacity;
    return 1;
}

static FARPROC hardwareProc(const char *name) {
    PROC extension = playableWglGetProcAddress(name);
    if (extension && extension != (PROC)1 && extension != (PROC)2 &&
            extension != (PROC)3 && extension != (PROC)-1) return (FARPROC)extension;
    return GetProcAddress(openGLModule, name);
}

static int initializeHardwareRenderer(void) {
    char renderer[32];
    GLint units = 0;
#pragma warning(push)
#pragma warning(disable:4191)
#define MQ_GL_LOAD(name) mq_##name = (mq_##name##_proc)hardwareProc(#name); if (!mq_##name) return 0
    MQ_GL_LOAD(glBegin); MQ_GL_LOAD(glEnd); MQ_GL_LOAD(glVertex4d); MQ_GL_LOAD(glVertex3fv); MQ_GL_LOAD(glLoadMatrixd); MQ_GL_LOAD(glColor4d);
    MQ_GL_LOAD(glVertexPointer); MQ_GL_LOAD(glColorPointer); MQ_GL_LOAD(glTexCoordPointer);
    MQ_GL_LOAD(glEnableClientState); MQ_GL_LOAD(glDisableClientState); MQ_GL_LOAD(glDrawArrays);
    MQ_GL_LOAD(glPushClientAttrib); MQ_GL_LOAD(glPopClientAttrib); MQ_GL_LOAD(glPushAttrib); MQ_GL_LOAD(glPopAttrib);
    MQ_GL_LOAD(glEnable); MQ_GL_LOAD(glDisable); MQ_GL_LOAD(glDepthFunc); MQ_GL_LOAD(glDepthMask);
    MQ_GL_LOAD(glDepthRange); MQ_GL_LOAD(glClearDepth); MQ_GL_LOAD(glColorMask); MQ_GL_LOAD(glBlendFunc);
    MQ_GL_LOAD(glAlphaFunc); MQ_GL_LOAD(glPolygonOffset); MQ_GL_LOAD(glCullFace); MQ_GL_LOAD(glFrontFace);
    MQ_GL_LOAD(glScissor); MQ_GL_LOAD(glStencilFunc); MQ_GL_LOAD(glStencilOp); MQ_GL_LOAD(glStencilMask);
    MQ_GL_LOAD(glClearStencil); MQ_GL_LOAD(glGenTextures); MQ_GL_LOAD(glDeleteTextures); MQ_GL_LOAD(glBindTexture);
    MQ_GL_LOAD(glTexParameteri); MQ_GL_LOAD(glTexEnvi); MQ_GL_LOAD(glTexImage2D);
    MQ_GL_LOAD(glReadPixels); MQ_GL_LOAD(glReadBuffer); MQ_GL_LOAD(glGetIntegerv); MQ_GL_LOAD(glGetDoublev); MQ_GL_LOAD(glGetError);
    mq_glActiveTexture = (mq_glActiveTexture_proc)hardwareProc("glActiveTexture");
    if (!mq_glActiveTexture) mq_glActiveTexture = (mq_glActiveTexture_proc)hardwareProc("glActiveTextureARB");
    mq_glMultiTexCoord2f = (mq_glMultiTexCoord2f_proc)hardwareProc("glMultiTexCoord2f");
    if (!mq_glMultiTexCoord2f) mq_glMultiTexCoord2f = (mq_glMultiTexCoord2f_proc)hardwareProc("glMultiTexCoord2fARB");
    mq_glClientActiveTexture = (mq_glClientActiveTexture_proc)hardwareProc("glClientActiveTexture");
    if (!mq_glClientActiveTexture) mq_glClientActiveTexture = (mq_glClientActiveTexture_proc)hardwareProc("glClientActiveTextureARB");
    mq_glBindBuffer = (mq_glBindBuffer_proc)hardwareProc("glBindBuffer");
    if (!mq_glBindBuffer) mq_glBindBuffer = (mq_glBindBuffer_proc)hardwareProc("glBindBufferARB");
    mq_glSecondaryColorPointer = (mq_glSecondaryColorPointer_proc)hardwareProc("glSecondaryColorPointer");
    mq_glFogCoordPointer = (mq_glFogCoordPointer_proc)hardwareProc("glFogCoordPointer");
    mq_glBlendFuncSeparate = (mq_glBlendFuncSeparate_proc)hardwareProc("glBlendFuncSeparate");
#undef MQ_GL_LOAD
#pragma warning(pop)
    if (!mq_glActiveTexture || !mq_glMultiTexCoord2f || !mq_glClientActiveTexture) return 0;
    mq_glGetIntegerv(MQ_GL_MAX_TEXTURE_UNITS, &units);
    if (units < 2) return 0;
    hardwareClientTextureUnits = units;
    if (GetEnvironmentVariableA("MQ3_RENDERER", renderer, sizeof(renderer)) &&
            _stricmp(renderer, "software") == 0) return 0;
    ZeroMemory(hardwareTextures, sizeof(hardwareTextures));
    hardwareRenderer = 1;
    hardwareProfileInitialize();
    return 1;
}

static void hardwareReleaseTexture(int slot) {
    if (hardwareRenderer && hardwareTextures[slot]) mq_glDeleteTextures(1, &hardwareTextures[slot]);
    hardwareTextures[slot] = 0;
}
static void shutdownHardwareRenderer(void) {
    int slot;
    hardwareProfileDump();
    for (slot = 0; slot < PLAYABLE_TEXTURE_SLOTS; ++slot) hardwareReleaseTexture(slot);
    if (hardwarePackedVertices) HeapFree(GetProcessHeap(),0,hardwarePackedVertices);
    hardwarePackedVertices = 0; hardwarePackedStates = 0; hardwarePackedCapacity = 0;
    hardwareRenderer = 0;
}
static const GLenum hardwareTextureMinFilters[] = {GL_NEAREST,GL_LINEAR,GL_NEAREST_MIPMAP_NEAREST,
    GL_LINEAR_MIPMAP_NEAREST,GL_NEAREST_MIPMAP_LINEAR,GL_LINEAR_MIPMAP_LINEAR};
static const GLenum hardwareTextureMagFilters[] = {GL_NEAREST,GL_LINEAR,GL_NEAREST,GL_LINEAR,GL_NEAREST,GL_LINEAR};
static int hardwareTextureMode = 3;

static void hardwareTextureFilters(const playableTexture *texture) {
    GLenum min = texture->mipmapped ? hardwareTextureMinFilters[hardwareTextureMode] : GL_LINEAR;
    GLenum mag = texture->mipmapped ? hardwareTextureMagFilters[hardwareTextureMode] : GL_LINEAR;
    mq_glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, min);
    mq_glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, mag);
}

static void hardwareSetTextureMode(int mode) {
    GLint previousActive, previousBinding;
    int slot;
    if (mode < 0 || mode > 5 || mode == hardwareTextureMode) return;
    hardwareTextureMode = mode;
    if (!hardwareRenderer) return;
    mq_glGetIntegerv(MQ_GL_ACTIVE_TEXTURE, &previousActive);
    mq_glActiveTexture(MQ_GL_TEXTURE0);
    mq_glGetIntegerv(GL_TEXTURE_BINDING_2D, &previousBinding);
    for (slot = 0; slot < PLAYABLE_TEXTURE_SLOTS; ++slot) {
        if (!hardwareTextures[slot] || !textures[slot].mipmapped) continue;
        mq_glBindTexture(GL_TEXTURE_2D, hardwareTextures[slot]);
        hardwareTextureFilters(&textures[slot]);
    }
    mq_glBindTexture(GL_TEXTURE_2D, (GLuint)previousBinding);
    mq_glActiveTexture((GLenum)previousActive);
}

static void hardwareUploadTexture(int slot) {
    playableTexture *texture = &textures[slot];
    int level;
    GLint previousActive;
    GLint previousBinding;
    if (!hardwareRenderer || !texture->pixels) return;
    if (!hardwareTextures[slot]) mq_glGenTextures(1, &hardwareTextures[slot]);
    mq_glGetIntegerv(MQ_GL_ACTIVE_TEXTURE, &previousActive);
    mq_glActiveTexture(MQ_GL_TEXTURE0);
    mq_glGetIntegerv(GL_TEXTURE_BINDING_2D, &previousBinding);
    mq_glBindTexture(GL_TEXTURE_2D, hardwareTextures[slot]);
    playableGlPixelStorei(GL_UNPACK_ALIGNMENT, 4);
    mq_glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, texture->width, texture->height,
        0, GL_BGRA_EXT, GL_UNSIGNED_BYTE, texture->pixels);
    for (level = 1; level < texture->mipLevelCount; ++level)
        mq_glTexImage2D(GL_TEXTURE_2D, level, GL_RGBA, texture->mipWidths[level-1],
            texture->mipHeights[level-1], 0, GL_BGRA_EXT, GL_UNSIGNED_BYTE, texture->mipPixels[level-1]);
    hardwareTextureFilters(texture);
    /* A lazy upload requested while configuring TMU1 must not overwrite the
     * base texture already bound on TMU0. Public uploads are state-neutral too. */
    mq_glBindTexture(GL_TEXTURE_2D, (GLuint)previousBinding);
    mq_glActiveTexture((GLenum)previousActive);
}
static void hardwareTextureUnit(GLenum unit, int slot) {
    mq_glActiveTexture(unit);
    if (slot >= 0 && slot < PLAYABLE_TEXTURE_SLOTS && textures[slot].pixels) {
        if (!hardwareTextures[slot]) hardwareUploadTexture(slot);
        mq_glActiveTexture(unit);
        mq_glEnable(GL_TEXTURE_2D);
        mq_glBindTexture(GL_TEXTURE_2D, hardwareTextures[slot]);
        mq_glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, rasterClampTexture ? MQ_GL_CLAMP_TO_EDGE : GL_REPEAT);
        mq_glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, rasterClampTexture ? MQ_GL_CLAMP_TO_EDGE : GL_REPEAT);
        mq_glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
    } else mq_glDisable(GL_TEXTURE_2D);
}
static GLenum hardwareSourceFactor(int factor) {
    static const GLenum factors[] = {GL_ZERO,GL_ZERO,GL_ONE,GL_DST_COLOR,GL_ONE_MINUS_DST_COLOR,
        GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA,GL_DST_ALPHA,GL_ONE_MINUS_DST_ALPHA,GL_SRC_ALPHA_SATURATE};
    return factors[factor >= 1 && factor <= 9 ? factor : 0];
}
static GLenum hardwareDestinationFactor(int factor) {
    static const GLenum factors[] = {GL_ZERO,GL_ZERO,GL_ONE,GL_SRC_COLOR,GL_ONE_MINUS_SRC_COLOR,
        GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA,GL_DST_ALPHA,GL_ONE_MINUS_DST_ALPHA};
    return factors[factor >= 1 && factor <= 8 ? factor : 0];
}
static void hardwareState(int overlay) {
    GLenum source = GL_SRC_ALPHA, destination = GL_ONE_MINUS_SRC_ALPHA;
    if (overlay) mq_glDisable(GL_DEPTH_TEST); else mq_glEnable(GL_DEPTH_TEST);
    mq_glDepthFunc(rasterDepthEqual ? GL_EQUAL : GL_LEQUAL);
    mq_glDepthMask(rasterDepthWrite ? GL_TRUE : GL_FALSE);
    mq_glDepthRange(0.0, rasterDepthRangeScale);
    if (rasterBlendMode == 0) mq_glDisable(GL_BLEND);
    else {
        if (rasterBlendMode & 0x100) {
            source = hardwareSourceFactor(rasterBlendMode & 15);
            destination = hardwareDestinationFactor((rasterBlendMode >> 4) & 15);
        } else switch (rasterBlendMode) {
            case 2: source = GL_ONE; destination = GL_ONE; break;
            case 3: source = GL_DST_COLOR; destination = GL_ZERO; break;
            case 4: source = GL_DST_COLOR; destination = GL_ONE_MINUS_DST_ALPHA; break;
            case 5: source = GL_DST_COLOR; destination = GL_ONE; break;
            case 6: source = GL_ZERO; destination = GL_ONE_MINUS_SRC_COLOR; break;
            case 7: source = GL_ONE; break;
        }
        mq_glEnable(GL_BLEND); mq_glBlendFunc(source, destination);
    }
    if (rasterAlphaTest) {
        mq_glEnable(GL_ALPHA_TEST);
        mq_glAlphaFunc(rasterAlphaTest == 1 ? GL_GREATER : rasterAlphaTest == 2 ? GL_LESS : GL_GEQUAL,
            rasterAlphaTest == 1 ? 0.0f : 0.5f);
    } else mq_glDisable(GL_ALPHA_TEST);
    if (rasterPolygonOffset) { mq_glEnable(GL_POLYGON_OFFSET_FILL); mq_glPolygonOffset(-1.0f,-2.0f); }
    else mq_glDisable(GL_POLYGON_OFFSET_FILL);
    if (rasterStencilPass) {
        mq_glEnable(GL_STENCIL_TEST); mq_glStencilMask(255); mq_glStencilFunc(GL_ALWAYS,0,255);
        mq_glStencilOp(GL_KEEP,GL_KEEP,(rasterStencilPass == 1 || rasterStencilPass == 3) ? GL_INCR : GL_DECR);
        mq_glEnable(GL_CULL_FACE); mq_glFrontFace(GL_CCW);
        mq_glCullFace((rasterStencilPass == 1 || rasterStencilPass == 4) ? GL_BACK : GL_FRONT);
        mq_glColorMask(GL_FALSE,GL_FALSE,GL_FALSE,GL_FALSE);
    } else {
        /* The retained ABI does not yet carry each shader's cullType or the
         * ordinary mirror-cull policy. Only stencil-volume culling is wired;
         * regular surfaces remain two-sided pending that integration. */
        mq_glDisable(GL_STENCIL_TEST); mq_glDisable(GL_CULL_FACE);
        mq_glColorMask(GL_TRUE,GL_TRUE,GL_TRUE,GL_TRUE);
    }
}

typedef struct hardwareView_s {
    int x,y,width,height;
    double position[3],right[3],up[3],forward[3],focal,nearDistance;
} hardwareView;

static int hardwareDrawBatch(const unsigned char *records, int count, const hardwareView *view) {
    int offset, unit;
    int scissorX=0, scissorY=0, scissorWidth=surfaceWidth, scissorHeight=surfaceHeight;
    LONGLONG profileStarted=0;
    int lastBase = INT_MIN, lastLightmap = INT_MIN, lastOverlay = -1;
    GLint previousClientTexture, previousArrayBuffer = 0;
    int chunkCapacity = count < HARDWARE_PACK_TRIANGLES ? count : HARDWARE_PACK_TRIANGLES;
    if(hardwareProfile.enabled && hardwareProfile.frameActive) profileStarted=hardwareProfileCounter();
    if (!hardwareRenderer || !records || count <= 0 || surfaceWidth <= 0 || surfaceHeight <= 0 ||
            (view && (view->width <= 0 || view->height <= 0)) || !hardwareEnsurePacking(chunkCapacity)) return 0;
    if (view && !clipSurfaceRectangle(view->x,view->y,view->width,view->height,
            &scissorX,&scissorY,&scissorWidth,&scissorHeight)) return 0;
    if (!scissorWidth || !scissorHeight) return count;
    playableTraceBatch(records,count,view ? view->x : 0,view ? view->y : 0,
        view ? view->width : surfaceWidth,view ? view->height : surfaceHeight,
        view ? view->position : 0,view ? view->right : 0,view ? view->up : 0,view ? view->forward : 0,
        view ? view->focal : 0,view ? view->nearDistance : 0);
    playableGlViewport(view ? view->x : 0, view ? (int)((LONGLONG)surfaceHeight-view->y-view->height) : 0,
        view ? view->width : surfaceWidth, view ? view->height : surfaceHeight);
    mq_glEnable(GL_SCISSOR_TEST);
    mq_glScissor(scissorX,surfaceHeight-scissorY-scissorHeight,scissorWidth,scissorHeight);
    playableGlMatrixMode(GL_PROJECTION); playableGlLoadIdentity();
    playableGlMatrixMode(GL_MODELVIEW); playableGlLoadIdentity();
    if (view) {
        GLdouble matrix[16];
        double sx=view->focal*2.0/view->width, sy=view->focal*2.0/view->height;
        double side=0,up=0,forward=0;
        int axis;
        for (axis=0;axis<3;++axis) {
            matrix[axis*4]=view->right[axis]*sx;matrix[axis*4+1]=view->up[axis]*sy;
            matrix[axis*4+2]=matrix[axis*4+3]=view->forward[axis];
            side+=view->position[axis]*view->right[axis];up+=view->position[axis]*view->up[axis];
            forward+=view->position[axis]*view->forward[axis];
        }
        hardwareNear=view->nearDistance;
        matrix[12]=-side*sx;matrix[13]=-up*sy;matrix[14]=-forward-2.0*hardwareNear;matrix[15]=-forward;
        playableGlMatrixMode(GL_PROJECTION);mq_glLoadMatrixd(matrix);
        playableGlMatrixMode(GL_MODELVIEW);
    }
    /* Array pointers and enables belong to the caller. In particular an old
     * VBO binding would reinterpret our host pointers as buffer offsets. */
    mq_glGetIntegerv(MQ_GL_CLIENT_ACTIVE_TEXTURE,&previousClientTexture);
    if (mq_glBindBuffer) mq_glGetIntegerv(MQ_GL_ARRAY_BUFFER_BINDING,&previousArrayBuffer);
    mq_glPushClientAttrib(GL_CLIENT_VERTEX_ARRAY_BIT);
    mq_glPushAttrib(GL_CURRENT_BIT);
    if (mq_glBindBuffer) mq_glBindBuffer(MQ_GL_ARRAY_BUFFER,0);
    mq_glEnableClientState(GL_VERTEX_ARRAY); mq_glEnableClientState(GL_COLOR_ARRAY);
    mq_glDisableClientState(GL_NORMAL_ARRAY); mq_glDisableClientState(GL_INDEX_ARRAY);
    mq_glDisableClientState(GL_EDGE_FLAG_ARRAY);
    if (mq_glSecondaryColorPointer) mq_glDisableClientState(MQ_GL_SECONDARY_COLOR_ARRAY);
    if (mq_glFogCoordPointer) mq_glDisableClientState(MQ_GL_FOG_COORD_ARRAY);
    for (unit=0;unit<hardwareClientTextureUnits;++unit) {
        mq_glClientActiveTexture(MQ_GL_TEXTURE0+(GLenum)unit);
        if (unit < 2) mq_glEnableClientState(GL_TEXTURE_COORD_ARRAY);
        else mq_glDisableClientState(GL_TEXTURE_COORD_ARRAY);
    }
    for (offset=0;offset<count;) {
        int chunk=count-offset, index, vertex, group;
        if (chunk>HARDWARE_PACK_TRIANGLES) chunk=HARDWARE_PACK_TRIANGLES;
        for (index=0;index<chunk;++index) {
            playableTriangleBatchRecord command;
            hardwarePackedState *state=&hardwarePackedStates[index];
            int textured;
            memcpy(&command,records+(SIZE_T)(offset+index)*sizeof(command),sizeof(command));
            state->base=command.baseTextureSlot;state->lightmap=command.lightmapTextureSlot;
            state->overlay=!view && command.vertex[0][2]<0.01f && command.vertex[1][2]<0.01f && command.vertex[2][2]<0.01f;
            textured=(state->base>=0 && state->base<PLAYABLE_TEXTURE_SLOTS && textures[state->base].pixels) ||
                (state->lightmap>=0 && state->lightmap<PLAYABLE_TEXTURE_SLOTS && textures[state->lightmap].pixels);
            for (vertex=0;vertex<3;++vertex) {
                const float *p=command.vertex[vertex];
                hardwarePackedVertex *packed=&hardwarePackedVertices[index*3+vertex];
                double light=p[7], depth=p[2];
                if (view) {
                    packed->position[0]=p[0];packed->position[1]=p[1];packed->position[2]=p[2];packed->position[3]=1.0;
                } else {
                    packed->position[0]=(p[0]*2.0/surfaceWidth-1.0)*depth;
                    packed->position[1]=(1.0-p[1]*2.0/surfaceHeight)*depth;
                    packed->position[2]=state->overlay ? 0.0 : depth-2.0*hardwareNear;packed->position[3]=depth;
                }
                packed->color[0]=command.vertexColor[vertex][0]/255.0*light*(textured ? 1.0 : command.fallbackRed/255.0);
                packed->color[1]=command.vertexColor[vertex][1]/255.0*light*(textured ? 1.0 : command.fallbackGreen/255.0);
                packed->color[2]=command.vertexColor[vertex][2]/255.0*light*(textured ? 1.0 : command.fallbackBlue/255.0);
                packed->color[3]=command.vertexColor[vertex][3]/255.0;
                packed->baseUV[0]=p[3];packed->baseUV[1]=p[4];packed->lightmapUV[0]=p[5];packed->lightmapUV[1]=p[6];
            }
        }
        mq_glVertexPointer(4,GL_DOUBLE,sizeof(hardwarePackedVertex),hardwarePackedVertices[0].position);
        mq_glColorPointer(4,GL_DOUBLE,sizeof(hardwarePackedVertex),hardwarePackedVertices[0].color);
        mq_glClientActiveTexture(MQ_GL_TEXTURE0);mq_glTexCoordPointer(2,GL_FLOAT,sizeof(hardwarePackedVertex),hardwarePackedVertices[0].baseUV);
        mq_glClientActiveTexture(MQ_GL_TEXTURE1);mq_glTexCoordPointer(2,GL_FLOAT,sizeof(hardwarePackedVertex),hardwarePackedVertices[0].lightmapUV);
        for (group=0;group<chunk;) {
            hardwarePackedState *state=&hardwarePackedStates[group];
            int end=group+1;
            while (end<chunk && hardwarePackedStates[end].base==state->base &&
                    hardwarePackedStates[end].lightmap==state->lightmap && hardwarePackedStates[end].overlay==state->overlay) ++end;
            if (state->base!=lastBase || state->lightmap!=lastLightmap || state->overlay!=lastOverlay) {
                hardwareState(state->overlay);hardwareTextureUnit(MQ_GL_TEXTURE0,state->base);
                hardwareTextureUnit(MQ_GL_TEXTURE1,state->lightmap);mq_glActiveTexture(MQ_GL_TEXTURE0);
                lastBase=state->base;lastLightmap=state->lightmap;lastOverlay=state->overlay;
            }
            mq_glDrawArrays(GL_TRIANGLES,group*3,(end-group)*3);++hardwareDrawCalls;
            group=end;
        }
        offset+=chunk;
    }
    mq_glPopAttrib(); mq_glPopClientAttrib();
    if (mq_glBindBuffer) mq_glBindBuffer(MQ_GL_ARRAY_BUFFER,(GLuint)previousArrayBuffer);
    mq_glClientActiveTexture((GLenum)previousClientTexture);
    hardwareTriangles+=(unsigned int)count;
    mq_glActiveTexture(MQ_GL_TEXTURE0);
    if(profileStarted) hardwareProfile.frameDraw+=hardwareProfileCounter()-profileStarted;
    return count;
}

static void hardwareSingleTriangle(int baseSlot,int lightmapSlot,const double p[3][8],int red,int green,int blue) {
    playableTriangleBatchRecord command;
    int vertex,component;
    ZeroMemory(&command,sizeof(command));
    command.baseTextureSlot=baseSlot; command.lightmapTextureSlot=lightmapSlot;
    command.fallbackRed=red; command.fallbackGreen=green; command.fallbackBlue=blue;
    for (vertex=0;vertex<3;++vertex) {
        for (component=0;component<8;++component) command.vertex[vertex][component]=(float)p[vertex][component];
        for (component=0;component<4;++component)
            command.vertexColor[vertex][component]=rasterVertexColorEnabled ? (unsigned char)rasterVertexColor[vertex][component] : 255;
    }
    {
        /* Legacy screen glyphs call draw_triangle directly and depend on its
         * unconditional zero-alpha discard even without a shader alphaFunc. */
        int previousAlpha=rasterAlphaTest;
        if (!rasterAlphaTest) rasterAlphaTest=1;
        hardwareDrawBatch((const unsigned char *)&command,1,0);
        rasterAlphaTest=previousAlpha;
    }
}

static int hardwareDrawWorld(const unsigned char *records,int count,int x,int y,int width,int height,
        double px,double py,double pz,double rx,double ry,double rz,double ux,double uy,double uz,
        double fx,double fy,double fz,double focal,double nearDistance) {
    hardwareView view;
    view.x=x;view.y=y;view.width=width;view.height=height;
    view.position[0]=px;view.position[1]=py;view.position[2]=pz;
    view.right[0]=rx;view.right[1]=ry;view.right[2]=rz;
    view.up[0]=ux;view.up[1]=uy;view.up[2]=uz;
    view.forward[0]=fx;view.forward[1]=fy;view.forward[2]=fz;
    view.focal=focal;view.nearDistance=nearDistance;
    return hardwareDrawBatch(records,count,&view);
}

static void hardwareLine(int x0,int y0,int x1,int y1,int red,int green,int blue) {
    playableGlViewport(0,0,surfaceWidth,surfaceHeight);
    playableGlMatrixMode(GL_PROJECTION); playableGlLoadIdentity();
    playableGlMatrixMode(GL_MODELVIEW); playableGlLoadIdentity();
    hardwareTextureUnit(MQ_GL_TEXTURE1,-1); hardwareTextureUnit(MQ_GL_TEXTURE0,-1);
    mq_glDisable(GL_SCISSOR_TEST); mq_glDisable(GL_DEPTH_TEST); mq_glDisable(GL_BLEND); mq_glDisable(GL_ALPHA_TEST);
    mq_glDisable(GL_STENCIL_TEST); mq_glDisable(GL_CULL_FACE); mq_glColorMask(GL_TRUE,GL_TRUE,GL_TRUE,GL_TRUE);
    mq_glColor4d(red/255.0,green/255.0,blue/255.0,1.0);
    mq_glBegin(GL_LINES);
    mq_glVertex4d((x0+0.5)*2.0/surfaceWidth-1.0,1.0-(y0+0.5)*2.0/surfaceHeight,0,1);
    mq_glVertex4d((x1+0.5)*2.0/surfaceWidth-1.0,1.0-(y1+0.5)*2.0/surfaceHeight,0,1);
    mq_glEnd();
}

static void hardwareBeginFrame(int red,int green,int blue) {
    if(hardwareProfile.enabled) { hardwareProfile.frameStarted=hardwareProfileCounter();hardwareProfile.frameDraw=0;hardwareProfile.frameActive=1; }
    hardwareDrawCalls=hardwareTriangles=0; hardwareNear=1.0;
    mq_glDisable(GL_SCISSOR_TEST); mq_glDepthMask(GL_TRUE); mq_glStencilMask(255);
    mq_glColorMask(GL_TRUE,GL_TRUE,GL_TRUE,GL_TRUE);
    mq_glClearDepth(1.0); mq_glClearStencil(0);
    playableGlClearColor(red/255.0f,green/255.0f,blue/255.0f,1.0f);
    playableGlClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT|GL_STENCIL_BUFFER_BIT);
}
static void hardwareClearDepth(double depth) {
    mq_glDisable(GL_SCISSOR_TEST); mq_glDepthMask(GL_TRUE);
    mq_glClearDepth(depth >= FLT_MAX ? 1.0 : fmax(0.0,1.0-hardwareNear/depth));
    playableGlClear(GL_DEPTH_BUFFER_BIT);
}
static void hardwareReadback(void) {
    mq_glReadBuffer(GL_BACK);
    playableGlPixelStorei(GL_PACK_ALIGNMENT,4);
    mq_glReadPixels(0,0,surfaceWidth,surfaceHeight,GL_BGRA_EXT,GL_UNSIGNED_BYTE,presentedPixels);
}
static void hardwareCapture(void) {
    char path[32768];
    BITMAPFILEHEADER fileHeader;
    BITMAPINFOHEADER info;
    HANDLE file;
    DWORD written;
    if (!GetEnvironmentVariableA("MQ3_CAPTURE",path,sizeof(path))) return;
    if (hardwareRenderer) hardwareReadback();
    else CopyMemory(presentedPixels,pixels,(SIZE_T)surfaceWidth*(SIZE_T)surfaceHeight*4u);
    ZeroMemory(&fileHeader,sizeof(fileHeader)); ZeroMemory(&info,sizeof(info));
    info.biSize=sizeof(info); info.biWidth=surfaceWidth; info.biHeight=hardwareRenderer ? surfaceHeight : -surfaceHeight;
    info.biPlanes=1; info.biBitCount=32; info.biCompression=BI_RGB;
    info.biSizeImage=(DWORD)(surfaceWidth*surfaceHeight*4);
    fileHeader.bfType=0x4d42; fileHeader.bfOffBits=sizeof(fileHeader)+sizeof(info);
    fileHeader.bfSize=fileHeader.bfOffBits+info.biSizeImage;
    file=CreateFileA(path,GENERIC_WRITE,FILE_SHARE_READ,0,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0);
    if (file==INVALID_HANDLE_VALUE) return;
    WriteFile(file,&fileHeader,sizeof(fileHeader),&written,0); WriteFile(file,&info,sizeof(info),&written,0);
    WriteFile(file,presentedPixels,info.biSizeImage,&written,0); CloseHandle(file);
}

PLAYABLE_API int playable_window_hardware_renderer(void) { return hardwareRenderer; }
PLAYABLE_API unsigned int playable_window_hardware_triangles(void) { return hardwareTriangles; }
PLAYABLE_API unsigned int playable_window_hardware_draw_calls(void) { return hardwareDrawCalls; }
PLAYABLE_API unsigned int playable_window_hardware_pixel(int x,int y) {
    uint32_t color=0;
    if (hardwareRenderer && x>=0 && y>=0 && x<surfaceWidth && y<surfaceHeight) {
        mq_glReadBuffer(GL_BACK); mq_glReadPixels(x,surfaceHeight-1-y,1,1,GL_BGRA_EXT,GL_UNSIGNED_BYTE,&color);
    }
    return color;
}
