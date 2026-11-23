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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `mouseX` | `dynamic` | — |  |
| `mouseY` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L49)

<a id="function-function-mq3-client-playable-viewer-camera-function-camera-position-yaw-pitch-movespeed-mousesensitivity-src-mq3-client-playable-viewer-ml-1909774700"></a>
### camera

```ml
function camera(position, yaw, pitch, moveSpeed, mouseSensitivity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | `dynamic` | — |  |
| `yaw` | `dynamic` | — |  |
| `pitch` | `dynamic` | — |  |
| `moveSpeed` | `dynamic` | — |  |
| `mouseSensitivity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L20)

- [mq3.client.playable_viewer.Camera](Type-mq3-client-playable-viewer-camera-356576099.md) — struct
<a id="function-function-mq3-client-playable-viewer-camerabasis-function-camerabasis-state-src-mq3-client-playable-viewer-ml-1004225583"></a>
### cameraBasis

```ml
function cameraBasis(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L56)

<a id="function-function-mq3-client-playable-viewer-clampdelta-function-clampdelta-deltamilliseconds-src-mq3-client-playable-viewer-ml-739850378"></a>
### clampDelta

```ml
function clampDelta(deltaMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `deltaMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L35)

<a id="function-function-mq3-client-playable-viewer-clipnear-function-clipnear-a-b-neardistance-src-mq3-client-playable-viewer-ml-1006404032"></a>
### clipNear

```ml
function clipNear(a, b, nearDistance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `nearDistance` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L184)

<a id="function-function-mq3-client-playable-viewer-clipnearpolygon-function-clipnearpolygon-vertices-neardistance-src-mq3-client-playable-viewer-ml-560245140"></a>
### clipNearPolygon

```ml
function clipNearPolygon(vertices, nearDistance)
```

Sutherland-Hodgman clipping for a camera-space polygon. Components after xyz are interpolated with the intersection and can carry UV/light values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertices` | `dynamic` | — |  |
| `nearDistance` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L166)

<a id="function-function-mq3-client-playable-viewer-clipnearvertex-function-clipnearvertex-a-b-neardistance-src-mq3-client-playable-viewer-ml-907094672"></a>
### clipNearVertex

```ml
function clipNearVertex(a, b, nearDistance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `nearDistance` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L156)

<a id="function-function-mq3-client-playable-viewer-controls-function-controls-forward-back-left-right-up-down-mousex-mousey-src-mq3-client-playable-viewer-ml-315472053"></a>
### controls

```ml
function controls(forward, back, left, right, up, down, mouseX, mouseY)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `forward` | `dynamic` | — |  |
| `back` | `dynamic` | — |  |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |
| `mouseX` | `dynamic` | — |  |
| `mouseY` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L29)

- [mq3.client.playable_viewer.Controls](Type-mq3-client-playable-viewer-controls-845312094.md) — struct
<a id="constant-constant-mq3-client-playable-viewer-default-near-const-default-near-1-src-mq3-client-playable-viewer-ml-1832255624"></a>
### DEFAULT_NEAR

```ml
const DEFAULT_NEAR = 1.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L12)

<a id="function-function-mq3-client-playable-viewer-focallength-function-focallength-width-horizontalfovdegrees-src-mq3-client-playable-viewer-ml-1625029320"></a>
### focalLength

```ml
function focalLength(width, horizontalFovDegrees)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `horizontalFovDegrees` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L100)

<a id="function-function-mq3-client-playable-viewer-idlecontrols-function-idlecontrols-src-mq3-client-playable-viewer-ml-270992054"></a>
### idleControls

```ml
function idleControls()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L33)

<a id="constant-constant-mq3-client-playable-viewer-max-frame-milliseconds-const-max-frame-milliseconds-100-src-mq3-client-playable-viewer-ml-834836590"></a>
### MAX_FRAME_MILLISECONDS

```ml
const MAX_FRAME_MILLISECONDS = 100
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L11)

<a id="constant-constant-mq3-client-playable-viewer-max-pitch-const-max-pitch-89-src-mq3-client-playable-viewer-ml-1501836838"></a>
### MAX_PITCH

```ml
const MAX_PITCH = 89.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L10)

<a id="constant-constant-mq3-client-playable-viewer-min-pitch-const-min-pitch-89-src-mq3-client-playable-viewer-ml-1709023659"></a>
### MIN_PITCH

```ml
const MIN_PITCH = -89.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L9)

<a id="function-function-mq3-client-playable-viewer-movementbasis-function-movementbasis-state-src-mq3-client-playable-viewer-ml-99517715"></a>
### movementBasis

```ml
function movementBasis(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L67)

<a id="function-function-mq3-client-playable-viewer-normalizeangles-function-normalizeangles-state-src-mq3-client-playable-viewer-ml-969201339"></a>
### normalizeAngles

```ml
function normalizeAngles(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L41)

<a id="function-function-mq3-client-playable-viewer-preparedviewpoint-function-preparedviewpoint-projection-world-src-mq3-client-playable-viewer-ml-2038585699"></a>
### preparedViewPoint

```ml
function preparedViewPoint(projection, world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — |  |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L134)

<a id="function-function-mq3-client-playable-viewer-prepareprojection-function-prepareprojection-state-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-viewer-ml-76386857"></a>
### prepareProjection

```ml
function prepareProjection(state, width, height, horizontalFovDegrees, nearDistance)
```

Frame-local projection state avoids recalculating camera trigonometry and field-of-view constants for every BSP and MD3 vertex.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `horizontalFovDegrees` | `dynamic` | — |  |
| `nearDistance` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L127)

- [mq3.client.playable_viewer.Projection](Type-mq3-client-playable-viewer-projection-67447881.md) — struct
<a id="function-function-mq3-client-playable-viewer-projectline-function-projectline-state-startpoint-endpoint-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-viewer-ml-1404191992"></a>
### projectLine

```ml
function projectLine(state, startPoint, endPoint, width, height, horizontalFovDegrees, nearDistance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `startPoint` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `horizontalFovDegrees` | `dynamic` | — |  |
| `nearDistance` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L192)

<a id="function-function-mq3-client-playable-viewer-projectpoint-function-projectpoint-state-world-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-viewer-ml-1371433083"></a>
### projectPoint

```ml
function projectPoint(state, world, width, height, horizontalFovDegrees, nearDistance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `world` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `horizontalFovDegrees` | `dynamic` | — |  |
| `nearDistance` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L120)

<a id="function-function-mq3-client-playable-viewer-projectprepared-function-projectprepared-projection-world-src-mq3-client-playable-viewer-ml-492908915"></a>
### projectPrepared

```ml
function projectPrepared(projection, world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — |  |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L151)

<a id="function-function-mq3-client-playable-viewer-projectpreparedview-function-projectpreparedview-projection-point-src-mq3-client-playable-viewer-ml-1019666543"></a>
### projectPreparedView

```ml
function projectPreparedView(projection, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projection` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L143)

<a id="function-function-mq3-client-playable-viewer-projectviewpoint-function-projectviewpoint-point-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-viewer-ml-261434682"></a>
### projectViewPoint

```ml
function projectViewPoint(point, width, height, horizontalFovDegrees, nearDistance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `horizontalFovDegrees` | `dynamic` | — |  |
| `nearDistance` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L108)

<a id="function-function-mq3-client-playable-viewer-refdefbasis-function-refdefbasis-axes-src-mq3-client-playable-viewer-ml-602341249"></a>
### refdefBasis

```ml
function refdefBasis(axes)
```

Original refdef_t/AnglesToAxis stores forward, LEFT, up. Screen-space projection and cloud-ray generation use forward, RIGHT, up instead.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `axes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L62)

- [mq3.client.playable_viewer.ScreenLine](Type-mq3-client-playable-viewer-screenline-1193169834.md) — struct
- [mq3.client.playable_viewer.ScreenPoint](Type-mq3-client-playable-viewer-screenpoint-679483974.md) — struct
<a id="function-function-mq3-client-playable-viewer-step-function-step-state-command-deltamilliseconds-src-mq3-client-playable-viewer-ml-1782052208"></a>
### step

```ml
function step(state, command, deltaMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `deltaMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L72)

<a id="function-function-mq3-client-playable-viewer-viewpoint-function-viewpoint-state-world-src-mq3-client-playable-viewer-ml-538362457"></a>
### viewPoint

```ml
function viewPoint(state, world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L93)
