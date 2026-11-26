# `mq3.vm.pc_parser.ArgumentResult`

[Home](README.md) · [Source file](File-src-mq3-vm-pc-parser-ml-1324474776.md)

<a id="struct-struct-mq3-vm-pc-parser-argumentresult-struct-argumentresult-src-mq3-vm-pc-parser-ml-310355739"></a>
## ArgumentResult

```ml
struct ArgumentResult
```

ArgumentResult record for vm.pc_parser, containing `valid`, `next`, `arguments`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L104)

## Members

<a id="field-field-mq3-vm-pc-parser-argumentresult-arguments-arguments-src-mq3-vm-pc-parser-ml-2057244319"></a>
### arguments

```ml
arguments
```

Token sequences supplied as actual macro arguments.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L110)

<a id="field-field-mq3-vm-pc-parser-argumentresult-next-next-src-mq3-vm-pc-parser-ml-1203160621"></a>
### next

```ml
next
```

Token position immediately after the parsed macro argument list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L108)

<a id="field-field-mq3-vm-pc-parser-argumentresult-valid-valid-src-mq3-vm-pc-parser-ml-1371028151"></a>
### valid

```ml
valid
```

True when a complete parenthesized macro-argument list was parsed successfully.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L106)
