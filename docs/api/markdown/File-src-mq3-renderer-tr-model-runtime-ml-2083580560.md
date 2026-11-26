# `src/mq3/renderer/tr_model_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_model_runtime`](Package-mq3-renderer-tr-model-runtime-1791528778.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/md3.ml` as `md3` → [src/mq3/format/md3.ml](File-src-mq3-format-md3-ml-2098563759.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/renderer/md4_animation.ml` as `animation` → [src/mq3/renderer/md4_animation.ml](File-src-mq3-renderer-md4-animation-ml-17219499.md)
- `mq3/renderer/model_bounds.ml` as `bounds` → [src/mq3/renderer/model_bounds.ml](File-src-mq3-renderer-model-bounds-ml-2002062224.md)
- `mq3/renderer/model_tags.ml` as `tags` → [src/mq3/renderer/model_tags.ml](File-src-mq3-renderer-model-tags-ml-707870696.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-tr-model-runtime-archiveread-function-archiveread-state-name-src-mq3-renderer-tr-model-runtime-ml-1394085674"></a>
### archiveRead

```ml
function archiveRead(state, name)
```

Searches archives in reverse priority order and returns the first readable named asset, or void.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.archives`. |
| `name` | `dynamic` | — | Argument 2 supplied to `mq3.format.pk3.read`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L238)

<a id="function-function-mq3-renderer-tr-model-runtime-createstate-function-createstate-archives-glconfig-src-mq3-renderer-tr-model-runtime-ml-1650506032"></a>
### createState

```ml
function createState(archives, glConfig)
```

Returns `state` from `mq3.renderer.tr_model_runtime.createState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archives` | `dynamic` | — | Value used for `mq3.renderer.tr_model_runtime.State.archives`. |
| `glConfig` | `dynamic` | — | Value used for `mq3.renderer.tr_model_runtime.State.glConfig`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L155)

<a id="function-function-mq3-renderer-tr-model-runtime-emptymodel-function-emptymodel-index-src-mq3-renderer-tr-model-runtime-ml-681070588"></a>
### emptyModel

```ml
function emptyModel(index)
```

Constructs `mq3.renderer.tr_model_runtime.Model` with `name` = `""`, `type` = `MOD_BAD`, `dataSize` = `0`, `brushBounds` = `void` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Initial value for `mq3.renderer.tr_model_runtime.Model.index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L151)

<a id="function-function-mq3-renderer-tr-model-runtime-f32-function-f32-data-offset-src-mq3-renderer-tr-model-runtime-ml-594993873"></a>
### f32

```ml
function f32(data, offset)
```

Returns `n.bitsFloat(value)` from `mq3.renderer.tr_model_runtime.f32`; earlier branches return `fail("truncated float")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.readU32`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.readU32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L134)

<a id="function-function-mq3-renderer-tr-model-runtime-fail-function-fail-text-src-mq3-renderer-tr-model-runtime-ml-1285292971"></a>
### fail

```ml
function fail(text)
```

Creates error `7790` with message `"tr_model: "+text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Input used in the result expression `error(7790,"tr_model: "+text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L126)

<a id="function-function-mq3-renderer-tr-model-runtime-fixedstring-function-fixedstring-data-offset-capacity-src-mq3-renderer-tr-model-runtime-ml-978244249"></a>
### fixedString

```ml
function fixedString(data, offset, capacity)
```

Returns `decode(slice(data,offset,length))` from `mq3.renderer.tr_model_runtime.fixedString`; earlier branches return `check`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 supplied to `slice`. |
| `offset` | `dynamic` | — | Value forwarded as `offset` to `mq3.renderer.tr_model_runtime.span`. |
| `capacity` | `dynamic` | — | Value forwarded as `size` to `mq3.renderer.tr_model_runtime.span`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L148)

<a id="function-function-mq3-renderer-tr-model-runtime-i32-function-i32-data-offset-src-mq3-renderer-tr-model-runtime-ml-2017573435"></a>
### i32

```ml
function i32(data, offset)
```

Returns `value` from `mq3.renderer.tr_model_runtime.i32`; earlier branches return `fail("truncated integer")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.readI32`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.readI32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L130)

<a id="function-function-mq3-renderer-tr-model-runtime-lodname-function-lodname-name-lod-src-mq3-renderer-tr-model-runtime-ml-1774574810"></a>
### lodName

```ml
function lodName(name, lod)
```

Returns `decode(slice(raw,0,dot))+"_"+str(lod)+".md3"` from `mq3.renderer.tr_model_runtime.lodName`; earlier branches return `name`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Argument 1 supplied to `bytes`. |
| `lod` | `dynamic` | — | Input tested by `lod==0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L246)

<a id="constant-constant-mq3-renderer-tr-model-runtime-max-mod-known-const-max-mod-known-1024-src-mq3-renderer-tr-model-runtime-ml-226841584"></a>
### MAX_MOD_KNOWN

```ml
const MAX_MOD_KNOWN = 1024
```

Maximum number of model records retained in the renderer's known-model table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L23)

<a id="constant-constant-mq3-renderer-tr-model-runtime-max-qpath-const-max-qpath-64-src-mq3-renderer-tr-model-runtime-ml-1378982775"></a>
### MAX_QPATH

```ml
const MAX_QPATH = 64
```

Capacity of a Quake virtual-path buffer, including the terminating byte in the native ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L25)

<a id="constant-constant-mq3-renderer-tr-model-runtime-md3-max-lods-const-md3-max-lods-3-src-mq3-renderer-tr-model-runtime-ml-423894576"></a>
### MD3_MAX_LODS

```ml
const MD3_MAX_LODS = 3
```

Maximum number of MD3 level-of-detail variants loaded for one model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L27)

<a id="constant-constant-mq3-renderer-tr-model-runtime-md4-ident-const-md4-ident-877675593-src-mq3-renderer-tr-model-runtime-ml-1803900768"></a>
### MD4_IDENT

```ml
const MD4_IDENT = 877675593
```

Magic identifier expected at the start of an MD4 model file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L29)

<a id="constant-constant-mq3-renderer-tr-model-runtime-md4-max-bones-const-md4-max-bones-128-src-mq3-renderer-tr-model-runtime-ml-1710204202"></a>
### MD4_MAX_BONES

```ml
const MD4_MAX_BONES = 128
```

Maximum number of bones accepted by the MD4 skeletal model loader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L33)

<a id="constant-constant-mq3-renderer-tr-model-runtime-md4-version-const-md4-version-1-src-mq3-renderer-tr-model-runtime-ml-1187460012"></a>
### MD4_VERSION

```ml
const MD4_VERSION = 1
```

MD4 binary format version accepted by the model loader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L31)

- [mq3.renderer.tr_model_runtime.Md4Lod](Type-mq3-renderer-tr-model-runtime-md4lod-1063644678.md) — struct
- [mq3.renderer.tr_model_runtime.Md4Model](Type-mq3-renderer-tr-model-runtime-md4model-99542448.md) — struct
<a id="constant-constant-mq3-renderer-tr-model-runtime-mod-bad-const-mod-bad-0-src-mq3-renderer-tr-model-runtime-ml-2063118401"></a>
### MOD_BAD

```ml
const MOD_BAD = 0
```

Model-type sentinel identifying a missing or invalid model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L15)

<a id="constant-constant-mq3-renderer-tr-model-runtime-mod-brush-const-mod-brush-1-src-mq3-renderer-tr-model-runtime-ml-152279992"></a>
### MOD_BRUSH

```ml
const MOD_BRUSH = 1
```

Model type for an inline BSP brush model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L17)

<a id="constant-constant-mq3-renderer-tr-model-runtime-mod-md4-const-mod-md4-3-src-mq3-renderer-tr-model-runtime-ml-1419309498"></a>
### MOD_MD4

```ml
const MOD_MD4 = 3
```

Model type for an MD4 skeletal model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L21)

<a id="constant-constant-mq3-renderer-tr-model-runtime-mod-mesh-const-mod-mesh-2-src-mq3-renderer-tr-model-runtime-ml-706497921"></a>
### MOD_MESH

```ml
const MOD_MESH = 2
```

Model type for an MD3 mesh model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L19)

- [mq3.renderer.tr_model_runtime.Model](Type-mq3-renderer-tr-model-runtime-model-641358649.md) — struct
- [mq3.renderer.tr_model_runtime.ModelList](Type-mq3-renderer-tr-model-runtime-modellist-1667031141.md) — struct
- [mq3.renderer.tr_model_runtime.ModelListEntry](Type-mq3-renderer-tr-model-runtime-modellistentry-1437073171.md) — struct
<a id="function-function-mq3-renderer-tr-model-runtime-normalizesurfacenames-function-normalizesurfacenames-value-src-mq3-renderer-tr-model-runtime-ml-1508166313"></a>
### normalizeSurfaceNames

```ml
function normalizeSurfaceNames(value)
```

Calls `mq3.format.md3.normalizeSurfaceNames` with `(value)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 supplied to `mq3.format.md3.normalizeSurfaceNames`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L179)

<a id="function-function-mq3-renderer-tr-model-runtime-r-allocmodel-function-r-allocmodel-state-src-mq3-renderer-tr-model-runtime-ml-1248852409"></a>
### R_AllocModel

```ml
function R_AllocModel(state)
```

Updates `state.models`, `state.numModels` in `mq3.renderer.tr_model_runtime.R_AllocModel`; returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.models`, `state.numModels`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L159)

<a id="function-function-mq3-renderer-tr-model-runtime-r-getmodelbyhandle-function-r-getmodelbyhandle-state-index-src-mq3-renderer-tr-model-runtime-ml-2049658579"></a>
### R_GetModelByHandle

```ml
function R_GetModelByHandle(state, index)
```

Returns `state.models[index]` from `mq3.renderer.tr_model_runtime.R_GetModelByHandle`; earlier branches return `void`, `state.models[0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.numModels`, `state.models`. |
| `index` | `dynamic` | — | Input tested by `index<1 or index>=state.numModels`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L166)

<a id="function-function-mq3-renderer-tr-model-runtime-r-gettag-function-r-gettag-model-frame-tagname-src-mq3-renderer-tr-model-runtime-ml-1158904073"></a>
### R_GetTag

```ml
function R_GetTag(model, frame, tagName)
```

Returns `tags.getTag(tagModel(model.md3[0]),frame,tagName)` from `mq3.renderer.tr_model_runtime.R_GetTag`; earlier branches return `void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Record providing `model.md3`. |
| `frame` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.model_tags.getTag`. |
| `tagName` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.model_tags.getTag`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L278)

<a id="function-function-mq3-renderer-tr-model-runtime-r-lerptag-function-r-lerptag-state-handle-startframe-endframe-frac-tagname-src-mq3-renderer-tr-model-runtime-ml-1151775023"></a>
### R_LerpTag

```ml
function R_LerpTag(state, handle, startFrame, endFrame, frac, tagName)
```

Returns `tags.lerpTag(tags.model(void,tagModel(model.md3[0])),startFrame,endFrame,frac,tagName)` from `mq3.renderer.tr_model_runtime.R_LerpTag`; earlier branches return `tags.missingOrientation()`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.tr_model_runtime.R_GetModelByHandle`. |
| `handle` | `dynamic` | — | Value forwarded as `index` to `mq3.renderer.tr_model_runtime.R_GetModelByHandle`. |
| `startFrame` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.model_tags.lerpTag`. |
| `endFrame` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.model_tags.lerpTag`. |
| `frac` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.model_tags.lerpTag`. |
| `tagName` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.model_tags.lerpTag`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L286)

<a id="function-function-mq3-renderer-tr-model-runtime-r-loadmd3-function-r-loadmd3-model-lod-data-name-src-mq3-renderer-tr-model-runtime-ml-1598138129"></a>
### R_LoadMD3

```ml
function R_LoadMD3(model, lod, data, name)
```

Updates `model.type`, `model.md3[lod]`, `model.dataSize` in `mq3.renderer.tr_model_runtime.R_LoadMD3`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Mutable record or buffer; this call updates `model.type`, `model.md3[lod]`, `model.dataSize`. |
| `lod` | `dynamic` | — | Input tested by `model==void or lod<0 or lod>=MD3_MAX_LODS`. |
| `data` | `dynamic` | — | Argument 1 supplied to `mq3.format.md3.load`. |
| `name` | `dynamic` | — | Input tested by `surface.mesh.numVerts>SHADER_MAX_VERTEXES`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L185)

<a id="function-function-mq3-renderer-tr-model-runtime-r-loadmd4-function-r-loadmd4-model-data-name-src-mq3-renderer-tr-model-runtime-ml-548600902"></a>
### R_LoadMD4

```ml
function R_LoadMD4(model, data, name)
```

Updates `model.type`, `model.md4`, `model.dataSize` in `mq3.renderer.tr_model_runtime.R_LoadMD4`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Mutable record or buffer; this call updates `model.type`, `model.md4`, `model.dataSize`. |
| `data` | `dynamic` | — | Value forwarded as `data` to `mq3.renderer.tr_model_runtime.i32`. |
| `name` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L199)

<a id="function-function-mq3-renderer-tr-model-runtime-r-modelbounds-function-r-modelbounds-state-handle-src-mq3-renderer-tr-model-runtime-ml-282765185"></a>
### R_ModelBounds

```ml
function R_ModelBounds(state, handle)
```

Computes `R_ModelBounds` from `bounds.md3(model.md3[0])` using `mq3.renderer.tr_model_runtime.R_GetModelByHandle`, `mq3.renderer.model_tags.modelBounds`, `mq3.renderer.model_tags.model`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.tr_model_runtime.R_GetModelByHandle`. |
| `handle` | `dynamic` | — | Value forwarded as `index` to `mq3.renderer.tr_model_runtime.R_GetModelByHandle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L292)

<a id="function-function-mq3-renderer-tr-model-runtime-r-modelinit-function-r-modelinit-state-src-mq3-renderer-tr-model-runtime-ml-351969861"></a>
### R_ModelInit

```ml
function R_ModelInit(state)
```

Updates `state.models`, `state.numModels` in `mq3.renderer.tr_model_runtime.R_ModelInit`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.models`, `state.numModels`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L172)

<a id="function-function-mq3-renderer-tr-model-runtime-r-modellist-f-function-r-modellist-f-state-src-mq3-renderer-tr-model-runtime-ml-1128204391"></a>
### R_Modellist_f

```ml
function R_Modellist_f(state)
```

Builds `mq3.renderer.tr_model_runtime.ModelList` for `mq3.renderer.tr_model_runtime.R_Modellist_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.numModels`, `state.models`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L298)

<a id="function-function-mq3-renderer-tr-model-runtime-re-beginregistration-function-re-beginregistration-state-src-mq3-renderer-tr-model-runtime-ml-479505829"></a>
### RE_BeginRegistration

```ml
function RE_BeginRegistration(state)
```

Updates `state.initCount`, `state.syncCount`, `state.viewCluster`, `state.flareClears`, `state.sceneClears` in `mq3.renderer.tr_model_runtime.RE_BeginRegistration`; returns `state.glConfig`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.initCount`, `state.syncCount`, `state.viewCluster`, `state.flareClears`, `state.sceneClears`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L303)

<a id="function-function-mq3-renderer-tr-model-runtime-re-registermodel-function-re-registermodel-state-name-src-mq3-renderer-tr-model-runtime-ml-2137178506"></a>
### RE_RegisterModel

```ml
function RE_RegisterModel(state, name)
```

Builds `model.name`, `model.numLods`, `model.type`, `model.md3[lod]` in `mq3.renderer.tr_model_runtime.RE_RegisterModel`; returns `model.index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.numModels`, `state.models`. |
| `name` | `dynamic` | — | Value assigned to `model.name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L252)

<a id="constant-constant-mq3-renderer-tr-model-runtime-shader-max-indexes-const-shader-max-indexes-6000-src-mq3-renderer-tr-model-runtime-ml-1667877655"></a>
### SHADER_MAX_INDEXES

```ml
const SHADER_MAX_INDEXES = 6000
```

Index capacity of the renderer's shared tessellation buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L37)

<a id="constant-constant-mq3-renderer-tr-model-runtime-shader-max-vertexes-const-shader-max-vertexes-1000-src-mq3-renderer-tr-model-runtime-ml-1377696154"></a>
### SHADER_MAX_VERTEXES

```ml
const SHADER_MAX_VERTEXES = 1000
```

Vertex capacity of the renderer's shared tessellation buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L35)

<a id="function-function-mq3-renderer-tr-model-runtime-span-function-span-offset-size-limit-src-mq3-renderer-tr-model-runtime-ml-810523241"></a>
### span

```ml
function span(offset, size, limit)
```

Returns `true` from `mq3.renderer.tr_model_runtime.span`; earlier branches return `fail("section outside model")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `offset` | `dynamic` | — | Input tested by `offset<0 or size<0 or offset>limit or size>limit-offset`. |
| `size` | `dynamic` | — | Input tested by `offset<0 or size<0 or offset>limit or size>limit-offset`. |
| `limit` | `dynamic` | — | Input tested by `offset<0 or size<0 or offset>limit or size>limit-offset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L143)

- [mq3.renderer.tr_model_runtime.State](Type-mq3-renderer-tr-model-runtime-state-92073329.md) — struct
<a id="function-function-mq3-renderer-tr-model-runtime-tagmodel-function-tagmodel-value-src-mq3-renderer-tr-model-runtime-ml-1642014205"></a>
### tagModel

```ml
function tagModel(value)
```

Computes `tagModel` from `tags.md3(frames,first[0],first[1])` using `mq3.renderer.model_tags.tag`, `mq3.renderer.model_bounds.md3`, `mq3.renderer.model_tags.md3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.tags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L270)

<a id="function-function-mq3-renderer-tr-model-runtime-vec3-function-vec3-data-offset-src-mq3-renderer-tr-model-runtime-ml-1689283319"></a>
### vec3

```ml
function vec3(data, offset)
```

Returns `[f32(data,offset),f32(data,offset+4),f32(data,offset+8)]` for `mq3.renderer.tr_model_runtime.vec3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value forwarded as `data` to `mq3.renderer.tr_model_runtime.f32`. |
| `offset` | `dynamic` | — | Value forwarded as `offset` to `mq3.renderer.tr_model_runtime.f32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L138)
