# `src/mq3/client/playable_projectile_models.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_projectile_models`](Package-mq3-client-playable-projectile-models-69564554.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_item_models.ml` as `itemModels` → [src/mq3/client/playable_item_models.ml](File-src-mq3-client-playable-item-models-ml-1740601852.md)
- `mq3/client/playable_projectile_view.ml` as `projectileView` → [src/mq3/client/playable_projectile_view.ml](File-src-mq3-client-playable-projectile-view-ml-1417864517.md)
- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-client-playable-projectile-models-appendfallback-function-appendfallback-catalog-style-src-mq3-client-playable-projectile-models-ml-505968740"></a>
### appendFallback

```ml
function appendFallback(catalog, style)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L52)

- [mq3.client.playable_projectile_models.Asset](Type-mq3-client-playable-projectile-models-asset-1716812644.md) — struct
- [mq3.client.playable_projectile_models.Batch](Type-mq3-client-playable-projectile-models-batch-333403828.md) — struct
- [mq3.client.playable_projectile_models.Catalog](Type-mq3-client-playable-projectile-models-catalog-576876371.md) — struct
<a id="function-function-mq3-client-playable-projectile-models-containsstyle-function-containsstyle-values-style-src-mq3-client-playable-projectile-models-ml-1131943775"></a>
### containsStyle

```ml
function containsStyle(values, style)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L41)

<a id="function-function-mq3-client-playable-projectile-models-definition-function-definition-style-src-mq3-client-playable-projectile-models-ml-1176612653"></a>
### definition

```ml
function definition(style)
```

cg_weapons.c registers these exact assets. Plasma has no missile MD3 in Baseq3: CG_Missile emits an RT_SPRITE using sprites/plasma1 at radius 16.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L33)

- [mq3.client.playable_projectile_models.Definition](Type-mq3-client-playable-projectile-models-definition-162654133.md) — struct
<a id="function-function-mq3-client-playable-projectile-models-fail-function-fail-message-src-mq3-client-playable-projectile-models-ml-1594595639"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L28)

<a id="function-function-mq3-client-playable-projectile-models-find-function-find-catalog-style-src-mq3-client-playable-projectile-models-ml-1119751576"></a>
### find

```ml
function find(catalog, style)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L46)

<a id="constant-constant-mq3-client-playable-projectile-models-kind-model-const-kind-model-1-src-mq3-client-playable-projectile-models-ml-387555878"></a>
### KIND_MODEL

```ml
const KIND_MODEL = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L13)

<a id="constant-constant-mq3-client-playable-projectile-models-kind-sprite-const-kind-sprite-2-src-mq3-client-playable-projectile-models-ml-1451135863"></a>
### KIND_SPRITE

```ml
const KIND_SPRITE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L14)

<a id="function-function-mq3-client-playable-projectile-models-loadcatalog-function-loadcatalog-archive-firsttextureslot-maxtextureslots-src-mq3-client-playable-projectile-models-ml-240526897"></a>
### loadCatalog

```ml
function loadCatalog(archive, firstTextureSlot, maxTextureSlots)
```

Missing/corrupt optional media and an exhausted slot budget select the existing effect renderer as a fallback instead of making preview startup fail.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `firstTextureSlot` | `dynamic` | — |  |
| `maxTextureSlots` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L87)

<a id="function-function-mq3-client-playable-projectile-models-loadmodel-function-loadmodel-archive-catalog-def-src-mq3-client-playable-projectile-models-ml-1396784442"></a>
### loadModel

```ml
function loadModel(archive, catalog, def)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `def` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L76)

<a id="function-function-mq3-client-playable-projectile-models-loadsprite-function-loadsprite-archive-catalog-def-src-mq3-client-playable-projectile-models-ml-1757035916"></a>
### loadSprite

```ml
function loadSprite(archive, catalog, def)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `def` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L61)

<a id="constant-constant-mq3-client-playable-projectile-models-max-texture-slots-const-max-texture-slots-16-src-mq3-client-playable-projectile-models-ml-1105998672"></a>
### MAX_TEXTURE_SLOTS

```ml
const MAX_TEXTURE_SLOTS = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L15)

<a id="constant-constant-mq3-client-playable-projectile-models-max-triangles-per-projectile-const-max-triangles-per-projectile-4096-src-mq3-client-playable-projectile-models-ml-738351478"></a>
### MAX_TRIANGLES_PER_PROJECTILE

```ml
const MAX_TRIANGLES_PER_PROJECTILE = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L16)

<a id="function-function-mq3-client-playable-projectile-models-perpendicular-function-perpendicular-direction-src-mq3-client-playable-projectile-models-ml-1012774829"></a>
### perpendicular

```ml
function perpendicular(direction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `direction` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L105)

<a id="constant-constant-mq3-client-playable-projectile-models-pi-const-pi-3-141593-src-mq3-client-playable-projectile-models-ml-1014892891"></a>
### PI

```ml
const PI = 3.141593
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L19)

<a id="constant-constant-mq3-client-playable-projectile-models-plasma-radius-const-plasma-radius-16-src-mq3-client-playable-projectile-models-ml-2064987352"></a>
### PLASMA_RADIUS

```ml
const PLASMA_RADIUS = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L17)

- [mq3.client.playable_projectile_models.Rendered](Type-mq3-client-playable-projectile-models-rendered-1265723693.md) — struct
<a id="function-function-mq3-client-playable-projectile-models-rendermodel-function-rendermodel-asset-snapshot-nowmilliseconds-maxtriangles-src-mq3-client-playable-projectile-models-ml-1082838603"></a>
### renderModel

```ml
function renderModel(asset, snapshot, nowMilliseconds, maxTriangles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `asset` | `dynamic` | — |  |
| `snapshot` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L135)

<a id="function-function-mq3-client-playable-projectile-models-rendersnapshot-function-rendersnapshot-catalog-snapshot-camera-nowmilliseconds-maxtriangles-src-mq3-client-playable-projectile-models-ml-846026265"></a>
### renderSnapshot

```ml
function renderSnapshot(catalog, snapshot, camera, nowMilliseconds, maxTriangles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `snapshot` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L158)

<a id="function-function-mq3-client-playable-projectile-models-rendersnapshots-function-rendersnapshots-catalog-snapshots-camera-nowmilliseconds-maxperprojectile-maxtriangles-src-mq3-client-playable-projectile-models-ml-247390572"></a>
### renderSnapshots

```ml
function renderSnapshots(catalog, snapshots, camera, nowMilliseconds, maxPerProjectile, maxTriangles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `snapshots` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `maxPerProjectile` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L170)

<a id="function-function-mq3-client-playable-projectile-models-rendersprite-function-rendersprite-asset-snapshot-camera-maxtriangles-src-mq3-client-playable-projectile-models-ml-103806540"></a>
### renderSprite

```ml
function renderSprite(asset, snapshot, camera, maxTriangles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `asset` | `dynamic` | — |  |
| `snapshot` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L147)

<a id="function-function-mq3-client-playable-projectile-models-rotatepair-function-rotatepair-side-up-degrees-src-mq3-client-playable-projectile-models-ml-1107844283"></a>
### rotatePair

```ml
function rotatePair(side, up, degrees)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `side` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `degrees` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L113)

<a id="function-function-mq3-client-playable-projectile-models-snapshotaxis-function-snapshotaxis-snapshot-nowmilliseconds-src-mq3-client-playable-projectile-models-ml-1798562598"></a>
### snapshotAxis

```ml
function snapshotAxis(snapshot, nowMilliseconds)
```

Mirrors CG_Missile: axis[0] follows travel and the other axes roll by cg.time/4 degrees. A stationary snapshot points upward as in the C code.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L122)

<a id="constant-constant-mq3-client-playable-projectile-models-spin-degrees-per-millisecond-const-spin-degrees-per-millisecond-0-25-src-mq3-client-playable-projectile-models-ml-599217230"></a>
### SPIN_DEGREES_PER_MILLISECOND

```ml
const SPIN_DEGREES_PER_MILLISECOND = 0.25
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L18)

<a id="function-function-mq3-client-playable-projectile-models-spritepoint-function-spritepoint-center-right-up-x-y-src-mq3-client-playable-projectile-models-ml-773093389"></a>
### spritePoint

```ml
function spritePoint(center, right, up, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L143)

<a id="function-function-mq3-client-playable-projectile-models-texturebyname-function-texturebyname-catalog-name-src-mq3-client-playable-projectile-models-ml-1811345882"></a>
### textureByName

```ml
function textureByName(catalog, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L56)

- [mq3.client.playable_projectile_models.Triangle](Type-mq3-client-playable-projectile-models-triangle-660647768.md) — struct
<a id="function-function-mq3-client-playable-projectile-models-valid3-function-valid3-value-src-mq3-client-playable-projectile-models-ml-1254362033"></a>
### valid3

```ml
function valid3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L29)

<a id="function-function-mq3-client-playable-projectile-models-wrapmodeltriangle-function-wrapmodeltriangle-source-style-src-mq3-client-playable-projectile-models-ml-682583996"></a>
### wrapModelTriangle

```ml
function wrapModelTriangle(source, style)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L131)
