# `src/mq3/client/playable_viewer.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_viewer`](Package-mq3-client-playable-viewer-1458170370.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-client-playable-viewer-applymouse-function-applymouse-state-mousex-mousey-src-mq3-client-playable-viewer-ml-1884969508"></a>
### applyMouse

```ml
function applyMouse(state, mouseX, mouseY)
```

Updates `state.yaw`, `state.pitch` during playable viewer `applyMouse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable viewer record/storage; this routine assigns `state.yaw`, `state.pitch`. |
| `mouseX` | `dynamic` | — | Value used by `state.yaw=numeric.fadd(state.yaw,numeric.fmul(numeric.f32(mouseX),state.mouseSensitivity))`. |
| `mouseY` | `dynamic` | — | Value used by `state.pitch=numeric.fsub(state.pitch,numeric.fmul(numeric.f32(mouseY),state.mouseSensitivity))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L151)

<a id="function-function-mq3-client-playable-viewer-camera-function-camera-position-yaw-pitch-movespeed-mousesensitivity-src-mq3-client-playable-viewer-ml-1909774700"></a>
### camera

```ml
function camera(position, yaw, pitch, moveSpeed, mouseSensitivity)
```

Calls `mq3.client.playable_viewer.Camera`, `mq3.compat.numeric.f32`, `mq3.client.playable_viewer.normalizeAngles` from playable viewer `camera`. The final path returns `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | `dynamic` | — | Sequence read at `position[0]`, `position[1]`, `position[2]`. |
| `yaw` | `dynamic` | — | Value used by `state=Camera([numeric.f32(position[0]),numeric.f32(position[1]),numeric.f32(position[2])],numeric.f32(yaw),numeric.f32(pitch),numeric.f32(move...`. |
| `pitch` | `dynamic` | — | Value used by `state=Camera([numeric.f32(position[0]),numeric.f32(position[1]),numeric.f32(position[2])],numeric.f32(yaw),numeric.f32(pitch),numeric.f32(move...`. |
| `moveSpeed` | `dynamic` | — | Value used by `if moveSpeed<0.0 then return error(7471,"viewer move speed cannot be negative") end if`. |
| `mouseSensitivity` | `dynamic` | — | Value used by `if mouseSensitivity<0.0 then return error(7472,"viewer mouse sensitivity cannot be negative") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L104)

- [mq3.client.playable_viewer.Camera](Type-mq3-client-playable-viewer-camera-356576099.md) — struct
<a id="function-function-mq3-client-playable-viewer-camerabasis-function-camerabasis-state-src-mq3-client-playable-viewer-ml-1004225583"></a>
### cameraBasis

```ml
function cameraBasis(state)
```

Adapts `mq3.shared.math.AngleVectors` to playable viewer `cameraBasis`, returning its result for `[state.pitch,state.yaw,0.0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.pitch`, `state.yaw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L160)

<a id="function-function-mq3-client-playable-viewer-clampdelta-function-clampdelta-deltamilliseconds-src-mq3-client-playable-viewer-ml-739850378"></a>
### clampDelta

```ml
function clampDelta(deltaMilliseconds)
```

Evaluates playable viewer `clampDelta` and returns `0`, `MAX_FRAME_MILLISECONDS`, `deltaMilliseconds` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `deltaMilliseconds` | `dynamic` | — | Elapsed simulation interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L131)

<a id="function-function-mq3-client-playable-viewer-clipnear-function-clipnear-a-b-neardistance-src-mq3-client-playable-viewer-ml-1006404032"></a>
### clipNear

```ml
function clipNear(a, b, nearDistance)
```

Calls `mq3.compat.numeric.fsub`, `mq3.compat.numeric.fdiv`, `mq3.compat.numeric.fadd` and additional helpers from playable viewer `clipNear`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Sequence read at `a[2]`, `a[0]`, `a[1]`. |
| `b` | `dynamic` | — | Sequence read at `b[2]`, `b[0]`, `b[1]`. |
| `nearDistance` | `dynamic` | — | Distance from the camera to the near clipping plane. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L338)

<a id="function-function-mq3-client-playable-viewer-clipnearpolygon-function-clipnearpolygon-vertices-neardistance-src-mq3-client-playable-viewer-ml-560245140"></a>
### clipNearPolygon

```ml
function clipNearPolygon(vertices, nearDistance)
```

Sutherland-Hodgman clipping for a camera-space polygon. Components after xyz are interpolated with the intersection and can carry UV/light values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertices` | `dynamic` | — | Sequence read at `vertices[0]`, `vertices[len(vertices)-1]`. |
| `nearDistance` | `dynamic` | — | Distance from the camera to the near clipping plane. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L316)

<a id="function-function-mq3-client-playable-viewer-clipnearvertex-function-clipnearvertex-a-b-neardistance-src-mq3-client-playable-viewer-ml-907094672"></a>
### clipNearVertex

```ml
function clipNearVertex(a, b, nearDistance)
```

Evaluates playable viewer `clipNearVertex` and returns `void`, `result` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Sequence read at `a[2]`, `a[component]`. |
| `b` | `dynamic` | — | Sequence read at `b[2]`, `b[component]`. |
| `nearDistance` | `dynamic` | — | Distance from the camera to the near clipping plane. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L304)

<a id="function-function-mq3-client-playable-viewer-controls-function-controls-forward-back-left-right-up-down-mousex-mousey-src-mq3-client-playable-viewer-ml-315472053"></a>
### controls

```ml
function controls(forward, back, left, right, up, down, mouseX, mouseY)
```

Creates a `mq3.client.playable_viewer.Controls` record. Assigns `forward` from `forward`, `back` from `back`, `left` from `left`, `right` from `right`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `forward` | `dynamic` | — | Value used to initialize `Controls.forward`. |
| `back` | `dynamic` | — | Value used to initialize `Controls.back`. |
| `left` | `dynamic` | — | Value used to initialize `Controls.left`. |
| `right` | `dynamic` | — | Value used to initialize `Controls.right`. |
| `up` | `dynamic` | — | Value used to initialize `Controls.up`. |
| `down` | `dynamic` | — | Value used to initialize `Controls.down`. |
| `mouseX` | `dynamic` | — | Value used to initialize `Controls.mouseX`. |
| `mouseY` | `dynamic` | — | Value used to initialize `Controls.mouseY`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L122)

- [mq3.client.playable_viewer.Controls](Type-mq3-client-playable-viewer-controls-845312094.md) — struct
<a id="constant-constant-mq3-client-playable-viewer-default-near-const-default-near-1-src-mq3-client-playable-viewer-ml-2099690268"></a>
### DEFAULT_NEAR

```ml
const DEFAULT_NEAR = 1
```

Fallback near setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L16)

<a id="function-function-mq3-client-playable-viewer-focallength-function-focallength-width-horizontalfovdegrees-src-mq3-client-playable-viewer-ml-1625029320"></a>
### focalLength

```ml
function focalLength(width, horizontalFovDegrees)
```

Calls `mq3.compat.numeric.fdiv`, `mq3.compat.numeric.fmul`, `mq3.compat.numeric.f32` and additional helpers from playable viewer `focalLength`. The final path returns `numeric.fdiv(numeric.fmul(width,0.5),tangent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Width in the coordinate space used by `focalLength`. |
| `horizontalFovDegrees` | `dynamic` | — | Horizontal camera field of view in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L217)

<a id="function-function-mq3-client-playable-viewer-idlecontrols-function-idlecontrols-src-mq3-client-playable-viewer-ml-270992054"></a>
### idleControls

```ml
function idleControls()
```

Adapts `mq3.client.playable_viewer.controls` to playable viewer `idleControls`, returning its result for `false, false, false, false, false, false, 0.0, 0.0`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L127)

<a id="constant-constant-mq3-client-playable-viewer-max-frame-milliseconds-const-max-frame-milliseconds-100-src-mq3-client-playable-viewer-ml-834836590"></a>
### MAX_FRAME_MILLISECONDS

```ml
const MAX_FRAME_MILLISECONDS = 100
```

Upper duration bound in milliseconds for frame processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L14)

<a id="constant-constant-mq3-client-playable-viewer-max-pitch-const-max-pitch-89-src-mq3-client-playable-viewer-ml-680314818"></a>
### MAX_PITCH

```ml
const MAX_PITCH = 89
```

Upper pitch-angle bound used when clamping the client view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L12)

<a id="constant-constant-mq3-client-playable-viewer-min-pitch-const-min-pitch-89-src-mq3-client-playable-viewer-ml-1401492993"></a>
### MIN_PITCH

```ml
const MIN_PITCH = -89
```

Lower pitch-angle bound used when clamping the client view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L10)

<a id="function-function-mq3-client-playable-viewer-movementbasis-function-movementbasis-state-src-mq3-client-playable-viewer-ml-99517715"></a>
### movementBasis

```ml
function movementBasis(state)
```

Calls `mq3.shared.math.AngleVectors` from playable viewer `movementBasis`. The final path returns `[axes[0],axes[1],[0.0,0.0,1.0]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.yaw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L174)

<a id="function-function-mq3-client-playable-viewer-normalizeangles-function-normalizeangles-state-src-mq3-client-playable-viewer-ml-969201339"></a>
### normalizeAngles

```ml
function normalizeAngles(state)
```

Updates `state.yaw`, `state.pitch` during playable viewer `normalizeAngles`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable viewer record/storage; this routine assigns `state.yaw`, `state.pitch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L139)

<a id="function-function-mq3-client-playable-viewer-preparedviewpoint-function-preparedviewpoint-projection-world-src-mq3-client-playable-viewer-ml-2038585699"></a>
### preparedViewPoint

```ml
function preparedViewPoint(projection, world)
```

Evaluates playable viewer `preparedViewPoint` and returns `error(7481,"prepared projection needs a point")`, `[side,up,depth]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. Record read through `projection.position`, `projection.right`, `projection.up`, `projection.forward`. |
| `world` | `dynamic` | — | Sequence read at `world[0]`, `world[1]`, `world[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L272)

<a id="function-function-mq3-client-playable-viewer-prepareprojection-function-prepareprojection-state-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-viewer-ml-76386857"></a>
### prepareProjection

```ml
function prepareProjection(state, width, height, horizontalFovDegrees, nearDistance)
```

Frame-local projection state avoids recalculating camera trigonometry and field-of-view constants for every BSP and MD3 vertex.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.position`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `prepareProjection`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `prepareProjection`. |
| `horizontalFovDegrees` | `dynamic` | — | Horizontal camera field of view in degrees. |
| `nearDistance` | `dynamic` | — | Distance from the camera to the near clipping plane. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L262)

- [mq3.client.playable_viewer.Projection](Type-mq3-client-playable-viewer-projection-67447881.md) — struct
<a id="function-function-mq3-client-playable-viewer-projectline-function-projectline-state-startpoint-endpoint-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-viewer-ml-1404191992"></a>
### projectLine

```ml
function projectLine(state, startPoint, endPoint, width, height, horizontalFovDegrees, nearDistance)
```

Calls `mq3.client.playable_viewer.viewPoint`, `mq3.client.playable_viewer.ScreenLine`, `mq3.client.playable_viewer.clipNear` and additional helpers from playable viewer `projectLine`. The final path returns `ScreenLine(true,pa,pb,clipped)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared playable viewer state passed to the helper calls in `projectLine`. |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. |
| `width` | `dynamic` | — | Width in the coordinate space used by `projectLine`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `projectLine`. |
| `horizontalFovDegrees` | `dynamic` | — | Horizontal camera field of view in degrees. |
| `nearDistance` | `dynamic` | — | Distance from the camera to the near clipping plane. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L354)

<a id="function-function-mq3-client-playable-viewer-projectpoint-function-projectpoint-state-world-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-viewer-ml-1371433083"></a>
### projectPoint

```ml
function projectPoint(state, world, width, height, horizontalFovDegrees, nearDistance)
```

Calls `mq3.client.playable_viewer.viewPoint`, `mq3.client.playable_viewer.projectViewPoint` from playable viewer `projectPoint`. The final path returns `projectViewPoint(local,width,height,horizontalFovDegrees,nearDistance)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared playable viewer state passed to the helper calls in `projectPoint`. |
| `world` | `dynamic` | — | world record passed to the playable viewer helper calls. |
| `width` | `dynamic` | — | Width in the coordinate space used by `projectPoint`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `projectPoint`. |
| `horizontalFovDegrees` | `dynamic` | — | Horizontal camera field of view in degrees. |
| `nearDistance` | `dynamic` | — | Distance from the camera to the near clipping plane. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L250)

<a id="function-function-mq3-client-playable-viewer-projectprepared-function-projectprepared-projection-world-src-mq3-client-playable-viewer-ml-492908915"></a>
### projectPrepared

```ml
function projectPrepared(projection, world)
```

Calls `mq3.client.playable_viewer.preparedViewPoint`, `mq3.client.playable_viewer.projectPreparedView` from playable viewer `projectPrepared`. The final path returns `projectPreparedView(projection,point)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. |
| `world` | `dynamic` | — | world record passed to the playable viewer helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L295)

<a id="function-function-mq3-client-playable-viewer-projectpreparedview-function-projectpreparedview-projection-point-src-mq3-client-playable-viewer-ml-1019666543"></a>
### projectPreparedView

```ml
function projectPreparedView(projection, point)
```

Calls `mq3.client.playable_viewer.ScreenPoint` from playable viewer `projectPreparedView`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. Record read through `projection.nearDistance`, `projection.focal`, `projection.halfWidth`, `projection.halfHeight` and additional values. |
| `point` | `dynamic` | — | Sequence read at `point[2]`, `point[0]`, `point[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L284)

<a id="function-function-mq3-client-playable-viewer-projectviewpoint-function-projectviewpoint-point-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-viewer-ml-261434682"></a>
### projectViewPoint

```ml
function projectViewPoint(point, width, height, horizontalFovDegrees, nearDistance)
```

Calls `mq3.client.playable_viewer.focalLength`, `mq3.compat.numeric.fdiv`, `mq3.compat.numeric.fadd` and additional helpers from playable viewer `projectViewPoint`. The final path returns `ScreenPoint(x,y,point[2])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Sequence read at `point[2]`, `point[0]`, `point[1]`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `projectViewPoint`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `projectViewPoint`. |
| `horizontalFovDegrees` | `dynamic` | — | Horizontal camera field of view in degrees. |
| `nearDistance` | `dynamic` | — | Distance from the camera to the near clipping plane. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L231)

<a id="function-function-mq3-client-playable-viewer-refdefbasis-function-refdefbasis-axes-src-mq3-client-playable-viewer-ml-602341249"></a>
### refdefBasis

```ml
function refdefBasis(axes)
```

Original refdef_t/AnglesToAxis stores forward, LEFT, up. Screen-space projection and cloud-ray generation use forward, RIGHT, up instead.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `axes` | `dynamic` | — | Sequence read at `axes[1]`, `axes[0]`, `axes[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L167)

- [mq3.client.playable_viewer.ScreenLine](Type-mq3-client-playable-viewer-screenline-1193169834.md) — struct
- [mq3.client.playable_viewer.ScreenPoint](Type-mq3-client-playable-viewer-screenpoint-679483974.md) — struct
<a id="function-function-mq3-client-playable-viewer-step-function-step-state-command-deltamilliseconds-src-mq3-client-playable-viewer-ml-1782052208"></a>
### step

```ml
function step(state, command, deltaMilliseconds)
```

Updates `state.position` during playable viewer `step`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable viewer record/storage; this routine assigns `state.position`. |
| `command` | `dynamic` | — | Record read through `command.mouseX`, `command.mouseY`, `command.forward`, `command.back` and additional values. |
| `deltaMilliseconds` | `dynamic` | — | Elapsed simulation interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L183)

<a id="function-function-mq3-client-playable-viewer-viewpoint-function-viewpoint-state-world-src-mq3-client-playable-viewer-ml-538362457"></a>
### viewPoint

```ml
function viewPoint(state, world)
```

Calls `mq3.compat.numeric.fsub`, `mq3.client.playable_viewer.cameraBasis`, `mq3.shared.math.DotProduct` from playable viewer `viewPoint`. The final path returns `[qmath.DotProduct(delta,axes[1]),qmath.DotProduct(delta,axes[2]),qmath.DotProduct(delta,axes[0])]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.position`. |
| `world` | `dynamic` | — | Sequence read at `world[0]`, `world[1]`, `world[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L207)
