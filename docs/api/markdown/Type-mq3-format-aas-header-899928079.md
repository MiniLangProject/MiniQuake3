# `mq3.format.aas.Header`

[Home](README.md) · [Source file](File-src-mq3-format-aas-ml-835678928.md)

<a id="struct-struct-mq3-format-aas-header-struct-header-src-mq3-format-aas-ml-897210255"></a>
## Header

```ml
struct Header
```

Header record for format.aas, containing `ident`, `version`, `bspChecksum`, `lumps`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L355)

## Members

<a id="field-field-mq3-format-aas-header-bspchecksum-bspchecksum-src-mq3-format-aas-ml-1578883528"></a>
### bspChecksum

```ml
bspChecksum
```

Checksum of the BSP map associated with the navigation data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L361)

<a id="field-field-mq3-format-aas-header-ident-ident-src-mq3-format-aas-ml-403972168"></a>
### ident

```ml
ident
```

Magic value identifying the AAS navigation file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L357)

<a id="field-field-mq3-format-aas-header-lumps-lumps-src-mq3-format-aas-ml-1435177988"></a>
### lumps

```ml
lumps
```

Directory records locating the AAS navigation sections.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L363)

<a id="field-field-mq3-format-aas-header-version-version-src-mq3-format-aas-ml-1673431932"></a>
### version

```ml
version
```

AAS navigation-file format version.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L359)
