# `mq3.qcommon.files_runtime.Runtime`

[Home](README.md) · [Source file](File-src-mq3-qcommon-files-runtime-ml-1340378570.md)

<a id="struct-struct-mq3-qcommon-files-runtime-runtime-struct-runtime-src-mq3-qcommon-files-runtime-ml-703010277"></a>
## Runtime

```ml
struct Runtime
```

Runtime record for qcommon.files_runtime, containing `fs`, `handles`, `config`, `initialized`, `loadStack`, `lastGameDir`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L86)

## Members

<a id="field-field-mq3-qcommon-files-runtime-runtime-commandfn-commandfn-src-mq3-qcommon-files-runtime-ml-1571850111"></a>
### commandFn

```ml
commandFn
```

Host callback that executes a command through the host command interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L105)

<a id="field-field-mq3-qcommon-files-runtime-runtime-config-config-src-mq3-qcommon-files-runtime-ml-928179871"></a>
### config

```ml
config
```

Configuration object supplying the settings used by this runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L92)

<a id="field-field-mq3-qcommon-files-runtime-runtime-context-context-src-mq3-qcommon-files-runtime-ml-1514426087"></a>
### context

```ml
context
```

Caller-supplied data associated with filesystem mod enumeration and host console command registration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L101)

<a id="field-field-mq3-qcommon-files-runtime-runtime-fs-fs-src-mq3-qcommon-files-runtime-ml-1378901517"></a>
### fs

```ml
fs
```

Mounted package and search-path state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L88)

<a id="field-field-mq3-qcommon-files-runtime-runtime-handles-handles-src-mq3-qcommon-files-runtime-ml-1819826603"></a>
### handles

```ml
handles
```

Managed file handles available to engine and VM callers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L90)

<a id="field-field-mq3-qcommon-files-runtime-runtime-initialized-initialized-src-mq3-qcommon-files-runtime-ml-1031671311"></a>
### initialized

```ml
initialized
```

True while virtual-filesystem search paths and runtime state are active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L94)

<a id="field-field-mq3-qcommon-files-runtime-runtime-lastgamedir-lastgamedir-src-mq3-qcommon-files-runtime-ml-406640227"></a>
### lastGameDir

```ml
lastGameDir
```

Game directory used by the preceding filesystem initialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L98)

<a id="field-field-mq3-qcommon-files-runtime-runtime-listmodsfn-listmodsfn-src-mq3-qcommon-files-runtime-ml-2090842553"></a>
### listModsFn

```ml
listModsFn
```

Host callback that enumerates available game modification directories.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L103)

<a id="field-field-mq3-qcommon-files-runtime-runtime-loadstack-loadstack-src-mq3-qcommon-files-runtime-ml-103451703"></a>
### loadStack

```ml
loadStack
```

Nesting count of temporary whole-file loads.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/files_runtime.ml#L96)
