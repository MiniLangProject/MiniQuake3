# `src/mq3/renderer/scene_queue.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.scene_queue`](Package-mq3-renderer-scene-queue-970101811.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/tr_types.ml` as `trtypes` → [src/mq3/renderer/tr_types.ml](File-src-mq3-renderer-tr-types-ml-1757535937.md)
- `std/array.ml` as `arrays` → `../MiniLangCompilerML/std/array.ml` — external dependency
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-scene-queue-addadditivelight-function-addadditivelight-state-origin-intensity-r-g-b-src-mq3-renderer-scene-queue-ml-492553969"></a>
### addAdditiveLight

```ml
function addAdditiveLight(state, origin, intensity, r, g, b)
```

Calls `mq3.renderer.scene_queue.addDynamicLight` with `(state,origin,intensity,r,g,b,true)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.scene_queue.addDynamicLight`. |
| `origin` | `dynamic` | — | Value forwarded as `origin` to `mq3.renderer.scene_queue.addDynamicLight`. |
| `intensity` | `dynamic` | — | Value forwarded as `intensity` to `mq3.renderer.scene_queue.addDynamicLight`. |
| `r` | `dynamic` | — | Value forwarded as `r` to `mq3.renderer.scene_queue.addDynamicLight`. |
| `g` | `dynamic` | — | Value forwarded as `g` to `mq3.renderer.scene_queue.addDynamicLight`. |
| `b` | `dynamic` | — | Value forwarded as `b` to `mq3.renderer.scene_queue.addDynamicLight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L296)

<a id="function-function-mq3-renderer-scene-queue-adddynamiclight-function-adddynamiclight-state-origin-intensity-r-g-b-additive-src-mq3-renderer-scene-queue-ml-786351881"></a>
### addDynamicLight

```ml
function addDynamicLight(state, origin, intensity, r, g, b, additive)
```

Queues a positive-intensity dynamic light when registered, within capacity, and allowed by the hardware policy.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.registered`, `state.dlights`, `state.hardwareType`. |
| `origin` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.scene_queue.vector3`. |
| `intensity` | `dynamic` | — | Value used for `mq3.renderer.scene_queue.DLight.radius`. |
| `r` | `dynamic` | — | Input used by `state.dlights.add(DLight(vector3(origin,"light origin"),intensity,[r,g,b],additive))`. |
| `g` | `dynamic` | — | Input used by `state.dlights.add(DLight(vector3(origin,"light origin"),intensity,[r,g,b],additive))`. |
| `b` | `dynamic` | — | Input used by `state.dlights.add(DLight(vector3(origin,"light origin"),intensity,[r,g,b],additive))`. |
| `additive` | `dynamic` | — | Value used for `mq3.renderer.scene_queue.DLight.additive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L276)

<a id="function-function-mq3-renderer-scene-queue-addentity-function-addentity-state-retype-payload-src-mq3-renderer-scene-queue-ml-1584531876"></a>
### addEntity

```ml
function addEntity(state, reType, payload)
```

Appends a validated entity while the scene is registered and entity capacity remains available.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.registered`, `state.entities`. |
| `reType` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.tr_types.validRefEntityType`. |
| `payload` | `dynamic` | — | Value used for `mq3.renderer.scene_queue.RefEntity.payload`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L247)

<a id="function-function-mq3-renderer-scene-queue-addlight-function-addlight-state-origin-intensity-r-g-b-src-mq3-renderer-scene-queue-ml-1117335509"></a>
### addLight

```ml
function addLight(state, origin, intensity, r, g, b)
```

Calls `mq3.renderer.scene_queue.addDynamicLight` with `(state,origin,intensity,r,g,b,false)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.scene_queue.addDynamicLight`. |
| `origin` | `dynamic` | — | Value forwarded as `origin` to `mq3.renderer.scene_queue.addDynamicLight`. |
| `intensity` | `dynamic` | — | Value forwarded as `intensity` to `mq3.renderer.scene_queue.addDynamicLight`. |
| `r` | `dynamic` | — | Value forwarded as `r` to `mq3.renderer.scene_queue.addDynamicLight`. |
| `g` | `dynamic` | — | Value forwarded as `g` to `mq3.renderer.scene_queue.addDynamicLight`. |
| `b` | `dynamic` | — | Value forwarded as `b` to `mq3.renderer.scene_queue.addDynamicLight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L288)

<a id="function-function-mq3-renderer-scene-queue-addpolys-function-addpolys-state-hshader-numverts-vertices-numpolys-src-mq3-renderer-scene-queue-ml-1651337340"></a>
### addPolys

```ml
function addPolys(state, hShader, numVerts, vertices, numPolys)
```

Calls `mq3.renderer.scene_queue.addPolysInternal` with `(state,hShader,numVerts,vertices,numPolys,false)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.scene_queue.addPolysInternal`. |
| `hShader` | `dynamic` | — | Value forwarded as `hShader` to `mq3.renderer.scene_queue.addPolysInternal`. |
| `numVerts` | `dynamic` | — | Value forwarded as `numVerts` to `mq3.renderer.scene_queue.addPolysInternal`. |
| `vertices` | `dynamic` | — | Value forwarded as `vertices` to `mq3.renderer.scene_queue.addPolysInternal`. |
| `numPolys` | `dynamic` | — | Value forwarded as `numPolys` to `mq3.renderer.scene_queue.addPolysInternal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L233)

<a id="function-function-mq3-renderer-scene-queue-addpolysdecoded-function-addpolysdecoded-state-hshader-numverts-vertices-numpolys-src-mq3-renderer-scene-queue-ml-1481041220"></a>
### addPolysDecoded

```ml
function addPolysDecoded(state, hShader, numVerts, vertices, numPolys)
```

The QVM bridge freshly decodes these vertices and transfers ownership to the frame queue. Avoid copying every vector/color a second time.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.scene_queue.addPolysInternal`. |
| `hShader` | `dynamic` | — | Value forwarded as `hShader` to `mq3.renderer.scene_queue.addPolysInternal`. |
| `numVerts` | `dynamic` | — | Value forwarded as `numVerts` to `mq3.renderer.scene_queue.addPolysInternal`. |
| `vertices` | `dynamic` | — | Value forwarded as `vertices` to `mq3.renderer.scene_queue.addPolysInternal`. |
| `numPolys` | `dynamic` | — | Value forwarded as `numPolys` to `mq3.renderer.scene_queue.addPolysInternal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L241)

<a id="function-function-mq3-renderer-scene-queue-addpolysinternal-function-addpolysinternal-state-hshader-numverts-vertices-numpolys-ownedvertices-src-mq3-renderer-scene-queue-ml-23727340"></a>
### addPolysInternal

```ml
function addPolysInternal(state, hShader, numVerts, vertices, numPolys, ownedVertices)
```

Updates `state.numPolyVerts` in `mq3.renderer.scene_queue.addPolysInternal`; returns `added`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.numPolyVerts`. |
| `hShader` | `dynamic` | — | Value used for `mq3.renderer.scene_queue.Poly.hShader`. |
| `numVerts` | `dynamic` | — | Argument 1 supplied to `array`. |
| `vertices` | `dynamic` | — | Indexed input read at `polyIndex*numVerts+index`. |
| `numPolys` | `dynamic` | — | Input tested by `numVerts<=0 or numPolys<0 or len(vertices)<numVerts*numPolys`. |
| `ownedVertices` | `dynamic` | — | Input tested by `not ownedVertices or numPolys!=1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L206)

<a id="function-function-mq3-renderer-scene-queue-clearscene-function-clearscene-state-src-mq3-renderer-scene-queue-ml-1444860491"></a>
### clearScene

```ml
function clearScene(state)
```

Updates `state.firstSceneDlight`, `state.firstSceneEntity`, `state.firstScenePoly` in `mq3.renderer.scene_queue.clearScene`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.firstSceneDlight`, `state.firstSceneEntity`, `state.firstScenePoly`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L181)

<a id="function-function-mq3-renderer-scene-queue-color4-function-color4-value-src-mq3-renderer-scene-queue-ml-1725243383"></a>
### color4

```ml
function color4(value)
```

Returns `[value[0],value[1],value[2],value[3]]` from `mq3.renderer.scene_queue.color4`; earlier branches return `error(3471,"scene queue: invalid vertex color")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L165)

<a id="function-function-mq3-renderer-scene-queue-create-function-create-maxpolys-maxpolyverts-src-mq3-renderer-scene-queue-ml-1481547801"></a>
### create

```ml
function create(maxPolys, maxPolyVerts)
```

Builds `mq3.renderer.scene_queue.State` for `mq3.renderer.scene_queue.create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxPolys` | `dynamic` | — | Initial value for `mq3.renderer.scene_queue.State.maxPolys`. |
| `maxPolyVerts` | `dynamic` | — | Initial value for `mq3.renderer.scene_queue.State.maxPolyVerts`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L150)

- [mq3.renderer.scene_queue.DecodedRefEntity](Type-mq3-renderer-scene-queue-decodedrefentity-1177171883.md) — struct
<a id="function-function-mq3-renderer-scene-queue-decodeentity-function-decodeentity-value-src-mq3-renderer-scene-queue-ml-702629319"></a>
### decodeEntity

```ml
function decodeEntity(value)
```

Builds `mq3.renderer.scene_queue.DecodedRefEntity` for `mq3.renderer.scene_queue.decodeEntity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.payload`, `value.reType`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L262)

<a id="function-function-mq3-renderer-scene-queue-diagnostic-function-diagnostic-state-text-src-mq3-renderer-scene-queue-ml-1302392970"></a>
### diagnostic

```ml
function diagnostic(state, text)
```

Returns `void` from `mq3.renderer.scene_queue.diagnostic`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.diagnosticFn`, `state.context`. |
| `text` | `dynamic` | — | Argument 2 supplied to `state.diagnosticFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L158)

- [mq3.renderer.scene_queue.DLight](Type-mq3-renderer-scene-queue-dlight-1585828387.md) — struct
<a id="constant-constant-mq3-renderer-scene-queue-entitynum-world-const-entitynum-world-1022-src-mq3-renderer-scene-queue-ml-192279744"></a>
### ENTITYNUM_WORLD

```ml
const ENTITYNUM_WORLD = 1022
```

Reserved entity number identifying static world geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L13)

<a id="function-function-mq3-renderer-scene-queue-finishscene-function-finishscene-state-src-mq3-renderer-scene-queue-ml-610780225"></a>
### finishScene

```ml
function finishScene(state)
```

Updates `state.firstSceneEntity`, `state.firstSceneDlight`, `state.firstScenePoly` in `mq3.renderer.scene_queue.finishScene`; returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.firstSceneEntity`, `state.firstSceneDlight`, `state.firstScenePoly`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L309)

<a id="function-function-mq3-renderer-scene-queue-fogforvertices-function-fogforvertices-state-vertices-src-mq3-renderer-scene-queue-ml-771075434"></a>
### fogForVertices

```ml
function fogForVertices(state, vertices)
```

Builds `mins[axis]`, `maxs[axis]` in `mq3.renderer.scene_queue.fogForVertices`; returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.worldLoaded`, `state.fogBounds`. |
| `vertices` | `dynamic` | — | Indexed input read at `0`, `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L188)

<a id="constant-constant-mq3-renderer-scene-queue-glhw-permedia2-const-glhw-permedia2-trtypes-glhw-permedia2-src-mq3-renderer-scene-queue-ml-999765840"></a>
### GLHW_PERMEDIA2

```ml
const GLHW_PERMEDIA2 = trtypes.GLHW_PERMEDIA2
```

Hardware category selecting Permedia2 blending workarounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L21)

<a id="constant-constant-mq3-renderer-scene-queue-glhw-ragepro-const-glhw-ragepro-trtypes-glhw-ragepro-src-mq3-renderer-scene-queue-ml-948313399"></a>
### GLHW_RAGEPRO

```ml
const GLHW_RAGEPRO = trtypes.GLHW_RAGEPRO
```

Hardware category selecting Rage Pro alpha-texture workarounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L19)

<a id="constant-constant-mq3-renderer-scene-queue-glhw-riva128-const-glhw-riva128-trtypes-glhw-riva128-src-mq3-renderer-scene-queue-ml-918874440"></a>
### GLHW_RIVA128

```ml
const GLHW_RIVA128 = trtypes.GLHW_RIVA128
```

Hardware category selecting RIVA 128 alpha-interpolation workarounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L17)

<a id="constant-constant-mq3-renderer-scene-queue-max-dlights-const-max-dlights-trtypes-max-dlights-src-mq3-renderer-scene-queue-ml-1828395978"></a>
### MAX_DLIGHTS

```ml
const MAX_DLIGHTS = trtypes.MAX_DLIGHTS
```

Maximum number of dynamic lights represented by the renderer's light bit masks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L11)

<a id="function-function-mq3-renderer-scene-queue-payloadvector-function-payloadvector-payload-offset-src-mq3-renderer-scene-queue-ml-2134815585"></a>
### payloadVector

```ml
function payloadVector(payload, offset)
```

QVM refEntity_t is a fixed 140-byte 32-bit ABI record from tr_types.h.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `payload` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.readI32`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.readI32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L257)

- [mq3.renderer.scene_queue.Poly](Type-mq3-renderer-scene-queue-poly-1534615021.md) — struct
- [mq3.renderer.scene_queue.PolyVert](Type-mq3-renderer-scene-queue-polyvert-608300714.md) — struct
- [mq3.renderer.scene_queue.RefEntity](Type-mq3-renderer-scene-queue-refentity-1421912755.md) — struct
<a id="constant-constant-mq3-renderer-scene-queue-rt-max-ref-entity-type-const-rt-max-ref-entity-type-trtypes-rt-max-ref-entity-type-src-mq3-renderer-scene-queue-ml-2111340966"></a>
### RT_MAX_REF_ENTITY_TYPE

```ml
const RT_MAX_REF_ENTITY_TYPE = trtypes.RT_MAX_REF_ENTITY_TYPE
```

Exclusive upper bound of valid renderer entity types; not a drawable entity kind.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L15)

<a id="function-function-mq3-renderer-scene-queue-sceneentities-function-sceneentities-state-src-mq3-renderer-scene-queue-ml-1579397189"></a>
### sceneEntities

```ml
function sceneEntities(state)
```

Calls `std.array.slice` with `(state.entities.buf,state.firstSceneEntity,state.entities.len()-state.firstSceneEntity)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.entities`, `state.firstSceneEntity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L300)

<a id="function-function-mq3-renderer-scene-queue-scenelights-function-scenelights-state-src-mq3-renderer-scene-queue-ml-1043036929"></a>
### sceneLights

```ml
function sceneLights(state)
```

Calls `std.array.slice` with `(state.dlights.buf,state.firstSceneDlight,state.dlights.len()-state.firstSceneDlight)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.dlights`, `state.firstSceneDlight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L303)

<a id="function-function-mq3-renderer-scene-queue-scenepolys-function-scenepolys-state-src-mq3-renderer-scene-queue-ml-558304059"></a>
### scenePolys

```ml
function scenePolys(state)
```

Calls `std.array.slice` with `(state.polys.buf,state.firstScenePoly,state.polys.len()-state.firstScenePoly)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.polys`, `state.firstScenePoly`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L306)

- [mq3.renderer.scene_queue.State](Type-mq3-renderer-scene-queue-state-1633405832.md) — struct
<a id="function-function-mq3-renderer-scene-queue-tex2-function-tex2-value-src-mq3-renderer-scene-queue-ml-461168707"></a>
### tex2

```ml
function tex2(value)
```

Returns `[value[0],value[1]]` from `mq3.renderer.scene_queue.tex2`; earlier branches return `error(3471,"scene queue: invalid texture coordinate")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Indexed input read at `0`, `1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L168)

<a id="function-function-mq3-renderer-scene-queue-toggleframe-function-toggleframe-state-src-mq3-renderer-scene-queue-ml-233938633"></a>
### toggleFrame

```ml
function toggleFrame(state)
```

Updates `state.numPolyVerts`, `state.firstSceneEntity`, `state.firstSceneDlight`, `state.firstScenePoly` in `mq3.renderer.scene_queue.toggleFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.numPolyVerts`, `state.firstSceneEntity`, `state.firstSceneDlight`, `state.firstScenePoly`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L175)

<a id="function-function-mq3-renderer-scene-queue-vector3-function-vector3-value-label-src-mq3-renderer-scene-queue-ml-780292053"></a>
### vector3

```ml
function vector3(value, label)
```

Returns `[value[0],value[1],value[2]]` from `mq3.renderer.scene_queue.vector3`; earlier branches return `error(3471,"scene queue: invalid "+label)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `label` | `dynamic` | — | Input tested by `value==void or len(value)!=3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L162)

<a id="function-function-mq3-renderer-scene-queue-vertex-function-vertex-value-src-mq3-renderer-scene-queue-ml-807412971"></a>
### vertex

```ml
function vertex(value)
```

Constructs `mq3.renderer.scene_queue.PolyVert` with `xyz` = `vector3(value.xyz,"vertex")`, `st` = `tex2(value.st)`, `modulate` = `color4(value.modulate)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.xyz`, `value.st`, `value.modulate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L171)

- [mq3.renderer.scene_queue.View](Type-mq3-renderer-scene-queue-view-289640322.md) — struct
