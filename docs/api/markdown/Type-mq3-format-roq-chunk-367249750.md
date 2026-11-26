# `mq3.format.roq.Chunk`

[Home](README.md) · [Source file](File-src-mq3-format-roq-ml-406347091.md)

<a id="struct-struct-mq3-format-roq-chunk-struct-chunk-src-mq3-format-roq-ml-1966016375"></a>
## Chunk

```ml
struct Chunk
```

Chunk record for format.roq, containing `id`, `size`, `flags`, `dataOffset`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L30)

## Members

<a id="field-field-mq3-format-roq-chunk-dataoffset-dataoffset-src-mq3-format-roq-ml-1735926244"></a>
### dataOffset

```ml
dataOffset
```

Byte offset of this chunk's payload within the movie file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L38)

<a id="field-field-mq3-format-roq-chunk-flags-flags-src-mq3-format-roq-ml-833315958"></a>
### flags

```ml
flags
```

Chunk-specific flags or predictor data from the RoQ header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L36)

<a id="field-field-mq3-format-roq-chunk-id-id-src-mq3-format-roq-ml-1633816884"></a>
### id

```ml
id
```

RoQ chunk-kind identifier selecting the corresponding decoder.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L32)

<a id="field-field-mq3-format-roq-chunk-size-size-src-mq3-format-roq-ml-1849303348"></a>
### size

```ml
size
```

Byte length of the chunk payload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L34)
