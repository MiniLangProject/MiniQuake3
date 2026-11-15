#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include "../native/playable_win32.c"

static void triangle(const double a[2],const double b[2],const double c[2],int multi) {
    if (multi) playable_window_draw_triangle_multitexture(0,1,
        a[0],a[1],2,0,0,0,0,1,b[0],b[1],2,0,0,0,0,1,c[0],c[1],2,0,0,0,0,1,255,255,255);
    else playable_window_draw_triangle(0,
        a[0],a[1],2,0,0,1,b[0],b[1],2,0,0,1,c[0],c[1],2,0,0,1,255,255,255);
}
int main(void) {
    const unsigned char color[4]={20,40,60,255},white[4]={255,255,255,255};
    int offset,split,winding,multi,order,x,y;
    if (!allocateSurface(8,8)||!playable_window_upload_texture(0,color,1,1)||!playable_window_upload_texture(1,white,1,1)) return 1;
    for (offset=0;offset<2;++offset) for (split=0;split<2;++split)
        for (winding=0;winding<2;++winding) for (multi=0;multi<2;++multi) for (order=0;order<2;++order) {
            double low=offset ? 0.5 : 0.0,high=offset ? 7.5 : 8.0;
            const double points[4][2]={{low,low},{high,low},{high,high},{low,high}};
            const int indexes[2][2][3]={{{0,1,2},{0,2,3}},{{0,1,3},{1,2,3}}};
            int item;
            playable_window_begin_frame(0,0,0);playable_window_set_raster_state(2,0,0);
            for (item=0;item<2;++item) {
                const int *ids=indexes[split][item^order];
                triangle(points[ids[0]],points[ids[winding ? 2 : 1]],points[ids[winding ? 1 : 2]],multi);
            }
            for (y=0;y<8;++y) for (x=0;x<8;++x) {
                uint32_t expected=offset&&(x==7||y==7) ? UINT32_C(0xff000000) : UINT32_C(0xff14283c);
                if (pixels[y*8+x]!=expected) {
                    fprintf(stderr,"fill mismatch offset=%d split=%d winding=%d multi=%d order=%d pixel=%d,%d actual=%08x expected=%08x\n",offset,split,winding,multi,order,x,y,pixels[y*8+x],expected);return 2;
                }
            }
        }
    playable_window_shutdown();puts("playable top-left triangle fill: PASS (32 additive quad cases)");return 0;
}
