# `src/mq3/renderer/md4_animation.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.md4_animation`](Package-mq3-renderer-md4-animation-273878589.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-renderer-md4-animation-addanimsurfaces-function-addanimsurfaces-surfaces-src-mq3-renderer-md4-animation-ml-302345746"></a>
### addAnimSurfaces

```ml
function addAnimSurfaces(surfaces)
```

R_AddAnimSurfaces: MD4 has one LOD and submits every surface with fog zero and no dlight map.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surfaces` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L29)

- [mq3.renderer.md4_animation.AnimatedSurface](Type-mq3-renderer-md4-animation-animatedsurface-240130099.md) — struct
<a id="function-function-mq3-renderer-md4-animation-blendbone-function-blendbone-current-old-frontlerp-backlerp-src-mq3-renderer-md4-animation-ml-1885994812"></a>
### blendBone

```ml
function blendBone(current, old, frontlerp, backlerp)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `current` | `dynamic` | — |  |
| `old` | `dynamic` | — |  |
| `frontlerp` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L34)

<a id="function-function-mq3-renderer-md4-animation-bone-function-bone-matrix-src-mq3-renderer-md4-animation-ml-67541969"></a>
### bone

```ml
function bone(matrix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matrix` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L17)

- [mq3.renderer.md4_animation.Bone](Type-mq3-renderer-md4-animation-bone-1953028571.md) — struct
<a id="function-function-mq3-renderer-md4-animation-dotrow-function-dotrow-row-value-src-mq3-renderer-md4-animation-ml-2067492545"></a>
### dotRow

```ml
function dotRow(row, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `row` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L39)

- [mq3.renderer.md4_animation.DrawSurface](Type-mq3-renderer-md4-animation-drawsurface-1647736162.md) — struct
<a id="function-function-mq3-renderer-md4-animation-fail-function-fail-message-src-mq3-renderer-md4-animation-ml-395822841"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L16)

<a id="function-function-mq3-renderer-md4-animation-frame-function-frame-bones-src-mq3-renderer-md4-animation-ml-465927987"></a>
### frame

```ml
function frame(bones)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bones` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L25)

- [mq3.renderer.md4_animation.Frame](Type-mq3-renderer-md4-animation-frame-666599386.md) — struct
<a id="function-function-mq3-renderer-md4-animation-surface-function-surface-shaderindex-triangles-vertices-src-mq3-renderer-md4-animation-ml-2083903825"></a>
### surface

```ml
function surface(shaderIndex, triangles, vertices)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shaderIndex` | `dynamic` | — |  |
| `triangles` | `dynamic` | — |  |
| `vertices` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L24)

- [mq3.renderer.md4_animation.Surface](Type-mq3-renderer-md4-animation-surface-1098907824.md) — struct
<a id="function-function-mq3-renderer-md4-animation-surfaceanim-function-surfaceanim-value-currentframe-oldframe-backlerp-currentvertexes-currentindexes-maxvertexes-maxindexes-src-mq3-renderer-md4-animation-ml-1572700343"></a>
### surfaceAnim

```ml
function surfaceAnim(value, currentFrame, oldFrame, backlerp, currentVertexes, currentIndexes, maxVertexes, maxIndexes)
```

RB_SurfaceAnim: blend all 3x4 bone matrices, then skin positions and normals by each vertex's weighted bone list.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `currentFrame` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |
| `currentVertexes` | `dynamic` | — |  |
| `currentIndexes` | `dynamic` | — |  |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L43)

<a id="function-function-mq3-renderer-md4-animation-vertex-function-vertex-normal-texcoords-weights-src-mq3-renderer-md4-animation-ml-1234814163"></a>
### vertex

```ml
function vertex(normal, texCoords, weights)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |
| `texCoords` | `dynamic` | — |  |
| `weights` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L23)

- [mq3.renderer.md4_animation.Vertex](Type-mq3-renderer-md4-animation-vertex-982072027.md) — struct
<a id="function-function-mq3-renderer-md4-animation-weight-function-weight-index-value-offset-src-mq3-renderer-md4-animation-ml-1904683500"></a>
### weight

```ml
function weight(index, value, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L22)

- [mq3.renderer.md4_animation.Weight](Type-mq3-renderer-md4-animation-weight-651948989.md) — struct
