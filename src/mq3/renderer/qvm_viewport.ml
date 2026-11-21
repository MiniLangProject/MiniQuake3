// SPDX-License-Identifier: GPL-2.0-or-later
// Maps an original refdef_t rectangle and camera to the native preview surface.
package mq3.renderer.qvm_viewport

import mq3.client.playable_viewer as viewer
import mq3.platform.playable_window as window
import mq3.compat.numeric as numeric

struct Prepared area projection end struct

function fail(message) return error(7691,"QVM viewport: "+message) end function
function edge(value,sourceSize,targetSize)
  scaled=value*targetSize/sourceSize
  if scaled< -2147483648 or scaled>2147483647 then return fail("scaled viewport edge exceeds native integer range") end if
  return numeric.trunc32(scaled)
end function
function validVector(value) return value!=void and len(value)==3 end function

function prepare(refdef,sourceWidth,sourceHeight,targetWidth,targetHeight)
  if refdef==void or sourceWidth<1 or sourceHeight<1 or targetWidth<1 or targetHeight<1 then return fail("invalid source or target dimensions") end if
  if sourceWidth>2147483647 or sourceHeight>2147483647 or targetWidth>2147483647 or targetHeight>2147483647 then return fail("source or target dimensions exceed native integer range") end if
  // Original UI_DrawPlayer intentionally submits offscreen refdefs (Controls:
  // y=-60, height=840 on a720-high drawable). Preserve that full projection;
  // only the native scissor/raster bounds intersect it with the framebuffer.
  if refdef.width<1 or refdef.height<1 then return fail("refdef rectangle has invalid dimensions") end if
  if refdef.x< -2147483648 or refdef.y< -2147483648 or refdef.x>2147483647 or refdef.y>2147483647 or refdef.width>2147483647 or refdef.height>2147483647 or refdef.x+refdef.width>2147483647 or refdef.y+refdef.height>2147483647 then return fail("refdef rectangle exceeds native integer range") end if
  if not validVector(refdef.vieworg) or refdef.viewaxis==void or len(refdef.viewaxis)!=3 or not validVector(refdef.viewaxis[0]) or not validVector(refdef.viewaxis[1]) or not validVector(refdef.viewaxis[2]) then return fail("refdef camera is incomplete") end if
  left=edge(refdef.x,sourceWidth,targetWidth);top=edge(refdef.y,sourceHeight,targetHeight)
  right=edge(refdef.x+refdef.width,sourceWidth,targetWidth);bottom=edge(refdef.y+refdef.height,sourceHeight,targetHeight)
  if left is error then return left end if;if top is error then return top end if;if right is error then return right end if;if bottom is error then return bottom end if
  if right-left>2147483647 or bottom-top>2147483647 then return fail("scaled viewport dimensions exceed native integer range") end if
  area=window.viewport(left,top,right-left,bottom-top);if area is error then return area end if
  focal=viewer.focalLength(area.width,refdef.fovX);if focal is error then return focal end if
  verticalFocal=viewer.focalLength(area.height,refdef.fovY);if verticalFocal is error then return verticalFocal end if
  // refdef_t stores forward/LEFT/up (AnglesToAxis); the projection expects
  // screen-right. Passing left mirrored the scene and horizontal mouse look.
  screenAxes=viewer.refdefBasis(refdef.viewaxis)
  projection=viewer.Projection(refdef.vieworg,screenAxes[1],refdef.viewaxis[2],refdef.viewaxis[0],area.x+area.width*0.5,area.y+area.height*0.5,focal,1.0,verticalFocal)
  return Prepared(area,projection)
end function
