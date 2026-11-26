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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `center` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `intensity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L63)

- [mq3.client.playable_explosions.Catalog](Type-mq3-client-playable-explosions-catalog-1120408645.md) — struct
<a id="function-function-mq3-client-playable-explosions-draw-function-draw-catalog-snapshots-camera-projection-now-src-mq3-client-playable-explosions-ml-1305050096"></a>
### draw

```ml
function draw(catalog, snapshots, camera, projection, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `snapshots` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L96)

<a id="function-function-mq3-client-playable-explosions-drawplasma-function-drawplasma-catalog-batch-snapshot-p-projection-now-src-mq3-client-playable-explosions-ml-1135310388"></a>
### drawPlasma

```ml
function drawPlasma(catalog, batch, snapshot, p, projection, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `batch` | `dynamic` | — |  |
| `snapshot` | `dynamic` | — |  |
| `p` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L87)

<a id="function-function-mq3-client-playable-explosions-drawsprite-function-drawsprite-catalog-batch-snapshot-p-camera-projection-now-src-mq3-client-playable-explosions-ml-1744933799"></a>
### drawSprite

```ml
function drawSprite(catalog, batch, snapshot, p, camera, projection, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `batch` | `dynamic` | — |  |
| `snapshot` | `dynamic` | — |  |
| `p` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L69)

<a id="function-function-mq3-client-playable-explosions-fail-function-fail-message-src-mq3-client-playable-explosions-ml-1273503911"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L25)

<a id="function-function-mq3-client-playable-explosions-fraction-function-fraction-value-src-mq3-client-playable-explosions-ml-1432132477"></a>
### fraction

```ml
function fraction(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L48)

<a id="function-function-mq3-client-playable-explosions-load-function-load-archive-firsttextureslot-maxtextureslots-src-mq3-client-playable-explosions-ml-1928305055"></a>
### load

```ml
function load(archive, firstTextureSlot, maxTextureSlots)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `firstTextureSlot` | `dynamic` | — |  |
| `maxTextureSlots` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L35)

<a id="constant-constant-mq3-client-playable-explosions-max-textures-const-max-textures-15-src-mq3-client-playable-explosions-ml-43664843"></a>
### MAX_TEXTURES

```ml
const MAX_TEXTURES = 15
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L17)

<a id="constant-constant-mq3-client-playable-explosions-max-triangles-const-max-triangles-4096-src-mq3-client-playable-explosions-ml-1912082810"></a>
### MAX_TRIANGLES

```ml
const MAX_TRIANGLES = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L18)

<a id="constant-constant-mq3-client-playable-explosions-pi-const-pi-3-141593-src-mq3-client-playable-explosions-ml-1068471483"></a>
### PI

```ml
const PI = 3.141593
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L19)

<a id="function-function-mq3-client-playable-explosions-plasmaaxes-function-plasmaaxes-snapshot-src-mq3-client-playable-explosions-ml-2091629270"></a>
### plasmaAxes

```ml
function plasmaAxes(snapshot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L78)

<a id="function-function-mq3-client-playable-explosions-plasmauv-function-plasmauv-uv-elapsed-src-mq3-client-playable-explosions-ml-1498155285"></a>
### plasmaUv

```ml
function plasmaUv(uv, elapsed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `uv` | `dynamic` | — |  |
| `elapsed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L84)

<a id="function-function-mq3-client-playable-explosions-profile-function-profile-style-src-mq3-client-playable-explosions-ml-1245803483"></a>
### profile

```ml
function profile(style)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L26)

- [mq3.client.playable_explosions.Profile](Type-mq3-client-playable-explosions-profile-2071711251.md) — struct
<a id="function-function-mq3-client-playable-explosions-randomoffset-function-randomoffset-snapshot-src-mq3-client-playable-explosions-ml-280186482"></a>
### randomOffset

```ml
function randomOffset(snapshot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L49)

<a id="function-function-mq3-client-playable-explosions-release-function-release-catalog-src-mq3-client-playable-explosions-ml-1366411093"></a>
### release

```ml
function release(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L46)

<a id="function-function-mq3-client-playable-explosions-rotatepair-function-rotatepair-right-up-degrees-src-mq3-client-playable-explosions-ml-364387302"></a>
### rotatePair

```ml
function rotatePair(right, up, degrees)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `right` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `degrees` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L58)

<a id="function-function-mq3-client-playable-explosions-rotation-function-rotation-snapshot-src-mq3-client-playable-explosions-ml-1196614882"></a>
### rotation

```ml
function rotation(snapshot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L50)

<a id="function-function-mq3-client-playable-explosions-spriteradius-function-spriteradius-endtime-starttime-now-src-mq3-client-playable-explosions-ml-654830987"></a>
### spriteRadius

```ml
function spriteRadius(endTime, startTime, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `endTime` | `dynamic` | — |  |
| `startTime` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L55)

- [mq3.client.playable_explosions.Texture](Type-mq3-client-playable-explosions-texture-1560609649.md) — struct
<a id="function-function-mq3-client-playable-explosions-texturefor-function-texturefor-catalog-name-src-mq3-client-playable-explosions-ml-903495558"></a>
### textureFor

```ml
function textureFor(catalog, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L33)

<a id="function-function-mq3-client-playable-explosions-timing-function-timing-snapshot-p-now-src-mq3-client-playable-explosions-ml-590474578"></a>
### timing

```ml
function timing(snapshot, p, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — |  |
| `p` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L51)

<a id="function-function-mq3-client-playable-explosions-transformpoint-function-transformpoint-origin-axes-point-src-mq3-client-playable-explosions-ml-336335619"></a>
### transformPoint

```ml
function transformPoint(origin, axes, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `axes` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L82)

<a id="function-function-mq3-client-playable-explosions-trianglewave-function-trianglewave-value-src-mq3-client-playable-explosions-ml-1807228745"></a>
### triangleWave

```ml
function triangleWave(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L83)

<a id="function-function-mq3-client-playable-explosions-upload-function-upload-catalog-src-mq3-client-playable-explosions-ml-1389473479"></a>
### upload

```ml
function upload(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L45)

<a id="function-function-mq3-client-playable-explosions-worldpoint-function-worldpoint-center-right-up-x-y-src-mq3-client-playable-explosions-ml-137559943"></a>
### worldPoint

```ml
function worldPoint(center, right, up, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L62)
