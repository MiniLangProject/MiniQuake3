# `mq3.format.qfiles.Pcx`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-pcx-struct-pcx-src-mq3-format-qfiles-ml-649368327"></a>
## Pcx

```ml
struct Pcx
```

Pcx record for format.qfiles, containing `manufacturer`, `version`, `encoding`, `bitsPerPixel`, `xmin`, `ymin`, and 11 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L175)

## Members

<a id="field-field-mq3-format-qfiles-pcx-bitsperpixel-bitsperpixel-src-mq3-format-qfiles-ml-1513583046"></a>
### bitsPerPixel

```ml
bitsPerPixel
```

Number of bits per pixel in each PCX color plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L183)

<a id="field-field-mq3-format-qfiles-pcx-bytesperline-bytesperline-src-mq3-format-qfiles-ml-1259868144"></a>
### bytesPerLine

```ml
bytesPerLine
```

Encoded bytes reserved for each PCX scanline in one color plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L203)

<a id="field-field-mq3-format-qfiles-pcx-colorplanes-colorplanes-src-mq3-format-qfiles-ml-547436236"></a>
### colorPlanes

```ml
colorPlanes
```

Number of separately encoded PCX color planes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L201)

<a id="field-field-mq3-format-qfiles-pcx-data-data-src-mq3-format-qfiles-ml-1161220232"></a>
### data

```ml
data
```

Encoded PCX image data following the header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L209)

<a id="field-field-mq3-format-qfiles-pcx-encoding-encoding-src-mq3-format-qfiles-ml-112885910"></a>
### encoding

```ml
encoding
```

PCX pixel-data encoding identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L181)

<a id="field-field-mq3-format-qfiles-pcx-filler-filler-src-mq3-format-qfiles-ml-1897828140"></a>
### filler

```ml
filler
```

Reserved padding bytes in the PCX file header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L207)

<a id="field-field-mq3-format-qfiles-pcx-hres-hres-src-mq3-format-qfiles-ml-1690524164"></a>
### hres

```ml
hres
```

Nominal horizontal image resolution stored in the PCX header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L193)

<a id="field-field-mq3-format-qfiles-pcx-manufacturer-manufacturer-src-mq3-format-qfiles-ml-494404770"></a>
### manufacturer

```ml
manufacturer
```

PCX manufacturer marker identifying the file format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L177)

<a id="field-field-mq3-format-qfiles-pcx-palette-palette-src-mq3-format-qfiles-ml-1560001336"></a>
### palette

```ml
palette
```

PCX header color-palette entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L197)

<a id="field-field-mq3-format-qfiles-pcx-palettetype-palettetype-src-mq3-format-qfiles-ml-1895419976"></a>
### paletteType

```ml
paletteType
```

PCX palette interpretation identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L205)

<a id="field-field-mq3-format-qfiles-pcx-reserved-reserved-src-mq3-format-qfiles-ml-2079284832"></a>
### reserved

```ml
reserved
```

Reserved PCX header byte retained for format compatibility.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L199)

<a id="field-field-mq3-format-qfiles-pcx-version-version-src-mq3-format-qfiles-ml-1914134728"></a>
### version

```ml
version
```

PCX file-format version stored in the header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L179)

<a id="field-field-mq3-format-qfiles-pcx-vres-vres-src-mq3-format-qfiles-ml-316560660"></a>
### vres

```ml
vres
```

Nominal vertical image resolution stored in the PCX header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L195)

<a id="field-field-mq3-format-qfiles-pcx-xmax-xmax-src-mq3-format-qfiles-ml-319692404"></a>
### xmax

```ml
xmax
```

Maximum horizontal image coordinate stored in the PCX header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L189)

<a id="field-field-mq3-format-qfiles-pcx-xmin-xmin-src-mq3-format-qfiles-ml-238504484"></a>
### xmin

```ml
xmin
```

Minimum horizontal image coordinate stored in the PCX header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L185)

<a id="field-field-mq3-format-qfiles-pcx-ymax-ymax-src-mq3-format-qfiles-ml-1269064038"></a>
### ymax

```ml
ymax
```

Maximum vertical image coordinate stored in the PCX header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L191)

<a id="field-field-mq3-format-qfiles-pcx-ymin-ymin-src-mq3-format-qfiles-ml-1720131414"></a>
### ymin

```ml
ymin
```

Minimum vertical image coordinate stored in the PCX header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L187)
