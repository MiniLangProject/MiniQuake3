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

Evaluates playable item models `bindingForSurface` and returns `void`, `binding` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `asset` | `dynamic` | — | Record read through `asset.bindings`. |
| `surfaceIndex` | `dynamic` | — | Value used by `for each binding in asset.bindings if binding.surfaceIndex==surfaceIndex then return binding end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L410)

- [mq3.client.playable_item_models.CachedSurface](Type-mq3-client-playable-item-models-cachedsurface-1441569629.md) — struct
<a id="function-function-mq3-client-playable-item-models-cachemodeltriangles-function-cachemodeltriangles-model-src-mq3-client-playable-item-models-ml-621162801"></a>
### cacheModelTriangles

```ml
function cacheModelTriangles(model)
```

Calls `mq3.renderer.surface_md3.lerpVertexes`, `mq3.client.playable_item_models.CachedSurface` from playable item models `cacheModelTriangles`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Record read through `model.surfaces`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L336)

- [mq3.client.playable_item_models.Catalog](Type-mq3-client-playable-item-models-catalog-1063629371.md) — struct
<a id="function-function-mq3-client-playable-item-models-containsclassname-function-containsclassname-catalog-classname-src-mq3-client-playable-item-models-ml-864121746"></a>
### containsClassname

```ml
function containsClassname(catalog, classname)
```

Calls `stringEqualsIgnoreCaseAscii` from playable item models `containsClassname`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.assets`. |
| `classname` | `dynamic` | — | Value used by `for each asset in catalog.assets if stringEqualsIgnoreCaseAscii(asset.classname,classname) then return true end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L329)

<a id="constant-constant-mq3-client-playable-item-models-default-bob-amplitude-const-default-bob-amplitude-4-src-mq3-client-playable-item-models-ml-1978469185"></a>
### DEFAULT_BOB_AMPLITUDE

```ml
const DEFAULT_BOB_AMPLITUDE = 4
```

Fallback bob amplitude setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L17)

<a id="constant-constant-mq3-client-playable-item-models-default-spin-degrees-per-second-const-default-spin-degrees-per-second-100-src-mq3-client-playable-item-models-ml-1166353544"></a>
### DEFAULT_SPIN_DEGREES_PER_SECOND

```ml
const DEFAULT_SPIN_DEGREES_PER_SECOND = 100
```

Default spin angular rate, in degrees per second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L19)

<a id="function-function-mq3-client-playable-item-models-definition-function-definition-classname-src-mq3-client-playable-item-models-ml-1504508215"></a>
### definition

```ml
function definition(classname)
```

Baseq3 bg_itemlist world_model[0] paths. These are the actual MD3 pickups in pak0.pk3; aliases only cover classnames emitted by stock maps/gamecode.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — | Value used by `name=strings.toLowerAscii(classname)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L190)

- [mq3.client.playable_item_models.Definition](Type-mq3-client-playable-item-models-definition-1759347693.md) — struct
<a id="function-function-mq3-client-playable-item-models-fail-function-fail-message-src-mq3-client-playable-item-models-ml-2033179375"></a>
### fail

```ml
function fail(message)
```

Creates the playable item models error `7560` with diagnostic text `"preview item models: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"preview item models: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L175)

<a id="function-function-mq3-client-playable-item-models-find-function-find-catalog-classname-src-mq3-client-playable-item-models-ml-1971496970"></a>
### find

```ml
function find(catalog, classname)
```

Searches the playable item models collection for find, returning `void` when no entry matches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.assets`. |
| `classname` | `dynamic` | — | Value used by `for each asset in catalog.assets if stringEqualsIgnoreCaseAscii(asset.classname,classname) then return asset end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L401)

<a id="function-function-mq3-client-playable-item-models-identityaxis-function-identityaxis-src-mq3-client-playable-item-models-ml-1220977248"></a>
### identityAxis

```ml
function identityAxis()
```

Creates the three orthonormal unit axes used as the identity orientation in playable item models.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L241)

<a id="function-function-mq3-client-playable-item-models-identitytransform-function-identitytransform-src-mq3-client-playable-item-models-ml-669273956"></a>
### identityTransform

```ml
function identityTransform()
```

Creates a `mq3.client.playable_item_models.Transform` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L248)

<a id="function-function-mq3-client-playable-item-models-imagestem-function-imagestem-name-src-mq3-client-playable-item-models-ml-312363663"></a>
### imageStem

```ml
function imageStem(name)
```

Calls `std.string.toLowerAscii`, `std.string.endsWith`, `decode` and additional helpers from playable item models `imageStem`. The final path returns `name`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable item models resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L291)

<a id="function-function-mq3-client-playable-item-models-item-function-item-classname-category-path-scale-heightoffset-src-mq3-client-playable-item-models-ml-1611980642"></a>
### item

```ml
function item(classname, category, path, scale, heightOffset)
```

Creates a `mq3.client.playable_item_models.Definition` record. Assigns `classname` from `classname`, `category` from `category`, `modelPath` from `path`, `scale` from `scale`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — | Value used to initialize `Definition.classname`. |
| `category` | `dynamic` | — | Value used to initialize `Definition.category`. |
| `path` | `dynamic` | — | Value used to initialize `Definition.modelPath`. |
| `scale` | `dynamic` | — | Value used to initialize `Definition.scale`. |
| `heightOffset` | `dynamic` | — | Value used to initialize `Definition.heightOffset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L183)

<a id="function-function-mq3-client-playable-item-models-itemtransform-function-itemtransform-asset-origin-itemindex-now-src-mq3-client-playable-item-models-ml-600519947"></a>
### itemTransform

```ml
function itemTransform(asset, origin, itemIndex, now)
```

Calls `mq3.client.playable_item_models.valid3`, `mq3.compat.numeric.f32`, `mq3.compat.transcendental.sin` and additional helpers from playable item models `itemTransform`. The final path returns `Transform(placed,yawAxis(yaw),asset.scale)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `asset` | `dynamic` | — | Record read through `asset.bobAmplitude`, `asset.spinDegreesPerSecond`, `asset.heightOffset`, `asset.scale`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `itemIndex` | `dynamic` | — | Value used by `if asset==void or not valid3(origin) or itemIndex<0 or now<0 then return fail("asset, origin, item index and time are required") end if`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L464)

<a id="function-function-mq3-client-playable-item-models-loadcatalog-function-loadcatalog-archive-classnames-firsttextureslot-maxtextureslots-maxmodels-src-mq3-client-playable-item-models-ml-810287419"></a>
### loadCatalog

```ml
function loadCatalog(archive, classnames, firstTextureSlot, maxTextureSlots, maxModels)
```

Loads each unique recognized classname once. The returned texture list owns stable native slots and is shared by world pickups and first-person weapons.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `classnames` | `dynamic` | — | Value used by `if archive==void or classnames==void then return fail("archive and classnames are required") end if`. |
| `firstTextureSlot` | `dynamic` | — | First texture slot reserved for this asset collection. |
| `maxTextureSlots` | `dynamic` | — | Maximum number of texture slots available to the renderer. |
| `maxModels` | `dynamic` | — | Value used by `if maxModels<0 or maxModels>MAX_CATALOG_MODELS then return fail("model budget outside supported range") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L379)

<a id="function-function-mq3-client-playable-item-models-loaddefinition-function-loaddefinition-archive-catalog-def-src-mq3-client-playable-item-models-ml-1287684788"></a>
### loadDefinition

```ml
function loadDefinition(archive, catalog, def)
```

Calls `mq3.format.pk3.read`, `mq3.format.md3.load`, `mq3.renderer.player_skins.load` and additional helpers from playable item models `loadDefinition`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `def` | `dynamic` | — | Record read through `def.modelPath`, `def.skinPath`, `def.classname`, `def.category` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L356)

<a id="constant-constant-mq3-client-playable-item-models-max-catalog-models-const-max-catalog-models-64-src-mq3-client-playable-item-models-ml-952049731"></a>
### MAX_CATALOG_MODELS

```ml
const MAX_CATALOG_MODELS = 64
```

Capacity limit for the catalog models collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L21)

<a id="constant-constant-mq3-client-playable-item-models-max-catalog-textures-const-max-catalog-textures-96-src-mq3-client-playable-item-models-ml-1531555868"></a>
### MAX_CATALOG_TEXTURES

```ml
const MAX_CATALOG_TEXTURES = 96
```

Capacity limit for the catalog textures collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L23)

<a id="constant-constant-mq3-client-playable-item-models-pi-const-pi-3-141593-src-mq3-client-playable-item-models-ml-1565835699"></a>
### PI

```ml
const PI = 3.141593
```

Circle constant used to convert or evaluate angles in trigonometric calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L25)

<a id="function-function-mq3-client-playable-item-models-renderasset-function-renderasset-asset-value-maxtriangles-src-mq3-client-playable-item-models-ml-1776559574"></a>
### renderAsset

```ml
function renderAsset(asset, value, maxTriangles)
```

Calls `mq3.client.playable_item_models.validateTransform`, `mq3.client.playable_item_models.Triangle` from playable item models `renderAsset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `asset` | `dynamic` | — | Record read through `asset.sourceTriangles`, `asset.bindings`, `asset.classname`. |
| `value` | `dynamic` | — | Record read through `value.scale`, `value.axis`, `value.origin`. |
| `maxTriangles` | `dynamic` | — | Upper bound on emitted render triangles. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L420)

<a id="function-function-mq3-client-playable-item-models-renderitem-function-renderitem-asset-origin-itemindex-now-maxtriangles-src-mq3-client-playable-item-models-ml-5070254"></a>
### renderItem

```ml
function renderItem(asset, origin, itemIndex, now, maxTriangles)
```

Calls `mq3.client.playable_item_models.itemTransform`, `mq3.client.playable_item_models.renderAsset` from playable item models `renderItem`. The final path returns `renderAsset(asset,placed,maxTriangles)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `asset` | `dynamic` | — | Value used by `placed=itemTransform(asset,origin,itemIndex,now)`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `itemIndex` | `dynamic` | — | Value used by `placed=itemTransform(asset,origin,itemIndex,now)`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `maxTriangles` | `dynamic` | — | Upper bound on emitted render triangles. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L479)

<a id="function-function-mq3-client-playable-item-models-renderitems-function-renderitems-catalog-itemvalues-now-maxitems-maxtrianglesperitem-maxtriangles-src-mq3-client-playable-item-models-ml-2035623974"></a>
### renderItems

```ml
function renderItems(catalog, itemValues, now, maxItems, maxTrianglesPerItem, maxTriangles)
```

Applies both per-item and whole-frame budgets to playable_items.Item values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `itemValues` | `dynamic` | — | Sequence read at `itemValues[itemIndex]`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `maxItems` | `dynamic` | — | Value used by `if maxItems<0 or maxTrianglesPerItem<0 or maxTriangles<0 then return fail("negative frame budget") end if`. |
| `maxTrianglesPerItem` | `dynamic` | — | Value used by `if maxItems<0 or maxTrianglesPerItem<0 or maxTriangles<0 then return fail("negative frame budget") end if`. |
| `maxTriangles` | `dynamic` | — | Upper bound on emitted render triangles. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L491)

<a id="function-function-mq3-client-playable-item-models-resolvebinding-function-resolvebinding-archive-catalog-surface-surfaceindex-skin-src-mq3-client-playable-item-models-ml-1562859464"></a>
### resolveBinding

```ml
function resolveBinding(archive, catalog, surface, surfaceIndex, skin)
```

Updates `catalog.textures` during playable item models `resolveBinding`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `catalog` | `dynamic` | — | Mutable playable item models record/storage; this routine assigns `catalog.textures`. |
| `surface` | `dynamic` | — | Record read through `surface.name`. |
| `surfaceIndex` | `dynamic` | — | Value used by `return Binding(surfaceIndex,surface.name,shaderName,texture.imageName,texture.image,texture.slot)`. |
| `skin` | `dynamic` | — | Value used by `shaderName=surfaceShader(surface,skin)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L304)

<a id="function-function-mq3-client-playable-item-models-surfaceshader-function-surfaceshader-surface-skin-src-mq3-client-playable-item-models-ml-1568465778"></a>
### surfaceShader

```ml
function surfaceShader(surface, skin)
```

Calls `stringEqualsIgnoreCaseAscii` from playable item models `surfaceShader`. The final path returns `""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Record read through `surface.name`, `surface.shaders`. |
| `skin` | `dynamic` | — | Record read through `skin.mappings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L271)

- [mq3.client.playable_item_models.Texture](Type-mq3-client-playable-item-models-texture-2097774111.md) — struct
<a id="function-function-mq3-client-playable-item-models-texturebyname-function-texturebyname-catalog-name-src-mq3-client-playable-item-models-ml-118018094"></a>
### textureByName

```ml
function textureByName(catalog, name)
```

Calls `stringEqualsIgnoreCaseAscii` from playable item models `textureByName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.textures`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable item models resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L284)

<a id="function-function-mq3-client-playable-item-models-transform-function-transform-origin-axis-scale-src-mq3-client-playable-item-models-ml-296271207"></a>
### transform

```ml
function transform(origin, axis, scale)
```

Creates a `mq3.client.playable_item_models.Transform` record. Assigns `origin` from `origin`, `axis` from `axis`, `scale` from `scale`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Value used to initialize `Transform.origin`. |
| `axis` | `dynamic` | — | Value used to initialize `Transform.axis`. |
| `scale` | `dynamic` | — | Value used to initialize `Transform.scale`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L246)

- [mq3.client.playable_item_models.Transform](Type-mq3-client-playable-item-models-transform-683847984.md) — struct
- [mq3.client.playable_item_models.Triangle](Type-mq3-client-playable-item-models-triangle-556282752.md) — struct
<a id="function-function-mq3-client-playable-item-models-valid3-function-valid3-value-src-mq3-client-playable-item-models-ml-1116200977"></a>
### valid3

```ml
function valid3(value)
```

Computes `value!=void and len(value)==3` for playable item models `valid3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence whose length/content is inspected by `valid3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L251)

<a id="function-function-mq3-client-playable-item-models-validatetransform-function-validatetransform-value-src-mq3-client-playable-item-models-ml-716572937"></a>
### validateTransform

```ml
function validateTransform(value)
```

Calls `mq3.client.playable_item_models.valid3` from playable item models `validateTransform`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.origin`, `value.axis`, `value.scale`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L255)

<a id="function-function-mq3-client-playable-item-models-yawaxis-function-yawaxis-degrees-src-mq3-client-playable-item-models-ml-1952780153"></a>
### yawAxis

```ml
function yawAxis(degrees)
```

Calls `mq3.compat.numeric.f32`, `mq3.compat.transcendental.sin`, `mq3.compat.transcendental.cos` and additional helpers from playable item models `yawAxis`. The final path returns `[[c,s,0.0],[numeric.fneg(s),c,0.0],[0.0,0.0,1.0]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `degrees` | `dynamic` | — | Value used by `radians=numeric.f32(degrees*PI/180.0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L263)
