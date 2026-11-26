// SPDX-License-Identifier: GPL-2.0-or-later
// MiniLang-owned first-person preview camera and perspective line projection.
package mq3.client.playable_viewer

import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trans
import mq3.shared.math as qmath

/// Lower pitch-angle bound used when clamping the client view.
const MIN_PITCH=-89.0
/// Upper pitch-angle bound used when clamping the client view.
const MAX_PITCH=89.0
/// Upper duration bound in milliseconds for frame processing.
const MAX_FRAME_MILLISECONDS=100
/// Fallback near setting used when constructing the native client simulation or effect configuration.
const DEFAULT_NEAR=1.0

/// Stores playable viewer camera record, including `position`, `yaw`, `pitch`, `moveSpeed`, `mouseSensitivity`.
struct Camera
  /// When constructing this record, `camera` supplies
  /// `[numeric.f32(position[0]),numeric.f32(position[1]),numeric.f32(position[2])]` for this member.
  position
  /// When constructing this record, `camera` supplies `numeric.f32(yaw)` for this member.
  yaw
  /// When constructing this record, `camera` supplies `numeric.f32(pitch)` for this member.
  pitch
  /// When constructing this record, `camera` supplies `numeric.f32(moveSpeed)` for this member.
  moveSpeed
  /// When constructing this record, `camera` supplies `numeric.f32(mouseSensitivity)` for this member.
  mouseSensitivity
end struct
/// Stores playable viewer controls record, including `forward`, `back`, `left`, `right`, `up`, `down` and additional values.
struct Controls
  /// When constructing this record, `controls` supplies `forward` for this member.
  forward
  /// When constructing this record, `controls` supplies `back` for this member.
  back
  /// Left boundary of the interactive or clipped region.
  left
  /// Right boundary of the interactive or clipped region.
  right
  /// When constructing this record, `controls` supplies `up` for this member.
  up
  /// When constructing this record, `controls` supplies `down` for this member.
  down
  /// When constructing this record, `controls` supplies `numeric.f32(mouseX)` for this member.
  mouseX
  /// When constructing this record, `controls` supplies `numeric.f32(mouseY)` for this member.
  mouseY
end struct
/// Stores playable viewer screen point record, including `x`, `y`, `depth`.
struct ScreenPoint
  /// Horizontal coordinate of a camera-projected point in output-screen coordinates.
  x
  /// Vertical coordinate of a camera-projected point in output-screen coordinates.
  y
  /// When constructing this record, `projectViewPoint` supplies `point[2]` for this member.
  depth
end struct
/// Stores playable viewer screen line record, including `visible`, `a`, `b`, `clipped`.
struct ScreenLine
  /// True when the record is eligible for the current drawing or browser-display pass.
  visible
  /// Alpha component controlling opacity or blending.
  a
  /// Blue component of the stored color.
  b
  /// When constructing this record, `projectLine` supplies `false` for this member.
  clipped
end struct
/// Stores playable viewer projection record, including `position`, `right`, `up`, `forward`, `halfWidth`, `halfHeight` and additional values.
struct Projection
  /// When constructing this record, `prepareProjection` supplies `state.position` for this member.
  position
  /// Right boundary of the interactive or clipped region.
  right
  /// When constructing this record, `prepareProjection` supplies `axes[2]` for this member.
  up
  /// When constructing this record, `prepareProjection` supplies `axes[0]` for this member.
  forward
  /// When constructing this record, `prepareProjection` supplies `width*0.5` for this member. Used by
  /// `projectPreparedView` during subsequent processing.
  halfWidth
  /// When constructing this record, `prepareProjection` supplies `height*0.5` for this member. Used by
  /// `projectPreparedView` during subsequent processing.
  halfHeight
  /// When constructing this record, `prepareProjection` supplies `focal` for this member. Used by
  /// `projectPreparedView` during subsequent processing.
  focal
  /// When constructing this record, `prepareProjection` supplies `nearDistance` for this member. Used
  /// by `projectPreparedView` during subsequent processing.
  nearDistance
  /// When constructing this record, `prepareProjection` supplies `focal` for this member. Used by
  /// `projectPreparedView` during subsequent processing.
  verticalFocal
end struct

/// Calls `mq3.client.playable_viewer.Camera`, `mq3.compat.numeric.f32`, `mq3.client.playable_viewer.normalizeAngles` from playable viewer `camera`. The final path returns `state`.
/// @param position Sequence read at `position[0]`, `position[1]`, `position[2]`.
/// @param yaw Value used by `state=Camera([numeric.f32(position[0]),numeric.f32(position[1]),numeric.f32(position[2])],numeric.f32(yaw),numeric.f32(pitch),numeric.f32(move...`.
/// @param pitch Value used by `state=Camera([numeric.f32(position[0]),numeric.f32(position[1]),numeric.f32(position[2])],numeric.f32(yaw),numeric.f32(pitch),numeric.f32(move...`.
/// @param moveSpeed Value used by `if moveSpeed<0.0 then return error(7471,"viewer move speed cannot be negative") end if`.
/// @param mouseSensitivity Value used by `if mouseSensitivity<0.0 then return error(7472,"viewer mouse sensitivity cannot be negative") end if`.
function camera(position,yaw,pitch,moveSpeed,mouseSensitivity)
  if position==void or len(position)!=3 then return error(7470,"viewer camera needs a three-component position") end if
  if moveSpeed<0.0 then return error(7471,"viewer move speed cannot be negative") end if
  if mouseSensitivity<0.0 then return error(7472,"viewer mouse sensitivity cannot be negative") end if
  state=Camera([numeric.f32(position[0]),numeric.f32(position[1]),numeric.f32(position[2])],numeric.f32(yaw),numeric.f32(pitch),numeric.f32(moveSpeed),numeric.f32(mouseSensitivity))
  normalizeAngles(state)
  return state
end function

/// Creates a `mq3.client.playable_viewer.Controls` record. Assigns `forward` from `forward`, `back` from `back`, `left` from `left`, `right` from `right`.
/// @param forward Value used to initialize `Controls.forward`.
/// @param back Value used to initialize `Controls.back`.
/// @param left Value used to initialize `Controls.left`.
/// @param right Value used to initialize `Controls.right`.
/// @param up Value used to initialize `Controls.up`.
/// @param down Value used to initialize `Controls.down`.
/// @param mouseX Value used to initialize `Controls.mouseX`.
/// @param mouseY Value used to initialize `Controls.mouseY`.
function controls(forward,back,left,right,up,down,mouseX,mouseY)
  return Controls(forward,back,left,right,up,down,numeric.f32(mouseX),numeric.f32(mouseY))
end function

/// Adapts `mq3.client.playable_viewer.controls` to playable viewer `idleControls`, returning its result for `false, false, false, false, false, false, 0.0, 0.0`.
function idleControls() return controls(false,false,false,false,false,false,0.0,0.0) end function

/// Evaluates playable viewer `clampDelta` and returns `0`, `MAX_FRAME_MILLISECONDS`, `deltaMilliseconds` according to its guard/selection conditions.
/// @param deltaMilliseconds Elapsed simulation interval in milliseconds.
function clampDelta(deltaMilliseconds)
  if deltaMilliseconds<0 then return 0 end if
  if deltaMilliseconds>MAX_FRAME_MILLISECONDS then return MAX_FRAME_MILLISECONDS end if
  return deltaMilliseconds
end function

/// Updates `state.yaw`, `state.pitch` during playable viewer `normalizeAngles`.
/// @param state Mutable playable viewer record/storage; this routine assigns `state.yaw`, `state.pitch`.
function normalizeAngles(state)
  state.yaw=qmath.AngleNormalize180(state.yaw)
  if state.pitch<MIN_PITCH then state.pitch=MIN_PITCH end if
  if state.pitch>MAX_PITCH then state.pitch=MAX_PITCH end if
  state.pitch=numeric.f32(state.pitch)
  return void
end function

/// Updates `state.yaw`, `state.pitch` during playable viewer `applyMouse`.
/// @param state Mutable playable viewer record/storage; this routine assigns `state.yaw`, `state.pitch`.
/// @param mouseX Value used by `state.yaw=numeric.fadd(state.yaw,numeric.fmul(numeric.f32(mouseX),state.mouseSensitivity))`.
/// @param mouseY Value used by `state.pitch=numeric.fsub(state.pitch,numeric.fmul(numeric.f32(mouseY),state.mouseSensitivity))`.
function applyMouse(state,mouseX,mouseY)
  state.yaw=numeric.fadd(state.yaw,numeric.fmul(numeric.f32(mouseX),state.mouseSensitivity))
  state.pitch=numeric.fsub(state.pitch,numeric.fmul(numeric.f32(mouseY),state.mouseSensitivity))
  normalizeAngles(state)
  return void
end function

/// Adapts `mq3.shared.math.AngleVectors` to playable viewer `cameraBasis`, returning its result for `[state.pitch,state.yaw,0.0]`.
/// @param state Record read through `state.pitch`, `state.yaw`.
function cameraBasis(state)
  return qmath.AngleVectors([state.pitch,state.yaw,0.0])
end function

// Original refdef_t/AnglesToAxis stores forward, LEFT, up. Screen-space
// projection and cloud-ray generation use forward, RIGHT, up instead.
/// @param axes Sequence read at `axes[1]`, `axes[0]`, `axes[2]`.
function refdefBasis(axes)
  left=axes[1]
  return [axes[0],[numeric.fneg(left[0]),numeric.fneg(left[1]),numeric.fneg(left[2])],axes[2]]
end function

/// Calls `mq3.shared.math.AngleVectors` from playable viewer `movementBasis`. The final path returns `[axes[0],axes[1],[0.0,0.0,1.0]]`.
/// @param state Record read through `state.yaw`.
function movementBasis(state)
  axes=qmath.AngleVectors([0.0,state.yaw,0.0])
  return [axes[0],axes[1],[0.0,0.0,1.0]]
end function

/// Updates `state.position` during playable viewer `step`.
/// @param state Mutable playable viewer record/storage; this routine assigns `state.position`.
/// @param command Record read through `command.mouseX`, `command.mouseY`, `command.forward`, `command.back` and additional values.
/// @param deltaMilliseconds Elapsed simulation interval in milliseconds.
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

/// Calls `mq3.compat.numeric.fsub`, `mq3.client.playable_viewer.cameraBasis`, `mq3.shared.math.DotProduct` from playable viewer `viewPoint`. The final path returns `[qmath.DotProduct(delta,axes[1]),qmath.DotProduct(delta,axes[2]),qmath.DotProduct(delta,axes[0])]`.
/// @param state Record read through `state.position`.
/// @param world Sequence read at `world[0]`, `world[1]`, `world[2]`.
function viewPoint(state,world)
  if world==void or len(world)!=3 then return error(7474,"viewer point needs three components") end if
  delta=[numeric.fsub(world[0],state.position[0]),numeric.fsub(world[1],state.position[1]),numeric.fsub(world[2],state.position[2])]
  axes=cameraBasis(state)
  return [qmath.DotProduct(delta,axes[1]),qmath.DotProduct(delta,axes[2]),qmath.DotProduct(delta,axes[0])]
end function

/// Calls `mq3.compat.numeric.fdiv`, `mq3.compat.numeric.fmul`, `mq3.compat.numeric.f32` and additional helpers from playable viewer `focalLength`. The final path returns `numeric.fdiv(numeric.fmul(width,0.5),tangent)`.
/// @param width Width in the coordinate space used by `focalLength`.
/// @param horizontalFovDegrees Horizontal camera field of view in degrees.
function focalLength(width,horizontalFovDegrees)
  if width<=0 then return error(7475,"viewer projection width must be positive") end if
  if horizontalFovDegrees<=0.0 or horizontalFovDegrees>=179.0 then return error(7476,"viewer field of view must be between zero and 179 degrees") end if
  radians=numeric.fdiv(numeric.fmul(numeric.f32(horizontalFovDegrees),numeric.f32(3.14159265358979323846)),360.0)
  tangent=numeric.fdiv(numeric.f32(trans.sin(radians)),numeric.f32(trans.cos(radians)))
  return numeric.fdiv(numeric.fmul(width,0.5),tangent)
end function

/// Calls `mq3.client.playable_viewer.focalLength`, `mq3.compat.numeric.fdiv`, `mq3.compat.numeric.fadd` and additional helpers from playable viewer `projectViewPoint`. The final path returns `ScreenPoint(x,y,point[2])`.
/// @param point Sequence read at `point[2]`, `point[0]`, `point[1]`.
/// @param width Width in the coordinate space used by `projectViewPoint`.
/// @param height Height in the coordinate space used by `projectViewPoint`.
/// @param horizontalFovDegrees Horizontal camera field of view in degrees.
/// @param nearDistance Distance from the camera to the near clipping plane.
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

/// Calls `mq3.client.playable_viewer.viewPoint`, `mq3.client.playable_viewer.projectViewPoint` from playable viewer `projectPoint`. The final path returns `projectViewPoint(local,width,height,horizontalFovDegrees,nearDistance)`.
/// @param state Shared playable viewer state passed to the helper calls in `projectPoint`.
/// @param world world record passed to the playable viewer helper calls.
/// @param width Width in the coordinate space used by `projectPoint`.
/// @param height Height in the coordinate space used by `projectPoint`.
/// @param horizontalFovDegrees Horizontal camera field of view in degrees.
/// @param nearDistance Distance from the camera to the near clipping plane.
function projectPoint(state,world,width,height,horizontalFovDegrees,nearDistance)
  local=viewPoint(state,world);if local is error then return local end if
  return projectViewPoint(local,width,height,horizontalFovDegrees,nearDistance)
end function

// Frame-local projection state avoids recalculating camera trigonometry and
// field-of-view constants for every BSP and MD3 vertex.
/// @param state Record read through `state.position`.
/// @param width Width in the coordinate space used by `prepareProjection`.
/// @param height Height in the coordinate space used by `prepareProjection`.
/// @param horizontalFovDegrees Horizontal camera field of view in degrees.
/// @param nearDistance Distance from the camera to the near clipping plane.
function prepareProjection(state,width,height,horizontalFovDegrees,nearDistance)
  if state==void or width<=0 or height<=0 or nearDistance<=0.0 then return error(7480,"invalid prepared projection") end if
  focal=focalLength(width,horizontalFovDegrees);if focal is error then return focal end if
  axes=cameraBasis(state)
  return Projection(state.position,axes[1],axes[2],axes[0],width*0.5,height*0.5,focal,nearDistance,focal)
end function

/// Evaluates playable viewer `preparedViewPoint` and returns `error(7481,"prepared projection needs a point")`, `[side,up,depth]` according to its guard/selection conditions.
/// @param projection Projection parameters used to convert camera-space geometry to screen coordinates. Record read through `projection.position`, `projection.right`, `projection.up`, `projection.forward`.
/// @param world Sequence read at `world[0]`, `world[1]`, `world[2]`.
function preparedViewPoint(projection,world)
  if projection==void or world==void or len(world)!=3 then return error(7481,"prepared projection needs a point") end if
  dx=world[0]-projection.position[0];dy=world[1]-projection.position[1];dz=world[2]-projection.position[2]
  side=dx*projection.right[0]+dy*projection.right[1]+dz*projection.right[2]
  up=dx*projection.up[0]+dy*projection.up[1]+dz*projection.up[2]
  depth=dx*projection.forward[0]+dy*projection.forward[1]+dz*projection.forward[2]
  return [side,up,depth]
end function

/// Calls `mq3.client.playable_viewer.ScreenPoint` from playable viewer `projectPreparedView`.
/// @param projection Projection parameters used to convert camera-space geometry to screen coordinates. Record read through `projection.nearDistance`, `projection.focal`, `projection.halfWidth`, `projection.halfHeight` and additional values.
/// @param point Sequence read at `point[2]`, `point[0]`, `point[1]`.
function projectPreparedView(projection,point)
  if projection==void or point==void or len(point)!=3 then return error(7482,"prepared view projection needs a point") end if
  depth=point[2]
  if depth<projection.nearDistance then return void end if
  scale=projection.focal/depth
  return ScreenPoint(projection.halfWidth+point[0]*scale,projection.halfHeight-point[1]*projection.verticalFocal/depth,depth)
end function

/// Calls `mq3.client.playable_viewer.preparedViewPoint`, `mq3.client.playable_viewer.projectPreparedView` from playable viewer `projectPrepared`. The final path returns `projectPreparedView(projection,point)`.
/// @param projection Projection parameters used to convert camera-space geometry to screen coordinates.
/// @param world world record passed to the playable viewer helper calls.
function projectPrepared(projection,world)
  point=preparedViewPoint(projection,world);if point is error then return point end if
  return projectPreparedView(projection,point)
end function

/// Evaluates playable viewer `clipNearVertex` and returns `void`, `result` according to its guard/selection conditions.
/// @param a Sequence read at `a[2]`, `a[component]`.
/// @param b Sequence read at `b[2]`, `b[component]`.
/// @param nearDistance Distance from the camera to the near clipping plane.
function clipNearVertex(a,b,nearDistance)
  denominator=b[2]-a[2];if denominator==0.0 then return void end if
  fraction=(nearDistance-a[2])/denominator;result=[]
  for component=0 to len(a)-1 result=result+[a[component]+fraction*(b[component]-a[component])] end for
  result[2]=nearDistance
  return result
end function

// Sutherland-Hodgman clipping for a camera-space polygon. Components after
// xyz are interpolated with the intersection and can carry UV/light values.
/// @param vertices Sequence read at `vertices[0]`, `vertices[len(vertices)-1]`.
/// @param nearDistance Distance from the camera to the near clipping plane.
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

/// Calls `mq3.compat.numeric.fsub`, `mq3.compat.numeric.fdiv`, `mq3.compat.numeric.fadd` and additional helpers from playable viewer `clipNear`.
/// @param a Sequence read at `a[2]`, `a[0]`, `a[1]`.
/// @param b Sequence read at `b[2]`, `b[0]`, `b[1]`.
/// @param nearDistance Distance from the camera to the near clipping plane.
function clipNear(a,b,nearDistance)
  if a[2]>=nearDistance then return a end if
  denominator=numeric.fsub(b[2],a[2])
  if denominator==0.0 then return void end if
  fraction=numeric.fdiv(numeric.fsub(nearDistance,a[2]),denominator)
  return [numeric.fadd(a[0],numeric.fmul(fraction,numeric.fsub(b[0],a[0]))),numeric.fadd(a[1],numeric.fmul(fraction,numeric.fsub(b[1],a[1]))),numeric.f32(nearDistance)]
end function

/// Calls `mq3.client.playable_viewer.viewPoint`, `mq3.client.playable_viewer.ScreenLine`, `mq3.client.playable_viewer.clipNear` and additional helpers from playable viewer `projectLine`. The final path returns `ScreenLine(true,pa,pb,clipped)`.
/// @param state Shared playable viewer state passed to the helper calls in `projectLine`.
/// @param startPoint Starting world-space point of the segment or trace.
/// @param endPoint Ending world-space point of the segment or trace.
/// @param width Width in the coordinate space used by `projectLine`.
/// @param height Height in the coordinate space used by `projectLine`.
/// @param horizontalFovDegrees Horizontal camera field of view in degrees.
/// @param nearDistance Distance from the camera to the near clipping plane.
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
