/* SPDX-License-Identifier: GPL-2.0-or-later
 * Frozen immediate-mode reference for exact driver-local array comparison. */
static int hardwareDrawBatchImmediate(const unsigned char *records, int count, const hardwareView *view) {
    int index, vertex;
    int lastBase = INT_MIN, lastLightmap = INT_MIN, lastOverlay = -1;
    int active = 0;
    if (!hardwareRenderer) return 0;
    playableTraceBatch(records,count,view ? view->x : 0,view ? view->y : 0,
        view ? view->width : surfaceWidth,view ? view->height : surfaceHeight,
        view ? view->position : 0,view ? view->right : 0,view ? view->up : 0,view ? view->forward : 0,
        view ? view->focal : 0,view ? view->nearDistance : 0);
    playableGlViewport(view ? view->x : 0, view ? surfaceHeight-view->y-view->height : 0,
        view ? view->width : surfaceWidth, view ? view->height : surfaceHeight);
    mq_glEnable(GL_SCISSOR_TEST);
    mq_glScissor(view ? view->x : 0, view ? surfaceHeight-view->y-view->height : 0,
        view ? view->width : surfaceWidth, view ? view->height : surfaceHeight);
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
    for (index = 0; index < count; ++index) {
        playableTriangleBatchRecord command;
        int overlay;
        memcpy(&command, records+(SIZE_T)index*sizeof(command), sizeof(command));
        overlay = !view && command.vertex[0][2] < 0.01f && command.vertex[1][2] < 0.01f && command.vertex[2][2] < 0.01f;
        if (command.baseTextureSlot != lastBase || command.lightmapTextureSlot != lastLightmap || overlay != lastOverlay) {
            if (active) mq_glEnd();
            hardwareState(overlay);
            hardwareTextureUnit(MQ_GL_TEXTURE0, command.baseTextureSlot);
            hardwareTextureUnit(MQ_GL_TEXTURE1, command.lightmapTextureSlot);
            mq_glActiveTexture(MQ_GL_TEXTURE0);
            mq_glBegin(GL_TRIANGLES); active = 1; ++hardwareDrawCalls;
            lastBase = command.baseTextureSlot; lastLightmap = command.lightmapTextureSlot; lastOverlay = overlay;
        }
        for (vertex = 0; vertex < 3; ++vertex) {
            const float *p = command.vertex[vertex];
            double x,y,depth;
            double light = p[7];
            int textured = (command.baseTextureSlot >= 0 && command.baseTextureSlot < PLAYABLE_TEXTURE_SLOTS && textures[command.baseTextureSlot].pixels) ||
                (command.lightmapTextureSlot >= 0 && command.lightmapTextureSlot < PLAYABLE_TEXTURE_SLOTS && textures[command.lightmapTextureSlot].pixels);
            mq_glColor4d(command.vertexColor[vertex][0]/255.0*light*(textured ? 1.0 : command.fallbackRed/255.0),
                command.vertexColor[vertex][1]/255.0*light*(textured ? 1.0 : command.fallbackGreen/255.0),
                command.vertexColor[vertex][2]/255.0*light*(textured ? 1.0 : command.fallbackBlue/255.0),
                command.vertexColor[vertex][3]/255.0);
            mq_glMultiTexCoord2f(MQ_GL_TEXTURE0,p[3],p[4]); mq_glMultiTexCoord2f(MQ_GL_TEXTURE1,p[5],p[6]);
            if (view) mq_glVertex3fv(p);
            else {
                depth=p[2]; x=(p[0]*2.0/surfaceWidth-1.0)*depth; y=(1.0-p[1]*2.0/surfaceHeight)*depth;
                mq_glVertex4d(x,y,overlay ? 0.0 : depth-2.0*hardwareNear,depth);
            }
        }
    }
    if (active) mq_glEnd();
    hardwareTriangles += (unsigned int)count;
    mq_glActiveTexture(MQ_GL_TEXTURE0);
    return count;
}
