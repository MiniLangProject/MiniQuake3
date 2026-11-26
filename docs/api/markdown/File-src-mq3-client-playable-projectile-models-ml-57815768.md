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

Updates `catalog.skipped` during playable projectile models `appendFallback`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Mutable playable projectile models record/storage; this routine assigns `catalog.skipped`. |
| `style` | `dynamic` | — | Value used by `if not containsStyle(catalog.skipped,style) then catalog.skipped=catalog.skipped+[style] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L165)

- [mq3.client.playable_projectile_models.Asset](Type-mq3-client-playable-projectile-models-asset-1716812644.md) — struct
- [mq3.client.playable_projectile_models.Batch](Type-mq3-client-playable-projectile-models-batch-333403828.md) — struct
- [mq3.client.playable_projectile_models.Catalog](Type-mq3-client-playable-projectile-models-catalog-576876371.md) — struct
<a id="function-function-mq3-client-playable-projectile-models-containsstyle-function-containsstyle-values-style-src-mq3-client-playable-projectile-models-ml-1131943775"></a>
### containsStyle

```ml
function containsStyle(values, style)
```

Evaluates playable projectile models `containsStyle` and returns `true`, `false` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Value used by `for each value in values if value==style then return true end if end for`. |
| `style` | `dynamic` | — | Value used by `for each value in values if value==style then return true end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L148)

<a id="function-function-mq3-client-playable-projectile-models-definition-function-definition-style-src-mq3-client-playable-projectile-models-ml-1176612653"></a>
### definition

```ml
function definition(style)
```

cg_weapons.c registers these exact assets. Plasma has no missile MD3 in Baseq3: CG_Missile emits an RT_SPRITE using sprites/plasma1 at radius 16.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | `dynamic` | — | Value used by `if style==projectileView.STYLE_ROCKET then return Definition(style,KIND_MODEL,"models/ammo/rocket/rocket.md3","",0.0,4) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L137)

- [mq3.client.playable_projectile_models.Definition](Type-mq3-client-playable-projectile-models-definition-162654133.md) — struct
<a id="function-function-mq3-client-playable-projectile-models-fail-function-fail-message-src-mq3-client-playable-projectile-models-ml-1594595639"></a>
### fail

```ml
function fail(message)
```

Creates the playable projectile models error `7600` with diagnostic text `"preview projectile models: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"preview projectile models: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L129)

<a id="function-function-mq3-client-playable-projectile-models-find-function-find-catalog-style-src-mq3-client-playable-projectile-models-ml-1119751576"></a>
### find

```ml
function find(catalog, style)
```

Searches the playable projectile models collection for find, returning `void` when no entry matches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.assets`. |
| `style` | `dynamic` | — | Value used by `for each asset in catalog.assets if asset.style==style then return asset end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L156)

<a id="constant-constant-mq3-client-playable-projectile-models-kind-model-const-kind-model-1-src-mq3-client-playable-projectile-models-ml-387555878"></a>
### KIND_MODEL

```ml
const KIND_MODEL = 1
```

Effect or media category selecting the model presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L14)

<a id="constant-constant-mq3-client-playable-projectile-models-kind-sprite-const-kind-sprite-2-src-mq3-client-playable-projectile-models-ml-1451135863"></a>
### KIND_SPRITE

```ml
const KIND_SPRITE = 2
```

Effect or media category selecting the sprite presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L16)

<a id="function-function-mq3-client-playable-projectile-models-loadcatalog-function-loadcatalog-archive-firsttextureslot-maxtextureslots-src-mq3-client-playable-projectile-models-ml-240526897"></a>
### loadCatalog

```ml
function loadCatalog(archive, firstTextureSlot, maxTextureSlots)
```

Missing/corrupt optional media and an exhausted slot budget select the existing effect renderer as a fallback instead of making preview startup fail.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `firstTextureSlot` | `dynamic` | — | First texture slot reserved for this asset collection. |
| `maxTextureSlots` | `dynamic` | — | Maximum number of texture slots available to the renderer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L214)

<a id="function-function-mq3-client-playable-projectile-models-loadmodel-function-loadmodel-archive-catalog-def-src-mq3-client-playable-projectile-models-ml-1396784442"></a>
### loadModel

```ml
function loadModel(archive, catalog, def)
```

Updates `catalog.textures` during playable projectile models `loadModel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `catalog` | `dynamic` | — | Mutable playable projectile models record/storage; this routine assigns `catalog.textures`. |
| `def` | `dynamic` | — | Record read through `def.modelPath`, `def.style`, `def.kind`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L200)

<a id="function-function-mq3-client-playable-projectile-models-loadsprite-function-loadsprite-archive-catalog-def-src-mq3-client-playable-projectile-models-ml-1757035916"></a>
### loadSprite

```ml
function loadSprite(archive, catalog, def)
```

Updates `catalog.textures` during playable projectile models `loadSprite`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `catalog` | `dynamic` | — | Mutable playable projectile models record/storage; this routine assigns `catalog.textures`. |
| `def` | `dynamic` | — | Record read through `def.shaderName`, `def.style`, `def.kind`, `def.radius`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L181)

<a id="constant-constant-mq3-client-playable-projectile-models-max-texture-slots-const-max-texture-slots-16-src-mq3-client-playable-projectile-models-ml-1105998672"></a>
### MAX_TEXTURE_SLOTS

```ml
const MAX_TEXTURE_SLOTS = 16
```

Capacity limit for the texture slots collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L18)

<a id="constant-constant-mq3-client-playable-projectile-models-max-triangles-per-projectile-const-max-triangles-per-projectile-4096-src-mq3-client-playable-projectile-models-ml-738351478"></a>
### MAX_TRIANGLES_PER_PROJECTILE

```ml
const MAX_TRIANGLES_PER_PROJECTILE = 4096
```

Capacity limit for the triangles per projectile collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L21)

<a id="function-function-mq3-client-playable-projectile-models-perpendicular-function-perpendicular-direction-src-mq3-client-playable-projectile-models-ml-1012774829"></a>
### perpendicular

```ml
function perpendicular(direction)
```

Calls `mq3.shared.math.CrossProduct`, `mq3.shared.math.VectorNormalize` from playable projectile models `perpendicular`. The final path returns `side`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `direction` | `dynamic` | — | Direction vector used by the spatial calculation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L234)

<a id="constant-constant-mq3-client-playable-projectile-models-pi-const-pi-3-141593-src-mq3-client-playable-projectile-models-ml-1014892891"></a>
### PI

```ml
const PI = 3.141593
```

Circle constant used to convert or evaluate angles in trigonometric calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L27)

<a id="constant-constant-mq3-client-playable-projectile-models-plasma-radius-const-plasma-radius-16-src-mq3-client-playable-projectile-models-ml-2064987352"></a>
### PLASMA_RADIUS

```ml
const PLASMA_RADIUS = 16
```

World-space size used to construct the plasma projectile presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L23)

- [mq3.client.playable_projectile_models.Rendered](Type-mq3-client-playable-projectile-models-rendered-1265723693.md) — struct
<a id="function-function-mq3-client-playable-projectile-models-rendermodel-function-rendermodel-asset-snapshot-nowmilliseconds-maxtriangles-src-mq3-client-playable-projectile-models-ml-1082838603"></a>
### renderModel

```ml
function renderModel(asset, snapshot, nowMilliseconds, maxTriangles)
```

Calls `mq3.client.playable_projectile_models.snapshotAxis`, `mq3.client.playable_item_models.transform`, `mq3.client.playable_item_models.renderAsset` and additional helpers from playable projectile models `renderModel`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `asset` | `dynamic` | — | Record read through `asset.modelAsset`, `asset.style`. |
| `snapshot` | `dynamic` | — | Record read through `snapshot.position`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |
| `maxTriangles` | `dynamic` | — | Upper bound on emitted render triangles. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L278)

<a id="function-function-mq3-client-playable-projectile-models-rendersnapshot-function-rendersnapshot-catalog-snapshot-camera-nowmilliseconds-maxtriangles-src-mq3-client-playable-projectile-models-ml-846026265"></a>
### renderSnapshot

```ml
function renderSnapshot(catalog, snapshot, camera, nowMilliseconds, maxTriangles)
```

Calls `mq3.client.playable_projectile_view.alive`, `mq3.client.playable_projectile_models.Rendered`, `mq3.client.playable_projectile_models.find` and additional helpers from playable projectile models `renderSnapshot`. The final path returns `Rendered(triangles,len(triangles)==0,snapshot.style)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `snapshot` | `dynamic` | — | Record read through `snapshot.state`, `snapshot.style`. |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |
| `maxTriangles` | `dynamic` | — | Upper bound on emitted render triangles. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L318)

<a id="function-function-mq3-client-playable-projectile-models-rendersnapshots-function-rendersnapshots-catalog-snapshots-camera-nowmilliseconds-maxperprojectile-maxtriangles-src-mq3-client-playable-projectile-models-ml-247390572"></a>
### renderSnapshots

```ml
function renderSnapshots(catalog, snapshots, camera, nowMilliseconds, maxPerProjectile, maxTriangles)
```

Calls `mq3.client.playable_projectile_models.renderSnapshot`, `mq3.client.playable_projectile_models.Batch` from playable projectile models `renderSnapshots`. The final path returns `Batch(result,fallback)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `snapshots` | `dynamic` | — | Value used by `if snapshots==void or maxPerProjectile<0 or maxTriangles<0 then return fail("snapshots and non-negative budgets are required") end if`. |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |
| `maxPerProjectile` | `dynamic` | — | Value used by `if snapshots==void or maxPerProjectile<0 or maxTriangles<0 then return fail("snapshots and non-negative budgets are required") end if`. |
| `maxTriangles` | `dynamic` | — | Upper bound on emitted render triangles. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L337)

<a id="function-function-mq3-client-playable-projectile-models-rendersprite-function-rendersprite-asset-snapshot-camera-maxtriangles-src-mq3-client-playable-projectile-models-ml-103806540"></a>
### renderSprite

```ml
function renderSprite(asset, snapshot, camera, maxTriangles)
```

Calls `mq3.client.playable_viewer.cameraBasis`, `mq3.client.playable_projectile_models.spritePoint`, `mq3.client.playable_projectile_models.Triangle` from playable projectile models `renderSprite`. The final path returns `[one,two]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `asset` | `dynamic` | — | Record read through `asset.radius`, `asset.textureSlot`, `asset.imageName`, `asset.shaderName` and additional values. |
| `snapshot` | `dynamic` | — | Record read through `snapshot.position`. |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `maxTriangles` | `dynamic` | — | Upper bound on emitted render triangles. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L301)

<a id="function-function-mq3-client-playable-projectile-models-rotatepair-function-rotatepair-side-up-degrees-src-mq3-client-playable-projectile-models-ml-1107844283"></a>
### rotatePair

```ml
function rotatePair(side, up, degrees)
```

Calls `mq3.compat.numeric.f32`, `mq3.compat.transcendental.sin`, `mq3.compat.transcendental.cos` from playable projectile models `rotatePair`. The final path returns `[spunSide,spunUp]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `side` | `dynamic` | — | Sequence read at `side[0]`, `side[1]`, `side[2]`. |
| `up` | `dynamic` | — | Sequence read at `up[0]`, `up[1]`, `up[2]`. |
| `degrees` | `dynamic` | — | Value used by `radians=numeric.f32(degrees*PI/180.0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L246)

<a id="function-function-mq3-client-playable-projectile-models-snapshotaxis-function-snapshotaxis-snapshot-nowmilliseconds-src-mq3-client-playable-projectile-models-ml-1798562598"></a>
### snapshotAxis

```ml
function snapshotAxis(snapshot, nowMilliseconds)
```

Mirrors CG_Missile: axis[0] follows travel and the other axes roll by cg.time/4 degrees. A stationary snapshot points upward as in the C code.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | Record read through `snapshot.previousPosition`, `snapshot.position`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L257)

<a id="constant-constant-mq3-client-playable-projectile-models-spin-degrees-per-millisecond-const-spin-degrees-per-millisecond-0-25-src-mq3-client-playable-projectile-models-ml-599217230"></a>
### SPIN_DEGREES_PER_MILLISECOND

```ml
const SPIN_DEGREES_PER_MILLISECOND = 0.25
```

Angular rotation rate applied to the projectile presentation for each elapsed millisecond.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L25)

<a id="function-function-mq3-client-playable-projectile-models-spritepoint-function-spritepoint-center-right-up-x-y-src-mq3-client-playable-projectile-models-ml-773093389"></a>
### spritePoint

```ml
function spritePoint(center, right, up, x, y)
```

Builds the playable projectile models `spritePoint` sequence from `[center[0]+right[0]*x+up[0]*y,center[1]+right[1]*x+up[1]*y,center[2]+right[2]*x+up[2]*y]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | `dynamic` | — | Sequence read at `center[0]`, `center[1]`, `center[2]`. |
| `right` | `dynamic` | — | Sequence read at `right[0]`, `right[1]`, `right[2]`. |
| `up` | `dynamic` | — | Sequence read at `up[0]`, `up[1]`, `up[2]`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `spritePoint`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `spritePoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L292)

<a id="function-function-mq3-client-playable-projectile-models-texturebyname-function-texturebyname-catalog-name-src-mq3-client-playable-projectile-models-ml-1811345882"></a>
### textureByName

```ml
function textureByName(catalog, name)
```

Calls `stringEqualsIgnoreCaseAscii` from playable projectile models `textureByName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.textures`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable projectile models resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L172)

- [mq3.client.playable_projectile_models.Triangle](Type-mq3-client-playable-projectile-models-triangle-660647768.md) — struct
<a id="function-function-mq3-client-playable-projectile-models-valid3-function-valid3-value-src-mq3-client-playable-projectile-models-ml-1254362033"></a>
### valid3

```ml
function valid3(value)
```

Computes `value!=void and typeof(value)=="array" and len(value)==3` for playable projectile models `valid3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence whose length/content is inspected by `valid3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L132)

<a id="function-function-mq3-client-playable-projectile-models-wrapmodeltriangle-function-wrapmodeltriangle-source-style-src-mq3-client-playable-projectile-models-ml-682583996"></a>
### wrapModelTriangle

```ml
function wrapModelTriangle(source, style)
```

Creates a `mq3.client.playable_projectile_models.Triangle` record. Assigns `style` from `style`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record read through `source.positions`, `source.texCoords`, `source.normals`, `source.textureSlot` and additional values. |
| `style` | `dynamic` | — | Value used to initialize `Triangle.style`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L269)
