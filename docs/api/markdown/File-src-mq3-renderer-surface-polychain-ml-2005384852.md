# `src/mq3/renderer/surface_polychain.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.surface_polychain`](Package-mq3-renderer-surface-polychain-344130616.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-renderer-surface-polychain-append-function-append-buffer-vertices-src-mq3-renderer-surface-polychain-ml-1401093685"></a>
### append

```ml
function append(buffer, vertices)
```

Copies positions, base texture coordinates and packed color, then emits a fan.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — |  |
| `vertices` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_polychain.ml#L37)

- [mq3.renderer.surface_polychain.Buffer](Type-mq3-renderer-surface-polychain-buffer-21948748.md) — struct
<a id="function-function-mq3-renderer-surface-polychain-checkoverflow-function-checkoverflow-buffer-vertices-indexes-src-mq3-renderer-surface-polychain-ml-282284823"></a>
### checkOverflow

```ml
function checkOverflow(buffer, vertices, indexes)
```

Mirrors RB_CheckOverflow's strict '< MAX' checks and surface restart.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — |  |
| `vertices` | `dynamic` | — |  |
| `indexes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_polychain.ml#L27)

<a id="function-function-mq3-renderer-surface-polychain-clear-function-clear-buffer-src-mq3-renderer-surface-polychain-ml-405539822"></a>
### clear

```ml
function clear(buffer)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_polychain.ml#L21)

<a id="function-function-mq3-renderer-surface-polychain-create-function-create-maxvertexes-maxindexes-src-mq3-renderer-surface-polychain-ml-1796380016"></a>
### create

```ml
function create(maxVertexes, maxIndexes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_polychain.ml#L16)

<a id="constant-constant-mq3-renderer-surface-polychain-shader-max-indexes-const-shader-max-indexes-6000-src-mq3-renderer-surface-polychain-ml-2055452683"></a>
### SHADER_MAX_INDEXES

```ml
const SHADER_MAX_INDEXES = 6000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_polychain.ml#L7)

<a id="constant-constant-mq3-renderer-surface-polychain-shader-max-vertexes-const-shader-max-vertexes-1000-src-mq3-renderer-surface-polychain-ml-583326680"></a>
### SHADER_MAX_VERTEXES

```ml
const SHADER_MAX_VERTEXES = 1000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_polychain.ml#L6)

<a id="function-function-mq3-renderer-surface-polychain-vertex-function-vertex-x-y-z-s-t-r-g-b-a-src-mq3-renderer-surface-polychain-ml-1832674768"></a>
### vertex

```ml
function vertex(x, y, z, s, t, r, g, b, a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `z` | `dynamic` | — |  |
| `s` | `dynamic` | — |  |
| `t` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `g` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_polychain.ml#L12)

- [mq3.renderer.surface_polychain.Vertex](Type-mq3-renderer-surface-polychain-vertex-563302080.md) — struct
