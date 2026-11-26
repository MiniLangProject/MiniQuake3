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
| `buffer` | `dynamic` | — | Mutable record or buffer; this call updates `buffer.xyz`, `buffer.texCoords`, `buffer.colors`, `buffer.numVertexes`, `buffer.indexes`. |
| `vertices` | `dynamic` | — | Indexed input read at `i`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_polychain.ml#L87)

- [mq3.renderer.surface_polychain.Buffer](Type-mq3-renderer-surface-polychain-buffer-21948748.md) — struct
<a id="function-function-mq3-renderer-surface-polychain-checkoverflow-function-checkoverflow-buffer-vertices-indexes-src-mq3-renderer-surface-polychain-ml-282284823"></a>
### checkOverflow

```ml
function checkOverflow(buffer, vertices, indexes)
```

Mirrors RB_CheckOverflow's strict '< MAX' checks and surface restart.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — | Mutable record or buffer; this call updates `buffer.flushes`. |
| `vertices` | `dynamic` | — | Input tested by `vertices<0 or indexes<0`. |
| `indexes` | `dynamic` | — | Input tested by `vertices<0 or indexes<0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_polychain.ml#L75)

<a id="function-function-mq3-renderer-surface-polychain-clear-function-clear-buffer-src-mq3-renderer-surface-polychain-ml-405539822"></a>
### clear

```ml
function clear(buffer)
```

Updates `buffer.xyz`, `buffer.texCoords`, `buffer.colors`, `buffer.indexes`, `buffer.numVertexes` in `mq3.renderer.surface_polychain.clear`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — | Mutable record or buffer; this call updates `buffer.xyz`, `buffer.texCoords`, `buffer.colors`, `buffer.indexes`, `buffer.numVertexes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_polychain.ml#L66)

<a id="function-function-mq3-renderer-surface-polychain-create-function-create-maxvertexes-maxindexes-src-mq3-renderer-surface-polychain-ml-1796380016"></a>
### create

```ml
function create(maxVertexes, maxIndexes)
```

Builds `mq3.renderer.surface_polychain.Buffer` for `mq3.renderer.surface_polychain.create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxVertexes` | `dynamic` | — | Initial value for `mq3.renderer.surface_polychain.Buffer.maxVertexes`. |
| `maxIndexes` | `dynamic` | — | Initial value for `mq3.renderer.surface_polychain.Buffer.maxIndexes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_polychain.ml#L59)

<a id="constant-constant-mq3-renderer-surface-polychain-shader-max-indexes-const-shader-max-indexes-6000-src-mq3-renderer-surface-polychain-ml-2055452683"></a>
### SHADER_MAX_INDEXES

```ml
const SHADER_MAX_INDEXES = 6000
```

Index capacity of the renderer's shared tessellation buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_polychain.ml#L9)

<a id="constant-constant-mq3-renderer-surface-polychain-shader-max-vertexes-const-shader-max-vertexes-1000-src-mq3-renderer-surface-polychain-ml-583326680"></a>
### SHADER_MAX_VERTEXES

```ml
const SHADER_MAX_VERTEXES = 1000
```

Vertex capacity of the renderer's shared tessellation buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_polychain.ml#L7)

<a id="function-function-mq3-renderer-surface-polychain-vertex-function-vertex-x-y-z-s-t-r-g-b-a-src-mq3-renderer-surface-polychain-ml-1832674768"></a>
### vertex

```ml
function vertex(x, y, z, s, t, r, g, b, a)
```

Constructs `mq3.renderer.surface_polychain.Vertex` with `xyz` = `[x,y,z]`, `st` = `[s,t]`, `modulate` = `[r&255,g&255,b&255,a&255]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Input used in the result expression `Vertex([x,y,z],[s,t],[r&255,g&255,b&255,a&255])`. |
| `y` | `dynamic` | — | Input used in the result expression `Vertex([x,y,z],[s,t],[r&255,g&255,b&255,a&255])`. |
| `z` | `dynamic` | — | Input used in the result expression `Vertex([x,y,z],[s,t],[r&255,g&255,b&255,a&255])`. |
| `s` | `dynamic` | — | Input used in the result expression `Vertex([x,y,z],[s,t],[r&255,g&255,b&255,a&255])`. |
| `t` | `dynamic` | — | Input used in the result expression `Vertex([x,y,z],[s,t],[r&255,g&255,b&255,a&255])`. |
| `r` | `dynamic` | — | Input used in the result expression `Vertex([x,y,z],[s,t],[r&255,g&255,b&255,a&255])`. |
| `g` | `dynamic` | — | Input used in the result expression `Vertex([x,y,z],[s,t],[r&255,g&255,b&255,a&255])`. |
| `b` | `dynamic` | — | Input used in the result expression `Vertex([x,y,z],[s,t],[r&255,g&255,b&255,a&255])`. |
| `a` | `dynamic` | — | Input used in the result expression `Vertex([x,y,z],[s,t],[r&255,g&255,b&255,a&255])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_polychain.ml#L52)

- [mq3.renderer.surface_polychain.Vertex](Type-mq3-renderer-surface-polychain-vertex-563302080.md) — struct
