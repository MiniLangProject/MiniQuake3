# `src/mq3/renderer/native_md3.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.native_md3`](Package-mq3-renderer-native-md3-726710951.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-renderer-native-md3-lerp-function-lerp-fresh-old-table-count-backlerp-src-mq3-renderer-native-md3-ml-751290974"></a>
### lerp

```ml
function lerp(fresh, old, table, count, backlerp)
```

Allocates 24-byte output records and interpolates current/previous MD3 vertices through the checked native boundary.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fresh` | `dynamic` | — | Current-frame MD3 vertices encoded as 8-byte records. |
| `old` | `dynamic` | — | Previous-frame MD3 vertices encoded as 8-byte records. |
| `table` | `dynamic` | — | Packed 1024-entry float32 sine table used to decode MD3 normals. |
| `count` | `dynamic` | — | Value forwarded as `count` to `mq3.renderer.native_md3.lerpNative`. |
| `backlerp` | `dynamic` | — | Value forwarded as `backlerp` to `mq3.renderer.native_md3.lerpNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/native_md3.ml#L50)

<a id="extern_function-extern-function-mq3-renderer-native-md3-lerpnative-extern-function-lerpnative-fresh-as-ptr-freshbytes-as-i32-old-as-ptr-oldbytes-as-i32-table-as-ptr-tablebytes-as-i32-output-as-ptr-outputbytes-as-i32-count-as-i32-backlerp-as-double-from-miniquake3-qvm-dll-symbol-mq3-md3-lerp-returns-i32-src-mq3-renderer-native-md3-ml-1194936936"></a>
### lerpNative

```ml
extern function lerpNative(fresh as ptr, freshBytes as i32, old as ptr, oldBytes as i32, table as ptr, tableBytes as i32, output as ptr, outputBytes as i32, count as i32, backlerp as double) from "miniquake3_qvm.dll" symbol "mq3_md3_lerp" returns i32
```

Interpolates MD3 frame vertices and normals into the native packed output buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fresh` | `ptr` | — | Read-only MD3 current-frame vertices: 8 bytes per vertex. |
| `freshBytes` | `i32` | — | Size of the current-frame vertex buffer in bytes. |
| `old` | `ptr` | — | Read-only MD3 previous-frame vertices: 8 bytes per vertex. |
| `oldBytes` | `i32` | — | Size of the previous-frame vertex buffer in bytes. |
| `table` | `ptr` | — | Read-only packed 1024-entry float32 sine table. |
| `tableBytes` | `i32` | — | Sine-table storage size in bytes; must equal 4096. |
| `output` | `ptr` | — | Writable records containing position XYZ then normal XYZ as six float32 values. |
| `outputBytes` | `i32` | — | Capacity of the native output buffer in bytes. |
| `count` | `i32` | — | Number of vertices to interpolate; output requires count * 24 bytes. |
| `backlerp` | `double` | — | Finite previous-frame weight in 0..1; current-frame weight is 1 - backlerp. |


**Returns:** 1 when interpolation succeeds; 0 for rejected native input.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/native_md3.ml#L17)

<a id="function-function-mq3-renderer-native-md3-tablebytes-function-tablebytes-table-src-mq3-renderer-native-md3-ml-510421416"></a>
### tableBytes

```ml
function tableBytes(table)
```

Packs the 1024 normal-lookup values as little-endian float32 bytes for native MD3 interpolation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `table` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/native_md3.ml#L40)

<a id="function-function-mq3-renderer-native-md3-transform-function-transform-input-count-origin-axis-src-mq3-renderer-native-md3-ml-867403122"></a>
### transform

```ml
function transform(input, count, origin, axis)
```

Allocates transformed position/normal records and applies the supplied three-axis orientation and translation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — | Packed position/normal records, 24 bytes per vertex. |
| `count` | `dynamic` | — | Value forwarded as `count` to `mq3.renderer.native_md3.transformNative`. |
| `origin` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `axis` | `dynamic` | — | Three three-component basis vectors used for position and normal transformation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/native_md3.ml#L59)

<a id="extern_function-extern-function-mq3-renderer-native-md3-transformnative-extern-function-transformnative-input-as-ptr-inputbytes-as-i32-output-as-ptr-outputbytes-as-i32-count-as-i32-ox-as-double-oy-as-double-oz-as-double-a00-as-double-a01-as-double-a02-as-double-a10-as-double-a11-as-double-a12-as-double-a20-as-double-a21-as-double-a22-as-double-from-miniquake3-qvm-dll-symbol-mq3-md3-transform-returns-i32-src-mq3-renderer-native-md3-ml-1778895671"></a>
### transformNative

```ml
extern function transformNative(input as ptr, inputBytes as i32, output as ptr, outputBytes as i32, count as i32, ox as double, oy as double, oz as double, a00 as double, a01 as double, a02 as double, a10 as double, a11 as double, a12 as double, a20 as double, a21 as double, a22 as double) from "miniquake3_qvm.dll" symbol "mq3_md3_transform" returns i32
```

Transforms packed MD3 geometry using the supplied entity transform.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `ptr` | — | Read-only 24-byte records containing position XYZ followed by normal XYZ. |
| `inputBytes` | `i32` | — | Input-buffer length in bytes. |
| `output` | `ptr` | — | Writable 24-byte transformed position/normal records. |
| `outputBytes` | `i32` | — | Capacity of the native output buffer in bytes. |
| `count` | `i32` | — | Number of position/normal records to transform. |
| `ox` | `double` | — | X component of the entity translation. |
| `oy` | `double` | — | Y component of the entity translation. |
| `oz` | `double` | — | Z component of the entity translation. |
| `a00` | `double` | — | Component 0 of transform basis axis 0. |
| `a01` | `double` | — | Component 1 of transform basis axis 0. |
| `a02` | `double` | — | Component 2 of transform basis axis 0. |
| `a10` | `double` | — | Component 0 of transform basis axis 1. |
| `a11` | `double` | — | Component 1 of transform basis axis 1. |
| `a12` | `double` | — | Component 2 of transform basis axis 1. |
| `a20` | `double` | — | Component 0 of transform basis axis 2. |
| `a21` | `double` | — | Component 1 of transform basis axis 2. |
| `a22` | `double` | — | Component 2 of transform basis axis 2. |


**Returns:** 1 when transformation succeeds; 0 for rejected native input.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/native_md3.ml#L37)

<a id="function-function-mq3-renderer-native-md3-unpack-function-unpack-data-count-src-mq3-renderer-native-md3-ml-1251557883"></a>
### unpack

```ml
function unpack(data, count)
```

Decodes 24-byte native vertex records into separate position and normal arrays.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.readU32`. |
| `count` | `dynamic` | — | Argument 1 supplied to `array`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/native_md3.ml#L66)
