#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>

typedef int qboolean;
#define qtrue 1
#define qfalse 0
#define PRINT_ALL 0

typedef struct { void (*Printf)(int,const char *,...); } rendererImport_t;
typedef struct { qboolean stereoEnabled; } glconfig_t;
static void quietPrintf(int level,const char *format,...) { (void)level; (void)format; }
static rendererImport_t ri={quietPrintf};
static glconfig_t glConfig;

#include "win_glimp_complete_under_test.inc"

int main(void) {
    static const int configs[][4]={{0,0,0,0},{16,16,0,0},{24,24,8,0},{32,24,8,1},{16,32,4,1}};
    int index;
    for (index=0;index<(int)(sizeof(configs)/sizeof(configs[0]));++index) {
        PIXELFORMATDESCRIPTOR pfd;
        GLW_CreatePFD(&pfd,configs[index][0],configs[index][1],configs[index][2],configs[index][3]);
        printf("P %lu %u %u %u %u %u %d\n",(unsigned long)pfd.dwFlags,(unsigned)pfd.iPixelType,
            (unsigned)pfd.cColorBits,(unsigned)pfd.cDepthBits,(unsigned)pfd.cStencilBits,
            (unsigned)pfd.iLayerType,glConfig.stereoEnabled);
    }
    return 0;
}
