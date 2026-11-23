# `src/mq3/engine/user_files.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.engine.user_files`](Package-mq3-engine-user-files-1711712849.md)

Reachable from entry: **no**

## Imports

- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency

## Declarations

<a id="function-function-mq3-engine-user-files-atomicwrite-function-atomicwrite-store-name-data-src-mq3-engine-user-files-ml-1266872470"></a>
### atomicWrite

```ml
function atomicWrite(store, name, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L45)

<a id="function-function-mq3-engine-user-files-close-function-close-store-number-src-mq3-engine-user-files-ml-1485099860"></a>
### close

```ml
function close(store, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L121)

<a id="function-function-mq3-engine-user-files-closeall-function-closeall-store-src-mq3-engine-user-files-ml-144059629"></a>
### closeAll

```ml
function closeAll(store)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L126)

<a id="function-function-mq3-engine-user-files-create-function-create-archive-root-src-mq3-engine-user-files-ml-1586101958"></a>
### create

```ml
function create(archive, root)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `root` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L26)

- [mq3.engine.user_files.Cursor](Type-mq3-engine-user-files-cursor-546505287.md) — struct
<a id="function-function-mq3-engine-user-files-defaultroot-function-defaultroot-src-mq3-engine-user-files-ml-913274532"></a>
### defaultRoot

```ml
function defaultRoot()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L21)

<a id="extern_function-extern-function-mq3-engine-user-files-defaultrootnative-extern-function-defaultrootnative-output-as-bytes-capacity-as-i32-from-miniquake3-userfiles-dll-symbol-mq3-user-default-root-returns-i32-src-mq3-engine-user-files-ml-1342553966"></a>
### defaultRootNative

```ml
extern function defaultRootNative(output as bytes, capacity as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_default_root" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `bytes` | — |  |
| `capacity` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L12)

<a id="function-function-mq3-engine-user-files-flush-function-flush-store-number-src-mq3-engine-user-files-ml-1019294644"></a>
### flush

```ml
function flush(store, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L87)

<a id="constant-constant-mq3-engine-user-files-max-bytes-const-max-bytes-67108864-src-mq3-engine-user-files-ml-855725439"></a>
### MAX_BYTES

```ml
const MAX_BYTES = 67108864
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L9)

<a id="constant-constant-mq3-engine-user-files-max-handles-const-max-handles-64-src-mq3-engine-user-files-ml-1491690861"></a>
### MAX_HANDLES

```ml
const MAX_HANDLES = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L8)

<a id="function-function-mq3-engine-user-files-open-function-open-store-name-mode-src-mq3-engine-user-files-ml-351031033"></a>
### open

```ml
function open(store, name, mode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L50)

<a id="function-function-mq3-engine-user-files-read-function-read-store-number-count-src-mq3-engine-user-files-ml-932991637"></a>
### read

```ml
function read(store, number, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L80)

<a id="function-function-mq3-engine-user-files-readall-function-readall-store-name-src-mq3-engine-user-files-ml-1949964224"></a>
### readAll

```ml
function readAll(store, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L40)

<a id="function-function-mq3-engine-user-files-readuser-function-readuser-store-name-src-mq3-engine-user-files-ml-956862378"></a>
### readUser

```ml
function readUser(store, name)
```

An absent user file is void; invalid/inaccessible files are errors, not archive fallbacks. In particular append never copies an archive asset.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L29)

<a id="extern_function-extern-function-mq3-engine-user-files-resolvenative-extern-function-resolvenative-root-as-ptr-rootlength-as-i32-name-as-ptr-namelength-as-i32-output-as-bytes-capacity-as-i32-from-miniquake3-userfiles-dll-symbol-mq3-user-resolve-returns-i32-src-mq3-engine-user-files-ml-1271444584"></a>
### resolveNative

```ml
extern function resolveNative(root as ptr, rootLength as i32, name as ptr, nameLength as i32, output as bytes, capacity as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_resolve" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `ptr` | — |  |
| `rootLength` | `i32` | — |  |
| `name` | `ptr` | — |  |
| `nameLength` | `i32` | — |  |
| `output` | `bytes` | — |  |
| `capacity` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L13)

<a id="function-function-mq3-engine-user-files-samepath-function-samepath-store-first-second-src-mq3-engine-user-files-ml-1640249123"></a>
### samePath

```ml
function samePath(store, first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L17)

<a id="extern_function-extern-function-mq3-engine-user-files-samepathnative-extern-function-samepathnative-root-as-ptr-rootlength-as-i32-first-as-ptr-firstlength-as-i32-second-as-ptr-secondlength-as-i32-from-miniquake3-userfiles-dll-symbol-mq3-user-same-path-returns-i32-src-mq3-engine-user-files-ml-1342273876"></a>
### samePathNative

```ml
extern function samePathNative(root as ptr, rootLength as i32, first as ptr, firstLength as i32, second as ptr, secondLength as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_same_path" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `ptr` | — |  |
| `rootLength` | `i32` | — |  |
| `first` | `ptr` | — |  |
| `firstLength` | `i32` | — |  |
| `second` | `ptr` | — |  |
| `secondLength` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L16)

<a id="function-function-mq3-engine-user-files-seek-function-seek-store-number-offset-origin-src-mq3-engine-user-files-ml-1903187069"></a>
### seek

```ml
function seek(store, number, offset, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L114)

<a id="extern_function-extern-function-mq3-engine-user-files-sizenative-extern-function-sizenative-root-as-ptr-rootlength-as-i32-name-as-ptr-namelength-as-i32-from-miniquake3-userfiles-dll-symbol-mq3-user-size-returns-i32-src-mq3-engine-user-files-ml-216785429"></a>
### sizeNative

```ml
extern function sizeNative(root as ptr, rootLength as i32, name as ptr, nameLength as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_size" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `ptr` | — |  |
| `rootLength` | `i32` | — |  |
| `name` | `ptr` | — |  |
| `nameLength` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L15)

- [mq3.engine.user_files.Store](Type-mq3-engine-user-files-store-856467318.md) — struct
<a id="function-function-mq3-engine-user-files-valid-function-valid-store-number-src-mq3-engine-user-files-ml-238142512"></a>
### valid

```ml
function valid(store, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L79)

<a id="function-function-mq3-engine-user-files-write-function-write-store-number-data-src-mq3-engine-user-files-ml-125801434"></a>
### write

```ml
function write(store, number, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L93)

<a id="extern_function-extern-function-mq3-engine-user-files-writenative-extern-function-writenative-root-as-ptr-rootlength-as-i32-name-as-ptr-namelength-as-i32-data-as-ptr-length-as-i32-from-miniquake3-userfiles-dll-symbol-mq3-user-write-atomic-returns-i32-src-mq3-engine-user-files-ml-1543964437"></a>
### writeNative

```ml
extern function writeNative(root as ptr, rootLength as i32, name as ptr, nameLength as i32, data as ptr, length as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_write_atomic" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `ptr` | — |  |
| `rootLength` | `i32` | — |  |
| `name` | `ptr` | — |  |
| `nameLength` | `i32` | — |  |
| `data` | `ptr` | — |  |
| `length` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L14)
