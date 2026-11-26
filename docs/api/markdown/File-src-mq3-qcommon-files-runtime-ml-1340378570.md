# `src/mq3/qcommon/files_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.files_runtime`](Package-mq3-qcommon-files-runtime-2025592158.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/qcommon/filesystem.ml` as `paths` → [src/mq3/qcommon/filesystem.ml](File-src-mq3-qcommon-filesystem-ml-1002992993.md)
- `std/fs.ml` as `hostfs` → `../../a7594a0c0299/MiniLangCompilerML/std/fs.ml` — external dependency
- `std/sort.ml` as `sort` → `../../a7594a0c0299/MiniLangCompilerML/std/sort.ml` — external dependency
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-qcommon-files-runtime-activate-function-activate-state-number-name-mode-data-path-zipfile-unique-src-mq3-qcommon-files-runtime-ml-2144990605"></a>
### activate

```ml
function activate(state, number, name, mode, data, path, zipFile, unique)
```

Compute activate in qcommon.files_runtime; the normal completion returns `number`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `handles`. |
| `number` | `dynamic` | — | Zero-based index into `state.handles`. |
| `name` | `dynamic` | — | Name operand used by `activate`; its reads are shown in the implementation. |
| `mode` | `dynamic` | — | Mode used in `(mode == FS_APPEND)` and `(mode == FS_APPEND_SYNC)`. |
| `data` | `dynamic` | — | Data used in `len(data)`. |
| `path` | `dynamic` | — | Path operand used by `activate`; its reads are shown in the implementation. |
| `zipFile` | `dynamic` | — | Zip file operand used by `activate`; its reads are shown in the implementation. |
| `unique` | `dynamic` | — | Unique operand used by `activate`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L237)

<a id="function-function-mq3-qcommon-files-runtime-blankhandle-function-blankhandle-src-mq3-qcommon-files-runtime-ml-815529694"></a>
### blankHandle

```ml
function blankHandle()
```

Create `mq3.qcommon.files_runtime.Handle` with active=false; name=""; mode=FS_READ; data=bytes(0, 0); position=0; path=""; dirty=false; sync=false; zipFile=false; unique=false.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L129)

- [mq3.qcommon.files_runtime.Config](Type-mq3-qcommon-files-runtime-config-2132886302.md) — struct
<a id="function-function-mq3-qcommon-files-runtime-contains-function-contains-values-value-src-mq3-qcommon-files-runtime-ml-1046858409"></a>
### contains

```ml
function contains(values, value)
```

Test files runtime in qcommon.files_runtime; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Sequence traversed as `old` by the loop in `contains`. |
| `value` | `dynamic` | — | Value used in `stringEqualsIgnoreCaseAscii(old, value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L555)

<a id="function-function-mq3-qcommon-files-runtime-create-function-create-basepath-homepath-cdpath-gamedir-feed-src-mq3-qcommon-files-runtime-ml-644441357"></a>
### create

```ml
function create(basePath, homePath, cdPath, gameDir, feed)
```

Create files runtime in qcommon.files_runtime; the normal completion returns `Runtime(paths.create(feed), handles, config, false, 0, gameDir, void, void, void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `basePath` | `dynamic` | — | Initial `basePath` field stored in the returned or constructed `mq3.qcommon.files_runtime.Config` record. |
| `homePath` | `dynamic` | — | Initial `homePath` field stored in the returned or constructed `mq3.qcommon.files_runtime.Config` record. |
| `cdPath` | `dynamic` | — | Initial `cdPath` field stored in the returned or constructed `mq3.qcommon.files_runtime.Config` record. |
| `gameDir` | `dynamic` | — | Initial `gameDir` field stored in the returned or constructed `mq3.qcommon.files_runtime.Config` record. |
| `feed` | `dynamic` | — | Feed passed as `feed` to `mq3.qcommon.filesystem.create`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L136)

<a id="extern_function-extern-function-mq3-qcommon-files-runtime-createdirectoryw-extern-function-createdirectoryw-name-as-wstr-security-as-ptr-from-kernel32-dll-returns-bool-src-mq3-qcommon-files-runtime-ml-1658525771"></a>
### CreateDirectoryW

```ml
extern function CreateDirectoryW(name as wstr, security as ptr) from "kernel32.dll" returns bool
```

Create one filesystem directory through the Win32 runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `wstr` | — | Null-terminated UTF-16 directory path. |
| `security` | `ptr` | — | SECURITY_ATTRIBUTES pointer, or null for default security. |


**Returns:** Nonzero on success; zero on failure, including an already existing directory.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L116)

<a id="function-function-mq3-qcommon-files-runtime-cvars-function-cvars-state-src-mq3-qcommon-files-runtime-ml-1557357001"></a>
### cvars

```ml
function cvars(state)
```

Compute qcommon.files_runtime.cvars as `state.config`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `config`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L578)

<a id="extern_function-extern-function-mq3-qcommon-files-runtime-deletefilew-extern-function-deletefilew-name-as-wstr-from-kernel32-dll-returns-bool-src-mq3-qcommon-files-runtime-ml-1674610043"></a>
### DeleteFileW

```ml
extern function DeleteFileW(name as wstr) from "kernel32.dll" returns bool
```

Request deletion of the named filesystem file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `wstr` | — | Null-terminated UTF-16 file path. |


**Returns:** Nonzero when deletion is accepted; zero on failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L120)

<a id="function-function-mq3-qcommon-files-runtime-fclose-function-fclose-state-number-src-mq3-qcommon-files-runtime-ml-99042942"></a>
### fclose

```ml
function fclose(state, number)
```

Return `mq3.qcommon.files_runtime.fs_FCloseFile(state, number)` from `qcommon.files_runtime.fclose`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.files_runtime.fs_FCloseFile`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.qcommon.files_runtime.fs_FCloseFile`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L295)

<a id="function-function-mq3-qcommon-files-runtime-file-function-file-state-number-src-mq3-qcommon-files-runtime-ml-1499480502"></a>
### file

```ml
function file(state, number)
```

Return `mq3.qcommon.files_runtime.fs_FileForHandle(state, number)` from `qcommon.files_runtime.file`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.files_runtime.fs_FileForHandle`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.qcommon.files_runtime.fs_FileForHandle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L307)

- [mq3.qcommon.files_runtime.FileList](Type-mq3-qcommon-files-runtime-filelist-820562866.md) — struct
<a id="function-function-mq3-qcommon-files-runtime-filtername-function-filtername-name-filter-src-mq3-qcommon-files-runtime-ml-489343487"></a>
### filterName

```ml
function filterName(name, filter)
```

Compute filter name in qcommon.files_runtime; the normal completion returns `(strings.indexOf(strings.toLowerAscii(name), strings.toLowerAscii(filter), 0) >= 0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `strings.toLowerAscii(name)` and `strings.indexOf(strings.toLowerAscii(name), strings.toLowerAscii(filter), 0)`. |
| `filter` | `dynamic` | — | Filter used in `(filter == "")` and `(filter == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L424)

<a id="function-function-mq3-qcommon-files-runtime-fs-addfiletolist-function-fs-addfiletolist-name-values-src-mq3-qcommon-files-runtime-ml-531517151"></a>
### fs_AddFileToList

```ml
function fs_AddFileToList(name, values)
```

Add file to list in qcommon.files_runtime; the normal completion returns `(values + [name])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | B passed as `b` to `mq3.qcommon.files_runtime.fs_FilenameCompare`. |
| `values` | `dynamic` | — | Values used in `len(values)` and `(values + [name])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L420)

<a id="function-function-mq3-qcommon-files-runtime-fs-addgamedirectory-function-fs-addgamedirectory-state-path-game-src-mq3-qcommon-files-runtime-ml-1272190246"></a>
### fs_AddGameDirectory

```ml
function fs_AddGameDirectory(state, path, game)
```

Return `mq3.qcommon.filesystem.mountHostGameDirectory(state.fs, path, game)` from `qcommon.files_runtime.fs_AddGameDirectory`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`. |
| `path` | `dynamic` | — | Root passed as `root` to `mq3.qcommon.filesystem.mountHostGameDirectory`. |
| `game` | `dynamic` | — | Game name passed as `gameName` to `mq3.qcommon.filesystem.mountHostGameDirectory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L482)

<a id="constant-constant-mq3-qcommon-files-runtime-fs-append-const-fs-append-2-src-mq3-qcommon-files-runtime-ml-40267601"></a>
### FS_APPEND

```ml
const FS_APPEND = 2
```

File-open mode that appends writes to existing file contents.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L20)

<a id="constant-constant-mq3-qcommon-files-runtime-fs-append-sync-const-fs-append-sync-3-src-mq3-qcommon-files-runtime-ml-53406606"></a>
### FS_APPEND_SYNC

```ml
const FS_APPEND_SYNC = 3
```

File-open mode that appends writes and flushes them synchronously.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L22)

<a id="function-function-mq3-qcommon-files-runtime-fs-buildospath-function-fs-buildospath-base-game-qpath-src-mq3-qcommon-files-runtime-ml-256950843"></a>
### fs_BuildOSPath

```ml
function fs_BuildOSPath(base, game, qpath)
```

Build os path in qcommon.files_runtime; the normal completion returns `fs_ReplaceSeparators(result)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `base` | `dynamic` | — | Base operand used by `fs_BuildOSPath`; its reads are shown in the implementation. |
| `game` | `dynamic` | — | Game used in `(game != "")` and `(result + game)`. |
| `qpath` | `dynamic` | — | Qpath used in `(qpath != "")` and `(result + qpath)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L189)

<a id="function-function-mq3-qcommon-files-runtime-fs-clearpakreferences-function-fs-clearpakreferences-state-flags-src-mq3-qcommon-files-runtime-ml-919671504"></a>
### fs_ClearPakReferences

```ml
function fs_ClearPakReferences(state, flags)
```

Return `mq3.qcommon.filesystem.clearPakReferences(state.fs, flags)` from `qcommon.files_runtime.fs_ClearPakReferences`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`. |
| `flags` | `dynamic` | — | Flags passed as `flags` to `mq3.qcommon.filesystem.clearPakReferences`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L514)

<a id="function-function-mq3-qcommon-files-runtime-fs-conditionalrestart-function-fs-conditionalrestart-state-checksumfeed-src-mq3-qcommon-files-runtime-ml-1011228470"></a>
### fs_ConditionalRestart

```ml
function fs_ConditionalRestart(state, checksumFeed)
```

Test conditional restart in qcommon.files_runtime; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`, `lastGameDir`, `config`. |
| `checksumFeed` | `dynamic` | — | Integer whose low 32 bits are retained. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L572)

<a id="function-function-mq3-qcommon-files-runtime-fs-convertpath-function-fs-convertpath-value-src-mq3-qcommon-files-runtime-ml-360459807"></a>
### fs_ConvertPath

```ml
function fs_ConvertPath(value)
```

Compute convert path in qcommon.files_runtime; the normal completion returns `decode(data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `bytes(value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L184)

<a id="function-function-mq3-qcommon-files-runtime-fs-copyfile-function-fs-copyfile-frompath-topath-src-mq3-qcommon-files-runtime-ml-1332840749"></a>
### fs_CopyFile

```ml
function fs_CopyFile(fromPath, toPath)
```

Copy file in qcommon.files_runtime; the normal completion returns `not (typeof(result) == "error")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fromPath` | `dynamic` | — | From path used in `hostfs.readAllBytes(fromPath)`. |
| `toPath` | `dynamic` | — | Os path passed as `osPath` to `mq3.qcommon.files_runtime.fs_CreatePath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L209)

<a id="function-function-mq3-qcommon-files-runtime-fs-createpath-function-fs-createpath-ospath-src-mq3-qcommon-files-runtime-ml-216655577"></a>
### fs_CreatePath

```ml
function fs_CreatePath(osPath)
```

Create path in qcommon.files_runtime; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `osPath` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.files_runtime.fs_ReplaceSeparators`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L202)

<a id="function-function-mq3-qcommon-files-runtime-fs-dir-f-function-fs-dir-f-state-path-extension-src-mq3-qcommon-files-runtime-ml-246540837"></a>
### fs_Dir_f

```ml
function fs_Dir_f(state, path, extension)
```

Return `mq3.qcommon.files_runtime.fs_ListFiles(state, path, extension)` from `qcommon.files_runtime.fs_Dir_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.files_runtime.fs_ListFiles`. |
| `path` | `dynamic` | — | Path passed as `path` to `mq3.qcommon.files_runtime.fs_ListFiles`. |
| `extension` | `dynamic` | — | Extension passed as `extension` to `mq3.qcommon.files_runtime.fs_ListFiles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L584)

<a id="function-function-mq3-qcommon-files-runtime-fs-fclosefile-function-fs-fclosefile-state-number-src-mq3-qcommon-files-runtime-ml-968167790"></a>
### fs_FCloseFile

```ml
function fs_FCloseFile(state, number)
```

Test f close file in qcommon.files_runtime; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `handles`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.qcommon.files_runtime.fs_Flush`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L291)

<a id="function-function-mq3-qcommon-files-runtime-fs-fileforhandle-function-fs-fileforhandle-state-number-src-mq3-qcommon-files-runtime-ml-1629855618"></a>
### fs_FileForHandle

```ml
function fs_FileForHandle(state, number)
```

Compute file for handle in qcommon.files_runtime; the normal completion returns `state.handles[number]`.

Validation failures include `FS_FileForHandle: invalid handle`; `FS_FileForHandle: zip handle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `handles`. |
| `number` | `dynamic` | — | Zero-based index into `state.handles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L173)

<a id="function-function-mq3-qcommon-files-runtime-fs-fileisinpak-function-fs-fileisinpak-state-filename-src-mq3-qcommon-files-runtime-ml-500339838"></a>
### fs_FileIsInPAK

```ml
function fs_FileIsInPAK(state, filename)
```

Compute file is in pak in qcommon.files_runtime; the normal completion returns `InPak(false, 0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`. |
| `filename` | `dynamic` | — | Virtual game path; leading separators, .., and :: are rejected. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L382)

<a id="function-function-mq3-qcommon-files-runtime-fs-filenamecompare-function-fs-filenamecompare-a-b-src-mq3-qcommon-files-runtime-ml-381726713"></a>
### fs_FilenameCompare

```ml
function fs_FilenameCompare(a, b)
```

Compute qcommon.files_runtime.fs_FilenameCompare as `not stringEqualsIgnoreCaseAscii(fs_ConvertPath(a), fs_ConvertPath(b))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.files_runtime.fs_ConvertPath`. |
| `b` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.files_runtime.fs_ConvertPath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L389)

<a id="function-function-mq3-qcommon-files-runtime-fs-flush-function-fs-flush-state-number-src-mq3-qcommon-files-runtime-ml-526881398"></a>
### fs_Flush

```ml
function fs_Flush(state, number)
```

Test flush in qcommon.files_runtime; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `handles`. |
| `number` | `dynamic` | — | Zero-based index into `state.handles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L348)

<a id="function-function-mq3-qcommon-files-runtime-fs-fopenfileappend-function-fs-fopenfileappend-state-filename-src-mq3-qcommon-files-runtime-ml-1856597350"></a>
### fs_FOpenFileAppend

```ml
function fs_FOpenFileAppend(state, filename)
```

Return `mq3.qcommon.files_runtime.openWrite(state, filename, FS_APPEND, false)` from `qcommon.files_runtime.fs_FOpenFileAppend`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.files_runtime.openWrite`. |
| `filename` | `dynamic` | — | Filename passed as `filename` to `mq3.qcommon.files_runtime.openWrite`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L275)

<a id="function-function-mq3-qcommon-files-runtime-fs-fopenfilebymode-function-fs-fopenfilebymode-state-qpath-mode-src-mq3-qcommon-files-runtime-ml-1498114258"></a>
### fs_FOpenFileByMode

```ml
function fs_FOpenFileByMode(state, qpath, mode)
```

Compute f open file by mode in qcommon.files_runtime; the normal completion returns `OpenResult(0, number)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.files_runtime.fs_FOpenFileRead`. |
| `qpath` | `dynamic` | — | Filename passed as `filename` to `mq3.qcommon.files_runtime.fs_FOpenFileRead`. |
| `mode` | `dynamic` | — | Mode passed as `mode` to `mq3.qcommon.files_runtime.openWrite`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L284)

<a id="function-function-mq3-qcommon-files-runtime-fs-fopenfileread-function-fs-fopenfileread-state-filename-uniquefile-src-mq3-qcommon-files-runtime-ml-1006245583"></a>
### fs_FOpenFileRead

```ml
function fs_FOpenFileRead(state, filename, uniqueFile)
```

Compute f open file read in qcommon.files_runtime; the normal completion returns `OpenResult(len(data), number)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`. |
| `filename` | `dynamic` | — | Qpath passed as `qpath` to `mq3.qcommon.filesystem.read`. |
| `uniqueFile` | `dynamic` | — | Unique passed as `unique` to `mq3.qcommon.files_runtime.activate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L244)

<a id="function-function-mq3-qcommon-files-runtime-fs-fopenfilewrite-function-fs-fopenfilewrite-state-filename-src-mq3-qcommon-files-runtime-ml-1397313200"></a>
### fs_FOpenFileWrite

```ml
function fs_FOpenFileWrite(state, filename)
```

Return `mq3.qcommon.files_runtime.openWrite(state, filename, FS_WRITE, false)` from `qcommon.files_runtime.fs_FOpenFileWrite`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.files_runtime.openWrite`. |
| `filename` | `dynamic` | — | Filename passed as `filename` to `mq3.qcommon.files_runtime.openWrite`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L271)

<a id="function-function-mq3-qcommon-files-runtime-fs-forceflush-function-fs-forceflush-state-number-src-mq3-qcommon-files-runtime-ml-136348392"></a>
### fs_ForceFlush

```ml
function fs_ForceFlush(state, number)
```

Compute force flush in qcommon.files_runtime; the normal completion returns `fs_Flush(state, number)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.files_runtime.fs_FileForHandle`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.qcommon.files_runtime.fs_FileForHandle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L177)

<a id="function-function-mq3-qcommon-files-runtime-fs-freefile-function-fs-freefile-state-data-src-mq3-qcommon-files-runtime-ml-1754872171"></a>
### fs_FreeFile

```ml
function fs_FreeFile(state, data)
```

Compute free file in qcommon.files_runtime; the normal completion returns `0`.

Validation failures include `FS_FreeFile NULL`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `data` | `dynamic` | — | Data used in `(data == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L373)

<a id="function-function-mq3-qcommon-files-runtime-fs-freefilelist-function-fs-freefilelist-values-src-mq3-qcommon-files-runtime-ml-1874119216"></a>
### fs_FreeFileList

```ml
function fs_FreeFileList(values)
```

Compute qcommon.files_runtime.fs_FreeFileList as `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L447)

<a id="function-function-mq3-qcommon-files-runtime-fs-ftell-function-fs-ftell-state-number-src-mq3-qcommon-files-runtime-ml-1659003290"></a>
### fs_FTell

```ml
function fs_FTell(state, number)
```

Compute f tell in qcommon.files_runtime; the normal completion returns `state.handles[number].position`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `handles`. |
| `number` | `dynamic` | — | Zero-based index into `state.handles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L360)

<a id="function-function-mq3-qcommon-files-runtime-fs-gamepurechecksum-function-fs-gamepurechecksum-state-src-mq3-qcommon-files-runtime-ml-978227537"></a>
### fs_GamePureChecksum

```ml
function fs_GamePureChecksum(state)
```

Compute game pure checksum in qcommon.files_runtime; the normal completion returns `str(value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L510)

<a id="function-function-mq3-qcommon-files-runtime-fs-getfilelist-function-fs-getfilelist-state-path-extension-capacity-src-mq3-qcommon-files-runtime-ml-1392928733"></a>
### fs_GetFileList

```ml
function fs_GetFileList(state, path, extension, capacity)
```

Get file list in qcommon.files_runtime; the normal completion returns `packList(fs_ListFiles(state, path, extension), capacity)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.files_runtime.fs_GetModList`. |
| `path` | `dynamic` | — | Path passed as `path` to `mq3.qcommon.files_runtime.fs_ListFiles`. |
| `extension` | `dynamic` | — | Extension passed as `extension` to `mq3.qcommon.files_runtime.fs_ListFiles`. |
| `capacity` | `dynamic` | — | Capacity passed as `capacity` to `mq3.qcommon.files_runtime.fs_GetModList`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L459)

<a id="function-function-mq3-qcommon-files-runtime-fs-getmodlist-function-fs-getmodlist-state-capacity-src-mq3-qcommon-files-runtime-ml-1524264735"></a>
### fs_GetModList

```ml
function fs_GetModList(state, capacity)
```

Get mod list in qcommon.files_runtime; the normal completion returns `packList(values, capacity)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `listModsFn`, `context`, `config`. |
| `capacity` | `dynamic` | — | Capacity passed as `capacity` to `mq3.qcommon.files_runtime.packList`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L471)

<a id="function-function-mq3-qcommon-files-runtime-fs-handleforfile-function-fs-handleforfile-state-src-mq3-qcommon-files-runtime-ml-312799819"></a>
### fs_HandleForFile

```ml
function fs_HandleForFile(state)
```

Handle for file in qcommon.files_runtime; the normal completion returns `error(7661, "FS_HandleForFile: none free")`.

Validation failures include `FS_HandleForFile: none free`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `handles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L167)

<a id="function-function-mq3-qcommon-files-runtime-fs-hashfilename-function-fs-hashfilename-fname-hashsize-src-mq3-qcommon-files-runtime-ml-1601333372"></a>
### fs_HashFileName

```ml
function fs_HashFileName(fname, hashSize)
```

Compute hash file name in qcommon.files_runtime; the normal completion returns `(((hash ^ (hash >> 10)) ^ (hash >> 20)) & (hashSize - 1))`.

Validation failures include `FS_HashFileName hash size`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fname` | `dynamic` | — | Fname used in `bytes(fname)`. |
| `hashSize` | `dynamic` | — | Hash size used in `(hashSize - 1)` and `(hashSize <= 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L157)

<a id="function-function-mq3-qcommon-files-runtime-fs-idpak-function-fs-idpak-pak-base-src-mq3-qcommon-files-runtime-ml-1916585543"></a>
### fs_idPak

```ml
function fs_idPak(pak, base)
```

Return `mq3.qcommon.filesystem.idPak(pak, base)` from `qcommon.files_runtime.fs_idPak`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pak` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.filesystem.idPak`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.qcommon.filesystem.idPak`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L486)

<a id="function-function-mq3-qcommon-files-runtime-fs-initfilesystem-function-fs-initfilesystem-state-src-mq3-qcommon-files-runtime-ml-1879981981"></a>
### fs_InitFilesystem

```ml
function fs_InitFilesystem(state)
```

Compute init filesystem in qcommon.files_runtime; the normal completion returns `state.initialized`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `config`, `initialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L575)

<a id="function-function-mq3-qcommon-files-runtime-fs-initialized-function-fs-initialized-state-src-mq3-qcommon-files-runtime-ml-604420735"></a>
### fs_Initialized

```ml
function fs_Initialized(state)
```

Compute qcommon.files_runtime.fs_Initialized as `((state != void) and state.initialized)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `initialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L144)

<a id="function-function-mq3-qcommon-files-runtime-fs-listfiles-function-fs-listfiles-state-path-extension-src-mq3-qcommon-files-runtime-ml-1470448113"></a>
### fs_ListFiles

```ml
function fs_ListFiles(state, path, extension)
```

Return `mq3.qcommon.files_runtime.fs_ListFilteredFiles(state, path, extension, "")` from `qcommon.files_runtime.fs_ListFiles`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.files_runtime.fs_ListFilteredFiles`. |
| `path` | `dynamic` | — | Path passed as `path` to `mq3.qcommon.files_runtime.fs_ListFilteredFiles`. |
| `extension` | `dynamic` | — | Extension passed as `extension` to `mq3.qcommon.files_runtime.fs_ListFilteredFiles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L444)

<a id="function-function-mq3-qcommon-files-runtime-fs-listfilteredfiles-function-fs-listfilteredfiles-state-path-extension-filter-src-mq3-qcommon-files-runtime-ml-1410280067"></a>
### fs_ListFilteredFiles

```ml
function fs_ListFilteredFiles(state, path, extension, filter)
```

Compute list filtered files in qcommon.files_runtime; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`. |
| `path` | `dynamic` | — | Path passed as `path` to `mq3.qcommon.filesystem.listFiles`. |
| `extension` | `dynamic` | — | Extension passed as `extension` to `mq3.qcommon.filesystem.suffix`. |
| `filter` | `dynamic` | — | Filter passed as `filter` to `mq3.qcommon.files_runtime.filterName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L430)

<a id="function-function-mq3-qcommon-files-runtime-fs-loadedpakchecksums-function-fs-loadedpakchecksums-state-src-mq3-qcommon-files-runtime-ml-2003319301"></a>
### fs_LoadedPakChecksums

```ml
function fs_LoadedPakChecksums(state)
```

Return `mq3.qcommon.files_runtime.joinValues(paths.loadedPakChecksums(state.fs))` from `qcommon.files_runtime.fs_LoadedPakChecksums`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L492)

<a id="function-function-mq3-qcommon-files-runtime-fs-loadedpaknames-function-fs-loadedpaknames-state-src-mq3-qcommon-files-runtime-ml-117412517"></a>
### fs_LoadedPakNames

```ml
function fs_LoadedPakNames(state)
```

Return `mq3.qcommon.files_runtime.joinValues(paths.loadedPakNames(state.fs))` from `qcommon.files_runtime.fs_LoadedPakNames`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L495)

<a id="function-function-mq3-qcommon-files-runtime-fs-loadedpakpurechecksums-function-fs-loadedpakpurechecksums-state-src-mq3-qcommon-files-runtime-ml-370013077"></a>
### fs_LoadedPakPureChecksums

```ml
function fs_LoadedPakPureChecksums(state)
```

Return `mq3.qcommon.files_runtime.joinValues(paths.loadedPakPureChecksums(state.fs))` from `qcommon.files_runtime.fs_LoadedPakPureChecksums`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L498)

<a id="function-function-mq3-qcommon-files-runtime-fs-loadstack-function-fs-loadstack-state-src-mq3-qcommon-files-runtime-ml-1528578487"></a>
### fs_LoadStack

```ml
function fs_LoadStack(state)
```

Load stack in qcommon.files_runtime; the normal completion returns `state.loadStack`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `loadStack`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L151)

<a id="function-function-mq3-qcommon-files-runtime-fs-loadzipfile-function-fs-loadzipfile-path-basename-feed-src-mq3-qcommon-files-runtime-ml-1208774831"></a>
### fs_LoadZipFile

```ml
function fs_LoadZipFile(path, basename, feed)
```

Return `mq3.qcommon.filesystem.loadPak(path, basename, feed)` from `qcommon.files_runtime.fs_LoadZipFile`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path passed as `path` to `mq3.qcommon.filesystem.loadPak`. |
| `basename` | `dynamic` | — | Game name passed as `gameName` to `mq3.qcommon.filesystem.loadPak`. |
| `feed` | `dynamic` | — | Feed passed as `feed` to `mq3.qcommon.filesystem.loadPak`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L477)

<a id="function-function-mq3-qcommon-files-runtime-fs-newdir-f-function-fs-newdir-f-state-filter-src-mq3-qcommon-files-runtime-ml-770237237"></a>
### fs_NewDir_f

```ml
function fs_NewDir_f(state, filter)
```

Compute new dir f in qcommon.files_runtime; the normal completion returns `fs_SortFileList(values, len(values))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.files_runtime.fs_ListFilteredFiles`. |
| `filter` | `dynamic` | — | Filter passed as `filter` to `mq3.qcommon.files_runtime.fs_ListFilteredFiles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L588)

<a id="function-function-mq3-qcommon-files-runtime-fs-pakispure-function-fs-pakispure-state-pak-src-mq3-qcommon-files-runtime-ml-1569070049"></a>
### fs_PakIsPure

```ml
function fs_PakIsPure(state, pak)
```

Return `mq3.qcommon.filesystem.pakIsPure(state.fs, pak)` from `qcommon.files_runtime.fs_PakIsPure`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`. |
| `pak` | `dynamic` | — | Pak passed as `pak` to `mq3.qcommon.filesystem.pakIsPure`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L148)

<a id="function-function-mq3-qcommon-files-runtime-fs-path-f-function-fs-path-f-state-src-mq3-qcommon-files-runtime-ml-315077591"></a>
### fs_Path_f

```ml
function fs_Path_f(state)
```

Compute path f in qcommon.files_runtime; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L591)

<a id="function-function-mq3-qcommon-files-runtime-fs-pathcmp-function-fs-pathcmp-a-b-src-mq3-qcommon-files-runtime-ml-66575497"></a>
### fs_PathCmp

```ml
function fs_PathCmp(a, b)
```

Compute path cmp in qcommon.files_runtime; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.files_runtime.fs_ConvertPath`. |
| `b` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.files_runtime.fs_ConvertPath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L398)

<a id="function-function-mq3-qcommon-files-runtime-fs-printf-function-fs-printf-state-number-text-src-mq3-qcommon-files-runtime-ml-613423687"></a>
### fs_Printf

```ml
function fs_Printf(state, number, text)
```

Return `mq3.qcommon.files_runtime.fs_Write(state, bytes(text), number)` from `qcommon.files_runtime.fs_Printf`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.files_runtime.fs_Write`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.qcommon.files_runtime.fs_Write`. |
| `text` | `dynamic` | — | Text used in `bytes(text)` and `fs_Write(state, bytes(text), number)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L344)

<a id="function-function-mq3-qcommon-files-runtime-fs-pureserversetloadedpaks-function-fs-pureserversetloadedpaks-state-sums-names-src-mq3-qcommon-files-runtime-ml-1058093905"></a>
### fs_PureServerSetLoadedPaks

```ml
function fs_PureServerSetLoadedPaks(state, sums, names)
```

Compute pure server set loaded paks in qcommon.files_runtime; the normal completion returns `len(state.fs.serverPakChecksums)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`. |
| `sums` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.files_runtime.parseNumbers`. |
| `names` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.files_runtime.parseNames`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L532)

<a id="function-function-mq3-qcommon-files-runtime-fs-pureserversetreferencedpaks-function-fs-pureserversetreferencedpaks-state-sums-names-src-mq3-qcommon-files-runtime-ml-404845489"></a>
### fs_PureServerSetReferencedPaks

```ml
function fs_PureServerSetReferencedPaks(state, sums, names)
```

Compute pure server set referenced paks in qcommon.files_runtime; the normal completion returns `len(state.fs.serverReferencedPakChecksums)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`. |
| `sums` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.files_runtime.parseNumbers`. |
| `names` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.files_runtime.parseNames`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L537)

<a id="constant-constant-mq3-qcommon-files-runtime-fs-read-const-fs-read-0-src-mq3-qcommon-files-runtime-ml-76553827"></a>
### FS_READ

```ml
const FS_READ = 0
```

File-open mode requesting read access.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L16)

<a id="function-function-mq3-qcommon-files-runtime-fs-read-function-fs-read-state-count-number-src-mq3-qcommon-files-runtime-ml-1402671595"></a>
### fs_Read

```ml
function fs_Read(state, count, number)
```

Read files runtime in qcommon.files_runtime; the normal completion returns `result`.

Validation failures include `FS_Read invalid handle or count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `handles`. |
| `count` | `dynamic` | — | Count used in `(count < 0)` and `(not readable(state, number) or (count < 0))`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.qcommon.files_runtime.readable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L315)

<a id="function-function-mq3-qcommon-files-runtime-fs-read2-function-fs-read2-state-count-number-src-mq3-qcommon-files-runtime-ml-1348934563"></a>
### fs_Read2

```ml
function fs_Read2(state, count, number)
```

Return `mq3.qcommon.files_runtime.fs_Read(state, count, number)` from `qcommon.files_runtime.fs_Read2`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.files_runtime.fs_Read`. |
| `count` | `dynamic` | — | Count passed as `count` to `mq3.qcommon.files_runtime.fs_Read`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.qcommon.files_runtime.fs_Read`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L323)

<a id="function-function-mq3-qcommon-files-runtime-fs-readfile-function-fs-readfile-state-qpath-src-mq3-qcommon-files-runtime-ml-1767093413"></a>
### fs_ReadFile

```ml
function fs_ReadFile(state, qpath)
```

Read file in qcommon.files_runtime; the normal completion returns `data`.

Direct state writes: `state.loadStack`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `loadStack`, `fs`. Updated in place: `loadStack`. |
| `qpath` | `dynamic` | — | Qpath passed as `qpath` to `mq3.qcommon.filesystem.read`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L367)

<a id="function-function-mq3-qcommon-files-runtime-fs-referencedpakchecksums-function-fs-referencedpakchecksums-state-src-mq3-qcommon-files-runtime-ml-161383585"></a>
### fs_ReferencedPakChecksums

```ml
function fs_ReferencedPakChecksums(state)
```

Return `mq3.qcommon.files_runtime.joinValues(paths.referencedPakChecksums(state.fs))` from `qcommon.files_runtime.fs_ReferencedPakChecksums`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L501)

<a id="function-function-mq3-qcommon-files-runtime-fs-referencedpaknames-function-fs-referencedpaknames-state-src-mq3-qcommon-files-runtime-ml-1623880389"></a>
### fs_ReferencedPakNames

```ml
function fs_ReferencedPakNames(state)
```

Return `mq3.qcommon.files_runtime.joinValues(paths.referencedPakNames(state.fs))` from `qcommon.files_runtime.fs_ReferencedPakNames`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L504)

<a id="function-function-mq3-qcommon-files-runtime-fs-referencedpakpurechecksums-function-fs-referencedpakpurechecksums-state-src-mq3-qcommon-files-runtime-ml-2117170165"></a>
### fs_ReferencedPakPureChecksums

```ml
function fs_ReferencedPakPureChecksums(state)
```

Return `mq3.qcommon.files_runtime.joinValues(paths.referencedPakPureTokens(state.fs))` from `qcommon.files_runtime.fs_ReferencedPakPureChecksums`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L507)

<a id="function-function-mq3-qcommon-files-runtime-fs-remove-function-fs-remove-ospath-src-mq3-qcommon-files-runtime-ml-2012813827"></a>
### fs_Remove

```ml
function fs_Remove(osPath)
```

Return `mq3.qcommon.files_runtime.DeleteFileW(osPath)` from `qcommon.files_runtime.fs_Remove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `osPath` | `dynamic` | — | Null-terminated UTF-16 file path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L212)

<a id="function-function-mq3-qcommon-files-runtime-fs-rename-function-fs-rename-state-fromname-toname-src-mq3-qcommon-files-runtime-ml-1068508886"></a>
### fs_Rename

```ml
function fs_Rename(state, fromName, toName)
```

Test rename in qcommon.files_runtime; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `config`. |
| `fromName` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.files_runtime.fs_ValidQPath`. |
| `toName` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.files_runtime.fs_ValidQPath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L217)

<a id="function-function-mq3-qcommon-files-runtime-fs-replaceseparators-function-fs-replaceseparators-value-src-mq3-qcommon-files-runtime-ml-719848151"></a>
### fs_ReplaceSeparators

```ml
function fs_ReplaceSeparators(value)
```

Compute replace separators in qcommon.files_runtime; the normal completion returns `decode(data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `bytes(value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L181)

<a id="function-function-mq3-qcommon-files-runtime-fs-restart-function-fs-restart-state-checksumfeed-src-mq3-qcommon-files-runtime-ml-7764800"></a>
### fs_Restart

```ml
function fs_Restart(state, checksumFeed)
```

Compute restart in qcommon.files_runtime; the normal completion returns `oldLoaded`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `initialized`, `fs`, `config`. |
| `checksumFeed` | `dynamic` | — | Integer whose low 32 bits are retained. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L568)

<a id="function-function-mq3-qcommon-files-runtime-fs-returnpath-function-fs-returnpath-name-src-mq3-qcommon-files-runtime-ml-1631468287"></a>
### fs_ReturnPath

```ml
function fs_ReturnPath(name)
```

Compute return path in qcommon.files_runtime; the normal completion returns `[len(path), path, depth]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.files_runtime.fs_ConvertPath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L416)

<a id="function-function-mq3-qcommon-files-runtime-fs-seek-function-fs-seek-state-number-offset-origin-src-mq3-qcommon-files-runtime-ml-1105615411"></a>
### fs_Seek

```ml
function fs_Seek(state, number, offset, origin)
```

Seek files runtime in qcommon.files_runtime; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `handles`. |
| `number` | `dynamic` | — | Zero-based index into `state.handles`. |
| `offset` | `dynamic` | — | Offset used in `(handle.position + offset)` and `(len(handle.data) + offset)`. |
| `origin` | `dynamic` | — | Origin used in `(origin == 1)` and `(origin == 2)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L354)

<a id="function-function-mq3-qcommon-files-runtime-fs-setrestrictions-function-fs-setrestrictions-state-src-mq3-qcommon-files-runtime-ml-1199842855"></a>
### fs_SetRestrictions

```ml
function fs_SetRestrictions(state)
```

Set restrictions in qcommon.files_runtime; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `config`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L558)

<a id="function-function-mq3-qcommon-files-runtime-fs-shiftedstrstr-function-fs-shiftedstrstr-text-encoded-shift-src-mq3-qcommon-files-runtime-ml-2107158943"></a>
### fs_ShiftedStrStr

```ml
function fs_ShiftedStrStr(text, encoded, shift)
```

Compute shifted str str in qcommon.files_runtime; the normal completion returns `strings.substr(text, at, (len(text) - at))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `len(text)` and `(len(text) - at)`. |
| `encoded` | `dynamic` | — | Encoded used in `bytes(encoded)`. |
| `shift` | `dynamic` | — | Shift used in `(data[index] + shift)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L394)

<a id="function-function-mq3-qcommon-files-runtime-fs-shutdown-function-fs-shutdown-state-closemissingfile-src-mq3-qcommon-files-runtime-ml-866388101"></a>
### fs_Shutdown

```ml
function fs_Shutdown(state, closeMissingFile)
```

Update `state.initialized` in qcommon.files_runtime; the normal completion returns `0`.

Direct state writes: `state.initialized`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `handles`, `fs`. Updated in place: `initialized`. |
| `closeMissingFile` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L564)

<a id="function-function-mq3-qcommon-files-runtime-fs-sortfilelist-function-fs-sortfilelist-values-numfiles-src-mq3-qcommon-files-runtime-ml-1993460707"></a>
### fs_SortFileList

```ml
function fs_SortFileList(values, numFiles)
```

Compute sort file list in qcommon.files_runtime; the normal completion returns `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Values used in `sort.sortBy(values, pathLess)`. |
| `numFiles` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L409)

<a id="function-function-mq3-qcommon-files-runtime-fs-startup-function-fs-startup-state-gamename-src-mq3-qcommon-files-runtime-ml-571289098"></a>
### fs_Startup

```ml
function fs_Startup(state, gameName)
```

Update `state.lastGameDir`, `state.initialized` in qcommon.files_runtime; the normal completion returns `len(state.fs.paths)`.

Direct state writes: `state.lastGameDir`, `state.initialized`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`, `config`. Updated in place: `lastGameDir`, `initialized`. |
| `gameName` | `dynamic` | — | Game name used in `stringEqualsIgnoreCaseAscii(state.config.baseGame, gameName)` and `((state.config.baseGame != "") and not stringEqualsIgnoreCaseAscii(state.config.baseGame, gameName))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L544)

<a id="function-function-mq3-qcommon-files-runtime-fs-sv-fileexists-function-fs-sv-fileexists-state-name-src-mq3-qcommon-files-runtime-ml-183122532"></a>
### fs_SV_FileExists

```ml
function fs_SV_FileExists(state, name)
```

Compute sv file exists in qcommon.files_runtime; the normal completion returns `(GetFileAttributesW(fs_BuildOSPath(state.config.homePath, name, "")) != 4294967295)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `config`. |
| `name` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.files_runtime.fs_ValidQPath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L226)

<a id="function-function-mq3-qcommon-files-runtime-fs-sv-fopenfileread-function-fs-sv-fopenfileread-state-filename-src-mq3-qcommon-files-runtime-ml-440255978"></a>
### fs_SV_FOpenFileRead

```ml
function fs_SV_FOpenFileRead(state, filename)
```

Compute sv f open file read in qcommon.files_runtime; the normal completion returns `OpenResult(- 1, 0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `config`. |
| `filename` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.files_runtime.fs_ValidQPath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L250)

<a id="function-function-mq3-qcommon-files-runtime-fs-sv-fopenfilewrite-function-fs-sv-fopenfilewrite-state-filename-src-mq3-qcommon-files-runtime-ml-243778750"></a>
### fs_SV_FOpenFileWrite

```ml
function fs_SV_FOpenFileWrite(state, filename)
```

Return `mq3.qcommon.files_runtime.openWrite(state, filename, FS_WRITE, true)` from `qcommon.files_runtime.fs_SV_FOpenFileWrite`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.files_runtime.openWrite`. |
| `filename` | `dynamic` | — | Filename passed as `filename` to `mq3.qcommon.files_runtime.openWrite`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L279)

<a id="function-function-mq3-qcommon-files-runtime-fs-sv-rename-function-fs-sv-rename-state-fromname-toname-src-mq3-qcommon-files-runtime-ml-488626922"></a>
### fs_SV_Rename

```ml
function fs_SV_Rename(state, fromName, toName)
```

Test sv rename in qcommon.files_runtime; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `config`. |
| `fromName` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.files_runtime.fs_ValidQPath`. |
| `toName` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.files_runtime.fs_ValidQPath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L222)

<a id="function-function-mq3-qcommon-files-runtime-fs-touchfile-f-function-fs-touchfile-f-state-name-src-mq3-qcommon-files-runtime-ml-429241576"></a>
### fs_TouchFile_f

```ml
function fs_TouchFile_f(state, name)
```

Compute touch file f in qcommon.files_runtime; the normal completion returns `opened.length`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.files_runtime.fs_FOpenFileRead`. |
| `name` | `dynamic` | — | Filename passed as `filename` to `mq3.qcommon.files_runtime.fs_FOpenFileRead`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L595)

<a id="function-function-mq3-qcommon-files-runtime-fs-validqpath-function-fs-validqpath-value-src-mq3-qcommon-files-runtime-ml-14583771"></a>
### fs_ValidQPath

```ml
function fs_ValidQPath(value)
```

Validate q path in qcommon.files_runtime; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.files_runtime.fs_ConvertPath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L192)

<a id="constant-constant-mq3-qcommon-files-runtime-fs-write-const-fs-write-1-src-mq3-qcommon-files-runtime-ml-731064802"></a>
### FS_WRITE

```ml
const FS_WRITE = 1
```

File-open mode requesting replacement write access.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L18)

<a id="function-function-mq3-qcommon-files-runtime-fs-write-function-fs-write-state-data-number-src-mq3-qcommon-files-runtime-ml-523069666"></a>
### fs_Write

```ml
function fs_Write(state, data, number)
```

Write files runtime in qcommon.files_runtime; the normal completion returns `len(value)`.

Validation failures include `FS_Write invalid handle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `handles`. |
| `data` | `dynamic` | — | Data used in `replaceRange(handle.data, handle.position, value)`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.qcommon.files_runtime.write`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L337)

<a id="function-function-mq3-qcommon-files-runtime-fs-writefile-function-fs-writefile-state-qpath-data-src-mq3-qcommon-files-runtime-ml-1653784469"></a>
### fs_WriteFile

```ml
function fs_WriteFile(state, qpath, data)
```

Write file in qcommon.files_runtime; the normal completion returns `fs_FCloseFile(state, handle)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.files_runtime.fs_FOpenFileWrite`. |
| `qpath` | `dynamic` | — | Filename passed as `filename` to `mq3.qcommon.files_runtime.fs_FOpenFileWrite`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.qcommon.files_runtime.fs_Write`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L378)

<a id="extern_function-extern-function-mq3-qcommon-files-runtime-getfileattributesw-extern-function-getfileattributesw-name-as-wstr-from-kernel32-dll-returns-u32-src-mq3-qcommon-files-runtime-ml-1095134421"></a>
### GetFileAttributesW

```ml
extern function GetFileAttributesW(name as wstr) from "kernel32.dll" returns u32
```

Read Win32 file or directory attributes for qcommon.files_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `wstr` | — | Null-terminated UTF-16 filesystem path. |


**Returns:** The file-attribute bitmask, or INVALID_FILE_ATTRIBUTES (0xffffffff) on failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L111)

- [mq3.qcommon.files_runtime.Handle](Type-mq3-qcommon-files-runtime-handle-381266934.md) — struct
- [mq3.qcommon.files_runtime.InPak](Type-mq3-qcommon-files-runtime-inpak-727292637.md) — struct
<a id="function-function-mq3-qcommon-files-runtime-joinvalues-function-joinvalues-values-src-mq3-qcommon-files-runtime-ml-288624676"></a>
### joinValues

```ml
function joinValues(values)
```

Compute join values in qcommon.files_runtime; the normal completion returns `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Sequence traversed as `value` by the loop in `joinValues`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L489)

<a id="constant-constant-mq3-qcommon-files-runtime-max-file-handles-const-max-file-handles-64-src-mq3-qcommon-files-runtime-ml-142107717"></a>
### MAX_FILE_HANDLES

```ml
const MAX_FILE_HANDLES = 64
```

Maximum number of simultaneous virtual-filesystem file handles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L14)

<a id="extern_function-extern-function-mq3-qcommon-files-runtime-movefileexw-extern-function-movefileexw-oldname-as-wstr-newname-as-wstr-flags-as-u32-from-kernel32-dll-returns-bool-src-mq3-qcommon-files-runtime-ml-1201723018"></a>
### MoveFileExW

```ml
extern function MoveFileExW(oldName as wstr, newName as wstr, flags as u32) from "kernel32.dll" returns bool
```

Move or replace a filesystem file with the requested Win32 move flags.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `oldName` | `wstr` | — | Null-terminated UTF-16 existing path. |
| `newName` | `wstr` | — | Null-terminated UTF-16 destination path. |
| `flags` | `u32` | — | MOVEFILE_* option bitmask controlling replacement and move semantics. |


**Returns:** Nonzero when the requested operation succeeds; zero on failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L126)

- [mq3.qcommon.files_runtime.OpenResult](Type-mq3-qcommon-files-runtime-openresult-2080042625.md) — struct
<a id="function-function-mq3-qcommon-files-runtime-openwrite-function-openwrite-state-filename-mode-server-src-mq3-qcommon-files-runtime-ml-95593812"></a>
### openWrite

```ml
function openWrite(state, filename, mode, server)
```

Open write in qcommon.files_runtime; the normal completion returns `number`.

Validation failures include `FS write path escapes game directory`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `config`. |
| `filename` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.files_runtime.fs_ValidQPath`. |
| `mode` | `dynamic` | — | Mode passed as `mode` to `mq3.qcommon.files_runtime.activate`. |
| `server` | `dynamic` | — | Server operand used by `openWrite`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L262)

<a id="function-function-mq3-qcommon-files-runtime-packlist-function-packlist-values-capacity-src-mq3-qcommon-files-runtime-ml-679028388"></a>
### packList

```ml
function packList(values, capacity)
```

Compute pack list in qcommon.files_runtime; the normal completion returns `FileList(count, values, output)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Initial `names` field stored in the returned or constructed `mq3.qcommon.files_runtime.FileList` record. |
| `capacity` | `dynamic` | — | Capacity used in `bytes(capacity, 0)` and `((offset + needed) > capacity)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L451)

<a id="function-function-mq3-qcommon-files-runtime-paksort-function-paksort-a-b-src-mq3-qcommon-files-runtime-ml-1006194477"></a>
### paksort

```ml
function paksort(a, b)
```

Return `mq3.qcommon.files_runtime.fs_PathCmp(a, b)` from `qcommon.files_runtime.paksort`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A passed as `a` to `mq3.qcommon.files_runtime.fs_PathCmp`. |
| `b` | `dynamic` | — | B passed as `b` to `mq3.qcommon.files_runtime.fs_PathCmp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L413)

<a id="function-function-mq3-qcommon-files-runtime-parsenames-function-parsenames-text-src-mq3-qcommon-files-runtime-ml-1134164729"></a>
### parseNames

```ml
function parseNames(text)
```

Parse names in qcommon.files_runtime; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `strings.trim(text)` and `strings.split(strings.trim(text), " ")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L520)

<a id="function-function-mq3-qcommon-files-runtime-parsenumbers-function-parsenumbers-text-src-mq3-qcommon-files-runtime-ml-154124937"></a>
### parseNumbers

```ml
function parseNumbers(text)
```

Parse numbers in qcommon.files_runtime; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `strings.trim(text)` and `strings.split(strings.trim(text), " ")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L517)

<a id="function-function-mq3-qcommon-files-runtime-pathless-function-pathless-a-b-src-mq3-qcommon-files-runtime-ml-889784877"></a>
### pathLess

```ml
function pathLess(a, b)
```

Compute qcommon.files_runtime.pathLess as `(fs_PathCmp(a, b) < 0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A passed as `a` to `mq3.qcommon.files_runtime.fs_PathCmp`. |
| `b` | `dynamic` | — | B passed as `b` to `mq3.qcommon.files_runtime.fs_PathCmp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L405)

<a id="function-function-mq3-qcommon-files-runtime-readable-function-readable-state-number-src-mq3-qcommon-files-runtime-ml-341598586"></a>
### readable

```ml
function readable(state, number)
```

Compute qcommon.files_runtime.readable as `((((number > 0) and (number < MAX_FILE_HANDLES)) and state.handles[number].active) and (state.handles[number].mode == FS_READ))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `handles`. |
| `number` | `dynamic` | — | Zero-based index into `state.handles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L299)

<a id="function-function-mq3-qcommon-files-runtime-reorderpure-function-reorderpure-state-src-mq3-qcommon-files-runtime-ml-660425765"></a>
### reorderPure

```ml
function reorderPure(state)
```

Compute reorder pure in qcommon.files_runtime; the normal completion returns `len(ordered)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L523)

<a id="function-function-mq3-qcommon-files-runtime-replacerange-function-replacerange-data-offset-value-src-mq3-qcommon-files-runtime-ml-1956335062"></a>
### replaceRange

```ml
function replaceRange(data, offset, value)
```

Compute replace range in qcommon.files_runtime; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[index]`. |
| `offset` | `dynamic` | — | Offset used in `(offset + index)` and `(offset + len(value))`. |
| `value` | `dynamic` | — | Value used in `len(value)` and `value[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L328)

- [mq3.qcommon.files_runtime.Runtime](Type-mq3-qcommon-files-runtime-runtime-1845405028.md) — struct
<a id="function-function-mq3-qcommon-files-runtime-sys-concatenatefilelists-function-sys-concatenatefilelists-first-second-third-src-mq3-qcommon-files-runtime-ml-1633306557"></a>
### sys_ConcatenateFileLists

```ml
function sys_ConcatenateFileLists(first, second, third)
```

Compute sys concatenate file lists in qcommon.files_runtime; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | First used in `(first != void)` and `(result + first)`. |
| `second` | `dynamic` | — | Second used in `(second != void)` and `(result + second)`. |
| `third` | `dynamic` | — | Third used in `(third != void)` and `(result + third)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L467)

<a id="function-function-mq3-qcommon-files-runtime-sys-countfilelist-function-sys-countfilelist-values-src-mq3-qcommon-files-runtime-ml-1165946890"></a>
### sys_CountFileList

```ml
function sys_CountFileList(values)
```

Compute sys count file list in qcommon.files_runtime; the normal completion returns `len(values)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Values used in `len(values)` and `(values == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L462)

<a id="function-function-mq3-qcommon-files-runtime-write-function-write-state-number-src-mq3-qcommon-files-runtime-ml-1322113344"></a>
### write

```ml
function write(state, number)
```

Compute qcommon.files_runtime.write as `((((number > 0) and (number < MAX_FILE_HANDLES)) and state.handles[number].active) and (state.handles[number].mode != FS_READ))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `handles`. |
| `number` | `dynamic` | — | Zero-based index into `state.handles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L303)
