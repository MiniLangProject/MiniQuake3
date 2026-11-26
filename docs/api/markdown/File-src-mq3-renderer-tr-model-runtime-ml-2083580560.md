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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L103)

<a id="function-function-mq3-renderer-tr-model-runtime-createstate-function-createstate-archives-glconfig-src-mq3-renderer-tr-model-runtime-ml-1650506032"></a>
### createState

```ml
function createState(archives, glConfig)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archives` | `dynamic` | — |  |
| `glConfig` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L41)

<a id="function-function-mq3-renderer-tr-model-runtime-emptymodel-function-emptymodel-index-src-mq3-renderer-tr-model-runtime-ml-681070588"></a>
### emptyModel

```ml
function emptyModel(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L40)

<a id="function-function-mq3-renderer-tr-model-runtime-f32-function-f32-data-offset-src-mq3-renderer-tr-model-runtime-ml-594993873"></a>
### f32

```ml
function f32(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L36)

<a id="function-function-mq3-renderer-tr-model-runtime-fail-function-fail-text-src-mq3-renderer-tr-model-runtime-ml-1285292971"></a>
### fail

```ml
function fail(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L34)

<a id="function-function-mq3-renderer-tr-model-runtime-fixedstring-function-fixedstring-data-offset-capacity-src-mq3-renderer-tr-model-runtime-ml-978244249"></a>
### fixedString

```ml
function fixedString(data, offset, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L39)

<a id="function-function-mq3-renderer-tr-model-runtime-i32-function-i32-data-offset-src-mq3-renderer-tr-model-runtime-ml-2017573435"></a>
### i32

```ml
function i32(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L35)

<a id="function-function-mq3-renderer-tr-model-runtime-lodname-function-lodname-name-lod-src-mq3-renderer-tr-model-runtime-ml-1774574810"></a>
### lodName

```ml
function lodName(name, lod)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `lod` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L108)

<a id="constant-constant-mq3-renderer-tr-model-runtime-max-mod-known-const-max-mod-known-1024-src-mq3-renderer-tr-model-runtime-ml-226841584"></a>
### MAX_MOD_KNOWN

```ml
const MAX_MOD_KNOWN = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L18)

<a id="constant-constant-mq3-renderer-tr-model-runtime-max-qpath-const-max-qpath-64-src-mq3-renderer-tr-model-runtime-ml-1378982775"></a>
### MAX_QPATH

```ml
const MAX_QPATH = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L19)

<a id="constant-constant-mq3-renderer-tr-model-runtime-md3-max-lods-const-md3-max-lods-3-src-mq3-renderer-tr-model-runtime-ml-423894576"></a>
### MD3_MAX_LODS

```ml
const MD3_MAX_LODS = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L20)

<a id="constant-constant-mq3-renderer-tr-model-runtime-md4-ident-const-md4-ident-877675593-src-mq3-renderer-tr-model-runtime-ml-1803900768"></a>
### MD4_IDENT

```ml
const MD4_IDENT = 877675593
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L21)

<a id="constant-constant-mq3-renderer-tr-model-runtime-md4-max-bones-const-md4-max-bones-128-src-mq3-renderer-tr-model-runtime-ml-1710204202"></a>
### MD4_MAX_BONES

```ml
const MD4_MAX_BONES = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L23)

<a id="constant-constant-mq3-renderer-tr-model-runtime-md4-version-const-md4-version-1-src-mq3-renderer-tr-model-runtime-ml-1187460012"></a>
### MD4_VERSION

```ml
const MD4_VERSION = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L22)

- [mq3.renderer.tr_model_runtime.Md4Lod](Type-mq3-renderer-tr-model-runtime-md4lod-1063644678.md) — struct
- [mq3.renderer.tr_model_runtime.Md4Model](Type-mq3-renderer-tr-model-runtime-md4model-99542448.md) — struct
<a id="constant-constant-mq3-renderer-tr-model-runtime-mod-bad-const-mod-bad-0-src-mq3-renderer-tr-model-runtime-ml-2063118401"></a>
### MOD_BAD

```ml
const MOD_BAD = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L14)

<a id="constant-constant-mq3-renderer-tr-model-runtime-mod-brush-const-mod-brush-1-src-mq3-renderer-tr-model-runtime-ml-152279992"></a>
### MOD_BRUSH

```ml
const MOD_BRUSH = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L15)

<a id="constant-constant-mq3-renderer-tr-model-runtime-mod-md4-const-mod-md4-3-src-mq3-renderer-tr-model-runtime-ml-1419309498"></a>
### MOD_MD4

```ml
const MOD_MD4 = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L17)

<a id="constant-constant-mq3-renderer-tr-model-runtime-mod-mesh-const-mod-mesh-2-src-mq3-renderer-tr-model-runtime-ml-706497921"></a>
### MOD_MESH

```ml
const MOD_MESH = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L16)

- [mq3.renderer.tr_model_runtime.Model](Type-mq3-renderer-tr-model-runtime-model-641358649.md) — struct
- [mq3.renderer.tr_model_runtime.ModelList](Type-mq3-renderer-tr-model-runtime-modellist-1667031141.md) — struct
- [mq3.renderer.tr_model_runtime.ModelListEntry](Type-mq3-renderer-tr-model-runtime-modellistentry-1437073171.md) — struct
<a id="function-function-mq3-renderer-tr-model-runtime-normalizesurfacenames-function-normalizesurfacenames-value-src-mq3-renderer-tr-model-runtime-ml-1508166313"></a>
### normalizeSurfaceNames

```ml
function normalizeSurfaceNames(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L56)

<a id="function-function-mq3-renderer-tr-model-runtime-r-allocmodel-function-r-allocmodel-state-src-mq3-renderer-tr-model-runtime-ml-1248852409"></a>
### R_AllocModel

```ml
function R_AllocModel(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L43)

<a id="function-function-mq3-renderer-tr-model-runtime-r-getmodelbyhandle-function-r-getmodelbyhandle-state-index-src-mq3-renderer-tr-model-runtime-ml-2049658579"></a>
### R_GetModelByHandle

```ml
function R_GetModelByHandle(state, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L47)

<a id="function-function-mq3-renderer-tr-model-runtime-r-gettag-function-r-gettag-model-frame-tagname-src-mq3-renderer-tr-model-runtime-ml-1158904073"></a>
### R_GetTag

```ml
function R_GetTag(model, frame, tagName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `tagName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L131)

<a id="function-function-mq3-renderer-tr-model-runtime-r-lerptag-function-r-lerptag-state-handle-startframe-endframe-frac-tagname-src-mq3-renderer-tr-model-runtime-ml-1151775023"></a>
### R_LerpTag

```ml
function R_LerpTag(state, handle, startFrame, endFrame, frac, tagName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `startFrame` | `dynamic` | — |  |
| `endFrame` | `dynamic` | — |  |
| `frac` | `dynamic` | — |  |
| `tagName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L132)

<a id="function-function-mq3-renderer-tr-model-runtime-r-loadmd3-function-r-loadmd3-model-lod-data-name-src-mq3-renderer-tr-model-runtime-ml-1598138129"></a>
### R_LoadMD3

```ml
function R_LoadMD3(model, lod, data, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |
| `lod` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L57)

<a id="function-function-mq3-renderer-tr-model-runtime-r-loadmd4-function-r-loadmd4-model-data-name-src-mq3-renderer-tr-model-runtime-ml-548600902"></a>
### R_LoadMD4

```ml
function R_LoadMD4(model, data, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L67)

<a id="function-function-mq3-renderer-tr-model-runtime-r-modelbounds-function-r-modelbounds-state-handle-src-mq3-renderer-tr-model-runtime-ml-282765185"></a>
### R_ModelBounds

```ml
function R_ModelBounds(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L135)

<a id="function-function-mq3-renderer-tr-model-runtime-r-modelinit-function-r-modelinit-state-src-mq3-renderer-tr-model-runtime-ml-351969861"></a>
### R_ModelInit

```ml
function R_ModelInit(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L51)

<a id="function-function-mq3-renderer-tr-model-runtime-r-modellist-f-function-r-modellist-f-state-src-mq3-renderer-tr-model-runtime-ml-1128204391"></a>
### R_Modellist_f

```ml
function R_Modellist_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L139)

<a id="function-function-mq3-renderer-tr-model-runtime-re-beginregistration-function-re-beginregistration-state-src-mq3-renderer-tr-model-runtime-ml-479505829"></a>
### RE_BeginRegistration

```ml
function RE_BeginRegistration(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L142)

<a id="function-function-mq3-renderer-tr-model-runtime-re-registermodel-function-re-registermodel-state-name-src-mq3-renderer-tr-model-runtime-ml-2137178506"></a>
### RE_RegisterModel

```ml
function RE_RegisterModel(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L111)

<a id="constant-constant-mq3-renderer-tr-model-runtime-shader-max-indexes-const-shader-max-indexes-6000-src-mq3-renderer-tr-model-runtime-ml-1667877655"></a>
### SHADER_MAX_INDEXES

```ml
const SHADER_MAX_INDEXES = 6000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L25)

<a id="constant-constant-mq3-renderer-tr-model-runtime-shader-max-vertexes-const-shader-max-vertexes-1000-src-mq3-renderer-tr-model-runtime-ml-1377696154"></a>
### SHADER_MAX_VERTEXES

```ml
const SHADER_MAX_VERTEXES = 1000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L24)

<a id="function-function-mq3-renderer-tr-model-runtime-span-function-span-offset-size-limit-src-mq3-renderer-tr-model-runtime-ml-810523241"></a>
### span

```ml
function span(offset, size, limit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `offset` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L38)

- [mq3.renderer.tr_model_runtime.State](Type-mq3-renderer-tr-model-runtime-state-92073329.md) — struct
<a id="function-function-mq3-renderer-tr-model-runtime-tagmodel-function-tagmodel-value-src-mq3-renderer-tr-model-runtime-ml-1642014205"></a>
### tagModel

```ml
function tagModel(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L127)

<a id="function-function-mq3-renderer-tr-model-runtime-vec3-function-vec3-data-offset-src-mq3-renderer-tr-model-runtime-ml-1689283319"></a>
### vec3

```ml
function vec3(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L37)
