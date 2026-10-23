#include <stddef.h>
#include <stdio.h>
#define WIN32 1
#include "../../Quake-III-Arena-original-source/code/game/q_shared.h"
#include "../../Quake-III-Arena-original-source/code/cgame/tr_types.h"

int main(void) {
  printf("limits %d %d %d %d\n", MAX_DLIGHTS, MAX_ENTITIES, MAX_RENDER_STRINGS, MAX_RENDER_STRING_LENGTH);
  printf("renderfx %d %d %d %d %d %d %d %d\n", RF_MINLIGHT, RF_THIRD_PERSON, RF_FIRST_PERSON, RF_DEPTHHACK, RF_NOSHADOW, RF_LIGHTING_ORIGIN, RF_SHADOW_PLANE, RF_WRAP_FRAMES);
  printf("rdflags %d %d\n", RDF_NOWORLDMODEL, RDF_HYPERSPACE);
  printf("entitytypes %d %d %d %d %d %d %d %d %d\n", RT_MODEL, RT_POLY, RT_SPRITE, RT_BEAM, RT_RAIL_CORE, RT_RAIL_RINGS, RT_LIGHTNING, RT_PORTALSURFACE, RT_MAX_REF_ENTITY_TYPE);
  printf("enums %d %d %d %d %d %d %d %d %d %d %d %d %d\n", STEREO_CENTER, STEREO_LEFT, STEREO_RIGHT, TC_NONE, TC_S3TC, GLDRV_ICD, GLDRV_STANDALONE, GLDRV_VOODOO, GLHW_GENERIC, GLHW_3DFX_2D3D, GLHW_RIVA128, GLHW_RAGEPRO, GLHW_PERMEDIA2);
  printf("drivers %s %s\n", _3DFX_DRIVER_NAME, OPENGL_DRIVER_NAME);
  printf("sizes %u %u %u %u %u\n", (unsigned)sizeof(polyVert_t), (unsigned)sizeof(poly_t), (unsigned)sizeof(refEntity_t), (unsigned)sizeof(refdef_t), (unsigned)sizeof(glconfig_t));
  printf("refentity %u %u %u %u %u %u %u %u %u %u %u\n", (unsigned)offsetof(refEntity_t,reType), (unsigned)offsetof(refEntity_t,lightingOrigin), (unsigned)offsetof(refEntity_t,axis), (unsigned)offsetof(refEntity_t,nonNormalizedAxes), (unsigned)offsetof(refEntity_t,origin), (unsigned)offsetof(refEntity_t,oldorigin), (unsigned)offsetof(refEntity_t,skinNum), (unsigned)offsetof(refEntity_t,shaderRGBA), (unsigned)offsetof(refEntity_t,shaderTexCoord), (unsigned)offsetof(refEntity_t,radius), (unsigned)offsetof(refEntity_t,rotation));
  printf("refdef %u %u %u %u %u %u %u\n", (unsigned)offsetof(refdef_t,x), (unsigned)offsetof(refdef_t,fov_x), (unsigned)offsetof(refdef_t,vieworg), (unsigned)offsetof(refdef_t,time), (unsigned)offsetof(refdef_t,rdflags), (unsigned)offsetof(refdef_t,areamask), (unsigned)offsetof(refdef_t,text));
  printf("glconfig %u %u %u %u %u %u %u %u\n", (unsigned)offsetof(glconfig_t,renderer_string), (unsigned)offsetof(glconfig_t,maxTextureSize), (unsigned)offsetof(glconfig_t,driverType), (unsigned)offsetof(glconfig_t,deviceSupportsGamma), (unsigned)offsetof(glconfig_t,vidWidth), (unsigned)offsetof(glconfig_t,windowAspect), (unsigned)offsetof(glconfig_t,isFullscreen), (unsigned)offsetof(glconfig_t,smpActive));
  return 0;
}
