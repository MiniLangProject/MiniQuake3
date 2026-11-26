# `mq3.audio.snd_compressed_paint.Block`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-compressed-paint-ml-1998500130.md)

<a id="struct-struct-mq3-audio-snd-compressed-paint-block-struct-block-src-mq3-audio-snd-compressed-paint-ml-1868516193"></a>
## Block

```ml
struct Block
```

Block record for audio.snd_compressed_paint, containing `data`, `size`, `sample`, `index`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L20)

## Members

<a id="field-field-mq3-audio-snd-compressed-paint-block-data-data-src-mq3-audio-snd-compressed-paint-ml-2030296354"></a>
### data

```ml
data
```

Encoded bytes for this compressed sound block.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L22)

<a id="field-field-mq3-audio-snd-compressed-paint-block-index-index-src-mq3-audio-snd-compressed-paint-ml-566716486"></a>
### index

```ml
index
```

Index into the ADPCM step-size table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L28)

<a id="field-field-mq3-audio-snd-compressed-paint-block-sample-sample-src-mq3-audio-snd-compressed-paint-ml-1152489850"></a>
### sample

```ml
sample
```

Previous reconstructed sample used as the ADPCM predictor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L26)

<a id="field-field-mq3-audio-snd-compressed-paint-block-size-size-src-mq3-audio-snd-compressed-paint-ml-1982796496"></a>
### size

```ml
size
```

Number of logical mono samples represented by the block.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L24)
