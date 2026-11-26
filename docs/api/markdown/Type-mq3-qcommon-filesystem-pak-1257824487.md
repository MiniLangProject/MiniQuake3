# `mq3.qcommon.filesystem.Pak`

[Home](README.md) · [Source file](File-src-mq3-qcommon-filesystem-ml-1002992993.md)

<a id="struct-struct-mq3-qcommon-filesystem-pak-struct-pak-src-mq3-qcommon-filesystem-ml-1058887875"></a>
## Pak

```ml
struct Pak
```

Pak record for qcommon.filesystem, containing `archive`, `basename`, `gameName`, `checksum`, `pureChecksum`, `referenced`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L21)

## Members

<a id="field-field-mq3-qcommon-filesystem-pak-archive-archive-src-mq3-qcommon-filesystem-ml-2003485145"></a>
### archive

```ml
archive
```

Parsed PK3 archive containing the package entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L23)

<a id="field-field-mq3-qcommon-filesystem-pak-basename-basename-src-mq3-qcommon-filesystem-ml-590079225"></a>
### basename

```ml
basename
```

Package filename without its containing filesystem directory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L25)

<a id="field-field-mq3-qcommon-filesystem-pak-checksum-checksum-src-mq3-qcommon-filesystem-ml-1051411279"></a>
### checksum

```ml
checksum
```

Checksum used to validate or identify the represented data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L29)

<a id="field-field-mq3-qcommon-filesystem-pak-gamename-gamename-src-mq3-qcommon-filesystem-ml-1158258895"></a>
### gameName

```ml
gameName
```

Game directory to which this package belongs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L27)

<a id="field-field-mq3-qcommon-filesystem-pak-purechecksum-purechecksum-src-mq3-qcommon-filesystem-ml-1775860999"></a>
### pureChecksum

```ml
pureChecksum
```

Feed-dependent checksum used to validate this package in pure mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L31)

<a id="field-field-mq3-qcommon-filesystem-pak-referenced-referenced-src-mq3-qcommon-filesystem-ml-896794447"></a>
### referenced

```ml
referenced
```

Combined flags recording which VM or asset subsystem used the package.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L33)
