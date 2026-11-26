# `src/mq3/qcommon/filesystem.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.filesystem`](Package-mq3-qcommon-filesystem-1950557029.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/qcommon/md4.ml` as `md4` → [src/mq3/qcommon/md4.ml](File-src-mq3-qcommon-md4-ml-1589067711.md)
- `std/fs.ml` as `hostfs` → `../../a7594a0c0299/MiniLangCompilerML/std/fs.ml` — external dependency
- `std/sort.ml` as `sort` → `../../a7594a0c0299/MiniLangCompilerML/std/sort.ml` — external dependency
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-qcommon-filesystem-addunique-function-addunique-list-name-src-mq3-qcommon-filesystem-ml-217010761"></a>
### addUnique

```ml
function addUnique(list, name)
```

Add unique in qcommon.filesystem; the normal completion returns `(list + [name])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | List used in `len(list)` and `(list + [name])`. |
| `name` | `dynamic` | — | Name used in `(list + [name])` and `stringEqualsIgnoreCaseAscii(old, name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L365)

<a id="function-function-mq3-qcommon-filesystem-appendcapacity-function-appendcapacity-text-part-capacity-src-mq3-qcommon-filesystem-ml-2009743494"></a>
### appendCapacity

```ml
function appendCapacity(text, part, capacity)
```

Append capacity in qcommon.filesystem; the normal completion returns `(text + decode(data))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)` and `len(bytes(text))`. |
| `part` | `dynamic` | — | Part used in `bytes(part)`. |
| `capacity` | `dynamic` | — | Capacity used in `(capacity - 1)` and `(capacity <= 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L545)

<a id="function-function-mq3-qcommon-filesystem-checksumhex-function-checksumhex-checksum-src-mq3-qcommon-filesystem-ml-2027923373"></a>
### checksumHex

```ml
function checksumHex(checksum)
```

Compute checksum hex in qcommon.filesystem; the normal completion returns `decode(output)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `checksum` | `dynamic` | — | Integer whose low 32 bits are retained. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L533)

<a id="function-function-mq3-qcommon-filesystem-clearpakreferences-function-clearpakreferences-state-flags-src-mq3-qcommon-filesystem-ml-400221796"></a>
### clearPakReferences

```ml
function clearPakReferences(state, flags)
```

Clear pak references in qcommon.filesystem.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `paths`. |
| `flags` | `dynamic` | — | Flags used in `(flags == 0)` and `(search.pak.referenced & ~ flags)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L446)

<a id="function-function-mq3-qcommon-filesystem-comparepaks-function-comparepaks-state-capacity-downloadstring-serverfileexistsfn-src-mq3-qcommon-filesystem-ml-943780973"></a>
### comparePaks

```ml
function comparePaks(state, capacity, downloadString, serverFileExistsFn)
```

Compute compare paks in qcommon.filesystem; the normal completion returns `PakComparison((text != ""), text)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `serverReferencedPakChecksums`, `serverReferencedPakNames`. |
| `capacity` | `dynamic` | — | Capacity passed as `capacity` to `mq3.qcommon.filesystem.appendCapacity`. |
| `downloadString` | `dynamic` | — | Download string operand used by `comparePaks`; its reads are shown in the implementation. |
| `serverFileExistsFn` | `dynamic` | — | Callback invoked for server file exists; the call sites below define the callback arguments. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L567)

<a id="function-function-mq3-qcommon-filesystem-crcheader-function-crcheader-archive-src-mq3-qcommon-filesystem-ml-1667113826"></a>
### crcHeader

```ml
function crcHeader(archive)
```

Compute crc header in qcommon.filesystem; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Record exposing `entries`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L135)

<a id="function-function-mq3-qcommon-filesystem-create-function-create-feed-src-mq3-qcommon-filesystem-ml-1865965856"></a>
### create

```ml
function create(feed)
```

Create `mq3.qcommon.filesystem.FileSystem` with paths=[]; serverPakChecksums=[]; serverPakNames=[]; serverReferencedPakChecksums=[]; serverReferencedPakNames=[]; checksumFeed=n.i32(feed); fakeChecksum=0.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `feed` | `dynamic` | — | Integer whose low 32 bits are retained. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L89)

<a id="function-function-mq3-qcommon-filesystem-depthandlastslash-function-depthandlastslash-name-src-mq3-qcommon-filesystem-ml-2146511779"></a>
### depthAndLastSlash

```ml
function depthAndLastSlash(name)
```

Compute depth and last slash in qcommon.filesystem; the normal completion returns `[depth, last]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `bytes(name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L354)

<a id="function-function-mq3-qcommon-filesystem-discoverdirectory-function-discoverdirectory-directory-prefix-src-mq3-qcommon-filesystem-ml-1729550731"></a>
### discoverDirectory

```ml
function discoverDirectory(directory, prefix)
```

Compute discover directory in qcommon.filesystem; the normal completion returns `[paks, loose]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `directory` | `dynamic` | — | Left passed as `left` to `mq3.qcommon.filesystem.joinHostPath`. |
| `prefix` | `dynamic` | — | Prefix used in `(prefix != "")` and `(prefix + "/")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L219)

<a id="function-function-mq3-qcommon-filesystem-excludedgeneralreference-function-excludedgeneralreference-name-src-mq3-qcommon-filesystem-ml-1175306089"></a>
### excludedGeneralReference

```ml
function excludedGeneralReference(name)
```

Apply `mq3.qcommon.filesystem.suffix`, `std.string.indexOf` for excluded general reference in qcommon.filesystem.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.filesystem.suffix`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L302)

<a id="function-function-mq3-qcommon-filesystem-filename-function-filename-path-src-mq3-qcommon-filesystem-ml-1507644021"></a>
### filename

```ml
function filename(path)
```

Compute filename in qcommon.filesystem; the normal completion returns `decode(slice(data, start, (len(data) - start)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path used in `bytes(path)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L115)

- [mq3.qcommon.filesystem.FileSystem](Type-mq3-qcommon-filesystem-filesystem-607722198.md) — struct
<a id="extern_function-extern-function-mq3-qcommon-filesystem-findclose-extern-function-findclose-handle-as-ptr-from-kernel32-dll-returns-bool-src-mq3-qcommon-filesystem-ml-294575066"></a>
### FindClose

```ml
extern function FindClose(handle as ptr) from "kernel32.dll" returns bool
```

Release a directory-search handle obtained from FindFirstFileW.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — | Open Win32 search handle, which becomes invalid after closing. |


**Returns:** Nonzero on successful closure; zero on failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L85)

<a id="extern_function-extern-function-mq3-qcommon-filesystem-findfirstfilew-extern-function-findfirstfilew-name-as-wstr-data-as-bytes-from-kernel32-dll-returns-ptr-src-mq3-qcommon-filesystem-ml-1444176726"></a>
### FindFirstFileW

```ml
extern function FindFirstFileW(name as wstr, data as bytes) from "kernel32.dll" returns ptr
```

Begin a Win32 directory search and fill the first matching file record.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `wstr` | — | Null-terminated UTF-16 search pattern, including any wildcard. |
| `data` | `bytes` | — | Writable buffer large enough for WIN32_FIND_DATAW. |


**Returns:** A search handle to close with FindClose, or INVALID_HANDLE_VALUE when no search result is available.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L76)

<a id="extern_function-extern-function-mq3-qcommon-filesystem-findnextfilew-extern-function-findnextfilew-handle-as-ptr-data-as-bytes-from-kernel32-dll-returns-bool-src-mq3-qcommon-filesystem-ml-1256236813"></a>
### FindNextFileW

```ml
extern function FindNextFileW(handle as ptr, data as bytes) from "kernel32.dll" returns bool
```

Advance an active Win32 directory search and overwrite its file record.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — | Search handle returned by FindFirstFileW. |
| `data` | `bytes` | — | Writable WIN32_FIND_DATAW buffer for the next result. |


**Returns:** Nonzero when a next entry was written; zero at the end of the search or on error.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L81)

<a id="constant-constant-mq3-qcommon-filesystem-fs-cgame-ref-const-fs-cgame-ref-4-src-mq3-qcommon-filesystem-ml-227718909"></a>
### FS_CGAME_REF

```ml
const FS_CGAME_REF = 4
```

Package-reference bit recording use by the client-game VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L16)

<a id="constant-constant-mq3-qcommon-filesystem-fs-general-ref-const-fs-general-ref-1-src-mq3-qcommon-filesystem-ml-1952504324"></a>
### FS_GENERAL_REF

```ml
const FS_GENERAL_REF = 1
```

Package-reference bit recording ordinary asset use.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L12)

<a id="constant-constant-mq3-qcommon-filesystem-fs-qagame-ref-const-fs-qagame-ref-8-src-mq3-qcommon-filesystem-ml-1395658101"></a>
### FS_QAGAME_REF

```ml
const FS_QAGAME_REF = 8
```

Package-reference bit recording use by the server game VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L18)

<a id="constant-constant-mq3-qcommon-filesystem-fs-ui-ref-const-fs-ui-ref-2-src-mq3-qcommon-filesystem-ml-1244365939"></a>
### FS_UI_REF

```ml
const FS_UI_REF = 2
```

Package-reference bit recording use by the UI VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L14)

<a id="extern_function-extern-function-mq3-qcommon-filesystem-getfileattributesw-extern-function-getfileattributesw-name-as-wstr-from-kernel32-dll-returns-u32-src-mq3-qcommon-filesystem-ml-1077370477"></a>
### GetFileAttributesW

```ml
extern function GetFileAttributesW(name as wstr) from "kernel32.dll" returns u32
```

Read Win32 file or directory attributes for qcommon.filesystem.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `wstr` | — | Null-terminated UTF-16 filesystem path. |


**Returns:** The file-attribute bitmask, or INVALID_FILE_ATTRIBUTES (0xffffffff) on failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L71)

<a id="function-function-mq3-qcommon-filesystem-haspakchecksum-function-haspakchecksum-state-checksum-src-mq3-qcommon-filesystem-ml-1352332668"></a>
### hasPakChecksum

```ml
function hasPakChecksum(state, checksum)
```

Test pak checksum in qcommon.filesystem; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `paths`. |
| `checksum` | `dynamic` | — | Integer whose low 32 bits are retained. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L555)

<a id="function-function-mq3-qcommon-filesystem-hostpath-function-hostpath-search-name-src-mq3-qcommon-filesystem-ml-1122067785"></a>
### hostPath

```ml
function hostPath(search, name)
```

Compute host path in qcommon.filesystem; the normal completion returns `((((search.root + separator) + search.gameName) + "\\") + name)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `search` | `dynamic` | — | Record exposing `root`, `gameName`. |
| `name` | `dynamic` | — | Name used in `((((search.root + separator) + search.gameName) + "\\\\") + name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L294)

<a id="function-function-mq3-qcommon-filesystem-idpak-function-idpak-name-base-src-mq3-qcommon-filesystem-ml-1078203416"></a>
### idPak

```ml
function idPak(name, base)
```

Test id pak in qcommon.filesystem; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Virtual game path; leading separators, .., and :: are rejected. |
| `base` | `dynamic` | — | Base used in `(base + "/pak")` and `((base + "/pak") + str(index))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L523)

<a id="function-function-mq3-qcommon-filesystem-isbasegame-function-isbasegame-gamename-src-mq3-qcommon-filesystem-ml-1560588555"></a>
### isBaseGame

```ml
function isBaseGame(gameName)
```

Return `stringEqualsIgnoreCaseAscii(gameName, "baseq3")` from `qcommon.filesystem.isBaseGame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gameName` | `dynamic` | — | Game name used in `stringEqualsIgnoreCaseAscii(gameName, "baseq3")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L456)

<a id="function-function-mq3-qcommon-filesystem-joinhostpath-function-joinhostpath-left-right-src-mq3-qcommon-filesystem-ml-705139177"></a>
### joinHostPath

```ml
function joinHostPath(left, right)
```

Compute join host path in qcommon.filesystem; the normal completion returns `((left + "\\") + right)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Left used in `len(left)` and `(left + "\\\\")`. |
| `right` | `dynamic` | — | Right used in `(left + right)` and `((left + "\\\\") + right)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L211)

<a id="function-function-mq3-qcommon-filesystem-listcandidate-function-listcandidate-list-path-extension-name-src-mq3-qcommon-filesystem-ml-901133721"></a>
### listCandidate

```ml
function listCandidate(list, path, extension, name)
```

Compute list candidate in qcommon.filesystem; the normal completion returns `addUnique(list, decode(slice(bytes(normalized), start, (len(normalized) - start))))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | List passed as `list` to `mq3.qcommon.filesystem.addUnique`. |
| `path` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.filesystem.depthAndLastSlash`. |
| `extension` | `dynamic` | — | Extension passed as `extension` to `mq3.qcommon.filesystem.suffix`. |
| `name` | `dynamic` | — | Virtual game path; leading separators, .., and :: are rejected. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L378)

<a id="function-function-mq3-qcommon-filesystem-listfiles-function-listfiles-state-path-extension-src-mq3-qcommon-filesystem-ml-1586654083"></a>
### listFiles

```ml
function listFiles(state, path, extension)
```

Compute list files in qcommon.filesystem; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `paths`, `serverPakChecksums`. |
| `path` | `dynamic` | — | Virtual game path; leading separators, .., and :: are rejected. |
| `extension` | `dynamic` | — | Extension passed as `extension` to `mq3.qcommon.filesystem.listCandidate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L394)

<a id="function-function-mq3-qcommon-filesystem-loadedpakchecksums-function-loadedpakchecksums-state-src-mq3-qcommon-filesystem-ml-1700218477"></a>
### loadedPakChecksums

```ml
function loadedPakChecksums(state)
```

Compute loaded pak checksums in qcommon.filesystem; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `paths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L414)

<a id="function-function-mq3-qcommon-filesystem-loadedpaknames-function-loadedpaknames-state-src-mq3-qcommon-filesystem-ml-1322088569"></a>
### loadedPakNames

```ml
function loadedPakNames(state)
```

Compute loaded pak names in qcommon.filesystem; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `paths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L434)

<a id="function-function-mq3-qcommon-filesystem-loadedpakpurechecksums-function-loadedpakpurechecksums-state-src-mq3-qcommon-filesystem-ml-76393041"></a>
### loadedPakPureChecksums

```ml
function loadedPakPureChecksums(state)
```

Compute loaded pak pure checksums in qcommon.filesystem; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `paths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L424)

<a id="function-function-mq3-qcommon-filesystem-loadpak-function-loadpak-path-gamename-feed-src-mq3-qcommon-filesystem-ml-227256902"></a>
### loadPak

```ml
function loadPak(path, gameName, feed)
```

Load pak in qcommon.filesystem.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path passed as `path` to `mq3.format.pk3.open`. |
| `gameName` | `dynamic` | — | Initial `gameName` field stored in the returned or constructed `mq3.qcommon.filesystem.Pak` record. |
| `feed` | `dynamic` | — | Key passed as `key` to `mq3.qcommon.md4.blockChecksumKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L151)

<a id="function-function-mq3-qcommon-filesystem-markreference-function-markreference-pak-name-src-mq3-qcommon-filesystem-ml-409976039"></a>
### markReference

```ml
function markReference(pak, name)
```

Update `pak.referenced` in qcommon.filesystem.

Direct state writes: `pak.referenced`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pak` | `dynamic` | — | Record exposing `referenced`. Updated in place: `referenced`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.filesystem.excludedGeneralReference`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L313)

<a id="function-function-mq3-qcommon-filesystem-mountgamedirectory-function-mountgamedirectory-state-root-gamename-pakpaths-loosefiles-src-mq3-qcommon-filesystem-ml-1661359809"></a>
### mountGameDirectory

```ml
function mountGameDirectory(state, root, gameName, pakPaths, looseFiles)
```

Update `state.paths` in qcommon.filesystem.

Direct state writes: `state.paths`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `checksumFeed`, `paths`. Updated in place: `paths`. |
| `root` | `dynamic` | — | Initial `root` field stored in the returned or constructed `mq3.qcommon.filesystem.SearchPath` record. |
| `gameName` | `dynamic` | — | Initial `gameName` field stored in the returned or constructed `mq3.qcommon.filesystem.SearchPath` record. |
| `pakPaths` | `dynamic` | — | Pak paths used in `len(pakPaths)` and `pakPaths[index]`. |
| `looseFiles` | `dynamic` | — | Initial `looseFiles` field stored in the returned or constructed `mq3.qcommon.filesystem.SearchPath` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L179)

<a id="function-function-mq3-qcommon-filesystem-mounthostgamedirectory-function-mounthostgamedirectory-state-root-gamename-src-mq3-qcommon-filesystem-ml-764302102"></a>
### mountHostGameDirectory

```ml
function mountHostGameDirectory(state, root, gameName)
```

Compute mount host game directory in qcommon.filesystem; the normal completion returns `files`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.filesystem.mountGameDirectory`. |
| `root` | `dynamic` | — | Left passed as `left` to `mq3.qcommon.filesystem.joinHostPath`. |
| `gameName` | `dynamic` | — | Right passed as `right` to `mq3.qcommon.filesystem.joinHostPath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L244)

<a id="function-function-mq3-qcommon-filesystem-normalize-function-normalize-name-src-mq3-qcommon-filesystem-ml-1412392591"></a>
### normalize

```ml
function normalize(name)
```

Canonicalize a virtual game path to lowercase forward slashes and reject absolute paths or traversal markers.

Validation failures include `FS: absolute qpath`; `FS: invalid qpath`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Virtual game path; leading separators, .., and :: are rejected. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L97)

- [mq3.qcommon.filesystem.Pak](Type-mq3-qcommon-filesystem-pak-1257824487.md) — struct
- [mq3.qcommon.filesystem.PakComparison](Type-mq3-qcommon-filesystem-pakcomparison-1561833062.md) — struct
<a id="function-function-mq3-qcommon-filesystem-pakispure-function-pakispure-state-pak-src-mq3-qcommon-filesystem-ml-856606377"></a>
### pakIsPure

```ml
function pakIsPure(state, pak)
```

Test pak is pure in qcommon.filesystem; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `serverPakChecksums`. |
| `pak` | `dynamic` | — | Record exposing `checksum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L283)

<a id="function-function-mq3-qcommon-filesystem-pathless-function-pathless-a-b-src-mq3-qcommon-filesystem-ml-1777136889"></a>
### pathLess

```ml
function pathLess(a, b)
```

Compute path less in qcommon.filesystem; the normal completion returns `(len(left) < len(right))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Virtual game path; leading separators, .., and :: are rejected. |
| `b` | `dynamic` | — | Virtual game path; leading separators, .., and :: are rejected. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L159)

<a id="function-function-mq3-qcommon-filesystem-qagamepakchecksum-function-qagamepakchecksum-state-src-mq3-qcommon-filesystem-ml-894768291"></a>
### qagamePakChecksum

```ml
function qagamePakChecksum(state)
```

Compute qagame pak checksum in qcommon.filesystem; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `paths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L504)

<a id="function-function-mq3-qcommon-filesystem-read-function-read-state-qpath-src-mq3-qcommon-filesystem-ml-1468463973"></a>
### read

```ml
function read(state, qpath)
```

Read filesystem in qcommon.filesystem; the normal completion returns `error(3510, ("FS: file not found " + qpath))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `paths`, `serverPakChecksums`. |
| `qpath` | `dynamic` | — | Virtual game path; leading separators, .., and :: are rejected. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L324)

<a id="function-function-mq3-qcommon-filesystem-referencedpakchecksums-function-referencedpakchecksums-state-src-mq3-qcommon-filesystem-ml-1249700361"></a>
### referencedPakChecksums

```ml
function referencedPakChecksums(state)
```

Compute referenced pak checksums in qcommon.filesystem; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `paths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L462)

<a id="function-function-mq3-qcommon-filesystem-referencedpaknames-function-referencedpaknames-state-src-mq3-qcommon-filesystem-ml-1704273913"></a>
### referencedPakNames

```ml
function referencedPakNames(state)
```

Compute referenced pak names in qcommon.filesystem; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `paths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L474)

<a id="function-function-mq3-qcommon-filesystem-referencedpakpuretokens-function-referencedpakpuretokens-state-src-mq3-qcommon-filesystem-ml-555673979"></a>
### referencedPakPureTokens

```ml
function referencedPakPureTokens(state)
```

Compute referenced pak pure tokens in qcommon.filesystem; the normal completion returns `(result + [n.i32((checksum ^ count))])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `checksumFeed`, `paths`, `fakeChecksum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L486)

- [mq3.qcommon.filesystem.SearchPath](Type-mq3-qcommon-filesystem-searchpath-977708430.md) — struct
<a id="function-function-mq3-qcommon-filesystem-setpureserverpakinfo-function-setpureserverpakinfo-state-checksums-names-src-mq3-qcommon-filesystem-ml-686631393"></a>
### setPureServerPakInfo

```ml
function setPureServerPakInfo(state, checksums, names)
```

Set pure server pak info in qcommon.filesystem; updates `state.serverPakChecksums`, `state.serverPakNames`.

Direct state writes: `state.serverPakChecksums`, `state.serverPakNames`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `serverPakChecksums`, `serverPakNames`. |
| `checksums` | `dynamic` | — | Checksums operand used by `setPureServerPakInfo`; its reads are shown in the implementation. |
| `names` | `dynamic` | — | Names operand used by `setPureServerPakInfo`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L265)

<a id="function-function-mq3-qcommon-filesystem-setpureserverpaks-function-setpureserverpaks-state-checksums-src-mq3-qcommon-filesystem-ml-2074985301"></a>
### setPureServerPaks

```ml
function setPureServerPaks(state, checksums)
```

Set pure server paks in qcommon.filesystem; updates `state.serverPakChecksums`.

Direct state writes: `state.serverPakChecksums`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `serverPakChecksums`. |
| `checksums` | `dynamic` | — | Checksums operand used by `setPureServerPaks`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L254)

<a id="function-function-mq3-qcommon-filesystem-setpureserverreferencedpaks-function-setpureserverreferencedpaks-state-checksums-names-src-mq3-qcommon-filesystem-ml-284768779"></a>
### setPureServerReferencedPaks

```ml
function setPureServerReferencedPaks(state, checksums, names)
```

Set pure server referenced paks in qcommon.filesystem; updates `state.serverReferencedPakChecksums`, `state.serverReferencedPakNames`.

Direct state writes: `state.serverReferencedPakChecksums`, `state.serverReferencedPakNames`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `serverReferencedPakChecksums`, `serverReferencedPakNames`. |
| `checksums` | `dynamic` | — | Checksums operand used by `setPureServerReferencedPaks`; its reads are shown in the implementation. |
| `names` | `dynamic` | — | Names operand used by `setPureServerReferencedPaks`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L275)

<a id="function-function-mq3-qcommon-filesystem-strippk3-function-strippk3-name-src-mq3-qcommon-filesystem-ml-1117648549"></a>
### stripPk3

```ml
function stripPk3(name)
```

Compute strip pk 3 in qcommon.filesystem; the normal completion returns `name`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `bytes(name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L125)

<a id="function-function-mq3-qcommon-filesystem-suffix-function-suffix-name-extension-src-mq3-qcommon-filesystem-ml-1390494694"></a>
### suffix

```ml
function suffix(name, extension)
```

Apply `stringEqualsIgnoreCaseAscii`, `decode`, `slice` for suffix in qcommon.filesystem.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `len(name)` and `bytes(name)`. |
| `extension` | `dynamic` | — | Extension used in `len(extension)` and `(len(extension) == 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L346)

<a id="function-function-mq3-qcommon-filesystem-wideasciiname-function-wideasciiname-data-src-mq3-qcommon-filesystem-ml-242027786"></a>
### wideAsciiName

```ml
function wideAsciiName(data)
```

Compute wide ascii name in qcommon.filesystem; the normal completion returns `decode(bytes(result))`.

Validation failures include `FS: non-ASCII host filename`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/filesystem.ml#L197)
