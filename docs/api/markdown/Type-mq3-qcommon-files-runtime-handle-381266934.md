# `mq3.qcommon.files_runtime.Handle`

[Home](README.md) · [Source file](File-src-mq3-qcommon-files-runtime-ml-1340378570.md)

<a id="struct-struct-mq3-qcommon-files-runtime-handle-struct-handle-src-mq3-qcommon-files-runtime-ml-1729026651"></a>
## Handle

```ml
struct Handle
```

Handle record for qcommon.files_runtime, containing `active`, `name`, `mode`, `data`, `position`, `path`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L25)

## Members

<a id="field-field-mq3-qcommon-files-runtime-handle-active-active-src-mq3-qcommon-files-runtime-ml-585689893"></a>
### active

```ml
active
```

True while this entry participates in the active runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L27)

<a id="field-field-mq3-qcommon-files-runtime-handle-data-data-src-mq3-qcommon-files-runtime-ml-85215529"></a>
### data

```ml
data
```

Buffered contents of the open file or decoded archive entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L33)

<a id="field-field-mq3-qcommon-files-runtime-handle-dirty-dirty-src-mq3-qcommon-files-runtime-ml-1181174121"></a>
### dirty

```ml
dirty
```

True when buffered writes have not yet been flushed to the host file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L39)

<a id="field-field-mq3-qcommon-files-runtime-handle-mode-mode-src-mq3-qcommon-files-runtime-ml-99796435"></a>
### mode

```ml
mode
```

Read, write, or append mode selected when the handle was opened.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L31)

<a id="field-field-mq3-qcommon-files-runtime-handle-name-name-src-mq3-qcommon-files-runtime-ml-607622639"></a>
### name

```ml
name
```

Virtual filesystem name used when opening this file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L29)

<a id="field-field-mq3-qcommon-files-runtime-handle-path-path-src-mq3-qcommon-files-runtime-ml-1436675015"></a>
### path

```ml
path
```

Resolved host filesystem path for a loose file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L37)

<a id="field-field-mq3-qcommon-files-runtime-handle-position-position-src-mq3-qcommon-files-runtime-ml-92359095"></a>
### position

```ml
position
```

Current cursor within the parsed token sequence or open file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L35)

<a id="field-field-mq3-qcommon-files-runtime-handle-sync-sync-src-mq3-qcommon-files-runtime-ml-287038787"></a>
### sync

```ml
sync
```

True when writes should be flushed synchronously.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L41)

<a id="field-field-mq3-qcommon-files-runtime-handle-unique-unique-src-mq3-qcommon-files-runtime-ml-674614787"></a>
### unique

```ml
unique
```

True when the open operation requests a separately owned file stream.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L45)

<a id="field-field-mq3-qcommon-files-runtime-handle-zipfile-zipfile-src-mq3-qcommon-files-runtime-ml-979976665"></a>
### zipFile

```ml
zipFile
```

True when the handle reads an entry inside a PK3 archive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/files_runtime.ml#L43)
