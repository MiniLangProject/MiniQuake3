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

Alpha-test selector that accepts byte alpha values of at least 128.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L56)

<a id="constant-constant-mq3-renderer-playable-materials-alpha-test-gt0-const-alpha-test-gt0-1-src-mq3-renderer-playable-materials-ml-1738260136"></a>
### ALPHA_TEST_GT0

```ml
const ALPHA_TEST_GT0 = 1
```

Alpha-test selector that accepts alpha values greater than zero.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L52)

<a id="constant-constant-mq3-renderer-playable-materials-alpha-test-lt128-const-alpha-test-lt128-2-src-mq3-renderer-playable-materials-ml-1409525851"></a>
### ALPHA_TEST_LT128

```ml
const ALPHA_TEST_LT128 = 2
```

Alpha-test selector that accepts byte alpha values below 128.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L54)

<a id="constant-constant-mq3-renderer-playable-materials-alpha-test-none-const-alpha-test-none-0-src-mq3-renderer-playable-materials-ml-807383069"></a>
### ALPHA_TEST_NONE

```ml
const ALPHA_TEST_NONE = 0
```

Alpha-test selector that accepts all fragment alpha values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L50)

<a id="constant-constant-mq3-renderer-playable-materials-base-texture-first-slot-const-base-texture-first-slot-64-src-mq3-renderer-playable-materials-ml-841813383"></a>
### BASE_TEXTURE_FIRST_SLOT

```ml
const BASE_TEXTURE_FIRST_SLOT = 64
```

First texture slot reserved for ordinary material images.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L23)

<a id="constant-constant-mq3-renderer-playable-materials-base-texture-slot-count-const-base-texture-slot-count-256-src-mq3-renderer-playable-materials-ml-429894598"></a>
### BASE_TEXTURE_SLOT_COUNT

```ml
const BASE_TEXTURE_SLOT_COUNT = 256
```

Number of texture slots reserved for ordinary material images.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L25)

<a id="constant-constant-mq3-renderer-playable-materials-blend-add-const-blend-add-2-src-mq3-renderer-playable-materials-ml-702441923"></a>
### BLEND_ADD

```ml
const BLEND_ADD = 2
```

Blend mode that adds source and destination colors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L37)

<a id="constant-constant-mq3-renderer-playable-materials-blend-alpha-const-blend-alpha-1-src-mq3-renderer-playable-materials-ml-1954974232"></a>
### BLEND_ALPHA

```ml
const BLEND_ALPHA = 1
```

Blend mode using source alpha and one minus source alpha as color factors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L35)

<a id="constant-constant-mq3-renderer-playable-materials-blend-dst-color-one-minus-dst-alpha-const-blend-dst-color-one-minus-dst-alpha-4-src-mq3-renderer-playable-materials-ml-953270237"></a>
### BLEND_DST_COLOR_ONE_MINUS_DST_ALPHA

```ml
const BLEND_DST_COLOR_ONE_MINUS_DST_ALPHA = 4
```

Blend mode using destination color and one minus destination alpha as factors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L41)

<a id="constant-constant-mq3-renderer-playable-materials-blend-filter-const-blend-filter-3-src-mq3-renderer-playable-materials-ml-230384704"></a>
### BLEND_FILTER

```ml
const BLEND_FILTER = 3
```

Blend mode that multiplies source and destination colors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L39)

<a id="constant-constant-mq3-renderer-playable-materials-blend-gl-state-const-blend-gl-state-256-src-mq3-renderer-playable-materials-ml-1670682390"></a>
### BLEND_GL_STATE

```ml
const BLEND_GL_STATE = 256
```

Blend selector indicating that source and destination factors come from packed GLS state bits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L48)

<a id="constant-constant-mq3-renderer-playable-materials-blend-mark-const-blend-mark-6-src-mq3-renderer-playable-materials-ml-1187377611"></a>
### BLEND_MARK

```ml
const BLEND_MARK = 6
```

Blend mode multiplying destination color by one minus the source color for impact marks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L43)

<a id="constant-constant-mq3-renderer-playable-materials-blend-opaque-const-blend-opaque-0-src-mq3-renderer-playable-materials-ml-1964183937"></a>
### BLEND_OPAQUE

```ml
const BLEND_OPAQUE = 0
```

Blend mode that replaces destination color with the source color.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L33)

<a id="constant-constant-mq3-renderer-playable-materials-blend-premultiplied-alpha-const-blend-premultiplied-alpha-7-src-mq3-renderer-playable-materials-ml-1004335126"></a>
### BLEND_PREMULTIPLIED_ALPHA

```ml
const BLEND_PREMULTIPLIED_ALPHA = 7
```

Blend mode combining premultiplied source color with destination color scaled by one minus source alpha.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L46)

<a id="function-function-mq3-renderer-playable-materials-buildscriptindex-function-buildscriptindex-archive-src-mq3-renderer-playable-materials-ml-697053838"></a>
### buildScriptIndex

```ml
function buildScriptIndex(archive)
```

Computes `buildScriptIndex` from `[index,count]` using `std.string_builder.StringBuilder.withCapacity`, `mq3.renderer.playable_materials.endsIgnoreCase`, `mq3.format.pk3.readEntry`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Record providing `archive.entries`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L265)

<a id="function-function-mq3-renderer-playable-materials-cacheimage-function-cacheimage-cache-name-image-src-mq3-renderer-playable-materials-ml-900258650"></a>
### cacheImage

```ml
function cacheImage(cache, name, image)
```

Updates `cache.count` in `mq3.renderer.playable_materials.cacheImage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Mutable record or buffer; this call updates `cache.count`. |
| `name` | `dynamic` | — | Argument 1 supplied to `std.string.toLowerAscii`. |
| `image` | `dynamic` | — | Argument 2 supplied to `cache.images.set`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L197)

<a id="function-function-mq3-renderer-playable-materials-candidates-function-candidates-name-src-mq3-renderer-playable-materials-ml-1671793603"></a>
### candidates

```ml
function candidates(name)
```

Computes `candidates` from `[name+".tga",name+".jpg",name+".jpeg"]` using `mq3.renderer.playable_materials.endsIgnoreCase`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.playable_materials.endsIgnoreCase`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L255)

- [mq3.renderer.playable_materials.Catalog](Type-mq3-renderer-playable-materials-catalog-111238727.md) — struct
<a id="function-function-mq3-renderer-playable-materials-colorbyte-function-colorbyte-value-src-mq3-renderer-playable-materials-ml-261469847"></a>
### colorByte

```ml
function colorByte(value)
```

Returns `n.trunc32(value)` from `mq3.renderer.playable_materials.colorByte`; earlier branches return `0`, `255`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.trunc32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L635)

<a id="function-function-mq3-renderer-playable-materials-containsindex-function-containsindex-materials-index-src-mq3-renderer-playable-materials-ml-342281844"></a>
### containsIndex

```ml
function containsIndex(materials, index)
```

Returns `false` from `mq3.renderer.playable_materials.containsIndex`; earlier branches return `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `materials` | `dynamic` | — | Sequence traversed as `material` while producing this result. |
| `index` | `dynamic` | — | Input used by `for each material in materials if material.textureIndex==index then return true`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L358)

<a id="function-function-mq3-renderer-playable-materials-decodeasset-function-decodeasset-name-data-src-mq3-renderer-playable-materials-ml-53274047"></a>
### decodeAsset

```ml
function decodeAsset(name, data)
```

Computes `decodeAsset` from `fail("unsupported image extension")` using `mq3.renderer.playable_materials.endsIgnoreCase`, `mq3.renderer.tga.decode`, `mq3.renderer.playable_materials.Image`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.playable_materials.endsIgnoreCase`. |
| `data` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.tga.decode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L315)

<a id="function-function-mq3-renderer-playable-materials-directruntimestage-function-directruntimestage-archive-name-nextslot-endslot-src-mq3-renderer-playable-materials-ml-1133168049"></a>
### directRuntimeStage

```ml
function directRuntimeStage(archive, name, nextSlot, endSlot)
```

Calls `mq3.renderer.playable_materials.directRuntimeStageCached` with `(archive,name,nextSlot,endSlot,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Value forwarded as `archive` to `mq3.renderer.playable_materials.directRuntimeStageCached`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.playable_materials.directRuntimeStageCached`. |
| `nextSlot` | `dynamic` | — | Value forwarded as `nextSlot` to `mq3.renderer.playable_materials.directRuntimeStageCached`. |
| `endSlot` | `dynamic` | — | Value forwarded as `endSlot` to `mq3.renderer.playable_materials.directRuntimeStageCached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L484)

<a id="function-function-mq3-renderer-playable-materials-directruntimestagecached-function-directruntimestagecached-archive-name-nextslot-endslot-cache-src-mq3-renderer-playable-materials-ml-2075684481"></a>
### directRuntimeStageCached

```ml
function directRuntimeStageCached(archive, name, nextSlot, endSlot, cache)
```

Loads one cached image into an opaque runtime stage when a texture slot remains available.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Value forwarded as `archive` to `mq3.renderer.playable_materials.loadImageCached`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.playable_materials.loadImageCached`. |
| `nextSlot` | `dynamic` | — | Input tested by `nextSlot>=endSlot`. |
| `endSlot` | `dynamic` | — | Input tested by `nextSlot>=endSlot`. |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.playable_materials.loadImageCached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L474)

<a id="function-function-mq3-renderer-playable-materials-endsignorecase-function-endsignorecase-value-suffix-src-mq3-renderer-playable-materials-ml-605590476"></a>
### endsIgnoreCase

```ml
function endsIgnoreCase(value, suffix)
```

Calls `std.string.endsWith` with `(strings.toLowerAscii(value),strings.toLowerAscii(suffix))` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 supplied to `std.string.toLowerAscii`. |
| `suffix` | `dynamic` | — | Argument 1 supplied to `std.string.toLowerAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L249)

<a id="function-function-mq3-renderer-playable-materials-entitymilliseconds-function-entitymilliseconds-nowmilliseconds-shadertime-src-mq3-renderer-playable-materials-ml-297837354"></a>
### entityMilliseconds

```ml
function entityMilliseconds(nowMilliseconds, shaderTime)
```

Calls `mq3.renderer.playable_materials.shaderMilliseconds` with `(nowMilliseconds,shaderTime,0.0,0.0)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.shaderMilliseconds`. |
| `shaderTime` | `dynamic` | — | Value forwarded as `entityShaderTime` to `mq3.renderer.playable_materials.shaderMilliseconds`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L571)

<a id="function-function-mq3-renderer-playable-materials-environmentuv-function-environmentuv-position-normal-vieworigin-src-mq3-renderer-playable-materials-ml-771363215"></a>
### environmentUV

```ml
function environmentUV(position, normal, viewOrigin)
```

RB_CalcEnvironmentTexCoords: reflect the normalized eye vector around the BSP vertex normal and map reflected Y/Z into texture space.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `normal` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `viewOrigin` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L807)

<a id="function-function-mq3-renderer-playable-materials-fail-function-fail-message-src-mq3-renderer-playable-materials-ml-1900783979"></a>
### fail

```ml
function fail(message)
```

Creates error `7486` with message `"preview materials: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7486,"preview materials: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L221)

<a id="function-function-mq3-renderer-playable-materials-floornumber-function-floornumber-value-src-mq3-renderer-playable-materials-ml-1695661163"></a>
### floorNumber

```ml
function floorNumber(value)
```

Returns `integer` from `mq3.renderer.playable_materials.floorNumber`; earlier branches return `integer-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.trunc32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L535)

<a id="function-function-mq3-renderer-playable-materials-fogadjustment-function-fogadjustment-firststage-stage-src-mq3-renderer-playable-materials-ml-1404336916"></a>
### fogAdjustment

```ml
function fogAdjustment(firstStage, stage)
```

FinishShader assigns fog modulation only when the shader's first stage is blended. Additive and inverse-source-color stages fade RGB, strict alpha stages fade alpha, and premultiplied-alpha stages fade RGBA. The final fog pass can then converge on the fog colour without glowing or opaque blended surfaces leaking through it.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `firstStage` | `dynamic` | — | Record providing `firstStage.blend`. |
| `stage` | `dynamic` | — | Record providing `stage.blend`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L645)

<a id="function-function-mq3-renderer-playable-materials-frameindex-function-frameindex-stage-nowmilliseconds-src-mq3-renderer-playable-materials-ml-141691288"></a>
### frameIndex

```ml
function frameIndex(stage, nowMilliseconds)
```

Returns `frame%len(stage.slots)` from `mq3.renderer.playable_materials.frameIndex`; earlier branches return `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.slots`, `stage.animationSpeed`. |
| `nowMilliseconds` | `dynamic` | — | Input used by `frame=floorNumber(nowMilliseconds*0.001*stage.animationSpeed)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L539)

<a id="function-function-mq3-renderer-playable-materials-frameindexentity-function-frameindexentity-stage-nowmilliseconds-shadertime-src-mq3-renderer-playable-materials-ml-77414116"></a>
### frameIndexEntity

```ml
function frameIndexEntity(stage, nowMilliseconds, shaderTime)
```

Calls `mq3.renderer.playable_materials.frameIndex` with `(stage,entityMilliseconds(nowMilliseconds,shaderTime))` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Value forwarded as `stage` to `mq3.renderer.playable_materials.frameIndex`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.entityMilliseconds`. |
| `shaderTime` | `dynamic` | — | Value forwarded as `shaderTime` to `mq3.renderer.playable_materials.entityMilliseconds`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L576)

- [mq3.renderer.playable_materials.Image](Type-mq3-renderer-playable-materials-image-702988069.md) — struct
<a id="function-function-mq3-renderer-playable-materials-imagecache-function-imagecache-archive-src-mq3-renderer-playable-materials-ml-1700693986"></a>
### imageCache

```ml
function imageCache(archive)
```

Constructs `mq3.renderer.playable_materials.ImageCache` with `images` = `maps.HashMap.withCapacity(512)`, `count` = `0`, `hits` = `0`, `misses` = `0` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Initial value for `mq3.renderer.playable_materials.ImageCache.archive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L192)

- [mq3.renderer.playable_materials.ImageCache](Type-mq3-renderer-playable-materials-imagecache-1412327461.md) — struct
<a id="function-function-mq3-renderer-playable-materials-isvideostage-function-isvideostage-stage-src-mq3-renderer-playable-materials-ml-895741702"></a>
### isVideoStage

```ml
function isVideoStage(stage)
```

Computes `videoName(stage)!=""` for `mq3.renderer.playable_materials.isVideoStage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Value forwarded as `stage` to `mq3.renderer.playable_materials.videoName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L460)

<a id="function-function-mq3-renderer-playable-materials-lightmapruntimestage-function-lightmapruntimestage-stage-src-mq3-renderer-playable-materials-ml-1517081246"></a>
### lightmapRuntimeStage

```ml
function lightmapRuntimeStage(stage)
```

Constructs `mq3.renderer.playable_materials.RuntimeStage` with `imageNames` = `[]`, `images` = `[]`, `slots` = `[]`, `animationSpeed` = `0.0` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.rgbGen`, `stage.rgbWave`, `stage.alphaGen`, `stage.alphaWave`, `stage.constantColor`, `stage.depthWrite`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L464)

<a id="function-function-mq3-renderer-playable-materials-load-function-load-archive-map-maxmaterials-firstslot-src-mq3-renderer-playable-materials-ml-2086909302"></a>
### load

```ml
function load(archive, map, maxMaterials, firstSlot)
```

Returns `loadIndexed(archive,map,maxMaterials,firstSlot,scripts[0],scripts[1])` from `mq3.renderer.playable_materials.load`; earlier branches return `scripts`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Value forwarded as `archive` to `mq3.renderer.playable_materials.buildScriptIndex`. |
| `map` | `dynamic` | — | Value forwarded as `map` to `mq3.renderer.playable_materials.loadIndexed`. |
| `maxMaterials` | `dynamic` | — | Value forwarded as `maxMaterials` to `mq3.renderer.playable_materials.loadIndexed`. |
| `firstSlot` | `dynamic` | — | Value forwarded as `firstSlot` to `mq3.renderer.playable_materials.loadIndexed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L852)

<a id="function-function-mq3-renderer-playable-materials-loadimage-function-loadimage-archive-name-src-mq3-renderer-playable-materials-ml-39310699"></a>
### loadImage

```ml
function loadImage(archive, name)
```

Calls `mq3.renderer.playable_materials.loadImageCached` with `(archive,name,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Value forwarded as `archive` to `mq3.renderer.playable_materials.loadImageCached`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.playable_materials.loadImageCached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L353)

<a id="function-function-mq3-renderer-playable-materials-loadimagecached-function-loadimagecached-archive-name-cache-src-mq3-renderer-playable-materials-ml-155959691"></a>
### loadImageCached

```ml
function loadImageCached(archive, name, cache)
```

Updates `cache.hits`, `cache.misses` in `mq3.renderer.playable_materials.loadImageCached`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Argument 1 supplied to `mq3.format.pk3.findEntry`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.playable_materials.candidates`. |
| `cache` | `dynamic` | — | Mutable record or buffer; this call updates `cache.hits`, `cache.misses`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L331)

<a id="function-function-mq3-renderer-playable-materials-loadindexed-function-loadindexed-archive-map-maxmaterials-firstslot-index-scriptcount-src-mq3-renderer-playable-materials-ml-345043106"></a>
### loadIndexed

```ml
function loadIndexed(archive, map, maxMaterials, firstSlot, index, scriptCount)
```

Builds `mq3.renderer.playable_materials.Catalog` using `materialList.add`, `materialList.toArray`, `materialList.len`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Value forwarded as `archive` to `mq3.renderer.playable_materials.runtimeStages`. |
| `map` | `dynamic` | — | Record providing `map.counts`. |
| `maxMaterials` | `dynamic` | — | Input used by `endSlot=firstSlot+maxMaterials`. |
| `firstSlot` | `dynamic` | — | Input used by `nextSlot=firstSlot`. |
| `index` | `dynamic` | — | Value forwarded as `index` to `mq3.renderer.playable_materials.runtimeStages`. |
| `scriptCount` | `dynamic` | — | Initial value for `mq3.renderer.playable_materials.Catalog.scripts`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L823)

<a id="function-function-mq3-renderer-playable-materials-loadruntimestage-function-loadruntimestage-archive-stage-nextslot-endslot-src-mq3-renderer-playable-materials-ml-1246094182"></a>
### loadRuntimeStage

```ml
function loadRuntimeStage(archive, stage, nextSlot, endSlot)
```

Calls `mq3.renderer.playable_materials.loadRuntimeStageCached` with `(archive,stage,nextSlot,endSlot,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Value forwarded as `archive` to `mq3.renderer.playable_materials.loadRuntimeStageCached`. |
| `stage` | `dynamic` | — | Value forwarded as `stage` to `mq3.renderer.playable_materials.loadRuntimeStageCached`. |
| `nextSlot` | `dynamic` | — | Value forwarded as `nextSlot` to `mq3.renderer.playable_materials.loadRuntimeStageCached`. |
| `endSlot` | `dynamic` | — | Value forwarded as `endSlot` to `mq3.renderer.playable_materials.loadRuntimeStageCached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L449)

<a id="function-function-mq3-renderer-playable-materials-loadruntimestagecached-function-loadruntimestagecached-archive-stage-nextslot-endslot-cache-src-mq3-renderer-playable-materials-ml-1860572392"></a>
### loadRuntimeStageCached

```ml
function loadRuntimeStageCached(archive, stage, nextSlot, endSlot, cache)
```

Loads bounded animation images or a video placeholder into a runtime stage and returns the next free texture slot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Value forwarded as `archive` to `mq3.renderer.playable_materials.loadImageCached`. |
| `stage` | `dynamic` | — | Record providing `stage.mapMode`, `stage.images`, `stage.rgbGen`, `stage.rgbWave`, `stage.alphaGen`, `stage.alphaWave`. |
| `nextSlot` | `dynamic` | — | Input tested by `nextSlot>=endSlot or len(stage.images)==0`. |
| `endSlot` | `dynamic` | — | Input tested by `nextSlot>=endSlot or len(stage.images)==0`. |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.playable_materials.loadImageCached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L425)

<a id="function-function-mq3-renderer-playable-materials-mappedimagename-function-mappedimagename-index-name-src-mq3-renderer-playable-materials-ml-525897581"></a>
### mappedImageName

```ml
function mappedImageName(index, name)
```

Select the first actual image of a shader stage. This intentionally ignores blend animation and tcMod for the first playable slice, but understands both map/clampMap and the first frame of animMap without requiring a full shader parse.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Record providing `index.text`. |
| `name` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.shader_index.find`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L286)

- [mq3.renderer.playable_materials.Material](Type-mq3-renderer-playable-materials-material-621328033.md) — struct
<a id="constant-constant-mq3-renderer-playable-materials-max-animation-frames-const-max-animation-frames-8-src-mq3-renderer-playable-materials-ml-1693500259"></a>
### MAX_ANIMATION_FRAMES

```ml
const MAX_ANIMATION_FRAMES = 8
```

Maximum number of image frames retained by an animated material stage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L29)

<a id="constant-constant-mq3-renderer-playable-materials-max-cached-images-const-max-cached-images-2048-src-mq3-renderer-playable-materials-ml-1494801835"></a>
### MAX_CACHED_IMAGES

```ml
const MAX_CACHED_IMAGES = 2048
```

Maximum number of decoded images retained in the shared material cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L31)

<a id="constant-constant-mq3-renderer-playable-materials-max-runtime-stages-const-max-runtime-stages-8-src-mq3-renderer-playable-materials-ml-1733655469"></a>
### MAX_RUNTIME_STAGES

```ml
const MAX_RUNTIME_STAGES = 8
```

Maximum number of parsed shader stages retained by a runtime material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L27)

<a id="function-function-mq3-renderer-playable-materials-modulateforfog-function-modulateforfog-color-density-adjustment-src-mq3-renderer-playable-materials-ml-1684029290"></a>
### modulateForFog

```ml
function modulateForFog(color, density, adjustment)
```

Builds `result[0]`, `result[1]`, `result[2]`, `result[3]` in `mq3.renderer.playable_materials.modulateForFog`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `color` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |
| `density` | `dynamic` | — | Input used by `factor=1.0-density`. |
| `adjustment` | `dynamic` | — | Input tested by `adjustment=="rgb" or adjustment=="rgba"`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L656)

<a id="function-function-mq3-renderer-playable-materials-resolvedshadersort-function-resolvedshadersort-shader-src-mq3-renderer-playable-materials-ml-1531405165"></a>
### resolvedShaderSort

```ml
function resolvedShaderSort(shader)
```

Computes `resolvedShaderSort` from `3.0` using `and`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — | Record providing `shader.sort`, `shader.polygonOffset`, `shader.stages`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L488)

- [mq3.renderer.playable_materials.RuntimeStage](Type-mq3-renderer-playable-materials-runtimestage-1687637930.md) — struct
<a id="function-function-mq3-renderer-playable-materials-runtimestages-function-runtimestages-archive-index-name-nextslot-endslot-src-mq3-renderer-playable-materials-ml-815457943"></a>
### runtimeStages

```ml
function runtimeStages(archive, index, name, nextSlot, endSlot)
```

Calls `mq3.renderer.playable_materials.runtimeStagesCached` with `(archive,index,name,nextSlot,endSlot,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Value forwarded as `archive` to `mq3.renderer.playable_materials.runtimeStagesCached`. |
| `index` | `dynamic` | — | Value forwarded as `index` to `mq3.renderer.playable_materials.runtimeStagesCached`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.playable_materials.runtimeStagesCached`. |
| `nextSlot` | `dynamic` | — | Value forwarded as `nextSlot` to `mq3.renderer.playable_materials.runtimeStagesCached`. |
| `endSlot` | `dynamic` | — | Value forwarded as `endSlot` to `mq3.renderer.playable_materials.runtimeStagesCached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L531)

<a id="function-function-mq3-renderer-playable-materials-runtimestagescached-function-runtimestagescached-archive-index-name-nextslot-endslot-cache-src-mq3-renderer-playable-materials-ml-1620140435"></a>
### runtimeStagesCached

```ml
function runtimeStagesCached(archive, index, name, nextSlot, endSlot, cache)
```

Computes `runtimeStagesCached` from `[result,nextSlot,deforms,twoSided,sort,polygonOffset,noMipMaps,clampTime,noPicMip]` using `mq3.renderer.shader_parser.parseIndexed`, `not`, `mq3.renderer.playable_materials.resolvedShaderSort`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Value forwarded as `archive` to `mq3.renderer.playable_materials.loadRuntimeStageCached`. |
| `index` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.shader_parser.parseIndexed`. |
| `name` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.shader_parser.parseIndexed`. |
| `nextSlot` | `dynamic` | — | Value forwarded as `nextSlot` to `mq3.renderer.playable_materials.loadRuntimeStageCached`. |
| `endSlot` | `dynamic` | — | Value forwarded as `endSlot` to `mq3.renderer.playable_materials.loadRuntimeStageCached`. |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.playable_materials.loadRuntimeStageCached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L503)

<a id="function-function-mq3-renderer-playable-materials-seedimagecachefromcatalog-function-seedimagecachefromcatalog-cache-catalog-src-mq3-renderer-playable-materials-ml-1224769511"></a>
### seedImageCacheFromCatalog

```ml
function seedImageCacheFromCatalog(cache, catalog)
```

Adds every loaded material-stage image to the shared image cache under its recorded image name.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.playable_materials.cacheImage`. |
| `catalog` | `dynamic` | — | Record providing `catalog.materials`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L206)

<a id="constant-constant-mq3-renderer-playable-materials-shader-name-bytes-const-shader-name-bytes-64-src-mq3-renderer-playable-materials-ml-1842096759"></a>
### SHADER_NAME_BYTES

```ml
const SHADER_NAME_BYTES = 64
```

Byte capacity reserved for a shader name in the native BSP shader record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L21)

<a id="constant-constant-mq3-renderer-playable-materials-shader-stride-const-shader-stride-72-src-mq3-renderer-playable-materials-ml-2139626030"></a>
### SHADER_STRIDE

```ml
const SHADER_STRIDE = 72
```

Byte stride of one shader record in the BSP shader lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L19)

<a id="function-function-mq3-renderer-playable-materials-shadermilliseconds-inline-function-shadermilliseconds-nowmilliseconds-entityshadertime-timeoffset-clamptime-returns-float-src-mq3-renderer-playable-materials-ml-1408693057"></a>
### shaderMilliseconds

```ml
inline function shaderMilliseconds(nowMilliseconds, entityShaderTime, timeOffset, clampTime) returns float
```

Converts the offset/clamped per-entity shader clock from seconds back to milliseconds.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `nowMilliseconds` | `dynamic` | — | Current renderer time in milliseconds. |
| `entityShaderTime` | `dynamic` | — | Per-entity shader start time in seconds, subtracted from renderer time. |
| `timeOffset` | `dynamic` | — | Shader remapping time offset in seconds, also subtracted. |
| `clampTime` | `dynamic` | — | Maximum shader time in seconds; zero disables clamping. |


**Returns:** The float32 per-entity shader time in milliseconds.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L567)

<a id="function-function-mq3-renderer-playable-materials-shadername-function-shadername-map-index-src-mq3-renderer-playable-materials-ml-1273478062"></a>
### shaderName

```ml
function shaderName(map, index)
```

Computes `shaderName` from `decode(slice(map.data,offset,length))` using `mq3.renderer.playable_materials.validMap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`, `map.offsets`, `map.data`. |
| `index` | `dynamic` | — | Input tested by `index<0 or index>=map.counts[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L229)

<a id="function-function-mq3-renderer-playable-materials-shaderseconds-function-shaderseconds-nowmilliseconds-entityshadertime-timeoffset-clamptime-returns-float-src-mq3-renderer-playable-materials-ml-1060998412"></a>
### shaderSeconds

```ml
function shaderSeconds(nowMilliseconds, entityShaderTime, timeOffset, clampTime) returns float
```

tr_backend.c subtracts refEntity_t.shaderTime before every shader-time consumer runs. Keep that conversion in one place so animated images, waves, deforms and tcMods all observe the same per-entity clock.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `nowMilliseconds` | `dynamic` | — | Current renderer time in milliseconds. |
| `entityShaderTime` | `dynamic` | — | Per-entity shader start time in seconds, subtracted from renderer time. |
| `timeOffset` | `dynamic` | — | Shader remapping time offset in seconds, also subtracted. |
| `clampTime` | `dynamic` | — | Maximum shader time in seconds; zero disables clamping. |


**Returns:** Float32 renderer seconds minus entityShaderTime and timeOffset, limited by nonzero clampTime.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L556)

<a id="function-function-mq3-renderer-playable-materials-shadersurfaceflags-function-shadersurfaceflags-map-index-src-mq3-renderer-playable-materials-ml-1299998890"></a>
### shaderSurfaceFlags

```ml
function shaderSurfaceFlags(map, index)
```

Computes `shaderSurfaceFlags` from `n.readI32(map.data,offset+68)` using `mq3.renderer.playable_materials.validMap`, `mq3.compat.numeric.readI32`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`, `map.offsets`, `map.data`. |
| `index` | `dynamic` | — | Input tested by `not validMap(map) or index<0 or index>=map.counts[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L240)

<a id="function-function-mq3-renderer-playable-materials-slotat-function-slotat-stage-nowmilliseconds-src-mq3-renderer-playable-materials-ml-744687280"></a>
### slotAt

```ml
function slotAt(stage, nowMilliseconds)
```

Returns `stage.slots[frameIndex(stage,nowMilliseconds)]` from `mq3.renderer.playable_materials.slotAt`; earlier branches return `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.slots`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.frameIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L547)

<a id="function-function-mq3-renderer-playable-materials-slotatentity-function-slotatentity-stage-nowmilliseconds-shadertime-src-mq3-renderer-playable-materials-ml-1088725080"></a>
### slotAtEntity

```ml
function slotAtEntity(stage, nowMilliseconds, shaderTime)
```

Returns `stage.slots[frameIndexEntity(stage,nowMilliseconds,shaderTime)]` from `mq3.renderer.playable_materials.slotAtEntity`; earlier branches return `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.slots`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.frameIndexEntity`. |
| `shaderTime` | `dynamic` | — | Value forwarded as `shaderTime` to `mq3.renderer.playable_materials.frameIndexEntity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L581)

<a id="function-function-mq3-renderer-playable-materials-slotfor-function-slotfor-catalog-textureindex-src-mq3-renderer-playable-materials-ml-1566447832"></a>
### slotFor

```ml
function slotFor(catalog, textureIndex)
```

Returns `-1` from `mq3.renderer.playable_materials.slotFor`; earlier branches return `-1`, `material.slot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.materials`. |
| `textureIndex` | `dynamic` | — | Input used by `for each material in catalog.materials if material.textureIndex==textureIndex then return material.slot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L860)

<a id="function-function-mq3-renderer-playable-materials-stagealphatest-function-stagealphatest-stage-src-mq3-renderer-playable-materials-ml-1967274078"></a>
### stageAlphaTest

```ml
function stageAlphaTest(stage)
```

Maps parsed shader alpha-test flags to the native greater-than-zero or 128-threshold tests.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.alphaFunc`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L388)

<a id="function-function-mq3-renderer-playable-materials-stageblend-function-stageblend-stage-src-mq3-renderer-playable-materials-ml-631919634"></a>
### stageBlend

```ml
function stageBlend(stage)
```

Maps shader source/destination blend factors to the preview renderer's blend-mode constants.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.blendSrc`, `stage.blendDst`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L365)

<a id="function-function-mq3-renderer-playable-materials-stageclamp-function-stageclamp-stage-src-mq3-renderer-playable-materials-ml-1441599178"></a>
### stageClamp

```ml
function stageClamp(stage)
```

RE_UploadCinematic configures scratch images with GL_CLAMP too.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.mapMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L384)

<a id="function-function-mq3-renderer-playable-materials-stagecolor-function-stagecolor-stage-vertexcolor-nowmilliseconds-src-mq3-renderer-playable-materials-ml-2120936299"></a>
### stageColor

```ml
function stageColor(stage, vertexColor, nowMilliseconds)
```

Calls `mq3.renderer.playable_materials.stageColorEntity` with `(stage,vertexColor,vertexColor,nowMilliseconds)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Value forwarded as `stage` to `mq3.renderer.playable_materials.stageColorEntity`. |
| `vertexColor` | `dynamic` | — | Value forwarded as `vertexColor` to `mq3.renderer.playable_materials.stageColorEntity`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.stageColorEntity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L707)

<a id="function-function-mq3-renderer-playable-materials-stagecolorat-function-stagecolorat-stage-vertexcolor-position-vieworigin-nowmilliseconds-src-mq3-renderer-playable-materials-ml-1539928191"></a>
### stageColorAt

```ml
function stageColorAt(stage, vertexColor, position, viewOrigin, nowMilliseconds)
```

Calls `mq3.renderer.playable_materials.stageColorAtEntity` with `(stage,vertexColor,vertexColor,position,viewOrigin,nowMilliseconds)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Value forwarded as `stage` to `mq3.renderer.playable_materials.stageColorAtEntity`. |
| `vertexColor` | `dynamic` | — | Value forwarded as `vertexColor` to `mq3.renderer.playable_materials.stageColorAtEntity`. |
| `position` | `dynamic` | — | Value forwarded as `position` to `mq3.renderer.playable_materials.stageColorAtEntity`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `viewOrigin` to `mq3.renderer.playable_materials.stageColorAtEntity`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.stageColorAtEntity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L734)

<a id="function-function-mq3-renderer-playable-materials-stagecoloratentity-function-stagecoloratentity-stage-vertexcolor-entitycolor-position-vieworigin-nowmilliseconds-src-mq3-renderer-playable-materials-ml-266540735"></a>
### stageColorAtEntity

```ml
function stageColorAtEntity(stage, vertexColor, entityColor, position, viewOrigin, nowMilliseconds)
```

AGEN_PORTAL from tr_shade.c fades each deformed vertex according to its camera distance.  This is deliberately evaluated after stageColor so the portal generator replaces only alpha, exactly like the original renderer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.alphaGen`, `stage.portalRange`. |
| `vertexColor` | `dynamic` | — | Value forwarded as `vertexColor` to `mq3.renderer.playable_materials.stageColorEntity`. |
| `entityColor` | `dynamic` | — | Value forwarded as `entityColor` to `mq3.renderer.playable_materials.stageColorEntity`. |
| `position` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `viewOrigin` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.stageColorEntity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L718)

<a id="function-function-mq3-renderer-playable-materials-stagecolorentity-function-stagecolorentity-stage-vertexcolor-entitycolor-nowmilliseconds-src-mq3-renderer-playable-materials-ml-1351007911"></a>
### stageColorEntity

```ml
function stageColorEntity(stage, vertexColor, entityColor, nowMilliseconds)
```

Calls `mq3.renderer.playable_materials.stageColorEntityIdentity` with `(stage,vertexColor,entityColor,nowMilliseconds,1.0)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Value forwarded as `stage` to `mq3.renderer.playable_materials.stageColorEntityIdentity`. |
| `vertexColor` | `dynamic` | — | Value forwarded as `vertexColor` to `mq3.renderer.playable_materials.stageColorEntityIdentity`. |
| `entityColor` | `dynamic` | — | Value forwarded as `entityColor` to `mq3.renderer.playable_materials.stageColorEntityIdentity`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.stageColorEntityIdentity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L702)

<a id="function-function-mq3-renderer-playable-materials-stagecolorentityidentity-function-stagecolorentityidentity-stage-vertexcolor-entitycolor-nowmilliseconds-identitylight-src-mq3-renderer-playable-materials-ml-1402088967"></a>
### stageColorEntityIdentity

```ml
function stageColorEntityIdentity(stage, vertexColor, entityColor, nowMilliseconds, identityLight)
```

Complete ComputeColors ordering from tr_shade.c. RGB generation may seed alpha, after which alphaGen either preserves or replaces it. identityLight is explicit so differential tests can cover the original overbright path; the software preview currently renders with identityLight 1.0.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.rgbGen`, `stage.rgbWave`, `stage.constantColor`, `stage.alphaGen`, `stage.alphaWave`. |
| `vertexColor` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |
| `entityColor` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.waveValue`. |
| `identityLight` | `dynamic` | — | Input used by `identityByte=colorByte(255.0*identityLight)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L672)

<a id="function-function-mq3-renderer-playable-materials-stagelight-function-stagelight-stage-vertexlight-nowmilliseconds-src-mq3-renderer-playable-materials-ml-1153776666"></a>
### stageLight

```ml
function stageLight(stage, vertexLight, nowMilliseconds)
```

Computes the stage brightness for waveform, identity, inverse-vertex, or ordinary vertex RGB generation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.rgbGen`, `stage.rgbWave`. |
| `vertexLight` | `dynamic` | — | Input tested by `stage.rgbGen=="oneminusvertex"`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.waveValue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L626)

<a id="function-function-mq3-renderer-playable-materials-stagemods-function-stagemods-stage-src-mq3-renderer-playable-materials-ml-723517532"></a>
### stageMods

```ml
function stageMods(stage)
```

Converts parsed scroll/scale/rotate/turbulence/stretch/transform/entity-translation modifiers into runtime UV modifiers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.texMods`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L397)

<a id="function-function-mq3-renderer-playable-materials-stagetcgen-function-stagetcgen-stage-src-mq3-renderer-playable-materials-ml-1398630362"></a>
### stageTcGen

```ml
function stageTcGen(stage)
```

Returns `stage.tcGen` from `mq3.renderer.playable_materials.stageTcGen`; earlier branches return `"texture"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.tcGen`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L381)

<a id="function-function-mq3-renderer-playable-materials-transformuv-function-transformuv-stage-uv-nowmilliseconds-src-mq3-renderer-playable-materials-ml-851239715"></a>
### transformUV

```ml
function transformUV(stage, uv, nowMilliseconds)
```

Calls `mq3.renderer.playable_materials.transformUVAt` with `(stage,uv,[0.0,0.0,0.0],nowMilliseconds)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Value forwarded as `stage` to `mq3.renderer.playable_materials.transformUVAt`. |
| `uv` | `dynamic` | — | Value forwarded as `uv` to `mq3.renderer.playable_materials.transformUVAt`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.transformUVAt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L798)

<a id="function-function-mq3-renderer-playable-materials-transformuvat-function-transformuvat-stage-uv-position-nowmilliseconds-src-mq3-renderer-playable-materials-ml-1219308508"></a>
### transformUVAt

```ml
function transformUVAt(stage, uv, position, nowMilliseconds)
```

Calls `mq3.renderer.playable_materials.transformUVEntityAt` with `(stage,uv,position,[0.0,0.0],0.0,nowMilliseconds)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Value forwarded as `stage` to `mq3.renderer.playable_materials.transformUVEntityAt`. |
| `uv` | `dynamic` | — | Value forwarded as `uv` to `mq3.renderer.playable_materials.transformUVEntityAt`. |
| `position` | `dynamic` | — | Value forwarded as `position` to `mq3.renderer.playable_materials.transformUVEntityAt`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.transformUVEntityAt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L790)

<a id="function-function-mq3-renderer-playable-materials-transformuventityat-function-transformuventityat-stage-uv-position-entitytexcoord-shadertime-nowmilliseconds-src-mq3-renderer-playable-materials-ml-1092899805"></a>
### transformUVEntityAt

```ml
function transformUVEntityAt(stage, uv, position, entityTexCoord, shaderTime, nowMilliseconds)
```

Baseq3 applies tcMods in declaration order. Turbulence additionally uses the unmodified world position of each vertex.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.uvMods`. |
| `uv` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `position` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `entityTexCoord` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `shaderTime` | `dynamic` | — | Value forwarded as `shaderTime` to `mq3.renderer.playable_materials.entityMilliseconds`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.entityMilliseconds`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L764)

<a id="function-function-mq3-renderer-playable-materials-turbulentoffset-function-turbulentoffset-coordinate-mod-nowmilliseconds-src-mq3-renderer-playable-materials-ml-662379912"></a>
### turbulentOffset

```ml
function turbulentOffset(coordinate, mod, nowMilliseconds)
```

Returns `trans.sin(radians)*mod.b` from `mq3.renderer.playable_materials.turbulentOffset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `coordinate` | `dynamic` | — | Input used by `index=n.trunc32((coordinate/1024.0+phase)*1024.0)&1023`. |
| `mod` | `dynamic` | — | Record providing `mod.c`, `mod.d`, `mod.b`. |
| `nowMilliseconds` | `dynamic` | — | Input used by `phase=mod.c+nowMilliseconds*0.001*mod.d`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L749)

<a id="function-function-mq3-renderer-playable-materials-usablestage-function-usablestage-stage-src-mq3-renderer-playable-materials-ml-1582002526"></a>
### usableStage

```ml
function usableStage(stage)
```

Returns `not stringEqualsIgnoreCaseAscii(stage.images[0],"$lightmap")` from `mq3.renderer.playable_materials.usableStage`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.isLightmap`, `stage.images`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L414)

- [mq3.renderer.playable_materials.UvMod](Type-mq3-renderer-playable-materials-uvmod-1845582321.md) — struct
<a id="function-function-mq3-renderer-playable-materials-validmap-function-validmap-map-src-mq3-renderer-playable-materials-ml-456218678"></a>
### validMap

```ml
function validMap(map)
```

Computes `map!=void and typeof(map.data)=="bytes" and len(map.offsets)>1 and len(map.counts)>1` for `mq3.renderer.playable_materials.validMap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`, `map.offsets`, `map.counts`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L224)

<a id="function-function-mq3-renderer-playable-materials-vectoruv-function-vectoruv-stage-position-src-mq3-renderer-playable-materials-ml-555134361"></a>
### vectorUV

```ml
function vectorUV(stage, position)
```

Computes `vectorUV` from `[position[0]*s[0]+position[1]*s[1]+position[2]*s[2],position[0]*t[0]+position[1]*t[1]+position[2]*t[2]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.tcGenVectors`. |
| `position` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L739)

<a id="function-function-mq3-renderer-playable-materials-videoname-function-videoname-stage-src-mq3-renderer-playable-materials-ml-331812898"></a>
### videoName

```ml
function videoName(stage)
```

Returns `decode(slice(data,7,len(data)-7))` from `mq3.renderer.playable_materials.videoName`; earlier branches return `""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.imageNames`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L453)

<a id="function-function-mq3-renderer-playable-materials-wavesample-function-wavesample-wave-nowmilliseconds-src-mq3-renderer-playable-materials-ml-1834153989"></a>
### waveSample

```ml
function waveSample(wave, nowMilliseconds)
```

Calls `mq3.compat.numeric.fadd` with `(wave.base,n.fmul(wave.amplitude,waveSignal(wave,nowMilliseconds)))` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — | Record providing `wave.base`, `wave.amplitude`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.waveSignal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L606)

<a id="function-function-mq3-renderer-playable-materials-wavesampleoffset-function-wavesampleoffset-wave-nowmilliseconds-phaseoffset-src-mq3-renderer-playable-materials-ml-1436295043"></a>
### waveSampleOffset

```ml
function waveSampleOffset(wave, nowMilliseconds, phaseOffset)
```

Returns `waveSample(shifted,nowMilliseconds)` from `mq3.renderer.playable_materials.waveSampleOffset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — | Record providing `wave.func`, `wave.base`, `wave.amplitude`, `wave.phase`, `wave.frequency`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.waveSample`. |
| `phaseOffset` | `dynamic` | — | Input used by `shifted=shaderParser.Wave(wave.func,wave.base,wave.amplitude,wave.phase+phaseOffset,wave.frequency)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L611)

<a id="function-function-mq3-renderer-playable-materials-wavesignal-function-wavesignal-wave-nowmilliseconds-src-mq3-renderer-playable-materials-ml-28856749"></a>
### waveSignal

```ml
function waveSignal(wave, nowMilliseconds)
```

Computes `waveSignal` from `n.f32(trans.sin(radians))` using `mq3.compat.numeric.f32`, `mq3.compat.numeric.fadd`, `mq3.compat.numeric.fmul`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — | Record providing `wave.phase`, `wave.frequency`, `wave.func`. |
| `nowMilliseconds` | `dynamic` | — | Input used by `seconds=n.f32(nowMilliseconds*0.001)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L586)

<a id="function-function-mq3-renderer-playable-materials-wavevalue-function-wavevalue-wave-nowmilliseconds-src-mq3-renderer-playable-materials-ml-1671303997"></a>
### waveValue

```ml
function waveValue(wave, nowMilliseconds)
```

Returns `value` from `mq3.renderer.playable_materials.waveValue`; earlier branches return `0.0`, `1.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — | Value forwarded as `wave` to `mq3.renderer.playable_materials.waveSample`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.waveSample`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L618)
