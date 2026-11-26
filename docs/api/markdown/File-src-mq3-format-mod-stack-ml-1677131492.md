# `src/mq3/format/mod_stack.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.format.mod_stack`](Package-mq3-format-mod-stack-1899727956.md)

Reachable from entry: **yes**

## Imports

- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/vm/interpreter.ml` as `interpreter` → [src/mq3/vm/interpreter.ml](File-src-mq3-vm-interpreter-ml-500037689.md)
- `std/ds/list.ml` as `lists` → `../../a7594a0c0299/MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/fs.ml` as `fs` → `../../a7594a0c0299/MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-format-mod-stack-fail-function-fail-message-src-mq3-format-mod-stack-ml-568139823"></a>
### fail

```ml
function fail(message)
```

Create the format.mod_stack error for `fail` with 7689 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("Mod: " + message)` and `error(7689, ("Mod: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/mod_stack.ml#L42)

<a id="constant-constant-mq3-format-mod-stack-file-attribute-directory-const-file-attribute-directory-16-src-mq3-format-mod-stack-ml-989558874"></a>
### FILE_ATTRIBUTE_DIRECTORY

```ml
const FILE_ATTRIBUTE_DIRECTORY = 16
```

Host filesystem attribute identifying a directory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/mod_stack.ml#L18)

<a id="constant-constant-mq3-format-mod-stack-file-attribute-reparse-point-const-file-attribute-reparse-point-1024-src-mq3-format-mod-stack-ml-229209666"></a>
### FILE_ATTRIBUTE_REPARSE_POINT

```ml
const FILE_ATTRIBUTE_REPARSE_POINT = 1024
```

Host filesystem attribute identifying a reparse-point entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/mod_stack.ml#L20)

<a id="extern_function-extern-function-mq3-format-mod-stack-fileattributes-extern-function-fileattributes-path-as-wstr-from-kernel32-dll-symbol-getfileattributesw-returns-u32-src-mq3-format-mod-stack-ml-11531579"></a>
### fileAttributes

```ml
extern function fileAttributes(path as wstr) from "kernel32.dll" symbol "GetFileAttributesW" returns u32
```

Read Win32 file or directory attributes for format.mod_stack.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `wstr` | — | Null-terminated UTF-16 filesystem path. |


**Returns:** The file-attribute bitmask, or INVALID_FILE_ATTRIBUTES (0xffffffff) on failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/mod_stack.ml#L15)

<a id="constant-constant-mq3-format-mod-stack-invalid-attributes-const-invalid-attributes-4294967295-src-mq3-format-mod-stack-ml-1576706354"></a>
### INVALID_ATTRIBUTES

```ml
const INVALID_ATTRIBUTES = 4294967295
```

Sentinel returned when host file attributes cannot be obtained.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/mod_stack.ml#L22)

<a id="constant-constant-mq3-format-mod-stack-max-loose-depth-const-max-loose-depth-16-src-mq3-format-mod-stack-ml-1581194146"></a>
### MAX_LOOSE_DEPTH

```ml
const MAX_LOOSE_DEPTH = 16
```

Maximum directory nesting depth scanned for unpacked assets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/mod_stack.ml#L26)

<a id="constant-constant-mq3-format-mod-stack-max-loose-files-const-max-loose-files-65536-src-mq3-format-mod-stack-ml-1055149672"></a>
### MAX_LOOSE_FILES

```ml
const MAX_LOOSE_FILES = 65536
```

Maximum number of unpacked asset files retained by the filesystem index.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/mod_stack.ml#L24)

<a id="constant-constant-mq3-format-mod-stack-max-qvm-image-const-max-qvm-image-16777216-src-mq3-format-mod-stack-ml-1617457022"></a>
### MAX_QVM_IMAGE

```ml
const MAX_QVM_IMAGE = 16777216
```

Maximum QVM program image size accepted by the mod loader, in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/mod_stack.ml#L28)

<a id="function-function-mq3-format-mod-stack-mount-function-mount-basearchive-installroot-requestedgame-src-mq3-format-mod-stack-ml-1712967866"></a>
### mount

```ml
function mount(baseArchive, installRoot, requestedGame)
```

Compute mount in format.mod_stack; the normal completion returns `Mount(requestedGame, directory, pk3.overlay(directory, baseArchive, gameArchive))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `baseArchive` | `dynamic` | — | Initial `archive` field stored in the returned or constructed `mq3.format.mod_stack.Mount` record. |
| `installRoot` | `dynamic` | — | Install root used in `(installRoot == "")` and `fs.joinPath(installRoot, "baseq3")`. |
| `requestedGame` | `dynamic` | — | Name passed as `name` to `mq3.format.mod_stack.validName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/mod_stack.ml#L128)

- [mq3.format.mod_stack.Mount](Type-mq3-format-mod-stack-mount-274832559.md) — struct
<a id="function-function-mq3-format-mod-stack-regulardirectory-function-regulardirectory-path-src-mq3-format-mod-stack-ml-29598739"></a>
### regularDirectory

```ml
function regularDirectory(path)
```

Apply `mq3.format.mod_stack.fileAttributes` for regular directory in format.mod_stack.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Null-terminated UTF-16 filesystem path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/mod_stack.ml#L56)

<a id="function-function-mq3-format-mod-stack-scanloose-function-scanloose-directory-prefix-depth-entries-src-mq3-format-mod-stack-ml-1176983612"></a>
### scanLoose

```ml
function scanLoose(directory, prefix, depth, entries)
```

Test scan loose in format.mod_stack; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `directory` | `dynamic` | — | Directory used in `fs.listDir(directory)` and `try(fs.listDir(directory))`. |
| `prefix` | `dynamic` | — | Prefix used in `(prefix + name)`. |
| `depth` | `dynamic` | — | Depth used in `(depth + 1)` and `(depth < MAX_LOOSE_DEPTH)`. |
| `entries` | `dynamic` | — | Record exposing `len`, `add`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/mod_stack.ml#L66)

<a id="function-function-mq3-format-mod-stack-validname-function-validname-name-src-mq3-format-mod-stack-ml-853179145"></a>
### validName

```ml
function validName(name)
```

Validate name in format.mod_stack; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `len(name)` and `bytes(name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/mod_stack.ml#L46)

<a id="function-function-mq3-format-mod-stack-verifymodules-function-verifymodules-gamearchive-names-src-mq3-format-mod-stack-ml-1756570734"></a>
### verifyModules

```ml
function verifyModules(gameArchive, names)
```

Test verify modules in format.mod_stack; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gameArchive` | `dynamic` | — | Archive passed as `archive` to `mq3.format.pk3.findEntry`. |
| `names` | `dynamic` | — | Sequence traversed as `name` by the loop in `verifyModules`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/mod_stack.ml#L104)

<a id="function-function-mq3-format-mod-stack-verifypackages-function-verifypackages-directory-names-src-mq3-format-mod-stack-ml-235643853"></a>
### verifyPackages

```ml
function verifyPackages(directory, names)
```

Test verify packages in format.mod_stack; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `directory` | `dynamic` | — | Directory used in `fs.joinPath(directory, name)` and `fileAttributes(fs.joinPath(directory, name))`. |
| `names` | `dynamic` | — | Sequence traversed as `name` by the loop in `verifyPackages`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/mod_stack.ml#L92)
