# `mq3.format.qfiles.VmHeader`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-vmheader-struct-vmheader-src-mq3-format-qfiles-ml-404987299"></a>
## VmHeader

```ml
struct VmHeader
```

Managed mirrors keep the original member order. Variable-sized tails are represented by ordinary arrays and all on-disk decoding remains explicit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L156)

## Members

<a id="field-field-mq3-format-qfiles-vmheader-bsslength-bsslength-src-mq3-format-qfiles-ml-1282111079"></a>
### bssLength

```ml
bssLength
```

Size in bytes of the zero-initialized memory appended after the file data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L172)

<a id="field-field-mq3-format-qfiles-vmheader-codelength-codelength-src-mq3-format-qfiles-ml-1659256333"></a>
### codeLength

```ml
codeLength
```

Length of the QVM instruction section in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L164)

<a id="field-field-mq3-format-qfiles-vmheader-codeoffset-codeoffset-src-mq3-format-qfiles-ml-1370684271"></a>
### codeOffset

```ml
codeOffset
```

Byte offset of QVM instructions from the beginning of the file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L162)

<a id="field-field-mq3-format-qfiles-vmheader-datalength-datalength-src-mq3-format-qfiles-ml-1172310443"></a>
### dataLength

```ml
dataLength
```

Length of the initialized QVM data section in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L168)

<a id="field-field-mq3-format-qfiles-vmheader-dataoffset-dataoffset-src-mq3-format-qfiles-ml-2012425397"></a>
### dataOffset

```ml
dataOffset
```

Byte offset of initialized QVM data from the beginning of the file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L166)

<a id="field-field-mq3-format-qfiles-vmheader-instructioncount-instructioncount-src-mq3-format-qfiles-ml-741067405"></a>
### instructionCount

```ml
instructionCount
```

Number of instructions declared by the QVM bytecode header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L160)

<a id="field-field-mq3-format-qfiles-vmheader-litlength-litlength-src-mq3-format-qfiles-ml-1725249903"></a>
### litLength

```ml
litLength
```

Byte length of the literal-data region that must not be byte-swapped.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L170)

<a id="field-field-mq3-format-qfiles-vmheader-vmmagic-vmmagic-src-mq3-format-qfiles-ml-1019689671"></a>
### vmMagic

```ml
vmMagic
```

Magic value identifying the supported QVM bytecode format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L158)
