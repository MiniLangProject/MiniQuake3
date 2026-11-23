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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fresh` | `dynamic` | — |  |
| `old` | `dynamic` | — |  |
| `table` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/native_md3.ml#L11)

<a id="extern_function-extern-function-mq3-renderer-native-md3-lerpnative-extern-function-lerpnative-fresh-as-ptr-freshbytes-as-i32-old-as-ptr-oldbytes-as-i32-table-as-ptr-tablebytes-as-i32-output-as-ptr-outputbytes-as-i32-count-as-i32-backlerp-as-double-from-miniquake3-qvm-dll-symbol-mq3-md3-lerp-returns-i32-src-mq3-renderer-native-md3-ml-1194936936"></a>
### lerpNative

```ml
extern function lerpNative(fresh as ptr, freshBytes as i32, old as ptr, oldBytes as i32, table as ptr, tableBytes as i32, output as ptr, outputBytes as i32, count as i32, backlerp as double) from "miniquake3_qvm.dll" symbol "mq3_md3_lerp" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fresh` | `ptr` | — |  |
| `freshBytes` | `i32` | — |  |
| `old` | `ptr` | — |  |
| `oldBytes` | `i32` | — |  |
| `table` | `ptr` | — |  |
| `tableBytes` | `i32` | — |  |
| `output` | `ptr` | — |  |
| `outputBytes` | `i32` | — |  |
| `count` | `i32` | — |  |
| `backlerp` | `double` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/native_md3.ml#L5)

<a id="function-function-mq3-renderer-native-md3-tablebytes-function-tablebytes-table-src-mq3-renderer-native-md3-ml-510421416"></a>
### tableBytes

```ml
function tableBytes(table)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `table` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/native_md3.ml#L7)

<a id="function-function-mq3-renderer-native-md3-transform-function-transform-input-count-origin-axis-src-mq3-renderer-native-md3-ml-867403122"></a>
### transform

```ml
function transform(input, count, origin, axis)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/native_md3.ml#L15)

<a id="extern_function-extern-function-mq3-renderer-native-md3-transformnative-extern-function-transformnative-input-as-ptr-inputbytes-as-i32-output-as-ptr-outputbytes-as-i32-count-as-i32-ox-as-double-oy-as-double-oz-as-double-a00-as-double-a01-as-double-a02-as-double-a10-as-double-a11-as-double-a12-as-double-a20-as-double-a21-as-double-a22-as-double-from-miniquake3-qvm-dll-symbol-mq3-md3-transform-returns-i32-src-mq3-renderer-native-md3-ml-1778895671"></a>
### transformNative

```ml
extern function transformNative(input as ptr, inputBytes as i32, output as ptr, outputBytes as i32, count as i32, ox as double, oy as double, oz as double, a00 as double, a01 as double, a02 as double, a10 as double, a11 as double, a12 as double, a20 as double, a21 as double, a22 as double) from "miniquake3_qvm.dll" symbol "mq3_md3_transform" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `ptr` | — |  |
| `inputBytes` | `i32` | — |  |
| `output` | `ptr` | — |  |
| `outputBytes` | `i32` | — |  |
| `count` | `i32` | — |  |
| `ox` | `double` | — |  |
| `oy` | `double` | — |  |
| `oz` | `double` | — |  |
| `a00` | `double` | — |  |
| `a01` | `double` | — |  |
| `a02` | `double` | — |  |
| `a10` | `double` | — |  |
| `a11` | `double` | — |  |
| `a12` | `double` | — |  |
| `a20` | `double` | — |  |
| `a21` | `double` | — |  |
| `a22` | `double` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/native_md3.ml#L6)

<a id="function-function-mq3-renderer-native-md3-unpack-function-unpack-data-count-src-mq3-renderer-native-md3-ml-1251557883"></a>
### unpack

```ml
function unpack(data, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/native_md3.ml#L19)
