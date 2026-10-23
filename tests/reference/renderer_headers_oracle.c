#include <stdio.h>
#include <stddef.h>
#include "../../Quake-III-Arena-original-source/code/renderer/tr_local.h"
int main(void) {
 printf("api=%d\n",REF_API_VERSION);
 printf("pub=%u,%u,%u,%u\n",(unsigned)sizeof(refexport_t),(unsigned)offsetof(refexport_t,Shutdown),(unsigned)offsetof(refexport_t,RenderScene),(unsigned)offsetof(refexport_t,inPVS));
 printf("imp=%u,%u,%u,%u\n",(unsigned)sizeof(refimport_t),(unsigned)offsetof(refimport_t,Printf),(unsigned)offsetof(refimport_t,FS_ReadFile),(unsigned)offsetof(refimport_t,CIN_RunCinematic));
 printf("qgl=%x,%x,%x,%x\n",GL_ACTIVE_TEXTURE_ARB,GL_TEXTURE0_ARB,GL_RGB_S3TC,GL_RGB4_S3TC);
 printf("local=%u,%u,%u,%u,%u,%u\n",(unsigned)sizeof(glIndex_t),(unsigned)sizeof(dlight_t),(unsigned)sizeof(image_t),(unsigned)sizeof(drawSurf_t),(unsigned)sizeof(renderCommandList_t),(unsigned)sizeof(stretchPicCommand_t));
 printf("offsets=%u,%u,%u,%u\n",(unsigned)offsetof(dlight_t,transformed),(unsigned)offsetof(image_t,texnum),(unsigned)offsetof(drawSurf_t,surface),(unsigned)offsetof(stretchPicCommand_t,shader));
 printf("limits=%d,%d,%d,%d,%d,%d\n",MAX_SHADERS,MAX_DRAWSURFS,MAX_RENDER_COMMANDS,MAX_POLYS,MAX_POLYVERTS,SMP_FRAMES);
 printf("sort=%d,%d,%d,%d\n",QSORT_SHADERNUM_SHIFT,QSORT_ENTITYNUM_SHIFT,QSORT_FOGNUM_SHIFT,DRAWSURF_MASK);
 printf("state=%x,%x,%x,%x,%x\n",GLS_SRCBLEND_BITS,GLS_DSTBLEND_BITS,GLS_DEPTHMASK_TRUE,GLS_DEPTHFUNC_EQUAL,GLS_ATEST_BITS);
 return 0;
}
