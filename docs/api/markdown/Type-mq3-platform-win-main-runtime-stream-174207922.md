# `mq3.platform.win_main_runtime.Stream`

[Home](README.md) · [Source file](File-src-mq3-platform-win-main-runtime-ml-2060063046.md)

<a id="struct-struct-mq3-platform-win-main-runtime-stream-struct-stream-src-mq3-platform-win-main-runtime-ml-579319873"></a>
## Stream

```ml
struct Stream
```

Data record for `mq3.platform.win_main_runtime.Stream`; groups `file`, `data`, `position`, `active`, `readFn`, `seekFn`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L124)

## Members

<a id="field-field-mq3-platform-win-main-runtime-stream-active-active-src-mq3-platform-win-main-runtime-ml-1630787413"></a>
### active

```ml
active
```

Whether this object is currently active and accepts processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L132)

<a id="field-field-mq3-platform-win-main-runtime-stream-context-context-src-mq3-platform-win-main-runtime-ml-1517494677"></a>
### context

```ml
context
```

File-backend state passed to the stream's read and seek callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L138)

<a id="field-field-mq3-platform-win-main-runtime-stream-data-data-src-mq3-platform-win-main-runtime-ml-940222313"></a>
### data

```ml
data
```

Buffered bytes backing the streamed-file adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L128)

<a id="field-field-mq3-platform-win-main-runtime-stream-file-file-src-mq3-platform-win-main-runtime-ml-371357573"></a>
### file

```ml
file
```

Open file object used by the stream or cursor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L126)

<a id="field-field-mq3-platform-win-main-runtime-stream-position-position-src-mq3-platform-win-main-runtime-ml-270252627"></a>
### position

```ml
position
```

Current byte position in the streamed file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L130)

<a id="field-field-mq3-platform-win-main-runtime-stream-readfn-readfn-src-mq3-platform-win-main-runtime-ml-983745133"></a>
### readFn

```ml
readFn
```

Host callback used to perform read operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L134)

<a id="field-field-mq3-platform-win-main-runtime-stream-seekfn-seekfn-src-mq3-platform-win-main-runtime-ml-1612830705"></a>
### seekFn

```ml
seekFn
```

Host callback used to perform seek operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L136)
