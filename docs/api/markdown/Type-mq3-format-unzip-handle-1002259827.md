# `mq3.format.unzip.Handle`

[Home](README.md) · [Source file](File-src-mq3-format-unzip-ml-788120655.md)

<a id="struct-struct-mq3-format-unzip-handle-struct-handle-src-mq3-format-unzip-ml-110280867"></a>
## Handle

```ml
struct Handle
```

Handle record for format.unzip, containing `archive`, `current`, `currentOk`, `readData`, `readPosition`, `localExtra`, and 1 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L109)

## Members

<a id="field-field-mq3-format-unzip-handle-archive-archive-src-mq3-format-unzip-ml-920170135"></a>
### archive

```ml
archive
```

Underlying parsed PK3 or ZIP archive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L111)

<a id="field-field-mq3-format-unzip-handle-closed-closed-src-mq3-format-unzip-ml-486909351"></a>
### closed

```ml
closed
```

True after the archive handle has been closed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L123)

<a id="field-field-mq3-format-unzip-handle-current-current-src-mq3-format-unzip-ml-516098383"></a>
### current

```ml
current
```

Index of the currently selected central-directory entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L113)

<a id="field-field-mq3-format-unzip-handle-currentok-currentok-src-mq3-format-unzip-ml-1035242775"></a>
### currentOk

```ml
currentOk
```

True when a current ZIP entry is selected successfully.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L115)

<a id="field-field-mq3-format-unzip-handle-localextra-localextra-src-mq3-format-unzip-ml-1465938133"></a>
### localExtra

```ml
localExtra
```

Extra-field bytes from the current entry's local header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L121)

<a id="field-field-mq3-format-unzip-handle-readdata-readdata-src-mq3-format-unzip-ml-504259303"></a>
### readData

```ml
readData
```

Decoded bytes of the entry currently opened for reading.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L117)

<a id="field-field-mq3-format-unzip-handle-readposition-readposition-src-mq3-format-unzip-ml-1744418185"></a>
### readPosition

```ml
readPosition
```

Byte position of the next read within the decoded entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/unzip.ml#L119)
