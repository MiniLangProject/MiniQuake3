# `src/mq3/client/playable_viewmodel.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_viewmodel`](Package-mq3-client-playable-viewmodel-729267518.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_item_models.ml` as `itemModels` → [src/mq3/client/playable_item_models.ml](File-src-mq3-client-playable-item-models-ml-1740601852.md)
- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/format/md3.ml` as `md3` → [src/mq3/format/md3.ml](File-src-mq3-format-md3-ml-2098563759.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-playable-viewmodel-advance-function-advance-state-velocity-grounded-now-src-mq3-client-playable-viewmodel-ml-1586637376"></a>
### advance

```ml
function advance(state, velocity, grounded, now)
```

Baseq3 advances playerState.bobCycle by bobmove*msec while moving. The playable controller currently has one run speed, so its stock 0.4 rate is the closest available source for CG_CalculateWeaponPosition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable viewmodel record/storage; this routine assigns `state.lastTime`, `state.initialized`, `state.bobPhase`. |
| `velocity` | `dynamic` | — | Velocity vector used to advance or orient the effect. |
| `grounded` | `dynamic` | — | Value used by `if grounded and speed>=5.0 then`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L273)

<a id="function-function-mq3-client-playable-viewmodel-animatedframes-function-animatedframes-classname-firstframe-count-fps-elapsed-switching-src-mq3-client-playable-viewmodel-ml-1247688522"></a>
### animatedFrames

```ml
function animatedFrames(classname, firstFrame, count, fps, elapsed, switching)
```

Calls `mq3.client.playable_viewmodel.FrameSample`, `mq3.compat.numeric.trunc32` from playable viewmodel `animatedFrames`. The final path returns `FrameSample(classname,oldFrame,frame,1.0-fraction,switching)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — | Value used by `if elapsed<0 or count<1 or fps<1 then return FrameSample(classname,0,0,0.0,switching) end if`. |
| `firstFrame` | `dynamic` | — | Value used by `frame=firstFrame+step`. |
| `count` | `dynamic` | — | Value tested by `elapsed<0 or count<1 or fps<1`, `step>=count` before the calculation continues. |
| `fps` | `dynamic` | — | Value used by `if elapsed<0 or count<1 or fps<1 then return FrameSample(classname,0,0,0.0,switching) end if`. |
| `elapsed` | `dynamic` | — | Value used by `if elapsed<0 or count<1 or fps<1 then return FrameSample(classname,0,0,0.0,switching) end if`. |
| `switching` | `dynamic` | — | Value used by `if elapsed<0 or count<1 or fps<1 then return FrameSample(classname,0,0,0.0,switching) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L174)

- [mq3.client.playable_viewmodel.Attachment](Type-mq3-client-playable-viewmodel-attachment-206761453.md) — struct
<a id="function-function-mq3-client-playable-viewmodel-attachmenttag-function-attachmenttag-attachment-oldframe-frame-backlerp-src-mq3-client-playable-viewmodel-ml-2003147708"></a>
### attachmentTag

```ml
function attachmentTag(attachment, oldFrame, frame, backlerp)
```

Calls `mq3.client.playable_viewmodel.tagFromFrame`, `mq3.shared.math.VectorNormalize`, `mq3.format.md3.Tag` from playable viewmodel `attachmentTag`. The final path returns `md3.Tag("tag_weapon",origin,axis)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `attachment` | `dynamic` | — | Record read through `attachment.frames`. |
| `oldFrame` | `dynamic` | — | Value used by `if attachment==void or oldFrame<0 or frame<0 or backlerp<0.0 or backlerp>1.0 or len(attachment.frames)==0 then return fail("invalid attachment...`. |
| `frame` | `dynamic` | — | Value used by `if attachment==void or oldFrame<0 or frame<0 or backlerp<0.0 or backlerp>1.0 or len(attachment.frames)==0 then return fail("invalid attachment...`. |
| `backlerp` | `dynamic` | — | Value used by `if attachment==void or oldFrame<0 or frame<0 or backlerp<0.0 or backlerp>1.0 or len(attachment.frames)==0 then return fail("invalid attachment...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L362)

<a id="function-function-mq3-client-playable-viewmodel-attachweapon-function-attachweapon-pose-attachment-oldframe-frame-backlerp-src-mq3-client-playable-viewmodel-ml-1451611657"></a>
### attachWeapon

```ml
function attachWeapon(pose, attachment, oldFrame, frame, backlerp)
```

CG_PositionEntityOnTag: translate through the parent hand basis, then compose tag orientation with the hand orientation in the original order.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pose` | `dynamic` | — | Record read through `pose.origin`, `pose.axis`, `pose.scale`. |
| `attachment` | `dynamic` | — | Value used by `tag=attachmentTag(attachment,oldFrame,frame,backlerp)`. |
| `oldFrame` | `dynamic` | — | Value used by `tag=attachmentTag(attachment,oldFrame,frame,backlerp)`. |
| `frame` | `dynamic` | — | Value used by `tag=attachmentTag(attachment,oldFrame,frame,backlerp)`. |
| `backlerp` | `dynamic` | — | Value used by `tag=attachmentTag(attachment,oldFrame,frame,backlerp)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L384)

- [mq3.client.playable_viewmodel.BobSample](Type-mq3-client-playable-viewmodel-bobsample-121066897.md) — struct
<a id="function-function-mq3-client-playable-viewmodel-calculate-function-calculate-camera-bob-now-landtime-landchange-config-src-mq3-client-playable-viewmodel-ml-1921336021"></a>
### calculate

```ml
function calculate(camera, bob, now, landTime, landChange, config)
```

Port of CG_CalculateWeaponPosition followed by CG_AddViewWeapon's gun and high-FOV offsets. The caller may pass landTime far in the past when no landing event is active.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. Record read through `camera.position`, `camera.pitch`, `camera.yaw`. |
| `bob` | `dynamic` | — | Record read through `bob.xySpeed`, `bob.cycle`, `bob.fraction`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `landTime` | `dynamic` | — | Value used by `origin=[camera.position[0],camera.position[1],camera.position[2]+landingOffset(now,landTime,landChange)]`. |
| `landChange` | `dynamic` | — | Value used by `origin=[camera.position[0],camera.position[1],camera.position[2]+landingOffset(now,landTime,landChange)]`. |
| `config` | `dynamic` | — | Record read through `config.horizontalFov`, `config.modelScale`, `config.gunX`, `config.gunY` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L318)

- [mq3.client.playable_viewmodel.Catalog](Type-mq3-client-playable-viewmodel-catalog-54939439.md) — struct
<a id="constant-constant-mq3-client-playable-viewmodel-default-fov-const-default-fov-90-src-mq3-client-playable-viewmodel-ml-786521534"></a>
### DEFAULT_FOV

```ml
const DEFAULT_FOV = 90
```

Fallback fov setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L15)

<a id="function-function-mq3-client-playable-viewmodel-defaults-function-defaults-src-mq3-client-playable-viewmodel-ml-592368924"></a>
### defaults

```ml
function defaults()
```

Creates a `mq3.client.playable_viewmodel.Settings` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L136)

<a id="function-function-mq3-client-playable-viewmodel-fail-function-fail-message-src-mq3-client-playable-viewmodel-ml-1563695871"></a>
### fail

```ml
function fail(message)
```

Creates the playable viewmodel error `7620` with diagnostic text `"playable viewmodel: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"playable viewmodel: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L130)

<a id="function-function-mq3-client-playable-viewmodel-findattachment-function-findattachment-catalog-classname-src-mq3-client-playable-viewmodel-ml-1481423902"></a>
### findAttachment

```ml
function findAttachment(catalog, classname)
```

Searches the playable viewmodel collection for find attachment, returning `void` when no entry matches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.attachments`. |
| `classname` | `dynamic` | — | Value used by `for each value in catalog.attachments if stringEqualsIgnoreCaseAscii(value.classname,classname) then return value end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L260)

<a id="function-function-mq3-client-playable-viewmodel-fovoffset-function-fovoffset-horizontalfov-src-mq3-client-playable-viewmodel-ml-1405151563"></a>
### fovOffset

```ml
function fovOffset(horizontalFov)
```

Evaluates playable viewmodel `fovOffset` and returns `-0.2*(horizontalFov-90.0)`, `0.0` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `horizontalFov` | `dynamic` | — | Value used by `if horizontalFov>90.0 then return -0.2*(horizontalFov-90.0) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L292)

- [mq3.client.playable_viewmodel.FrameSample](Type-mq3-client-playable-viewmodel-framesample-1541521567.md) — struct
<a id="function-function-mq3-client-playable-viewmodel-frametransform-function-frametransform-camera-bob-now-landtime-landchange-recoil-config-src-mq3-client-playable-viewmodel-ml-1000226303"></a>
### frameTransform

```ml
function frameTransform(camera, bob, now, landTime, landChange, recoil, config)
```

Calls `mq3.client.playable_viewmodel.calculate`, `mq3.client.playable_viewmodel.withRecoil`, `mq3.client.playable_viewmodel.transform` from playable viewmodel `frameTransform`. The final path returns `transform(pose)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `bob` | `dynamic` | — | Value used by `pose=calculate(camera,bob,now,landTime,landChange,config)`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `landTime` | `dynamic` | — | Value used by `pose=calculate(camera,bob,now,landTime,landChange,config)`. |
| `landChange` | `dynamic` | — | Value used by `pose=calculate(camera,bob,now,landTime,landChange,config)`. |
| `recoil` | `dynamic` | — | Value used by `pose=withRecoil(pose,camera,recoil)`. |
| `config` | `dynamic` | — | Value used by `pose=calculate(camera,bob,now,landTime,landChange,config)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L412)

<a id="function-function-mq3-client-playable-viewmodel-frameweapontransform-function-frameweapontransform-camera-bob-now-landtime-landchange-recoil-config-attachment-oldframe-frame-backlerp-src-mq3-client-playable-viewmodel-ml-771319487"></a>
### frameWeaponTransform

```ml
function frameWeaponTransform(camera, bob, now, landTime, landChange, recoil, config, attachment, oldFrame, frame, backlerp)
```

Calls `mq3.client.playable_viewmodel.calculate`, `mq3.client.playable_viewmodel.withRecoil`, `mq3.client.playable_viewmodel.attachWeapon` from playable viewmodel `frameWeaponTransform`. The final path returns `attachWeapon(pose,attachment,oldFrame,frame,backlerp)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `bob` | `dynamic` | — | Value used by `pose=calculate(camera,bob,now,landTime,landChange,config)`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `landTime` | `dynamic` | — | Value used by `pose=calculate(camera,bob,now,landTime,landChange,config)`. |
| `landChange` | `dynamic` | — | Value used by `pose=calculate(camera,bob,now,landTime,landChange,config)`. |
| `recoil` | `dynamic` | — | Value used by `pose=withRecoil(pose,camera,recoil)`. |
| `config` | `dynamic` | — | Value used by `pose=calculate(camera,bob,now,landTime,landChange,config)`. |
| `attachment` | `dynamic` | — | Value used by `return attachWeapon(pose,attachment,oldFrame,frame,backlerp)`. |
| `oldFrame` | `dynamic` | — | Value used by `return attachWeapon(pose,attachment,oldFrame,frame,backlerp)`. |
| `frame` | `dynamic` | — | Value used by `return attachWeapon(pose,attachment,oldFrame,frame,backlerp)`. |
| `backlerp` | `dynamic` | — | Value used by `return attachWeapon(pose,attachment,oldFrame,frame,backlerp)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L430)

<a id="function-function-mq3-client-playable-viewmodel-handpath-function-handpath-classname-src-mq3-client-playable-viewmodel-ml-883251383"></a>
### handPath

```ml
function handPath(classname)
```

Calls `std.string.toLowerAscii` from playable viewmodel `handPath`. The final path returns `""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — | Value used by `name=strings.toLowerAscii(classname)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L208)

<a id="constant-constant-mq3-client-playable-viewmodel-land-deflect-time-const-land-deflect-time-150-src-mq3-client-playable-viewmodel-ml-252838315"></a>
### LAND_DEFLECT_TIME

```ml
const LAND_DEFLECT_TIME = 150
```

Milliseconds spent moving the view during the initial landing kick.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L17)

<a id="constant-constant-mq3-client-playable-viewmodel-land-return-time-const-land-return-time-300-src-mq3-client-playable-viewmodel-ml-313325952"></a>
### LAND_RETURN_TIME

```ml
const LAND_RETURN_TIME = 300
```

Milliseconds spent restoring the view after the landing kick.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L19)

<a id="function-function-mq3-client-playable-viewmodel-landingoffset-function-landingoffset-now-landtime-landchange-src-mq3-client-playable-viewmodel-ml-345527193"></a>
### landingOffset

```ml
function landingOffset(now, landTime, landChange)
```

Evaluates playable viewmodel `landingOffset` and returns `0.0`, `landChange*0.25*delta/LAND_DEFLECT_TIME`, `landChange*0.25*(LAND_DEFLECT_TIME+LAND_RETURN_TIME-delta)/LAND_RETURN_TIME` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `landTime` | `dynamic` | — | Value used by `delta=now-landTime`. |
| `landChange` | `dynamic` | — | Value used by `if delta<LAND_DEFLECT_TIME then return landChange*0.25*delta/LAND_DEFLECT_TIME end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L301)

<a id="function-function-mq3-client-playable-viewmodel-loadcatalog-function-loadcatalog-archive-classnames-src-mq3-client-playable-viewmodel-ml-993506340"></a>
### loadCatalog

```ml
function loadCatalog(archive, classnames)
```

RE_RegisterModel accepts tag-only MD3s. Load their complete animation tag stream once so later weapon-frame mapping can use frames beyond idle zero.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `classnames` | `dynamic` | — | Value used by `if archive==void or classnames==void then return fail("archive and classnames are required") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L236)

<a id="function-function-mq3-client-playable-viewmodel-multiplyaxis-function-multiplyaxis-left-right-src-mq3-client-playable-viewmodel-ml-739972429"></a>
### multiplyAxis

```ml
function multiplyAxis(left, right)
```

Evaluates playable viewmodel `multiplyAxis` and returns `result` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Sequence read at `left[row]`. |
| `right` | `dynamic` | — | Sequence read at `right[0]`, `right[1]`, `right[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L348)

<a id="constant-constant-mq3-client-playable-viewmodel-pi-const-pi-3-141593-src-mq3-client-playable-viewmodel-ml-250935315"></a>
### PI

```ml
const PI = 3.141593
```

Circle constant used to convert or evaluate angles in trigonometric calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L23)

- [mq3.client.playable_viewmodel.Pose](Type-mq3-client-playable-viewmodel-pose-1179003037.md) — struct
<a id="constant-constant-mq3-client-playable-viewmodel-run-bob-advance-const-run-bob-advance-0-4-src-mq3-client-playable-viewmodel-ml-84894387"></a>
### RUN_BOB_ADVANCE

```ml
const RUN_BOB_ADVANCE = 0.4
```

Phase-advance factor used when updating running weapon bob.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L21)

<a id="function-function-mq3-client-playable-viewmodel-sampleweaponanimation-function-sampleweaponanimation-state-classname-now-lastfire-src-mq3-client-playable-viewmodel-ml-959158500"></a>
### sampleWeaponAnimation

```ml
function sampleWeaponAnimation(state, classname, now, lastFire)
```

CG_MapTorsoToWeaponFrame maps the six 15-fps attack frames to hand frames 1..6. A weapon change spends 200 ms dropping the old model through the mapped 20-fps frames beginning at 6, then 250 ms raising the new model; the source mapping intentionally leaves TORSO_RAISE on hand frame zero.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable viewmodel record/storage; this routine assigns `state.targetClass`, `state.transitionStart`, `state.switching`, `state.displayedClass`. |
| `classname` | `dynamic` | — | Value assigned to `state.targetClass`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `lastFire` | `dynamic` | — | Value used by `return animatedFrames(state.displayedClass,1,6,15,now-lastFire,false)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L191)

<a id="function-function-mq3-client-playable-viewmodel-settings-function-settings-horizontalfov-gunx-guny-gunz-modelscale-src-mq3-client-playable-viewmodel-ml-931949781"></a>
### settings

```ml
function settings(horizontalFov, gunX, gunY, gunZ, modelScale)
```

Calls `mq3.client.playable_viewmodel.Settings`, `mq3.compat.numeric.f32` from playable viewmodel `settings`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `horizontalFov` | `dynamic` | — | Value used by `if horizontalFov<=0.0 or horizontalFov>=179.0 or modelScale<=0.0 then return fail("invalid FOV or model scale") end if`. |
| `gunX` | `dynamic` | — | Value used by `return Settings(numeric.f32(horizontalFov),numeric.f32(gunX),numeric.f32(gunY),numeric.f32(gunZ),numeric.f32(modelScale))`. |
| `gunY` | `dynamic` | — | Value used by `return Settings(numeric.f32(horizontalFov),numeric.f32(gunX),numeric.f32(gunY),numeric.f32(gunZ),numeric.f32(modelScale))`. |
| `gunZ` | `dynamic` | — | Value used by `return Settings(numeric.f32(horizontalFov),numeric.f32(gunX),numeric.f32(gunY),numeric.f32(gunZ),numeric.f32(modelScale))`. |
| `modelScale` | `dynamic` | — | Value used by `if horizontalFov<=0.0 or horizontalFov>=179.0 or modelScale<=0.0 then return fail("invalid FOV or model scale") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L152)

- [mq3.client.playable_viewmodel.Settings](Type-mq3-client-playable-viewmodel-settings-718567293.md) — struct
<a id="constant-constant-mq3-client-playable-viewmodel-software-depthhack-forward-const-software-depthhack-forward-25-src-mq3-client-playable-viewmodel-ml-571303764"></a>
### SOFTWARE_DEPTHHACK_FORWARD

```ml
const SOFTWARE_DEPTHHACK_FORWARD = 25
```

Forward viewmodel offset used by the software-renderer first-person weapon transform.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L25)

<a id="constant-constant-mq3-client-playable-viewmodel-software-depthhack-side-const-software-depthhack-side-1-1-src-mq3-client-playable-viewmodel-ml-836304972"></a>
### SOFTWARE_DEPTHHACK_SIDE

```ml
const SOFTWARE_DEPTHHACK_SIDE = -1.1
```

Sideways viewmodel offset used by the software-renderer first-person weapon transform.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L27)

<a id="constant-constant-mq3-client-playable-viewmodel-software-depthhack-up-const-software-depthhack-up-2-src-mq3-client-playable-viewmodel-ml-1269876095"></a>
### SOFTWARE_DEPTHHACK_UP

```ml
const SOFTWARE_DEPTHHACK_UP = 2
```

Vertical viewmodel offset used by the software-renderer first-person weapon transform.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L29)

<a id="function-function-mq3-client-playable-viewmodel-softwarerenderersettings-function-softwarerenderersettings-src-mq3-client-playable-viewmodel-ml-1016964496"></a>
### softwareRendererSettings

```ml
function softwareRendererSettings()
```

Near-plane polygon clipping preserves partially visible weapon triangles. The retail CD machinegun's unmodified hand-tag attachment still projects entirely below a 640x480 viewport, so keep the visible parent adjustment isolated here until the dedicated viewmodel projection is source-matched.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L142)

<a id="function-function-mq3-client-playable-viewmodel-tagfromframe-function-tagfromframe-entries-name-src-mq3-client-playable-viewmodel-ml-481922507"></a>
### tagFromFrame

```ml
function tagFromFrame(entries, name)
```

Calls `stringEqualsIgnoreCaseAscii` from playable viewmodel `tagFromFrame`. The final path returns `entry`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entries` | `dynamic` | — | Value used by `if entries==void then return void end if`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable viewmodel resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L226)

<a id="function-function-mq3-client-playable-viewmodel-tracker-function-tracker-src-mq3-client-playable-viewmodel-ml-352637828"></a>
### tracker

```ml
function tracker()
```

Creates a `mq3.client.playable_viewmodel.Tracker` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L158)

- [mq3.client.playable_viewmodel.Tracker](Type-mq3-client-playable-viewmodel-tracker-28652620.md) — struct
<a id="function-function-mq3-client-playable-viewmodel-transform-function-transform-pose-src-mq3-client-playable-viewmodel-ml-1638065877"></a>
### transform

```ml
function transform(pose)
```

Calls `mq3.client.playable_item_models.transform` from playable viewmodel `transform`. The final path returns `itemModels.transform(pose.origin,pose.axis,pose.scale)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pose` | `dynamic` | — | Record read through `pose.origin`, `pose.axis`, `pose.scale`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L340)

<a id="function-function-mq3-client-playable-viewmodel-valid3-function-valid3-value-src-mq3-client-playable-viewmodel-ml-478903329"></a>
### valid3

```ml
function valid3(value)
```

Computes `value!=void and typeof(value)=="array" and len(value)==3` for playable viewmodel `valid3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence whose length/content is inspected by `valid3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L133)

<a id="function-function-mq3-client-playable-viewmodel-weaponanimation-function-weaponanimation-initialclass-src-mq3-client-playable-viewmodel-ml-1600763488"></a>
### weaponAnimation

```ml
function weaponAnimation(initialClass)
```

Calls `mq3.client.playable_viewmodel.WeaponAnimation` from playable viewmodel `weaponAnimation`. The final path returns `WeaponAnimation(initialClass,initialClass,0,false)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `initialClass` | `dynamic` | — | Value used by `if typeof(initialClass)!="string" or initialClass=="" then return fail("weapon animation needs an initial classname") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L162)

- [mq3.client.playable_viewmodel.WeaponAnimation](Type-mq3-client-playable-viewmodel-weaponanimation-1741882450.md) — struct
<a id="function-function-mq3-client-playable-viewmodel-withrecoil-function-withrecoil-pose-camera-recoil-src-mq3-client-playable-viewmodel-ml-1826958400"></a>
### withRecoil

```ml
function withRecoil(pose, camera, recoil)
```

Keeps the preview's short fire response until weapon animation frames are available. A zero pulse is an exact no-op; 1000 is the peak pulse value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pose` | `dynamic` | — | Record read through `pose.origin`, `pose.axis`, `pose.scale`, `pose.fovOffset` and additional values. |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `recoil` | `dynamic` | — | Value used by `if pose==void or camera==void or recoil<0 then return fail("recoil needs pose, camera and a non-negative pulse") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L396)
