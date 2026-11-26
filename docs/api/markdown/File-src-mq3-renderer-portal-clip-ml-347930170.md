# `src/mq3/renderer/portal_clip.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.portal_clip`](Package-mq3-renderer-portal-clip-1271782770.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/bsp_render_data.ml` as `renderData` → [src/mq3/renderer/bsp_render_data.ml](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)
- `mq3/renderer/qvm_scene_geometry.ml` as `sceneGeometry` → [src/mq3/renderer/qvm_scene_geometry.ml](File-src-mq3-renderer-qvm-scene-geometry-ml-51177627.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-portal-clip-clippedscenevertex-function-clippedscenevertex-a-b-da-db-src-mq3-renderer-portal-clip-ml-2016596036"></a>
### clippedSceneVertex

```ml
function clippedSceneVertex(a, b, da, db)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `da` | `dynamic` | — |  |
| `db` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L79)

<a id="function-function-mq3-renderer-portal-clip-clippedvertex-function-clippedvertex-a-b-da-db-src-mq3-renderer-portal-clip-ml-1304551482"></a>
### clippedVertex

```ml
function clippedVertex(a, b, da, db)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `da` | `dynamic` | — |  |
| `db` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L16)

<a id="function-function-mq3-renderer-portal-clip-cliprenderdata-function-cliprenderdata-source-normal-dist-src-mq3-renderer-portal-clip-ml-554050480"></a>
### clipRenderData

```ml
function clipRenderData(source, normal, dist)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `dist` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L41)

<a id="function-function-mq3-renderer-portal-clip-clipscene-function-clipscene-source-normal-dist-src-mq3-renderer-portal-clip-ml-801123408"></a>
### clipScene

```ml
function clipScene(source, normal, dist)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `dist` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L89)

<a id="function-function-mq3-renderer-portal-clip-clipscenevertices-function-clipscenevertices-vertices-normal-dist-src-mq3-renderer-portal-clip-ml-692626376"></a>
### clipSceneVertices

```ml
function clipSceneVertices(vertices, normal, dist)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertices` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `dist` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L80)

<a id="function-function-mq3-renderer-portal-clip-clipselection-function-clipselection-cache-chosen-normal-dist-src-mq3-renderer-portal-clip-ml-1857404443"></a>
### clipSelection

```ml
function clipSelection(cache, chosen, normal, dist)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `chosen` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `dist` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L51)

<a id="function-function-mq3-renderer-portal-clip-cliptriangles-function-cliptriangles-input-normal-dist-src-mq3-renderer-portal-clip-ml-1216810685"></a>
### clipTriangles

```ml
function clipTriangles(input, normal, dist)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `dist` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L31)

<a id="function-function-mq3-renderer-portal-clip-clipvertices-function-clipvertices-vertices-normal-dist-src-mq3-renderer-portal-clip-ml-2081665430"></a>
### clipVertices

```ml
function clipVertices(vertices, normal, dist)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertices` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `dist` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L20)

<a id="function-function-mq3-renderer-portal-clip-createfacecache-function-createfacecache-world-src-mq3-renderer-portal-clip-ml-2002062328"></a>
### createFaceCache

```ml
function createFaceCache(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L50)

<a id="function-function-mq3-renderer-portal-clip-distance-function-distance-point-normal-dist-src-mq3-renderer-portal-clip-ml-1873566945"></a>
### distance

```ml
function distance(point, normal, dist)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `dist` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L12)

- [mq3.renderer.portal_clip.FaceCache](Type-mq3-renderer-portal-clip-facecache-1243117029.md) — struct
<a id="function-function-mq3-renderer-portal-clip-fail-function-fail-message-src-mq3-renderer-portal-clip-ml-1364799831"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L11)

<a id="function-function-mq3-renderer-portal-clip-lerp2-function-lerp2-a-b-t-src-mq3-renderer-portal-clip-ml-463212875"></a>
### lerp2

```ml
function lerp2(a, b, t)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `t` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L14)

<a id="function-function-mq3-renderer-portal-clip-lerp3-function-lerp3-a-b-t-src-mq3-renderer-portal-clip-ml-517344061"></a>
### lerp3

```ml
function lerp3(a, b, t)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `t` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L13)

<a id="function-function-mq3-renderer-portal-clip-lerpcolor-function-lerpcolor-a-b-t-src-mq3-renderer-portal-clip-ml-1089999689"></a>
### lerpColor

```ml
function lerpColor(a, b, t)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `t` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L15)

<a id="function-function-mq3-renderer-portal-clip-scenetriangle-function-scenetriangle-source-a-b-c-src-mq3-renderer-portal-clip-ml-48418331"></a>
### sceneTriangle

```ml
function sceneTriangle(source, a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L86)

<a id="function-function-mq3-renderer-portal-clip-scenevertex-function-scenevertex-triangle-corner-src-mq3-renderer-portal-clip-ml-1081874421"></a>
### sceneVertex

```ml
function sceneVertex(triangle, corner)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangle` | `dynamic` | — |  |
| `corner` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L78)

- [mq3.renderer.portal_clip.SceneVertex](Type-mq3-renderer-portal-clip-scenevertex-2075721610.md) — struct
