# `mq3.vm.pc_parser.Token`

[Home](README.md) · [Source file](File-src-mq3-vm-pc-parser-ml-1324474776.md)

<a id="struct-struct-mq3-vm-pc-parser-token-struct-token-src-mq3-vm-pc-parser-ml-982034111"></a>
## Token

```ml
struct Token
```

Token record for vm.pc_parser, containing `type`, `subtype`, `intValue`, `floatValue`, `text`, `line`, and 1 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L38)

## Members

<a id="field-field-mq3-vm-pc-parser-token-floatvalue-floatvalue-src-mq3-vm-pc-parser-ml-657673798"></a>
### floatValue

```ml
floatValue
```

Floating-point interpretation of the parsed numeric token.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L46)

<a id="field-field-mq3-vm-pc-parser-token-intvalue-intvalue-src-mq3-vm-pc-parser-ml-1656678352"></a>
### intValue

```ml
intValue
```

Integer interpretation of the parsed numeric token.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L44)

<a id="field-field-mq3-vm-pc-parser-token-leadingspace-leadingspace-src-mq3-vm-pc-parser-ml-815774980"></a>
### leadingSpace

```ml
leadingSpace
```

Nonzero when whitespace preceded the token in its source text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L52)

<a id="field-field-mq3-vm-pc-parser-token-line-line-src-mq3-vm-pc-parser-ml-985717660"></a>
### line

```ml
line
```

Source line at which the token begins.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L50)

<a id="field-field-mq3-vm-pc-parser-token-subtype-subtype-src-mq3-vm-pc-parser-ml-1948655220"></a>
### subtype

```ml
subtype
```

Token subtype bits describing number representation or punctuation details.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L42)

<a id="field-field-mq3-vm-pc-parser-token-text-text-src-mq3-vm-pc-parser-ml-822774942"></a>
### text

```ml
text
```

Token spelling after lexical processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L48)

<a id="field-field-mq3-vm-pc-parser-token-type-type-src-mq3-vm-pc-parser-ml-1492078116"></a>
### type

```ml
type
```

Primary parser token kind selected from TT_*.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/pc_parser.ml#L40)
