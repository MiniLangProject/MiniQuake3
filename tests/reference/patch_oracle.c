/* SPDX-License-Identifier: GPL-2.0-or-later
 * Serialize active patch geometry produced by unchanged CM_LoadMap.
 */
#include "cm_local.h"
#include "cm_patch.h"
static void word(FILE *f,int v) { if(fwrite(&v,4,1,f)!=1) exit(70); }
static void real(FILE *f,float v) { if(fwrite(&v,4,1,f)!=1) exit(70); }
int main(int argc,char **argv) {
    int checksum,i,j,k,count=0;FILE *output;
    if(argc!=3) return 2;
    CM_LoadMap(argv[1],qfalse,&checksum);
    output=fopen(argv[2],"wb");if(!output) return 3;
    for(i=0;i<cm.numSurfaces;i++) if(cm.surfaces[i]) count++;
    word(output,count);
    for(i=0;i<cm.numSurfaces;i++) {
        patchCollide_t *pc;if(!cm.surfaces[i]) continue;pc=cm.surfaces[i]->pc;
        word(output,i);word(output,pc->numPlanes);word(output,pc->numFacets);
        for(j=0;j<2;j++) for(k=0;k<3;k++) real(output,pc->bounds[j][k]);
        for(j=0;j<pc->numPlanes;j++) {
            for(k=0;k<4;k++) real(output,pc->planes[j].plane[k]);
            word(output,pc->planes[j].signbits);
        }
        for(j=0;j<pc->numFacets;j++) {
            facet_t *f=&pc->facets[j];word(output,f->surfacePlane);word(output,f->numBorders);
            for(k=0;k<f->numBorders;k++) { word(output,f->borderPlanes[k]);word(output,f->borderInward[k]);word(output,f->borderNoAdjust[k]); }
        }
    }
    fclose(output);return 0;
}
