# `src/mq3/client/playable_marks.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_marks`](Package-mq3-client-playable-marks-1530105550.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_projectile_view.ml` as `projectileView` → [src/mq3/client/playable_projectile_view.ml](File-src-mq3-client-playable-projectile-view-ml-1417864517.md)
- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/platform/playable_multitexture.ml` as `multitexture` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/array.ml` as `arrays` → `../MiniLangCompilerML/std/array.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-playable-marks-append-function-append-state-key-profile-origin-normal-bornat-src-mq3-client-playable-marks-ml-925856278"></a>
### append

```ml
function append(state, key, profile, origin, normal, bornAt)
```

Updates `state.marks` during playable marks `append`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable marks record/storage; this routine assigns `state.marks`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding playable marks entry. |
| `profile` | `dynamic` | — | Sequence read at `profile[0]`, `profile[1]`, `profile[2]`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. |
| `bornAt` | `dynamic` | — | Value used by `if state==void or profile==void or not valid3(origin) or not valid3(normal) or bornAt<0 then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L126)

<a id="function-function-mq3-client-playable-marks-axes-function-axes-mark-src-mq3-client-playable-marks-ml-2108852705"></a>
### axes

```ml
function axes(mark)
```

Calls `mq3.client.playable_marks.perpendicular`, `mq3.shared.math.CrossProduct`, `mq3.compat.transcendental.sin` and additional helpers from playable marks `axes`. The final path returns `[axis1,axis2]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mark` | `dynamic` | — | Record read through `mark.normal`, `mark.orientation`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L155)

- [mq3.client.playable_marks.Catalog](Type-mq3-client-playable-marks-catalog-509575647.md) — struct
<a id="function-function-mq3-client-playable-marks-color-function-color-mark-now-src-mq3-client-playable-marks-ml-876139729"></a>
### color

```ml
function color(mark, now)
```

Calls `mq3.compat.numeric.trunc32` from playable marks `color`. The final path returns `[rgb,rgb,rgb,alpha]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mark` | `dynamic` | — | Record read through `mark.bornAt`, `mark.kind`, `mark.alphaFade`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L175)

<a id="function-function-mq3-client-playable-marks-copy3-function-copy3-value-src-mq3-client-playable-marks-ml-852386001"></a>
### copy3

```ml
function copy3(value)
```

Copies three vector components with float32 rounding for playable marks.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence read at `value[0]`, `value[1]`, `value[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L44)

<a id="function-function-mq3-client-playable-marks-create-function-create-src-mq3-client-playable-marks-ml-506741060"></a>
### create

```ml
function create()
```

Creates a `mq3.client.playable_marks.State` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L38)

<a id="function-function-mq3-client-playable-marks-draw-function-draw-state-catalog-projection-now-src-mq3-client-playable-marks-ml-337404235"></a>
### draw

```ml
function draw(state, catalog, projection, now)
```

Calls `mq3.platform.playable_window.createTriangleBatch`, `mq3.platform.playable_multitexture.setAlphaTest`, `mq3.platform.playable_multitexture.setTextureClamp` and additional helpers from playable marks `draw`. The final path returns `drawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.marks`. |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L187)

<a id="function-function-mq3-client-playable-marks-fail-function-fail-message-src-mq3-client-playable-marks-ml-1529968831"></a>
### fail

```ml
function fail(message)
```

Creates the playable marks error `7640` with diagnostic text `"playable marks: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"playable marks: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L36)

<a id="function-function-mq3-client-playable-marks-haskey-function-haskey-state-key-bornat-src-mq3-client-playable-marks-ml-1266124462"></a>
### hasKey

```ml
function hasKey(state, key, bornAt)
```

Evaluates playable marks `hasKey` and returns `true`, `false` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.marks`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding playable marks entry. |
| `bornAt` | `dynamic` | — | Value used by `for each mark in state.marks if mark.key==key and mark.bornAt==bornAt then return true end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L115)

<a id="constant-constant-mq3-client-playable-marks-kind-bullet-const-kind-bullet-1-src-mq3-client-playable-marks-ml-1917662620"></a>
### KIND_BULLET

```ml
const KIND_BULLET = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L19)

<a id="constant-constant-mq3-client-playable-marks-kind-burn-const-kind-burn-2-src-mq3-client-playable-marks-ml-1949921763"></a>
### KIND_BURN

```ml
const KIND_BURN = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L20)

<a id="constant-constant-mq3-client-playable-marks-kind-energy-const-kind-energy-4-src-mq3-client-playable-marks-ml-771415585"></a>
### KIND_ENERGY

```ml
const KIND_ENERGY = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L22)

<a id="constant-constant-mq3-client-playable-marks-kind-hole-const-kind-hole-3-src-mq3-client-playable-marks-ml-1455659698"></a>
### KIND_HOLE

```ml
const KIND_HOLE = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L21)

<a id="function-function-mq3-client-playable-marks-load-function-load-archive-firsttextureslot-maxtextureslots-src-mq3-client-playable-marks-ml-1567310659"></a>
### load

```ml
function load(archive, firstTextureSlot, maxTextureSlots)
```

Calls `mq3.client.playable_marks.textureName`, `mq3.renderer.playable_materials.loadImage`, `mq3.client.playable_marks.Texture` and additional helpers from playable marks `load`. The final path returns `Catalog(textures,firstTextureSlot,len(textures))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `firstTextureSlot` | `dynamic` | — | First texture slot reserved for this asset collection. |
| `maxTextureSlots` | `dynamic` | — | Maximum number of texture slots available to the renderer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L60)

- [mq3.client.playable_marks.Mark](Type-mq3-client-playable-marks-mark-1824883361.md) — struct
<a id="constant-constant-mq3-client-playable-marks-mark-fade-time-const-mark-fade-time-1000-src-mq3-client-playable-marks-ml-278481820"></a>
### MARK_FADE_TIME

```ml
const MARK_FADE_TIME = 1000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L17)

<a id="constant-constant-mq3-client-playable-marks-mark-total-time-const-mark-total-time-10000-src-mq3-client-playable-marks-ml-1779024868"></a>
### MARK_TOTAL_TIME

```ml
const MARK_TOTAL_TIME = 10000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L16)

<a id="constant-constant-mq3-client-playable-marks-max-marks-const-max-marks-256-src-mq3-client-playable-marks-ml-339257162"></a>
### MAX_MARKS

```ml
const MAX_MARKS = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L18)

<a id="function-function-mq3-client-playable-marks-orientation-function-orientation-key-bornat-src-mq3-client-playable-marks-ml-672507689"></a>
### orientation

```ml
function orientation(key, bornAt)
```

Computes `((numeric.i32(key*97+bornAt*17) & 1023)*360.0)/1024.0` for playable marks `orientation`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding playable marks entry. |
| `bornAt` | `dynamic` | — | Value used by `return ((numeric.i32(key*97+bornAt*17) & 1023)*360.0)/1024.0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L110)

<a id="function-function-mq3-client-playable-marks-perpendicular-function-perpendicular-normal-src-mq3-client-playable-marks-ml-508542703"></a>
### perpendicular

```ml
function perpendicular(normal)
```

Calls `mq3.shared.math.CrossProduct`, `mq3.shared.math.VectorNormalize` from playable marks `perpendicular`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L149)

<a id="constant-constant-mq3-client-playable-marks-pi-const-pi-3-141593-src-mq3-client-playable-marks-ml-830521811"></a>
### PI

```ml
const PI = 3.141593
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L23)

<a id="function-function-mq3-client-playable-marks-point-function-point-mark-axis1-axis2-x-y-src-mq3-client-playable-marks-ml-943101083"></a>
### point

```ml
function point(mark, axis1, axis2, x, y)
```

Adapts `mq3.client.playable_viewer.ScreenPoint` to playable marks `point`, returning its result for `mark.origin[0]+axis1[0]*x+axis2[0]*y, mark.origin[1]+axis1[1]*x+axis2[1]*y, mark.origin[2]+axis1[2]*x+axis2[2]*y`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mark` | `dynamic` | — | Record read through `mark.origin`. |
| `axis1` | `dynamic` | — | Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `mark.origin[0]+axis1[0]*x+axis2[0]*y`, `mark.origin[1]+axis1[1]*x+axis2[1]*y`, `mark.origin[2]+axis1[2]*x+axis2[2]*y`. |
| `axis2` | `dynamic` | — | Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `mark.origin[0]+axis1[0]*x+axis2[0]*y`, `mark.origin[1]+axis1[1]*x+axis2[1]*y`, `mark.origin[2]+axis1[2]*x+axis2[2]*y`. |
| `x` | `dynamic` | — | Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `mark.origin[0]+axis1[0]*x+axis2[0]*y`, `mark.origin[1]+axis1[1]*x+axis2[1]*y`, `mark.origin[2]+axis1[2]*x+axis2[2]*y`. |
| `y` | `dynamic` | — | Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `mark.origin[0]+axis1[0]*x+axis2[0]*y`, `mark.origin[1]+axis1[1]*x+axis2[1]*y`, `mark.origin[2]+axis1[2]*x+axis2[2]*y`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L166)

<a id="function-function-mq3-client-playable-marks-projectileprofile-function-projectileprofile-style-src-mq3-client-playable-marks-ml-1535585529"></a>
### projectileProfile

```ml
function projectileProfile(style)
```

Evaluates playable marks `projectileProfile` and returns `[KIND_BURN,64.0,false]`, `[KIND_ENERGY,16.0,true]`, `[KIND_BURN,32.0,false]` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | `dynamic` | — | Value used by `if style==projectileView.STYLE_ROCKET or style==projectileView.STYLE_GRENADE then return [KIND_BURN,64.0,false] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L100)

<a id="function-function-mq3-client-playable-marks-release-function-release-catalog-src-mq3-client-playable-marks-ml-1750274097"></a>
### release

```ml
function release(catalog)
```

Calls `mq3.platform.playable_window.releaseTexture` from playable marks `release`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.textures`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L79)

- [mq3.client.playable_marks.State](Type-mq3-client-playable-marks-state-1635688085.md) — struct
- [mq3.client.playable_marks.Texture](Type-mq3-client-playable-marks-texture-116477787.md) — struct
<a id="function-function-mq3-client-playable-marks-texturefor-function-texturefor-catalog-kind-src-mq3-client-playable-marks-ml-1611649705"></a>
### textureFor

```ml
function textureFor(catalog, kind)
```

Evaluates playable marks `textureFor` and returns `texture`, `void` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.textures`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L83)

<a id="function-function-mq3-client-playable-marks-texturename-function-texturename-kind-src-mq3-client-playable-marks-ml-256855866"></a>
### textureName

```ml
function textureName(kind)
```

Evaluates playable marks `textureName` and returns `"gfx/damage/bullet_mrk"`, `"gfx/damage/burn_med_mrk"`, `"gfx/damage/hole_lg_mrk"` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L48)

<a id="function-function-mq3-client-playable-marks-update-function-update-state-snapshots-shoteffects-now-src-mq3-client-playable-marks-ml-746290136"></a>
### update

```ml
function update(state, snapshots, shotEffects, now)
```

Updates `state.marks` during playable marks `update`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable marks record/storage; this routine assigns `state.marks`. |
| `snapshots` | `dynamic` | — | Value used by `if state==void or snapshots==void or shotEffects==void or now<0 then return fail("state, sources and time are required") end if`. |
| `shotEffects` | `dynamic` | — | Value used by `if state==void or snapshots==void or shotEffects==void or now<0 then return fail("state, sources and time are required") end if`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L139)

<a id="function-function-mq3-client-playable-marks-upload-function-upload-catalog-src-mq3-client-playable-marks-ml-173336687"></a>
### upload

```ml
function upload(catalog)
```

Calls `mq3.platform.playable_window.uploadTextureNoMip` from playable marks `upload`. The final path returns `len(catalog.textures)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.textures`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L72)

<a id="function-function-mq3-client-playable-marks-valid3-function-valid3-value-src-mq3-client-playable-marks-ml-56066361"></a>
### valid3

```ml
function valid3(value)
```

Computes `value!=void and typeof(value)=="array" and len(value)==3` for playable marks `valid3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence whose length/content is inspected by `valid3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L41)

<a id="function-function-mq3-client-playable-marks-weaponprofile-function-weaponprofile-classname-src-mq3-client-playable-marks-ml-1722064021"></a>
### weaponProfile

```ml
function weaponProfile(classname)
```

Evaluates playable marks `weaponProfile` and returns `[KIND_BULLET,8.0,false]`, `[KIND_BULLET,4.0,false]`, `[KIND_HOLE,12.0,false]` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — | Value used by `if classname=="weapon_machinegun" then return [KIND_BULLET,8.0,false] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L87)
