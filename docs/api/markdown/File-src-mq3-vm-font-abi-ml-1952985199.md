# `src/mq3/vm/font_abi.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.font_abi`](Package-mq3-vm-font-abi-1359578975.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)

## Declarations

<a id="function-function-mq3-vm-font-abi-cached-function-cached-registry-pointsize-src-mq3-vm-font-abi-ml-420820614"></a>
### cached

```ml
function cached(registry, pointSize)
```

Compute cached in vm.font_abi.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `fonts`. |
| `pointSize` | `dynamic` | — | Point size used in `(item.pointSize == pointSize)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L45)

- [mq3.vm.font_abi.Cached](Type-mq3-vm-font-abi-cached-1606670249.md) — struct
<a id="function-function-mq3-vm-font-abi-create-function-create-archive-src-mq3-vm-font-abi-ml-874868678"></a>
### create

```ml
function create(archive)
```

Create `mq3.vm.font_abi.Registry` with archive=archive; fonts=[].

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Initial `archive` field stored in the returned or constructed `mq3.vm.font_abi.Registry` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L30)

<a id="function-function-mq3-vm-font-abi-cstring-function-cstring-data-offset-capacity-src-mq3-vm-font-abi-ml-1913894193"></a>
### cString

```ml
function cString(data, offset, capacity)
```

Compute c string in vm.font_abi; the normal completion returns `decode(slice(data, offset, count))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `data[(offset + count)]` and `slice(data, offset, count)`. |
| `offset` | `dynamic` | — | Offset used in `(offset + count)` and `data[(offset + count)]`. |
| `capacity` | `dynamic` | — | Capacity used in `(count < capacity)` and `((count < capacity) and (data[(offset + count)] != 0))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L38)

<a id="function-function-mq3-vm-font-abi-fail-function-fail-message-src-mq3-vm-font-abi-ml-241031899"></a>
### fail

```ml
function fail(message)
```

Create the vm.font_abi error for `fail` with 7690 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("font ABI: " + message)` and `error(7690, ("font ABI: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L27)

<a id="constant-constant-mq3-vm-font-abi-font-info-size-const-font-info-size-20548-src-mq3-vm-font-abi-ml-152635872"></a>
### FONT_INFO_SIZE

```ml
const FONT_INFO_SIZE = 20548
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L16)

<a id="constant-constant-mq3-vm-font-abi-font-name-bytes-const-font-name-bytes-64-src-mq3-vm-font-abi-ml-1894725621"></a>
### FONT_NAME_BYTES

```ml
const FONT_NAME_BYTES = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L15)

<a id="constant-constant-mq3-vm-font-abi-font-name-offset-const-font-name-offset-20484-src-mq3-vm-font-abi-ml-1848321063"></a>
### FONT_NAME_OFFSET

```ml
const FONT_NAME_OFFSET = 20484
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L14)

<a id="constant-constant-mq3-vm-font-abi-glyph-handle-offset-const-glyph-handle-offset-44-src-mq3-vm-font-abi-ml-1876648171"></a>
### GLYPH_HANDLE_OFFSET

```ml
const GLYPH_HANDLE_OFFSET = 44
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L10)

<a id="constant-constant-mq3-vm-font-abi-glyph-scale-offset-const-glyph-scale-offset-20480-src-mq3-vm-font-abi-ml-1781576319"></a>
### GLYPH_SCALE_OFFSET

```ml
const GLYPH_SCALE_OFFSET = 20480
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L13)

<a id="constant-constant-mq3-vm-font-abi-glyph-shader-bytes-const-glyph-shader-bytes-32-src-mq3-vm-font-abi-ml-269427162"></a>
### GLYPH_SHADER_BYTES

```ml
const GLYPH_SHADER_BYTES = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L12)

<a id="constant-constant-mq3-vm-font-abi-glyph-shader-offset-const-glyph-shader-offset-48-src-mq3-vm-font-abi-ml-209467811"></a>
### GLYPH_SHADER_OFFSET

```ml
const GLYPH_SHADER_OFFSET = 48
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L11)

<a id="constant-constant-mq3-vm-font-abi-glyph-size-const-glyph-size-80-src-mq3-vm-font-abi-ml-1943078817"></a>
### GLYPH_SIZE

```ml
const GLYPH_SIZE = 80
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L9)

<a id="constant-constant-mq3-vm-font-abi-glyphs-per-font-const-glyphs-per-font-256-src-mq3-vm-font-abi-ml-244117122"></a>
### GLYPHS_PER_FONT

```ml
const GLYPHS_PER_FONT = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L8)

<a id="function-function-mq3-vm-font-abi-load-function-load-registry-shadercontext-registershaderfn-fontname-pointsize-src-mq3-vm-font-abi-ml-1082352744"></a>
### load

```ml
function load(registry, shaderContext, registerShaderFn, fontName, pointSize)
```

Load font abi in vm.font_abi; the normal completion returns `Result(true, data, registered, path)`.

Direct state writes: `registry.fonts`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `archive`, `fonts`. Updated in place: `fonts`. |
| `shaderContext` | `dynamic` | — | Shader context used in `registerShaderFn(shaderContext, shader)`. |
| `registerShaderFn` | `dynamic` | — | Callback invoked for register shader; the call sites below define the callback arguments. |
| `fontName` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `pointSize` | `dynamic` | — | Point size passed as `pointSize` to `mq3.vm.font_abi.cached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L69)

<a id="function-function-mq3-vm-font-abi-pathfor-function-pathfor-pointsize-src-mq3-vm-font-abi-ml-309573383"></a>
### pathFor

```ml
function pathFor(pointSize)
```

Compute path for in vm.font_abi; the normal completion returns `(("fonts/fontImage_" + str(pointSize)) + ".dat")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pointSize` | `dynamic` | — | Point size used in `str(pointSize)` and `(pointSize <= 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L33)

- [mq3.vm.font_abi.Registry](Type-mq3-vm-font-abi-registry-911501124.md) — struct
- [mq3.vm.font_abi.Result](Type-mq3-vm-font-abi-result-762768042.md) — struct
<a id="function-function-mq3-vm-font-abi-writename-function-writename-data-name-src-mq3-vm-font-abi-ml-517954489"></a>
### writeName

```ml
function writeName(data, name)
```

Write name in vm.font_abi; updates `data entries`.

Direct state writes: `data elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Mutable sequence written at `(FONT_NAME_OFFSET + index)`. |
| `name` | `dynamic` | — | Name used in `bytes(name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L55)
