# `mq3.qcommon.files_runtime.OpenResult`

[Home](README.md) · [Source file](File-src-mq3-qcommon-files-runtime-ml-1340378570.md)

<a id="struct-struct-mq3-qcommon-files-runtime-openresult-struct-openresult-src-mq3-qcommon-files-runtime-ml-2060924967"></a>
## OpenResult

```ml
struct OpenResult
```

OpenResult record for qcommon.files_runtime, containing `length`, `handle`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L48)

## Members

<a id="field-field-mq3-qcommon-files-runtime-openresult-handle-handle-src-mq3-qcommon-files-runtime-ml-1973753460"></a>
### handle

```ml
handle
```

Managed file handle returned by the open operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L52)

<a id="field-field-mq3-qcommon-files-runtime-openresult-length-length-src-mq3-qcommon-files-runtime-ml-266612980"></a>
### length

```ml
length
```

Length of the opened file in bytes, or an error sentinel.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L50)
