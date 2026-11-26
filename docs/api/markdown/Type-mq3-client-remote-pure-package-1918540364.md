# `mq3.client.remote_pure.Package`

[Home](README.md) · [Source file](File-src-mq3-client-remote-pure-ml-1817468994.md)

<a id="struct-struct-mq3-client-remote-pure-package-struct-package-src-mq3-client-remote-pure-ml-546796649"></a>
## Package

```ml
struct Package
```

Stores remote pure package record, including `archive`, `pureChecksum`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_pure.ml#L22)

## Members

<a id="field-field-mq3-client-remote-pure-package-archive-archive-src-mq3-client-remote-pure-ml-721478925"></a>
### archive

```ml
archive
```

When constructing this record, `verify` supplies `archive` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_pure.ml#L24)

<a id="field-field-mq3-client-remote-pure-package-purechecksum-purechecksum-src-mq3-client-remote-pure-ml-1796583867"></a>
### pureChecksum

```ml
pureChecksum
```

When constructing this record, `verify` supplies `pureMd4.blockChecksumKey(header,checksumFeed)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_pure.ml#L27)
