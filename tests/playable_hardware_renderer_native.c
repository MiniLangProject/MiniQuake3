/* SPDX-License-Identifier: GPL-2.0-or-later */
#include "../native/playable_win32.c"
#include <stdio.h>
#include "playable_hardware_immediate_reference.h"
#include "original_blend_factors.h"

static int closeColor(uint32_t actual,uint32_t wanted,int tolerance) {
    int shift;
    for (shift=0;shift<24;shift+=8) if (abs((int)((actual>>shift)&255)-(int)((wanted>>shift)&255))>tolerance) return 0;
    return 1;
}
static int check(int ok,const char *name) {
    GLenum error=mq_glGetError();
    if (!ok || error!=GL_NO_ERROR) { fprintf(stderr,"hardware renderer: %s (GL error %x)\n",name,(unsigned)error);return 0; }
    return 1;
}
static playableTriangleBatchRecord triangle(void) {
    playableTriangleBatchRecord t;
    ZeroMemory(&t,sizeof(t)); t.baseTextureSlot=t.lightmapTextureSlot=-1;
    t.fallbackRed=255;memset(t.vertexColor,255,sizeof(t.vertexColor));
    t.vertex[0][0]=4;t.vertex[0][1]=-2;t.vertex[0][2]=-2;
    t.vertex[1][0]=4;t.vertex[1][1]=2;t.vertex[1][2]=-2;
    t.vertex[2][0]=4;t.vertex[2][1]=0;t.vertex[2][2]=2;
    t.vertex[0][7]=t.vertex[1][7]=t.vertex[2][7]=1;
    return t;
}
static void draw(playableTriangleBatchRecord *t) {
    hardwareDrawWorld((unsigned char *)t,1,0,0,128,128,0,0,0,0,1,0,0,0,1,1,0,0,64,1);
}

/* Compare the complete framebuffer with the original tr_backend.c alphaFunc
 * call, on the same driver. Some drivers quantize the fixed-function alpha
 * reference; asserting a guessed 127/128 pixel result cannot establish parity.
 * The reference reuses the actual draw's camera and texture bindings, changes
 * only alpha state, and submits the same original world-space vertices. */
static int alphaMatchesOriginal(playableTriangleBatchRecord *t,int mode) {
    uint32_t actual[128*128];
    uint32_t original[128*128];
    int vertex;
    int textured=(t->baseTextureSlot>=0 && textures[t->baseTextureSlot].pixels) ||
        (t->lightmapTextureSlot>=0 && textures[t->lightmapTextureSlot].pixels);
    playable_window_begin_frame(0,0,0);playable_window_set_alpha_test(mode);draw(t);
    mq_glReadPixels(0,0,128,128,GL_BGRA_EXT,GL_UNSIGNED_BYTE,actual);
    playable_window_begin_frame(0,0,0);
    mq_glEnable(GL_ALPHA_TEST);
    mq_glAlphaFunc(mode==1 ? GL_GREATER : mode==2 ? GL_LESS : GL_GEQUAL,mode==1 ? 0.0f : 0.5f);
    mq_glBegin(GL_TRIANGLES);
    for(vertex=0;vertex<3;++vertex) {
        const float *p=t->vertex[vertex];
        mq_glColor4d(t->vertexColor[vertex][0]/255.0*p[7]*(textured ? 1.0 : t->fallbackRed/255.0),
            t->vertexColor[vertex][1]/255.0*p[7]*(textured ? 1.0 : t->fallbackGreen/255.0),
            t->vertexColor[vertex][2]/255.0*p[7]*(textured ? 1.0 : t->fallbackBlue/255.0),
            t->vertexColor[vertex][3]/255.0);
        mq_glMultiTexCoord2f(MQ_GL_TEXTURE0,p[3],p[4]);mq_glMultiTexCoord2f(MQ_GL_TEXTURE1,p[5],p[6]);
        mq_glVertex3fv(p);
    }
    mq_glEnd();
    mq_glReadPixels(0,0,128,128,GL_BGRA_EXT,GL_UNSIGNED_BYTE,original);
    if(memcmp(actual,original,sizeof(actual))) {
        fprintf(stderr,"alpha original-call mismatch mode=%d texture=%d alpha=%u,%u,%u\n",mode,t->baseTextureSlot,
            (unsigned)t->vertexColor[0][3],(unsigned)t->vertexColor[1][3],(unsigned)t->vertexColor[2][3]);
        return 0;
    }
    return check(1,"original alphaFunc framebuffer equivalence");
}

static int alphaReferenceContracts(void) {
    static const unsigned char filteredAlpha[]={255,255,255,127,255,255,255,128};
    static const unsigned char uniformAlpha[]={0,1,127,128,129,255};
    playableTriangleBatchRecord t=triangle();
    int mode;
    int sample;
    int vertex;
    if(!playable_window_upload_texture_mipmapped(5,filteredAlpha,2,1,0)) return 0;
    for(mode=1;mode<=3;++mode) {
        for(sample=0;sample<(int)sizeof(uniformAlpha);++sample) {
            t=triangle();for(vertex=0;vertex<3;++vertex) t.vertexColor[vertex][3]=uniformAlpha[sample];
            if(!alphaMatchesOriginal(&t,mode)) return 0;
        }
        t=triangle();t.vertexColor[0][3]=127;t.vertexColor[1][3]=128;t.vertexColor[2][3]=129;
        if(!alphaMatchesOriginal(&t,mode)) return 0;
        t=triangle();t.vertexColor[0][3]=0;t.vertexColor[1][3]=255;t.vertexColor[2][3]=128;
        if(!alphaMatchesOriginal(&t,mode)) return 0;
        t=triangle();t.baseTextureSlot=5;
        t.vertex[0][3]=0.0f;t.vertex[1][3]=1.0f;t.vertex[2][3]=0.5f;
        for(vertex=0;vertex<3;++vertex) t.vertex[vertex][4]=0.5f;
        if(!alphaMatchesOriginal(&t,mode)) return 0;
    }
    puts("PASS: original alphaFunc calls (uniform, interpolated and linear-filtered threshold)");
    return 1;
}

/* These factors use the unchanged original GLS definitions. The reference
 * calls glBlendFunc directly and never calls hardwareState, so aliases cannot
 * agree with a copied implementation while disagreeing with Quake III. */
static GLenum originalBlendSource(int bits) {
    switch(bits & GLS_SRCBLEND_BITS) {
        case GLS_SRCBLEND_ZERO:return GL_ZERO;case GLS_SRCBLEND_ONE:return GL_ONE;
        case GLS_SRCBLEND_DST_COLOR:return GL_DST_COLOR;case GLS_SRCBLEND_ONE_MINUS_DST_COLOR:return GL_ONE_MINUS_DST_COLOR;
        case GLS_SRCBLEND_SRC_ALPHA:return GL_SRC_ALPHA;case GLS_SRCBLEND_ONE_MINUS_SRC_ALPHA:return GL_ONE_MINUS_SRC_ALPHA;
        case GLS_SRCBLEND_DST_ALPHA:return GL_DST_ALPHA;case GLS_SRCBLEND_ONE_MINUS_DST_ALPHA:return GL_ONE_MINUS_DST_ALPHA;
        default:return GL_SRC_ALPHA_SATURATE;
    }
}
static GLenum originalBlendDestination(int bits) {
    switch(bits & GLS_DSTBLEND_BITS) {
        case GLS_DSTBLEND_ZERO:return GL_ZERO;case GLS_DSTBLEND_ONE:return GL_ONE;
        case GLS_DSTBLEND_SRC_COLOR:return GL_SRC_COLOR;case GLS_DSTBLEND_ONE_MINUS_SRC_COLOR:return GL_ONE_MINUS_SRC_COLOR;
        case GLS_DSTBLEND_SRC_ALPHA:return GL_SRC_ALPHA;case GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA:return GL_ONE_MINUS_SRC_ALPHA;
        case GLS_DSTBLEND_DST_ALPHA:return GL_DST_ALPHA;default:return GL_ONE_MINUS_DST_ALPHA;
    }
}
static void originalBlendBackground(void) {
    playable_window_begin_frame(37,81,143);
    playableGlClearColor(37.0f/255.0f,81.0f/255.0f,143.0f/255.0f,67.0f/255.0f);
    playableGlClear(GL_COLOR_BUFFER_BIT);
}
static int originalBlendFramebufferContracts(void) {
    static const int aliases[]={0,
        GLS_SRCBLEND_SRC_ALPHA|GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA,
        GLS_SRCBLEND_ONE|GLS_DSTBLEND_ONE,
        GLS_SRCBLEND_DST_COLOR|GLS_DSTBLEND_ZERO,
        GLS_SRCBLEND_DST_COLOR|GLS_DSTBLEND_ONE_MINUS_DST_ALPHA,
        GLS_SRCBLEND_DST_COLOR|GLS_DSTBLEND_ONE,
        GLS_SRCBLEND_ZERO|GLS_DSTBLEND_ONE_MINUS_SRC_COLOR,
        GLS_SRCBLEND_ONE|GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA};
    static const int sources[]={GLS_SRCBLEND_ZERO,GLS_SRCBLEND_ONE,GLS_SRCBLEND_DST_COLOR,
        GLS_SRCBLEND_ONE_MINUS_DST_COLOR,GLS_SRCBLEND_SRC_ALPHA,GLS_SRCBLEND_ONE_MINUS_SRC_ALPHA,
        GLS_SRCBLEND_DST_ALPHA,GLS_SRCBLEND_ONE_MINUS_DST_ALPHA,GLS_SRCBLEND_ALPHA_SATURATE};
    static const int destinations[]={GLS_DSTBLEND_ZERO,GLS_DSTBLEND_ONE,GLS_DSTBLEND_SRC_COLOR,
        GLS_DSTBLEND_ONE_MINUS_SRC_COLOR,GLS_DSTBLEND_SRC_ALPHA,GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA,
        GLS_DSTBLEND_DST_ALPHA,GLS_DSTBLEND_ONE_MINUS_DST_ALPHA};
    static const unsigned char partial[]={240,100,50,96};
    static const unsigned char filtered[]={80,140,220,0,200,70,30,255};
    uint32_t actual[128*128],original[128*128];int state,sample,vertex,cases=0;
    if(!playable_window_upload_texture(8,partial,1,1) || !playable_window_upload_texture(9,filtered,2,1)) return 0;
    for(state=0;state<80;++state) for(sample=0;sample<3;++sample) {
        playableTriangleBatchRecord t=triangle();int bits,mode;
        if(state<8) { bits=aliases[state];mode=state; }
        else { bits=sources[(state-8)/8]|destinations[(state-8)%8];mode=0x100|bits; }
        t.fallbackRed=200;t.fallbackGreen=99;t.fallbackBlue=53;
        t.baseTextureSlot=sample==2 ? -1 : sample==0 ? 8 : 9;
        for(vertex=0;vertex<3;++vertex) {
            t.vertex[vertex][3]=vertex*0.5f;t.vertex[vertex][4]=0.5f;
            t.vertexColor[vertex][0]=(unsigned char)(220-vertex*39);
            t.vertexColor[vertex][1]=(unsigned char)(69+vertex*51);
            t.vertexColor[vertex][2]=(unsigned char)(110+vertex*43);
            t.vertexColor[vertex][3]=(unsigned char)(sample==2 ? 0 : sample==0 ? 128 : vertex*127);
        }
        playable_window_set_alpha_test(0);playable_window_set_depth_range(1,1);
        originalBlendBackground();playable_window_set_raster_state(mode,0,0);draw(&t);
        mq_glReadPixels(0,0,128,128,GL_BGRA_EXT,GL_UNSIGNED_BYTE,actual);
        originalBlendBackground();
        if(bits) { mq_glEnable(GL_BLEND);mq_glBlendFunc(originalBlendSource(bits),originalBlendDestination(bits)); }
        else mq_glDisable(GL_BLEND);
        mq_glBegin(GL_TRIANGLES);
        for(vertex=0;vertex<3;++vertex) {
            const float *p=t.vertex[vertex];int textured=t.baseTextureSlot>=0;
            mq_glColor4d(t.vertexColor[vertex][0]/255.0*p[7]*(textured ? 1.0 : t.fallbackRed/255.0),
                t.vertexColor[vertex][1]/255.0*p[7]*(textured ? 1.0 : t.fallbackGreen/255.0),
                t.vertexColor[vertex][2]/255.0*p[7]*(textured ? 1.0 : t.fallbackBlue/255.0),t.vertexColor[vertex][3]/255.0);
            mq_glMultiTexCoord2f(MQ_GL_TEXTURE0,p[3],p[4]);mq_glMultiTexCoord2f(MQ_GL_TEXTURE1,p[5],p[6]);mq_glVertex3fv(p);
        }
        mq_glEnd();mq_glReadPixels(0,0,128,128,GL_BGRA_EXT,GL_UNSIGNED_BYTE,original);
        if(memcmp(actual,original,sizeof(actual))) {
            int pixel;for(pixel=0;pixel<128*128;++pixel) if(actual[pixel]!=original[pixel]) {
                fprintf(stderr,"original blend mismatch mode=%x GLS=%x sample=%d pixel=%d,%d actual=%08x expected=%08x\n",
                    mode,bits,sample,pixel%128,pixel/128,actual[pixel],original[pixel]);break;
            }
            return 0;
        }
        ++cases;
    }
    printf("PASS: %d exact original glBlendFunc framebuffer cases (8 aliases + 72 factor pairs, partial/filtered/zero alpha)\n",cases);
    return check(1,"original blend aliases and all GLS factor pairs");
}

static int lazyTextureContracts(void) {
    static const unsigned char base[]={128,255,64,255};
    static const unsigned char lightmap[]={128,128,255,255};
    playableTriangleBatchRecord t=triangle();
    GLint active;
    GLint binding;
    if(!playable_window_upload_texture(6,base,1,1) || !playable_window_upload_texture(7,lightmap,1,1)) return 0;
    /* CPU texels survived while these GPU names were absent, as with a
     * texture registered before context creation or after context recreation. */
    hardwareReleaseTexture(6);hardwareReleaseTexture(7);
    playable_window_begin_frame(0,0,0);t.baseTextureSlot=6;t.lightmapTextureSlot=7;draw(&t);
    if(!check(closeColor(playable_window_hardware_pixel(64,64),0x408040,1),"lazy TMU1 upload preserves base texture")) return 0;
    hardwareTextureUnit(MQ_GL_TEXTURE0,6);hardwareTextureUnit(MQ_GL_TEXTURE1,7);
    hardwareReleaseTexture(5);hardwareUploadTexture(5);
    mq_glGetIntegerv(MQ_GL_ACTIVE_TEXTURE,&active);
    if(active!=MQ_GL_TEXTURE1) return check(0,"upload preserves previously active texture unit");
    mq_glActiveTexture(MQ_GL_TEXTURE0);mq_glGetIntegerv(GL_TEXTURE_BINDING_2D,&binding);
    if((GLuint)binding!=hardwareTextures[6]) return check(0,"upload preserves TMU0 base binding");
    mq_glActiveTexture(MQ_GL_TEXTURE1);mq_glGetIntegerv(GL_TEXTURE_BINDING_2D,&binding);
    if((GLuint)binding!=hardwareTextures[7]) return check(0,"upload preserves TMU1 lightmap binding");
    mq_glActiveTexture(MQ_GL_TEXTURE0);
    puts("PASS: lazy GPU texture upload preserves both TMU bindings and active unit");
    return 1;
}

static int clientArrayFramebufferContracts(void) {
    enum { COUNT=43 };
    playableTriangleBatchRecord records[COUNT];
    uint32_t arrays[128*128], immediate[128*128];
    hardwareView view={0,0,128,128,{0,0,0},{0,1,0},{0,0,1},{1,0,0},64,1};
    int screen, mode, i, vertex;
    for(screen=0;screen<2;++screen) for(mode=0;mode<8;++mode) {
        for(i=0;i<COUNT;++i) {
            records[i]=triangle();
            records[i].baseTextureSlot=i%4==0 ? -1 : 0;
            records[i].lightmapTextureSlot=i%7==0 ? 1 : -1;
            records[i].fallbackRed=40+i*5;records[i].fallbackGreen=250-i*4;records[i].fallbackBlue=20+i*3;
            for(vertex=0;vertex<3;++vertex) {
                float *v=records[i].vertex[vertex];
                v[0]=screen ? (float)((i*17+vertex*53)%200-35) : 0.25f+(float)((i*3+vertex*7)%25)*0.3f;
                v[1]=screen ? (float)((i*23+vertex*41)%180-25) : (float)((i*7+vertex*11)%19-9)*0.4f;
                v[2]=screen ? (i%3==0 ? 0.001f : 1.5f+(float)(vertex+i%9)) : (float)((i*11+vertex*13)%17-8)*0.4f;
                v[3]=(float)((i+vertex*3)%13-3)*0.23f;v[4]=(float)((i*3+vertex)%11-2)*0.17f;
                v[5]=v[4]*0.7f;v[6]=v[3]*0.3f;v[7]=(float)(i%9-1)*0.23f;
                records[i].vertexColor[vertex][0]=(unsigned char)(i*17+vertex*61);
                records[i].vertexColor[vertex][1]=(unsigned char)(i*23+vertex*43);
                records[i].vertexColor[vertex][2]=(unsigned char)(i*7+vertex*73);
                records[i].vertexColor[vertex][3]=(unsigned char)(i*19+vertex*29);
            }
        }
        playable_window_begin_frame(30,40,50);
        playable_window_set_raster_state(mode<4 ? 0 : mode<6 ? 1 : 0x122,mode%2,0);
        playable_window_set_alpha_test(mode%4);playable_window_set_depth_range(mode%2 ? 0.3 : 1.0,1);
        hardwareDrawBatch((unsigned char *)records,COUNT,screen ? 0 : &view);
        mq_glReadPixels(0,0,128,128,GL_BGRA_EXT,GL_UNSIGNED_BYTE,arrays);
        playable_window_begin_frame(30,40,50);
        playable_window_set_raster_state(mode<4 ? 0 : mode<6 ? 1 : 0x122,mode%2,0);
        playable_window_set_alpha_test(mode%4);playable_window_set_depth_range(mode%2 ? 0.3 : 1.0,1);
        hardwareDrawBatchImmediate((unsigned char *)records,COUNT,screen ? 0 : &view);
        mq_glReadPixels(0,0,128,128,GL_BGRA_EXT,GL_UNSIGNED_BYTE,immediate);
        if(memcmp(arrays,immediate,sizeof(arrays))) {
            for(i=0;i<128*128;++i) if(arrays[i]!=immediate[i]) {
                fprintf(stderr,"array/immediate framebuffer mismatch screen=%d mode=%d xy=%d,%d arrays=%08x immediate=%08x\n",
                    screen,mode,i%128,i/128,arrays[i],immediate[i]);break;
            }
            return 0;
        }
        if(!check(1,"client-array exact immediate framebuffer")) return 0;
    }
    puts("PASS: client arrays equal immediate pixels for world/screen, near clipping, varying RGBA, lightmaps, alpha, depthhack and blend groups");
    return 1;
}

static int clientArrayStateContracts(void) {
    typedef void (APIENTRY *getPointerProc)(GLenum,GLvoid **);
    typedef GLboolean (APIENTRY *isEnabledProc)(GLenum);
    typedef void (APIENTRY *genBuffersProc)(GLsizei,GLuint *);
    typedef void (APIENTRY *deleteBuffersProc)(GLsizei,const GLuint *);
    getPointerProc getPointer;
    isEnabledProc isEnabled;
    genBuffersProc genBuffers;
    deleteBuffersProc deleteBuffers;
    GLfloat vertices[16]={0}, uv0[12]={0}, uv1[12]={0}, normals[12]={0};
    GLubyte colors[16]={0}, edges[4]={0};
    GLdouble color[4], coord[4];
    GLint clientUnit,buffer;
    GLvoid *pointer;
    GLuint callerBuffer=0;
    playableTriangleBatchRecord t=triangle();
    int ok=1;
#pragma warning(push)
#pragma warning(disable:4191)
    getPointer=(getPointerProc)hardwareProc("glGetPointerv");isEnabled=(isEnabledProc)hardwareProc("glIsEnabled");
    genBuffers=(genBuffersProc)hardwareProc("glGenBuffers");deleteBuffers=(deleteBuffersProc)hardwareProc("glDeleteBuffers");
#pragma warning(pop)
    if(!getPointer || !isEnabled) return check(0,"client-array query entry points");
    mq_glPushClientAttrib(GL_CLIENT_VERTEX_ARRAY_BIT);mq_glPushAttrib(GL_CURRENT_BIT);
    if(mq_glBindBuffer) mq_glBindBuffer(MQ_GL_ARRAY_BUFFER,0);
    mq_glVertexPointer(3,GL_FLOAT,0,vertices);mq_glColorPointer(4,GL_UNSIGNED_BYTE,0,colors);
    mq_glEnableClientState(GL_VERTEX_ARRAY);mq_glDisableClientState(GL_COLOR_ARRAY);
    /* Enable unrelated arrays too. Our draw must not fetch the caller's data,
     * and restoring the client attribute stack must leave the enables intact. */
    mq_glEnableClientState(GL_NORMAL_ARRAY);mq_glEnableClientState(GL_EDGE_FLAG_ARRAY);
    {
        typedef void (APIENTRY *normalPointerProc)(GLenum,GLsizei,const GLvoid *);
        typedef void (APIENTRY *edgePointerProc)(GLsizei,const GLvoid *);
        normalPointerProc normalPointer;edgePointerProc edgePointer;
#pragma warning(push)
#pragma warning(disable:4191)
        normalPointer=(normalPointerProc)hardwareProc("glNormalPointer");edgePointer=(edgePointerProc)hardwareProc("glEdgeFlagPointer");
#pragma warning(pop)
        if(!normalPointer || !edgePointer) return check(0,"normal/edge pointer entry points");
        normalPointer(GL_FLOAT,0,normals);edgePointer(0,edges);
    }
    mq_glClientActiveTexture(MQ_GL_TEXTURE0);mq_glTexCoordPointer(3,GL_FLOAT,0,uv0);mq_glDisableClientState(GL_TEXTURE_COORD_ARRAY);
    mq_glClientActiveTexture(MQ_GL_TEXTURE1);mq_glTexCoordPointer(3,GL_FLOAT,0,uv1);mq_glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    mq_glColor4d(0.25,0.5,0.75,1.0);mq_glMultiTexCoord2f(MQ_GL_TEXTURE0,0.375f,0.625f);
    mq_glMultiTexCoord2f(MQ_GL_TEXTURE1,0.125f,0.875f);
    if(mq_glBindBuffer && genBuffers && deleteBuffers) { genBuffers(1,&callerBuffer);mq_glBindBuffer(MQ_GL_ARRAY_BUFFER,callerBuffer); }
    playable_window_begin_frame(0,0,0);draw(&t);
    mq_glGetIntegerv(MQ_GL_CLIENT_ACTIVE_TEXTURE,&clientUnit);if(clientUnit!=MQ_GL_TEXTURE1) ok=0;
    if(mq_glBindBuffer) { mq_glGetIntegerv(MQ_GL_ARRAY_BUFFER_BINDING,&buffer);if((GLuint)buffer!=callerBuffer) ok=0; }
    getPointer(GL_VERTEX_ARRAY_POINTER,&pointer);if(pointer!=vertices || !isEnabled(GL_VERTEX_ARRAY)) ok=0;
    getPointer(GL_COLOR_ARRAY_POINTER,&pointer);if(pointer!=colors || isEnabled(GL_COLOR_ARRAY)) ok=0;
    if(!isEnabled(GL_NORMAL_ARRAY) || !isEnabled(GL_EDGE_FLAG_ARRAY)) ok=0;
    mq_glClientActiveTexture(MQ_GL_TEXTURE0);getPointer(GL_TEXTURE_COORD_ARRAY_POINTER,&pointer);if(pointer!=uv0 || isEnabled(GL_TEXTURE_COORD_ARRAY)) ok=0;
    mq_glClientActiveTexture(MQ_GL_TEXTURE1);getPointer(GL_TEXTURE_COORD_ARRAY_POINTER,&pointer);if(pointer!=uv1 || !isEnabled(GL_TEXTURE_COORD_ARRAY)) ok=0;
    mq_glGetDoublev(GL_CURRENT_COLOR,color);if(color[0]!=0.25 || color[1]!=0.5 || color[2]!=0.75 || color[3]!=1) ok=0;
    mq_glActiveTexture(MQ_GL_TEXTURE0);mq_glGetDoublev(GL_CURRENT_TEXTURE_COORDS,coord);if(coord[0]!=0.375 || coord[1]!=0.625) ok=0;
    mq_glActiveTexture(MQ_GL_TEXTURE1);mq_glGetDoublev(GL_CURRENT_TEXTURE_COORDS,coord);if(coord[0]!=0.125 || coord[1]!=0.875) ok=0;
    mq_glActiveTexture(MQ_GL_TEXTURE0);
    if(callerBuffer) { mq_glBindBuffer(MQ_GL_ARRAY_BUFFER,0);deleteBuffers(1,&callerBuffer); }
    mq_glPopAttrib();mq_glPopClientAttrib();
    if(!check(ok,"caller client arrays, VBO binding, active client unit and current attributes restored")) return 0;
    puts("PASS: client-array pointers/enables, caller VBO binding, client texture unit and current attributes restored");
    return 1;
}

static int clientArrayBoundsContracts(void) {
    const int count=HARDWARE_PACK_TRIANGLES+7;
    playableTriangleBatchRecord *records=(playableTriangleBatchRecord *)HeapAlloc(GetProcessHeap(),0,(SIZE_T)count*sizeof(*records));
    hardwareView view={0,0,128,128,{0,0,0},{0,1,0},{0,0,1},{1,0,0},64,1};
    int i;
    if(!records) return 0;
    for(i=0;i<count;++i) { records[i]=triangle();records[i].vertex[0][1]=records[i].vertex[1][1]=records[i].vertex[2][1]=-40; }
    records[count-1]=triangle();
    playable_window_begin_frame(0,0,0);
    if(hardwareDrawBatch((unsigned char *)records,count,&view)!=count || hardwareDrawCalls!=2 || hardwarePackedCapacity!=HARDWARE_PACK_TRIANGLES ||
            !closeColor(playable_window_hardware_pixel(64,64),0xff0000,0)) { HeapFree(GetProcessHeap(),0,records);return check(0,"bounded client array chunk boundary"); }
    if(hardwareDrawBatch(0,1,&view)!=0 || hardwareDrawBatch((unsigned char *)records,-1,&view)!=0 ||
            hardwareDrawBatch((unsigned char *)records,0,&view)!=0 || hardwareEnsurePacking(HARDWARE_PACK_TRIANGLES+1)!=0)
        { HeapFree(GetProcessHeap(),0,records);return check(0,"invalid array bounds rejected"); }
    view.width=0;if(hardwareDrawBatch((unsigned char *)records,1,&view)!=0) { HeapFree(GetProcessHeap(),0,records);return 0; }
    HeapFree(GetProcessHeap(),0,records);
    puts("PASS: reusable 4096-triangle buffer, split-group boundary and invalid input bounds");
    return check(1,"bounded client-array packing");
}

static int clientArraySubmissionBenchmark(void) {
    enum { COUNT=768, FRAMES=100 };
    playableTriangleBatchRecord records[COUNT];
    hardwareView view={0,0,128,128,{0,0,0},{0,1,0},{0,0,1},{1,0,0},64,1};
    LARGE_INTEGER frequency,start,end;
    double arrays,immediate;
    int i,frame;
    for(i=0;i<COUNT;++i) {
        records[i]=triangle();records[i].baseTextureSlot=i<384 ? 0 : -1;
        records[i].lightmapTextureSlot=i<384 ? 1 : -1;
        for(frame=0;frame<3;++frame) { records[i].vertex[frame][1]*=0.01f;records[i].vertex[frame][2]*=0.01f; }
    }
    QueryPerformanceFrequency(&frequency);
    playable_window_begin_frame(0,0,0);hardwareDrawBatch((unsigned char *)records,COUNT,&view);
    QueryPerformanceCounter(&start);
    for(frame=0;frame<FRAMES;++frame) hardwareDrawBatch((unsigned char *)records,COUNT,&view);
    QueryPerformanceCounter(&end);arrays=(end.QuadPart-start.QuadPart)*1000.0/frequency.QuadPart/FRAMES;
    QueryPerformanceCounter(&start);
    for(frame=0;frame<FRAMES;++frame) hardwareDrawBatchImmediate((unsigned char *)records,COUNT,&view);
    QueryPerformanceCounter(&end);immediate=(end.QuadPart-start.QuadPart)*1000.0/frequency.QuadPart/FRAMES;
    printf("Hardware submission benchmark: %d triangles in 2 groups; immediate %.3fms/frame, client arrays %.3fms/frame (%.2fx)\n",COUNT,immediate,arrays,immediate/arrays);
    return check(1,"hardware submission benchmark");
}

int main(void) {
    playableTriangleBatchRecord t=triangle();
    unsigned char base[]={128,255,64,255}, light[]={128,128,255,255};
    int vertex;
    if (!playable_window_create(128,128)) return 1;
    if (!check(hardwareRenderer,"hardware context with two TMUs")) return 2;
    printf("Hardware renderer: %s / %s\n",openGLVendor,openGLRenderer);
    playable_window_begin_frame(0,0,0);draw(&t);
    if (!check(closeColor(playable_window_hardware_pixel(64,64),0xff0000,0),"opaque world triangle")) return 3;
    if (!check(fabs(playable_window_sample_depth(64,64)-4)<0.0001,"eye-space depth readback")) return 4;
    for (vertex=0;vertex<3;++vertex) t.vertex[vertex][0]=8;
    t.fallbackRed=0;t.fallbackGreen=255;draw(&t);
    if (!check(closeColor(playable_window_hardware_pixel(64,64),0xff0000,0),"opaque wall occludes rear geometry")) return 5;
    t=triangle();t.vertex[2][0]=0.5f;
    playable_window_begin_frame(0,0,0);draw(&t);
    if (!check(closeColor(playable_window_hardware_pixel(64,64),0xff0000,0),"crossing near plane remains visible")) return 6;
    t=triangle();playable_window_upload_texture(0,base,1,1);playable_window_upload_texture(1,light,1,1);
    t.baseTextureSlot=0;t.lightmapTextureSlot=1;
    playable_window_begin_frame(0,0,0);draw(&t);
    if (!check(closeColor(playable_window_hardware_pixel(64,64),0x408040,1),"base texture times lightmap")) return 7;
    if(!alphaReferenceContracts() || !lazyTextureContracts() || !originalBlendFramebufferContracts()) return 8;
    if(!clientArrayFramebufferContracts() || !clientArrayStateContracts() || !clientArrayBoundsContracts() || !clientArraySubmissionBenchmark()) return 19;
    t=triangle();for(vertex=0;vertex<3;++vertex) t.vertexColor[vertex][3]=128;
    playable_window_begin_frame(0,0,255);playable_window_set_raster_state(1,0,0);draw(&t);
    if (!check(closeColor(playable_window_hardware_pixel(64,64),0x80007f,1),"source alpha blend")) return 10;
    playable_window_begin_frame(0,0,0);t=triangle();
    hardwareDrawWorld((unsigned char *)&t,1,32,32,32,32,0,0,0,0,1,0,0,0,1,1,0,0,32,1);
    if (!check(closeColor(playable_window_hardware_pixel(48,48),0xff0000,0) && closeColor(playable_window_hardware_pixel(64,48),0,0),"viewport and scissor")) return 11;
    playable_window_begin_frame(200,200,200);t=triangle();
    playable_window_set_raster_state(0,0,0);playable_window_set_stencil_pass(1);draw(&t);
    playable_window_set_stencil_pass(0);playable_window_finish_stencil_shadow(0,0,128,128);
    if (!check(closeColor(playable_window_hardware_pixel(64,64),0x787878,1),"stencil shadow darkening")) return 12;
    playable_window_begin_frame(0,0,0);t=triangle();draw(&t);playable_window_set_depth_range(0.3,1);
    for (vertex=0;vertex<3;++vertex) t.vertex[vertex][0]=8;
    t.fallbackRed=0;t.fallbackGreen=255;draw(&t);
    if (!check(closeColor(playable_window_hardware_pixel(64,64),0x00ff00,0),"viewmodel depth range")) return 13;
    playable_window_begin_frame(0,0,0);
    playable_window_draw_triangle(-1,0,0,0.001,0,0,1,128,0,0.001,0,0,1,0,128,0.001,0,0,1,255,255,255);
    if (!check(closeColor(playable_window_hardware_pixel(20,20),0xffffff,0),"screen HUD overlay")) return 14;
    if (!check(playable_window_hardware_triangles()>0 && playable_window_hardware_draw_calls()>0,"GPU submission counters")) return 15;
    {
        unsigned char transparentWhite[4]={255,255,255,0};
        playable_window_upload_texture(2,transparentWhite,1,1);playable_window_begin_frame(0,0,0);
        playable_window_draw_triangle(2,0,0,0.001,0,0,1,128,0,0.001,1,0,1,0,128,0.001,0,1,1,255,255,255);
        if (!check(closeColor(playable_window_hardware_pixel(20,20),0,0),"legacy font atlas zero-alpha discard")) return 18;
    }
    {
        int sf,df;
        for (sf=1;sf<=9;++sf) for (df=1;df<=8;++df) {
            uint32_t expected;
            playable_window_begin_frame(0,0,0);t=triangle();t.fallbackRed=40;t.fallbackGreen=83;t.fallbackBlue=128;
            for (vertex=0;vertex<3;++vertex) t.vertexColor[vertex][3]=96;
            draw(&t);
            t.fallbackRed=250;t.fallbackGreen=115;t.fallbackBlue=34;
            for (vertex=0;vertex<3;++vertex) t.vertexColor[vertex][3]=127;
            playable_window_set_raster_state(0x100|sf|(df<<4),0,0);draw(&t);
            expected=genericBlendColor(UINT32_C(0x7ffa7322),UINT32_C(0x60285380),0x100|sf|(df<<4));
            if (!check(closeColor(playable_window_hardware_pixel(64,64),expected,2) &&
                    abs((int)(playable_window_hardware_pixel(64,64)>>24)-(int)(expected>>24))<=2,
                    "all 72 original RGBA blend-factor combinations")) {
                fprintf(stderr,"blend sf=%d df=%d actual=%08x expected=%08x\n",sf,df,playable_window_hardware_pixel(64,64),expected);return 17;
            }
        }
    }
    playable_window_shutdown();
    if (hardwareRenderer || hardwarePackedVertices || hardwarePackedStates || hardwarePackedCapacity) return 16;
    puts("PASS: hardware triangles, clipping, depth, multitexture, alpha, blend, viewport, stencil, depthhack, HUD and teardown");
    return 0;
}
