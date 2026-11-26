# `mq3.qcommon.filesystem.SearchPath`

[Home](README.md) · [Source file](File-src-mq3-qcommon-filesystem-ml-1002992993.md)

<a id="struct-struct-mq3-qcommon-filesystem-searchpath-struct-searchpath-src-mq3-qcommon-filesystem-ml-3993009"></a>
## SearchPath

```ml
struct SearchPath
```

SearchPath record for qcommon.filesystem, containing `kind`, `pak`, `root`, `gameName`, `looseFiles`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L37)

## Members

<a id="field-field-mq3-qcommon-filesystem-searchpath-gamename-gamename-src-mq3-qcommon-filesystem-ml-1015169614"></a>
### gameName

```ml
gameName
```

Game directory searched by this path entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L45)

<a id="field-field-mq3-qcommon-filesystem-searchpath-kind-kind-src-mq3-qcommon-filesystem-ml-372167936"></a>
### kind

```ml
kind
```

Search-path discriminator selecting a package or loose-file directory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L39)

<a id="field-field-mq3-qcommon-filesystem-searchpath-loosefiles-loosefiles-src-mq3-qcommon-filesystem-ml-1740652306"></a>
### looseFiles

```ml
looseFiles
```

Loose files made available through this search-path entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L47)

<a id="field-field-mq3-qcommon-filesystem-searchpath-pak-pak-src-mq3-qcommon-filesystem-ml-557722076"></a>
### pak

```ml
pak
```

Package descriptor when this search path refers to a PK3 archive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L41)

<a id="field-field-mq3-qcommon-filesystem-searchpath-root-root-src-mq3-qcommon-filesystem-ml-932253128"></a>
### root

```ml
root
```

Filesystem root of a loose-file search path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/filesystem.ml#L43)
