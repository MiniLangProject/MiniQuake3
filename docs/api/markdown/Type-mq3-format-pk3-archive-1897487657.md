# `mq3.format.pk3.Archive`

[Home](README.md) · [Source file](File-src-mq3-format-pk3-ml-2106134675.md)

<a id="struct-struct-mq3-format-pk3-archive-struct-archive-src-mq3-format-pk3-ml-125582945"></a>
## Archive

```ml
struct Archive
```

Archive record for format.pk3, containing `path`, `entries`, `directoryOffset`, `directorySize`, `endOffset`, `comment`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L54)

## Members

<a id="field-field-mq3-format-pk3-archive-bytebeforezip-bytebeforezip-src-mq3-format-pk3-ml-690038349"></a>
### byteBeforeZip

```ml
byteBeforeZip
```

Number of bytes preceding the ZIP data in a self-extracting or embedded archive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L68)

<a id="field-field-mq3-format-pk3-archive-comment-comment-src-mq3-format-pk3-ml-1777095329"></a>
### comment

```ml
comment
```

Archive-wide ZIP comment; empty for synthetic merged search views.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L66)

<a id="field-field-mq3-format-pk3-archive-directoryoffset-directoryoffset-src-mq3-format-pk3-ml-1583492069"></a>
### directoryOffset

```ml
directoryOffset
```

Byte offset of the central directory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L60)

<a id="field-field-mq3-format-pk3-archive-directorysize-directorysize-src-mq3-format-pk3-ml-1840011117"></a>
### directorySize

```ml
directorySize
```

Length of the central directory in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L62)

<a id="field-field-mq3-format-pk3-archive-endoffset-endoffset-src-mq3-format-pk3-ml-463116605"></a>
### endOffset

```ml
endOffset
```

Byte offset of the end-of-central-directory record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L64)

<a id="field-field-mq3-format-pk3-archive-entries-entries-src-mq3-format-pk3-ml-566133489"></a>
### entries

```ml
entries
```

Central-directory entries available for asset lookup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L58)

<a id="field-field-mq3-format-pk3-archive-modarchive-modarchive-src-mq3-format-pk3-ml-1090508289"></a>
### modArchive

```ml
modArchive
```

Active-game Archive retained by overlay; void when no separate mod archive is attached.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L72)

<a id="field-field-mq3-format-pk3-archive-namebuckets-namebuckets-src-mq3-format-pk3-ml-1343017397"></a>
### nameBuckets

```ml
nameBuckets
```

Hash buckets accelerating entry lookup by normalized name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L70)

<a id="field-field-mq3-format-pk3-archive-path-path-src-mq3-format-pk3-ml-1514330947"></a>
### path

```ml
path
```

PK3 filename for a single archive, or the caller's root directory for a merged search view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L56)
