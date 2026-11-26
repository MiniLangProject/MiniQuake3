# `mq3.vm.pc_parser.Expression`

[Home](README.md) · [Source file](File-src-mq3-vm-pc-parser-ml-1324474776.md)

<a id="struct-struct-mq3-vm-pc-parser-expression-struct-expression-src-mq3-vm-pc-parser-ml-90682363"></a>
## Expression

```ml
struct Expression
```

Expression record for vm.pc_parser, containing `registry`, `tokens`, `position`, `valid`, `depth`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L90)

## Members

<a id="field-field-mq3-vm-pc-parser-expression-depth-depth-src-mq3-vm-pc-parser-ml-1441500219"></a>
### depth

```ml
depth
```

Current nesting depth of macro expansion or parser evaluation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L101)

<a id="field-field-mq3-vm-pc-parser-expression-position-position-src-mq3-vm-pc-parser-ml-803739117"></a>
### position

```ml
position
```

Current position within the token or argument sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L96)

<a id="field-field-mq3-vm-pc-parser-expression-registry-registry-src-mq3-vm-pc-parser-ml-2119383925"></a>
### registry

```ml
registry
```

Registry of currently loaded preprocessor/token sources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L92)

<a id="field-field-mq3-vm-pc-parser-expression-tokens-tokens-src-mq3-vm-pc-parser-ml-1013347795"></a>
### tokens

```ml
tokens
```

Token sequence forming the macro replacement or parser result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L94)

<a id="field-field-mq3-vm-pc-parser-expression-valid-valid-src-mq3-vm-pc-parser-ml-1691695507"></a>
### valid

```ml
valid
```

Remains true while conditional-expression parsing and evaluation succeed; cleared on syntax or arithmetic errors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L99)
