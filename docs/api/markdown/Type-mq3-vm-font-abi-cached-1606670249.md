# `mq3.vm.font_abi.Cached`

[Home](README.md) · [Source file](File-src-mq3-vm-font-abi-ml-1952985199.md)

<a id="struct-struct-mq3-vm-font-abi-cached-struct-cached-src-mq3-vm-font-abi-ml-992354731"></a>
## Cached

```ml
struct Cached
```

Cached record for vm.font_abi, containing `pointSize`, `data`, `registeredGlyphs`, `path`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/font_abi.ml#L28)

## Members

<a id="field-field-mq3-vm-font-abi-cached-data-data-src-mq3-vm-font-abi-ml-1809247585"></a>
### data

```ml
data
```

Packed legacy fontInfo bytes retained in the font cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/font_abi.ml#L32)

<a id="field-field-mq3-vm-font-abi-cached-path-path-src-mq3-vm-font-abi-ml-142785871"></a>
### path

```ml
path
```

Resource path associated with the cached font data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/font_abi.ml#L36)

<a id="field-field-mq3-vm-font-abi-cached-pointsize-pointsize-src-mq3-vm-font-abi-ml-1214731541"></a>
### pointSize

```ml
pointSize
```

Requested font point size associated with the font cache entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/font_abi.ml#L30)

<a id="field-field-mq3-vm-font-abi-cached-registeredglyphs-registeredglyphs-src-mq3-vm-font-abi-ml-311259023"></a>
### registeredGlyphs

```ml
registeredGlyphs
```

Renderer glyph handles registered while preparing the font record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/font_abi.ml#L34)
