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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `endSlot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L134)

<a id="function-function-mq3-renderer-qvm-scene-materials-addprojectionshadowmaterial-function-addprojectionshadowmaterial-output-endslot-src-mq3-renderer-qvm-scene-materials-ml-297044232"></a>
### addProjectionShadowMaterial

```ml
function addProjectionShadowMaterial(output, endSlot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `endSlot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L144)

<a id="function-function-mq3-renderer-qvm-scene-materials-addtextures-function-addtextures-texturelist-stages-src-mq3-renderer-qvm-scene-materials-ml-1551897042"></a>
### addTextures

```ml
function addTextures(textureList, stages)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textureList` | `dynamic` | — |  |
| `stages` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L121)

<a id="function-function-mq3-renderer-qvm-scene-materials-beamstage-function-beamstage-image-slot-src-mq3-renderer-qvm-scene-materials-ml-690474333"></a>
### beamStage

```ml
function beamStage(image, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L131)

- [mq3.renderer.qvm_scene_materials.Binding](Type-mq3-renderer-qvm-scene-materials-binding-852468044.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-materials-bindingmatchesregistry-function-bindingmatchesregistry-output-index-triangle-assets-kinds-src-mq3-renderer-qvm-scene-materials-ml-1155425241"></a>
### bindingMatchesRegistry

```ml
function bindingMatchesRegistry(output, index, triangle, assets, kinds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `triangle` | `dynamic` | — |  |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L176)

<a id="function-function-mq3-renderer-qvm-scene-materials-bindtriangle-function-bindtriangle-output-triangle-outputindex-archive-assets-kinds-endslot-src-mq3-renderer-qvm-scene-materials-ml-1067447431"></a>
### bindTriangle

```ml
function bindTriangle(output, triangle, outputIndex, archive, assets, kinds, endSlot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `triangle` | `dynamic` | — |  |
| `outputIndex` | `dynamic` | — |  |
| `archive` | `dynamic` | — |  |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `endSlot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L214)

<a id="function-function-mq3-renderer-qvm-scene-materials-build-function-build-archive-triangles-assets-kinds-firsttextureslot-maxtextureslots-shaderremaps-src-mq3-renderer-qvm-scene-materials-ml-652066653"></a>
### build

```ml
function build(archive, triangles, assets, kinds, firstTextureSlot, maxTextureSlots, shaderRemaps)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `triangles` | `dynamic` | — |  |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `firstTextureSlot` | `dynamic` | — |  |
| `maxTextureSlots` | `dynamic` | — |  |
| `shaderRemaps` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L254)

<a id="function-function-mq3-renderer-qvm-scene-materials-buildindexed-function-buildindexed-archive-triangles-assets-kinds-firsttextureslot-maxtextureslots-shaderremaps-scripts-src-mq3-renderer-qvm-scene-materials-ml-171463873"></a>
### buildIndexed

```ml
function buildIndexed(archive, triangles, assets, kinds, firstTextureSlot, maxTextureSlots, shaderRemaps, scripts)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `triangles` | `dynamic` | — |  |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `firstTextureSlot` | `dynamic` | — |  |
| `maxTextureSlots` | `dynamic` | — |  |
| `shaderRemaps` | `dynamic` | — |  |
| `scripts` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L245)

<a id="constant-constant-mq3-renderer-qvm-scene-materials-builtin-beam-const-builtin-beam-mq3-beam-src-mq3-renderer-qvm-scene-materials-ml-1718575050"></a>
### BUILTIN_BEAM

```ml
const BUILTIN_BEAM = "$mq3/beam"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L24)

<a id="constant-constant-mq3-renderer-qvm-scene-materials-builtin-projection-shadow-const-builtin-projection-shadow-mq3-projectionshadow-src-mq3-renderer-qvm-scene-materials-ml-1596514760"></a>
### BUILTIN_PROJECTION_SHADOW

```ml
const BUILTIN_PROJECTION_SHADOW = "$mq3/projectionShadow"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L25)

<a id="function-function-mq3-renderer-qvm-scene-materials-cachedbinding-function-cachedbinding-output-triangle-src-mq3-renderer-qvm-scene-materials-ml-527984559"></a>
### cachedBinding

```ml
function cachedBinding(output, triangle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `triangle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L170)

<a id="function-function-mq3-renderer-qvm-scene-materials-cachedskin-function-cachedskin-cache-handle-src-mq3-renderer-qvm-scene-materials-ml-1279240924"></a>
### cachedSkin

```ml
function cachedSkin(cache, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L39)

- [mq3.renderer.qvm_scene_materials.Catalog](Type-mq3-renderer-qvm-scene-materials-catalog-1883568014.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-materials-fail-function-fail-message-src-mq3-renderer-qvm-scene-materials-ml-1562401085"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L27)

<a id="function-function-mq3-renderer-qvm-scene-materials-hasimage-function-hasimage-stages-src-mq3-renderer-qvm-scene-materials-ml-2014278059"></a>
### hasImage

```ml
function hasImage(stages)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stages` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L151)

- [mq3.renderer.qvm_scene_materials.LoadedSkin](Type-mq3-renderer-qvm-scene-materials-loadedskin-432822455.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-materials-loadskin-function-loadskin-archive-assets-kinds-cache-handle-src-mq3-renderer-qvm-scene-materials-ml-1639226378"></a>
### loadSkin

```ml
function loadSkin(archive, assets, kinds, cache, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L43)

- [mq3.renderer.qvm_scene_materials.Material](Type-mq3-renderer-qvm-scene-materials-material-2048413338.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-materials-materialindex-function-materialindex-materiallist-name-src-mq3-renderer-qvm-scene-materials-ml-1030758846"></a>
### materialIndex

```ml
function materialIndex(materialList, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `materialList` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L116)

<a id="function-function-mq3-renderer-qvm-scene-materials-projectionshadoweligible-function-projectionshadoweligible-output-triangle-outputindex-src-mq3-renderer-qvm-scene-materials-ml-1983088340"></a>
### projectionShadowEligible

```ml
function projectionShadowEligible(output, triangle, outputIndex)
```

R_AddMD3Surfaces only submits a projection-shadow draw surface when the source surface resolves to SS_OPAQUE and lies outside fog. Geometry expansion keeps every projected triangle directly after its source triangle, allowing the material bridge to apply the original shader policy after skin/custom shader resolution without duplicating the shader registry here.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `triangle` | `dynamic` | — |  |
| `outputIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L195)

<a id="function-function-mq3-renderer-qvm-scene-materials-projectionshadowstage-function-projectionshadowstage-image-slot-src-mq3-renderer-qvm-scene-materials-ml-1490556657"></a>
### projectionShadowStage

```ml
function projectionShadowStage(image, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L141)

<a id="function-function-mq3-renderer-qvm-scene-materials-refresh-function-refresh-catalog-archive-triangles-assets-kinds-endtextureslot-src-mq3-renderer-qvm-scene-materials-ml-870030964"></a>
### refresh

```ml
function refresh(catalog, archive, triangles, assets, kinds, endTextureSlot)
```

Rebinds moving geometry while retaining decoded images and shader programs. Newly encountered registered shaders are appended within the original slot range.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `archive` | `dynamic` | — |  |
| `triangles` | `dynamic` | — |  |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `endTextureSlot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L261)

- [mq3.renderer.qvm_scene_materials.ResolvedTriangle](Type-mq3-renderer-qvm-scene-materials-resolvedtriangle-666729175.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-materials-resolveshadername-function-resolveshadername-triangle-archive-assets-kinds-skincache-src-mq3-renderer-qvm-scene-materials-ml-330970149"></a>
### resolveShaderName

```ml
function resolveShaderName(triangle, archive, assets, kinds, skinCache)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangle` | `dynamic` | — |  |
| `archive` | `dynamic` | — |  |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `skinCache` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L155)

<a id="function-function-mq3-renderer-qvm-scene-materials-samebinding-function-samebinding-binding-triangle-src-mq3-renderer-qvm-scene-materials-ml-295725233"></a>
### sameBinding

```ml
function sameBinding(binding, triangle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `binding` | `dynamic` | — |  |
| `triangle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L165)

<a id="function-function-mq3-renderer-qvm-scene-materials-skinshader-function-skinshader-skin-surfacename-src-mq3-renderer-qvm-scene-materials-ml-1003941281"></a>
### skinShader

```ml
function skinShader(skin, surfaceName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `skin` | `dynamic` | — |  |
| `surfaceName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L111)

<a id="function-function-mq3-renderer-qvm-scene-materials-storebinding-function-storebinding-output-triangle-index-src-mq3-renderer-qvm-scene-materials-ml-952343677"></a>
### storeBinding

```ml
function storeBinding(output, triangle, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `triangle` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L183)

<a id="function-function-mq3-renderer-qvm-scene-materials-storeresolvedtriangle-function-storeresolvedtriangle-output-outputindex-triangle-materialindex-src-mq3-renderer-qvm-scene-materials-ml-1070786157"></a>
### storeResolvedTriangle

```ml
function storeResolvedTriangle(output, outputIndex, triangle, materialIndex)
```

The mutable catalog owns these short-lived bindings. Prepared scene batches copy source fields into their own geometry; they never retain these wrappers. Reuse them instead of allocating one wrapper per triangle per view/frame.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `outputIndex` | `dynamic` | — |  |
| `triangle` | `dynamic` | — |  |
| `materialIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L207)

<a id="function-function-mq3-renderer-qvm-scene-materials-strippedname-function-strippedname-name-src-mq3-renderer-qvm-scene-materials-ml-1269757667"></a>
### strippedName

```ml
function strippedName(name)
```

R_FindShader strips the extension before consulting shader text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L29)

<a id="function-function-mq3-renderer-qvm-scene-materials-textkey-function-textkey-value-src-mq3-renderer-qvm-scene-materials-ml-419918743"></a>
### textKey

```ml
function textKey(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L164)

- [mq3.renderer.qvm_scene_materials.Texture](Type-mq3-renderer-qvm-scene-materials-texture-922016754.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-materials-typedname-function-typedname-assets-kinds-handle-kinda-kindb-src-mq3-renderer-qvm-scene-materials-ml-964554193"></a>
### typedName

```ml
function typedName(assets, kinds, handle, kindA, kindB)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `kindA` | `dynamic` | — |  |
| `kindB` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L34)

<a id="function-function-mq3-renderer-qvm-scene-materials-warmregisteredplayerskins-function-warmregisteredplayerskins-catalog-archive-assets-kinds-src-mq3-renderer-qvm-scene-materials-ml-310023707"></a>
### warmRegisteredPlayerSkins

```ml
function warmRegisteredPlayerSkins(catalog, archive, assets, kinds)
```

Skin registration in Quake resolves its mapped shaders before the first visible frame. Decode only skins already registered by this match; retain their images in the same bounded, archive-scoped cache used by bindTriangle. No runtime material or texture slot is allocated by this warmup.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `archive` | `dynamic` | — |  |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L54)

<a id="function-function-mq3-renderer-qvm-scene-materials-warmservermodelimages-function-warmservermodelimages-catalog-archive-assets-kinds-modelassets-configstrings-src-mq3-renderer-qvm-scene-materials-ml-920057209"></a>
### warmServerModelImages

```ml
function warmServerModelImages(catalog, archive, assets, kinds, modelAssets, configstrings)
```

CG_RegisterGraphics registers the server's CS_MODELS before play. Decode their MD3 stage images at this point, including alternate LOD surfaces. Texture slots and sampler settings still belong to the first actual binding.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `archive` | `dynamic` | — |  |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `configstrings` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L77)

<a id="function-function-mq3-renderer-qvm-scene-materials-whiteimage-function-whiteimage-src-mq3-renderer-qvm-scene-materials-ml-1494697098"></a>
### whiteImage

```ml
function whiteImage()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L130)
