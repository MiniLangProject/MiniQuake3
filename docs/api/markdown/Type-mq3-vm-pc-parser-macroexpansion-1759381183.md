# `mq3.vm.pc_parser.MacroExpansion`

[Home](README.md) · [Source file](File-src-mq3-vm-pc-parser-ml-1324474776.md)

<a id="struct-struct-mq3-vm-pc-parser-macroexpansion-struct-macroexpansion-src-mq3-vm-pc-parser-ml-585808755"></a>
## MacroExpansion

```ml
struct MacroExpansion
```

MacroExpansion record for vm.pc_parser, containing `valid`, `invoked`, `tokens`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L113)

## Members

<a id="field-field-mq3-vm-pc-parser-macroexpansion-invoked-invoked-src-mq3-vm-pc-parser-ml-1913335976"></a>
### invoked

```ml
invoked
```

Nonzero when a function-like macro invocation has been recognized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L117)

<a id="field-field-mq3-vm-pc-parser-macroexpansion-tokens-tokens-src-mq3-vm-pc-parser-ml-682897804"></a>
### tokens

```ml
tokens
```

Token sequence forming the macro replacement or parser result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L119)

<a id="field-field-mq3-vm-pc-parser-macroexpansion-valid-valid-src-mq3-vm-pc-parser-ml-1158855120"></a>
### valid

```ml
valid
```

True for a valid macro-processing result, including a function-like macro that was not invoked.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/pc_parser.ml#L115)
