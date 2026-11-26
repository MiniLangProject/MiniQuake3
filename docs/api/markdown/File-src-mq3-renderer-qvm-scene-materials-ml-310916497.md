# `src/mq3/renderer/qvm_scene_materials.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.qvm_scene_materials`](Package-mq3-renderer-qvm-scene-materials-1145427999.md)

Reachable from entry: **yes**

## Imports

- `mq3/game/bg_public.ml` as `bg` → [src/mq3/game/bg_public.ml](File-src-mq3-game-bg-public-ml-2091356861.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/renderer/player_skins.ml` as `playerSkins` → [src/mq3/renderer/player_skins.ml](File-src-mq3-renderer-player-skins-ml-163797353.md)
- `mq3/renderer/qvm_scene_geometry.ml` as `sceneGeometry` → [src/mq3/renderer/qvm_scene_geometry.ml](File-src-mq3-renderer-qvm-scene-geometry-ml-51177627.md)
- `mq3/renderer/shader_parser.ml` as `shaderParser` → [src/mq3/renderer/shader_parser.ml](File-src-mq3-renderer-shader-parser-ml-2114769074.md)
- `mq3/renderer/shader_remap.ml` as `shaderRemap` → [src/mq3/renderer/shader_remap.ml](File-src-mq3-renderer-shader-remap-ml-1685814656.md)
- `mq3/shared/q_shared_header.ml` as `qSharedLimits` → [src/mq3/shared/q_shared_header.ml](File-src-mq3-shared-q-shared-header-ml-1234783930.md)
- `std/ds/hashmap.ml` as `maps` → `../MiniLangCompilerML/std/ds/hashmap.ml` — external dependency
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-qvm-scene-materials-addbeammaterial-function-addbeammaterial-output-endslot-src-mq3-renderer-qvm-scene-materials-ml-1088400160"></a>
### addBeamMaterial

```ml
function addBeamMaterial(output, endSlot)
```

Updates `output.materials`, `output.textures`, `output.nextTextureSlot` in `mq3.renderer.qvm_scene_materials.addBeamMaterial`; returns `index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Mutable record or buffer; this call updates `output.materials`, `output.textures`, `output.nextTextureSlot`. |
| `endSlot` | `dynamic` | — | Input tested by `output.nextTextureSlot>=endSlot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L269)

<a id="function-function-mq3-renderer-qvm-scene-materials-addprojectionshadowmaterial-function-addprojectionshadowmaterial-output-endslot-src-mq3-renderer-qvm-scene-materials-ml-297044232"></a>
### addProjectionShadowMaterial

```ml
function addProjectionShadowMaterial(output, endSlot)
```

Updates `output.materials`, `output.textures`, `output.nextTextureSlot` in `mq3.renderer.qvm_scene_materials.addProjectionShadowMaterial`; returns `index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Mutable record or buffer; this call updates `output.materials`, `output.textures`, `output.nextTextureSlot`. |
| `endSlot` | `dynamic` | — | Input tested by `output.nextTextureSlot>=endSlot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L285)

<a id="function-function-mq3-renderer-qvm-scene-materials-addtextures-function-addtextures-texturelist-stages-src-mq3-renderer-qvm-scene-materials-ml-1551897042"></a>
### addTextures

```ml
function addTextures(textureList, stages)
```

Computes `addTextures` from `textureList` using `mq3.renderer.qvm_scene_materials.Texture`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textureList` | `dynamic` | — | Input used by `result=textureList`. |
| `stages` | `dynamic` | — | Sequence traversed as `stage` while producing this result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L249)

<a id="function-function-mq3-renderer-qvm-scene-materials-beamstage-function-beamstage-image-slot-src-mq3-renderer-qvm-scene-materials-ml-690474333"></a>
### beamStage

```ml
function beamStage(image, slot)
```

Forwards `beamStage` to `mq3.renderer.playable_materials.RuntimeStage` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `dynamic` | — | White image used by the additive beam stage. |
| `slot` | `dynamic` | — | Native texture slot holding the white image. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L263)

- [mq3.renderer.qvm_scene_materials.Binding](Type-mq3-renderer-qvm-scene-materials-binding-852468044.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-materials-bindingmatchesregistry-function-bindingmatchesregistry-output-index-triangle-assets-kinds-src-mq3-renderer-qvm-scene-materials-ml-1155425241"></a>
### bindingMatchesRegistry

```ml
function bindingMatchesRegistry(output, index, triangle, assets, kinds)
```

Computes `bindingMatchesRegistry` from `stringEqualsIgnoreCaseAscii(output.materials[index].shaderName,strippedName(direct))` using `mq3.renderer.qvm_scene_materials.typedName`, `stringEqualsIgnoreCaseAscii`, `mq3.renderer.qvm_scene_materials.strippedName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Record providing `output.materials`. |
| `index` | `dynamic` | — | Input tested by `index<0 or index>=len(output.materials)`. |
| `triangle` | `dynamic` | — | Record providing `triangle.shaderHandle`. |
| `assets` | `dynamic` | — | Value forwarded as `assets` to `mq3.renderer.qvm_scene_materials.typedName`. |
| `kinds` | `dynamic` | — | Value forwarded as `kinds` to `mq3.renderer.qvm_scene_materials.typedName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L339)

<a id="function-function-mq3-renderer-qvm-scene-materials-bindtriangle-function-bindtriangle-output-triangle-outputindex-archive-assets-kinds-endslot-src-mq3-renderer-qvm-scene-materials-ml-1067447431"></a>
### bindTriangle

```ml
function bindTriangle(output, triangle, outputIndex, archive, assets, kinds, endSlot)
```

Updates `output.unresolvedTriangles`, `output.loadedSkins`, `output.nextTextureSlot`, `output.materials`, `output.textures` in `mq3.renderer.qvm_scene_materials.bindTriangle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Mutable record or buffer; this call updates `output.unresolvedTriangles`, `output.loadedSkins`, `output.nextTextureSlot`, `output.materials`, `output.textures`. |
| `triangle` | `dynamic` | — | Record providing `triangle.shaderName`, `triangle.shaderHandle`. |
| `outputIndex` | `dynamic` | — | Value forwarded as `outputIndex` to `mq3.renderer.qvm_scene_materials.projectionShadowEligible`. |
| `archive` | `dynamic` | — | Value forwarded as `archive` to `mq3.renderer.qvm_scene_materials.resolveShaderName`. |
| `assets` | `dynamic` | — | Value forwarded as `assets` to `mq3.renderer.qvm_scene_materials.bindingMatchesRegistry`. |
| `kinds` | `dynamic` | — | Value forwarded as `kinds` to `mq3.renderer.qvm_scene_materials.bindingMatchesRegistry`. |
| `endSlot` | `dynamic` | — | Value forwarded as `endSlot` to `mq3.renderer.qvm_scene_materials.addBeamMaterial`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L396)

<a id="function-function-mq3-renderer-qvm-scene-materials-build-function-build-archive-triangles-assets-kinds-firsttextureslot-maxtextureslots-shaderremaps-src-mq3-renderer-qvm-scene-materials-ml-652066653"></a>
### build

```ml
function build(archive, triangles, assets, kinds, firstTextureSlot, maxTextureSlots, shaderRemaps)
```

Returns `buildIndexed(archive,triangles,assets,kinds,firstTextureSlot,maxTextureSlots,shaderRemaps,scripts)` from `mq3.renderer.qvm_scene_materials.build`; earlier branches return `scripts`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_materials.buildScriptIndex`. |
| `triangles` | `dynamic` | — | Value forwarded as `triangles` to `mq3.renderer.qvm_scene_materials.buildIndexed`. |
| `assets` | `dynamic` | — | Value forwarded as `assets` to `mq3.renderer.qvm_scene_materials.buildIndexed`. |
| `kinds` | `dynamic` | — | Value forwarded as `kinds` to `mq3.renderer.qvm_scene_materials.buildIndexed`. |
| `firstTextureSlot` | `dynamic` | — | Value forwarded as `firstTextureSlot` to `mq3.renderer.qvm_scene_materials.buildIndexed`. |
| `maxTextureSlots` | `dynamic` | — | Value forwarded as `maxTextureSlots` to `mq3.renderer.qvm_scene_materials.buildIndexed`. |
| `shaderRemaps` | `dynamic` | — | Value forwarded as `shaderRemaps` to `mq3.renderer.qvm_scene_materials.buildIndexed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L453)

<a id="function-function-mq3-renderer-qvm-scene-materials-buildindexed-function-buildindexed-archive-triangles-assets-kinds-firsttextureslot-maxtextureslots-shaderremaps-scripts-src-mq3-renderer-qvm-scene-materials-ml-171463873"></a>
### buildIndexed

```ml
function buildIndexed(archive, triangles, assets, kinds, firstTextureSlot, maxTextureSlots, shaderRemaps, scripts)
```

Validates asset/script inputs and binds each triangle into a material catalog with a bounded texture-slot range.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_materials.imageCache`. |
| `triangles` | `dynamic` | — | Sequence traversed as `triangle` while producing this result. |
| `assets` | `dynamic` | — | Value forwarded as `assets` to `mq3.renderer.qvm_scene_materials.bindTriangle`. |
| `kinds` | `dynamic` | — | Value forwarded as `kinds` to `mq3.renderer.qvm_scene_materials.bindTriangle`. |
| `firstTextureSlot` | `dynamic` | — | Value used for `mq3.renderer.qvm_scene_materials.Catalog.nextTextureSlot`. |
| `maxTextureSlots` | `dynamic` | — | Input tested by `firstTextureSlot<0 or maxTextureSlots<0`. |
| `shaderRemaps` | `dynamic` | — | Value used for `mq3.renderer.qvm_scene_materials.Catalog.shaderRemaps`. |
| `scripts` | `dynamic` | — | Indexed input read at `0`, `1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L436)

<a id="constant-constant-mq3-renderer-qvm-scene-materials-builtin-beam-const-builtin-beam-mq3-beam-src-mq3-renderer-qvm-scene-materials-ml-1718575050"></a>
### BUILTIN_BEAM

```ml
const BUILTIN_BEAM = "$mq3/beam"
```

Builtin material selector used to draw beam geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L114)

<a id="constant-constant-mq3-renderer-qvm-scene-materials-builtin-projection-shadow-const-builtin-projection-shadow-mq3-projectionshadow-src-mq3-renderer-qvm-scene-materials-ml-1596514760"></a>
### BUILTIN_PROJECTION_SHADOW

```ml
const BUILTIN_PROJECTION_SHADOW = "$mq3/projectionShadow"
```

Builtin material selector used to draw projection-shadow geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L116)

<a id="function-function-mq3-renderer-qvm-scene-materials-cachedbinding-function-cachedbinding-output-triangle-src-mq3-renderer-qvm-scene-materials-ml-527984559"></a>
### cachedBinding

```ml
function cachedBinding(output, triangle)
```

Updates `output.recentBinding` in `mq3.renderer.qvm_scene_materials.cachedBinding`; returns `-2`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Mutable record or buffer; this call updates `output.recentBinding`. |
| `triangle` | `dynamic` | — | Value forwarded as `triangle` to `mq3.renderer.qvm_scene_materials.sameBinding`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L327)

<a id="function-function-mq3-renderer-qvm-scene-materials-cachedskin-function-cachedskin-cache-handle-src-mq3-renderer-qvm-scene-materials-ml-1279240924"></a>
### cachedSkin

```ml
function cachedSkin(cache, handle)
```

Returns `void` from `mq3.renderer.qvm_scene_materials.cachedSkin`; earlier branches return `item.skin`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Sequence traversed as `item` while producing this result. |
| `handle` | `dynamic` | — | Input used by `for each item in cache if item.handle==handle then return item.skin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L142)

- [mq3.renderer.qvm_scene_materials.Catalog](Type-mq3-renderer-qvm-scene-materials-catalog-1883568014.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-materials-fail-function-fail-message-src-mq3-renderer-qvm-scene-materials-ml-1562401085"></a>
### fail

```ml
function fail(message)
```

Creates error `7680` with message `"QVM scene materials: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7680,"QVM scene materials: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L120)

<a id="function-function-mq3-renderer-qvm-scene-materials-hasimage-function-hasimage-stages-src-mq3-renderer-qvm-scene-materials-ml-2014278059"></a>
### hasImage

```ml
function hasImage(stages)
```

Returns `false` from `mq3.renderer.qvm_scene_materials.hasImage`; earlier branches return `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stages` | `dynamic` | — | Sequence traversed as `stage` while producing this result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L294)

- [mq3.renderer.qvm_scene_materials.LoadedSkin](Type-mq3-renderer-qvm-scene-materials-loadedskin-432822455.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-materials-loadskin-function-loadskin-archive-assets-kinds-cache-handle-src-mq3-renderer-qvm-scene-materials-ml-1639226378"></a>
### loadSkin

```ml
function loadSkin(archive, assets, kinds, cache, handle)
```

Computes `loadSkin` from `[skin,cache+[LoadedSkin(handle,skin)]]` using `mq3.renderer.qvm_scene_materials.cachedSkin`, `mq3.renderer.qvm_scene_materials.typedName`, `mq3.renderer.player_skins.load`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.player_skins.load`. |
| `assets` | `dynamic` | — | Value forwarded as `assets` to `mq3.renderer.qvm_scene_materials.typedName`. |
| `kinds` | `dynamic` | — | Value forwarded as `kinds` to `mq3.renderer.qvm_scene_materials.typedName`. |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.qvm_scene_materials.cachedSkin`. |
| `handle` | `dynamic` | — | Value forwarded as `handle` to `mq3.renderer.qvm_scene_materials.cachedSkin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L152)

- [mq3.renderer.qvm_scene_materials.Material](Type-mq3-renderer-qvm-scene-materials-material-2048413338.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-materials-materialindex-function-materialindex-materiallist-name-src-mq3-renderer-qvm-scene-materials-ml-1030758846"></a>
### materialIndex

```ml
function materialIndex(materialList, name)
```

Returns `-1` from `mq3.renderer.qvm_scene_materials.materialIndex`; earlier branches return `-1`, `index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `materialList` | `dynamic` | — | Indexed input read at `index`. |
| `name` | `dynamic` | — | Argument 2 supplied to `stringEqualsIgnoreCaseAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L241)

<a id="function-function-mq3-renderer-qvm-scene-materials-projectionshadoweligible-function-projectionshadoweligible-output-triangle-outputindex-src-mq3-renderer-qvm-scene-materials-ml-1983088340"></a>
### projectionShadowEligible

```ml
function projectionShadowEligible(output, triangle, outputIndex)
```

R_AddMD3Surfaces only submits a projection-shadow draw surface when the source surface resolves to SS_OPAQUE and lies outside fog. Geometry expansion keeps every projected triangle directly after its source triangle, allowing the material bridge to apply the original shader policy after skin/custom shader resolution without duplicating the shader registry here.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Record providing `output.triangles`, `output.materials`. |
| `triangle` | `dynamic` | — | Record providing `triangle.fogIndex`, `triangle.entityIndex`, `triangle.surfaceIndex`. |
| `outputIndex` | `dynamic` | — | Input tested by `triangle.fogIndex>0 or outputIndex<=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L365)

<a id="function-function-mq3-renderer-qvm-scene-materials-projectionshadowstage-function-projectionshadowstage-image-slot-src-mq3-renderer-qvm-scene-materials-ml-1490556657"></a>
### projectionShadowStage

```ml
function projectionShadowStage(image, slot)
```

Forwards `projectionShadowStage` to `mq3.renderer.playable_materials.RuntimeStage` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `dynamic` | — | White image used by the alpha-blended projection-shadow stage. |
| `slot` | `dynamic` | — | Native texture slot holding the white image. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L279)

<a id="function-function-mq3-renderer-qvm-scene-materials-refresh-function-refresh-catalog-archive-triangles-assets-kinds-endtextureslot-src-mq3-renderer-qvm-scene-materials-ml-870030964"></a>
### refresh

```ml
function refresh(catalog, archive, triangles, assets, kinds, endTextureSlot)
```

Rebinds moving geometry while retaining decoded images and shader programs. Newly encountered registered shaders are appended within the original slot range.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Mutable record or buffer; this call updates `catalog.triangles`, `catalog.resolvedTriangles`, `catalog.unresolvedTriangles`. |
| `archive` | `dynamic` | — | Value forwarded as `archive` to `mq3.renderer.qvm_scene_materials.bindTriangle`. |
| `triangles` | `dynamic` | — | Sequence traversed as `triangle` while producing this result. |
| `assets` | `dynamic` | — | Value forwarded as `assets` to `mq3.renderer.qvm_scene_materials.bindTriangle`. |
| `kinds` | `dynamic` | — | Value forwarded as `kinds` to `mq3.renderer.qvm_scene_materials.bindTriangle`. |
| `endTextureSlot` | `dynamic` | — | Value forwarded as `endSlot` to `mq3.renderer.qvm_scene_materials.bindTriangle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L466)

- [mq3.renderer.qvm_scene_materials.ResolvedTriangle](Type-mq3-renderer-qvm-scene-materials-resolvedtriangle-666729175.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-materials-resolveshadername-function-resolveshadername-triangle-archive-assets-kinds-skincache-src-mq3-renderer-qvm-scene-materials-ml-330970149"></a>
### resolveShaderName

```ml
function resolveShaderName(triangle, archive, assets, kinds, skinCache)
```

Computes `resolveShaderName` from `[triangle.shaderName,skinCache]` using `mq3.renderer.qvm_scene_materials.typedName`, `mq3.renderer.qvm_scene_materials.loadSkin`, `mq3.renderer.qvm_scene_materials.skinShader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangle` | `dynamic` | — | Record providing `triangle.shaderHandle`, `triangle.customSkin`, `triangle.surfaceName`, `triangle.shaderName`. |
| `archive` | `dynamic` | — | Value forwarded as `archive` to `mq3.renderer.qvm_scene_materials.loadSkin`. |
| `assets` | `dynamic` | — | Value forwarded as `assets` to `mq3.renderer.qvm_scene_materials.typedName`. |
| `kinds` | `dynamic` | — | Value forwarded as `kinds` to `mq3.renderer.qvm_scene_materials.typedName`. |
| `skinCache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.qvm_scene_materials.loadSkin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L304)

<a id="function-function-mq3-renderer-qvm-scene-materials-samebinding-function-samebinding-binding-triangle-src-mq3-renderer-qvm-scene-materials-ml-295725233"></a>
### sameBinding

```ml
function sameBinding(binding, triangle)
```

Compares shader handle, custom skin, normalized shader name, and surface name against a triangle's material binding.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `binding` | `dynamic` | — | Record providing `binding.shaderHandle`, `binding.customSkin`, `binding.shaderName`, `binding.surfaceName`. |
| `triangle` | `dynamic` | — | Record providing `triangle.shaderName`, `triangle.surfaceName`, `triangle.shaderHandle`, `triangle.customSkin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L319)

<a id="function-function-mq3-renderer-qvm-scene-materials-skinshader-function-skinshader-skin-surfacename-src-mq3-renderer-qvm-scene-materials-ml-1003941281"></a>
### skinShader

```ml
function skinShader(skin, surfaceName)
```

Returns `""` from `mq3.renderer.qvm_scene_materials.skinShader`; earlier branches return `""`, `mapping.shaderName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `skin` | `dynamic` | — | Record providing `skin.mappings`. |
| `surfaceName` | `dynamic` | — | Argument 2 supplied to `stringEqualsIgnoreCaseAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L233)

<a id="function-function-mq3-renderer-qvm-scene-materials-storebinding-function-storebinding-output-triangle-index-src-mq3-renderer-qvm-scene-materials-ml-952343677"></a>
### storeBinding

```ml
function storeBinding(output, triangle, index)
```

Updates `output.recentBinding`, `output.bindings` in `mq3.renderer.qvm_scene_materials.storeBinding`; returns `binding`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Mutable record or buffer; this call updates `output.recentBinding`, `output.bindings`. |
| `triangle` | `dynamic` | — | Record providing `triangle.shaderHandle`, `triangle.customSkin`, `triangle.shaderName`, `triangle.surfaceName`. |
| `index` | `dynamic` | — | Value assigned to `binding.materialIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L350)

<a id="function-function-mq3-renderer-qvm-scene-materials-storeresolvedtriangle-function-storeresolvedtriangle-output-outputindex-triangle-materialindex-src-mq3-renderer-qvm-scene-materials-ml-1070786157"></a>
### storeResolvedTriangle

```ml
function storeResolvedTriangle(output, outputIndex, triangle, materialIndex)
```

The mutable catalog owns these short-lived bindings. Prepared scene batches copy source fields into their own geometry; they never retain these wrappers. Reuse them instead of allocating one wrapper per triangle per view/frame.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Mutable record or buffer; this call updates `output.triangles[outputIndex]`. |
| `outputIndex` | `dynamic` | — | Input used by `resolved=output.triangles[outputIndex]`. |
| `triangle` | `dynamic` | — | Value assigned to `resolved.triangle`. |
| `materialIndex` | `dynamic` | — | Value assigned to `resolved.materialIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L381)

<a id="function-function-mq3-renderer-qvm-scene-materials-strippedname-function-strippedname-name-src-mq3-renderer-qvm-scene-materials-ml-1269757667"></a>
### strippedName

```ml
function strippedName(name)
```

R_FindShader strips the extension before consulting shader text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L123)

<a id="function-function-mq3-renderer-qvm-scene-materials-textkey-function-textkey-value-src-mq3-renderer-qvm-scene-materials-ml-419918743"></a>
### textKey

```ml
function textKey(value)
```

Returns `value` from `mq3.renderer.qvm_scene_materials.textKey`; earlier branches return `""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input tested by `value==void`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L315)

- [mq3.renderer.qvm_scene_materials.Texture](Type-mq3-renderer-qvm-scene-materials-texture-922016754.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-materials-typedname-function-typedname-assets-kinds-handle-kinda-kindb-src-mq3-renderer-qvm-scene-materials-ml-964554193"></a>
### typedName

```ml
function typedName(assets, kinds, handle, kindA, kindB)
```

Returns `assets[handle-1]` from `mq3.renderer.qvm_scene_materials.typedName`; earlier branches return `""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `assets` | `dynamic` | — | Indexed input read at `handle-1`. |
| `kinds` | `dynamic` | — | Indexed input read at `handle-1`. |
| `handle` | `dynamic` | — | Input tested by `handle<=0 or handle>len(assets) or handle>len(kinds)`. |
| `kindA` | `dynamic` | — | Input tested by `kinds[handle-1]!=kindA and kinds[handle-1]!=kindB`. |
| `kindB` | `dynamic` | — | Input tested by `kinds[handle-1]!=kindA and kinds[handle-1]!=kindB`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L134)

<a id="function-function-mq3-renderer-qvm-scene-materials-warmregisteredplayerskins-function-warmregisteredplayerskins-catalog-archive-assets-kinds-src-mq3-renderer-qvm-scene-materials-ml-310023707"></a>
### warmRegisteredPlayerSkins

```ml
function warmRegisteredPlayerSkins(catalog, archive, assets, kinds)
```

Skin registration in Quake resolves its mapped shaders before the first visible frame. Decode only skins already registered by this match; retain their images in the same bounded, archive-scoped cache used by bindTriangle. No runtime material or texture slot is allocated by this warmup.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Mutable record or buffer; this call updates `catalog.loadedSkins`. |
| `archive` | `dynamic` | — | Value forwarded as `archive` to `mq3.renderer.qvm_scene_materials.loadSkin`. |
| `assets` | `dynamic` | — | Value forwarded as `assets` to `mq3.renderer.qvm_scene_materials.typedName`. |
| `kinds` | `dynamic` | — | Value forwarded as `kinds` to `mq3.renderer.qvm_scene_materials.typedName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L167)

<a id="function-function-mq3-renderer-qvm-scene-materials-warmservermodelimages-function-warmservermodelimages-catalog-archive-assets-kinds-modelassets-configstrings-src-mq3-renderer-qvm-scene-materials-ml-920057209"></a>
### warmServerModelImages

```ml
function warmServerModelImages(catalog, archive, assets, kinds, modelAssets, configstrings)
```

CG_RegisterGraphics registers the server's CS_MODELS before play. Decode their MD3 stage images at this point, including alternate LOD surfaces. Texture slots and sampler settings still belong to the first actual binding.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.scriptIndex`, `catalog.imageCache`. |
| `archive` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_materials.runtimeStagesCached`. |
| `assets` | `dynamic` | — | Indexed input read at `handle-1`. |
| `kinds` | `dynamic` | — | Indexed input read at `handle-1`. |
| `modelAssets` | `dynamic` | — | Indexed input read at `handle-1`. |
| `configstrings` | `dynamic` | — | Indexed input read at `slot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L196)

<a id="function-function-mq3-renderer-qvm-scene-materials-whiteimage-function-whiteimage-src-mq3-renderer-qvm-scene-materials-ml-1494697098"></a>
### whiteImage

```ml
function whiteImage()
```

Calls `mq3.renderer.playable_materials.Image` with `(1,1,bytes(4,255))` and returns its result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L259)
