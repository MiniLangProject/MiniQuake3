# `mq3.qcommon.filesystem.FileSystem`

[Home](README.md) · [Source file](File-src-mq3-qcommon-filesystem-ml-1002992993.md)

<a id="struct-struct-mq3-qcommon-filesystem-filesystem-struct-filesystem-src-mq3-qcommon-filesystem-ml-1813315945"></a>
## FileSystem

```ml
struct FileSystem
```

FileSystem record for qcommon.filesystem, containing `paths`, `serverPakChecksums`, `serverPakNames`, `serverReferencedPakChecksums`, `serverReferencedPakNames`, `checksumFeed`, and 1 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L51)

## Members

<a id="field-field-mq3-qcommon-filesystem-filesystem-checksumfeed-checksumfeed-src-mq3-qcommon-filesystem-ml-1183244990"></a>
### checksumFeed

```ml
checksumFeed
```

Server-supplied feed value used to calculate pure-package checksums.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L63)

<a id="field-field-mq3-qcommon-filesystem-filesystem-fakechecksum-fakechecksum-src-mq3-qcommon-filesystem-ml-327348096"></a>
### fakeChecksum

```ml
fakeChecksum
```

Fallback checksum used when loose-file access affects pure validation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L65)

<a id="field-field-mq3-qcommon-filesystem-filesystem-paths-paths-src-mq3-qcommon-filesystem-ml-775898972"></a>
### paths

```ml
paths
```

Mounted search paths in asset lookup precedence order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L53)

<a id="field-field-mq3-qcommon-filesystem-filesystem-serverpakchecksums-serverpakchecksums-src-mq3-qcommon-filesystem-ml-1643931474"></a>
### serverPakChecksums

```ml
serverPakChecksums
```

Package checksums approved by the connected pure server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L55)

<a id="field-field-mq3-qcommon-filesystem-filesystem-serverpaknames-serverpaknames-src-mq3-qcommon-filesystem-ml-1796979798"></a>
### serverPakNames

```ml
serverPakNames
```

Package names approved by the connected pure server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L57)

<a id="field-field-mq3-qcommon-filesystem-filesystem-serverreferencedpakchecksums-serverreferencedpakchecksums-src-mq3-qcommon-filesystem-ml-1550328776"></a>
### serverReferencedPakChecksums

```ml
serverReferencedPakChecksums
```

Checksums of packages referenced by the connected server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L59)

<a id="field-field-mq3-qcommon-filesystem-filesystem-serverreferencedpaknames-serverreferencedpaknames-src-mq3-qcommon-filesystem-ml-1714908316"></a>
### serverReferencedPakNames

```ml
serverReferencedPakNames
```

Names of packages referenced by the connected server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L61)
