# `mq3.vm.pc_parser.Define`

[Home](README.md) · [Source file](File-src-mq3-vm-pc-parser-ml-1324474776.md)

<a id="struct-struct-mq3-vm-pc-parser-define-struct-define-src-mq3-vm-pc-parser-ml-1910795847"></a>
## Define

```ml
struct Define
```

Define record for vm.pc_parser, containing `name`, `parameters`, `tokens`, `functionLike`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L68)

## Members

<a id="field-field-mq3-vm-pc-parser-define-functionlike-functionlike-src-mq3-vm-pc-parser-ml-1064688424"></a>
### functionLike

```ml
functionLike
```

Nonzero when the macro requires an argument list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L76)

<a id="field-field-mq3-vm-pc-parser-define-name-name-src-mq3-vm-pc-parser-ml-580665868"></a>
### name

```ml
name
```

Identifier bound to this preprocessor macro.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L70)

<a id="field-field-mq3-vm-pc-parser-define-parameters-parameters-src-mq3-vm-pc-parser-ml-1256120846"></a>
### parameters

```ml
parameters
```

Formal parameter names accepted by a function-like macro.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L72)

<a id="field-field-mq3-vm-pc-parser-define-tokens-tokens-src-mq3-vm-pc-parser-ml-524640530"></a>
### tokens

```ml
tokens
```

Token sequence forming the macro replacement or parser result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L74)
