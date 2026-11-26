# `mq3.format.unzip.LocalHeader`

[Home](README.md) · [Source file](File-src-mq3-format-unzip-ml-788120655.md)

<a id="struct-struct-mq3-format-unzip-localheader-struct-localheader-src-mq3-format-unzip-ml-1577516717"></a>
## LocalHeader

```ml
struct LocalHeader
```

LocalHeader record for format.unzip, containing `dataOffset`, `extra`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L102)

## Members

<a id="field-field-mq3-format-unzip-localheader-dataoffset-dataoffset-src-mq3-format-unzip-ml-1877844123"></a>
### dataOffset

```ml
dataOffset
```

Byte offset of compressed entry data following the local header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L104)

<a id="field-field-mq3-format-unzip-localheader-extra-extra-src-mq3-format-unzip-ml-507792085"></a>
### extra

```ml
extra
```

Extra-field bytes stored in the ZIP entry header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/unzip.ml#L106)
