# `src/mq3/renderer/tr_scene_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_scene_runtime`](Package-mq3-renderer-tr-scene-runtime-730567527.md)

Reachable from entry: **no**

## Imports

- `mq3/renderer/scene_queue.ml` as `queue` → [src/mq3/renderer/scene_queue.ml](File-src-mq3-renderer-scene-queue-ml-703423413.md)

## Declarations

<a id="function-function-mq3-renderer-tr-scene-runtime-create-function-create-scenestate-vidheight-host-src-mq3-renderer-tr-scene-runtime-ml-1801619369"></a>
### create

```ml
function create(sceneState, vidHeight, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sceneState` | `dynamic` | — |  |
| `vidHeight` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L19)

<a id="function-function-mq3-renderer-tr-scene-runtime-emit-function-emit-state-kind-value-src-mq3-renderer-tr-scene-runtime-ml-1339091762"></a>
### emit

```ml
function emit(state, kind, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L25)

<a id="function-function-mq3-renderer-tr-scene-runtime-emptyrefdef-function-emptyrefdef-src-mq3-renderer-tr-scene-runtime-ml-926251548"></a>
### emptyRefdef

```ml
function emptyRefdef()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L18)

<a id="constant-constant-mq3-renderer-tr-scene-runtime-entitynum-world-const-entitynum-world-1022-src-mq3-renderer-tr-scene-runtime-ml-984245788"></a>
### ENTITYNUM_WORLD

```ml
const ENTITYNUM_WORLD = 1022
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L9)

<a id="function-function-mq3-renderer-tr-scene-runtime-fail-function-fail-message-src-mq3-renderer-tr-scene-runtime-ml-1100739555"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L24)

<a id="function-function-mq3-renderer-tr-scene-runtime-maskchanged-function-maskchanged-previous-current-src-mq3-renderer-tr-scene-runtime-ml-2026347282"></a>
### maskChanged

```ml
function maskChanged(previous, current)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `previous` | `dynamic` | — |  |
| `current` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L54)

<a id="function-function-mq3-renderer-tr-scene-runtime-now-function-now-state-src-mq3-renderer-tr-scene-runtime-ml-1678427937"></a>
### now

```ml
function now(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L26)

<a id="function-function-mq3-renderer-tr-scene-runtime-r-addpolygonsurfaces-function-r-addpolygonsurfaces-state-src-mq3-renderer-tr-scene-runtime-ml-962268889"></a>
### R_AddPolygonSurfaces

```ml
function R_AddPolygonSurfaces(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L43)

<a id="function-function-mq3-renderer-tr-scene-runtime-r-togglesmpframe-function-r-togglesmpframe-state-src-mq3-renderer-tr-scene-runtime-ml-1973463729"></a>
### R_ToggleSmpFrame

```ml
function R_ToggleSmpFrame(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L28)

<a id="constant-constant-mq3-renderer-tr-scene-runtime-rdf-noworldmodel-const-rdf-noworldmodel-1-src-mq3-renderer-tr-scene-runtime-ml-983085148"></a>
### RDF_NOWORLDMODEL

```ml
const RDF_NOWORLDMODEL = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L8)

<a id="function-function-mq3-renderer-tr-scene-runtime-re-addadditivelighttoscene-function-re-addadditivelighttoscene-state-origin-intensity-r-g-b-src-mq3-renderer-tr-scene-runtime-ml-610331555"></a>
### RE_AddAdditiveLightToScene

```ml
function RE_AddAdditiveLightToScene(state, origin, intensity, r, g, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `intensity` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `g` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L41)

<a id="function-function-mq3-renderer-tr-scene-runtime-re-adddynamiclighttoscene-function-re-adddynamiclighttoscene-state-origin-intensity-r-g-b-additive-src-mq3-renderer-tr-scene-runtime-ml-596355989"></a>
### RE_AddDynamicLightToScene

```ml
function RE_AddDynamicLightToScene(state, origin, intensity, r, g, b, additive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `intensity` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `g` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `additive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L39)

<a id="function-function-mq3-renderer-tr-scene-runtime-re-addlighttoscene-function-re-addlighttoscene-state-origin-intensity-r-g-b-src-mq3-renderer-tr-scene-runtime-ml-1273727099"></a>
### RE_AddLightToScene

```ml
function RE_AddLightToScene(state, origin, intensity, r, g, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `intensity` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `g` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L40)

<a id="function-function-mq3-renderer-tr-scene-runtime-re-addpolytoscene-function-re-addpolytoscene-state-hshader-numverts-verts-numpolys-src-mq3-renderer-tr-scene-runtime-ml-25096381"></a>
### RE_AddPolyToScene

```ml
function RE_AddPolyToScene(state, hShader, numVerts, verts, numPolys)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `hShader` | `dynamic` | — |  |
| `numVerts` | `dynamic` | — |  |
| `verts` | `dynamic` | — |  |
| `numPolys` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L34)

<a id="function-function-mq3-renderer-tr-scene-runtime-re-addrefentitytoscene-function-re-addrefentitytoscene-state-entity-src-mq3-renderer-tr-scene-runtime-ml-1456666138"></a>
### RE_AddRefEntityToScene

```ml
function RE_AddRefEntityToScene(state, entity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L35)

<a id="function-function-mq3-renderer-tr-scene-runtime-re-clearscene-function-re-clearscene-state-src-mq3-renderer-tr-scene-runtime-ml-64809739"></a>
### RE_ClearScene

```ml
function RE_ClearScene(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L33)

<a id="function-function-mq3-renderer-tr-scene-runtime-re-renderscene-function-re-renderscene-state-input-src-mq3-renderer-tr-scene-runtime-ml-122590105"></a>
### RE_RenderScene

```ml
function RE_RenderScene(state, input)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `input` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L59)

- [mq3.renderer.tr_scene_runtime.Refdef](Type-mq3-renderer-tr-scene-runtime-refdef-947831467.md) — struct
- [mq3.renderer.tr_scene_runtime.RefdefInput](Type-mq3-renderer-tr-scene-runtime-refdefinput-515794905.md) — struct
<a id="function-function-mq3-renderer-tr-scene-runtime-services-function-services-src-mq3-renderer-tr-scene-runtime-ml-468989026"></a>
### services

```ml
function services()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L17)

- [mq3.renderer.tr_scene_runtime.Services](Type-mq3-renderer-tr-scene-runtime-services-956693799.md) — struct
- [mq3.renderer.tr_scene_runtime.State](Type-mq3-renderer-tr-scene-runtime-state-1258614764.md) — struct
- [mq3.renderer.tr_scene_runtime.ViewParms](Type-mq3-renderer-tr-scene-runtime-viewparms-353442333.md) — struct
