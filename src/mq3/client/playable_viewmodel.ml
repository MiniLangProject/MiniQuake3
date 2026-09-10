// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3-style first-person hand pose for retail weapon MD3 geometry.
package mq3.client.playable_viewmodel

import mq3.client.playable_item_models as itemModels
import mq3.client.playable_viewer as viewer
import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trans
import mq3.format.md3 as md3
import mq3.format.pk3 as pk3
import mq3.shared.math as qmath
import std.string as strings

const DEFAULT_FOV=90.0
const LAND_DEFLECT_TIME=150
const LAND_RETURN_TIME=300
const RUN_BOB_ADVANCE=0.4
const PI=3.14159265358979323846
const SOFTWARE_DEPTHHACK_FORWARD=25.0
const SOFTWARE_DEPTHHACK_SIDE=-1.1
const SOFTWARE_DEPTHHACK_UP=2.0

struct Settings horizontalFov gunX gunY gunZ modelScale end struct
struct Tracker bobPhase lastTime initialized end struct
struct BobSample cycle fraction xySpeed end struct
struct Pose origin axis scale fovOffset bobCycle bobFraction xySpeed end struct
struct Attachment classname path frames end struct
struct Catalog attachments skipped end struct

function fail(message) return error(7620,"playable viewmodel: "+message) end function
function valid3(value) return value!=void and typeof(value)=="array" and len(value)==3 end function

function defaults() return Settings(DEFAULT_FOV,0.0,0.0,0.0,1.0) end function

// The native software path does not yet expose RF_DEPTHHACK's dedicated
// first-person projection/depth range. Keep the genuine hand tag transform,
// but move its parent far enough into that renderer's valid near volume.
function softwareRendererSettings()
  return Settings(DEFAULT_FOV,SOFTWARE_DEPTHHACK_FORWARD,SOFTWARE_DEPTHHACK_SIDE,SOFTWARE_DEPTHHACK_UP,1.0)
end function

function settings(horizontalFov,gunX,gunY,gunZ,modelScale)
  if horizontalFov<=0.0 or horizontalFov>=179.0 or modelScale<=0.0 then return fail("invalid FOV or model scale") end if
  return Settings(numeric.f32(horizontalFov),numeric.f32(gunX),numeric.f32(gunY),numeric.f32(gunZ),numeric.f32(modelScale))
end function

function tracker() return Tracker(0.0,0,false) end function

function handPath(classname)
  name=strings.toLowerAscii(classname)
  if name=="weapon_gauntlet" then return "models/weapons2/gauntlet/gauntlet_hand.md3" end if
  if name=="weapon_machinegun" then return "models/weapons2/machinegun/machinegun_hand.md3" end if
  if name=="weapon_shotgun" then return "models/weapons2/shotgun/shotgun_hand.md3" end if
  if name=="weapon_grenadelauncher" then return "models/weapons2/grenadel/grenadel_hand.md3" end if
  if name=="weapon_rocketlauncher" then return "models/weapons2/rocketl/rocketl_hand.md3" end if
  if name=="weapon_lightning" then return "models/weapons2/lightning/lightning_hand.md3" end if
  if name=="weapon_railgun" then return "models/weapons2/railgun/railgun_hand.md3" end if
  if name=="weapon_plasmagun" then return "models/weapons2/plasma/plasma_hand.md3" end if
  if name=="weapon_bfg" then return "models/weapons2/bfg/bfg_hand.md3" end if
  if name=="weapon_grapplinghook" then return "models/weapons2/grapple/grapple_hand.md3" end if
  return ""
end function

function tagFromFrame(entries,name)
  if entries==void then return void end if
  for each entry in entries if stringEqualsIgnoreCaseAscii(entry.name,name) then return entry end if end for
  return void
end function

// RE_RegisterModel accepts tag-only MD3s. Load their complete animation tag
// stream once so later weapon-frame mapping can use frames beyond idle zero.
function loadCatalog(archive,classnames)
  if archive==void or classnames==void then return fail("archive and classnames are required") end if
  result=Catalog([],0)
  for each classname in classnames
    path=handPath(classname)
    if path!="" then
      duplicate=false;for each value in result.attachments if stringEqualsIgnoreCaseAscii(value.classname,classname) then duplicate=true end if end for
      if not duplicate then
        data=try(pk3.read(archive,path))
        if data is error then result.skipped=result.skipped+1
        else
          model=try(md3.load(data))
          if model is error or len(model.tags)==0 or tagFromFrame(model.tags[0],"tag_weapon")==void then result.skipped=result.skipped+1
          else result.attachments=result.attachments+[Attachment(classname,path,model.tags)] end if
        end if
      end if
    end if
  end for
  return result
end function

function findAttachment(catalog,classname)
  if catalog==void then return void end if
  for each value in catalog.attachments if stringEqualsIgnoreCaseAscii(value.classname,classname) then return value end if end for
  return void
end function

// Baseq3 advances playerState.bobCycle by bobmove*msec while moving. The
// playable controller currently has one run speed, so its stock 0.4 rate is
// the closest available source for CG_CalculateWeaponPosition.
function advance(state,velocity,grounded,now)
  if state==void or not valid3(velocity) or now<0 then return fail("tracker needs velocity and non-negative time") end if
  speed=qmath.VectorLength([velocity[0],velocity[1],0.0])
  if not state.initialized then state.lastTime=now;state.initialized=true
  else
    delta=now-state.lastTime;if delta<0 then return fail("time moved backwards") end if
    state.lastTime=now
    if grounded and speed>=5.0 then
      state.bobPhase=state.bobPhase+RUN_BOB_ADVANCE*delta
      while state.bobPhase>=256.0 state.bobPhase=state.bobPhase-256.0 end while
    else if grounded and speed<5.0 then state.bobPhase=0.0 end if
  end if
  cycle=numeric.trunc32(state.bobPhase)&255
  fraction=trans.sin((cycle&127)/127.0*PI);if fraction<0.0 then fraction=0.0-fraction end if
  return BobSample(cycle,fraction,numeric.f32(speed))
end function

function fovOffset(horizontalFov)
  if horizontalFov>90.0 then return -0.2*(horizontalFov-90.0) end if
  return 0.0
end function

function landingOffset(now,landTime,landChange)
  delta=now-landTime
  if delta<0 then return 0.0 end if
  if delta<LAND_DEFLECT_TIME then return landChange*0.25*delta/LAND_DEFLECT_TIME end if
  if delta<LAND_DEFLECT_TIME+LAND_RETURN_TIME then return landChange*0.25*(LAND_DEFLECT_TIME+LAND_RETURN_TIME-delta)/LAND_RETURN_TIME end if
  return 0.0
end function

// Port of CG_CalculateWeaponPosition followed by CG_AddViewWeapon's gun and
// high-FOV offsets. The caller may pass landTime far in the past when no
// landing event is active.
function calculate(camera,bob,now,landTime,landChange,config)
  if camera==void or bob==void or config==void or now<0 then return fail("camera, bob sample, time and settings are required") end if
  if config.horizontalFov<=0.0 or config.horizontalFov>=179.0 or config.modelScale<=0.0 then return fail("invalid settings") end if
  origin=[camera.position[0],camera.position[1],camera.position[2]+landingOffset(now,landTime,landChange)]
  angles=[camera.pitch,camera.yaw,0.0]
  bobScale=bob.xySpeed;if (bob.cycle&128)!=0 then bobScale=0.0-bobScale end if
  angles[2]=angles[2]+bobScale*bob.fraction*0.005
  angles[1]=angles[1]+bobScale*bob.fraction*0.01
  angles[0]=angles[0]+bob.xySpeed*bob.fraction*0.005
  idle=(bob.xySpeed+40.0)*trans.sin(now*0.001)*0.01
  angles[0]=angles[0]+idle;angles[1]=angles[1]+idle;angles[2]=angles[2]+idle
  viewAxes=viewer.cameraBasis(camera);viewAxes[1]=qmath.VectorScale(viewAxes[1],-1.0)
  origin=qmath.VectorMA(origin,config.gunX,viewAxes[0])
  origin=qmath.VectorMA(origin,config.gunY,viewAxes[1])
  offset=config.gunZ+fovOffset(config.horizontalFov)
  origin=qmath.VectorMA(origin,offset,viewAxes[2])
  axis=qmath.AngleVectors(angles);axis[1]=qmath.VectorScale(axis[1],-1.0)
  return Pose(origin,axis,config.modelScale,fovOffset(config.horizontalFov),bob.cycle,bob.fraction,bob.xySpeed)
end function

function transform(pose)
  if pose==void then return fail("pose is required") end if
  return itemModels.transform(pose.origin,pose.axis,pose.scale)
end function

function multiplyAxis(left,right)
  result=[]
  for row=0 to 2
    result=result+[[]]
    for column=0 to 2 result[row]=result[row]+[left[row][0]*right[0][column]+left[row][1]*right[1][column]+left[row][2]*right[2][column]] end for
  end for
  return result
end function

// CG_PositionEntityOnTag: translate through the parent hand basis, then
// compose tag orientation with the hand orientation in the original order.
function attachWeapon(pose,attachment,frame)
  if pose==void or attachment==void or frame<0 then return fail("weapon pose, attachment and frame are required") end if
  if len(attachment.frames)==0 then return fail("attachment has no tag frames") end if
  if frame>=len(attachment.frames) then frame=len(attachment.frames)-1 end if
  tag=tagFromFrame(attachment.frames[frame],"tag_weapon");if tag==void then return fail("attachment has no tag_weapon") end if
  origin=qmath.VectorMA(pose.origin,tag.origin[0],pose.axis[0]);origin=qmath.VectorMA(origin,tag.origin[1],pose.axis[1]);origin=qmath.VectorMA(origin,tag.origin[2],pose.axis[2])
  return itemModels.transform(origin,multiplyAxis(tag.axis,pose.axis),pose.scale)
end function

// Keeps the preview's short fire response until weapon animation frames are
// available. A zero pulse is an exact no-op; 1000 is the peak pulse value.
function withRecoil(pose,camera,recoil)
  if pose==void or camera==void or recoil<0 then return fail("recoil needs pose, camera and a non-negative pulse") end if
  axes=viewer.cameraBasis(camera)
  origin=qmath.VectorMA(pose.origin,-1.6*recoil/1000.0,axes[0])
  origin=qmath.VectorMA(origin,-0.7*recoil/1000.0,axes[2])
  return Pose(origin,pose.axis,pose.scale,pose.fovOffset,pose.bobCycle,pose.bobFraction,pose.xySpeed)
end function

function frameTransform(camera,bob,now,landTime,landChange,recoil,config)
  pose=calculate(camera,bob,now,landTime,landChange,config);if pose is error then return pose end if
  pose=withRecoil(pose,camera,recoil);if pose is error then return pose end if
  return transform(pose)
end function

function frameWeaponTransform(camera,bob,now,landTime,landChange,recoil,config,attachment,frame)
  pose=calculate(camera,bob,now,landTime,landChange,config);if pose is error then return pose end if
  pose=withRecoil(pose,camera,recoil);if pose is error then return pose end if
  return attachWeapon(pose,attachment,frame)
end function
