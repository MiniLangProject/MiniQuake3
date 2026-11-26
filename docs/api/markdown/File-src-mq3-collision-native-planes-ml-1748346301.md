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

Search the packed plane cache using a normal and three triangle vertices; return the native plane index or negative sentinel.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Read-only packed plane bytes. |
| `count` | `dynamic` | — | Number of populated plane records to search, at most 2048. |
| `normal` | `dynamic` | — | Three-component candidate normal; cached normals must not oppose it. |
| `a` | `dynamic` | — | First three-component point on the candidate plane. |
| `b` | `dynamic` | — | Second three-component point on the candidate plane. |
| `c` | `dynamic` | — | Third three-component point on the candidate plane. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/native_planes.ml#L54)

<a id="function-function-mq3-collision-native-planes-find2-function-find2-cache-count-p-src-mq3-collision-native-planes-ml-102407311"></a>
### find2

```ml
function find2(cache, count, p)
```

Search for a plane or its reversed orientation in the packed cache; return twice the plane index plus its reversal bit.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Read-only packed binary32 plane bytes. |
| `count` | `dynamic` | — | Number of populated candidate plane records, at most 2048. |
| `p` | `dynamic` | — | Plane record supplying the normal and distance to match; negative results denote no match or invalid bounds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/native_planes.ml#L59)

<a id="extern_function-extern-function-mq3-collision-native-planes-find2native-extern-function-find2native-cache-as-ptr-bytes-as-i32-count-as-i32-x-as-double-y-as-double-z-as-double-distance-as-double-from-miniquake3-qvm-dll-symbol-mq3-patch-find-plane2-returns-i32-src-mq3-collision-native-planes-ml-748943223"></a>
### find2Native

```ml
extern function find2Native(cache as ptr, bytes as i32, count as i32, x as double, y as double, z as double, distance as double) from "miniquake3_qvm.dll" symbol "mq3_patch_find_plane2" returns i32
```

Find a plane or its reversed orientation using normal and distance tolerances.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `ptr` | — | Read-only packed binary32 plane cache. |
| `bytes` | `i32` | — | Cache length in bytes. |
| `count` | `i32` | — | Number of candidate planes, at most 2048. |
| `x` | `double` | — | Candidate normal X component. |
| `y` | `double` | — | Candidate normal Y component. |
| `z` | `double` | — | Candidate normal Z component. |
| `distance` | `double` | — | Candidate plane distance. |


**Returns:** Twice the plane index plus the reversal bit; -1 means no match and -2 means invalid cache/count bounds.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/native_planes.ml#L41)

<a id="extern_function-extern-function-mq3-collision-native-planes-findnative-extern-function-findnative-cache-as-ptr-bytes-as-i32-count-as-i32-nx-as-double-ny-as-double-nz-as-double-ax-as-double-ay-as-double-az-as-double-bx-as-double-by-as-double-bz-as-double-cx-as-double-cy-as-double-cz-as-double-from-miniquake3-qvm-dll-symbol-mq3-patch-find-plane-returns-i32-src-mq3-collision-native-planes-ml-151718521"></a>
### findNative

```ml
extern function findNative(cache as ptr, bytes as i32, count as i32, nx as double, ny as double, nz as double, ax as double, ay as double, az as double, bx as double, by as double, bz as double, cx as double, cy as double, cz as double) from "miniquake3_qvm.dll" symbol "mq3_patch_find_plane" returns i32
```

Find the first cached plane whose normal has dot >= 0 with the requested normal and whose three point distances lie within +/-0.1.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `ptr` | — | Read-only packed binary32 plane cache. |
| `bytes` | `i32` | — | Cache length in bytes. |
| `count` | `i32` | — | Number of candidate planes, from zero through 2048. |
| `nx` | `double` | — | Candidate normal X component. |
| `ny` | `double` | — | Candidate normal Y component. |
| `nz` | `double` | — | Candidate normal Z component. |
| `ax` | `double` | — | X coordinate of triangle vertex A. |
| `ay` | `double` | — | Y coordinate of triangle vertex A. |
| `az` | `double` | — | Z coordinate of triangle vertex A. |
| `bx` | `double` | — | X coordinate of triangle vertex B. |
| `by` | `double` | — | Y coordinate of triangle vertex B. |
| `bz` | `double` | — | Z coordinate of triangle vertex B. |
| `cx` | `double` | — | X coordinate of triangle vertex C. |
| `cy` | `double` | — | Y coordinate of triangle vertex C. |
| `cz` | `double` | — | Z coordinate of triangle vertex C. |


**Returns:** The first matching zero-based plane index, -1 for no match, or -2 for invalid cache/count bounds.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/native_planes.ml#L31)

<a id="function-function-mq3-collision-native-planes-store-function-store-cache-index-p-src-mq3-collision-native-planes-ml-1525919570"></a>
### store

```ml
function store(cache, index, p)
```

Pack a MiniLang plane into the selected 16-byte native cache slot; return the native success flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Mutable byte buffer of packed binary32 normal/distance plane records. |
| `index` | `dynamic` | — | Zero-based plane slot, below 2048 and within the cache capacity. |
| `p` | `dynamic` | — | Plane record with a three-component normal and distance. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/native_planes.ml#L46)

<a id="extern_function-extern-function-mq3-collision-native-planes-storenative-extern-function-storenative-cache-as-ptr-count-as-i32-index-as-i32-x-as-double-y-as-double-z-as-double-distance-as-double-from-miniquake3-qvm-dll-symbol-mq3-patch-store-plane-returns-i32-src-mq3-collision-native-planes-ml-214270594"></a>
### storeNative

```ml
extern function storeNative(cache as ptr, count as i32, index as i32, x as double, y as double, z as double, distance as double) from "miniquake3_qvm.dll" symbol "mq3_patch_store_plane" returns i32
```

Store one patch plane as four binary32 values in the native plane cache.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `ptr` | — | Writable plane cache. |
| `count` | `i32` | — | Cache capacity in bytes, despite this binding parameter name. |
| `index` | `i32` | — | Zero-based plane slot, below 2048. |
| `x` | `double` | — | Plane-normal X component. |
| `y` | `double` | — | Plane-normal Y component. |
| `z` | `double` | — | Plane-normal Z component. |
| `distance` | `double` | — | Plane distance from the origin. |


**Returns:** 1 on success, or 0 when the cache bounds or plane index are invalid.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/native_planes.ml#L13)
