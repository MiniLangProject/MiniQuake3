# `src/mq3/format/mod_stack.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.format.mod_stack`](Package-mq3-format-mod-stack-1899727956.md)

Reachable from entry: **yes**

## Imports

- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/vm/interpreter.ml` as `interpreter` → [src/mq3/vm/interpreter.ml](File-src-mq3-vm-interpreter-ml-500037689.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-format-mod-stack-fail-function-fail-message-src-mq3-format-mod-stack-ml-568139823"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/mod_stack.ml#L23)

<a id="constant-constant-mq3-format-mod-stack-file-attribute-directory-const-file-attribute-directory-16-src-mq3-format-mod-stack-ml-989558874"></a>
### FILE_ATTRIBUTE_DIRECTORY

```ml
const FILE_ATTRIBUTE_DIRECTORY = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/mod_stack.ml#L14)

<a id="constant-constant-mq3-format-mod-stack-file-attribute-reparse-point-const-file-attribute-reparse-point-1024-src-mq3-format-mod-stack-ml-229209666"></a>
### FILE_ATTRIBUTE_REPARSE_POINT

```ml
const FILE_ATTRIBUTE_REPARSE_POINT = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/mod_stack.ml#L15)

<a id="extern_function-extern-function-mq3-format-mod-stack-fileattributes-extern-function-fileattributes-path-as-wstr-from-kernel32-dll-symbol-getfileattributesw-returns-u32-src-mq3-format-mod-stack-ml-11531579"></a>
### fileAttributes

```ml
extern function fileAttributes(path as wstr) from "kernel32.dll" symbol "GetFileAttributesW" returns u32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `wstr` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/mod_stack.ml#L12)

<a id="constant-constant-mq3-format-mod-stack-invalid-attributes-const-invalid-attributes-4294967295-src-mq3-format-mod-stack-ml-1576706354"></a>
### INVALID_ATTRIBUTES

```ml
const INVALID_ATTRIBUTES = 4294967295
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/mod_stack.ml#L16)

<a id="constant-constant-mq3-format-mod-stack-max-loose-depth-const-max-loose-depth-16-src-mq3-format-mod-stack-ml-1581194146"></a>
### MAX_LOOSE_DEPTH

```ml
const MAX_LOOSE_DEPTH = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/mod_stack.ml#L18)

<a id="constant-constant-mq3-format-mod-stack-max-loose-files-const-max-loose-files-65536-src-mq3-format-mod-stack-ml-1055149672"></a>
### MAX_LOOSE_FILES

```ml
const MAX_LOOSE_FILES = 65536
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/mod_stack.ml#L17)

<a id="constant-constant-mq3-format-mod-stack-max-qvm-image-const-max-qvm-image-16777216-src-mq3-format-mod-stack-ml-1617457022"></a>
### MAX_QVM_IMAGE

```ml
const MAX_QVM_IMAGE = 16777216
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/mod_stack.ml#L19)

<a id="function-function-mq3-format-mod-stack-mount-function-mount-basearchive-installroot-requestedgame-src-mq3-format-mod-stack-ml-1712967866"></a>
### mount

```ml
function mount(baseArchive, installRoot, requestedGame)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `baseArchive` | `dynamic` | — |  |
| `installRoot` | `dynamic` | — |  |
| `requestedGame` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/mod_stack.ml#L90)

- [mq3.format.mod_stack.Mount](Type-mq3-format-mod-stack-mount-274832559.md) — struct
<a id="function-function-mq3-format-mod-stack-regulardirectory-function-regulardirectory-path-src-mq3-format-mod-stack-ml-29598739"></a>
### regularDirectory

```ml
function regularDirectory(path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/mod_stack.ml#L33)

<a id="function-function-mq3-format-mod-stack-scanloose-function-scanloose-directory-prefix-depth-entries-src-mq3-format-mod-stack-ml-1176983612"></a>
### scanLoose

```ml
function scanLoose(directory, prefix, depth, entries)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `directory` | `dynamic` | — |  |
| `prefix` | `dynamic` | — |  |
| `depth` | `dynamic` | — |  |
| `entries` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/mod_stack.ml#L38)

<a id="function-function-mq3-format-mod-stack-validname-function-validname-name-src-mq3-format-mod-stack-ml-853179145"></a>
### validName

```ml
function validName(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/mod_stack.ml#L25)

<a id="function-function-mq3-format-mod-stack-verifymodules-function-verifymodules-gamearchive-names-src-mq3-format-mod-stack-ml-1756570734"></a>
### verifyModules

```ml
function verifyModules(gameArchive, names)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gameArchive` | `dynamic` | — |  |
| `names` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/mod_stack.ml#L70)

<a id="function-function-mq3-format-mod-stack-verifypackages-function-verifypackages-directory-names-src-mq3-format-mod-stack-ml-235643853"></a>
### verifyPackages

```ml
function verifyPackages(directory, names)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `directory` | `dynamic` | — |  |
| `names` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/mod_stack.ml#L61)
