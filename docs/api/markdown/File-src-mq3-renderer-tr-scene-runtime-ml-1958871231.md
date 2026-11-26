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

Builds `mq3.renderer.tr_scene_runtime.State` for `mq3.renderer.tr_scene_runtime.create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sceneState` | `dynamic` | — | Initial value for `mq3.renderer.tr_scene_runtime.State.scene`. |
| `vidHeight` | `dynamic` | — | Initial value for `mq3.renderer.tr_scene_runtime.State.vidHeight`. |
| `host` | `dynamic` | — | Initial value for `mq3.renderer.tr_scene_runtime.State.services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L165)

<a id="function-function-mq3-renderer-tr-scene-runtime-emit-function-emit-state-kind-value-src-mq3-renderer-tr-scene-runtime-ml-1339091762"></a>
### emit

```ml
function emit(state, kind, value)
```

Forwards a renderer-scene event through the configured event service callback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.services`. |
| `kind` | `dynamic` | — | Argument 2 supplied to `state.services.eventFn`. |
| `value` | `dynamic` | — | Argument 3 supplied to `state.services.eventFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L177)

<a id="function-function-mq3-renderer-tr-scene-runtime-emptyrefdef-function-emptyrefdef-src-mq3-renderer-tr-scene-runtime-ml-926251548"></a>
### emptyRefdef

```ml
function emptyRefdef()
```

Constructs `mq3.renderer.tr_scene_runtime.Refdef` with `x` = `0`, `y` = `0`, `width` = `0`, `height` = `0` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L160)

<a id="constant-constant-mq3-renderer-tr-scene-runtime-entitynum-world-const-entitynum-world-1022-src-mq3-renderer-tr-scene-runtime-ml-984245788"></a>
### ENTITYNUM_WORLD

```ml
const ENTITYNUM_WORLD = 1022
```

Reserved entity number identifying static world geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L11)

<a id="function-function-mq3-renderer-tr-scene-runtime-fail-function-fail-message-src-mq3-renderer-tr-scene-runtime-ml-1100739555"></a>
### fail

```ml
function fail(message)
```

Creates error `7750` with message `"tr_scene: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7750,"tr_scene: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L172)

<a id="function-function-mq3-renderer-tr-scene-runtime-maskchanged-function-maskchanged-previous-current-src-mq3-renderer-tr-scene-runtime-ml-2026347282"></a>
### maskChanged

```ml
function maskChanged(previous, current)
```

Returns `false` from `mq3.renderer.tr_scene_runtime.maskChanged`; earlier branches return `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `previous` | `dynamic` | — | Indexed input read at `index`. |
| `current` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L248)

<a id="function-function-mq3-renderer-tr-scene-runtime-now-function-now-state-src-mq3-renderer-tr-scene-runtime-ml-1678427937"></a>
### now

```ml
function now(state)
```

Returns `0` from `mq3.renderer.tr_scene_runtime.now`; earlier branches return `state.services.timeFn(state.services.context)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L180)

<a id="function-function-mq3-renderer-tr-scene-runtime-r-addpolygonsurfaces-function-r-addpolygonsurfaces-state-src-mq3-renderer-tr-scene-runtime-ml-962268889"></a>
### R_AddPolygonSurfaces

```ml
function R_AddPolygonSurfaces(state)
```

Updates `state.firstSceneDrawSurf` in `mq3.renderer.tr_scene_runtime.R_AddPolygonSurfaces`; returns `added`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.firstSceneDrawSurf`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L234)

<a id="function-function-mq3-renderer-tr-scene-runtime-r-togglesmpframe-function-r-togglesmpframe-state-src-mq3-renderer-tr-scene-runtime-ml-1973463729"></a>
### R_ToggleSmpFrame

```ml
function R_ToggleSmpFrame(state)
```

Updates `state.smpFrame`, `state.commandUsed[state.smpFrame]`, `state.firstSceneDrawSurf` in `mq3.renderer.tr_scene_runtime.R_ToggleSmpFrame`; returns `state.smpFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.smpFrame`, `state.commandUsed[state.smpFrame]`, `state.firstSceneDrawSurf`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L184)

<a id="constant-constant-mq3-renderer-tr-scene-runtime-rdf-noworldmodel-const-rdf-noworldmodel-1-src-mq3-renderer-tr-scene-runtime-ml-983085148"></a>
### RDF_NOWORLDMODEL

```ml
const RDF_NOWORLDMODEL = 1
```

View flag that renders submitted entities without the BSP world model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L9)

<a id="function-function-mq3-renderer-tr-scene-runtime-re-addadditivelighttoscene-function-re-addadditivelighttoscene-state-origin-intensity-r-g-b-src-mq3-renderer-tr-scene-runtime-ml-610331555"></a>
### RE_AddAdditiveLightToScene

```ml
function RE_AddAdditiveLightToScene(state, origin, intensity, r, g, b)
```

Calls `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene` with `(state,origin,intensity,r,g,b,true)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`. |
| `origin` | `dynamic` | — | Value forwarded as `origin` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`. |
| `intensity` | `dynamic` | — | Value forwarded as `intensity` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`. |
| `r` | `dynamic` | — | Value forwarded as `r` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`. |
| `g` | `dynamic` | — | Value forwarded as `g` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`. |
| `b` | `dynamic` | — | Value forwarded as `b` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L230)

<a id="function-function-mq3-renderer-tr-scene-runtime-re-adddynamiclighttoscene-function-re-adddynamiclighttoscene-state-origin-intensity-r-g-b-additive-src-mq3-renderer-tr-scene-runtime-ml-596355989"></a>
### RE_AddDynamicLightToScene

```ml
function RE_AddDynamicLightToScene(state, origin, intensity, r, g, b, additive)
```

Returns `queue.addDynamicLight(state.scene,origin,intensity,r,g,b,additive)` from `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`; earlier branches return `fail("missing state")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.scene`. |
| `origin` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.scene_queue.addDynamicLight`. |
| `intensity` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.scene_queue.addDynamicLight`. |
| `r` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.scene_queue.addDynamicLight`. |
| `g` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.scene_queue.addDynamicLight`. |
| `b` | `dynamic` | — | Argument 6 supplied to `mq3.renderer.scene_queue.addDynamicLight`. |
| `additive` | `dynamic` | — | Argument 7 supplied to `mq3.renderer.scene_queue.addDynamicLight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L214)

<a id="function-function-mq3-renderer-tr-scene-runtime-re-addlighttoscene-function-re-addlighttoscene-state-origin-intensity-r-g-b-src-mq3-renderer-tr-scene-runtime-ml-1273727099"></a>
### RE_AddLightToScene

```ml
function RE_AddLightToScene(state, origin, intensity, r, g, b)
```

Calls `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene` with `(state,origin,intensity,r,g,b,false)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`. |
| `origin` | `dynamic` | — | Value forwarded as `origin` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`. |
| `intensity` | `dynamic` | — | Value forwarded as `intensity` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`. |
| `r` | `dynamic` | — | Value forwarded as `r` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`. |
| `g` | `dynamic` | — | Value forwarded as `g` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`. |
| `b` | `dynamic` | — | Value forwarded as `b` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L222)

<a id="function-function-mq3-renderer-tr-scene-runtime-re-addpolytoscene-function-re-addpolytoscene-state-hshader-numverts-verts-numpolys-src-mq3-renderer-tr-scene-runtime-ml-25096381"></a>
### RE_AddPolyToScene

```ml
function RE_AddPolyToScene(state, hShader, numVerts, verts, numPolys)
```

Returns `queue.addPolys(state.scene,hShader,numVerts,verts,numPolys)` from `mq3.renderer.tr_scene_runtime.RE_AddPolyToScene`; earlier branches return `fail("missing state")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.scene`. |
| `hShader` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.scene_queue.addPolys`. |
| `numVerts` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.scene_queue.addPolys`. |
| `verts` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.scene_queue.addPolys`. |
| `numPolys` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.scene_queue.addPolys`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L198)

<a id="function-function-mq3-renderer-tr-scene-runtime-re-addrefentitytoscene-function-re-addrefentitytoscene-state-entity-src-mq3-renderer-tr-scene-runtime-ml-1456666138"></a>
### RE_AddRefEntityToScene

```ml
function RE_AddRefEntityToScene(state, entity)
```

Returns `queue.addEntity(state.scene,entity.reType,entity.payload)` from `mq3.renderer.tr_scene_runtime.RE_AddRefEntityToScene`; earlier branches return `fail("missing state or entity")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.scene`. |
| `entity` | `dynamic` | — | Record providing `entity.reType`, `entity.payload`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L202)

<a id="function-function-mq3-renderer-tr-scene-runtime-re-clearscene-function-re-clearscene-state-src-mq3-renderer-tr-scene-runtime-ml-64809739"></a>
### RE_ClearScene

```ml
function RE_ClearScene(state)
```

Returns `void` from `mq3.renderer.tr_scene_runtime.RE_ClearScene`; earlier branches return `fail("missing state")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.scene`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L191)

<a id="function-function-mq3-renderer-tr-scene-runtime-re-renderscene-function-re-renderscene-state-input-src-mq3-renderer-tr-scene-runtime-ml-122590105"></a>
### RE_RenderScene

```ml
function RE_RenderScene(state, input)
```

Updates `state.areaMask`, `state.refdef`, `state.frameSceneNum`, `state.sceneCount`, `state.firstSceneDrawSurf` in `mq3.renderer.tr_scene_runtime.RE_RenderScene`; returns `parms`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.areaMask`, `state.refdef`, `state.frameSceneNum`, `state.sceneCount`, `state.firstSceneDrawSurf`. |
| `input` | `dynamic` | — | Record providing `input.rdflags`, `input.areamask`, `input.x`, `input.y`, `input.width`, `input.height`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L256)

- [mq3.renderer.tr_scene_runtime.Refdef](Type-mq3-renderer-tr-scene-runtime-refdef-947831467.md) — struct
- [mq3.renderer.tr_scene_runtime.RefdefInput](Type-mq3-renderer-tr-scene-runtime-refdefinput-515794905.md) — struct
<a id="function-function-mq3-renderer-tr-scene-runtime-services-function-services-src-mq3-renderer-tr-scene-runtime-ml-468989026"></a>
### services

```ml
function services()
```

Constructs `mq3.renderer.tr_scene_runtime.Services` with `timeFn` = `void`, `renderViewFn` = `void`, `drawSurfFn` = `void`, `shaderFn` = `void` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L158)

- [mq3.renderer.tr_scene_runtime.Services](Type-mq3-renderer-tr-scene-runtime-services-956693799.md) — struct
- [mq3.renderer.tr_scene_runtime.State](Type-mq3-renderer-tr-scene-runtime-state-1258614764.md) — struct
- [mq3.renderer.tr_scene_runtime.ViewParms](Type-mq3-renderer-tr-scene-runtime-viewparms-353442333.md) — struct
