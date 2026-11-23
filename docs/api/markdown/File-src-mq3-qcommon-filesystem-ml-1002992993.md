# `src/mq3/qcommon/filesystem.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.filesystem`](Package-mq3-qcommon-filesystem-1950557029.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/qcommon/md4.ml` as `md4` → [src/mq3/qcommon/md4.ml](File-src-mq3-qcommon-md4-ml-1589067711.md)
- `std/fs.ml` as `hostfs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/sort.ml` as `sort` → `../MiniLangCompilerML/std/sort.ml` — external dependency
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-qcommon-filesystem-addunique-function-addunique-list-name-src-mq3-qcommon-filesystem-ml-217010761"></a>
### addUnique

```ml
function addUnique(list, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L244)

<a id="function-function-mq3-qcommon-filesystem-appendcapacity-function-appendcapacity-text-part-capacity-src-mq3-qcommon-filesystem-ml-2009743494"></a>
### appendCapacity

```ml
function appendCapacity(text, part, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `part` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L384)

<a id="function-function-mq3-qcommon-filesystem-checksumhex-function-checksumhex-checksum-src-mq3-qcommon-filesystem-ml-2027923373"></a>
### checksumHex

```ml
function checksumHex(checksum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `checksum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L376)

<a id="function-function-mq3-qcommon-filesystem-clearpakreferences-function-clearpakreferences-state-flags-src-mq3-qcommon-filesystem-ml-400221796"></a>
### clearPakReferences

```ml
function clearPakReferences(state, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L307)

<a id="function-function-mq3-qcommon-filesystem-comparepaks-function-comparepaks-state-capacity-downloadstring-serverfileexistsfn-src-mq3-qcommon-filesystem-ml-943780973"></a>
### comparePaks

```ml
function comparePaks(state, capacity, downloadString, serverFileExistsFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |
| `downloadString` | `dynamic` | — |  |
| `serverFileExistsFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L398)

<a id="function-function-mq3-qcommon-filesystem-crcheader-function-crcheader-archive-src-mq3-qcommon-filesystem-ml-1667113826"></a>
### crcHeader

```ml
function crcHeader(archive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L84)

<a id="function-function-mq3-qcommon-filesystem-create-function-create-feed-src-mq3-qcommon-filesystem-ml-1865965856"></a>
### create

```ml
function create(feed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `feed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L48)

<a id="function-function-mq3-qcommon-filesystem-depthandlastslash-function-depthandlastslash-name-src-mq3-qcommon-filesystem-ml-2146511779"></a>
### depthAndLastSlash

```ml
function depthAndLastSlash(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L236)

<a id="function-function-mq3-qcommon-filesystem-discoverdirectory-function-discoverdirectory-directory-prefix-src-mq3-qcommon-filesystem-ml-1729550731"></a>
### discoverDirectory

```ml
function discoverDirectory(directory, prefix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `directory` | `dynamic` | — |  |
| `prefix` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L143)

<a id="function-function-mq3-qcommon-filesystem-excludedgeneralreference-function-excludedgeneralreference-name-src-mq3-qcommon-filesystem-ml-1175306089"></a>
### excludedGeneralReference

```ml
function excludedGeneralReference(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L197)

<a id="function-function-mq3-qcommon-filesystem-filename-function-filename-path-src-mq3-qcommon-filesystem-ml-1507644021"></a>
### filename

```ml
function filename(path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L68)

- [mq3.qcommon.filesystem.FileSystem](Type-mq3-qcommon-filesystem-filesystem-607722198.md) — struct
<a id="extern_function-extern-function-mq3-qcommon-filesystem-findclose-extern-function-findclose-handle-as-ptr-from-kernel32-dll-returns-bool-src-mq3-qcommon-filesystem-ml-294575066"></a>
### FindClose

```ml
extern function FindClose(handle as ptr) from "kernel32.dll" returns bool
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L46)

<a id="extern_function-extern-function-mq3-qcommon-filesystem-findfirstfilew-extern-function-findfirstfilew-name-as-wstr-data-as-bytes-from-kernel32-dll-returns-ptr-src-mq3-qcommon-filesystem-ml-1444176726"></a>
### FindFirstFileW

```ml
extern function FindFirstFileW(name as wstr, data as bytes) from "kernel32.dll" returns ptr
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `wstr` | — |  |
| `data` | `bytes` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L44)

<a id="extern_function-extern-function-mq3-qcommon-filesystem-findnextfilew-extern-function-findnextfilew-handle-as-ptr-data-as-bytes-from-kernel32-dll-returns-bool-src-mq3-qcommon-filesystem-ml-1256236813"></a>
### FindNextFileW

```ml
extern function FindNextFileW(handle as ptr, data as bytes) from "kernel32.dll" returns bool
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — |  |
| `data` | `bytes` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L45)

<a id="constant-constant-mq3-qcommon-filesystem-fs-cgame-ref-const-fs-cgame-ref-4-src-mq3-qcommon-filesystem-ml-227718909"></a>
### FS_CGAME_REF

```ml
const FS_CGAME_REF = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L13)

<a id="constant-constant-mq3-qcommon-filesystem-fs-general-ref-const-fs-general-ref-1-src-mq3-qcommon-filesystem-ml-1952504324"></a>
### FS_GENERAL_REF

```ml
const FS_GENERAL_REF = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L11)

<a id="constant-constant-mq3-qcommon-filesystem-fs-qagame-ref-const-fs-qagame-ref-8-src-mq3-qcommon-filesystem-ml-1395658101"></a>
### FS_QAGAME_REF

```ml
const FS_QAGAME_REF = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L14)

<a id="constant-constant-mq3-qcommon-filesystem-fs-ui-ref-const-fs-ui-ref-2-src-mq3-qcommon-filesystem-ml-1244365939"></a>
### FS_UI_REF

```ml
const FS_UI_REF = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L12)

<a id="extern_function-extern-function-mq3-qcommon-filesystem-getfileattributesw-extern-function-getfileattributesw-name-as-wstr-from-kernel32-dll-returns-u32-src-mq3-qcommon-filesystem-ml-1077370477"></a>
### GetFileAttributesW

```ml
extern function GetFileAttributesW(name as wstr) from "kernel32.dll" returns u32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `wstr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L43)

<a id="function-function-mq3-qcommon-filesystem-haspakchecksum-function-haspakchecksum-state-checksum-src-mq3-qcommon-filesystem-ml-1352332668"></a>
### hasPakChecksum

```ml
function hasPakChecksum(state, checksum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `checksum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L391)

<a id="function-function-mq3-qcommon-filesystem-hostpath-function-hostpath-search-name-src-mq3-qcommon-filesystem-ml-1122067785"></a>
### hostPath

```ml
function hostPath(search, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `search` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L191)

<a id="function-function-mq3-qcommon-filesystem-idpak-function-idpak-name-base-src-mq3-qcommon-filesystem-ml-1078203416"></a>
### idPak

```ml
function idPak(name, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L368)

<a id="function-function-mq3-qcommon-filesystem-isbasegame-function-isbasegame-gamename-src-mq3-qcommon-filesystem-ml-1560588555"></a>
### isBaseGame

```ml
function isBaseGame(gameName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gameName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L315)

<a id="function-function-mq3-qcommon-filesystem-joinhostpath-function-joinhostpath-left-right-src-mq3-qcommon-filesystem-ml-705139177"></a>
### joinHostPath

```ml
function joinHostPath(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L138)

<a id="function-function-mq3-qcommon-filesystem-listcandidate-function-listcandidate-list-path-extension-name-src-mq3-qcommon-filesystem-ml-901133721"></a>
### listCandidate

```ml
function listCandidate(list, path, extension, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |
| `extension` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L252)

<a id="function-function-mq3-qcommon-filesystem-listfiles-function-listfiles-state-path-extension-src-mq3-qcommon-filesystem-ml-1586654083"></a>
### listFiles

```ml
function listFiles(state, path, extension)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |
| `extension` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L264)

<a id="function-function-mq3-qcommon-filesystem-loadedpakchecksums-function-loadedpakchecksums-state-src-mq3-qcommon-filesystem-ml-1700218477"></a>
### loadedPakChecksums

```ml
function loadedPakChecksums(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L282)

<a id="function-function-mq3-qcommon-filesystem-loadedpaknames-function-loadedpaknames-state-src-mq3-qcommon-filesystem-ml-1322088569"></a>
### loadedPakNames

```ml
function loadedPakNames(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L298)

<a id="function-function-mq3-qcommon-filesystem-loadedpakpurechecksums-function-loadedpakpurechecksums-state-src-mq3-qcommon-filesystem-ml-76393041"></a>
### loadedPakPureChecksums

```ml
function loadedPakPureChecksums(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L290)

<a id="function-function-mq3-qcommon-filesystem-loadpak-function-loadpak-path-gamename-feed-src-mq3-qcommon-filesystem-ml-227256902"></a>
### loadPak

```ml
function loadPak(path, gameName, feed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |
| `gameName` | `dynamic` | — |  |
| `feed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L96)

<a id="function-function-mq3-qcommon-filesystem-markreference-function-markreference-pak-name-src-mq3-qcommon-filesystem-ml-409976039"></a>
### markReference

```ml
function markReference(pak, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pak` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L203)

<a id="function-function-mq3-qcommon-filesystem-mountgamedirectory-function-mountgamedirectory-state-root-gamename-pakpaths-loosefiles-src-mq3-qcommon-filesystem-ml-1661359809"></a>
### mountGameDirectory

```ml
function mountGameDirectory(state, root, gameName, pakPaths, looseFiles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `root` | `dynamic` | — |  |
| `gameName` | `dynamic` | — |  |
| `pakPaths` | `dynamic` | — |  |
| `looseFiles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L113)

<a id="function-function-mq3-qcommon-filesystem-mounthostgamedirectory-function-mounthostgamedirectory-state-root-gamename-src-mq3-qcommon-filesystem-ml-764302102"></a>
### mountHostGameDirectory

```ml
function mountHostGameDirectory(state, root, gameName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `root` | `dynamic` | — |  |
| `gameName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L164)

<a id="function-function-mq3-qcommon-filesystem-normalize-function-normalize-name-src-mq3-qcommon-filesystem-ml-1412392591"></a>
### normalize

```ml
function normalize(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L52)

- [mq3.qcommon.filesystem.Pak](Type-mq3-qcommon-filesystem-pak-1257824487.md) — struct
- [mq3.qcommon.filesystem.PakComparison](Type-mq3-qcommon-filesystem-pakcomparison-1561833062.md) — struct
<a id="function-function-mq3-qcommon-filesystem-pakispure-function-pakispure-state-pak-src-mq3-qcommon-filesystem-ml-856606377"></a>
### pakIsPure

```ml
function pakIsPure(state, pak)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `pak` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L183)

<a id="function-function-mq3-qcommon-filesystem-pathless-function-pathless-a-b-src-mq3-qcommon-filesystem-ml-1777136889"></a>
### pathLess

```ml
function pathLess(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L101)

<a id="function-function-mq3-qcommon-filesystem-qagamepakchecksum-function-qagamepakchecksum-state-src-mq3-qcommon-filesystem-ml-894768291"></a>
### qagamePakChecksum

```ml
function qagamePakChecksum(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L355)

<a id="function-function-mq3-qcommon-filesystem-read-function-read-state-qpath-src-mq3-qcommon-filesystem-ml-1468463973"></a>
### read

```ml
function read(state, qpath)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `qpath` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L211)

<a id="function-function-mq3-qcommon-filesystem-referencedpakchecksums-function-referencedpakchecksums-state-src-mq3-qcommon-filesystem-ml-1249700361"></a>
### referencedPakChecksums

```ml
function referencedPakChecksums(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L319)

<a id="function-function-mq3-qcommon-filesystem-referencedpaknames-function-referencedpaknames-state-src-mq3-qcommon-filesystem-ml-1704273913"></a>
### referencedPakNames

```ml
function referencedPakNames(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L329)

<a id="function-function-mq3-qcommon-filesystem-referencedpakpuretokens-function-referencedpakpuretokens-state-src-mq3-qcommon-filesystem-ml-555673979"></a>
### referencedPakPureTokens

```ml
function referencedPakPureTokens(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L339)

- [mq3.qcommon.filesystem.SearchPath](Type-mq3-qcommon-filesystem-searchpath-977708430.md) — struct
<a id="function-function-mq3-qcommon-filesystem-setpureserverpakinfo-function-setpureserverpakinfo-state-checksums-names-src-mq3-qcommon-filesystem-ml-686631393"></a>
### setPureServerPakInfo

```ml
function setPureServerPakInfo(state, checksums, names)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `checksums` | `dynamic` | — |  |
| `names` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L174)

<a id="function-function-mq3-qcommon-filesystem-setpureserverpaks-function-setpureserverpaks-state-checksums-src-mq3-qcommon-filesystem-ml-2074985301"></a>
### setPureServerPaks

```ml
function setPureServerPaks(state, checksums)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `checksums` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L169)

<a id="function-function-mq3-qcommon-filesystem-setpureserverreferencedpaks-function-setpureserverreferencedpaks-state-checksums-names-src-mq3-qcommon-filesystem-ml-284768779"></a>
### setPureServerReferencedPaks

```ml
function setPureServerReferencedPaks(state, checksums, names)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `checksums` | `dynamic` | — |  |
| `names` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L178)

<a id="function-function-mq3-qcommon-filesystem-strippk3-function-strippk3-name-src-mq3-qcommon-filesystem-ml-1117648549"></a>
### stripPk3

```ml
function stripPk3(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L76)

<a id="function-function-mq3-qcommon-filesystem-suffix-function-suffix-name-extension-src-mq3-qcommon-filesystem-ml-1390494694"></a>
### suffix

```ml
function suffix(name, extension)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `extension` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L230)

<a id="function-function-mq3-qcommon-filesystem-wideasciiname-function-wideasciiname-data-src-mq3-qcommon-filesystem-ml-242027786"></a>
### wideAsciiName

```ml
function wideAsciiName(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L127)
