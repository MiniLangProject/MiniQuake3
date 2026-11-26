# `mq3.shared.parser.Parser`

[Home](README.md) · [Source file](File-src-mq3-shared-parser-ml-1977832534.md)

<a id="struct-struct-mq3-shared-parser-parser-struct-parser-src-mq3-shared-parser-ml-2092721241"></a>
## Parser

```ml
struct Parser
```

Parser record for shared.parser, containing `data`, `offset`, `line`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/shared/parser.ml#L7)

## Members

<a id="field-field-mq3-shared-parser-parser-data-data-src-mq3-shared-parser-ml-1842748380"></a>
### data

```ml
data
```

Source bytes scanned by the shared token parser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/shared/parser.ml#L9)

<a id="field-field-mq3-shared-parser-parser-line-line-src-mq3-shared-parser-ml-409705140"></a>
### line

```ml
line
```

Current source line number used in diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/shared/parser.ml#L13)

<a id="field-field-mq3-shared-parser-parser-offset-offset-src-mq3-shared-parser-ml-2005940166"></a>
### offset

```ml
offset
```

Byte cursor of the next source character to scan.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/shared/parser.ml#L11)
