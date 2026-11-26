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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `intensity` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `g` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L104)

<a id="function-function-mq3-renderer-scene-queue-adddynamiclight-function-adddynamiclight-state-origin-intensity-r-g-b-additive-src-mq3-renderer-scene-queue-ml-786351881"></a>
### addDynamicLight

```ml
function addDynamicLight(state, origin, intensity, r, g, b, additive)
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L98)

<a id="function-function-mq3-renderer-scene-queue-addentity-function-addentity-state-retype-payload-src-mq3-renderer-scene-queue-ml-1584531876"></a>
### addEntity

```ml
function addEntity(state, reType, payload)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `reType` | `dynamic` | — |  |
| `payload` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L81)

<a id="function-function-mq3-renderer-scene-queue-addlight-function-addlight-state-origin-intensity-r-g-b-src-mq3-renderer-scene-queue-ml-1117335509"></a>
### addLight

```ml
function addLight(state, origin, intensity, r, g, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `intensity` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `g` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L103)

<a id="function-function-mq3-renderer-scene-queue-addpolys-function-addpolys-state-hshader-numverts-vertices-numpolys-src-mq3-renderer-scene-queue-ml-1651337340"></a>
### addPolys

```ml
function addPolys(state, hShader, numVerts, vertices, numPolys)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `hShader` | `dynamic` | — |  |
| `numVerts` | `dynamic` | — |  |
| `vertices` | `dynamic` | — |  |
| `numPolys` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L76)

<a id="function-function-mq3-renderer-scene-queue-addpolysdecoded-function-addpolysdecoded-state-hshader-numverts-vertices-numpolys-src-mq3-renderer-scene-queue-ml-1481041220"></a>
### addPolysDecoded

```ml
function addPolysDecoded(state, hShader, numVerts, vertices, numPolys)
```

The QVM bridge freshly decodes these vertices and transfers ownership to the frame queue. Avoid copying every vector/color a second time.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `hShader` | `dynamic` | — |  |
| `numVerts` | `dynamic` | — |  |
| `vertices` | `dynamic` | — |  |
| `numPolys` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L79)

<a id="function-function-mq3-renderer-scene-queue-addpolysinternal-function-addpolysinternal-state-hshader-numverts-vertices-numpolys-ownedvertices-src-mq3-renderer-scene-queue-ml-23727340"></a>
### addPolysInternal

```ml
function addPolysInternal(state, hShader, numVerts, vertices, numPolys, ownedVertices)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `hShader` | `dynamic` | — |  |
| `numVerts` | `dynamic` | — |  |
| `vertices` | `dynamic` | — |  |
| `numPolys` | `dynamic` | — |  |
| `ownedVertices` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L55)

<a id="function-function-mq3-renderer-scene-queue-clearscene-function-clearscene-state-src-mq3-renderer-scene-queue-ml-1444860491"></a>
### clearScene

```ml
function clearScene(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L40)

<a id="function-function-mq3-renderer-scene-queue-color4-function-color4-value-src-mq3-renderer-scene-queue-ml-1725243383"></a>
### color4

```ml
function color4(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L32)

<a id="function-function-mq3-renderer-scene-queue-create-function-create-maxpolys-maxpolyverts-src-mq3-renderer-scene-queue-ml-1481547801"></a>
### create

```ml
function create(maxPolys, maxPolyVerts)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxPolys` | `dynamic` | — |  |
| `maxPolyVerts` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L25)

- [mq3.renderer.scene_queue.DecodedRefEntity](Type-mq3-renderer-scene-queue-decodedrefentity-1177171883.md) — struct
<a id="function-function-mq3-renderer-scene-queue-decodeentity-function-decodeentity-value-src-mq3-renderer-scene-queue-ml-702629319"></a>
### decodeEntity

```ml
function decodeEntity(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L92)

<a id="function-function-mq3-renderer-scene-queue-diagnostic-function-diagnostic-state-text-src-mq3-renderer-scene-queue-ml-1302392970"></a>
### diagnostic

```ml
function diagnostic(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L30)

- [mq3.renderer.scene_queue.DLight](Type-mq3-renderer-scene-queue-dlight-1585828387.md) — struct
<a id="constant-constant-mq3-renderer-scene-queue-entitynum-world-const-entitynum-world-1022-src-mq3-renderer-scene-queue-ml-192279744"></a>
### ENTITYNUM_WORLD

```ml
const ENTITYNUM_WORLD = 1022
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L11)

<a id="function-function-mq3-renderer-scene-queue-finishscene-function-finishscene-state-src-mq3-renderer-scene-queue-ml-610780225"></a>
### finishScene

```ml
function finishScene(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L109)

<a id="function-function-mq3-renderer-scene-queue-fogforvertices-function-fogforvertices-state-vertices-src-mq3-renderer-scene-queue-ml-771075434"></a>
### fogForVertices

```ml
function fogForVertices(state, vertices)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `vertices` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L44)

<a id="constant-constant-mq3-renderer-scene-queue-glhw-permedia2-const-glhw-permedia2-trtypes-glhw-permedia2-src-mq3-renderer-scene-queue-ml-999765840"></a>
### GLHW_PERMEDIA2

```ml
const GLHW_PERMEDIA2 = trtypes.GLHW_PERMEDIA2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L15)

<a id="constant-constant-mq3-renderer-scene-queue-glhw-ragepro-const-glhw-ragepro-trtypes-glhw-ragepro-src-mq3-renderer-scene-queue-ml-948313399"></a>
### GLHW_RAGEPRO

```ml
const GLHW_RAGEPRO = trtypes.GLHW_RAGEPRO
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L14)

<a id="constant-constant-mq3-renderer-scene-queue-glhw-riva128-const-glhw-riva128-trtypes-glhw-riva128-src-mq3-renderer-scene-queue-ml-918874440"></a>
### GLHW_RIVA128

```ml
const GLHW_RIVA128 = trtypes.GLHW_RIVA128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L13)

<a id="constant-constant-mq3-renderer-scene-queue-max-dlights-const-max-dlights-trtypes-max-dlights-src-mq3-renderer-scene-queue-ml-1828395978"></a>
### MAX_DLIGHTS

```ml
const MAX_DLIGHTS = trtypes.MAX_DLIGHTS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L10)

<a id="function-function-mq3-renderer-scene-queue-payloadvector-function-payloadvector-payload-offset-src-mq3-renderer-scene-queue-ml-2134815585"></a>
### payloadVector

```ml
function payloadVector(payload, offset)
```

QVM refEntity_t is a fixed 140-byte 32-bit ABI record from tr_types.h.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `payload` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L89)

- [mq3.renderer.scene_queue.Poly](Type-mq3-renderer-scene-queue-poly-1534615021.md) — struct
- [mq3.renderer.scene_queue.PolyVert](Type-mq3-renderer-scene-queue-polyvert-608300714.md) — struct
- [mq3.renderer.scene_queue.RefEntity](Type-mq3-renderer-scene-queue-refentity-1421912755.md) — struct
<a id="constant-constant-mq3-renderer-scene-queue-rt-max-ref-entity-type-const-rt-max-ref-entity-type-trtypes-rt-max-ref-entity-type-src-mq3-renderer-scene-queue-ml-2111340966"></a>
### RT_MAX_REF_ENTITY_TYPE

```ml
const RT_MAX_REF_ENTITY_TYPE = trtypes.RT_MAX_REF_ENTITY_TYPE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L12)

<a id="function-function-mq3-renderer-scene-queue-sceneentities-function-sceneentities-state-src-mq3-renderer-scene-queue-ml-1579397189"></a>
### sceneEntities

```ml
function sceneEntities(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L106)

<a id="function-function-mq3-renderer-scene-queue-scenelights-function-scenelights-state-src-mq3-renderer-scene-queue-ml-1043036929"></a>
### sceneLights

```ml
function sceneLights(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L107)

<a id="function-function-mq3-renderer-scene-queue-scenepolys-function-scenepolys-state-src-mq3-renderer-scene-queue-ml-558304059"></a>
### scenePolys

```ml
function scenePolys(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L108)

- [mq3.renderer.scene_queue.State](Type-mq3-renderer-scene-queue-state-1633405832.md) — struct
<a id="function-function-mq3-renderer-scene-queue-tex2-function-tex2-value-src-mq3-renderer-scene-queue-ml-461168707"></a>
### tex2

```ml
function tex2(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L33)

<a id="function-function-mq3-renderer-scene-queue-toggleframe-function-toggleframe-state-src-mq3-renderer-scene-queue-ml-233938633"></a>
### toggleFrame

```ml
function toggleFrame(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L36)

<a id="function-function-mq3-renderer-scene-queue-vector3-function-vector3-value-label-src-mq3-renderer-scene-queue-ml-780292053"></a>
### vector3

```ml
function vector3(value, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L31)

<a id="function-function-mq3-renderer-scene-queue-vertex-function-vertex-value-src-mq3-renderer-scene-queue-ml-807412971"></a>
### vertex

```ml
function vertex(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L34)

- [mq3.renderer.scene_queue.View](Type-mq3-renderer-scene-queue-view-289640322.md) — struct
