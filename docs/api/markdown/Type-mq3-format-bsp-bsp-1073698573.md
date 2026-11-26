# `mq3.format.bsp.BSP`

[Home](README.md) · [Source file](File-src-mq3-format-bsp-ml-526613882.md)

<a id="struct-struct-mq3-format-bsp-bsp-struct-bsp-src-mq3-format-bsp-ml-878850671"></a>
## BSP

```ml
struct BSP
```

BSP record for format.bsp, containing `data`, `offsets`, `lengths`, `counts`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/bsp.ml#L10)

## Members

<a id="field-field-mq3-format-bsp-bsp-counts-counts-src-mq3-format-bsp-ml-1621534108"></a>
### counts

```ml
counts
```

Decoded element counts for each BSP lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/bsp.ml#L18)

<a id="field-field-mq3-format-bsp-bsp-data-data-src-mq3-format-bsp-ml-426410636"></a>
### data

```ml
data
```

Complete BSP file bytes backing the lump readers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/bsp.ml#L12)

<a id="field-field-mq3-format-bsp-bsp-lengths-lengths-src-mq3-format-bsp-ml-1929420676"></a>
### lengths

```ml
lengths
```

Byte lengths of BSP lump payloads, indexed by lump identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/bsp.ml#L16)

<a id="field-field-mq3-format-bsp-bsp-offsets-offsets-src-mq3-format-bsp-ml-869306536"></a>
### offsets

```ml
offsets
```

Byte offsets of BSP lump payloads, indexed by lump identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/bsp.ml#L14)
