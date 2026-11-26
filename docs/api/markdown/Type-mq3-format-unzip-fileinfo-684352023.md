# `mq3.format.unzip.FileInfo`

[Home](README.md) · [Source file](File-src-mq3-format-unzip-ml-788120655.md)

<a id="struct-struct-mq3-format-unzip-fileinfo-struct-fileinfo-src-mq3-format-unzip-ml-473577035"></a>
## FileInfo

```ml
struct FileInfo
```

FileInfo record for format.unzip, containing `version`, `versionNeeded`, `flag`, `compressionMethod`, `dosDate`, `crc`, and 12 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L63)

## Members

<a id="field-field-mq3-format-unzip-fileinfo-comment-comment-src-mq3-format-unzip-ml-981995219"></a>
### comment

```ml
comment
```

Comment text stored with the archive, entry, or model metadata.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L99)

<a id="field-field-mq3-format-unzip-fileinfo-compressedsize-compressedsize-src-mq3-format-unzip-ml-1076542175"></a>
### compressedSize

```ml
compressedSize
```

Length of the compressed ZIP entry data in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L77)

<a id="field-field-mq3-format-unzip-fileinfo-compressionmethod-compressionmethod-src-mq3-format-unzip-ml-1071392627"></a>
### compressionMethod

```ml
compressionMethod
```

ZIP compression-method identifier used by this entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L71)

<a id="field-field-mq3-format-unzip-fileinfo-crc-crc-src-mq3-format-unzip-ml-1328623207"></a>
### crc

```ml
crc
```

CRC-32 checksum of the uncompressed ZIP entry data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L75)

<a id="field-field-mq3-format-unzip-fileinfo-disknumstart-disknumstart-src-mq3-format-unzip-ml-1955906069"></a>
### diskNumStart

```ml
diskNumStart
```

Disk number containing the start of this ZIP entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L87)

<a id="field-field-mq3-format-unzip-fileinfo-dosdate-dosdate-src-mq3-format-unzip-ml-900552015"></a>
### dosDate

```ml
dosDate
```

Packed MS-DOS date and time of the ZIP entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L73)

<a id="field-field-mq3-format-unzip-fileinfo-externalfa-externalfa-src-mq3-format-unzip-ml-724659607"></a>
### externalFa

```ml
externalFa
```

External platform-specific ZIP file-attribute bits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L91)

<a id="field-field-mq3-format-unzip-fileinfo-extra-extra-src-mq3-format-unzip-ml-742078695"></a>
### extra

```ml
extra
```

Extra-field bytes stored in the ZIP entry header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L97)

<a id="field-field-mq3-format-unzip-fileinfo-flag-flag-src-mq3-format-unzip-ml-619247443"></a>
### flag

```ml
flag
```

ZIP general-purpose entry flags.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L69)

<a id="field-field-mq3-format-unzip-fileinfo-internalfa-internalfa-src-mq3-format-unzip-ml-182693615"></a>
### internalFa

```ml
internalFa
```

Internal ZIP file-attribute bits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L89)

<a id="field-field-mq3-format-unzip-fileinfo-name-name-src-mq3-format-unzip-ml-848442169"></a>
### name

```ml
name
```

Filename stored in the ZIP central-directory entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L95)

<a id="field-field-mq3-format-unzip-fileinfo-sizefilecomment-sizefilecomment-src-mq3-format-unzip-ml-663917279"></a>
### sizeFileComment

```ml
sizeFileComment
```

Length of the ZIP entry comment in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L85)

<a id="field-field-mq3-format-unzip-fileinfo-sizefileextra-sizefileextra-src-mq3-format-unzip-ml-1477554215"></a>
### sizeFileExtra

```ml
sizeFileExtra
```

Length of the ZIP extra-field data in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L83)

<a id="field-field-mq3-format-unzip-fileinfo-sizefilename-sizefilename-src-mq3-format-unzip-ml-564316039"></a>
### sizeFilename

```ml
sizeFilename
```

Length of the ZIP entry filename in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L81)

<a id="field-field-mq3-format-unzip-fileinfo-tmudate-tmudate-src-mq3-format-unzip-ml-1774964087"></a>
### tmuDate

```ml
tmuDate
```

ZIP entry timestamp expanded into calendar fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L93)

<a id="field-field-mq3-format-unzip-fileinfo-uncompressedsize-uncompressedsize-src-mq3-format-unzip-ml-1963922849"></a>
### uncompressedSize

```ml
uncompressedSize
```

Length of the decoded ZIP entry data in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L79)

<a id="field-field-mq3-format-unzip-fileinfo-version-version-src-mq3-format-unzip-ml-1597982019"></a>
### version

```ml
version
```

ZIP creator version stored in the central-directory record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L65)

<a id="field-field-mq3-format-unzip-fileinfo-versionneeded-versionneeded-src-mq3-format-unzip-ml-883742395"></a>
### versionNeeded

```ml
versionNeeded
```

Minimum ZIP reader version required to extract the entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L67)
