# `src/mq3/platform/win_qgl_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.win_qgl_runtime`](Package-mq3-platform-win-qgl-runtime-1111848121.md)

Reachable from entry: **no**

## Imports

- `mq3/renderer/qgl.ml` as `qgl` → [src/mq3/renderer/qgl.ml](File-src-mq3-renderer-qgl-ml-2071350969.md)

## Declarations

<a id="function-function-mq3-platform-win-qgl-runtime-blendtoname-function-blendtoname-value-src-mq3-platform-win-qgl-runtime-ml-2043034489"></a>
### BlendToName

```ml
function BlendToName(value)
```

Computes `BlendToName` from `str(value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input tested by `value==GL_ONE`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L150)

<a id="function-function-mq3-platform-win-qgl-runtime-booleantostring-function-booleantostring-value-src-mq3-platform-win-qgl-runtime-ml-1179668919"></a>
### BooleanToString

```ml
function BooleanToString(value)
```

Returns `"OUT OF RANGE FOR BOOLEAN"` from `mq3.platform.win_qgl_runtime.BooleanToString`; earlier branches return `"GL_FALSE"`, `"GL_TRUE"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input tested by `value==GL_FALSE`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L121)

<a id="function-function-mq3-platform-win-qgl-runtime-captostring-function-captostring-value-src-mq3-platform-win-qgl-runtime-ml-1390789319"></a>
### CapToString

```ml
function CapToString(value)
```

Computes `CapToString` from `str(value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input tested by `value==GL_TEXTURE_2D`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L137)

<a id="function-function-mq3-platform-win-qgl-runtime-create-function-create-src-mq3-platform-win-qgl-runtime-ml-2037488478"></a>
### create

```ml
function create()
```

Constructs `mq3.platform.win_qgl_runtime.State` with `loaded` = `false`, `driver` = `""`, `logging` = `false`, `logCounter` = `0` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L118)

<a id="function-function-mq3-platform-win-qgl-runtime-dispatch-function-dispatch-state-registry-name-arguments-src-mq3-platform-win-qgl-runtime-ml-75429391"></a>
### dispatch

```ml
function dispatch(state, registry, name, arguments)
```

Updates `state.calls`, `state.logLines` in `mq3.platform.win_qgl_runtime.dispatch`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.calls`, `state.logLines`. |
| `registry` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.qgl.has`. |
| `name` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.qgl.has`. |
| `arguments` | `dynamic` | — | Input used by `state.calls=state.calls+[[name,arguments]]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L201)

<a id="function-function-mq3-platform-win-qgl-runtime-functostring-function-functostring-value-src-mq3-platform-win-qgl-runtime-ml-1923384959"></a>
### FuncToString

```ml
function FuncToString(value)
```

Computes `FuncToString` from `"!!! UNKNOWN !!!"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input tested by `value==GL_ALWAYS`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L124)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-alpha-test-const-gl-alpha-test-3008-src-mq3-platform-win-qgl-runtime-ml-1674560822"></a>
### GL_ALPHA_TEST

```ml
const GL_ALPHA_TEST = 3008
```

OpenGL capability selector controlling alpha comparison.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L95)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-always-const-gl-always-519-src-mq3-platform-win-qgl-runtime-ml-253679542"></a>
### GL_ALWAYS

```ml
const GL_ALWAYS = 519
```

OpenGL comparison function that always accepts the fragment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L27)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-blend-const-gl-blend-3042-src-mq3-platform-win-qgl-runtime-ml-907545068"></a>
### GL_BLEND

```ml
const GL_BLEND = 3042
```

OpenGL capability selector controlling source/destination color blending.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L81)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-byte-const-gl-byte-5120-src-mq3-platform-win-qgl-runtime-ml-912922717"></a>
### GL_BYTE

```ml
const GL_BYTE = 5120
```

OpenGL scalar type for signed eight-bit components.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L49)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-clip-plane0-const-gl-clip-plane0-12288-src-mq3-platform-win-qgl-runtime-ml-839502372"></a>
### GL_CLIP_PLANE0

```ml
const GL_CLIP_PLANE0 = 12288
```

OpenGL capability selector for the first user-defined clipping plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L87)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-color-array-const-gl-color-array-32886-src-mq3-platform-win-qgl-runtime-ml-2001679590"></a>
### GL_COLOR_ARRAY

```ml
const GL_COLOR_ARRAY = 32886
```

OpenGL client-array selector for per-vertex colors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L89)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-cull-face-const-gl-cull-face-2884-src-mq3-platform-win-qgl-runtime-ml-1056258037"></a>
### GL_CULL_FACE

```ml
const GL_CULL_FACE = 2884
```

OpenGL capability selector controlling face culling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L85)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-depth-test-const-gl-depth-test-2929-src-mq3-platform-win-qgl-runtime-ml-1745766493"></a>
### GL_DEPTH_TEST

```ml
const GL_DEPTH_TEST = 2929
```

OpenGL capability selector controlling depth-buffer comparison.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L83)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-double-const-gl-double-5130-src-mq3-platform-win-qgl-runtime-ml-1299076316"></a>
### GL_DOUBLE

```ml
const GL_DOUBLE = 5130
```

OpenGL scalar type for double-precision floating-point components.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L63)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-dst-alpha-const-gl-dst-alpha-772-src-mq3-platform-win-qgl-runtime-ml-668159125"></a>
### GL_DST_ALPHA

```ml
const GL_DST_ALPHA = 772
```

OpenGL blend-factor selector using the destination alpha.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L73)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-dst-color-const-gl-dst-color-774-src-mq3-platform-win-qgl-runtime-ml-961218521"></a>
### GL_DST_COLOR

```ml
const GL_DST_COLOR = 774
```

OpenGL blend-factor selector using the destination color.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L75)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-equal-const-gl-equal-514-src-mq3-platform-win-qgl-runtime-ml-1564240379"></a>
### GL_EQUAL

```ml
const GL_EQUAL = 514
```

OpenGL comparison function requiring equality with the reference.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L17)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-false-const-gl-false-0-src-mq3-platform-win-qgl-runtime-ml-507251559"></a>
### GL_FALSE

```ml
const GL_FALSE = 0
```

OpenGL boolean false value accepted by OpenGL calls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L9)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-float-const-gl-float-5126-src-mq3-platform-win-qgl-runtime-ml-267637489"></a>
### GL_FLOAT

```ml
const GL_FLOAT = 5126
```

OpenGL scalar type for single-precision floating-point components.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L61)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-gequal-const-gl-gequal-518-src-mq3-platform-win-qgl-runtime-ml-1255971305"></a>
### GL_GEQUAL

```ml
const GL_GEQUAL = 518
```

OpenGL comparison function requiring a value no smaller than the reference.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L25)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-greater-const-gl-greater-516-src-mq3-platform-win-qgl-runtime-ml-1606919193"></a>
### GL_GREATER

```ml
const GL_GREATER = 516
```

OpenGL comparison function requiring a value greater than the reference.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L21)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-int-const-gl-int-5124-src-mq3-platform-win-qgl-runtime-ml-33470769"></a>
### GL_INT

```ml
const GL_INT = 5124
```

OpenGL scalar type for signed thirty-two-bit components.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L57)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-lequal-const-gl-lequal-515-src-mq3-platform-win-qgl-runtime-ml-1815963470"></a>
### GL_LEQUAL

```ml
const GL_LEQUAL = 515
```

OpenGL comparison function requiring a value no greater than the reference.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L19)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-less-const-gl-less-513-src-mq3-platform-win-qgl-runtime-ml-124539296"></a>
### GL_LESS

```ml
const GL_LESS = 513
```

OpenGL comparison function requiring a value smaller than the reference.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L15)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-line-loop-const-gl-line-loop-2-src-mq3-platform-win-qgl-runtime-ml-157421969"></a>
### GL_LINE_LOOP

```ml
const GL_LINE_LOOP = 2
```

OpenGL primitive mode that draws a closed chain of line segments.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L33)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-line-strip-const-gl-line-strip-3-src-mq3-platform-win-qgl-runtime-ml-730947374"></a>
### GL_LINE_STRIP

```ml
const GL_LINE_STRIP = 3
```

OpenGL primitive mode that draws a connected chain of line segments.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L35)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-lines-const-gl-lines-1-src-mq3-platform-win-qgl-runtime-ml-1531474368"></a>
### GL_LINES

```ml
const GL_LINES = 1
```

OpenGL primitive mode that draws independent line segments.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L31)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-never-const-gl-never-512-src-mq3-platform-win-qgl-runtime-ml-1104738825"></a>
### GL_NEVER

```ml
const GL_NEVER = 512
```

OpenGL comparison function that always rejects the fragment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L13)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-notequal-const-gl-notequal-517-src-mq3-platform-win-qgl-runtime-ml-537701620"></a>
### GL_NOTEQUAL

```ml
const GL_NOTEQUAL = 517
```

OpenGL comparison function requiring inequality with the reference.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L23)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-one-const-gl-one-1-src-mq3-platform-win-qgl-runtime-ml-1002926790"></a>
### GL_ONE

```ml
const GL_ONE = 1
```

OpenGL blend-factor selector using one.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L67)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-one-minus-dst-color-const-gl-one-minus-dst-color-775-src-mq3-platform-win-qgl-runtime-ml-1079786402"></a>
### GL_ONE_MINUS_DST_COLOR

```ml
const GL_ONE_MINUS_DST_COLOR = 775
```

OpenGL blend-factor selector using one minus the destination color.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L77)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-one-minus-src-alpha-const-gl-one-minus-src-alpha-771-src-mq3-platform-win-qgl-runtime-ml-1751708602"></a>
### GL_ONE_MINUS_SRC_ALPHA

```ml
const GL_ONE_MINUS_SRC_ALPHA = 771
```

OpenGL blend-factor selector using one minus the source alpha.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L71)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-points-const-gl-points-0-src-mq3-platform-win-qgl-runtime-ml-885677811"></a>
### GL_POINTS

```ml
const GL_POINTS = 0
```

OpenGL primitive mode that draws independent points.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L29)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-polygon-const-gl-polygon-9-src-mq3-platform-win-qgl-runtime-ml-1071205250"></a>
### GL_POLYGON

```ml
const GL_POLYGON = 9
```

OpenGL primitive mode that draws one convex polygon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L47)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-quad-strip-const-gl-quad-strip-8-src-mq3-platform-win-qgl-runtime-ml-403042999"></a>
### GL_QUAD_STRIP

```ml
const GL_QUAD_STRIP = 8
```

OpenGL primitive mode that draws a connected strip of four-vertex polygons.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L45)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-quads-const-gl-quads-7-src-mq3-platform-win-qgl-runtime-ml-538172128"></a>
### GL_QUADS

```ml
const GL_QUADS = 7
```

OpenGL primitive mode that draws independent four-vertex polygons.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L43)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-short-const-gl-short-5122-src-mq3-platform-win-qgl-runtime-ml-298955037"></a>
### GL_SHORT

```ml
const GL_SHORT = 5122
```

OpenGL scalar type for signed sixteen-bit components.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L53)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-src-alpha-const-gl-src-alpha-770-src-mq3-platform-win-qgl-runtime-ml-1424488601"></a>
### GL_SRC_ALPHA

```ml
const GL_SRC_ALPHA = 770
```

OpenGL blend-factor selector using the source alpha.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L69)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-stencil-test-const-gl-stencil-test-2960-src-mq3-platform-win-qgl-runtime-ml-1907697846"></a>
### GL_STENCIL_TEST

```ml
const GL_STENCIL_TEST = 2960
```

OpenGL capability selector controlling stencil comparison.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L97)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-texture-2d-const-gl-texture-2d-3553-src-mq3-platform-win-qgl-runtime-ml-1867257113"></a>
### GL_TEXTURE_2D

```ml
const GL_TEXTURE_2D = 3553
```

OpenGL target for two-dimensional texture objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L79)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-texture-coord-array-const-gl-texture-coord-array-32888-src-mq3-platform-win-qgl-runtime-ml-629165276"></a>
### GL_TEXTURE_COORD_ARRAY

```ml
const GL_TEXTURE_COORD_ARRAY = 32888
```

OpenGL client-array selector for texture coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L91)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-triangle-fan-const-gl-triangle-fan-6-src-mq3-platform-win-qgl-runtime-ml-1663507305"></a>
### GL_TRIANGLE_FAN

```ml
const GL_TRIANGLE_FAN = 6
```

OpenGL primitive mode that draws triangles sharing the first vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L41)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-triangle-strip-const-gl-triangle-strip-5-src-mq3-platform-win-qgl-runtime-ml-1263807948"></a>
### GL_TRIANGLE_STRIP

```ml
const GL_TRIANGLE_STRIP = 5
```

OpenGL primitive mode that draws a connected strip of triangles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L39)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-triangles-const-gl-triangles-4-src-mq3-platform-win-qgl-runtime-ml-541638215"></a>
### GL_TRIANGLES

```ml
const GL_TRIANGLES = 4
```

OpenGL primitive mode that draws independent triangles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L37)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-true-const-gl-true-1-src-mq3-platform-win-qgl-runtime-ml-1285289820"></a>
### GL_TRUE

```ml
const GL_TRUE = 1
```

OpenGL boolean true value accepted by OpenGL calls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L11)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-unsigned-byte-const-gl-unsigned-byte-5121-src-mq3-platform-win-qgl-runtime-ml-1684019116"></a>
### GL_UNSIGNED_BYTE

```ml
const GL_UNSIGNED_BYTE = 5121
```

OpenGL scalar type for unsigned eight-bit components.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L51)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-unsigned-int-const-gl-unsigned-int-5125-src-mq3-platform-win-qgl-runtime-ml-1036650978"></a>
### GL_UNSIGNED_INT

```ml
const GL_UNSIGNED_INT = 5125
```

OpenGL scalar type for unsigned thirty-two-bit components.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L59)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-unsigned-short-const-gl-unsigned-short-5123-src-mq3-platform-win-qgl-runtime-ml-820526112"></a>
### GL_UNSIGNED_SHORT

```ml
const GL_UNSIGNED_SHORT = 5123
```

OpenGL scalar type for unsigned sixteen-bit components.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L55)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-vertex-array-const-gl-vertex-array-32884-src-mq3-platform-win-qgl-runtime-ml-829569188"></a>
### GL_VERTEX_ARRAY

```ml
const GL_VERTEX_ARRAY = 32884
```

OpenGL client-array selector for vertex positions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L93)

<a id="constant-constant-mq3-platform-win-qgl-runtime-gl-zero-const-gl-zero-0-src-mq3-platform-win-qgl-runtime-ml-1387824523"></a>
### GL_ZERO

```ml
const GL_ZERO = 0
```

OpenGL blend-factor selector using zero.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L65)

<a id="function-function-mq3-platform-win-qgl-runtime-glideisvalid-function-glideisvalid-loadsucceeded-src-mq3-platform-win-qgl-runtime-ml-2044174715"></a>
### GlideIsValid

```ml
function GlideIsValid(loadSucceeded)
```

Computes `loadSucceeded` for `mq3.platform.win_qgl_runtime.GlideIsValid`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loadSucceeded` | `dynamic` | — | Input used in the result expression `loadSucceeded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L156)

<a id="function-function-mq3-platform-win-qgl-runtime-helperfunctionnames-function-helperfunctionnames-src-mq3-platform-win-qgl-runtime-ml-1191881826"></a>
### helperFunctionNames

```ml
function helperFunctionNames()
```

Lists the 7 declared names for `mq3.platform.win_qgl_runtime.helperFunctionNames`, including `BlendToName`, `BooleanToString`, `CapToString`, `FuncToString`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L220)

<a id="function-function-mq3-platform-win-qgl-runtime-isextensionentry-function-isextensionentry-name-src-mq3-platform-win-qgl-runtime-ml-582608287"></a>
### isExtensionEntry

```ml
function isExtensionEntry(name)
```

Recognizes the eight optional multitexture, array-lock, swap-interval, and 3DFX-gamma entry points.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Exact qgl/qwgl symbol name to classify as an optional extension entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L160)

<a id="function-function-mq3-platform-win-qgl-runtime-lifecyclefunctionnames-function-lifecyclefunctionnames-src-mq3-platform-win-qgl-runtime-ml-142331710"></a>
### lifecycleFunctionNames

```ml
function lifecycleFunctionNames()
```

Lists the 3 declared names for `mq3.platform.win_qgl_runtime.lifecycleFunctionNames`, including `QGL_EnableLogging`, `QGL_Init`, `QGL_Shutdown`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L222)

<a id="function-function-mq3-platform-win-qgl-runtime-logfunctionnames-function-logfunctionnames-src-mq3-platform-win-qgl-runtime-ml-1982999474"></a>
### logFunctionNames

```ml
function logFunctionNames()
```

The original declares one typed forwarding wrapper for every core GL call. MiniLang has managed arguments, so dispatch owns the common forwarding and logging semantics while this complete inventory preserves every entrypoint. win_qgl.c's logFoo wrappers are a one-to-one projection of qglFoo. Keeping the canonical qgl inventory as the source prevents the two 336-entry lists from silently diverging while retaining complete wrapper coverage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L214)

<a id="function-function-mq3-platform-win-qgl-runtime-primtostring-function-primtostring-value-src-mq3-platform-win-qgl-runtime-ml-1451758131"></a>
### PrimToString

```ml
function PrimToString(value)
```

Computes `PrimToString` from `str(value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input tested by `value==GL_TRIANGLES`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L130)

<a id="function-function-mq3-platform-win-qgl-runtime-qgl-enablelogging-function-qgl-enablelogging-state-enable-counter-src-mq3-platform-win-qgl-runtime-ml-1564945006"></a>
### QGL_EnableLogging

```ml
function QGL_EnableLogging(state, enable, counter)
```

Updates `state.logCounter`, `state.logging`, `state.logOpen`, `state.logLines` in `mq3.platform.win_qgl_runtime.QGL_EnableLogging`; returns `state.logging`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.logCounter`, `state.logging`, `state.logOpen`, `state.logLines`. |
| `enable` | `dynamic` | — | Value assigned to `state.logging`. |
| `counter` | `dynamic` | — | Value assigned to `state.logCounter`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L188)

<a id="function-function-mq3-platform-win-qgl-runtime-qgl-init-function-qgl-init-state-registry-dllname-loadsucceeded-src-mq3-platform-win-qgl-runtime-ml-912239862"></a>
### QGL_Init

```ml
function QGL_Init(state, registry, dllname, loadSucceeded)
```

Updates `state.loaded`, `state.driver` in `mq3.platform.win_qgl_runtime.QGL_Init`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.loaded`, `state.driver`. |
| `registry` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.qgl.reset`. |
| `dllname` | `dynamic` | — | Value assigned to `state.driver`. |
| `loadSucceeded` | `dynamic` | — | Input tested by `not loadSucceeded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L168)

<a id="function-function-mq3-platform-win-qgl-runtime-qgl-shutdown-function-qgl-shutdown-state-registry-src-mq3-platform-win-qgl-runtime-ml-416293170"></a>
### QGL_Shutdown

```ml
function QGL_Shutdown(state, registry)
```

Updates `state.loaded`, `state.driver`, `state.logging`, `state.logCounter`, `state.logOpen` in `mq3.platform.win_qgl_runtime.QGL_Shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.loaded`, `state.driver`, `state.logging`, `state.logCounter`, `state.logOpen`. |
| `registry` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.qgl.reset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L180)

- [mq3.platform.win_qgl_runtime.State](Type-mq3-platform-win-qgl-runtime-state-289518214.md) — struct
<a id="function-function-mq3-platform-win-qgl-runtime-typetostring-function-typetostring-value-src-mq3-platform-win-qgl-runtime-ml-856878207"></a>
### TypeToString

```ml
function TypeToString(value)
```

Computes `TypeToString` from `"!!! UNKNOWN !!!"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input tested by `value==GL_BYTE`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L144)
