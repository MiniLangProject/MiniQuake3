# `src/mq3/collision/native_planes.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.collision.native_planes`](Package-mq3-collision-native-planes-1058328067.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-collision-native-planes-find-function-find-cache-count-normal-a-b-c-src-mq3-collision-native-planes-ml-1733734304"></a>
### find

```ml
function find(cache, count, normal, a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/native_planes.ml#L8)

<a id="function-function-mq3-collision-native-planes-find2-function-find2-cache-count-p-src-mq3-collision-native-planes-ml-102407311"></a>
### find2

```ml
function find2(cache, count, p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/native_planes.ml#L9)

<a id="extern_function-extern-function-mq3-collision-native-planes-find2native-extern-function-find2native-cache-as-ptr-bytes-as-i32-count-as-i32-x-as-double-y-as-double-z-as-double-distance-as-double-from-miniquake3-qvm-dll-symbol-mq3-patch-find-plane2-returns-i32-src-mq3-collision-native-planes-ml-748943223"></a>
### find2Native

```ml
extern function find2Native(cache as ptr, bytes as i32, count as i32, x as double, y as double, z as double, distance as double) from "miniquake3_qvm.dll" symbol "mq3_patch_find_plane2" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `ptr` | — |  |
| `bytes` | `i32` | — |  |
| `count` | `i32` | — |  |
| `x` | `double` | — |  |
| `y` | `double` | — |  |
| `z` | `double` | — |  |
| `distance` | `double` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/native_planes.ml#L6)

<a id="extern_function-extern-function-mq3-collision-native-planes-findnative-extern-function-findnative-cache-as-ptr-bytes-as-i32-count-as-i32-nx-as-double-ny-as-double-nz-as-double-ax-as-double-ay-as-double-az-as-double-bx-as-double-by-as-double-bz-as-double-cx-as-double-cy-as-double-cz-as-double-from-miniquake3-qvm-dll-symbol-mq3-patch-find-plane-returns-i32-src-mq3-collision-native-planes-ml-151718521"></a>
### findNative

```ml
extern function findNative(cache as ptr, bytes as i32, count as i32, nx as double, ny as double, nz as double, ax as double, ay as double, az as double, bx as double, by as double, bz as double, cx as double, cy as double, cz as double) from "miniquake3_qvm.dll" symbol "mq3_patch_find_plane" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `ptr` | — |  |
| `bytes` | `i32` | — |  |
| `count` | `i32` | — |  |
| `nx` | `double` | — |  |
| `ny` | `double` | — |  |
| `nz` | `double` | — |  |
| `ax` | `double` | — |  |
| `ay` | `double` | — |  |
| `az` | `double` | — |  |
| `bx` | `double` | — |  |
| `by` | `double` | — |  |
| `bz` | `double` | — |  |
| `cx` | `double` | — |  |
| `cy` | `double` | — |  |
| `cz` | `double` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/native_planes.ml#L5)

<a id="function-function-mq3-collision-native-planes-store-function-store-cache-index-p-src-mq3-collision-native-planes-ml-1525919570"></a>
### store

```ml
function store(cache, index, p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/native_planes.ml#L7)

<a id="extern_function-extern-function-mq3-collision-native-planes-storenative-extern-function-storenative-cache-as-ptr-count-as-i32-index-as-i32-x-as-double-y-as-double-z-as-double-distance-as-double-from-miniquake3-qvm-dll-symbol-mq3-patch-store-plane-returns-i32-src-mq3-collision-native-planes-ml-214270594"></a>
### storeNative

```ml
extern function storeNative(cache as ptr, count as i32, index as i32, x as double, y as double, z as double, distance as double) from "miniquake3_qvm.dll" symbol "mq3_patch_store_plane" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `ptr` | — |  |
| `count` | `i32` | — |  |
| `index` | `i32` | — |  |
| `x` | `double` | — |  |
| `y` | `double` | — |  |
| `z` | `double` | — |  |
| `distance` | `double` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/native_planes.ml#L4)
