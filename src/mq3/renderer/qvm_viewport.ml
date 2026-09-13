// SPDX-License-Identifier: GPL-2.0-or-later
// Maps an original refdef_t rectangle and camera to the native preview surface.
package mq3.renderer.qvm_viewport

import mq3.client.playable_viewer as viewer
import mq3.platform.playable_window as window
import mq3.compat.numeric as numeric

struct Prepared area projection end struct

function fail(message) return error(7691,"QVM viewport: "+message) end function
function edge(value,sourceSize,targetSize) return numeric.trunc32(value*targetSize/sourceSize) end function
function validVector(value) return value!=void and len(value)==3 end function

function prepare(refdef,sourceWidth,sourceHeight,targetWidth,targetHeight)
  if refdef==void or sourceWidth<1 or sourceHeight<1 or targetWidth<1 or targetHeight<1 then return fail("invalid source or target dimensions") end if
  if refdef.x<0 or refdef.y<0 or refdef.width<1 or refdef.height<1 or refdef.x>sourceWidth-refdef.width or refdef.y>sourceHeight-refdef.height then return fail("refdef rectangle is outside the source surface") end if
  if not validVector(refdef.vieworg) or refdef.viewaxis==void or len(refdef.viewaxis)!=3 or not validVector(refdef.viewaxis[0]) or not validVector(refdef.viewaxis[1]) or not validVector(refdef.viewaxis[2]) then return fail("refdef camera is incomplete") end if
  left=edge(refdef.x,sourceWidth,targetWidth);top=edge(refdef.y,sourceHeight,targetHeight)
  right=edge(refdef.x+refdef.width,sourceWidth,targetWidth);bottom=edge(refdef.y+refdef.height,sourceHeight,targetHeight)
  area=window.viewport(left,top,right-left,bottom-top);if area is error then return area end if
  focal=viewer.focalLength(area.width,refdef.fovX);if focal is error then return focal end if
  projection=viewer.Projection(refdef.vieworg,refdef.viewaxis[1],refdef.viewaxis[2],refdef.viewaxis[0],area.x+area.width*0.5,area.y+area.height*0.5,focal,1.0)
  return Prepared(area,projection)
end function
