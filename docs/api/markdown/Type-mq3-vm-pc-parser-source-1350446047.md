# `mq3.vm.pc_parser.Source`

[Home](README.md) · [Source file](File-src-mq3-vm-pc-parser-ml-1324474776.md)

<a id="struct-struct-mq3-vm-pc-parser-source-struct-source-src-mq3-vm-pc-parser-ml-391833307"></a>
## Source

```ml
struct Source
```

Source record for vm.pc_parser, containing `name`, `data`, `offset`, `line`, `pending`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L55)

## Members

<a id="field-field-mq3-vm-pc-parser-source-data-data-src-mq3-vm-pc-parser-ml-1685055316"></a>
### data

```ml
data
```

Source bytes being tokenized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L59)

<a id="field-field-mq3-vm-pc-parser-source-line-line-src-mq3-vm-pc-parser-ml-1002664268"></a>
### line

```ml
line
```

Current source line number.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L63)

<a id="field-field-mq3-vm-pc-parser-source-name-name-src-mq3-vm-pc-parser-ml-25264426"></a>
### name

```ml
name
```

Name/path of the source supplied to the parser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L57)

<a id="field-field-mq3-vm-pc-parser-source-offset-offset-src-mq3-vm-pc-parser-ml-2073326118"></a>
### offset

```ml
offset
```

Byte cursor of the next source character to read.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L61)

<a id="field-field-mq3-vm-pc-parser-source-pending-pending-src-mq3-vm-pc-parser-ml-1179340956"></a>
### pending

```ml
pending
```

Tokens queued for subsequent reading or macro expansion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L65)
