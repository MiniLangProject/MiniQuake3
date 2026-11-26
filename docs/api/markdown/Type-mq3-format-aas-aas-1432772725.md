# `mq3.format.aas.AAS`

[Home](README.md) · [Source file](File-src-mq3-format-aas-ml-835678928.md)

<a id="struct-struct-mq3-format-aas-aas-struct-aas-src-mq3-format-aas-ml-1156297967"></a>
## AAS

```ml
struct AAS
```

AAS record for format.aas, containing `data`, `version`, `bspChecksum`, `offsets`, `lengths`, `counts`, and 1 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/aas.ml#L218)

## Members

<a id="field-field-mq3-format-aas-aas-bspchecksum-bspchecksum-src-mq3-format-aas-ml-2093158886"></a>
### bspChecksum

```ml
bspChecksum
```

Checksum of the BSP map associated with the navigation data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/aas.ml#L224)

<a id="field-field-mq3-format-aas-aas-counts-counts-src-mq3-format-aas-ml-55595686"></a>
### counts

```ml
counts
```

Decoded record counts for each AAS lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/aas.ml#L230)

<a id="field-field-mq3-format-aas-aas-data-data-src-mq3-format-aas-ml-943745686"></a>
### data

```ml
data
```

Complete AAS file bytes backing the navigation readers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/aas.ml#L220)

<a id="field-field-mq3-format-aas-aas-lengths-lengths-src-mq3-format-aas-ml-1907327342"></a>
### lengths

```ml
lengths
```

Byte lengths of AAS lump payloads indexed by lump identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/aas.ml#L228)

<a id="field-field-mq3-format-aas-aas-offsets-offsets-src-mq3-format-aas-ml-1203046802"></a>
### offsets

```ml
offsets
```

Byte offsets of AAS lump payloads indexed by lump identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/aas.ml#L226)

<a id="field-field-mq3-format-aas-aas-sequential-sequential-src-mq3-format-aas-ml-1056851892"></a>
### sequential

```ml
sequential
```

True when lump data follows the expected sequential file layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/aas.ml#L232)

<a id="field-field-mq3-format-aas-aas-version-version-src-mq3-format-aas-ml-1256394890"></a>
### version

```ml
version
```

AAS file-format version selected by the loader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/aas.ml#L222)
