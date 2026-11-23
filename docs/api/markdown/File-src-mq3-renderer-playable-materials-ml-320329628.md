# `src/mq3/renderer/playable_materials.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.playable_materials`](Package-mq3-renderer-playable-materials-638190566.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/platform/playable_jpeg.ml` as `jpeg` → [src/mq3/platform/playable_jpeg.ml](File-src-mq3-platform-playable-jpeg-ml-1311517486.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/shader_index.ml` as `shaderIndex` → [src/mq3/renderer/shader_index.ml](File-src-mq3-renderer-shader-index-ml-492021135.md)
- `mq3/renderer/shader_parser.ml` as `shaderParser` → [src/mq3/renderer/shader_parser.ml](File-src-mq3-renderer-shader-parser-ml-2114769074.md)
- `mq3/renderer/tga.ml` as `tga` → [src/mq3/renderer/tga.ml](File-src-mq3-renderer-tga-ml-193567265.md)
- `mq3/shared/parser.ml` as `tokenParser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)
- `std/ds/hashmap.ml` as `maps` → `../MiniLangCompilerML/std/ds/hashmap.ml` — external dependency
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency
- `std/string_builder.ml` as `stringBuilder` → `../MiniLangCompilerML/std/string_builder.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-renderer-playable-materials-alpha-test-ge128-const-alpha-test-ge128-3-src-mq3-renderer-playable-materials-ml-781647870"></a>
### ALPHA_TEST_GE128

```ml
const ALPHA_TEST_GE128 = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L36)

<a id="constant-constant-mq3-renderer-playable-materials-alpha-test-gt0-const-alpha-test-gt0-1-src-mq3-renderer-playable-materials-ml-1738260136"></a>
### ALPHA_TEST_GT0

```ml
const ALPHA_TEST_GT0 = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L34)

<a id="constant-constant-mq3-renderer-playable-materials-alpha-test-lt128-const-alpha-test-lt128-2-src-mq3-renderer-playable-materials-ml-1409525851"></a>
### ALPHA_TEST_LT128

```ml
const ALPHA_TEST_LT128 = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L35)

<a id="constant-constant-mq3-renderer-playable-materials-alpha-test-none-const-alpha-test-none-0-src-mq3-renderer-playable-materials-ml-807383069"></a>
### ALPHA_TEST_NONE

```ml
const ALPHA_TEST_NONE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L33)

<a id="constant-constant-mq3-renderer-playable-materials-base-texture-first-slot-const-base-texture-first-slot-64-src-mq3-renderer-playable-materials-ml-841813383"></a>
### BASE_TEXTURE_FIRST_SLOT

```ml
const BASE_TEXTURE_FIRST_SLOT = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L20)

<a id="constant-constant-mq3-renderer-playable-materials-base-texture-slot-count-const-base-texture-slot-count-256-src-mq3-renderer-playable-materials-ml-429894598"></a>
### BASE_TEXTURE_SLOT_COUNT

```ml
const BASE_TEXTURE_SLOT_COUNT = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L21)

<a id="constant-constant-mq3-renderer-playable-materials-blend-add-const-blend-add-2-src-mq3-renderer-playable-materials-ml-702441923"></a>
### BLEND_ADD

```ml
const BLEND_ADD = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L27)

<a id="constant-constant-mq3-renderer-playable-materials-blend-alpha-const-blend-alpha-1-src-mq3-renderer-playable-materials-ml-1954974232"></a>
### BLEND_ALPHA

```ml
const BLEND_ALPHA = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L26)

<a id="constant-constant-mq3-renderer-playable-materials-blend-dst-color-one-minus-dst-alpha-const-blend-dst-color-one-minus-dst-alpha-4-src-mq3-renderer-playable-materials-ml-953270237"></a>
### BLEND_DST_COLOR_ONE_MINUS_DST_ALPHA

```ml
const BLEND_DST_COLOR_ONE_MINUS_DST_ALPHA = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L29)

<a id="constant-constant-mq3-renderer-playable-materials-blend-filter-const-blend-filter-3-src-mq3-renderer-playable-materials-ml-230384704"></a>
### BLEND_FILTER

```ml
const BLEND_FILTER = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L28)

<a id="constant-constant-mq3-renderer-playable-materials-blend-gl-state-const-blend-gl-state-256-src-mq3-renderer-playable-materials-ml-1670682390"></a>
### BLEND_GL_STATE

```ml
const BLEND_GL_STATE = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L32)

<a id="constant-constant-mq3-renderer-playable-materials-blend-mark-const-blend-mark-6-src-mq3-renderer-playable-materials-ml-1187377611"></a>
### BLEND_MARK

```ml
const BLEND_MARK = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L30)

<a id="constant-constant-mq3-renderer-playable-materials-blend-opaque-const-blend-opaque-0-src-mq3-renderer-playable-materials-ml-1964183937"></a>
### BLEND_OPAQUE

```ml
const BLEND_OPAQUE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L25)

<a id="constant-constant-mq3-renderer-playable-materials-blend-premultiplied-alpha-const-blend-premultiplied-alpha-7-src-mq3-renderer-playable-materials-ml-1004335126"></a>
### BLEND_PREMULTIPLIED_ALPHA

```ml
const BLEND_PREMULTIPLIED_ALPHA = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L31)

<a id="function-function-mq3-renderer-playable-materials-buildscriptindex-function-buildscriptindex-archive-src-mq3-renderer-playable-materials-ml-697053838"></a>
### buildScriptIndex

```ml
function buildScriptIndex(archive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L94)

<a id="function-function-mq3-renderer-playable-materials-cacheimage-function-cacheimage-cache-name-image-src-mq3-renderer-playable-materials-ml-900258650"></a>
### cacheImage

```ml
function cacheImage(cache, name, image)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `image` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L46)

<a id="function-function-mq3-renderer-playable-materials-candidates-function-candidates-name-src-mq3-renderer-playable-materials-ml-1671793603"></a>
### candidates

```ml
function candidates(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L86)

- [mq3.renderer.playable_materials.Catalog](Type-mq3-renderer-playable-materials-catalog-111238727.md) — struct
<a id="function-function-mq3-renderer-playable-materials-colorbyte-function-colorbyte-value-src-mq3-renderer-playable-materials-ml-261469847"></a>
### colorByte

```ml
function colorByte(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L346)

<a id="function-function-mq3-renderer-playable-materials-containsindex-function-containsindex-materials-index-src-mq3-renderer-playable-materials-ml-342281844"></a>
### containsIndex

```ml
function containsIndex(materials, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `materials` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L172)

<a id="function-function-mq3-renderer-playable-materials-decodeasset-function-decodeasset-name-data-src-mq3-renderer-playable-materials-ml-53274047"></a>
### decodeAsset

```ml
function decodeAsset(name, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L139)

<a id="function-function-mq3-renderer-playable-materials-directruntimestage-function-directruntimestage-archive-name-nextslot-endslot-src-mq3-renderer-playable-materials-ml-1133168049"></a>
### directRuntimeStage

```ml
function directRuntimeStage(archive, name, nextSlot, endSlot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `nextSlot` | `dynamic` | — |  |
| `endSlot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L259)

<a id="function-function-mq3-renderer-playable-materials-directruntimestagecached-function-directruntimestagecached-archive-name-nextslot-endslot-cache-src-mq3-renderer-playable-materials-ml-2075684481"></a>
### directRuntimeStageCached

```ml
function directRuntimeStageCached(archive, name, nextSlot, endSlot, cache)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `nextSlot` | `dynamic` | — |  |
| `endSlot` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L254)

<a id="function-function-mq3-renderer-playable-materials-endsignorecase-function-endsignorecase-value-suffix-src-mq3-renderer-playable-materials-ml-605590476"></a>
### endsIgnoreCase

```ml
function endsIgnoreCase(value, suffix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `suffix` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L82)

<a id="function-function-mq3-renderer-playable-materials-entitymilliseconds-function-entitymilliseconds-nowmilliseconds-shadertime-src-mq3-renderer-playable-materials-ml-297837354"></a>
### entityMilliseconds

```ml
function entityMilliseconds(nowMilliseconds, shaderTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `nowMilliseconds` | `dynamic` | — |  |
| `shaderTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L309)

<a id="function-function-mq3-renderer-playable-materials-environmentuv-function-environmentuv-position-normal-vieworigin-src-mq3-renderer-playable-materials-ml-771363215"></a>
### environmentUV

```ml
function environmentUV(position, normal, viewOrigin)
```

RB_CalcEnvironmentTexCoords: reflect the normalized eye vector around the BSP vertex normal and map reflected Y/Z into texture space.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L461)

<a id="function-function-mq3-renderer-playable-materials-fail-function-fail-message-src-mq3-renderer-playable-materials-ml-1900783979"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L65)

<a id="function-function-mq3-renderer-playable-materials-floornumber-function-floornumber-value-src-mq3-renderer-playable-materials-ml-1695661163"></a>
### floorNumber

```ml
function floorNumber(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L293)

<a id="function-function-mq3-renderer-playable-materials-fogadjustment-function-fogadjustment-firststage-stage-src-mq3-renderer-playable-materials-ml-1404336916"></a>
### fogAdjustment

```ml
function fogAdjustment(firstStage, stage)
```

FinishShader assigns fog modulation only when the shader's first stage is blended. Additive and inverse-source-color stages fade RGB, strict alpha stages fade alpha, and premultiplied-alpha stages fade RGBA. The final fog pass can then converge on the fog colour without glowing or opaque blended surfaces leaking through it.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `firstStage` | `dynamic` | — |  |
| `stage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L354)

<a id="function-function-mq3-renderer-playable-materials-frameindex-function-frameindex-stage-nowmilliseconds-src-mq3-renderer-playable-materials-ml-141691288"></a>
### frameIndex

```ml
function frameIndex(stage, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L294)

<a id="function-function-mq3-renderer-playable-materials-frameindexentity-function-frameindexentity-stage-nowmilliseconds-shadertime-src-mq3-renderer-playable-materials-ml-77414116"></a>
### frameIndexEntity

```ml
function frameIndexEntity(stage, nowMilliseconds, shaderTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `shaderTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L310)

- [mq3.renderer.playable_materials.Image](Type-mq3-renderer-playable-materials-image-702988069.md) — struct
<a id="function-function-mq3-renderer-playable-materials-imagecache-function-imagecache-archive-src-mq3-renderer-playable-materials-ml-1700693986"></a>
### imageCache

```ml
function imageCache(archive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L45)

- [mq3.renderer.playable_materials.ImageCache](Type-mq3-renderer-playable-materials-imagecache-1412327461.md) — struct
<a id="function-function-mq3-renderer-playable-materials-isvideostage-function-isvideostage-stage-src-mq3-renderer-playable-materials-ml-895741702"></a>
### isVideoStage

```ml
function isVideoStage(stage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L248)

<a id="function-function-mq3-renderer-playable-materials-lightmapruntimestage-function-lightmapruntimestage-stage-src-mq3-renderer-playable-materials-ml-1517081246"></a>
### lightmapRuntimeStage

```ml
function lightmapRuntimeStage(stage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L250)

<a id="function-function-mq3-renderer-playable-materials-load-function-load-archive-map-maxmaterials-firstslot-src-mq3-renderer-playable-materials-ml-2086909302"></a>
### load

```ml
function load(archive, map, maxMaterials, firstSlot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `maxMaterials` | `dynamic` | — |  |
| `firstSlot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L494)

<a id="function-function-mq3-renderer-playable-materials-loadimage-function-loadimage-archive-name-src-mq3-renderer-playable-materials-ml-39310699"></a>
### loadImage

```ml
function loadImage(archive, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L170)

<a id="function-function-mq3-renderer-playable-materials-loadimagecached-function-loadimagecached-archive-name-cache-src-mq3-renderer-playable-materials-ml-155959691"></a>
### loadImageCached

```ml
function loadImageCached(archive, name, cache)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L151)

<a id="function-function-mq3-renderer-playable-materials-loadindexed-function-loadindexed-archive-map-maxmaterials-firstslot-index-scriptcount-src-mq3-renderer-playable-materials-ml-345043106"></a>
### loadIndexed

```ml
function loadIndexed(archive, map, maxMaterials, firstSlot, index, scriptCount)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `maxMaterials` | `dynamic` | — |  |
| `firstSlot` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `scriptCount` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L470)

<a id="function-function-mq3-renderer-playable-materials-loadruntimestage-function-loadruntimestage-archive-stage-nextslot-endslot-src-mq3-renderer-playable-materials-ml-1246094182"></a>
### loadRuntimeStage

```ml
function loadRuntimeStage(archive, stage, nextSlot, endSlot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `stage` | `dynamic` | — |  |
| `nextSlot` | `dynamic` | — |  |
| `endSlot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L241)

<a id="function-function-mq3-renderer-playable-materials-loadruntimestagecached-function-loadruntimestagecached-archive-stage-nextslot-endslot-cache-src-mq3-renderer-playable-materials-ml-1860572392"></a>
### loadRuntimeStageCached

```ml
function loadRuntimeStageCached(archive, stage, nextSlot, endSlot, cache)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `stage` | `dynamic` | — |  |
| `nextSlot` | `dynamic` | — |  |
| `endSlot` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L222)

<a id="function-function-mq3-renderer-playable-materials-mappedimagename-function-mappedimagename-index-name-src-mq3-renderer-playable-materials-ml-525897581"></a>
### mappedImageName

```ml
function mappedImageName(index, name)
```

Select the first actual image of a shader stage. This intentionally ignores blend animation and tcMod for the first playable slice, but understands both map/clampMap and the first frame of animMap without requiring a full shader parse.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L113)

- [mq3.renderer.playable_materials.Material](Type-mq3-renderer-playable-materials-material-621328033.md) — struct
<a id="constant-constant-mq3-renderer-playable-materials-max-animation-frames-const-max-animation-frames-8-src-mq3-renderer-playable-materials-ml-1693500259"></a>
### MAX_ANIMATION_FRAMES

```ml
const MAX_ANIMATION_FRAMES = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L23)

<a id="constant-constant-mq3-renderer-playable-materials-max-cached-images-const-max-cached-images-2048-src-mq3-renderer-playable-materials-ml-1494801835"></a>
### MAX_CACHED_IMAGES

```ml
const MAX_CACHED_IMAGES = 2048
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L24)

<a id="constant-constant-mq3-renderer-playable-materials-max-runtime-stages-const-max-runtime-stages-8-src-mq3-renderer-playable-materials-ml-1733655469"></a>
### MAX_RUNTIME_STAGES

```ml
const MAX_RUNTIME_STAGES = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L22)

<a id="function-function-mq3-renderer-playable-materials-modulateforfog-function-modulateforfog-color-density-adjustment-src-mq3-renderer-playable-materials-ml-1684029290"></a>
### modulateForFog

```ml
function modulateForFog(color, density, adjustment)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `color` | `dynamic` | — |  |
| `density` | `dynamic` | — |  |
| `adjustment` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L361)

<a id="function-function-mq3-renderer-playable-materials-resolvedshadersort-function-resolvedshadersort-shader-src-mq3-renderer-playable-materials-ml-1531405165"></a>
### resolvedShaderSort

```ml
function resolvedShaderSort(shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L261)

- [mq3.renderer.playable_materials.RuntimeStage](Type-mq3-renderer-playable-materials-runtimestage-1687637930.md) — struct
<a id="function-function-mq3-renderer-playable-materials-runtimestages-function-runtimestages-archive-index-name-nextslot-endslot-src-mq3-renderer-playable-materials-ml-815457943"></a>
### runtimeStages

```ml
function runtimeStages(archive, index, name, nextSlot, endSlot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `nextSlot` | `dynamic` | — |  |
| `endSlot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L291)

<a id="function-function-mq3-renderer-playable-materials-runtimestagescached-function-runtimestagescached-archive-index-name-nextslot-endslot-cache-src-mq3-renderer-playable-materials-ml-1620140435"></a>
### runtimeStagesCached

```ml
function runtimeStagesCached(archive, index, name, nextSlot, endSlot, cache)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `nextSlot` | `dynamic` | — |  |
| `endSlot` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L269)

<a id="function-function-mq3-renderer-playable-materials-seedimagecachefromcatalog-function-seedimagecachefromcatalog-cache-catalog-src-mq3-renderer-playable-materials-ml-1224769511"></a>
### seedImageCacheFromCatalog

```ml
function seedImageCacheFromCatalog(cache, catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L52)

<a id="constant-constant-mq3-renderer-playable-materials-shader-name-bytes-const-shader-name-bytes-64-src-mq3-renderer-playable-materials-ml-1842096759"></a>
### SHADER_NAME_BYTES

```ml
const SHADER_NAME_BYTES = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L19)

<a id="constant-constant-mq3-renderer-playable-materials-shader-stride-const-shader-stride-72-src-mq3-renderer-playable-materials-ml-2139626030"></a>
### SHADER_STRIDE

```ml
const SHADER_STRIDE = 72
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L18)

<a id="function-function-mq3-renderer-playable-materials-shadermilliseconds-inline-function-shadermilliseconds-nowmilliseconds-entityshadertime-timeoffset-clamptime-returns-float-src-mq3-renderer-playable-materials-ml-1408693057"></a>
### shaderMilliseconds

```ml
inline function shaderMilliseconds(nowMilliseconds, entityShaderTime, timeOffset, clampTime) returns float
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `nowMilliseconds` | `dynamic` | — |  |
| `entityShaderTime` | `dynamic` | — |  |
| `timeOffset` | `dynamic` | — |  |
| `clampTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L308)

<a id="function-function-mq3-renderer-playable-materials-shadername-function-shadername-map-index-src-mq3-renderer-playable-materials-ml-1273478062"></a>
### shaderName

```ml
function shaderName(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L68)

<a id="function-function-mq3-renderer-playable-materials-shaderseconds-function-shaderseconds-nowmilliseconds-entityshadertime-timeoffset-clamptime-returns-float-src-mq3-renderer-playable-materials-ml-1060998412"></a>
### shaderSeconds

```ml
function shaderSeconds(nowMilliseconds, entityShaderTime, timeOffset, clampTime) returns float
```

tr_backend.c subtracts refEntity_t.shaderTime before every shader-time consumer runs. Keep that conversion in one place so animated images, waves, deforms and tcMods all observe the same per-entity clock.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `nowMilliseconds` | `dynamic` | — |  |
| `entityShaderTime` | `dynamic` | — |  |
| `timeOffset` | `dynamic` | — |  |
| `clampTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L303)

<a id="function-function-mq3-renderer-playable-materials-shadersurfaceflags-function-shadersurfaceflags-map-index-src-mq3-renderer-playable-materials-ml-1299998890"></a>
### shaderSurfaceFlags

```ml
function shaderSurfaceFlags(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L76)

<a id="function-function-mq3-renderer-playable-materials-slotat-function-slotat-stage-nowmilliseconds-src-mq3-renderer-playable-materials-ml-744687280"></a>
### slotAt

```ml
function slotAt(stage, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L299)

<a id="function-function-mq3-renderer-playable-materials-slotatentity-function-slotatentity-stage-nowmilliseconds-shadertime-src-mq3-renderer-playable-materials-ml-1088725080"></a>
### slotAtEntity

```ml
function slotAtEntity(stage, nowMilliseconds, shaderTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `shaderTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L311)

<a id="function-function-mq3-renderer-playable-materials-slotfor-function-slotfor-catalog-textureindex-src-mq3-renderer-playable-materials-ml-1566447832"></a>
### slotFor

```ml
function slotFor(catalog, textureIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `textureIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L499)

<a id="function-function-mq3-renderer-playable-materials-stagealphatest-function-stagealphatest-stage-src-mq3-renderer-playable-materials-ml-1967274078"></a>
### stageAlphaTest

```ml
function stageAlphaTest(stage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L195)

<a id="function-function-mq3-renderer-playable-materials-stageblend-function-stageblend-stage-src-mq3-renderer-playable-materials-ml-631919634"></a>
### stageBlend

```ml
function stageBlend(stage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L177)

<a id="function-function-mq3-renderer-playable-materials-stageclamp-function-stageclamp-stage-src-mq3-renderer-playable-materials-ml-1441599178"></a>
### stageClamp

```ml
function stageClamp(stage)
```

RE_UploadCinematic configures scratch images with GL_CLAMP too.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L193)

<a id="function-function-mq3-renderer-playable-materials-stagecolor-function-stagecolor-stage-vertexcolor-nowmilliseconds-src-mq3-renderer-playable-materials-ml-2120936299"></a>
### stageColor

```ml
function stageColor(stage, vertexColor, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `vertexColor` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L398)

<a id="function-function-mq3-renderer-playable-materials-stagecolorat-function-stagecolorat-stage-vertexcolor-position-vieworigin-nowmilliseconds-src-mq3-renderer-playable-materials-ml-1539928191"></a>
### stageColorAt

```ml
function stageColorAt(stage, vertexColor, position, viewOrigin, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `vertexColor` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L413)

<a id="function-function-mq3-renderer-playable-materials-stagecoloratentity-function-stagecoloratentity-stage-vertexcolor-entitycolor-position-vieworigin-nowmilliseconds-src-mq3-renderer-playable-materials-ml-266540735"></a>
### stageColorAtEntity

```ml
function stageColorAtEntity(stage, vertexColor, entityColor, position, viewOrigin, nowMilliseconds)
```

AGEN_PORTAL from tr_shade.c fades each deformed vertex according to its camera distance.  This is deliberately evaluated after stageColor so the portal generator replaces only alpha, exactly like the original renderer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `vertexColor` | `dynamic` | — |  |
| `entityColor` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L403)

<a id="function-function-mq3-renderer-playable-materials-stagecolorentity-function-stagecolorentity-stage-vertexcolor-entitycolor-nowmilliseconds-src-mq3-renderer-playable-materials-ml-1351007911"></a>
### stageColorEntity

```ml
function stageColorEntity(stage, vertexColor, entityColor, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `vertexColor` | `dynamic` | — |  |
| `entityColor` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L397)

<a id="function-function-mq3-renderer-playable-materials-stagecolorentityidentity-function-stagecolorentityidentity-stage-vertexcolor-entitycolor-nowmilliseconds-identitylight-src-mq3-renderer-playable-materials-ml-1402088967"></a>
### stageColorEntityIdentity

```ml
function stageColorEntityIdentity(stage, vertexColor, entityColor, nowMilliseconds, identityLight)
```

Complete ComputeColors ordering from tr_shade.c. RGB generation may seed alpha, after which alphaGen either preserves or replaces it. identityLight is explicit so differential tests can cover the original overbright path; the software preview currently renders with identityLight 1.0.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `vertexColor` | `dynamic` | — |  |
| `entityColor` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `identityLight` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L372)

<a id="function-function-mq3-renderer-playable-materials-stagelight-function-stagelight-stage-vertexlight-nowmilliseconds-src-mq3-renderer-playable-materials-ml-1153776666"></a>
### stageLight

```ml
function stageLight(stage, vertexLight, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `vertexLight` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L339)

<a id="function-function-mq3-renderer-playable-materials-stagemods-function-stagemods-stage-src-mq3-renderer-playable-materials-ml-723517532"></a>
### stageMods

```ml
function stageMods(stage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L202)

<a id="function-function-mq3-renderer-playable-materials-stagetcgen-function-stagetcgen-stage-src-mq3-renderer-playable-materials-ml-1398630362"></a>
### stageTcGen

```ml
function stageTcGen(stage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L191)

<a id="function-function-mq3-renderer-playable-materials-transformuv-function-transformuv-stage-uv-nowmilliseconds-src-mq3-renderer-playable-materials-ml-851239715"></a>
### transformUV

```ml
function transformUV(stage, uv, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `uv` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L455)

<a id="function-function-mq3-renderer-playable-materials-transformuvat-function-transformuvat-stage-uv-position-nowmilliseconds-src-mq3-renderer-playable-materials-ml-1219308508"></a>
### transformUVAt

```ml
function transformUVAt(stage, uv, position, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `uv` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L451)

<a id="function-function-mq3-renderer-playable-materials-transformuventityat-function-transformuventityat-stage-uv-position-entitytexcoord-shadertime-nowmilliseconds-src-mq3-renderer-playable-materials-ml-1092899805"></a>
### transformUVEntityAt

```ml
function transformUVEntityAt(stage, uv, position, entityTexCoord, shaderTime, nowMilliseconds)
```

Baseq3 applies tcMods in declaration order. Turbulence additionally uses the unmodified world position of each vertex.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `uv` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `entityTexCoord` | `dynamic` | — |  |
| `shaderTime` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L430)

<a id="function-function-mq3-renderer-playable-materials-turbulentoffset-function-turbulentoffset-coordinate-mod-nowmilliseconds-src-mq3-renderer-playable-materials-ml-662379912"></a>
### turbulentOffset

```ml
function turbulentOffset(coordinate, mod, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `coordinate` | `dynamic` | — |  |
| `mod` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L421)

<a id="function-function-mq3-renderer-playable-materials-usablestage-function-usablestage-stage-src-mq3-renderer-playable-materials-ml-1582002526"></a>
### usableStage

```ml
function usableStage(stage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L217)

- [mq3.renderer.playable_materials.UvMod](Type-mq3-renderer-playable-materials-uvmod-1845582321.md) — struct
<a id="function-function-mq3-renderer-playable-materials-validmap-function-validmap-map-src-mq3-renderer-playable-materials-ml-456218678"></a>
### validMap

```ml
function validMap(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L66)

<a id="function-function-mq3-renderer-playable-materials-vectoruv-function-vectoruv-stage-position-src-mq3-renderer-playable-materials-ml-555134361"></a>
### vectorUV

```ml
function vectorUV(stage, position)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L415)

<a id="function-function-mq3-renderer-playable-materials-videoname-function-videoname-stage-src-mq3-renderer-playable-materials-ml-331812898"></a>
### videoName

```ml
function videoName(stage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L243)

<a id="function-function-mq3-renderer-playable-materials-wavesample-function-wavesample-wave-nowmilliseconds-src-mq3-renderer-playable-materials-ml-1834153989"></a>
### waveSample

```ml
function waveSample(wave, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L330)

<a id="function-function-mq3-renderer-playable-materials-wavesampleoffset-function-wavesampleoffset-wave-nowmilliseconds-phaseoffset-src-mq3-renderer-playable-materials-ml-1436295043"></a>
### waveSampleOffset

```ml
function waveSampleOffset(wave, nowMilliseconds, phaseOffset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `phaseOffset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L331)

<a id="function-function-mq3-renderer-playable-materials-wavesignal-function-wavesignal-wave-nowmilliseconds-src-mq3-renderer-playable-materials-ml-28856749"></a>
### waveSignal

```ml
function waveSignal(wave, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L313)

<a id="function-function-mq3-renderer-playable-materials-wavevalue-function-wavevalue-wave-nowmilliseconds-src-mq3-renderer-playable-materials-ml-1671303997"></a>
### waveValue

```ml
function waveValue(wave, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_materials.ml#L335)
