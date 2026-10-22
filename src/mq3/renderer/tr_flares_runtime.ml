// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Stateful C-named facade for renderer/tr_flares.c.  Geometry/depth/fog
// formulas delegate to the productive playable flare renderer.
package mq3.renderer.tr_flares_runtime

import mq3.compat.numeric as n
import mq3.client.playable_viewer as viewer
import mq3.renderer.playable_flares as playable
import std.array as arrays

const MAX_FLARES=128
struct Flare slot addedFrame inPortal frameSceneNum surface fogNum fadeTime visible drawIntensity windowX windowY eyeZ color origin normal end struct
struct Light origin color end struct
struct Quad fogNum positions texCoords color indexes end struct
struct State slots active inactive projection area frameCount frameSceneNum isPortal time fadeRate sizeValue identityLight enabled fogCatalog adds tests renders finishCalled end struct

function fail(message) return error(7740,"tr_flares: "+message) end function
function emptyFlare(slot) return Flare(slot,0,false,0,void,0,0,false,0.0,0,0,0.0,[0.0,0.0,0.0],[0.0,0.0,0.0],void) end function
function create(projection,area,fogCatalog)
  state=State([],[],[],projection,area,0,0,false,0,playable.DEFAULT_FADE,playable.DEFAULT_SIZE,1.0,true,fogCatalog,0,0,0,false);R_ClearFlares(state);return state
end function
function R_ClearFlares(state)
  if state==void then return fail("state required") end if;state.slots=[];state.active=[];state.inactive=[]
  for index=0 to MAX_FLARES-1 state.slots=state.slots+[emptyFlare(index)];state.inactive=[index]+state.inactive end for;return MAX_FLARES
end function
function activeFlare(state,surface)
  for each index in state.active flare=state.slots[index];if flare.surface==surface and flare.frameSceneNum==state.frameSceneNum and flare.inPortal==state.isPortal then return flare end if end for;return void
end function
function allocate(state,surface)
  if len(state.inactive)==0 then return void end if;index=state.inactive[0];state.inactive=arrays.slice(state.inactive,1,len(state.inactive)-1);state.active=[index]+state.active;flare=state.slots[index];flare.surface=surface;flare.frameSceneNum=state.frameSceneNum;flare.inPortal=state.isPortal;flare.addedFrame=-1;return flare
end function
function RB_AddFlare(state,surface,fogNum,point,color,normal)
  if state==void or point==void or color==void or len(point)!=3 or len(color)!=3 then return fail("valid flare input required") end if;state.adds=state.adds+1
  screen=viewer.projectPrepared(state.projection,point);if screen==void or screen is error then return void end if
  if screen.x<state.area.x or screen.x>=state.area.x+state.area.width or screen.y<state.area.y or screen.y>=state.area.y+state.area.height then return void end if
  flare=activeFlare(state,surface);if flare==void then flare=allocate(state,surface);if flare==void then return void end if end if
  if flare.addedFrame!=state.frameCount-1 then flare.visible=false;flare.fadeTime=state.time-2000 end if
  flare.addedFrame=state.frameCount;flare.fogNum=fogNum;flare.color=[color[0],color[1],color[2]]
  if normal!=void then direction=playable.facing(state.projection.position,point,normal);for axis=0 to 2 flare.color[axis]=flare.color[axis]*direction end for end if
  flare.windowX=n.trunc32(screen.x);flare.windowY=n.trunc32(screen.y);flare.eyeZ=-screen.depth;flare.origin=[point[0],point[1],point[2]];flare.normal=normal;return flare
end function
function RB_AddDlightFlares(state,lights)
  if state==void or not state.enabled then return 0 end if;if lights==void then return 0 end if;count=0
  for index=0 to len(lights)-1 light=lights[index];fogNum=playable.fogIndexAt(state.fogCatalog,light.origin);flare=RB_AddFlare(state,"dlight:"+str(index),fogNum,light.origin,light.color,void);if flare!=void then count=count+1 end if end for;return count
end function
function RB_TestFlare(state,flare,surfaceDepth)
  if state==void or flare==void then return fail("state and flare required") end if;state.tests=state.tests+1;state.finishCalled=false;visible=playable.visibleAtDepth(-flare.eyeZ,surfaceDepth);return playable.updateState(flare,visible,state.time,state.fadeRate)
end function
function colorByte(value) return playable.colorByte(value) end function
function RB_RenderFlare(state,flare)
  if state==void or flare==void then return fail("state and flare required") end if;state.renders=state.renders+1
  color=[colorByte(flare.color[0]*flare.drawIntensity*state.identityLight*255.0),colorByte(flare.color[1]*flare.drawIntensity*state.identityLight*255.0),colorByte(flare.color[2]*flare.drawIntensity*state.identityLight*255.0),255]
  retained=playable.Flare(-1,-1,flare.fogNum,flare.origin,flare.color,flare.normal);color=playable.foggedColor(retained,color,state.fogCatalog,state.projection.position,state.projection.forward)
  size=playable.flareSize(state.area.width,-flare.eyeZ,state.sizeValue);x=flare.windowX;y=flare.windowY
  return Quad(flare.fogNum,[[x-size,y-size,0.0],[x-size,y+size,0.0],[x+size,y+size,0.0],[x+size,y-size,0.0]],[[0.0,0.0],[0.0,1.0],[1.0,1.0],[1.0,0.0]],color,[0,1,2,0,2,3])
end function
function removeActive(state,index)
  next=[];for each value in state.active if value!=index then next=next+[value] end if end for;state.active=next;state.inactive=[index]+state.inactive;return void
end function
function RB_RenderFlares(state,depthValues)
  if state==void or not state.enabled then return [] end if;draw=false;remove=[]
  for each index in state.active
    flare=state.slots[index]
    if flare.addedFrame<state.frameCount-1 then remove=remove+[index]
    else
      flare.drawIntensity=0.0
      if flare.frameSceneNum==state.frameSceneNum and flare.inPortal==state.isPortal then
        depth=0.0;if depthValues!=void and index<len(depthValues) then depth=depthValues[index] end if;RB_TestFlare(state,flare,depth)
        if flare.drawIntensity>0.0 then draw=true else remove=remove+[index] end if
      end if
    end if
  end for
  for each index in remove removeActive(state,index) end for;if not draw then return [] end if
  result=[];for each index in state.active flare=state.slots[index];if flare.frameSceneNum==state.frameSceneNum and flare.inPortal==state.isPortal and flare.drawIntensity>0.0 then result=result+[RB_RenderFlare(state,flare)] end if end for;return result
end function
