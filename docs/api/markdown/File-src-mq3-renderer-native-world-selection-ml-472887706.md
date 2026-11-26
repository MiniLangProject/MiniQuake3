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

Writes the culling mode at byte offset 64 of a 72-byte native world-face record.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — | Writable packed world-face array with 72-byte records. |
| `bytes` | `i32` | — | Total capacity of records in bytes. |
| `index` | `i32` | — | Zero-based face-record index. |
| `mode` | `i32` | — | Cull selector: 0 front-side convention, 1 two-sided, or 2 reversed convention. |


**Returns:** 1 when written; 0 for an invalid record or a mode outside 0..2.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/native_world_selection.ml#L26)

<a id="function-function-mq3-renderer-native-world-selection-filter-function-filter-cache-visible-camera-cfg-axes-frustum-src-mq3-renderer-native-world-selection-ml-1504617740"></a>
### filter

```ml
function filter(cache, visible, camera, cfg, axes, frustum)
```

Runs native world-face selection using cached bounds, visible face indices, camera axes, and frustum settings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Record providing `cache.nativeFaces`, `cache.map`, `cache.nativeOutput`, `cache.nativePrevious`. |
| `visible` | `dynamic` | — | Packed little-endian 32-bit visible face indices. |
| `camera` | `dynamic` | — | Record providing `camera.position`. |
| `cfg` | `dynamic` | — | Record providing `cfg.backfaceCull`, `cfg.nearDistance`, `cfg.farDistance`. |
| `axes` | `dynamic` | — | Nested indexed data; outer entries read at `0`, `1`, `2`. |
| `frustum` | `dynamic` | — | Record providing `frustum.slopeX`, `frustum.slopeY`, `frustum.radiusScaleX`, `frustum.radiusScaleY`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/native_world_selection.ml#L85)

<a id="extern_function-extern-function-mq3-renderer-native-world-selection-filternative-extern-function-filternative-records-as-ptr-recordbytes-as-i32-facecount-as-i32-visible-as-ptr-visiblebytes-as-i32-visiblecount-as-i32-output-as-ptr-outputbytes-as-i32-previous-as-ptr-previousbytes-as-i32-x-as-double-y-as-double-z-as-double-fx-as-double-fy-as-double-fz-as-double-rx-as-double-ry-as-double-rz-as-double-ux-as-double-uy-as-double-uz-as-double-neardistance-as-double-fardistance-as-double-slopex-as-double-slopey-as-double-radiusscalex-as-double-radiusscaley-as-double-backfacecull-as-i32-from-miniquake3-qvm-dll-symbol-mq3-world-filter-returns-i32-src-mq3-renderer-native-world-selection-ml-1208568251"></a>
### filterNative

```ml
extern function filterNative(records as ptr, recordBytes as i32, faceCount as i32, visible as ptr, visibleBytes as i32, visibleCount as i32, output as ptr, outputBytes as i32, previous as ptr, previousBytes as i32, x as double, y as double, z as double, fx as double, fy as double, fz as double, rx as double, ry as double, rz as double, ux as double, uy as double, uz as double, nearDistance as double, farDistance as double, slopeX as double, slopeY as double, radiusScaleX as double, radiusScaleY as double, backfaceCull as i32) from "miniquake3_qvm.dll" symbol "mq3_world_filter" returns i32
```

Filters visible BSP face indices by distance, frustum, and backface tests, then updates selection statistics and history.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — | Read-only 72-byte world-face records. |
| `recordBytes` | `i32` | — | Size of the packed face-record buffer in bytes. |
| `faceCount` | `i32` | — | Number of 72-byte face records available for selection. |
| `visible` | `ptr` | — | Packed 32-bit visible face indices. |
| `visibleBytes` | `i32` | — | Size of the packed visible-index buffer in bytes. |
| `visibleCount` | `i32` | — | Number of 32-bit face indices in the visible buffer. |
| `output` | `ptr` | — | Writable selection record: 32-byte statistics header followed by 32-bit selected indices. |
| `outputBytes` | `i32` | — | Capacity of the native output buffer in bytes. |
| `previous` | `ptr` | — | Writable prior-selection record used to detect unchanged selections and then replaced with the current result. |
| `previousBytes` | `i32` | — | Capacity of the previous-selection buffer in bytes. |
| `x` | `double` | — | X component of the position. |
| `y` | `double` | — | Y component of the position. |
| `z` | `double` | — | Z component of the position. |
| `fx` | `double` | — | X component of the camera forward axis. |
| `fy` | `double` | — | Y component of the camera forward axis. |
| `fz` | `double` | — | Z component of the camera forward axis. |
| `rx` | `double` | — | X component of the camera right axis. |
| `ry` | `double` | — | Y component of the camera right axis. |
| `rz` | `double` | — | Z component of the camera right axis. |
| `ux` | `double` | — | X component of the camera up axis. |
| `uy` | `double` | — | Y component of the camera up axis. |
| `uz` | `double` | — | Z component of the camera up axis. |
| `nearDistance` | `double` | — | Near clipping distance in camera-space units. |
| `farDistance` | `double` | — | Far clipping distance in camera-space units. |
| `slopeX` | `double` | — | Horizontal frustum slope used by the sphere-plane test. |
| `slopeY` | `double` | — | Vertical frustum slope used by the sphere-plane test. |
| `radiusScaleX` | `double` | — | Horizontal frustum-plane normal length used to expand by radius. |
| `radiusScaleY` | `double` | — | Vertical frustum-plane normal length used to expand by radius. |
| `backfaceCull` | `i32` | — | Nonzero enables per-face backface rejection. |


**Returns:** 1 when selection completes; 0 for invalid buffers/indices or triangle-count overflow.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/native_world_selection.ml#L58)

<a id="function-function-mq3-renderer-native-world-selection-packindexes-function-packindexes-indexes-src-mq3-renderer-native-world-selection-ml-1428091162"></a>
### packIndexes

```ml
function packIndexes(indexes)
```

Returns `result` from `mq3.renderer.native_world_selection.packIndexes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `indexes` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/native_world_selection.ml#L75)

<a id="function-function-mq3-renderer-native-world-selection-setcullmode-function-setcullmode-records-index-mode-src-mq3-renderer-native-world-selection-ml-2086223443"></a>
### setCullMode

```ml
function setCullMode(records, index, mode)
```

Calls `mq3.renderer.native_world_selection.cullModeNative` with `(nativeBytesPtr(records),len(records),index,mode)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `dynamic` | — | Input used in the result expression `cullModeNative(nativeBytesPtr(records),len(records),index,mode)`. |
| `index` | `dynamic` | — | Value forwarded as `index` to `mq3.renderer.native_world_selection.cullModeNative`. |
| `mode` | `dynamic` | — | Value forwarded as `mode` to `mq3.renderer.native_world_selection.cullModeNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/native_world_selection.ml#L72)

<a id="function-function-mq3-renderer-native-world-selection-store-function-store-records-index-kind-triangles-center-radius-normal-src-mq3-renderer-native-world-selection-ml-1981308951"></a>
### store

```ml
function store(records, index, kind, triangles, center, radius, normal)
```

Calls `mq3.renderer.native_world_selection.storeNative` with `(nativeBytesPtr(records),len(records),index,kind,triangles,center[0],center[1],center[2],radius,normal[0],normal[1],normal[2])` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `dynamic` | — | Input used in the result expression `storeNative(nativeBytesPtr(records),len(records),index,kind,triangles,center[0],center[1],center[2],radius,normal[0],normal[1],normal[2])`. |
| `index` | `dynamic` | — | Value forwarded as `index` to `mq3.renderer.native_world_selection.storeNative`. |
| `kind` | `dynamic` | — | Value forwarded as `kind` to `mq3.renderer.native_world_selection.storeNative`. |
| `triangles` | `dynamic` | — | Value forwarded as `triangles` to `mq3.renderer.native_world_selection.storeNative`. |
| `center` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `radius` | `dynamic` | — | Value forwarded as `radius` to `mq3.renderer.native_world_selection.storeNative`. |
| `normal` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/native_world_selection.ml#L67)

<a id="extern_function-extern-function-mq3-renderer-native-world-selection-storenative-extern-function-storenative-records-as-ptr-bytes-as-i32-index-as-i32-kind-as-i32-triangles-as-i32-x-as-double-y-as-double-z-as-double-radius-as-double-nx-as-double-ny-as-double-nz-as-double-from-miniquake3-qvm-dll-symbol-mq3-world-store-face-returns-i32-src-mq3-renderer-native-world-selection-ml-1151340585"></a>
### storeNative

```ml
extern function storeNative(records as ptr, bytes as i32, index as i32, kind as i32, triangles as i32, x as double, y as double, z as double, radius as double, nx as double, ny as double, nz as double) from "miniquake3_qvm.dll" symbol "mq3_world_store_face" returns i32
```

Stores bounds, normal, kind, and triangle count in one 72-byte native world-face record.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — | Writable packed world-face array with 72-byte records. |
| `bytes` | `i32` | — | Total capacity of records in bytes. |
| `index` | `i32` | — | Zero-based record index; (index + 1) * 72 must fit. |
| `kind` | `i32` | — | BSP face kind stored without reinterpretation. |
| `triangles` | `i32` | — | Nonnegative triangle count for this face. |
| `x` | `double` | — | X component of the position. |
| `y` | `double` | — | Y component of the position. |
| `z` | `double` | — | Z component of the position. |
| `radius` | `double` | — | Bounding-sphere radius stored for this face. |
| `nx` | `double` | — | X component of the face normal. |
| `ny` | `double` | — | Y component of the face normal. |
| `nz` | `double` | — | Z component of the face normal. |


**Returns:** 1 when written; 0 for invalid pointers, record bounds, or triangle count.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/native_world_selection.ml#L19)
