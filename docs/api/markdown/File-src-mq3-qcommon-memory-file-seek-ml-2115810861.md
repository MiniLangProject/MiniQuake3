# `src/mq3/qcommon/memory_file_seek.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.memory_file_seek`](Package-mq3-qcommon-memory-file-seek-527806737.md)

Reachable from entry: **yes**

## Declarations

<a id="constant-constant-mq3-qcommon-memory-file-seek-fs-seek-cur-const-fs-seek-cur-0-src-mq3-qcommon-memory-file-seek-ml-647562501"></a>
### FS_SEEK_CUR

```ml
const FS_SEEK_CUR = 0
```

Seek-origin selector relative to the current file position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/memory_file_seek.ml#L7)

<a id="constant-constant-mq3-qcommon-memory-file-seek-fs-seek-end-const-fs-seek-end-1-src-mq3-qcommon-memory-file-seek-ml-645576138"></a>
### FS_SEEK_END

```ml
const FS_SEEK_END = 1
```

Seek-origin selector relative to the end of the file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/memory_file_seek.ml#L9)

<a id="constant-constant-mq3-qcommon-memory-file-seek-fs-seek-set-const-fs-seek-set-2-src-mq3-qcommon-memory-file-seek-ml-1134191915"></a>
### FS_SEEK_SET

```ml
const FS_SEEK_SET = 2
```

Seek-origin selector relative to the beginning of the file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/memory_file_seek.ml#L11)

<a id="function-function-mq3-qcommon-memory-file-seek-seek-function-seek-files-handle-offset-origin-src-mq3-qcommon-memory-file-seek-ml-548922350"></a>
### seek

```ml
function seek(files, handle, offset, origin)
```

Seek memory file seek in qcommon.memory_file_seek; the normal completion returns `0`.

Validation failures include `invalid FS_Seek origin`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `files` | `dynamic` | — | Files used in `len(files)` and `files[handle]`. |
| `handle` | `dynamic` | — | Zero-based index into `files`. |
| `offset` | `dynamic` | — | Offset used in `(base + offset)` and `(cursor.offset < 0)`. |
| `origin` | `dynamic` | — | Origin used in `(origin == FS_SEEK_END)` and `(origin == FS_SEEK_SET)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/memory_file_seek.ml#L20)
