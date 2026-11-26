# `mq3.vm.interpreter.ImageLayout`

[Home](README.md) · [Source file](File-src-mq3-vm-interpreter-ml-500037689.md)

<a id="struct-struct-mq3-vm-interpreter-imagelayout-struct-imagelayout-src-mq3-vm-interpreter-ml-1483186123"></a>
## ImageLayout

```ml
struct ImageLayout
```

Validated QVM header offsets and section lengths, before VM memory is rounded up to a power of two.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L45)

## Members

<a id="field-field-mq3-vm-interpreter-imagelayout-codelength-codelength-src-mq3-vm-interpreter-ml-1970283218"></a>
### codeLength

```ml
codeLength
```

Length of the VM code region in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L51)

<a id="field-field-mq3-vm-interpreter-imagelayout-codeoffset-codeoffset-src-mq3-vm-interpreter-ml-1838560244"></a>
### codeOffset

```ml
codeOffset
```

Byte offset of the instruction section within the QVM image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L49)

<a id="field-field-mq3-vm-interpreter-imagelayout-count-count-src-mq3-vm-interpreter-ml-1510960048"></a>
### count

```ml
count
```

Number of QVM instructions declared by the image header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L47)

<a id="field-field-mq3-vm-interpreter-imagelayout-datalength-datalength-src-mq3-vm-interpreter-ml-1533455760"></a>
### dataLength

```ml
dataLength
```

Length of initialized VM data in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L55)

<a id="field-field-mq3-vm-interpreter-imagelayout-dataoffset-dataoffset-src-mq3-vm-interpreter-ml-487248010"></a>
### dataOffset

```ml
dataOffset
```

Byte offset of the initialized data section within the QVM image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L53)

<a id="field-field-mq3-vm-interpreter-imagelayout-litlength-litlength-src-mq3-vm-interpreter-ml-2025819288"></a>
### litLength

```ml
litLength
```

Length in bytes of the read-only literal region appended to VM data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L57)

<a id="field-field-mq3-vm-interpreter-imagelayout-memorysize-memorysize-src-mq3-vm-interpreter-ml-387586932"></a>
### memorySize

```ml
memorySize
```

Sum of initialized-data, literal, and BSS byte lengths from the header; `load` rounds this up to a power of two and reserves the highest 65,536 bytes for the program stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L60)
