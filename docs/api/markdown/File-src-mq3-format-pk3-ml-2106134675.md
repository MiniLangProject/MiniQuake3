# `src/mq3/format/pk3.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.format.pk3`](Package-mq3-format-pk3-1245191509.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/deflate.ml` as `deflate` → [src/mq3/format/deflate.ml](File-src-mq3-format-deflate-ml-363514060.md)
- `mq3/platform/file.ml` as `file` → [src/mq3/platform/file.ml](File-src-mq3-platform-file-ml-722016459.md)
- `std/checksum/crc32.ml` as `crc` → `../MiniLangCompilerML/std/checksum/crc32.ml` — external dependency
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/sort.ml` as `sort` → `../MiniLangCompilerML/std/sort.ml` — external dependency
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.format.pk3.Archive](Type-mq3-format-pk3-archive-1897487657.md) — struct
<a id="function-function-mq3-format-pk3-buildnamebuckets-function-buildnamebuckets-entries-src-mq3-format-pk3-ml-1092502344"></a>
### buildNameBuckets

```ml
function buildNameBuckets(entries)
```

Build name buckets in format.pk3; the normal completion returns `freezeNameBuckets(builders)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entries` | `dynamic` | — | Entries used in `len(entries)` and `entries[entryIndex]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L73)

- [mq3.format.pk3.Entry](Type-mq3-format-pk3-entry-196778127.md) — struct
<a id="function-function-mq3-format-pk3-fail-function-fail-message-src-mq3-format-pk3-ml-1470314325"></a>
### fail

```ml
function fail(message)
```

Create the format.pk3 error for `fail` with 3501 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("PK3: " + message)` and `error(3501, ("PK3: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L87)

<a id="function-function-mq3-format-pk3-findentry-function-findentry-archive-name-src-mq3-format-pk3-ml-1248708977"></a>
### findEntry

```ml
function findEntry(archive, name)
```

Find entry in format.pk3.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Record exposing `nameBuckets`, `entries`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.format.pk3.nameHash`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L283)

<a id="function-function-mq3-format-pk3-freezenamebuckets-function-freezenamebuckets-builders-src-mq3-format-pk3-ml-1089897880"></a>
### freezeNameBuckets

```ml
function freezeNameBuckets(builders)
```

Compute freeze name buckets in format.pk3; the normal completion returns `buckets`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `builders` | `dynamic` | — | Builders used in `builders[bucketIndex]` and `(builders[bucketIndex] != void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L63)

<a id="function-function-mq3-format-pk3-has-function-has-archive-name-src-mq3-format-pk3-ml-1667368471"></a>
### has

```ml
function has(archive, name)
```

Compute format.pk3.has as `(findEntry(archive, name) != void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.format.pk3.findEntry`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.format.pk3.findEntry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L294)

<a id="function-function-mq3-format-pk3-localinfo-function-localinfo-archive-entry-src-mq3-format-pk3-ml-2137394202"></a>
### localInfo

```ml
function localInfo(archive, entry)
```

Compute local info in format.pk3; the normal completion returns `[variableEnd, slice(localFields, nameLength, extraLength)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `entry` | `dynamic` | — | Record exposing `localOffset`, `sourceDirectoryOffset`, `sourcePath`, `flags`, `method`, `checksum`, `compressedSize` and further fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L245)

<a id="function-function-mq3-format-pk3-looseentry-function-looseentry-name-path-size-src-mq3-format-pk3-ml-1400599413"></a>
### looseEntry

```ml
function looseEntry(name, path, size)
```

Create `mq3.format.pk3.Entry` with name=name; version=0; versionNeeded=0; flags=0; 14 further fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Initial `name` field stored in the returned or constructed `mq3.format.pk3.Entry` record. |
| `path` | `dynamic` | — | Initial `sourcePath` field stored in the returned or constructed `mq3.format.pk3.Entry` record. |
| `size` | `dynamic` | — | Initial `compressedSize` field stored in the returned or constructed `mq3.format.pk3.Entry` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L213)

<a id="function-function-mq3-format-pk3-mergelayers-function-mergelayers-path-archives-modarchive-src-mq3-format-pk3-ml-233507008"></a>
### mergeLayers

```ml
function mergeLayers(path, archives, modArchive)
```

Layers are already in search order. High-numbered PK3s take priority within a game directory and the active game takes priority over Baseq3.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Initial `path` field stored in the returned or constructed `mq3.format.pk3.Archive` record. |
| `archives` | `dynamic` | — | Sequence traversed as `archive` by the loop in `mergeLayers`. |
| `modArchive` | `dynamic` | — | Initial `modArchive` field stored in the returned or constructed `mq3.format.pk3.Archive` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L165)

<a id="constant-constant-mq3-format-pk3-name-bucket-count-const-name-bucket-count-4096-src-mq3-format-pk3-ml-141245390"></a>
### NAME_BUCKET_COUNT

```ml
const NAME_BUCKET_COUNT = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L48)

<a id="function-function-mq3-format-pk3-namehash-function-namehash-name-src-mq3-format-pk3-ml-131796375"></a>
### nameHash

```ml
function nameHash(name)
```

Compute name hash in format.pk3; the normal completion returns `(hash & (NAME_BUCKET_COUNT - 1))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `bytes(name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L52)

<a id="function-function-mq3-format-pk3-open-function-open-path-src-mq3-format-pk3-ml-794783239"></a>
### open

```ml
function open(path)
```

Open pk 3 in format.pk3.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path passed as `path` to `mq3.platform.file.readRange`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L101)

<a id="function-function-mq3-format-pk3-openpackages-function-openpackages-basedirectory-requirepak0-src-mq3-format-pk3-ml-115648399"></a>
### openPackages

```ml
function openPackages(baseDirectory, requirePak0)
```

Open packages in format.pk3; the normal completion returns `mergeLayers(baseDirectory, archives, void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `baseDirectory` | `dynamic` | — | Initial `path` field stored in the returned or constructed `mq3.format.pk3.Archive` record. |
| `requirePak0` | `dynamic` | — | Require pak 0 used in `(requirePak0 and not hasPak0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L188)

<a id="function-function-mq3-format-pk3-openstandard-function-openstandard-basedirectory-src-mq3-format-pk3-ml-999257644"></a>
### openStandard

```ml
function openStandard(baseDirectory)
```

Mount the standard Baseq3 patch set with the same higher-pak precedence as Quake III.  The retail CD has pak0/pak1; patched 1.32 installations may provide through pak8.  Duplicate qpaths are indexed only once.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `baseDirectory` | `dynamic` | — | Base directory passed as `baseDirectory` to `mq3.format.pk3.openPackages`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L156)

<a id="function-function-mq3-format-pk3-overlay-function-overlay-root-base-activegame-src-mq3-format-pk3-ml-926630889"></a>
### overlay

```ml
function overlay(root, base, activeGame)
```

Return `mq3.format.pk3.mergeLayers(root, [activeGame, base], activeGame)` from `format.pk3.overlay`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | Path passed as `path` to `mq3.format.pk3.mergeLayers`. |
| `base` | `dynamic` | — | Base used in `mergeLayers(root, [activeGame, base], activeGame)`. |
| `activeGame` | `dynamic` | — | Mod archive passed as `modArchive` to `mq3.format.pk3.mergeLayers`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L229)

<a id="function-function-mq3-format-pk3-pk3nameless-function-pk3nameless-left-right-src-mq3-format-pk3-ml-581024115"></a>
### pk3NameLess

```ml
function pk3NameLess(left, right)
```

Compute pk3 name less in format.pk3; the normal completion returns `(len(a) < len(b))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Left used in `strings.toLowerAscii(left)` and `bytes(strings.toLowerAscii(left))`. |
| `right` | `dynamic` | — | Right used in `strings.toLowerAscii(right)` and `bytes(strings.toLowerAscii(right))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L236)

<a id="function-function-mq3-format-pk3-read-function-read-archive-name-src-mq3-format-pk3-ml-790368599"></a>
### read

```ml
function read(archive, name)
```

Read pk 3 in format.pk3; the normal completion returns `fail(("file not found " + name))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.format.pk3.findEntry`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.format.pk3.findEntry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L298)

<a id="function-function-mq3-format-pk3-readentry-function-readentry-archive-entry-src-mq3-format-pk3-ml-1659180012"></a>
### readEntry

```ml
function readEntry(archive, entry)
```

Read entry in format.pk3; the normal completion returns `data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.format.pk3.localInfo`. |
| `entry` | `dynamic` | — | Record exposing `sourceDirectoryOffset`, `sourcePath`, `flags`, `method`, `compressedSize`, `size`, `checksum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L265)

<a id="function-function-mq3-format-pk3-u16-function-u16-data-offset-src-mq3-format-pk3-ml-1956257435"></a>
### u16

```ml
function u16(data, offset)
```

Compute u 16 in format.pk3; the normal completion returns `(data[offset] | (data[(offset + 1)] << 8))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[offset]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L94)

<a id="function-function-mq3-format-pk3-withloose-function-withloose-root-packages-looseentries-src-mq3-format-pk3-ml-1724392663"></a>
### withLoose

```ml
function withLoose(root, packages, looseEntries)
```

Compute with loose in format.pk3; the normal completion returns `mergeLayers(root, [packages, loose], void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | Initial `path` field stored in the returned or constructed `mq3.format.pk3.Archive` record. |
| `packages` | `dynamic` | — | Packages used in `mergeLayers(root, [packages, loose], void)`. |
| `looseEntries` | `dynamic` | — | Initial `entries` field stored in the returned or constructed `mq3.format.pk3.Archive` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/pk3.ml#L220)
