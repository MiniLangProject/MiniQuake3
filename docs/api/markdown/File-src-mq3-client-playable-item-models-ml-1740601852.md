# `src/mq3/client/playable_item_models.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_item_models`](Package-mq3-client-playable-item-models-1101220898.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/format/md3.ml` as `md3` → [src/mq3/format/md3.ml](File-src-mq3-format-md3-ml-2098563759.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/renderer/player_skins.ml` as `skins` → [src/mq3/renderer/player_skins.ml](File-src-mq3-renderer-player-skins-ml-163797353.md)
- `mq3/renderer/surface_md3.ml` as `md3Mesh` → [src/mq3/renderer/surface_md3.ml](File-src-mq3-renderer-surface-md3-ml-438987327.md)
- `mq3/renderer/view_math.ml` as `viewMath` → [src/mq3/renderer/view_math.ml](File-src-mq3-renderer-view-math-ml-126526929.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.playable_item_models.Asset](Type-mq3-client-playable-item-models-asset-1111532172.md) — struct
- [mq3.client.playable_item_models.Batch](Type-mq3-client-playable-item-models-batch-409400396.md) — struct
- [mq3.client.playable_item_models.Binding](Type-mq3-client-playable-item-models-binding-2010349149.md) — struct
<a id="function-function-mq3-client-playable-item-models-bindingforsurface-function-bindingforsurface-asset-surfaceindex-src-mq3-client-playable-item-models-ml-1700523503"></a>
### bindingForSurface

```ml
function bindingForSurface(asset, surfaceIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `asset` | `dynamic` | — |  |
| `surfaceIndex` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L213)

- [mq3.client.playable_item_models.CachedSurface](Type-mq3-client-playable-item-models-cachedsurface-1441569629.md) — struct
<a id="function-function-mq3-client-playable-item-models-cachemodeltriangles-function-cachemodeltriangles-model-src-mq3-client-playable-item-models-ml-621162801"></a>
### cacheModelTriangles

```ml
function cacheModelTriangles(model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L154)

- [mq3.client.playable_item_models.Catalog](Type-mq3-client-playable-item-models-catalog-1063629371.md) — struct
<a id="function-function-mq3-client-playable-item-models-containsclassname-function-containsclassname-catalog-classname-src-mq3-client-playable-item-models-ml-864121746"></a>
### containsClassname

```ml
function containsClassname(catalog, classname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L149)

<a id="constant-constant-mq3-client-playable-item-models-default-bob-amplitude-const-default-bob-amplitude-4-src-mq3-client-playable-item-models-ml-1978469185"></a>
### DEFAULT_BOB_AMPLITUDE

```ml
const DEFAULT_BOB_AMPLITUDE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L15)

<a id="constant-constant-mq3-client-playable-item-models-default-spin-degrees-per-second-const-default-spin-degrees-per-second-100-src-mq3-client-playable-item-models-ml-1166353544"></a>
### DEFAULT_SPIN_DEGREES_PER_SECOND

```ml
const DEFAULT_SPIN_DEGREES_PER_SECOND = 100
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L16)

<a id="function-function-mq3-client-playable-item-models-definition-function-definition-classname-src-mq3-client-playable-item-models-ml-1504508215"></a>
### definition

```ml
function definition(classname)
```

Baseq3 bg_itemlist world_model[0] paths. These are the actual MD3 pickups in pak0.pk3; aliases only cover classnames emitted by stock maps/gamecode.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L39)

- [mq3.client.playable_item_models.Definition](Type-mq3-client-playable-item-models-definition-1759347693.md) — struct
<a id="function-function-mq3-client-playable-item-models-fail-function-fail-message-src-mq3-client-playable-item-models-ml-2033179375"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L31)

<a id="function-function-mq3-client-playable-item-models-find-function-find-catalog-classname-src-mq3-client-playable-item-models-ml-1971496970"></a>
### find

```ml
function find(catalog, classname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L207)

<a id="function-function-mq3-client-playable-item-models-identityaxis-function-identityaxis-src-mq3-client-playable-item-models-ml-1220977248"></a>
### identityAxis

```ml
function identityAxis()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L89)

<a id="function-function-mq3-client-playable-item-models-identitytransform-function-identitytransform-src-mq3-client-playable-item-models-ml-669273956"></a>
### identityTransform

```ml
function identityTransform()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L91)

<a id="function-function-mq3-client-playable-item-models-imagestem-function-imagestem-name-src-mq3-client-playable-item-models-ml-312363663"></a>
### imageStem

```ml
function imageStem(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L120)

<a id="function-function-mq3-client-playable-item-models-item-function-item-classname-category-path-scale-heightoffset-src-mq3-client-playable-item-models-ml-1611980642"></a>
### item

```ml
function item(classname, category, path, scale, heightOffset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — |  |
| `category` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `heightOffset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L33)

<a id="function-function-mq3-client-playable-item-models-itemtransform-function-itemtransform-asset-origin-itemindex-now-src-mq3-client-playable-item-models-ml-600519947"></a>
### itemTransform

```ml
function itemTransform(asset, origin, itemIndex, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `asset` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `itemIndex` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L258)

<a id="function-function-mq3-client-playable-item-models-loadcatalog-function-loadcatalog-archive-classnames-firsttextureslot-maxtextureslots-maxmodels-src-mq3-client-playable-item-models-ml-810287419"></a>
### loadCatalog

```ml
function loadCatalog(archive, classnames, firstTextureSlot, maxTextureSlots, maxModels)
```

Loads each unique recognized classname once. The returned texture list owns stable native slots and is shared by world pickups and first-person weapons.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `classnames` | `dynamic` | — |  |
| `firstTextureSlot` | `dynamic` | — |  |
| `maxTextureSlots` | `dynamic` | — |  |
| `maxModels` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L188)

<a id="function-function-mq3-client-playable-item-models-loaddefinition-function-loaddefinition-archive-catalog-def-src-mq3-client-playable-item-models-ml-1287684788"></a>
### loadDefinition

```ml
function loadDefinition(archive, catalog, def)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `def` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L170)

<a id="constant-constant-mq3-client-playable-item-models-max-catalog-models-const-max-catalog-models-64-src-mq3-client-playable-item-models-ml-952049731"></a>
### MAX_CATALOG_MODELS

```ml
const MAX_CATALOG_MODELS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L17)

<a id="constant-constant-mq3-client-playable-item-models-max-catalog-textures-const-max-catalog-textures-96-src-mq3-client-playable-item-models-ml-1531555868"></a>
### MAX_CATALOG_TEXTURES

```ml
const MAX_CATALOG_TEXTURES = 96
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L18)

<a id="constant-constant-mq3-client-playable-item-models-pi-const-pi-3-141593-src-mq3-client-playable-item-models-ml-1565835699"></a>
### PI

```ml
const PI = 3.141593
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L19)

<a id="function-function-mq3-client-playable-item-models-renderasset-function-renderasset-asset-value-maxtriangles-src-mq3-client-playable-item-models-ml-1776559574"></a>
### renderAsset

```ml
function renderAsset(asset, value, maxTriangles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `asset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L219)

<a id="function-function-mq3-client-playable-item-models-renderitem-function-renderitem-asset-origin-itemindex-now-maxtriangles-src-mq3-client-playable-item-models-ml-5070254"></a>
### renderItem

```ml
function renderItem(asset, origin, itemIndex, now, maxTriangles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `asset` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `itemIndex` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L267)

<a id="function-function-mq3-client-playable-item-models-renderitems-function-renderitems-catalog-itemvalues-now-maxitems-maxtrianglesperitem-maxtriangles-src-mq3-client-playable-item-models-ml-2035623974"></a>
### renderItems

```ml
function renderItems(catalog, itemValues, now, maxItems, maxTrianglesPerItem, maxTriangles)
```

Applies both per-item and whole-frame budgets to playable_items.Item values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `itemValues` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `maxItems` | `dynamic` | — |  |
| `maxTrianglesPerItem` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L273)

<a id="function-function-mq3-client-playable-item-models-resolvebinding-function-resolvebinding-archive-catalog-surface-surfaceindex-skin-src-mq3-client-playable-item-models-ml-1562859464"></a>
### resolveBinding

```ml
function resolveBinding(archive, catalog, surface, surfaceIndex, skin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `surface` | `dynamic` | — |  |
| `surfaceIndex` | `dynamic` | — |  |
| `skin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L127)

<a id="function-function-mq3-client-playable-item-models-surfaceshader-function-surfaceshader-surface-skin-src-mq3-client-playable-item-models-ml-1568465778"></a>
### surfaceShader

```ml
function surfaceShader(surface, skin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |
| `skin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L105)

- [mq3.client.playable_item_models.Texture](Type-mq3-client-playable-item-models-texture-2097774111.md) — struct
<a id="function-function-mq3-client-playable-item-models-texturebyname-function-texturebyname-catalog-name-src-mq3-client-playable-item-models-ml-118018094"></a>
### textureByName

```ml
function textureByName(catalog, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L115)

<a id="function-function-mq3-client-playable-item-models-transform-function-transform-origin-axis-scale-src-mq3-client-playable-item-models-ml-296271207"></a>
### transform

```ml
function transform(origin, axis, scale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L90)

- [mq3.client.playable_item_models.Transform](Type-mq3-client-playable-item-models-transform-683847984.md) — struct
- [mq3.client.playable_item_models.Triangle](Type-mq3-client-playable-item-models-triangle-556282752.md) — struct
<a id="function-function-mq3-client-playable-item-models-valid3-function-valid3-value-src-mq3-client-playable-item-models-ml-1116200977"></a>
### valid3

```ml
function valid3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L92)

<a id="function-function-mq3-client-playable-item-models-validatetransform-function-validatetransform-value-src-mq3-client-playable-item-models-ml-716572937"></a>
### validateTransform

```ml
function validateTransform(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L94)

<a id="function-function-mq3-client-playable-item-models-yawaxis-function-yawaxis-degrees-src-mq3-client-playable-item-models-ml-1952780153"></a>
### yawAxis

```ml
function yawAxis(degrees)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `degrees` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L100)
