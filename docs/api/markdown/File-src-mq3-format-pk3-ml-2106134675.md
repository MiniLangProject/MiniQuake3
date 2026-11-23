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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entries` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L65)

- [mq3.format.pk3.Entry](Type-mq3-format-pk3-entry-196778127.md) — struct
<a id="function-function-mq3-format-pk3-fail-function-fail-message-src-mq3-format-pk3-ml-1470314325"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L77)

<a id="function-function-mq3-format-pk3-findentry-function-findentry-archive-name-src-mq3-format-pk3-ml-1248708977"></a>
### findEntry

```ml
function findEntry(archive, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L237)

<a id="function-function-mq3-format-pk3-freezenamebuckets-function-freezenamebuckets-builders-src-mq3-format-pk3-ml-1089897880"></a>
### freezeNameBuckets

```ml
function freezeNameBuckets(builders)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `builders` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L57)

<a id="function-function-mq3-format-pk3-has-function-has-archive-name-src-mq3-format-pk3-ml-1667368471"></a>
### has

```ml
function has(archive, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L245)

<a id="function-function-mq3-format-pk3-localinfo-function-localinfo-archive-entry-src-mq3-format-pk3-ml-2137394202"></a>
### localInfo

```ml
function localInfo(archive, entry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `entry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L205)

<a id="function-function-mq3-format-pk3-looseentry-function-looseentry-name-path-size-src-mq3-format-pk3-ml-1400599413"></a>
### looseEntry

```ml
function looseEntry(name, path, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L187)

<a id="function-function-mq3-format-pk3-mergelayers-function-mergelayers-path-archives-modarchive-src-mq3-format-pk3-ml-233507008"></a>
### mergeLayers

```ml
function mergeLayers(path, archives, modArchive)
```

Layers are already in search order. High-numbered PK3s take priority within a game directory and the active game takes priority over Baseq3.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |
| `archives` | `dynamic` | — |  |
| `modArchive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L146)

<a id="constant-constant-mq3-format-pk3-name-bucket-count-const-name-bucket-count-4096-src-mq3-format-pk3-ml-141245390"></a>
### NAME_BUCKET_COUNT

```ml
const NAME_BUCKET_COUNT = 4096
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L46)

<a id="function-function-mq3-format-pk3-namehash-function-namehash-name-src-mq3-format-pk3-ml-131796375"></a>
### nameHash

```ml
function nameHash(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L48)

<a id="function-function-mq3-format-pk3-open-function-open-path-src-mq3-format-pk3-ml-794783239"></a>
### open

```ml
function open(path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L86)

<a id="function-function-mq3-format-pk3-openpackages-function-openpackages-basedirectory-requirepak0-src-mq3-format-pk3-ml-115648399"></a>
### openPackages

```ml
function openPackages(baseDirectory, requirePak0)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `baseDirectory` | `dynamic` | — |  |
| `requirePak0` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L166)

<a id="function-function-mq3-format-pk3-openstandard-function-openstandard-basedirectory-src-mq3-format-pk3-ml-999257644"></a>
### openStandard

```ml
function openStandard(baseDirectory)
```

Mount the standard Baseq3 patch set with the same higher-pak precedence as Quake III.  The retail CD has pak0/pak1; patched 1.32 installations may provide through pak8.  Duplicate qpaths are indexed only once.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `baseDirectory` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L140)

<a id="function-function-mq3-format-pk3-overlay-function-overlay-root-base-activegame-src-mq3-format-pk3-ml-926630889"></a>
### overlay

```ml
function overlay(root, base, activeGame)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `activeGame` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L195)

<a id="function-function-mq3-format-pk3-pk3nameless-function-pk3nameless-left-right-src-mq3-format-pk3-ml-581024115"></a>
### pk3NameLess

```ml
function pk3NameLess(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L199)

<a id="function-function-mq3-format-pk3-read-function-read-archive-name-src-mq3-format-pk3-ml-790368599"></a>
### read

```ml
function read(archive, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L246)

<a id="function-function-mq3-format-pk3-readentry-function-readentry-archive-entry-src-mq3-format-pk3-ml-1659180012"></a>
### readEntry

```ml
function readEntry(archive, entry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `entry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L222)

<a id="function-function-mq3-format-pk3-u16-function-u16-data-offset-src-mq3-format-pk3-ml-1956257435"></a>
### u16

```ml
function u16(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L81)

<a id="function-function-mq3-format-pk3-withloose-function-withloose-root-packages-looseentries-src-mq3-format-pk3-ml-1724392663"></a>
### withLoose

```ml
function withLoose(root, packages, looseEntries)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — |  |
| `packages` | `dynamic` | — |  |
| `looseEntries` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L190)
