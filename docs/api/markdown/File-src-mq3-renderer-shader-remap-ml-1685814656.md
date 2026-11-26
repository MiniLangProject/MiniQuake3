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
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.entries`, `state.revision`. |
| `assets` | `dynamic` | — | Mutable record or buffer; this call updates `assets[index]`. |
| `kinds` | `dynamic` | — | Indexed input read at `index`. |
| `oldName` | `dynamic` | — | Value forwarded as `oldName` to `mq3.renderer.shader_remap.find`. |
| `newName` | `dynamic` | — | Value assigned to `entry.newName`, `assets[index]`. |
| `offset` | `dynamic` | — | Value assigned to `entry.timeOffset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L104)

<a id="function-function-mq3-renderer-shader-remap-contains-function-contains-values-value-src-mq3-renderer-shader-remap-ml-108049667"></a>
### contains

```ml
function contains(values, value)
```

Returns `false` from `mq3.renderer.shader_remap.contains`; earlier branches return `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Sequence traversed as `current` while producing this result. |
| `value` | `dynamic` | — | Input used by `for each current in values if current==value then return true`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L81)

<a id="function-function-mq3-renderer-shader-remap-create-function-create-src-mq3-renderer-shader-remap-ml-2147402328"></a>
### create

```ml
function create()
```

Constructs `mq3.renderer.shader_remap.State` with `entries` = `[]`, `revision` = `0`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L27)

- [mq3.renderer.shader_remap.Entry](Type-mq3-renderer-shader-remap-entry-2126128068.md) — struct
<a id="function-function-mq3-renderer-shader-remap-find-function-find-state-oldname-src-mq3-renderer-shader-remap-ml-1104432281"></a>
### find

```ml
function find(state, oldName)
```

Returns `void` from `mq3.renderer.shader_remap.find`; earlier branches return `void`, `entry`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.entries`. |
| `oldName` | `dynamic` | — | Value forwarded as `b` to `mq3.renderer.shader_remap.sameName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L47)

<a id="function-function-mq3-renderer-shader-remap-handle-function-handle-state-kinds-kind-name-src-mq3-renderer-shader-remap-ml-957057745"></a>
### handle

```ml
function handle(state, kinds, kind, name)
```

Return the stable renderer handle previously associated with this source shader. Registration after a remap must not allocate a disconnected object.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.shader_remap.find`. |
| `kinds` | `dynamic` | — | Indexed input read at `index`. |
| `kind` | `dynamic` | — | Input used by `for each index in entry.handles if index>=0 and index<len(kinds) and kinds[index]==kind then return index+1`. |
| `name` | `dynamic` | — | Value forwarded as `oldName` to `mq3.renderer.shader_remap.find`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L89)

<a id="function-function-mq3-renderer-shader-remap-resolve-function-resolve-state-name-src-mq3-renderer-shader-remap-ml-1800481638"></a>
### resolve

```ml
function resolve(state, name)
```

Returns `entry.newName` from `mq3.renderer.shader_remap.resolve`; earlier branches return `name`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.shader_remap.find`. |
| `name` | `dynamic` | — | Value forwarded as `oldName` to `mq3.renderer.shader_remap.find`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L56)

<a id="function-function-mq3-renderer-shader-remap-samename-function-samename-a-b-src-mq3-renderer-shader-remap-ml-208811091"></a>
### sameName

```ml
function sameName(a, b)
```

Calls `stringEqualsIgnoreCaseAscii` with `(stripped(a),stripped(b))` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.shader_remap.stripped`. |
| `b` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.shader_remap.stripped`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L42)

- [mq3.renderer.shader_remap.State](Type-mq3-renderer-shader-remap-state-1771016709.md) — struct
<a id="function-function-mq3-renderer-shader-remap-stripped-function-stripped-name-src-mq3-renderer-shader-remap-ml-1619889783"></a>
### stripped

```ml
function stripped(name)
```

R_FindShader stores extensionless names and R_RemapShader compares those names case-insensitively after COM_StripExtension.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L32)

<a id="function-function-mq3-renderer-shader-remap-timeoffset-function-timeoffset-state-name-src-mq3-renderer-shader-remap-ml-1836726638"></a>
### timeOffset

```ml
function timeOffset(state, name)
```

Returns `entry.timeOffset` from `mq3.renderer.shader_remap.timeOffset`; earlier branches return `""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.shader_remap.find`. |
| `name` | `dynamic` | — | Value forwarded as `oldName` to `mq3.renderer.shader_remap.find`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L64)

<a id="function-function-mq3-renderer-shader-remap-timeoffsetforhandle-function-timeoffsetforhandle-state-handle-src-mq3-renderer-shader-remap-ml-1119334017"></a>
### timeOffsetForHandle

```ml
function timeOffsetForHandle(state, handle)
```

Returns `void` from `mq3.renderer.shader_remap.timeOffsetForHandle`; earlier branches return `void`, `numbers.atof32(entry.timeOffset)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.entries`. |
| `handle` | `dynamic` | — | Input tested by `state==void or handle<=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_remap.ml#L71)
