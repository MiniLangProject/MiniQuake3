# `src/mq3/renderer/native_world_selection.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.native_world_selection`](Package-mq3-renderer-native-world-selection-1060483816.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="extern_function-extern-function-mq3-renderer-native-world-selection-cullmodenative-extern-function-cullmodenative-records-as-ptr-bytes-as-i32-index-as-i32-mode-as-i32-from-miniquake3-qvm-dll-symbol-mq3-world-set-cull-mode-returns-i32-src-mq3-renderer-native-world-selection-ml-1911733956"></a>
### cullModeNative

```ml
extern function cullModeNative(records as ptr, bytes as i32, index as i32, mode as i32) from "miniquake3_qvm.dll" symbol "mq3_world_set_cull_mode" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — |  |
| `bytes` | `i32` | — |  |
| `index` | `i32` | — |  |
| `mode` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/native_world_selection.ml#L6)

<a id="function-function-mq3-renderer-native-world-selection-filter-function-filter-cache-visible-camera-cfg-axes-frustum-src-mq3-renderer-native-world-selection-ml-1504617740"></a>
### filter

```ml
function filter(cache, visible, camera, cfg, axes, frustum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `visible` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `cfg` | `dynamic` | — |  |
| `axes` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/native_world_selection.ml#L13)

<a id="extern_function-extern-function-mq3-renderer-native-world-selection-filternative-extern-function-filternative-records-as-ptr-recordbytes-as-i32-facecount-as-i32-visible-as-ptr-visiblebytes-as-i32-visiblecount-as-i32-output-as-ptr-outputbytes-as-i32-previous-as-ptr-previousbytes-as-i32-x-as-double-y-as-double-z-as-double-fx-as-double-fy-as-double-fz-as-double-rx-as-double-ry-as-double-rz-as-double-ux-as-double-uy-as-double-uz-as-double-neardistance-as-double-fardistance-as-double-slopex-as-double-slopey-as-double-radiusscalex-as-double-radiusscaley-as-double-backfacecull-as-i32-from-miniquake3-qvm-dll-symbol-mq3-world-filter-returns-i32-src-mq3-renderer-native-world-selection-ml-1208568251"></a>
### filterNative

```ml
extern function filterNative(records as ptr, recordBytes as i32, faceCount as i32, visible as ptr, visibleBytes as i32, visibleCount as i32, output as ptr, outputBytes as i32, previous as ptr, previousBytes as i32, x as double, y as double, z as double, fx as double, fy as double, fz as double, rx as double, ry as double, rz as double, ux as double, uy as double, uz as double, nearDistance as double, farDistance as double, slopeX as double, slopeY as double, radiusScaleX as double, radiusScaleY as double, backfaceCull as i32) from "miniquake3_qvm.dll" symbol "mq3_world_filter" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — |  |
| `recordBytes` | `i32` | — |  |
| `faceCount` | `i32` | — |  |
| `visible` | `ptr` | — |  |
| `visibleBytes` | `i32` | — |  |
| `visibleCount` | `i32` | — |  |
| `output` | `ptr` | — |  |
| `outputBytes` | `i32` | — |  |
| `previous` | `ptr` | — |  |
| `previousBytes` | `i32` | — |  |
| `x` | `double` | — |  |
| `y` | `double` | — |  |
| `z` | `double` | — |  |
| `fx` | `double` | — |  |
| `fy` | `double` | — |  |
| `fz` | `double` | — |  |
| `rx` | `double` | — |  |
| `ry` | `double` | — |  |
| `rz` | `double` | — |  |
| `ux` | `double` | — |  |
| `uy` | `double` | — |  |
| `uz` | `double` | — |  |
| `nearDistance` | `double` | — |  |
| `farDistance` | `double` | — |  |
| `slopeX` | `double` | — |  |
| `slopeY` | `double` | — |  |
| `radiusScaleX` | `double` | — |  |
| `radiusScaleY` | `double` | — |  |
| `backfaceCull` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/native_world_selection.ml#L7)

<a id="function-function-mq3-renderer-native-world-selection-packindexes-function-packindexes-indexes-src-mq3-renderer-native-world-selection-ml-1428091162"></a>
### packIndexes

```ml
function packIndexes(indexes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `indexes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/native_world_selection.ml#L10)

<a id="function-function-mq3-renderer-native-world-selection-setcullmode-function-setcullmode-records-index-mode-src-mq3-renderer-native-world-selection-ml-2086223443"></a>
### setCullMode

```ml
function setCullMode(records, index, mode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/native_world_selection.ml#L9)

<a id="function-function-mq3-renderer-native-world-selection-store-function-store-records-index-kind-triangles-center-radius-normal-src-mq3-renderer-native-world-selection-ml-1981308951"></a>
### store

```ml
function store(records, index, kind, triangles, center, radius, normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `triangles` | `dynamic` | — |  |
| `center` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/native_world_selection.ml#L8)

<a id="extern_function-extern-function-mq3-renderer-native-world-selection-storenative-extern-function-storenative-records-as-ptr-bytes-as-i32-index-as-i32-kind-as-i32-triangles-as-i32-x-as-double-y-as-double-z-as-double-radius-as-double-nx-as-double-ny-as-double-nz-as-double-from-miniquake3-qvm-dll-symbol-mq3-world-store-face-returns-i32-src-mq3-renderer-native-world-selection-ml-1151340585"></a>
### storeNative

```ml
extern function storeNative(records as ptr, bytes as i32, index as i32, kind as i32, triangles as i32, x as double, y as double, z as double, radius as double, nx as double, ny as double, nz as double) from "miniquake3_qvm.dll" symbol "mq3_world_store_face" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — |  |
| `bytes` | `i32` | — |  |
| `index` | `i32` | — |  |
| `kind` | `i32` | — |  |
| `triangles` | `i32` | — |  |
| `x` | `double` | — |  |
| `y` | `double` | — |  |
| `z` | `double` | — |  |
| `radius` | `double` | — |  |
| `nx` | `double` | — |  |
| `ny` | `double` | — |  |
| `nz` | `double` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/native_world_selection.ml#L5)
