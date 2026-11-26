# `mq3.format.qfiles.TargaHeader`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-targaheader-struct-targaheader-src-mq3-format-qfiles-ml-450714221"></a>
## TargaHeader

```ml
struct TargaHeader
```

TargaHeader record for format.qfiles, containing `idLength`, `colormapType`, `imageType`, `colormapIndex`, `colormapLength`, `colormapSize`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L212)

## Members

<a id="field-field-mq3-format-qfiles-targaheader-attributes-attributes-src-mq3-format-qfiles-ml-573739997"></a>
### attributes

```ml
attributes
```

TGA descriptor bits controlling orientation and attribute depth.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L236)

<a id="field-field-mq3-format-qfiles-targaheader-colormapindex-colormapindex-src-mq3-format-qfiles-ml-1483399727"></a>
### colormapIndex

```ml
colormapIndex
```

Index of the first entry in the TGA color map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L220)

<a id="field-field-mq3-format-qfiles-targaheader-colormaplength-colormaplength-src-mq3-format-qfiles-ml-2053006261"></a>
### colormapLength

```ml
colormapLength
```

Number of entries in the TGA color map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L222)

<a id="field-field-mq3-format-qfiles-targaheader-colormapsize-colormapsize-src-mq3-format-qfiles-ml-954553195"></a>
### colormapSize

```ml
colormapSize
```

Bits stored for each entry in the TGA color map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L224)

<a id="field-field-mq3-format-qfiles-targaheader-colormaptype-colormaptype-src-mq3-format-qfiles-ml-41891713"></a>
### colormapType

```ml
colormapType
```

TGA color-map presence flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L216)

<a id="field-field-mq3-format-qfiles-targaheader-height-height-src-mq3-format-qfiles-ml-487434265"></a>
### height

```ml
height
```

Image height in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L232)

<a id="field-field-mq3-format-qfiles-targaheader-idlength-idlength-src-mq3-format-qfiles-ml-730729469"></a>
### idLength

```ml
idLength
```

Length in bytes of the TGA image-identification string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L214)

<a id="field-field-mq3-format-qfiles-targaheader-imagetype-imagetype-src-mq3-format-qfiles-ml-56715519"></a>
### imageType

```ml
imageType
```

TGA image encoding type.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L218)

<a id="field-field-mq3-format-qfiles-targaheader-pixelsize-pixelsize-src-mq3-format-qfiles-ml-602234415"></a>
### pixelSize

```ml
pixelSize
```

Bits stored for each TGA image pixel.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L234)

<a id="field-field-mq3-format-qfiles-targaheader-width-width-src-mq3-format-qfiles-ml-1768248643"></a>
### width

```ml
width
```

Image width in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L230)

<a id="field-field-mq3-format-qfiles-targaheader-xorigin-xorigin-src-mq3-format-qfiles-ml-1017942855"></a>
### xOrigin

```ml
xOrigin
```

Horizontal image-origin coordinate stored in the TGA header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L226)

<a id="field-field-mq3-format-qfiles-targaheader-yorigin-yorigin-src-mq3-format-qfiles-ml-1364125443"></a>
### yOrigin

```ml
yOrigin
```

Vertical image-origin coordinate stored in the TGA header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L228)
