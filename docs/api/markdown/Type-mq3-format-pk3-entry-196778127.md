# `mq3.format.pk3.Entry`

[Home](README.md) · [Source file](File-src-mq3-format-pk3-ml-2106134675.md)

<a id="struct-struct-mq3-format-pk3-entry-struct-entry-src-mq3-format-pk3-ml-664173645"></a>
## Entry

```ml
struct Entry
```

Entry record for format.pk3, containing `name`, `version`, `versionNeeded`, `flags`, `method`, `dosDate`, and 12 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L14)

## Members

<a id="field-field-mq3-format-pk3-entry-centralextra-centralextra-src-mq3-format-pk3-ml-899644341"></a>
### centralExtra

```ml
centralExtra
```

Extra-field bytes stored in the central-directory record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L38)

<a id="field-field-mq3-format-pk3-entry-centraloffset-centraloffset-src-mq3-format-pk3-ml-1618252407"></a>
### centralOffset

```ml
centralOffset
```

Absolute byte offset of this entry's central-directory record in sourcePath.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L36)

<a id="field-field-mq3-format-pk3-entry-checksum-checksum-src-mq3-format-pk3-ml-127014181"></a>
### checksum

```ml
checksum
```

CRC-32 of the uncompressed ZIP entry, checked by readEntry for archive-backed data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L28)

<a id="field-field-mq3-format-pk3-entry-comment-comment-src-mq3-format-pk3-ml-1816313115"></a>
### comment

```ml
comment
```

Per-entry ZIP comment decoded from the central-directory record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L40)

<a id="field-field-mq3-format-pk3-entry-compressedsize-compressedsize-src-mq3-format-pk3-ml-460328823"></a>
### compressedSize

```ml
compressedSize
```

Length of the compressed ZIP entry data in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L30)

<a id="field-field-mq3-format-pk3-entry-diskstart-diskstart-src-mq3-format-pk3-ml-782579843"></a>
### diskStart

```ml
diskStart
```

Disk number containing the start of this ZIP entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L42)

<a id="field-field-mq3-format-pk3-entry-dosdate-dosdate-src-mq3-format-pk3-ml-1458153015"></a>
### dosDate

```ml
dosDate
```

Packed MS-DOS date and time of the ZIP entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L26)

<a id="field-field-mq3-format-pk3-entry-externalattributes-externalattributes-src-mq3-format-pk3-ml-1453543103"></a>
### externalAttributes

```ml
externalAttributes
```

External platform-specific ZIP file-attribute bits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L46)

<a id="field-field-mq3-format-pk3-entry-flags-flags-src-mq3-format-pk3-ml-241394919"></a>
### flags

```ml
flags
```

ZIP general-purpose flags controlling the entry encoding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L22)

<a id="field-field-mq3-format-pk3-entry-internalattributes-internalattributes-src-mq3-format-pk3-ml-1680007255"></a>
### internalAttributes

```ml
internalAttributes
```

Internal ZIP file-attribute bits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L44)

<a id="field-field-mq3-format-pk3-entry-localoffset-localoffset-src-mq3-format-pk3-ml-1115577231"></a>
### localOffset

```ml
localOffset
```

Absolute byte offset of the local header in sourcePath, including any prefix before the ZIP data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L34)

<a id="field-field-mq3-format-pk3-entry-method-method-src-mq3-format-pk3-ml-304300829"></a>
### method

```ml
method
```

ZIP compression-method identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L24)

<a id="field-field-mq3-format-pk3-entry-name-name-src-mq3-format-pk3-ml-1402328065"></a>
### name

```ml
name
```

Entry path exactly as decoded from ZIP metadata; lookup ignores ASCII case but does not rewrite separators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L16)

<a id="field-field-mq3-format-pk3-entry-size-size-src-mq3-format-pk3-ml-1037092069"></a>
### size

```ml
size
```

Length of the uncompressed entry data in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L32)

<a id="field-field-mq3-format-pk3-entry-sourcedirectoryoffset-sourcedirectoryoffset-src-mq3-format-pk3-ml-1811552327"></a>
### sourceDirectoryOffset

```ml
sourceDirectoryOffset
```

Absolute byte offset of the source PK3's central directory; -1 identifies a loose file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L50)

<a id="field-field-mq3-format-pk3-entry-sourcepath-sourcepath-src-mq3-format-pk3-ml-153377515"></a>
### sourcePath

```ml
sourcePath
```

Filesystem path of the containing PK3, or of the file itself for a loose-file entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L48)

<a id="field-field-mq3-format-pk3-entry-version-version-src-mq3-format-pk3-ml-756469275"></a>
### version

```ml
version
```

ZIP creator version recorded in the central-directory entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L18)

<a id="field-field-mq3-format-pk3-entry-versionneeded-versionneeded-src-mq3-format-pk3-ml-674118419"></a>
### versionNeeded

```ml
versionNeeded
```

Minimum ZIP reader version required to extract the entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/pk3.ml#L20)
