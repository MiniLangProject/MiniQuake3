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
| `surfaces` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md4_animation.ml#L55)

- [mq3.renderer.md4_animation.AnimatedSurface](Type-mq3-renderer-md4-animation-animatedsurface-240130099.md) — struct
<a id="function-function-mq3-renderer-md4-animation-blendbone-function-blendbone-current-old-frontlerp-backlerp-src-mq3-renderer-md4-animation-ml-1885994812"></a>
### blendBone

```ml
function blendBone(current, old, frontlerp, backlerp)
```

Builds `mq3.renderer.md4_animation.Bone` for `mq3.renderer.md4_animation.blendBone`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `current` | `dynamic` | — | Record providing `current.matrix`. |
| `old` | `dynamic` | — | Record providing `old.matrix`. |
| `frontlerp` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.fmul`. |
| `backlerp` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.fmul`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md4_animation.ml#L65)

<a id="function-function-mq3-renderer-md4-animation-bone-function-bone-matrix-src-mq3-renderer-md4-animation-ml-67541969"></a>
### bone

```ml
function bone(matrix)
```

Builds `mq3.renderer.md4_animation.Bone` for `mq3.renderer.md4_animation.bone`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matrix` | `dynamic` | — | Initial value for `mq3.renderer.md4_animation.Bone.matrix`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md4_animation.ml#L28)

- [mq3.renderer.md4_animation.Bone](Type-mq3-renderer-md4-animation-bone-1953028571.md) — struct
<a id="function-function-mq3-renderer-md4-animation-dotrow-function-dotrow-row-value-src-mq3-renderer-md4-animation-ml-2067492545"></a>
### dotRow

```ml
function dotRow(row, value)
```

Calls `mq3.compat.numeric.fadd` with `(n.fadd(n.fmul(row[0],value[0]),n.fmul(row[1],value[1])),n.fmul(row[2],value[2]))` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `row` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `value` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md4_animation.ml#L73)

- [mq3.renderer.md4_animation.DrawSurface](Type-mq3-renderer-md4-animation-drawsurface-1647736162.md) — struct
<a id="function-function-mq3-renderer-md4-animation-fail-function-fail-message-src-mq3-renderer-md4-animation-ml-395822841"></a>
### fail

```ml
function fail(message)
```

Creates error `7760` with message `"MD4 animation: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7760,"MD4 animation: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md4_animation.ml#L25)

<a id="function-function-mq3-renderer-md4-animation-frame-function-frame-bones-src-mq3-renderer-md4-animation-ml-465927987"></a>
### frame

```ml
function frame(bones)
```

Constructs `mq3.renderer.md4_animation.Frame` from `bones`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bones` | `dynamic` | — | Initial value for `mq3.renderer.md4_animation.Frame.bones`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md4_animation.ml#L50)

- [mq3.renderer.md4_animation.Frame](Type-mq3-renderer-md4-animation-frame-666599386.md) — struct
<a id="function-function-mq3-renderer-md4-animation-surface-function-surface-shaderindex-triangles-vertices-src-mq3-renderer-md4-animation-ml-2083903825"></a>
### surface

```ml
function surface(shaderIndex, triangles, vertices)
```

Constructs `mq3.renderer.md4_animation.Surface` from `shaderIndex`, `triangles`, `vertices`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shaderIndex` | `dynamic` | — | Initial value for `mq3.renderer.md4_animation.Surface.shaderIndex`. |
| `triangles` | `dynamic` | — | Initial value for `mq3.renderer.md4_animation.Surface.triangles`. |
| `vertices` | `dynamic` | — | Initial value for `mq3.renderer.md4_animation.Surface.vertices`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md4_animation.ml#L47)

- [mq3.renderer.md4_animation.Surface](Type-mq3-renderer-md4-animation-surface-1098907824.md) — struct
<a id="function-function-mq3-renderer-md4-animation-surfaceanim-function-surfaceanim-value-currentframe-oldframe-backlerp-currentvertexes-currentindexes-maxvertexes-maxindexes-src-mq3-renderer-md4-animation-ml-1572700343"></a>
### surfaceAnim

```ml
function surfaceAnim(value, currentFrame, oldFrame, backlerp, currentVertexes, currentIndexes, maxVertexes, maxIndexes)
```

RB_SurfaceAnim: blend all 3x4 bone matrices, then skin positions and normals by each vertex's weighted bone list.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.vertices`, `value.triangles`. |
| `currentFrame` | `dynamic` | — | Record providing `currentFrame.bones`. |
| `oldFrame` | `dynamic` | — | Record providing `oldFrame.bones`. |
| `backlerp` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `currentVertexes` | `dynamic` | — | Input tested by `currentVertexes+len(value.vertices)>maxVertexes or currentIndexes+len(value.triangles)>maxIndexes`. |
| `currentIndexes` | `dynamic` | — | Input tested by `currentVertexes+len(value.vertices)>maxVertexes or currentIndexes+len(value.triangles)>maxIndexes`. |
| `maxVertexes` | `dynamic` | — | Input tested by `currentVertexes+len(value.vertices)>maxVertexes or currentIndexes+len(value.triangles)>maxIndexes`. |
| `maxIndexes` | `dynamic` | — | Input tested by `currentVertexes+len(value.vertices)>maxVertexes or currentIndexes+len(value.triangles)>maxIndexes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md4_animation.ml#L85)

<a id="function-function-mq3-renderer-md4-animation-vertex-function-vertex-normal-texcoords-weights-src-mq3-renderer-md4-animation-ml-1234814163"></a>
### vertex

```ml
function vertex(normal, texCoords, weights)
```

Constructs `mq3.renderer.md4_animation.Vertex` from `normal`, `texCoords`, `weights`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Initial value for `mq3.renderer.md4_animation.Vertex.normal`. |
| `texCoords` | `dynamic` | — | Initial value for `mq3.renderer.md4_animation.Vertex.texCoords`. |
| `weights` | `dynamic` | — | Initial value for `mq3.renderer.md4_animation.Vertex.weights`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md4_animation.ml#L42)

- [mq3.renderer.md4_animation.Vertex](Type-mq3-renderer-md4-animation-vertex-982072027.md) — struct
<a id="function-function-mq3-renderer-md4-animation-weight-function-weight-index-value-offset-src-mq3-renderer-md4-animation-ml-1904683500"></a>
### weight

```ml
function weight(index, value, offset)
```

Constructs `mq3.renderer.md4_animation.Weight` with `boneWeight` = `n.f32(value)` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Initial value for `mq3.renderer.md4_animation.Weight.boneIndex`. |
| `value` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `offset` | `dynamic` | — | Initial value for `mq3.renderer.md4_animation.Weight.offset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md4_animation.ml#L37)

- [mq3.renderer.md4_animation.Weight](Type-mq3-renderer-md4-animation-weight-651948989.md) — struct
