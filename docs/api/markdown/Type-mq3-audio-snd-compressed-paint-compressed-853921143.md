# `mq3.audio.snd_compressed_paint.Compressed`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-compressed-paint-ml-1998500130.md)

<a id="struct-struct-mq3-audio-snd-compressed-paint-compressed-struct-compressed-src-mq3-audio-snd-compressed-paint-ml-1737648153"></a>
## Compressed

```ml
struct Compressed
```

Compressed record for audio.snd_compressed_paint, containing `compression`, `blocks`, `length`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L31)

## Members

<a id="field-field-mq3-audio-snd-compressed-paint-compressed-blocks-blocks-src-mq3-audio-snd-compressed-paint-ml-342902774"></a>
### blocks

```ml
blocks
```

Compressed blocks in playback order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L35)

<a id="field-field-mq3-audio-snd-compressed-paint-compressed-compression-compression-src-mq3-audio-snd-compressed-paint-ml-915268910"></a>
### compression

```ml
compression
```

Compression-method identifier selecting the block decoder.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L33)

<a id="field-field-mq3-audio-snd-compressed-paint-compressed-length-length-src-mq3-audio-snd-compressed-paint-ml-1784097934"></a>
### length

```ml
length
```

Total logical number of mono samples across all compressed blocks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L37)
