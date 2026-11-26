# `src/mq3/engine/user_files.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.engine.user_files`](Package-mq3-engine-user-files-1711712849.md)

Reachable from entry: **no**

## Imports

- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)
- `std/fs.ml` as `fs` → `../../a7594a0c0299/MiniLangCompilerML/std/fs.ml` — external dependency

## Declarations

<a id="function-function-mq3-engine-user-files-atomicwrite-function-atomicwrite-store-name-data-src-mq3-engine-user-files-ml-1266872470"></a>
### atomicWrite

```ml
function atomicWrite(store, name, data)
```

Apply `mq3.engine.user_files.writeNative`, `nativeBytesPtr` for atomic write in engine.user_files.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — | Record exposing `root`. |
| `name` | `dynamic` | — | Name used in `bytes(name)`. |
| `data` | `dynamic` | — | Data used in `len(data)` and `nativeBytesPtr(data)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L124)

<a id="function-function-mq3-engine-user-files-close-function-close-store-number-src-mq3-engine-user-files-ml-1485099860"></a>
### close

```ml
function close(store, number)
```

Flush and release an open user-file handle; a failed flush returns error 7793 and retains the handle for retry.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — | Mutable user-file store. |
| `number` | `dynamic` | — | Open handle to flush and release; an invalid handle is a no-op. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L226)

<a id="function-function-mq3-engine-user-files-closeall-function-closeall-store-src-mq3-engine-user-files-ml-144059629"></a>
### closeAll

```ml
function closeAll(store)
```

Close all in engine.user_files.

Validation failures include `One or more user files could not be saved`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — | Record exposing `files`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L235)

<a id="function-function-mq3-engine-user-files-create-function-create-archive-root-src-mq3-engine-user-files-ml-1586101958"></a>
### create

```ml
function create(archive, root)
```

Create `mq3.engine.user_files.Store` with archive=archive; root=root; files=array(MAX_HANDLES, void).

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Initial `archive` field stored in the returned or constructed `mq3.engine.user_files.Store` record. |
| `root` | `dynamic` | — | Initial `root` field stored in the returned or constructed `mq3.engine.user_files.Store` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L94)

- [mq3.engine.user_files.Cursor](Type-mq3-engine-user-files-cursor-546505287.md) — struct
<a id="function-function-mq3-engine-user-files-defaultroot-function-defaultroot-src-mq3-engine-user-files-ml-913274532"></a>
### defaultRoot

```ml
function defaultRoot()
```

Compute default root in engine.user_files; the normal completion returns `decode(slice(output, 0, count))`.

Validation failures include `Cannot resolve MiniQuake3 user directory`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L86)

<a id="extern_function-extern-function-mq3-engine-user-files-defaultrootnative-extern-function-defaultrootnative-output-as-bytes-capacity-as-i32-from-miniquake3-userfiles-dll-symbol-mq3-user-default-root-returns-i32-src-mq3-engine-user-files-ml-1342553966"></a>
### defaultRootNative

```ml
extern function defaultRootNative(output as bytes, capacity as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_default_root" returns i32
```

Encode the selected MiniQuake3 writable user directory as UTF-8.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `bytes` | — | Writable UTF-8 destination buffer. |
| `capacity` | `i32` | — | Destination capacity in bytes. |


**Returns:** The encoded byte length, or a negative value when the directory or output cannot be resolved.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L40)

<a id="function-function-mq3-engine-user-files-flush-function-flush-store-number-src-mq3-engine-user-files-ml-1019294644"></a>
### flush

```ml
function flush(store, number)
```

Atomically persist a dirty user-file buffer and clear its dirty flag only after a successful write.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — | User-file store and selected writable root. |
| `number` | `dynamic` | — | Open file handle whose dirty buffer is flushed; invalid handles return false. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L180)

<a id="constant-constant-mq3-engine-user-files-max-bytes-const-max-bytes-67108864-src-mq3-engine-user-files-ml-855725439"></a>
### MAX_BYTES

```ml
const MAX_BYTES = 67108864
```

Maximum number of bytes accepted by one user-file operation or buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L11)

<a id="constant-constant-mq3-engine-user-files-max-handles-const-max-handles-64-src-mq3-engine-user-files-ml-1491690861"></a>
### MAX_HANDLES

```ml
const MAX_HANDLES = 64
```

Maximum number of simultaneously open user-file handles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L9)

<a id="function-function-mq3-engine-user-files-open-function-open-store-name-mode-src-mq3-engine-user-files-ml-351031033"></a>
### open

```ml
function open(store, name, mode)
```

Open an overlay/archive read handle or initialize a writable user file; return OpenResult(handle, length), with (0, -1) on failure.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — | Mutable file store; usable handles are 1..63. Writable opens validate and atomically replace the selected overlay file. |
| `name` | `dynamic` | — | Game-relative path. Read mode prefers the user overlay; append loads only the overlay and never copies a PK3 asset. |
| `mode` | `dynamic` | — | 0=read, 1=truncate/write, 2=append, 3=append with immediate flush. Successful writable opens report length zero. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L133)

<a id="function-function-mq3-engine-user-files-read-function-read-store-number-count-src-mq3-engine-user-files-ml-932991637"></a>
### read

```ml
function read(store, number, count)
```

Read user files in engine.user_files; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — | Record exposing `files`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.engine.user_files.valid`. |
| `count` | `dynamic` | — | Count used in `(count < 0)` and `(count > remaining)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L170)

<a id="function-function-mq3-engine-user-files-readall-function-readall-store-name-src-mq3-engine-user-files-ml-1949964224"></a>
### readAll

```ml
function readAll(store, name)
```

Read the user overlay first and fall back to PK3 only when the user file is absent; propagate invalid or inaccessible overlay errors.

Validation failures include `File not found`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — | File store with the selected user root and optional PK3 archive. |
| `name` | `dynamic` | — | Game-relative asset or user-file path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L115)

<a id="function-function-mq3-engine-user-files-readuser-function-readuser-store-name-src-mq3-engine-user-files-ml-956862378"></a>
### readUser

```ml
function readUser(store, name)
```

An absent user file is void; invalid/inaccessible files are errors, not archive fallbacks. In particular append never copies an archive asset.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — | Record exposing `root`. |
| `name` | `dynamic` | — | Name used in `bytes(name)` and `("Cannot resolve user file: " + name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L99)

<a id="extern_function-extern-function-mq3-engine-user-files-resolvenative-extern-function-resolvenative-root-as-ptr-rootlength-as-i32-name-as-ptr-namelength-as-i32-output-as-bytes-capacity-as-i32-from-miniquake3-userfiles-dll-symbol-mq3-user-resolve-returns-i32-src-mq3-engine-user-files-ml-1271444584"></a>
### resolveNative

```ml
extern function resolveNative(root as ptr, rootLength as i32, name as ptr, nameLength as i32, output as bytes, capacity as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_resolve" returns i32
```

Resolve a validated game-relative filename beneath the selected writable user directory.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `ptr` | — | UTF-8 root-directory bytes. |
| `rootLength` | `i32` | — | Root-directory byte length. |
| `name` | `ptr` | — | UTF-8 relative qpath bytes. |
| `nameLength` | `i32` | — | Relative qpath byte length. |
| `output` | `bytes` | — | Writable UTF-8 resolved-path buffer. |
| `capacity` | `i32` | — | Resolved-path buffer capacity in bytes. |


**Returns:** The encoded resolved-path byte length, or a negative value for an invalid/inaccessible path or insufficient output.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L49)

<a id="function-function-mq3-engine-user-files-samepath-function-samepath-store-first-second-src-mq3-engine-user-files-ml-1640249123"></a>
### samePath

```ml
function samePath(store, first, second)
```

Compute same path in engine.user_files; the normal completion returns `samePathNative(nativeBytesPtr(root), len(root), nativeBytesPtr(a), len(a), nativeBytesPtr(b), len(b))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — | Record exposing `root`. |
| `first` | `dynamic` | — | First used in `bytes(first)`. |
| `second` | `dynamic` | — | Second used in `bytes(second)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L79)

<a id="extern_function-extern-function-mq3-engine-user-files-samepathnative-extern-function-samepathnative-root-as-ptr-rootlength-as-i32-first-as-ptr-firstlength-as-i32-second-as-ptr-secondlength-as-i32-from-miniquake3-userfiles-dll-symbol-mq3-user-same-path-returns-i32-src-mq3-engine-user-files-ml-1342273876"></a>
### samePathNative

```ml
extern function samePathNative(root as ptr, rootLength as i32, first as ptr, firstLength as i32, second as ptr, secondLength as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_same_path" returns i32
```

Compare two validated user qpaths case-insensitively, resolving existing long-name aliases when needed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `ptr` | — | UTF-8 writable root-directory bytes. |
| `rootLength` | `i32` | — | Root byte length. |
| `first` | `ptr` | — | First UTF-8 relative filename. |
| `firstLength` | `i32` | — | First filename byte length. |
| `second` | `ptr` | — | Second UTF-8 relative filename. |
| `secondLength` | `i32` | — | Second filename byte length. |


**Returns:** 1 for the same path, 0 for distinct/unresolved paths, or -1 when either qpath is invalid.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L74)

<a id="function-function-mq3-engine-user-files-seek-function-seek-store-number-offset-origin-src-mq3-engine-user-files-ml-1903187069"></a>
### seek

```ml
function seek(store, number, offset, origin)
```

Move a user-file cursor within the 64 MiB bound; return zero on success or -1 for an invalid handle, origin, or position.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — | User-file store owning the cursor table. |
| `number` | `dynamic` | — | Open handle from 1 through MAX_HANDLES - 1. |
| `offset` | `dynamic` | — | Signed byte displacement from the selected origin. |
| `origin` | `dynamic` | — | Quake seek origin: 0=current cursor, 1=end of file, 2=start of file. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L216)

<a id="extern_function-extern-function-mq3-engine-user-files-sizenative-extern-function-sizenative-root-as-ptr-rootlength-as-i32-name-as-ptr-namelength-as-i32-from-miniquake3-userfiles-dll-symbol-mq3-user-size-returns-i32-src-mq3-engine-user-files-ml-216785429"></a>
### sizeNative

```ml
extern function sizeNative(root as ptr, rootLength as i32, name as ptr, nameLength as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_size" returns i32
```

Inspect a validated regular user file while rejecting directories, reparse points, and oversized files.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `ptr` | — | UTF-8 writable root-directory bytes. |
| `rootLength` | `i32` | — | Root byte length. |
| `name` | `ptr` | — | UTF-8 relative filename bytes. |
| `nameLength` | `i32` | — | Filename byte length. |


**Returns:** File size in bytes; -2 means absent, and -1 means invalid, inaccessible, or larger than 64 MiB.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L65)

- [mq3.engine.user_files.Store](Type-mq3-engine-user-files-store-856467318.md) — struct
<a id="function-function-mq3-engine-user-files-valid-function-valid-store-number-src-mq3-engine-user-files-ml-238142512"></a>
### valid

```ml
function valid(store, number)
```

Compute engine.user_files.valid as `(((number > 0) and (number < MAX_HANDLES)) and (store.files[number] != void))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — | Record exposing `files`. |
| `number` | `dynamic` | — | Zero-based index into `store.files`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L165)

<a id="function-function-mq3-engine-user-files-write-function-write-store-number-data-src-mq3-engine-user-files-ml-125801434"></a>
### write

```ml
function write(store, number, data)
```

Write or append bytes to an open user buffer; mode 3 flushes immediately and may report zero after changing the dirty buffer and cursor.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `store` | `dynamic` | — | Mutable file store; failed immediate flushes retain dirty data for retry. |
| `number` | `dynamic` | — | Writable handle from 1..63. Read handles reject writes. |
| `data` | `dynamic` | — | Payload bytes; an empty payload is a no-op, and append modes always write at the current file end. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L190)

<a id="extern_function-extern-function-mq3-engine-user-files-writenative-extern-function-writenative-root-as-ptr-rootlength-as-i32-name-as-ptr-namelength-as-i32-data-as-ptr-length-as-i32-from-miniquake3-userfiles-dll-symbol-mq3-user-write-atomic-returns-i32-src-mq3-engine-user-files-ml-1543964437"></a>
### writeNative

```ml
extern function writeNative(root as ptr, rootLength as i32, name as ptr, nameLength as i32, data as ptr, length as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_write_atomic" returns i32
```

Atomically replace a validated user file through a temporary file in the same directory.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `ptr` | — | UTF-8 writable root-directory bytes. |
| `rootLength` | `i32` | — | Root byte length. |
| `name` | `ptr` | — | UTF-8 game-relative filename bytes. |
| `nameLength` | `i32` | — | Filename byte length. |
| `data` | `ptr` | — | Payload byte address; may be null for an empty payload. |
| `length` | `i32` | — | Payload length, from zero through 64 MiB. |


**Returns:** Nonzero after a successful atomic replacement; zero on path, size, or I/O failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/user_files.ml#L58)
