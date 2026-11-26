# `mq3.format.deflate.Huffman`

[Home](README.md) · [Source file](File-src-mq3-format-deflate-ml-363514060.md)

<a id="struct-struct-mq3-format-deflate-huffman-struct-huffman-src-mq3-format-deflate-ml-427441523"></a>
## Huffman

```ml
struct Huffman
```

Huffman record for format.deflate, containing `counts`, `symbols`, `prefix`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/deflate.ml#L18)

## Members

<a id="field-field-mq3-format-deflate-huffman-counts-counts-src-mq3-format-deflate-ml-1495014900"></a>
### counts

```ml
counts
```

Number of Huffman symbols assigned to each bit length.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/deflate.ml#L20)

<a id="field-field-mq3-format-deflate-huffman-prefix-prefix-src-mq3-format-deflate-ml-1821626180"></a>
### prefix

```ml
prefix
```

Lookup table for resolving short Huffman prefixes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/deflate.ml#L24)

<a id="field-field-mq3-format-deflate-huffman-symbols-symbols-src-mq3-format-deflate-ml-860695880"></a>
### symbols

```ml
symbols
```

Symbols ordered by canonical Huffman code.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/deflate.ml#L22)
