# `src/mq3/renderer/shader_remap.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.shader_remap`](Package-mq3-renderer-shader-remap-1797989406.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)

## Declarations

<a id="function-function-mq3-renderer-shader-remap-apply-function-apply-state-assets-kinds-oldname-newname-offset-src-mq3-renderer-shader-remap-ml-720533751"></a>
### apply

```ml
function apply(state, assets, kinds, oldName, newName, offset)
```

Asset handles are the renderer's stable shader objects in MiniQuake3. By replacing their resolved names in place, existing cgame/UI handles reach the replacement in both the scene and 2D material resolvers without re-registering.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `oldName` | `dynamic` | — |  |
| `newName` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L58)

<a id="function-function-mq3-renderer-shader-remap-contains-function-contains-values-value-src-mq3-renderer-shader-remap-ml-108049667"></a>
### contains

```ml
function contains(values, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L45)

<a id="function-function-mq3-renderer-shader-remap-create-function-create-src-mq3-renderer-shader-remap-ml-2147402328"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L10)

- [mq3.renderer.shader_remap.Entry](Type-mq3-renderer-shader-remap-entry-2126128068.md) — struct
<a id="function-function-mq3-renderer-shader-remap-find-function-find-state-oldname-src-mq3-renderer-shader-remap-ml-1104432281"></a>
### find

```ml
function find(state, oldName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `oldName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L23)

<a id="function-function-mq3-renderer-shader-remap-handle-function-handle-state-kinds-kind-name-src-mq3-renderer-shader-remap-ml-957057745"></a>
### handle

```ml
function handle(state, kinds, kind, name)
```

Return the stable renderer handle previously associated with this source shader. Registration after a remap must not allocate a disconnected object.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L49)

<a id="function-function-mq3-renderer-shader-remap-resolve-function-resolve-state-name-src-mq3-renderer-shader-remap-ml-1800481638"></a>
### resolve

```ml
function resolve(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L29)

<a id="function-function-mq3-renderer-shader-remap-samename-function-samename-a-b-src-mq3-renderer-shader-remap-ml-208811091"></a>
### sameName

```ml
function sameName(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L21)

- [mq3.renderer.shader_remap.State](Type-mq3-renderer-shader-remap-state-1771016709.md) — struct
<a id="function-function-mq3-renderer-shader-remap-stripped-function-stripped-name-src-mq3-renderer-shader-remap-ml-1619889783"></a>
### stripped

```ml
function stripped(name)
```

R_FindShader stores extensionless names and R_RemapShader compares those names case-insensitively after COM_StripExtension.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L14)

<a id="function-function-mq3-renderer-shader-remap-timeoffset-function-timeoffset-state-name-src-mq3-renderer-shader-remap-ml-1836726638"></a>
### timeOffset

```ml
function timeOffset(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L34)

<a id="function-function-mq3-renderer-shader-remap-timeoffsetforhandle-function-timeoffsetforhandle-state-handle-src-mq3-renderer-shader-remap-ml-1119334017"></a>
### timeOffsetForHandle

```ml
function timeOffsetForHandle(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L38)
