# `mq3.engine.user_files.Store`

[Home](README.md) · [Source file](File-src-mq3-engine-user-files-ml-1000586437.md)

<a id="struct-struct-mq3-engine-user-files-store-struct-store-src-mq3-engine-user-files-ml-649051147"></a>
## Store

```ml
struct Store
```

Store record for engine.user_files, containing `archive`, `root`, `files`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/user_files.ml#L28)

## Members

<a id="field-field-mq3-engine-user-files-store-archive-archive-src-mq3-engine-user-files-ml-548309122"></a>
### archive

```ml
archive
```

Asset archive used to resolve game resources by virtual path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/user_files.ml#L30)

<a id="field-field-mq3-engine-user-files-store-files-files-src-mq3-engine-user-files-ml-1829343502"></a>
### files

```ml
files
```

Open VM file handles and their associated cursors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/user_files.ml#L34)

<a id="field-field-mq3-engine-user-files-store-root-root-src-mq3-engine-user-files-ml-1161975938"></a>
### root

```ml
root
```

Root directory under which user-file operations are resolved.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/user_files.ml#L32)
