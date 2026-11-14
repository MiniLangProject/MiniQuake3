# `src/mq3/qcommon/files_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.files_runtime`](Package-mq3-qcommon-files-runtime-2025592158.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/qcommon/filesystem.ml` as `paths` → [src/mq3/qcommon/filesystem.ml](File-src-mq3-qcommon-filesystem-ml-1002992993.md)
- `std/fs.ml` as `hostfs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/sort.ml` as `sort` → `../MiniLangCompilerML/std/sort.ml` — external dependency
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-qcommon-files-runtime-activate-function-activate-state-number-name-mode-data-path-zipfile-unique-src-mq3-qcommon-files-runtime-ml-2144990605"></a>
### activate

```ml
function activate(state, number, name, mode, data, path, zipFile, unique)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |
| `zipFile` | `dynamic` | — |  |
| `unique` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L72)

<a id="function-function-mq3-qcommon-files-runtime-blankhandle-function-blankhandle-src-mq3-qcommon-files-runtime-ml-815529694"></a>
### blankHandle

```ml
function blankHandle()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L31)

- [mq3.qcommon.files_runtime.Config](Type-mq3-qcommon-files-runtime-config-2132886302.md) — struct
<a id="function-function-mq3-qcommon-files-runtime-contains-function-contains-values-value-src-mq3-qcommon-files-runtime-ml-1046858409"></a>
### contains

```ml
function contains(values, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L189)

<a id="function-function-mq3-qcommon-files-runtime-create-function-create-basepath-homepath-cdpath-gamedir-feed-src-mq3-qcommon-files-runtime-ml-644441357"></a>
### create

```ml
function create(basePath, homePath, cdPath, gameDir, feed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `basePath` | `dynamic` | — |  |
| `homePath` | `dynamic` | — |  |
| `cdPath` | `dynamic` | — |  |
| `gameDir` | `dynamic` | — |  |
| `feed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L32)

<a id="extern_function-extern-function-mq3-qcommon-files-runtime-createdirectoryw-extern-function-createdirectoryw-name-as-wstr-security-as-ptr-from-kernel32-dll-returns-bool-src-mq3-qcommon-files-runtime-ml-1658525771"></a>
### CreateDirectoryW

```ml
extern function CreateDirectoryW(name as wstr, security as ptr) from "kernel32.dll" returns bool
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `wstr` | — |  |
| `security` | `ptr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L27)

<a id="function-function-mq3-qcommon-files-runtime-cvars-function-cvars-state-src-mq3-qcommon-files-runtime-ml-1557357001"></a>
### cvars

```ml
function cvars(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L195)

<a id="extern_function-extern-function-mq3-qcommon-files-runtime-deletefilew-extern-function-deletefilew-name-as-wstr-from-kernel32-dll-returns-bool-src-mq3-qcommon-files-runtime-ml-1674610043"></a>
### DeleteFileW

```ml
extern function DeleteFileW(name as wstr) from "kernel32.dll" returns bool
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `wstr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L28)

<a id="function-function-mq3-qcommon-files-runtime-fclose-function-fclose-state-number-src-mq3-qcommon-files-runtime-ml-99042942"></a>
### fclose

```ml
function fclose(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L97)

<a id="function-function-mq3-qcommon-files-runtime-file-function-file-state-number-src-mq3-qcommon-files-runtime-ml-1499480502"></a>
### file

```ml
function file(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L100)

- [mq3.qcommon.files_runtime.FileList](Type-mq3-qcommon-files-runtime-filelist-820562866.md) — struct
<a id="function-function-mq3-qcommon-files-runtime-filtername-function-filtername-name-filter-src-mq3-qcommon-files-runtime-ml-489343487"></a>
### filterName

```ml
function filterName(name, filter)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `filter` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L138)

<a id="function-function-mq3-qcommon-files-runtime-fs-addfiletolist-function-fs-addfiletolist-name-values-src-mq3-qcommon-files-runtime-ml-531517151"></a>
### fs_AddFileToList

```ml
function fs_AddFileToList(name, values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L137)

<a id="function-function-mq3-qcommon-files-runtime-fs-addgamedirectory-function-fs-addgamedirectory-state-path-game-src-mq3-qcommon-files-runtime-ml-1272190246"></a>
### fs_AddGameDirectory

```ml
function fs_AddGameDirectory(state, path, game)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |
| `game` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L160)

<a id="constant-constant-mq3-qcommon-files-runtime-fs-append-const-fs-append-2-src-mq3-qcommon-files-runtime-ml-40267601"></a>
### FS_APPEND

```ml
const FS_APPEND = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L16)

<a id="constant-constant-mq3-qcommon-files-runtime-fs-append-sync-const-fs-append-sync-3-src-mq3-qcommon-files-runtime-ml-53406606"></a>
### FS_APPEND_SYNC

```ml
const FS_APPEND_SYNC = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L17)

<a id="function-function-mq3-qcommon-files-runtime-fs-buildospath-function-fs-buildospath-base-game-qpath-src-mq3-qcommon-files-runtime-ml-256950843"></a>
### fs_BuildOSPath

```ml
function fs_BuildOSPath(base, game, qpath)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `base` | `dynamic` | — |  |
| `game` | `dynamic` | — |  |
| `qpath` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L53)

<a id="function-function-mq3-qcommon-files-runtime-fs-clearpakreferences-function-fs-clearpakreferences-state-flags-src-mq3-qcommon-files-runtime-ml-919671504"></a>
### fs_ClearPakReferences

```ml
function fs_ClearPakReferences(state, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L170)

<a id="function-function-mq3-qcommon-files-runtime-fs-conditionalrestart-function-fs-conditionalrestart-state-checksumfeed-src-mq3-qcommon-files-runtime-ml-1011228470"></a>
### fs_ConditionalRestart

```ml
function fs_ConditionalRestart(state, checksumFeed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `checksumFeed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L193)

<a id="function-function-mq3-qcommon-files-runtime-fs-convertpath-function-fs-convertpath-value-src-mq3-qcommon-files-runtime-ml-360459807"></a>
### fs_ConvertPath

```ml
function fs_ConvertPath(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L52)

<a id="function-function-mq3-qcommon-files-runtime-fs-copyfile-function-fs-copyfile-frompath-topath-src-mq3-qcommon-files-runtime-ml-1332840749"></a>
### fs_CopyFile

```ml
function fs_CopyFile(fromPath, toPath)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fromPath` | `dynamic` | — |  |
| `toPath` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L66)

<a id="function-function-mq3-qcommon-files-runtime-fs-createpath-function-fs-createpath-ospath-src-mq3-qcommon-files-runtime-ml-216655577"></a>
### fs_CreatePath

```ml
function fs_CreatePath(osPath)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `osPath` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L62)

<a id="function-function-mq3-qcommon-files-runtime-fs-dir-f-function-fs-dir-f-state-path-extension-src-mq3-qcommon-files-runtime-ml-246540837"></a>
### fs_Dir_f

```ml
function fs_Dir_f(state, path, extension)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |
| `extension` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L197)

<a id="function-function-mq3-qcommon-files-runtime-fs-fclosefile-function-fs-fclosefile-state-number-src-mq3-qcommon-files-runtime-ml-968167790"></a>
### fs_FCloseFile

```ml
function fs_FCloseFile(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L96)

<a id="function-function-mq3-qcommon-files-runtime-fs-fileforhandle-function-fs-fileforhandle-state-number-src-mq3-qcommon-files-runtime-ml-1629855618"></a>
### fs_FileForHandle

```ml
function fs_FileForHandle(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L48)

<a id="function-function-mq3-qcommon-files-runtime-fs-fileisinpak-function-fs-fileisinpak-state-filename-src-mq3-qcommon-files-runtime-ml-500339838"></a>
### fs_FileIsInPAK

```ml
function fs_FileIsInPAK(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L123)

<a id="function-function-mq3-qcommon-files-runtime-fs-filenamecompare-function-fs-filenamecompare-a-b-src-mq3-qcommon-files-runtime-ml-381726713"></a>
### fs_FilenameCompare

```ml
function fs_FilenameCompare(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L127)

<a id="function-function-mq3-qcommon-files-runtime-fs-flush-function-fs-flush-state-number-src-mq3-qcommon-files-runtime-ml-526881398"></a>
### fs_Flush

```ml
function fs_Flush(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L114)

<a id="function-function-mq3-qcommon-files-runtime-fs-fopenfileappend-function-fs-fopenfileappend-state-filename-src-mq3-qcommon-files-runtime-ml-1856597350"></a>
### fs_FOpenFileAppend

```ml
function fs_FOpenFileAppend(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L90)

<a id="function-function-mq3-qcommon-files-runtime-fs-fopenfilebymode-function-fs-fopenfilebymode-state-qpath-mode-src-mq3-qcommon-files-runtime-ml-1498114258"></a>
### fs_FOpenFileByMode

```ml
function fs_FOpenFileByMode(state, qpath, mode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `qpath` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L92)

<a id="function-function-mq3-qcommon-files-runtime-fs-fopenfileread-function-fs-fopenfileread-state-filename-uniquefile-src-mq3-qcommon-files-runtime-ml-1006245583"></a>
### fs_FOpenFileRead

```ml
function fs_FOpenFileRead(state, filename, uniqueFile)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `uniqueFile` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L75)

<a id="function-function-mq3-qcommon-files-runtime-fs-fopenfilewrite-function-fs-fopenfilewrite-state-filename-src-mq3-qcommon-files-runtime-ml-1397313200"></a>
### fs_FOpenFileWrite

```ml
function fs_FOpenFileWrite(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L89)

<a id="function-function-mq3-qcommon-files-runtime-fs-forceflush-function-fs-forceflush-state-number-src-mq3-qcommon-files-runtime-ml-136348392"></a>
### fs_ForceFlush

```ml
function fs_ForceFlush(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L49)

<a id="function-function-mq3-qcommon-files-runtime-fs-freefile-function-fs-freefile-state-data-src-mq3-qcommon-files-runtime-ml-1754872171"></a>
### fs_FreeFile

```ml
function fs_FreeFile(state, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L121)

<a id="function-function-mq3-qcommon-files-runtime-fs-freefilelist-function-fs-freefilelist-values-src-mq3-qcommon-files-runtime-ml-1874119216"></a>
### fs_FreeFileList

```ml
function fs_FreeFileList(values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L150)

<a id="function-function-mq3-qcommon-files-runtime-fs-ftell-function-fs-ftell-state-number-src-mq3-qcommon-files-runtime-ml-1659003290"></a>
### fs_FTell

```ml
function fs_FTell(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L118)

<a id="function-function-mq3-qcommon-files-runtime-fs-gamepurechecksum-function-fs-gamepurechecksum-state-src-mq3-qcommon-files-runtime-ml-978227537"></a>
### fs_GamePureChecksum

```ml
function fs_GamePureChecksum(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L169)

<a id="function-function-mq3-qcommon-files-runtime-fs-getfilelist-function-fs-getfilelist-state-path-extension-capacity-src-mq3-qcommon-files-runtime-ml-1392928733"></a>
### fs_GetFileList

```ml
function fs_GetFileList(state, path, extension, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |
| `extension` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L154)

<a id="function-function-mq3-qcommon-files-runtime-fs-getmodlist-function-fs-getmodlist-state-capacity-src-mq3-qcommon-files-runtime-ml-1524264735"></a>
### fs_GetModList

```ml
function fs_GetModList(state, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L157)

<a id="function-function-mq3-qcommon-files-runtime-fs-handleforfile-function-fs-handleforfile-state-src-mq3-qcommon-files-runtime-ml-312799819"></a>
### fs_HandleForFile

```ml
function fs_HandleForFile(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L47)

<a id="function-function-mq3-qcommon-files-runtime-fs-hashfilename-function-fs-hashfilename-fname-hashsize-src-mq3-qcommon-files-runtime-ml-1601333372"></a>
### fs_HashFileName

```ml
function fs_HashFileName(fname, hashSize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fname` | `dynamic` | — |  |
| `hashSize` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L41)

<a id="function-function-mq3-qcommon-files-runtime-fs-idpak-function-fs-idpak-pak-base-src-mq3-qcommon-files-runtime-ml-1916585543"></a>
### fs_idPak

```ml
function fs_idPak(pak, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pak` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L161)

<a id="function-function-mq3-qcommon-files-runtime-fs-initfilesystem-function-fs-initfilesystem-state-src-mq3-qcommon-files-runtime-ml-1879981981"></a>
### fs_InitFilesystem

```ml
function fs_InitFilesystem(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L194)

<a id="function-function-mq3-qcommon-files-runtime-fs-initialized-function-fs-initialized-state-src-mq3-qcommon-files-runtime-ml-604420735"></a>
### fs_Initialized

```ml
function fs_Initialized(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L38)

<a id="function-function-mq3-qcommon-files-runtime-fs-listfiles-function-fs-listfiles-state-path-extension-src-mq3-qcommon-files-runtime-ml-1470448113"></a>
### fs_ListFiles

```ml
function fs_ListFiles(state, path, extension)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |
| `extension` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L149)

<a id="function-function-mq3-qcommon-files-runtime-fs-listfilteredfiles-function-fs-listfilteredfiles-state-path-extension-filter-src-mq3-qcommon-files-runtime-ml-1410280067"></a>
### fs_ListFilteredFiles

```ml
function fs_ListFilteredFiles(state, path, extension, filter)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |
| `extension` | `dynamic` | — |  |
| `filter` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L139)

<a id="function-function-mq3-qcommon-files-runtime-fs-loadedpakchecksums-function-fs-loadedpakchecksums-state-src-mq3-qcommon-files-runtime-ml-2003319301"></a>
### fs_LoadedPakChecksums

```ml
function fs_LoadedPakChecksums(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L163)

<a id="function-function-mq3-qcommon-files-runtime-fs-loadedpaknames-function-fs-loadedpaknames-state-src-mq3-qcommon-files-runtime-ml-117412517"></a>
### fs_LoadedPakNames

```ml
function fs_LoadedPakNames(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L164)

<a id="function-function-mq3-qcommon-files-runtime-fs-loadedpakpurechecksums-function-fs-loadedpakpurechecksums-state-src-mq3-qcommon-files-runtime-ml-370013077"></a>
### fs_LoadedPakPureChecksums

```ml
function fs_LoadedPakPureChecksums(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L165)

<a id="function-function-mq3-qcommon-files-runtime-fs-loadstack-function-fs-loadstack-state-src-mq3-qcommon-files-runtime-ml-1528578487"></a>
### fs_LoadStack

```ml
function fs_LoadStack(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L40)

<a id="function-function-mq3-qcommon-files-runtime-fs-loadzipfile-function-fs-loadzipfile-path-basename-feed-src-mq3-qcommon-files-runtime-ml-1208774831"></a>
### fs_LoadZipFile

```ml
function fs_LoadZipFile(path, basename, feed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |
| `basename` | `dynamic` | — |  |
| `feed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L159)

<a id="function-function-mq3-qcommon-files-runtime-fs-newdir-f-function-fs-newdir-f-state-filter-src-mq3-qcommon-files-runtime-ml-770237237"></a>
### fs_NewDir_f

```ml
function fs_NewDir_f(state, filter)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filter` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L198)

<a id="function-function-mq3-qcommon-files-runtime-fs-pakispure-function-fs-pakispure-state-pak-src-mq3-qcommon-files-runtime-ml-1569070049"></a>
### fs_PakIsPure

```ml
function fs_PakIsPure(state, pak)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `pak` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L39)

<a id="function-function-mq3-qcommon-files-runtime-fs-path-f-function-fs-path-f-state-src-mq3-qcommon-files-runtime-ml-315077591"></a>
### fs_Path_f

```ml
function fs_Path_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L199)

<a id="function-function-mq3-qcommon-files-runtime-fs-pathcmp-function-fs-pathcmp-a-b-src-mq3-qcommon-files-runtime-ml-66575497"></a>
### fs_PathCmp

```ml
function fs_PathCmp(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L129)

<a id="function-function-mq3-qcommon-files-runtime-fs-printf-function-fs-printf-state-number-text-src-mq3-qcommon-files-runtime-ml-613423687"></a>
### fs_Printf

```ml
function fs_Printf(state, number, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L113)

<a id="function-function-mq3-qcommon-files-runtime-fs-pureserversetloadedpaks-function-fs-pureserversetloadedpaks-state-sums-names-src-mq3-qcommon-files-runtime-ml-1058093905"></a>
### fs_PureServerSetLoadedPaks

```ml
function fs_PureServerSetLoadedPaks(state, sums, names)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sums` | `dynamic` | — |  |
| `names` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L178)

<a id="function-function-mq3-qcommon-files-runtime-fs-pureserversetreferencedpaks-function-fs-pureserversetreferencedpaks-state-sums-names-src-mq3-qcommon-files-runtime-ml-404845489"></a>
### fs_PureServerSetReferencedPaks

```ml
function fs_PureServerSetReferencedPaks(state, sums, names)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sums` | `dynamic` | — |  |
| `names` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L179)

<a id="constant-constant-mq3-qcommon-files-runtime-fs-read-const-fs-read-0-src-mq3-qcommon-files-runtime-ml-76553827"></a>
### FS_READ

```ml
const FS_READ = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L14)

<a id="function-function-mq3-qcommon-files-runtime-fs-read-function-fs-read-state-count-number-src-mq3-qcommon-files-runtime-ml-1402671595"></a>
### fs_Read

```ml
function fs_Read(state, count, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L102)

<a id="function-function-mq3-qcommon-files-runtime-fs-read2-function-fs-read2-state-count-number-src-mq3-qcommon-files-runtime-ml-1348934563"></a>
### fs_Read2

```ml
function fs_Read2(state, count, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L106)

<a id="function-function-mq3-qcommon-files-runtime-fs-readfile-function-fs-readfile-state-qpath-src-mq3-qcommon-files-runtime-ml-1767093413"></a>
### fs_ReadFile

```ml
function fs_ReadFile(state, qpath)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `qpath` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L120)

<a id="function-function-mq3-qcommon-files-runtime-fs-referencedpakchecksums-function-fs-referencedpakchecksums-state-src-mq3-qcommon-files-runtime-ml-161383585"></a>
### fs_ReferencedPakChecksums

```ml
function fs_ReferencedPakChecksums(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L166)

<a id="function-function-mq3-qcommon-files-runtime-fs-referencedpaknames-function-fs-referencedpaknames-state-src-mq3-qcommon-files-runtime-ml-1623880389"></a>
### fs_ReferencedPakNames

```ml
function fs_ReferencedPakNames(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L167)

<a id="function-function-mq3-qcommon-files-runtime-fs-referencedpakpurechecksums-function-fs-referencedpakpurechecksums-state-src-mq3-qcommon-files-runtime-ml-2117170165"></a>
### fs_ReferencedPakPureChecksums

```ml
function fs_ReferencedPakPureChecksums(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L168)

<a id="function-function-mq3-qcommon-files-runtime-fs-remove-function-fs-remove-ospath-src-mq3-qcommon-files-runtime-ml-2012813827"></a>
### fs_Remove

```ml
function fs_Remove(osPath)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `osPath` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L67)

<a id="function-function-mq3-qcommon-files-runtime-fs-rename-function-fs-rename-state-fromname-toname-src-mq3-qcommon-files-runtime-ml-1068508886"></a>
### fs_Rename

```ml
function fs_Rename(state, fromName, toName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `fromName` | `dynamic` | — |  |
| `toName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L68)

<a id="function-function-mq3-qcommon-files-runtime-fs-replaceseparators-function-fs-replaceseparators-value-src-mq3-qcommon-files-runtime-ml-719848151"></a>
### fs_ReplaceSeparators

```ml
function fs_ReplaceSeparators(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L51)

<a id="function-function-mq3-qcommon-files-runtime-fs-restart-function-fs-restart-state-checksumfeed-src-mq3-qcommon-files-runtime-ml-7764800"></a>
### fs_Restart

```ml
function fs_Restart(state, checksumFeed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `checksumFeed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L192)

<a id="function-function-mq3-qcommon-files-runtime-fs-returnpath-function-fs-returnpath-name-src-mq3-qcommon-files-runtime-ml-1631468287"></a>
### fs_ReturnPath

```ml
function fs_ReturnPath(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L136)

<a id="function-function-mq3-qcommon-files-runtime-fs-seek-function-fs-seek-state-number-offset-origin-src-mq3-qcommon-files-runtime-ml-1105615411"></a>
### fs_Seek

```ml
function fs_Seek(state, number, offset, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L115)

<a id="function-function-mq3-qcommon-files-runtime-fs-setrestrictions-function-fs-setrestrictions-state-src-mq3-qcommon-files-runtime-ml-1199842855"></a>
### fs_SetRestrictions

```ml
function fs_SetRestrictions(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L190)

<a id="function-function-mq3-qcommon-files-runtime-fs-shiftedstrstr-function-fs-shiftedstrstr-text-encoded-shift-src-mq3-qcommon-files-runtime-ml-2107158943"></a>
### fs_ShiftedStrStr

```ml
function fs_ShiftedStrStr(text, encoded, shift)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `encoded` | `dynamic` | — |  |
| `shift` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L128)

<a id="function-function-mq3-qcommon-files-runtime-fs-shutdown-function-fs-shutdown-state-closemissingfile-src-mq3-qcommon-files-runtime-ml-866388101"></a>
### fs_Shutdown

```ml
function fs_Shutdown(state, closeMissingFile)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `closeMissingFile` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L191)

<a id="function-function-mq3-qcommon-files-runtime-fs-sortfilelist-function-fs-sortfilelist-values-numfiles-src-mq3-qcommon-files-runtime-ml-1993460707"></a>
### fs_SortFileList

```ml
function fs_SortFileList(values, numFiles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `numFiles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L134)

<a id="function-function-mq3-qcommon-files-runtime-fs-startup-function-fs-startup-state-gamename-src-mq3-qcommon-files-runtime-ml-571289098"></a>
### fs_Startup

```ml
function fs_Startup(state, gameName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `gameName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L181)

<a id="function-function-mq3-qcommon-files-runtime-fs-sv-fileexists-function-fs-sv-fileexists-state-name-src-mq3-qcommon-files-runtime-ml-183122532"></a>
### fs_SV_FileExists

```ml
function fs_SV_FileExists(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L70)

<a id="function-function-mq3-qcommon-files-runtime-fs-sv-fopenfileread-function-fs-sv-fopenfileread-state-filename-src-mq3-qcommon-files-runtime-ml-440255978"></a>
### fs_SV_FOpenFileRead

```ml
function fs_SV_FOpenFileRead(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L78)

<a id="function-function-mq3-qcommon-files-runtime-fs-sv-fopenfilewrite-function-fs-sv-fopenfilewrite-state-filename-src-mq3-qcommon-files-runtime-ml-243778750"></a>
### fs_SV_FOpenFileWrite

```ml
function fs_SV_FOpenFileWrite(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L91)

<a id="function-function-mq3-qcommon-files-runtime-fs-sv-rename-function-fs-sv-rename-state-fromname-toname-src-mq3-qcommon-files-runtime-ml-488626922"></a>
### fs_SV_Rename

```ml
function fs_SV_Rename(state, fromName, toName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `fromName` | `dynamic` | — |  |
| `toName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L69)

<a id="function-function-mq3-qcommon-files-runtime-fs-touchfile-f-function-fs-touchfile-f-state-name-src-mq3-qcommon-files-runtime-ml-429241576"></a>
### fs_TouchFile_f

```ml
function fs_TouchFile_f(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L200)

<a id="function-function-mq3-qcommon-files-runtime-fs-validqpath-function-fs-validqpath-value-src-mq3-qcommon-files-runtime-ml-14583771"></a>
### fs_ValidQPath

```ml
function fs_ValidQPath(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L54)

<a id="constant-constant-mq3-qcommon-files-runtime-fs-write-const-fs-write-1-src-mq3-qcommon-files-runtime-ml-731064802"></a>
### FS_WRITE

```ml
const FS_WRITE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L15)

<a id="function-function-mq3-qcommon-files-runtime-fs-write-function-fs-write-state-data-number-src-mq3-qcommon-files-runtime-ml-523069666"></a>
### fs_Write

```ml
function fs_Write(state, data, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L110)

<a id="function-function-mq3-qcommon-files-runtime-fs-writefile-function-fs-writefile-state-qpath-data-src-mq3-qcommon-files-runtime-ml-1653784469"></a>
### fs_WriteFile

```ml
function fs_WriteFile(state, qpath, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `qpath` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L122)

<a id="extern_function-extern-function-mq3-qcommon-files-runtime-getfileattributesw-extern-function-getfileattributesw-name-as-wstr-from-kernel32-dll-returns-u32-src-mq3-qcommon-files-runtime-ml-1095134421"></a>
### GetFileAttributesW

```ml
extern function GetFileAttributesW(name as wstr) from "kernel32.dll" returns u32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `wstr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L26)

- [mq3.qcommon.files_runtime.Handle](Type-mq3-qcommon-files-runtime-handle-381266934.md) — struct
- [mq3.qcommon.files_runtime.InPak](Type-mq3-qcommon-files-runtime-inpak-727292637.md) — struct
<a id="function-function-mq3-qcommon-files-runtime-joinvalues-function-joinvalues-values-src-mq3-qcommon-files-runtime-ml-288624676"></a>
### joinValues

```ml
function joinValues(values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L162)

<a id="constant-constant-mq3-qcommon-files-runtime-max-file-handles-const-max-file-handles-64-src-mq3-qcommon-files-runtime-ml-142107717"></a>
### MAX_FILE_HANDLES

```ml
const MAX_FILE_HANDLES = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L13)

<a id="extern_function-extern-function-mq3-qcommon-files-runtime-movefileexw-extern-function-movefileexw-oldname-as-wstr-newname-as-wstr-flags-as-u32-from-kernel32-dll-returns-bool-src-mq3-qcommon-files-runtime-ml-1201723018"></a>
### MoveFileExW

```ml
extern function MoveFileExW(oldName as wstr, newName as wstr, flags as u32) from "kernel32.dll" returns bool
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `oldName` | `wstr` | — |  |
| `newName` | `wstr` | — |  |
| `flags` | `u32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L29)

- [mq3.qcommon.files_runtime.OpenResult](Type-mq3-qcommon-files-runtime-openresult-2080042625.md) — struct
<a id="function-function-mq3-qcommon-files-runtime-openwrite-function-openwrite-state-filename-mode-server-src-mq3-qcommon-files-runtime-ml-95593812"></a>
### openWrite

```ml
function openWrite(state, filename, mode, server)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `server` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L83)

<a id="function-function-mq3-qcommon-files-runtime-packlist-function-packlist-values-capacity-src-mq3-qcommon-files-runtime-ml-679028388"></a>
### packList

```ml
function packList(values, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L151)

<a id="function-function-mq3-qcommon-files-runtime-paksort-function-paksort-a-b-src-mq3-qcommon-files-runtime-ml-1006194477"></a>
### paksort

```ml
function paksort(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L135)

<a id="function-function-mq3-qcommon-files-runtime-parsenames-function-parsenames-text-src-mq3-qcommon-files-runtime-ml-1134164729"></a>
### parseNames

```ml
function parseNames(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L172)

<a id="function-function-mq3-qcommon-files-runtime-parsenumbers-function-parsenumbers-text-src-mq3-qcommon-files-runtime-ml-154124937"></a>
### parseNumbers

```ml
function parseNumbers(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L171)

<a id="function-function-mq3-qcommon-files-runtime-pathless-function-pathless-a-b-src-mq3-qcommon-files-runtime-ml-889784877"></a>
### pathLess

```ml
function pathLess(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L133)

<a id="function-function-mq3-qcommon-files-runtime-readable-function-readable-state-number-src-mq3-qcommon-files-runtime-ml-341598586"></a>
### readable

```ml
function readable(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L98)

<a id="function-function-mq3-qcommon-files-runtime-reorderpure-function-reorderpure-state-src-mq3-qcommon-files-runtime-ml-660425765"></a>
### reorderPure

```ml
function reorderPure(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L173)

<a id="function-function-mq3-qcommon-files-runtime-replacerange-function-replacerange-data-offset-value-src-mq3-qcommon-files-runtime-ml-1956335062"></a>
### replaceRange

```ml
function replaceRange(data, offset, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L107)

- [mq3.qcommon.files_runtime.Runtime](Type-mq3-qcommon-files-runtime-runtime-1845405028.md) — struct
<a id="function-function-mq3-qcommon-files-runtime-sys-concatenatefilelists-function-sys-concatenatefilelists-first-second-third-src-mq3-qcommon-files-runtime-ml-1633306557"></a>
### sys_ConcatenateFileLists

```ml
function sys_ConcatenateFileLists(first, second, third)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |
| `third` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L156)

<a id="function-function-mq3-qcommon-files-runtime-sys-countfilelist-function-sys-countfilelist-values-src-mq3-qcommon-files-runtime-ml-1165946890"></a>
### sys_CountFileList

```ml
function sys_CountFileList(values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L155)

<a id="function-function-mq3-qcommon-files-runtime-write-function-write-state-number-src-mq3-qcommon-files-runtime-ml-1322113344"></a>
### write

```ml
function write(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L99)
