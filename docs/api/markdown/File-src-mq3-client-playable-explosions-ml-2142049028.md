# `src/mq3/client/playable_explosions.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_explosions`](Package-mq3-client-playable-explosions-977056596.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_projectile_view.ml` as `view` → [src/mq3/client/playable_projectile_view.ml](File-src-mq3-client-playable-projectile-view-ml-1417864517.md)
- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/format/md3.ml` as `md3` → [src/mq3/format/md3.ml](File-src-mq3-format-md3-ml-2098563759.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/platform/playable_multitexture.ml` as `multitexture` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-client-playable-explosions-appendquad-function-appendquad-batch-slot-center-right-up-radius-intensity-src-mq3-client-playable-explosions-ml-1053019919"></a>
### appendQuad

```ml
function appendQuad(batch, slot, center, right, up, radius, intensity)
```

Calls `mq3.client.playable_explosions.worldPoint`, `mq3.platform.playable_window.appendSingleTextureTriangleColored` from playable explosions `appendQuad`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Value used by `value=window.appendSingleTextureTriangleColored(batch,slot,a,[0.0,1.0],1.0,color,b,[1.0,1.0],1.0,color,c,[1.0,0.0],1.0,color,255,255,255)`. |
| `slot` | `dynamic` | — | Value used by `value=window.appendSingleTextureTriangleColored(batch,slot,a,[0.0,1.0],1.0,color,b,[1.0,1.0],1.0,color,c,[1.0,0.0],1.0,color,255,255,255)`. |
| `center` | `dynamic` | — | Value used by `a=worldPoint(center,right,up,0.0-radius,0.0-radius)`. |
| `right` | `dynamic` | — | Value used by `a=worldPoint(center,right,up,0.0-radius,0.0-radius)`. |
| `up` | `dynamic` | — | Value used by `a=worldPoint(center,right,up,0.0-radius,0.0-radius)`. |
| `radius` | `dynamic` | — | Radius used by the spatial or visual calculation. |
| `intensity` | `dynamic` | — | Value used by `color=[intensity,intensity,intensity,255]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L148)

- [mq3.client.playable_explosions.Catalog](Type-mq3-client-playable-explosions-catalog-1120408645.md) — struct
<a id="function-function-mq3-client-playable-explosions-draw-function-draw-catalog-snapshots-camera-projection-now-src-mq3-client-playable-explosions-ml-1305050096"></a>
### draw

```ml
function draw(catalog, snapshots, camera, projection, now)
```

Calls `mq3.platform.playable_window.createTriangleBatch`, `mq3.platform.playable_multitexture.setAlphaTest`, `mq3.platform.playable_multitexture.setTextureClamp` and additional helpers from playable explosions `draw`. The final path returns `drawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `snapshots` | `dynamic` | — | Value used by `if catalog==void or snapshots==void or camera==void or projection==void or now<0 then return fail("draw inputs are required") end if`. |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L213)

<a id="function-function-mq3-client-playable-explosions-drawplasma-function-drawplasma-catalog-batch-snapshot-p-projection-now-src-mq3-client-playable-explosions-ml-1135310388"></a>
### drawPlasma

```ml
function drawPlasma(catalog, batch, snapshot, p, projection, now)
```

Calls `mq3.client.playable_explosions.timing`, `mq3.format.md3.renderTriangles`, `mq3.client.playable_explosions.textureFor` and additional helpers from playable explosions `drawPlasma`. The final path returns `window.submitWorldTriangleBatch(batch,projection)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.plasmaModel`. |
| `batch` | `dynamic` | — | Value used by `window.resetTriangleBatch(batch)`. |
| `snapshot` | `dynamic` | — | Record read through `snapshot.position`. |
| `p` | `dynamic` | — | Record read through `p.frames`. |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L198)

<a id="function-function-mq3-client-playable-explosions-drawsprite-function-drawsprite-catalog-batch-snapshot-p-camera-projection-now-src-mq3-client-playable-explosions-ml-1744933799"></a>
### drawSprite

```ml
function drawSprite(catalog, batch, snapshot, p, camera, projection, now)
```

Calls `mq3.client.playable_explosions.timing`, `mq3.compat.numeric.trunc32`, `mq3.client.playable_explosions.fraction` and additional helpers from playable explosions `drawSprite`. The final path returns `drawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `batch` | `dynamic` | — | Value used by `window.resetTriangleBatch(batch)`. |
| `snapshot` | `dynamic` | — | Record read through `snapshot.position`, `snapshot.normal`, `snapshot.eventAt`. |
| `p` | `dynamic` | — | Record read through `p.frequency`, `p.frames`. |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L162)

<a id="function-function-mq3-client-playable-explosions-fail-function-fail-message-src-mq3-client-playable-explosions-ml-1273503911"></a>
### fail

```ml
function fail(message)
```

Creates the playable explosions error `7650` with diagnostic text `"playable explosions: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"playable explosions: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L65)

<a id="function-function-mq3-client-playable-explosions-fraction-function-fraction-value-src-mq3-client-playable-explosions-ml-1432132477"></a>
### fraction

```ml
function fraction(value)
```

Computes `value-numeric.trunc32(value)` for playable explosions `fraction`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `return value-numeric.trunc32(value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L103)

<a id="function-function-mq3-client-playable-explosions-load-function-load-archive-firsttextureslot-maxtextureslots-src-mq3-client-playable-explosions-ml-1928305055"></a>
### load

```ml
function load(archive, firstTextureSlot, maxTextureSlots)
```

Calls `mq3.client.playable_explosions.profile`, `mq3.renderer.playable_materials.loadImage`, `mq3.client.playable_explosions.Texture` and additional helpers from playable explosions `load`. The final path returns `Catalog(textures,profiles,plasmaModel,firstTextureSlot,len(textures))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `firstTextureSlot` | `dynamic` | — | First texture slot reserved for this asset collection. |
| `maxTextureSlots` | `dynamic` | — | Maximum number of texture slots available to the renderer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L84)

<a id="constant-constant-mq3-client-playable-explosions-max-textures-const-max-textures-15-src-mq3-client-playable-explosions-ml-43664843"></a>
### MAX_TEXTURES

```ml
const MAX_TEXTURES = 15
```

Capacity limit for the textures collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L18)

<a id="constant-constant-mq3-client-playable-explosions-max-triangles-const-max-triangles-4096-src-mq3-client-playable-explosions-ml-1912082810"></a>
### MAX_TRIANGLES

```ml
const MAX_TRIANGLES = 4096
```

Capacity limit for the triangles collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L20)

<a id="constant-constant-mq3-client-playable-explosions-pi-const-pi-3-141593-src-mq3-client-playable-explosions-ml-1068471483"></a>
### PI

```ml
const PI = 3.141593
```

Circle constant used to convert or evaluate angles in trigonometric calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L22)

<a id="function-function-mq3-client-playable-explosions-plasmaaxes-function-plasmaaxes-snapshot-src-mq3-client-playable-explosions-ml-2091629270"></a>
### plasmaAxes

```ml
function plasmaAxes(snapshot)
```

Calls `mq3.shared.math.VectorNormalize`, `mq3.shared.math.CrossProduct`, `mq3.client.playable_explosions.rotatePair` and additional helpers from playable explosions `plasmaAxes`. The final path returns `[normal,pair[0],pair[1]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | Record read through `snapshot.normal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L173)

<a id="function-function-mq3-client-playable-explosions-plasmauv-function-plasmauv-uv-elapsed-src-mq3-client-playable-explosions-ml-1498155285"></a>
### plasmaUv

```ml
function plasmaUv(uv, elapsed)
```

Calls `mq3.client.playable_explosions.triangleWave`, `mq3.compat.transcendental.sin`, `mq3.compat.transcendental.cos` from playable explosions `plasmaUv`. The final path returns `[0.5+du*c-dv*s,0.5+du*s+dv*c]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `uv` | `dynamic` | — | Sequence read at `uv[0]`, `uv[1]`. |
| `elapsed` | `dynamic` | — | Value used by `wave=0.6+0.1*triangleWave(elapsed*8.0/1000.0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L188)

<a id="function-function-mq3-client-playable-explosions-profile-function-profile-style-src-mq3-client-playable-explosions-ml-1245803483"></a>
### profile

```ml
function profile(style)
```

Calls `mq3.client.playable_explosions.Profile` from playable explosions `profile`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | `dynamic` | — | Value used by `if style==view.STYLE_ROCKET then return Profile(style,8.0,["models/weaphits/rlboom/rlboom_1","models/weaphits/rlboom/rlboom_2","models/weaphit...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L68)

- [mq3.client.playable_explosions.Profile](Type-mq3-client-playable-explosions-profile-2071711251.md) — struct
<a id="function-function-mq3-client-playable-explosions-randomoffset-function-randomoffset-snapshot-src-mq3-client-playable-explosions-ml-280186482"></a>
### randomOffset

```ml
function randomOffset(snapshot)
```

Computes `numeric.i32(snapshot.entityId*97+snapshot.eventAt*17) & 63` for playable explosions `randomOffset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | Record read through `snapshot.entityId`, `snapshot.eventAt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L106)

<a id="function-function-mq3-client-playable-explosions-release-function-release-catalog-src-mq3-client-playable-explosions-ml-1366411093"></a>
### release

```ml
function release(catalog)
```

Calls `mq3.platform.playable_window.releaseTexture` from playable explosions `release`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.textures`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L99)

<a id="function-function-mq3-client-playable-explosions-rotatepair-function-rotatepair-right-up-degrees-src-mq3-client-playable-explosions-ml-364387302"></a>
### rotatePair

```ml
function rotatePair(right, up, degrees)
```

Calls `mq3.compat.transcendental.sin`, `mq3.compat.transcendental.cos` from playable explosions `rotatePair`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `right` | `dynamic` | — | Sequence read at `right[0]`, `right[1]`, `right[2]`. |
| `up` | `dynamic` | — | Sequence read at `up[0]`, `up[1]`, `up[2]`. |
| `degrees` | `dynamic` | — | Value used by `radians=degrees*PI/180.0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L129)

<a id="function-function-mq3-client-playable-explosions-rotation-function-rotation-snapshot-src-mq3-client-playable-explosions-ml-1196614882"></a>
### rotation

```ml
function rotation(snapshot)
```

Computes `numeric.i32(snapshot.entityId*53+snapshot.eventAt*29) % 360` for playable explosions `rotation`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | Record read through `snapshot.entityId`, `snapshot.eventAt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L109)

<a id="function-function-mq3-client-playable-explosions-spriteradius-function-spriteradius-endtime-starttime-now-src-mq3-client-playable-explosions-ml-654830987"></a>
### spriteRadius

```ml
function spriteRadius(endTime, startTime, now)
```

Evaluates playable explosions `spriteRadius` and returns `42.0*(1.0-c)+30.0` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `endTime` | `dynamic` | — | Value used by `c=(endTime-now)/(endTime-startTime)`. |
| `startTime` | `dynamic` | — | Value used by `c=(endTime-now)/(endTime-startTime)`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L122)

- [mq3.client.playable_explosions.Texture](Type-mq3-client-playable-explosions-texture-1560609649.md) — struct
<a id="function-function-mq3-client-playable-explosions-texturefor-function-texturefor-catalog-name-src-mq3-client-playable-explosions-ml-903495558"></a>
### textureFor

```ml
function textureFor(catalog, name)
```

Calls `stringEqualsIgnoreCaseAscii` from playable explosions `textureFor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.textures`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable explosions resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L78)

<a id="function-function-mq3-client-playable-explosions-timing-function-timing-snapshot-p-now-src-mq3-client-playable-explosions-ml-590474578"></a>
### timing

```ml
function timing(snapshot, p, now)
```

Calls `mq3.client.playable_explosions.randomOffset` from playable explosions `timing`. The final path returns `[elapsed,start+p.duration]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | Record read through `snapshot.eventAt`. |
| `p` | `dynamic` | — | Record read through `p.duration`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L114)

<a id="function-function-mq3-client-playable-explosions-transformpoint-function-transformpoint-origin-axes-point-src-mq3-client-playable-explosions-ml-336335619"></a>
### transformPoint

```ml
function transformPoint(origin, axes, point)
```

Adapts `mq3.client.playable_viewer.ScreenPoint` to playable explosions `transformPoint`, returning its result for `origin[0]+axes[0][0]*point[0]+axes[1][0]*point[1]+axes[2][0]*point[2], origin[1]+axes[0][1]*point[0]+axes[1][1]*point[1]+axes[2][1]*point[2], origin[2]+axes[0][2]*point[0]+axes[1][2]*point[1]+axes[...`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.playable_viewer.ScreenPoint`. |
| `axes` | `dynamic` | — | Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `origin[0]+axes[0][0]*point[0]+axes[1][0]*point[1]+axes[2][0]*point[2]`, `origin[1]+axes[0][1]*point[0]+axes[1][1]*point[1]+axes[2][1]*point[2]`, `origin[2]+axes[0][2]*point[0]+axes[1][2]*point[1]+axes[2][2]*point[2]`. |
| `point` | `dynamic` | — | Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `origin[0]+axes[0][0]*point[0]+axes[1][0]*point[1]+axes[2][0]*point[2]`, `origin[1]+axes[0][1]*point[0]+axes[1][1]*point[1]+axes[2][1]*point[2]`, `origin[2]+axes[0][2]*point[0]+axes[1][2]*point[1]+axes[2][2]*point[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L181)

<a id="function-function-mq3-client-playable-explosions-trianglewave-function-trianglewave-value-src-mq3-client-playable-explosions-ml-1807228745"></a>
### triangleWave

```ml
function triangleWave(value)
```

Calls `mq3.client.playable_explosions.fraction` from playable explosions `triangleWave`. The final path returns `2.0-f*2.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `f=fraction(value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L184)

<a id="function-function-mq3-client-playable-explosions-upload-function-upload-catalog-src-mq3-client-playable-explosions-ml-1389473479"></a>
### upload

```ml
function upload(catalog)
```

Calls `mq3.platform.playable_window.uploadTextureNoMip` from playable explosions `upload`. The final path returns `len(catalog.textures)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.textures`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L96)

<a id="function-function-mq3-client-playable-explosions-worldpoint-function-worldpoint-center-right-up-x-y-src-mq3-client-playable-explosions-ml-137559943"></a>
### worldPoint

```ml
function worldPoint(center, right, up, x, y)
```

Adapts `mq3.client.playable_viewer.ScreenPoint` to playable explosions `worldPoint`, returning its result for `center[0]+right[0]*x+up[0]*y, center[1]+right[1]*x+up[1]*y, center[2]+right[2]*x+up[2]*y`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | `dynamic` | — | Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `center[0]+right[0]*x+up[0]*y`, `center[1]+right[1]*x+up[1]*y`, `center[2]+right[2]*x+up[2]*y`. |
| `right` | `dynamic` | — | Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `center[0]+right[0]*x+up[0]*y`, `center[1]+right[1]*x+up[1]*y`, `center[2]+right[2]*x+up[2]*y`. |
| `up` | `dynamic` | — | Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `center[0]+right[0]*x+up[0]*y`, `center[1]+right[1]*x+up[1]*y`, `center[2]+right[2]*x+up[2]*y`. |
| `x` | `dynamic` | — | Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `center[0]+right[0]*x+up[0]*y`, `center[1]+right[1]*x+up[1]*y`, `center[2]+right[2]*x+up[2]*y`. |
| `y` | `dynamic` | — | Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `center[0]+right[0]*x+up[0]*y`, `center[1]+right[1]*x+up[1]*y`, `center[2]+right[2]*x+up[2]*y`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L139)
