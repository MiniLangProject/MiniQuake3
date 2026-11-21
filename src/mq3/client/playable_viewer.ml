// SPDX-License-Identifier: GPL-2.0-or-later
// MiniLang-owned first-person preview camera and perspective line projection.
package mq3.client.playable_viewer

import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trans
import mq3.shared.math as qmath

const MIN_PITCH=-89.0
const MAX_PITCH=89.0
const MAX_FRAME_MILLISECONDS=100
const DEFAULT_NEAR=1.0

struct Camera position yaw pitch moveSpeed mouseSensitivity end struct
struct Controls forward back left right up down mouseX mouseY end struct
struct ScreenPoint x y depth end struct
struct ScreenLine visible a b clipped end struct
struct Projection position right up forward halfWidth halfHeight focal nearDistance verticalFocal end struct

function camera(position,yaw,pitch,moveSpeed,mouseSensitivity)
  if position==void or len(position)!=3 then return error(7470,"viewer camera needs a three-component position") end if
  if moveSpeed<0.0 then return error(7471,"viewer move speed cannot be negative") end if
  if mouseSensitivity<0.0 then return error(7472,"viewer mouse sensitivity cannot be negative") end if
  state=Camera([numeric.f32(position[0]),numeric.f32(position[1]),numeric.f32(position[2])],numeric.f32(yaw),numeric.f32(pitch),numeric.f32(moveSpeed),numeric.f32(mouseSensitivity))
  normalizeAngles(state)
  return state
end function

function controls(forward,back,left,right,up,down,mouseX,mouseY)
  return Controls(forward,back,left,right,up,down,numeric.f32(mouseX),numeric.f32(mouseY))
end function

function idleControls() return controls(false,false,false,false,false,false,0.0,0.0) end function

function clampDelta(deltaMilliseconds)
  if deltaMilliseconds<0 then return 0 end if
  if deltaMilliseconds>MAX_FRAME_MILLISECONDS then return MAX_FRAME_MILLISECONDS end if
  return deltaMilliseconds
end function

function normalizeAngles(state)
  state.yaw=qmath.AngleNormalize180(state.yaw)
  if state.pitch<MIN_PITCH then state.pitch=MIN_PITCH end if
  if state.pitch>MAX_PITCH then state.pitch=MAX_PITCH end if
  state.pitch=numeric.f32(state.pitch)
  return void
end function

function applyMouse(state,mouseX,mouseY)
  state.yaw=numeric.fadd(state.yaw,numeric.fmul(numeric.f32(mouseX),state.mouseSensitivity))
  state.pitch=numeric.fsub(state.pitch,numeric.fmul(numeric.f32(mouseY),state.mouseSensitivity))
  normalizeAngles(state)
  return void
end function

function cameraBasis(state)
  return qmath.AngleVectors([state.pitch,state.yaw,0.0])
end function

// Original refdef_t/AnglesToAxis stores forward, LEFT, up. Screen-space
// projection and cloud-ray generation use forward, RIGHT, up instead.
function refdefBasis(axes)
  left=axes[1]
  return [axes[0],[numeric.fneg(left[0]),numeric.fneg(left[1]),numeric.fneg(left[2])],axes[2]]
end function

function movementBasis(state)
  axes=qmath.AngleVectors([0.0,state.yaw,0.0])
  return [axes[0],axes[1],[0.0,0.0,1.0]]
end function

function step(state,command,deltaMilliseconds)
  if state==void or command==void then return error(7473,"viewer step needs camera and controls") end if
  applyMouse(state,command.mouseX,command.mouseY)
  milliseconds=clampDelta(deltaMilliseconds)
  if milliseconds==0 or state.moveSpeed==0.0 then return milliseconds end if
  forward=0;side=0;vertical=0
  if command.forward then forward=forward+1 end if
  if command.back then forward=forward-1 end if
  if command.right then side=side+1 end if
  if command.left then side=side-1 end if
  if command.up then vertical=vertical+1 end if
  if command.down then vertical=vertical-1 end if
  if forward==0 and side==0 and vertical==0 then return milliseconds end if
  axes=movementBasis(state)
  wish=[numeric.fadd(numeric.fmul(forward,axes[0][0]),numeric.fadd(numeric.fmul(side,axes[1][0]),numeric.fmul(vertical,axes[2][0]))),numeric.fadd(numeric.fmul(forward,axes[0][1]),numeric.fadd(numeric.fmul(side,axes[1][1]),numeric.fmul(vertical,axes[2][1]))),numeric.fadd(numeric.fmul(forward,axes[0][2]),numeric.fadd(numeric.fmul(side,axes[1][2]),numeric.fmul(vertical,axes[2][2])))]
  qmath.VectorNormalize(wish)
  distance=numeric.fmul(state.moveSpeed,numeric.fdiv(milliseconds,1000.0))
  state.position=qmath.VectorMA(state.position,distance,wish)
  return milliseconds
end function

function viewPoint(state,world)
  if world==void or len(world)!=3 then return error(7474,"viewer point needs three components") end if
  delta=[numeric.fsub(world[0],state.position[0]),numeric.fsub(world[1],state.position[1]),numeric.fsub(world[2],state.position[2])]
  axes=cameraBasis(state)
  return [qmath.DotProduct(delta,axes[1]),qmath.DotProduct(delta,axes[2]),qmath.DotProduct(delta,axes[0])]
end function

function focalLength(width,horizontalFovDegrees)
  if width<=0 then return error(7475,"viewer projection width must be positive") end if
  if horizontalFovDegrees<=0.0 or horizontalFovDegrees>=179.0 then return error(7476,"viewer field of view must be between zero and 179 degrees") end if
  radians=numeric.fdiv(numeric.fmul(numeric.f32(horizontalFovDegrees),numeric.f32(3.14159265358979323846)),360.0)
  tangent=numeric.fdiv(numeric.f32(trans.sin(radians)),numeric.f32(trans.cos(radians)))
  return numeric.fdiv(numeric.fmul(width,0.5),tangent)
end function

function projectViewPoint(point,width,height,horizontalFovDegrees,nearDistance)
  if point==void or len(point)!=3 then return error(7477,"viewer projection point needs three components") end if
  if height<=0 then return error(7478,"viewer projection height must be positive") end if
  if nearDistance<=0.0 then return error(7479,"viewer near distance must be positive") end if
  if point[2]<nearDistance then return void end if
  focal=focalLength(width,horizontalFovDegrees);if focal is error then return focal end if
  scale=numeric.fdiv(focal,point[2])
  x=numeric.fadd(numeric.fmul(width,0.5),numeric.fmul(point[0],scale))
  y=numeric.fsub(numeric.fmul(height,0.5),numeric.fmul(point[1],scale))
  return ScreenPoint(x,y,point[2])
end function

function projectPoint(state,world,width,height,horizontalFovDegrees,nearDistance)
  local=viewPoint(state,world);if local is error then return local end if
  return projectViewPoint(local,width,height,horizontalFovDegrees,nearDistance)
end function

// Frame-local projection state avoids recalculating camera trigonometry and
// field-of-view constants for every BSP and MD3 vertex.
function prepareProjection(state,width,height,horizontalFovDegrees,nearDistance)
  if state==void or width<=0 or height<=0 or nearDistance<=0.0 then return error(7480,"invalid prepared projection") end if
  focal=focalLength(width,horizontalFovDegrees);if focal is error then return focal end if
  axes=cameraBasis(state)
  return Projection(state.position,axes[1],axes[2],axes[0],width*0.5,height*0.5,focal,nearDistance,focal)
end function

function preparedViewPoint(projection,world)
  if projection==void or world==void or len(world)!=3 then return error(7481,"prepared projection needs a point") end if
  dx=world[0]-projection.position[0];dy=world[1]-projection.position[1];dz=world[2]-projection.position[2]
  side=dx*projection.right[0]+dy*projection.right[1]+dz*projection.right[2]
  up=dx*projection.up[0]+dy*projection.up[1]+dz*projection.up[2]
  depth=dx*projection.forward[0]+dy*projection.forward[1]+dz*projection.forward[2]
  return [side,up,depth]
end function

function projectPreparedView(projection,point)
  if projection==void or point==void or len(point)!=3 then return error(7482,"prepared view projection needs a point") end if
  depth=point[2]
  if depth<projection.nearDistance then return void end if
  scale=projection.focal/depth
  return ScreenPoint(projection.halfWidth+point[0]*scale,projection.halfHeight-point[1]*projection.verticalFocal/depth,depth)
end function

function projectPrepared(projection,world)
  point=preparedViewPoint(projection,world);if point is error then return point end if
  return projectPreparedView(projection,point)
end function

function clipNearVertex(a,b,nearDistance)
  denominator=b[2]-a[2];if denominator==0.0 then return void end if
  fraction=(nearDistance-a[2])/denominator;result=[]
  for component=0 to len(a)-1 result=result+[a[component]+fraction*(b[component]-a[component])] end for
  result[2]=nearDistance
  return result
end function

// Sutherland-Hodgman clipping for a camera-space polygon. Components after
// xyz are interpolated with the intersection and can carry UV/light values.
function clipNearPolygon(vertices,nearDistance)
  if vertices==void or len(vertices)<3 or nearDistance<=0.0 then return error(7483,"invalid near-plane polygon") end if
  width=len(vertices[0]);if width<3 then return error(7483,"invalid near-plane polygon") end if
  for each vertex in vertices if vertex==void or len(vertex)!=width then return error(7483,"invalid near-plane polygon") end if end for
  result=[];previous=vertices[len(vertices)-1];previousInside=previous[2]>=nearDistance
  for each current in vertices
    currentInside=current[2]>=nearDistance
    if currentInside then
      if not previousInside then intersection=clipNearVertex(previous,current,nearDistance);if intersection!=void then result=result+[intersection] end if end if
      result=result+[current]
    else if previousInside then
      intersection=clipNearVertex(previous,current,nearDistance);if intersection!=void then result=result+[intersection] end if
    end if
    previous=current;previousInside=currentInside
  end for
  return result
end function

function clipNear(a,b,nearDistance)
  if a[2]>=nearDistance then return a end if
  denominator=numeric.fsub(b[2],a[2])
  if denominator==0.0 then return void end if
  fraction=numeric.fdiv(numeric.fsub(nearDistance,a[2]),denominator)
  return [numeric.fadd(a[0],numeric.fmul(fraction,numeric.fsub(b[0],a[0]))),numeric.fadd(a[1],numeric.fmul(fraction,numeric.fsub(b[1],a[1]))),numeric.f32(nearDistance)]
end function

function projectLine(state,startPoint,endPoint,width,height,horizontalFovDegrees,nearDistance)
  if nearDistance<=0.0 then return error(7479,"viewer near distance must be positive") end if
  a=viewPoint(state,startPoint);if a is error then return a end if
  b=viewPoint(state,endPoint);if b is error then return b end if
  if a[2]<nearDistance and b[2]<nearDistance then return ScreenLine(false,void,void,false) end if
  clipped=false
  if a[2]<nearDistance then a=clipNear(a,b,nearDistance);clipped=true end if
  if b[2]<nearDistance then b=clipNear(b,a,nearDistance);clipped=true end if
  pa=projectViewPoint(a,width,height,horizontalFovDegrees,nearDistance);if pa is error then return pa end if
  pb=projectViewPoint(b,width,height,horizontalFovDegrees,nearDistance);if pb is error then return pb end if
  return ScreenLine(true,pa,pb,clipped)
end function
