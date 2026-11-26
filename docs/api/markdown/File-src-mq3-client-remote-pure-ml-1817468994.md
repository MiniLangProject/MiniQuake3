# `src/mq3/client/remote_pure.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.remote_pure`](Package-mq3-client-remote-pure-1537132594.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `pureNumeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `pureNumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/format/pk3.ml` as `purePk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/qcommon/command_buffer.ml` as `pureCommands` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/qcommon/filesystem.ml` as `pureFilesystem` → [src/mq3/qcommon/filesystem.ml](File-src-mq3-qcommon-filesystem-ml-1002992993.md)
- `mq3/qcommon/md4.ml` as `pureMd4` → [src/mq3/qcommon/md4.ml](File-src-mq3-qcommon-md4-ml-1589067711.md)
- `mq3/shared/info.ml` as `pureInfo` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/ds/hashmap.ml` as `pureMap` → `../MiniLangCompilerML/std/ds/hashmap.ml` — external dependency
- `std/ds/list.ml` as `pureList` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/fs.ml` as `pureFs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/sort.ml` as `pureSort` → `../MiniLangCompilerML/std/sort.ml` — external dependency
- `std/string.ml` as `pureStrings` → `../MiniLangCompilerML/std/string.ml` — external dependency
- `std/string_builder.ml` as `pureBuilder` → `../MiniLangCompilerML/std/string_builder.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-remote-pure-advertisedchecksums-function-advertisedchecksums-text-src-mq3-client-remote-pure-ml-1310539513"></a>
### advertisedChecksums

```ml
function advertisedChecksums(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_pure.ml#L23)

<a id="function-function-mq3-client-remote-pure-checksumforentry-function-checksumforentry-archive-packages-name-src-mq3-client-remote-pure-ml-383097346"></a>
### checksumForEntry

```ml
function checksumForEntry(archive, packages, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `packages` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_pure.ml#L38)

<a id="constant-constant-mq3-client-remote-pure-max-pure-packages-const-max-pure-packages-128-src-mq3-client-remote-pure-ml-1719307360"></a>
### MAX_PURE_PACKAGES

```ml
const MAX_PURE_PACKAGES = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_pure.ml#L18)

- [mq3.client.remote_pure.Package](Type-mq3-client-remote-pure-package-1918540364.md) — struct
- [mq3.client.remote_pure.Verification](Type-mq3-client-remote-pure-verification-1456252319.md) — struct
<a id="function-function-mq3-client-remote-pure-verify-function-verify-basedirectory-systeminfo-checksumfeed-serverid-map-src-mq3-client-remote-pure-ml-80632912"></a>
### verify

```ml
function verify(baseDirectory, systemInfo, checksumFeed, serverId, map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `baseDirectory` | `dynamic` | — |  |
| `systemInfo` | `dynamic` | — |  |
| `checksumFeed` | `dynamic` | — |  |
| `serverId` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_pure.ml#L47)
