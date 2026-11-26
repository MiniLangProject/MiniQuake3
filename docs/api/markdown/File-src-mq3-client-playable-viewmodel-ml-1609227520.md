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
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-playable-viewmodel-advance-function-advance-state-velocity-grounded-now-src-mq3-client-playable-viewmodel-ml-1586637376"></a>
### advance

```ml
function advance(state, velocity, grounded, now)
```

Baseq3 advances playerState.bobCycle by bobmove*msec while moving. The playable controller currently has one run speed, so its stock 0.4 rate is the closest available source for CG_CalculateWeaponPosition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `grounded` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L138)

<a id="function-function-mq3-client-playable-viewmodel-animatedframes-function-animatedframes-classname-firstframe-count-fps-elapsed-switching-src-mq3-client-playable-viewmodel-ml-1247688522"></a>
### animatedFrames

```ml
function animatedFrames(classname, firstFrame, count, fps, elapsed, switching)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — |  |
| `firstFrame` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `fps` | `dynamic` | — |  |
| `elapsed` | `dynamic` | — |  |
| `switching` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L57)

- [mq3.client.playable_viewmodel.Attachment](Type-mq3-client-playable-viewmodel-attachment-206761453.md) — struct
<a id="function-function-mq3-client-playable-viewmodel-attachmenttag-function-attachmenttag-attachment-oldframe-frame-backlerp-src-mq3-client-playable-viewmodel-ml-2003147708"></a>
### attachmentTag

```ml
function attachmentTag(attachment, oldFrame, frame, backlerp)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `attachment` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L205)

<a id="function-function-mq3-client-playable-viewmodel-attachweapon-function-attachweapon-pose-attachment-oldframe-frame-backlerp-src-mq3-client-playable-viewmodel-ml-1451611657"></a>
### attachWeapon

```ml
function attachWeapon(pose, attachment, oldFrame, frame, backlerp)
```

CG_PositionEntityOnTag: translate through the parent hand basis, then compose tag orientation with the hand orientation in the original order.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pose` | `dynamic` | — |  |
| `attachment` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L222)

- [mq3.client.playable_viewmodel.BobSample](Type-mq3-client-playable-viewmodel-bobsample-121066897.md) — struct
<a id="function-function-mq3-client-playable-viewmodel-calculate-function-calculate-camera-bob-now-landtime-landchange-config-src-mq3-client-playable-viewmodel-ml-1921336021"></a>
### calculate

```ml
function calculate(camera, bob, now, landTime, landChange, config)
```

Port of CG_CalculateWeaponPosition followed by CG_AddViewWeapon's gun and high-FOV offsets. The caller may pass landTime far in the past when no landing event is active.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `bob` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `landTime` | `dynamic` | — |  |
| `landChange` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L171)

- [mq3.client.playable_viewmodel.Catalog](Type-mq3-client-playable-viewmodel-catalog-54939439.md) — struct
<a id="constant-constant-mq3-client-playable-viewmodel-default-fov-const-default-fov-90-src-mq3-client-playable-viewmodel-ml-786521534"></a>
### DEFAULT_FOV

```ml
const DEFAULT_FOV = 90
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L14)

<a id="function-function-mq3-client-playable-viewmodel-defaults-function-defaults-src-mq3-client-playable-viewmodel-ml-592368924"></a>
### defaults

```ml
function defaults()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L35)

<a id="function-function-mq3-client-playable-viewmodel-fail-function-fail-message-src-mq3-client-playable-viewmodel-ml-1563695871"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L32)

<a id="function-function-mq3-client-playable-viewmodel-findattachment-function-findattachment-catalog-classname-src-mq3-client-playable-viewmodel-ml-1481423902"></a>
### findAttachment

```ml
function findAttachment(catalog, classname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L129)

<a id="function-function-mq3-client-playable-viewmodel-fovoffset-function-fovoffset-horizontalfov-src-mq3-client-playable-viewmodel-ml-1405151563"></a>
### fovOffset

```ml
function fovOffset(horizontalFov)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `horizontalFov` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L155)

- [mq3.client.playable_viewmodel.FrameSample](Type-mq3-client-playable-viewmodel-framesample-1541521567.md) — struct
<a id="function-function-mq3-client-playable-viewmodel-frametransform-function-frametransform-camera-bob-now-landtime-landchange-recoil-config-src-mq3-client-playable-viewmodel-ml-1000226303"></a>
### frameTransform

```ml
function frameTransform(camera, bob, now, landTime, landChange, recoil, config)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `bob` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `landTime` | `dynamic` | — |  |
| `landChange` | `dynamic` | — |  |
| `recoil` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L239)

<a id="function-function-mq3-client-playable-viewmodel-frameweapontransform-function-frameweapontransform-camera-bob-now-landtime-landchange-recoil-config-attachment-oldframe-frame-backlerp-src-mq3-client-playable-viewmodel-ml-771319487"></a>
### frameWeaponTransform

```ml
function frameWeaponTransform(camera, bob, now, landTime, landChange, recoil, config, attachment, oldFrame, frame, backlerp)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `bob` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `landTime` | `dynamic` | — |  |
| `landChange` | `dynamic` | — |  |
| `recoil` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `attachment` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L245)

<a id="function-function-mq3-client-playable-viewmodel-handpath-function-handpath-classname-src-mq3-client-playable-viewmodel-ml-883251383"></a>
### handPath

```ml
function handPath(classname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L85)

<a id="constant-constant-mq3-client-playable-viewmodel-land-deflect-time-const-land-deflect-time-150-src-mq3-client-playable-viewmodel-ml-252838315"></a>
### LAND_DEFLECT_TIME

```ml
const LAND_DEFLECT_TIME = 150
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L15)

<a id="constant-constant-mq3-client-playable-viewmodel-land-return-time-const-land-return-time-300-src-mq3-client-playable-viewmodel-ml-313325952"></a>
### LAND_RETURN_TIME

```ml
const LAND_RETURN_TIME = 300
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L16)

<a id="function-function-mq3-client-playable-viewmodel-landingoffset-function-landingoffset-now-landtime-landchange-src-mq3-client-playable-viewmodel-ml-345527193"></a>
### landingOffset

```ml
function landingOffset(now, landTime, landChange)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `now` | `dynamic` | — |  |
| `landTime` | `dynamic` | — |  |
| `landChange` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L160)

<a id="function-function-mq3-client-playable-viewmodel-loadcatalog-function-loadcatalog-archive-classnames-src-mq3-client-playable-viewmodel-ml-993506340"></a>
### loadCatalog

```ml
function loadCatalog(archive, classnames)
```

RE_RegisterModel accepts tag-only MD3s. Load their complete animation tag stream once so later weapon-frame mapping can use frames beyond idle zero.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `classnames` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L108)

<a id="function-function-mq3-client-playable-viewmodel-multiplyaxis-function-multiplyaxis-left-right-src-mq3-client-playable-viewmodel-ml-739972429"></a>
### multiplyAxis

```ml
function multiplyAxis(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L196)

<a id="constant-constant-mq3-client-playable-viewmodel-pi-const-pi-3-141593-src-mq3-client-playable-viewmodel-ml-250935315"></a>
### PI

```ml
const PI = 3.141593
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L18)

- [mq3.client.playable_viewmodel.Pose](Type-mq3-client-playable-viewmodel-pose-1179003037.md) — struct
<a id="constant-constant-mq3-client-playable-viewmodel-run-bob-advance-const-run-bob-advance-0-4-src-mq3-client-playable-viewmodel-ml-84894387"></a>
### RUN_BOB_ADVANCE

```ml
const RUN_BOB_ADVANCE = 0.4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L17)

<a id="function-function-mq3-client-playable-viewmodel-sampleweaponanimation-function-sampleweaponanimation-state-classname-now-lastfire-src-mq3-client-playable-viewmodel-ml-959158500"></a>
### sampleWeaponAnimation

```ml
function sampleWeaponAnimation(state, classname, now, lastFire)
```

CG_MapTorsoToWeaponFrame maps the six 15-fps attack frames to hand frames 1..6. A weapon change spends 200 ms dropping the old model through the mapped 20-fps frames beginning at 6, then 250 ms raising the new model; the source mapping intentionally leaves TORSO_RAISE on hand frame zero.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `classname` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `lastFire` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L70)

<a id="function-function-mq3-client-playable-viewmodel-settings-function-settings-horizontalfov-gunx-guny-gunz-modelscale-src-mq3-client-playable-viewmodel-ml-931949781"></a>
### settings

```ml
function settings(horizontalFov, gunX, gunY, gunZ, modelScale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `horizontalFov` | `dynamic` | — |  |
| `gunX` | `dynamic` | — |  |
| `gunY` | `dynamic` | — |  |
| `gunZ` | `dynamic` | — |  |
| `modelScale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L45)

- [mq3.client.playable_viewmodel.Settings](Type-mq3-client-playable-viewmodel-settings-718567293.md) — struct
<a id="constant-constant-mq3-client-playable-viewmodel-software-depthhack-forward-const-software-depthhack-forward-25-src-mq3-client-playable-viewmodel-ml-571303764"></a>
### SOFTWARE_DEPTHHACK_FORWARD

```ml
const SOFTWARE_DEPTHHACK_FORWARD = 25
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L19)

<a id="constant-constant-mq3-client-playable-viewmodel-software-depthhack-side-const-software-depthhack-side-1-1-src-mq3-client-playable-viewmodel-ml-836304972"></a>
### SOFTWARE_DEPTHHACK_SIDE

```ml
const SOFTWARE_DEPTHHACK_SIDE = -1.1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L20)

<a id="constant-constant-mq3-client-playable-viewmodel-software-depthhack-up-const-software-depthhack-up-2-src-mq3-client-playable-viewmodel-ml-1269876095"></a>
### SOFTWARE_DEPTHHACK_UP

```ml
const SOFTWARE_DEPTHHACK_UP = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L21)

<a id="function-function-mq3-client-playable-viewmodel-softwarerenderersettings-function-softwarerenderersettings-src-mq3-client-playable-viewmodel-ml-1016964496"></a>
### softwareRendererSettings

```ml
function softwareRendererSettings()
```

Near-plane polygon clipping preserves partially visible weapon triangles. The retail CD machinegun's unmodified hand-tag attachment still projects entirely below a 640x480 viewport, so keep the visible parent adjustment isolated here until the dedicated viewmodel projection is source-matched.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L41)

<a id="function-function-mq3-client-playable-viewmodel-tagfromframe-function-tagfromframe-entries-name-src-mq3-client-playable-viewmodel-ml-481922507"></a>
### tagFromFrame

```ml
function tagFromFrame(entries, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entries` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L100)

<a id="function-function-mq3-client-playable-viewmodel-tracker-function-tracker-src-mq3-client-playable-viewmodel-ml-352637828"></a>
### tracker

```ml
function tracker()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L50)

- [mq3.client.playable_viewmodel.Tracker](Type-mq3-client-playable-viewmodel-tracker-28652620.md) — struct
<a id="function-function-mq3-client-playable-viewmodel-transform-function-transform-pose-src-mq3-client-playable-viewmodel-ml-1638065877"></a>
### transform

```ml
function transform(pose)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pose` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L191)

<a id="function-function-mq3-client-playable-viewmodel-valid3-function-valid3-value-src-mq3-client-playable-viewmodel-ml-478903329"></a>
### valid3

```ml
function valid3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L33)

<a id="function-function-mq3-client-playable-viewmodel-weaponanimation-function-weaponanimation-initialclass-src-mq3-client-playable-viewmodel-ml-1600763488"></a>
### weaponAnimation

```ml
function weaponAnimation(initialClass)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `initialClass` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L52)

- [mq3.client.playable_viewmodel.WeaponAnimation](Type-mq3-client-playable-viewmodel-weaponanimation-1741882450.md) — struct
<a id="function-function-mq3-client-playable-viewmodel-withrecoil-function-withrecoil-pose-camera-recoil-src-mq3-client-playable-viewmodel-ml-1826958400"></a>
### withRecoil

```ml
function withRecoil(pose, camera, recoil)
```

Keeps the preview's short fire response until weapon animation frames are available. A zero pulse is an exact no-op; 1000 is the peak pulse value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pose` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `recoil` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L231)
