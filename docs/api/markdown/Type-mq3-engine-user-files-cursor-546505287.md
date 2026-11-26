# `mq3.engine.user_files.Cursor`

[Home](README.md) · [Source file](File-src-mq3-engine-user-files-ml-1000586437.md)

<a id="struct-struct-mq3-engine-user-files-cursor-struct-cursor-src-mq3-engine-user-files-ml-1012507959"></a>
## Cursor

```ml
struct Cursor
```

Cursor record for engine.user_files, containing `data`, `offset`, `size`, `mode`, `path`, `dirty`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/user_files.ml#L13)

## Members

<a id="field-field-mq3-engine-user-files-cursor-data-data-src-mq3-engine-user-files-ml-1656796585"></a>
### data

```ml
data
```

Buffered contents of the opened user file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/user_files.ml#L15)

<a id="field-field-mq3-engine-user-files-cursor-dirty-dirty-src-mq3-engine-user-files-ml-1207943397"></a>
### dirty

```ml
dirty
```

Whether the stored image differs from the graphics-driver copy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/user_files.ml#L25)

<a id="field-field-mq3-engine-user-files-cursor-mode-mode-src-mq3-engine-user-files-ml-2019073271"></a>
### mode

```ml
mode
```

Access mode selected when the user file was opened.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/user_files.ml#L21)

<a id="field-field-mq3-engine-user-files-cursor-offset-offset-src-mq3-engine-user-files-ml-383814127"></a>
### offset

```ml
offset
```

Byte offset of the current cursor or data range.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/user_files.ml#L17)

<a id="field-field-mq3-engine-user-files-cursor-path-path-src-mq3-engine-user-files-ml-73790207"></a>
### path

```ml
path
```

Filesystem or virtual asset path associated with this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/user_files.ml#L23)

<a id="field-field-mq3-engine-user-files-cursor-size-size-src-mq3-engine-user-files-ml-1528681447"></a>
### size

```ml
size
```

Logical file length in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/user_files.ml#L19)
