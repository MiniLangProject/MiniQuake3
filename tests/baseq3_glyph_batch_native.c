#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include "../native/playable_win32.c"

static void referenceGlyph(int code,double x,double y,int red,int green,int blue) {
    double u=(code&15)/16.0,v=(code>>4)/16.0;
    /* Original RB_StretchPic ordering and charset vertex color, using the
     * shader's SRC_ALPHA/ONE_MINUS_SRC_ALPHA rather than the old opaque bug. */
    playable_window_draw_triangle_colored(5,x,y+16,.001,u,v+.0625,x,y,.001,u,v,x+8,y+16,.001,u+.0625,v+.0625,
        red,green,blue,255,red,green,blue,255,red,green,blue,255,255,255,255);
    playable_window_draw_triangle_colored(5,x+8,y+16,.001,u+.0625,v+.0625,x,y,.001,u,v,x+8,y,.001,u+.0625,v,
        red,green,blue,255,red,green,blue,255,red,green,blue,255,255,255,255);
}
int main(int argc,char **argv) {
    const unsigned char atlas[4]={255,128,64,128};
    playableTriangleBatchRecord records[8];uint32_t expected[32*24];float expectedDepth[32*24];FILE *input=0;int mode;
    if (argc!=2||fopen_s(&input,argv[1],"rb")||!input) return 1;
    if (fread(records,sizeof(records),1,input)!=1) { fclose(input);return 2; }fclose(input);
    if (!allocateSurface(32,24)||!playable_window_upload_texture(5,atlas,1,1)) return 3;
    for (mode=0;mode<2;++mode) {
        playable_window_begin_frame(7,11,13);playable_window_set_raster_state(1,0,0);
        referenceGlyph(65,2,2,0,0,0);referenceGlyph(66,10,2,0,0,0);referenceGlyph(65,0,0,255,0,0);referenceGlyph(66,8,0,0,255,0);
        memcpy(expected,pixels,sizeof(expected));memcpy(expectedDepth,depthPixels,sizeof(expectedDepth));
        playable_window_begin_frame(7,11,13);playable_window_set_raster_state(1,0,0);
        if (mode) rasterClipMaximumY=23;
        if (playable_window_draw_triangle_batch((unsigned char *)records,sizeof(records),8)!=8) return 4;
        rasterClipMaximumY=INT_MAX;
        if (memcmp(expected,pixels,sizeof(expected))||memcmp(expectedDepth,depthPixels,sizeof(expectedDepth))) {
            fprintf(stderr,"glyph batch pixel/depth mismatch mode=%d expected=%08x actual=%08x\n",mode,expected[0],pixels[0]);return 5;
        }
        /* Opaque copying would make this red255 and violate the shader. */
        if (((pixels[0]>>16)&255u)>=200u||(pixels[8]&UINT32_C(0x00ff0000))>UINT32_C(0x00080000)) return 6;
    }
    playable_window_shutdown();puts("Baseq3 glyph batch alpha/color/shadow pixels: PASS");return 0;
}
