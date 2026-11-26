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

/// Fallback fov setting used when constructing the native client simulation or effect configuration.
const DEFAULT_FOV=90.0
/// Milliseconds spent moving the view during the initial landing kick.
const LAND_DEFLECT_TIME=150
/// Milliseconds spent restoring the view after the landing kick.
const LAND_RETURN_TIME=300
/// Phase-advance factor used when updating running weapon bob.
const RUN_BOB_ADVANCE=0.4
/// Circle constant used to convert or evaluate angles in trigonometric calculations.
const PI=3.14159265358979323846
/// Forward viewmodel offset used by the software-renderer first-person weapon transform.
const SOFTWARE_DEPTHHACK_FORWARD=25.0
/// Sideways viewmodel offset used by the software-renderer first-person weapon transform.
const SOFTWARE_DEPTHHACK_SIDE=-1.1
/// Vertical viewmodel offset used by the software-renderer first-person weapon transform.
const SOFTWARE_DEPTHHACK_UP=2.0

/// Stores playable viewmodel settings record, including `horizontalFov`, `gunX`, `gunY`, `gunZ`, `modelScale`.
struct Settings
  /// When constructing this record, `defaults` supplies `DEFAULT_FOV` for this member.
  horizontalFov
  /// When constructing this record, `defaults` supplies `0.0` for this member.
  gunX
  /// When constructing this record, `defaults` supplies `0.0` for this member.
  gunY
  /// When constructing this record, `defaults` supplies `0.0` for this member.
  gunZ
  /// When constructing this record, `defaults` supplies `1.0` for this member.
  modelScale
end struct
/// Stores playable viewmodel tracker record, including `bobPhase`, `lastTime`, `initialized`.
struct Tracker
  /// When constructing this record, `tracker` supplies `0.0` for this member.
  bobPhase
  /// When constructing this record, `tracker` supplies `0` for this member.
  lastTime
  /// True after the first animation update establishes the previous timestamp used for subsequent frame
  /// deltas.
  initialized
end struct
/// Stores playable viewmodel bob sample record, including `cycle`, `fraction`, `xySpeed`.
struct BobSample
  /// When constructing this record, `advance` supplies `cycle` for this member.
  cycle
  /// When constructing this record, `advance` supplies `fraction` for this member.
  fraction
  /// When constructing this record, `advance` supplies `numeric.f32(speed)` for this member.
  xySpeed
end struct
/// Stores playable viewmodel pose record, including `origin`, `axis`, `scale`, `fovOffset`, `bobCycle`, `bobFraction` and additional values.
struct Pose
  /// Origin of the first-person weapon pose used to construct its model transform.
  origin
  /// Three orientation basis vectors used to transform the rendered object.
  axis
  /// When constructing this record, `calculate` supplies `config.modelScale` for this member. Used by
  /// `transform` and `attachWeapon` during subsequent processing.
  scale
  /// When constructing this record, `calculate` supplies `fovOffset(config.horizontalFov)` for this
  /// member. Used by `withRecoil` during subsequent processing.
  fovOffset
  /// When constructing this record, `calculate` supplies `bob.cycle` for this member. Used by
  /// `withRecoil` during subsequent processing.
  bobCycle
  /// When constructing this record, `calculate` supplies `bob.fraction` for this member. Used by
  /// `withRecoil` during subsequent processing.
  bobFraction
  /// When constructing this record, `calculate` supplies `bob.xySpeed` for this member.
  xySpeed
end struct
/// Stores playable viewmodel attachment record, including `classname`, `path`, `frames`.
struct Attachment
  /// Weapon classname identifying the first-person model attachment being prepared.
  classname
  /// When constructing this record, `loadCatalog` supplies `path` for this member.
  path
  /// When constructing this record, `loadCatalog` supplies `model.tags` for this member. Used by
  /// `attachmentTag` during subsequent processing.
  frames
end struct
/// Stores playable viewmodel catalog record, including `attachments`, `skipped`.
struct Catalog
  /// When constructing this record, `loadCatalog` supplies an empty list for this member. Used by
  /// `findAttachment` during subsequent processing.
  attachments
  /// When constructing this record, `loadCatalog` supplies `0` for this member.
  skipped
end struct
/// Stores playable viewmodel weapon animation record, including `displayedClass`, `targetClass`, `transitionStart`, `switching`.
struct WeaponAnimation
  /// When constructing this record, `weaponAnimation` supplies `initialClass` for this member.
  displayedClass
  /// When constructing this record, `weaponAnimation` supplies `initialClass` for this member.
  targetClass
  /// When constructing this record, `weaponAnimation` supplies `0` for this member.
  transitionStart
  /// When constructing this record, `weaponAnimation` supplies `false` for this member.
  switching
end struct
/// Stores playable viewmodel frame sample record, including `classname`, `oldFrame`, `frame`, `backlerp`, `switching`.
struct FrameSample
  /// Weapon classname identifying the model whose animation frames were sampled.
  classname
  /// Previous animation frame used as the interpolation starting point.
  oldFrame
  /// Current weapon-model animation frame selected for interpolation with oldFrame.
  frame
  /// Previous-frame weight used to interpolate the submitted model entity presented by first-person
  /// weapon animation.
  backlerp
  /// When constructing this record, `animatedFrames` supplies `switching` for this member.
  switching
end struct

/// Creates the playable viewmodel error `7620` with diagnostic text `"playable viewmodel: "+message`.
/// @param message Argument 2 of `error`; passed as `"playable viewmodel: "+message`.
function fail(message) return error(7620,"playable viewmodel: "+message) end function
/// Computes `value!=void and typeof(value)=="array" and len(value)==3` for playable viewmodel `valid3`.
/// @param value Sequence whose length/content is inspected by `valid3`.
function valid3(value) return value!=void and typeof(value)=="array" and len(value)==3 end function

/// Creates a `mq3.client.playable_viewmodel.Settings` record. Initializes the record with the defaults written in this constructor.
function defaults() return Settings(DEFAULT_FOV,0.0,0.0,0.0,1.0) end function

// Near-plane polygon clipping preserves partially visible weapon triangles.
// The retail CD machinegun's unmodified hand-tag attachment still projects
// entirely below a 640x480 viewport, so keep the visible parent adjustment
// isolated here until the dedicated viewmodel projection is source-matched.
function softwareRendererSettings()
  return Settings(DEFAULT_FOV,SOFTWARE_DEPTHHACK_FORWARD,SOFTWARE_DEPTHHACK_SIDE,SOFTWARE_DEPTHHACK_UP,1.0)
end function

/// Calls `mq3.client.playable_viewmodel.Settings`, `mq3.compat.numeric.f32` from playable viewmodel `settings`.
/// @param horizontalFov Value used by `if horizontalFov<=0.0 or horizontalFov>=179.0 or modelScale<=0.0 then return fail("invalid FOV or model scale") end if`.
/// @param gunX Value used by `return Settings(numeric.f32(horizontalFov),numeric.f32(gunX),numeric.f32(gunY),numeric.f32(gunZ),numeric.f32(modelScale))`.
/// @param gunY Value used by `return Settings(numeric.f32(horizontalFov),numeric.f32(gunX),numeric.f32(gunY),numeric.f32(gunZ),numeric.f32(modelScale))`.
/// @param gunZ Value used by `return Settings(numeric.f32(horizontalFov),numeric.f32(gunX),numeric.f32(gunY),numeric.f32(gunZ),numeric.f32(modelScale))`.
/// @param modelScale Value used by `if horizontalFov<=0.0 or horizontalFov>=179.0 or modelScale<=0.0 then return fail("invalid FOV or model scale") end if`.
function settings(horizontalFov,gunX,gunY,gunZ,modelScale)
  if horizontalFov<=0.0 or horizontalFov>=179.0 or modelScale<=0.0 then return fail("invalid FOV or model scale") end if
  return Settings(numeric.f32(horizontalFov),numeric.f32(gunX),numeric.f32(gunY),numeric.f32(gunZ),numeric.f32(modelScale))
end function

/// Creates a `mq3.client.playable_viewmodel.Tracker` record. Initializes the record with the defaults written in this constructor.
function tracker() return Tracker(0.0,0,false) end function

/// Calls `mq3.client.playable_viewmodel.WeaponAnimation` from playable viewmodel `weaponAnimation`. The final path returns `WeaponAnimation(initialClass,initialClass,0,false)`.
/// @param initialClass Value used by `if typeof(initialClass)!="string" or initialClass=="" then return fail("weapon animation needs an initial classname") end if`.
function weaponAnimation(initialClass)
  if typeof(initialClass)!="string" or initialClass=="" then return fail("weapon animation needs an initial classname") end if
  return WeaponAnimation(initialClass,initialClass,0,false)
end function

/// Calls `mq3.client.playable_viewmodel.FrameSample`, `mq3.compat.numeric.trunc32` from playable viewmodel `animatedFrames`. The final path returns `FrameSample(classname,oldFrame,frame,1.0-fraction,switching)`.
/// @param classname Value used by `if elapsed<0 or count<1 or fps<1 then return FrameSample(classname,0,0,0.0,switching) end if`.
/// @param firstFrame Value used by `frame=firstFrame+step`.
/// @param count Value tested by `elapsed<0 or count<1 or fps<1`, `step>=count` before the calculation continues.
/// @param fps Value used by `if elapsed<0 or count<1 or fps<1 then return FrameSample(classname,0,0,0.0,switching) end if`.
/// @param elapsed Value used by `if elapsed<0 or count<1 or fps<1 then return FrameSample(classname,0,0,0.0,switching) end if`.
/// @param switching Value used by `if elapsed<0 or count<1 or fps<1 then return FrameSample(classname,0,0,0.0,switching) end if`.
function animatedFrames(classname,firstFrame,count,fps,elapsed,switching)
  if elapsed<0 or count<1 or fps<1 then return FrameSample(classname,0,0,0.0,switching) end if
  step=numeric.trunc32(elapsed*fps/1000)
  if step>=count then return FrameSample(classname,0,0,0.0,switching) end if
  frame=firstFrame+step;oldFrame=frame;if step>0 then oldFrame=frame-1 end if
  frameStart=step*1000/fps;fraction=(elapsed-frameStart)*fps/1000.0
  return FrameSample(classname,oldFrame,frame,1.0-fraction,switching)
end function

// CG_MapTorsoToWeaponFrame maps the six 15-fps attack frames to hand frames
// 1..6. A weapon change spends 200 ms dropping the old model through the
// mapped 20-fps frames beginning at 6, then 250 ms raising the new model; the
// source mapping intentionally leaves TORSO_RAISE on hand frame zero.
/// @param state Mutable playable viewmodel record/storage; this routine assigns `state.targetClass`, `state.transitionStart`, `state.switching`, `state.displayedClass`.
/// @param classname Value assigned to `state.targetClass`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param lastFire Value used by `return animatedFrames(state.displayedClass,1,6,15,now-lastFire,false)`.
function sampleWeaponAnimation(state,classname,now,lastFire)
  if state==void or typeof(classname)!="string" or classname=="" or now<0 then return fail("invalid weapon animation sample") end if
  if not stringEqualsIgnoreCaseAscii(state.targetClass,classname) then
    state.targetClass=classname;state.transitionStart=now;state.switching=true
  end if
  if state.switching then
    elapsed=now-state.transitionStart;if elapsed<0 then return fail("weapon animation time moved backwards") end if
    if elapsed<200 then return animatedFrames(state.displayedClass,6,5,20,elapsed,true) end if
    state.displayedClass=state.targetClass
    if elapsed<450 then return FrameSample(state.displayedClass,0,0,0.0,true) end if
    state.switching=false
  end if
  return animatedFrames(state.displayedClass,1,6,15,now-lastFire,false)
end function

/// Calls `std.string.toLowerAscii` from playable viewmodel `handPath`. The final path returns `""`.
/// @param classname Value used by `name=strings.toLowerAscii(classname)`.
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

/// Calls `stringEqualsIgnoreCaseAscii` from playable viewmodel `tagFromFrame`. The final path returns `entry`.
/// @param entries Value used by `if entries==void then return void end if`.
/// @param name Name used to select or register the corresponding playable viewmodel resource.
function tagFromFrame(entries,name)
  if entries==void then return void end if
  for each entry in entries if stringEqualsIgnoreCaseAscii(entry.name,name) then return entry end if end for
  return void
end function

// RE_RegisterModel accepts tag-only MD3s. Load their complete animation tag
// stream once so later weapon-frame mapping can use frames beyond idle zero.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param classnames Value used by `if archive==void or classnames==void then return fail("archive and classnames are required") end if`.
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

/// Searches the playable viewmodel collection for find attachment, returning `void` when no entry matches.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.attachments`.
/// @param classname Value used by `for each value in catalog.attachments if stringEqualsIgnoreCaseAscii(value.classname,classname) then return value end if end for`.
function findAttachment(catalog,classname)
  if catalog==void then return void end if
  for each value in catalog.attachments if stringEqualsIgnoreCaseAscii(value.classname,classname) then return value end if end for
  return void
end function

// Baseq3 advances playerState.bobCycle by bobmove*msec while moving. The
// playable controller currently has one run speed, so its stock 0.4 rate is
// the closest available source for CG_CalculateWeaponPosition.
/// @param state Mutable playable viewmodel record/storage; this routine assigns `state.lastTime`, `state.initialized`, `state.bobPhase`.
/// @param velocity Velocity vector used to advance or orient the effect.
/// @param grounded Value used by `if grounded and speed>=5.0 then`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
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

/// Evaluates playable viewmodel `fovOffset` and returns `-0.2*(horizontalFov-90.0)`, `0.0` according to its guard/selection conditions.
/// @param horizontalFov Value used by `if horizontalFov>90.0 then return -0.2*(horizontalFov-90.0) end if`.
function fovOffset(horizontalFov)
  if horizontalFov>90.0 then return -0.2*(horizontalFov-90.0) end if
  return 0.0
end function

/// Evaluates playable viewmodel `landingOffset` and returns `0.0`, `landChange*0.25*delta/LAND_DEFLECT_TIME`, `landChange*0.25*(LAND_DEFLECT_TIME+LAND_RETURN_TIME-delta)/LAND_RETURN_TIME` according to its guard/selection conditions.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param landTime Value used by `delta=now-landTime`.
/// @param landChange Value used by `if delta<LAND_DEFLECT_TIME then return landChange*0.25*delta/LAND_DEFLECT_TIME end if`.
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
/// @param camera Camera state used to transform/project the scene. Record read through `camera.position`, `camera.pitch`, `camera.yaw`.
/// @param bob Record read through `bob.xySpeed`, `bob.cycle`, `bob.fraction`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param landTime Value used by `origin=[camera.position[0],camera.position[1],camera.position[2]+landingOffset(now,landTime,landChange)]`.
/// @param landChange Value used by `origin=[camera.position[0],camera.position[1],camera.position[2]+landingOffset(now,landTime,landChange)]`.
/// @param config Record read through `config.horizontalFov`, `config.modelScale`, `config.gunX`, `config.gunY` and additional values.
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

/// Calls `mq3.client.playable_item_models.transform` from playable viewmodel `transform`. The final path returns `itemModels.transform(pose.origin,pose.axis,pose.scale)`.
/// @param pose Record read through `pose.origin`, `pose.axis`, `pose.scale`.
function transform(pose)
  if pose==void then return fail("pose is required") end if
  return itemModels.transform(pose.origin,pose.axis,pose.scale)
end function

/// Evaluates playable viewmodel `multiplyAxis` and returns `result` according to its guard/selection conditions.
/// @param left Sequence read at `left[row]`.
/// @param right Sequence read at `right[0]`, `right[1]`, `right[2]`.
function multiplyAxis(left,right)
  result=[]
  for row=0 to 2
    result=result+[[]]
    for column=0 to 2 result[row]=result[row]+[left[row][0]*right[0][column]+left[row][1]*right[1][column]+left[row][2]*right[2][column]] end for
  end for
  return result
end function

/// Calls `mq3.client.playable_viewmodel.tagFromFrame`, `mq3.shared.math.VectorNormalize`, `mq3.format.md3.Tag` from playable viewmodel `attachmentTag`. The final path returns `md3.Tag("tag_weapon",origin,axis)`.
/// @param attachment Record read through `attachment.frames`.
/// @param oldFrame Value used by `if attachment==void or oldFrame<0 or frame<0 or backlerp<0.0 or backlerp>1.0 or len(attachment.frames)==0 then return fail("invalid attachment...`.
/// @param frame Value used by `if attachment==void or oldFrame<0 or frame<0 or backlerp<0.0 or backlerp>1.0 or len(attachment.frames)==0 then return fail("invalid attachment...`.
/// @param backlerp Value used by `if attachment==void or oldFrame<0 or frame<0 or backlerp<0.0 or backlerp>1.0 or len(attachment.frames)==0 then return fail("invalid attachment...`.
function attachmentTag(attachment,oldFrame,frame,backlerp)
  if attachment==void or oldFrame<0 or frame<0 or backlerp<0.0 or backlerp>1.0 or len(attachment.frames)==0 then return fail("invalid attachment tag sample") end if
  if oldFrame>=len(attachment.frames) then oldFrame=len(attachment.frames)-1 end if
  if frame>=len(attachment.frames) then frame=len(attachment.frames)-1 end if
  oldTag=tagFromFrame(attachment.frames[oldFrame],"tag_weapon");currentTag=tagFromFrame(attachment.frames[frame],"tag_weapon")
  if oldTag==void or currentTag==void then return fail("attachment has no tag_weapon") end if
  front=1.0-backlerp;origin=[];axis=[]
  for component=0 to 2 origin=origin+[oldTag.origin[component]*backlerp+currentTag.origin[component]*front] end for
  for row=0 to 2
    blended=[];for component=0 to 2 blended=blended+[oldTag.axis[row][component]*backlerp+currentTag.axis[row][component]*front] end for
    qmath.VectorNormalize(blended);axis=axis+[blended]
  end for
  return md3.Tag("tag_weapon",origin,axis)
end function

// CG_PositionEntityOnTag: translate through the parent hand basis, then
// compose tag orientation with the hand orientation in the original order.
/// @param pose Record read through `pose.origin`, `pose.axis`, `pose.scale`.
/// @param attachment Value used by `tag=attachmentTag(attachment,oldFrame,frame,backlerp)`.
/// @param oldFrame Value used by `tag=attachmentTag(attachment,oldFrame,frame,backlerp)`.
/// @param frame Value used by `tag=attachmentTag(attachment,oldFrame,frame,backlerp)`.
/// @param backlerp Value used by `tag=attachmentTag(attachment,oldFrame,frame,backlerp)`.
function attachWeapon(pose,attachment,oldFrame,frame,backlerp)
  if pose==void then return fail("weapon pose is required") end if
  tag=attachmentTag(attachment,oldFrame,frame,backlerp);if tag is error then return tag end if
  origin=qmath.VectorMA(pose.origin,tag.origin[0],pose.axis[0]);origin=qmath.VectorMA(origin,tag.origin[1],pose.axis[1]);origin=qmath.VectorMA(origin,tag.origin[2],pose.axis[2])
  return itemModels.transform(origin,multiplyAxis(tag.axis,pose.axis),pose.scale)
end function

// Keeps the preview's short fire response until weapon animation frames are
// available. A zero pulse is an exact no-op; 1000 is the peak pulse value.
/// @param pose Record read through `pose.origin`, `pose.axis`, `pose.scale`, `pose.fovOffset` and additional values.
/// @param camera Camera state used to transform/project the scene.
/// @param recoil Value used by `if pose==void or camera==void or recoil<0 then return fail("recoil needs pose, camera and a non-negative pulse") end if`.
function withRecoil(pose,camera,recoil)
  if pose==void or camera==void or recoil<0 then return fail("recoil needs pose, camera and a non-negative pulse") end if
  axes=viewer.cameraBasis(camera)
  origin=qmath.VectorMA(pose.origin,-1.6*recoil/1000.0,axes[0])
  origin=qmath.VectorMA(origin,-0.7*recoil/1000.0,axes[2])
  return Pose(origin,pose.axis,pose.scale,pose.fovOffset,pose.bobCycle,pose.bobFraction,pose.xySpeed)
end function

/// Calls `mq3.client.playable_viewmodel.calculate`, `mq3.client.playable_viewmodel.withRecoil`, `mq3.client.playable_viewmodel.transform` from playable viewmodel `frameTransform`. The final path returns `transform(pose)`.
/// @param camera Camera state used to transform/project the scene.
/// @param bob Value used by `pose=calculate(camera,bob,now,landTime,landChange,config)`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param landTime Value used by `pose=calculate(camera,bob,now,landTime,landChange,config)`.
/// @param landChange Value used by `pose=calculate(camera,bob,now,landTime,landChange,config)`.
/// @param recoil Value used by `pose=withRecoil(pose,camera,recoil)`.
/// @param config Value used by `pose=calculate(camera,bob,now,landTime,landChange,config)`.
function frameTransform(camera,bob,now,landTime,landChange,recoil,config)
  pose=calculate(camera,bob,now,landTime,landChange,config);if pose is error then return pose end if
  pose=withRecoil(pose,camera,recoil);if pose is error then return pose end if
  return transform(pose)
end function

/// Calls `mq3.client.playable_viewmodel.calculate`, `mq3.client.playable_viewmodel.withRecoil`, `mq3.client.playable_viewmodel.attachWeapon` from playable viewmodel `frameWeaponTransform`. The final path returns `attachWeapon(pose,attachment,oldFrame,frame,backlerp)`.
/// @param camera Camera state used to transform/project the scene.
/// @param bob Value used by `pose=calculate(camera,bob,now,landTime,landChange,config)`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param landTime Value used by `pose=calculate(camera,bob,now,landTime,landChange,config)`.
/// @param landChange Value used by `pose=calculate(camera,bob,now,landTime,landChange,config)`.
/// @param recoil Value used by `pose=withRecoil(pose,camera,recoil)`.
/// @param config Value used by `pose=calculate(camera,bob,now,landTime,landChange,config)`.
/// @param attachment Value used by `return attachWeapon(pose,attachment,oldFrame,frame,backlerp)`.
/// @param oldFrame Value used by `return attachWeapon(pose,attachment,oldFrame,frame,backlerp)`.
/// @param frame Value used by `return attachWeapon(pose,attachment,oldFrame,frame,backlerp)`.
/// @param backlerp Value used by `return attachWeapon(pose,attachment,oldFrame,frame,backlerp)`.
function frameWeaponTransform(camera,bob,now,landTime,landChange,recoil,config,attachment,oldFrame,frame,backlerp)
  pose=calculate(camera,bob,now,landTime,landChange,config);if pose is error then return pose end if
  pose=withRecoil(pose,camera,recoil);if pose is error then return pose end if
  return attachWeapon(pose,attachment,oldFrame,frame,backlerp)
end function
