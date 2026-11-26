# `mq3.qcommon.files_runtime.Config`

[Home](README.md) · [Source file](File-src-mq3-qcommon-files-runtime-ml-1340378570.md)

<a id="struct-struct-mq3-qcommon-files-runtime-config-struct-config-src-mq3-qcommon-files-runtime-ml-649276519"></a>
## Config

```ml
struct Config
```

Config record for qcommon.files_runtime, containing `basePath`, `homePath`, `cdPath`, `baseGame`, `gameDir`, `restrict`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L71)

## Members

<a id="field-field-mq3-qcommon-files-runtime-config-basegame-basegame-src-mq3-qcommon-files-runtime-ml-56005183"></a>
### baseGame

```ml
baseGame
```

Name of the base-game asset directory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L79)

<a id="field-field-mq3-qcommon-files-runtime-config-basepath-basepath-src-mq3-qcommon-files-runtime-ml-865983509"></a>
### basePath

```ml
basePath
```

Base installation path used to locate game assets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L73)

<a id="field-field-mq3-qcommon-files-runtime-config-cdpath-cdpath-src-mq3-qcommon-files-runtime-ml-1267980253"></a>
### cdPath

```ml
cdPath
```

Optional read-only game-media path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L77)

<a id="field-field-mq3-qcommon-files-runtime-config-gamedir-gamedir-src-mq3-qcommon-files-runtime-ml-909951093"></a>
### gameDir

```ml
gameDir
```

Currently selected modification or game directory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L81)

<a id="field-field-mq3-qcommon-files-runtime-config-homepath-homepath-src-mq3-qcommon-files-runtime-ml-1178235813"></a>
### homePath

```ml
homePath
```

Writable user-data path searched for configuration and assets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L75)

<a id="field-field-mq3-qcommon-files-runtime-config-restrict-restrict-src-mq3-qcommon-files-runtime-ml-289231665"></a>
### restrict

```ml
restrict
```

True when filesystem access is restricted by the configured package policy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L83)
