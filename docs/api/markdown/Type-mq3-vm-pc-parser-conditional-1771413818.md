# `mq3.vm.pc_parser.Conditional`

[Home](README.md) · [Source file](File-src-mq3-vm-pc-parser-ml-1324474776.md)

<a id="struct-struct-mq3-vm-pc-parser-conditional-struct-conditional-src-mq3-vm-pc-parser-ml-898152425"></a>
## Conditional

```ml
struct Conditional
```

Conditional record for vm.pc_parser, containing `parentActive`, `branchTaken`, `active`, `elseSeen`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L79)

## Members

<a id="field-field-mq3-vm-pc-parser-conditional-active-active-src-mq3-vm-pc-parser-ml-1387465869"></a>
### active

```ml
active
```

Whether tokens in the current preprocessor branch should be emitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L85)

<a id="field-field-mq3-vm-pc-parser-conditional-branchtaken-branchtaken-src-mq3-vm-pc-parser-ml-1155402369"></a>
### branchTaken

```ml
branchTaken
```

Whether an earlier branch of this conditional group was selected.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L83)

<a id="field-field-mq3-vm-pc-parser-conditional-elseseen-elseseen-src-mq3-vm-pc-parser-ml-37273677"></a>
### elseSeen

```ml
elseSeen
```

Whether this conditional group has encountered its else branch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L87)

<a id="field-field-mq3-vm-pc-parser-conditional-parentactive-parentactive-src-mq3-vm-pc-parser-ml-1241779533"></a>
### parentActive

```ml
parentActive
```

Whether the enclosing preprocessor conditional branch is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L81)
