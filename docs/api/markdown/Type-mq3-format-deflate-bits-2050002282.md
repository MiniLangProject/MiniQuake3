# `mq3.format.deflate.Bits`

[Home](README.md) · [Source file](File-src-mq3-format-deflate-ml-363514060.md)

<a id="struct-struct-mq3-format-deflate-bits-struct-bits-src-mq3-format-deflate-ml-168030247"></a>
## Bits

```ml
struct Bits
```

Bits record for format.deflate, containing `data`, `offset`, `value`, `available`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L6)

## Members

<a id="field-field-mq3-format-deflate-bits-available-available-src-mq3-format-deflate-ml-191903765"></a>
### available

```ml
available
```

Number of unread bits currently present in the bit buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L14)

<a id="field-field-mq3-format-deflate-bits-data-data-src-mq3-format-deflate-ml-646808097"></a>
### data

```ml
data
```

Compressed input bytes consumed by the bit reader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L8)

<a id="field-field-mq3-format-deflate-bits-offset-offset-src-mq3-format-deflate-ml-788487407"></a>
### offset

```ml
offset
```

Index of the next compressed byte to load.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L10)

<a id="field-field-mq3-format-deflate-bits-value-value-src-mq3-format-deflate-ml-1804780001"></a>
### value

```ml
value
```

Buffered low-order compressed bits awaiting consumption.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L12)
