# `mq3.vm.font_abi.Result`

[Home](README.md) · [Source file](File-src-mq3-vm-font-abi-ml-1952985199.md)

<a id="struct-struct-mq3-vm-font-abi-result-struct-result-src-mq3-vm-font-abi-ml-1822160911"></a>
## Result

```ml
struct Result
```

Result record for vm.font_abi, containing `found`, `data`, `registeredGlyphs`, `path`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L46)

## Members

<a id="field-field-mq3-vm-font-abi-result-data-data-src-mq3-vm-font-abi-ml-989599448"></a>
### data

```ml
data
```

Packed legacy fontInfo bytes returned for the requested font.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L50)

<a id="field-field-mq3-vm-font-abi-result-found-found-src-mq3-vm-font-abi-ml-593236936"></a>
### found

```ml
found
```

Nonzero when the requested token, source, or resource result is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L48)

<a id="field-field-mq3-vm-font-abi-result-path-path-src-mq3-vm-font-abi-ml-1154725986"></a>
### path

```ml
path
```

Resource path associated with the cached font data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L54)

<a id="field-field-mq3-vm-font-abi-result-registeredglyphs-registeredglyphs-src-mq3-vm-font-abi-ml-1082195466"></a>
### registeredGlyphs

```ml
registeredGlyphs
```

Renderer glyph handles registered while preparing the font record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/font_abi.ml#L52)
