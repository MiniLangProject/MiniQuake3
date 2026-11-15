#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include "../native/playable_win32.c"

int main(void) {
    const unsigned char base[4] = {40,80,160,64};
    const unsigned char cloud[4] = {20,50,120,32};
    playableSkySourceVertex grid[4] = {{0,0,0,0},{8,0,1,0},{0,8,0,1},{8,8,1,1}};
    playableTriangleBatchRecord records[4];
    float before;
    if (!allocateSurface(8,8) || !playable_window_upload_texture(0,base,1,1) ||
            !playable_window_upload_texture(1,cloud,1,1)) return 1;
    if (playable_window_update_sky_layer((unsigned char *)records,sizeof(records),0,
            (unsigned char *)grid,sizeof(grid),1,1,0,1,1,0,0,1000,1000000)!=2 ||
            playable_window_update_sky_layer((unsigned char *)records,sizeof(records),2,
            (unsigned char *)grid,sizeof(grid),1,1,1,1,1,0,0,1000,999999)!=2) return 2;
    playable_window_begin_frame(7,11,13);before=depthPixels[3*8+2];
    playable_window_set_raster_state(3,1,1);
    playable_window_set_alpha_test(3);playable_window_set_texture_clamp(1);playable_window_set_polygon_offset(1);
    if (playable_window_draw_sky_layer((unsigned char *)records,sizeof(records),0,2,0)!=2 ||
            pixels[3*8+2]!=UINT32_C(0x402850a0)) return 3;
    if (playable_window_draw_sky_layer((unsigned char *)records,sizeof(records),2,2,1)!=2 ||
            pixels[3*8+2]!=UINT32_C(0x603c82ff)) {
        fprintf(stderr,"sky ONE+ONE pixel: %08x expected 603c82ff\n",pixels[3*8+2]);return 4;
    }
    if (depthPixels[3*8+2]!=before || rasterBlendMode!=3 || rasterDepthEqual!=1 ||
            rasterDepthWrite!=1 || rasterAlphaTest!=3 || rasterClampTexture!=1 || rasterPolygonOffset!=1) return 5;
    if (pixels[3*8+3]!=UINT32_C(0x603c82ff)) {
        fprintf(stderr,"sky shared-edge pixel: %08x expected 603c82ff\n",pixels[3*8+3]);return 6;
    }
    playable_window_begin_frame(7,11,13);playable_window_clear_depth(2.0);before=depthPixels[3*8+2];
    playable_window_draw_sky_layer((unsigned char *)records,sizeof(records),0,2,0);
    playable_window_draw_sky_layer((unsigned char *)records,sizeof(records),2,2,1);
    if (pixels[3*8+2]!=UINT32_C(0xff070b0d) || depthPixels[3*8+2]!=before) return 7;
    if (playable_window_draw_sky_layer((unsigned char *)records,0,0,2,0)!=0) return 8;
    playable_window_shutdown();puts("playable sky native blend: PASS");return 0;
}
