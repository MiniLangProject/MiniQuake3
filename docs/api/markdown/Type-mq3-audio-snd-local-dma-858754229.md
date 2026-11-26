# `mq3.audio.snd_local.Dma`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-local-ml-298173627.md)

<a id="struct-struct-mq3-audio-snd-local-dma-struct-dma-src-mq3-audio-snd-local-ml-326105487"></a>
## Dma

```ml
struct Dma
```

Dma record for audio.snd_local, containing `channels`, `samples`, `submission_chunk`, `samplebits`, `speed`, `buffer`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L74)

## Members

<a id="field-field-mq3-audio-snd-local-dma-buffer-buffer-src-mq3-audio-snd-local-ml-1004757985"></a>
### buffer

```ml
buffer
```

Raw PCM memory presented to the audio device.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L86)

<a id="field-field-mq3-audio-snd-local-dma-channels-channels-src-mq3-audio-snd-local-ml-1852150165"></a>
### channels

```ml
channels
```

Number of interleaved output channels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L76)

<a id="field-field-mq3-audio-snd-local-dma-samplebits-samplebits-src-mq3-audio-snd-local-ml-378693013"></a>
### samplebits

```ml
samplebits
```

Number of bits stored for each PCM sample.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L82)

<a id="field-field-mq3-audio-snd-local-dma-samples-samples-src-mq3-audio-snd-local-ml-1348802065"></a>
### samples

```ml
samples
```

Total number of mono sample positions in the DMA ring buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L78)

<a id="field-field-mq3-audio-snd-local-dma-speed-speed-src-mq3-audio-snd-local-ml-783571609"></a>
### speed

```ml
speed
```

DMA output sample rate in hertz.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L84)

<a id="field-field-mq3-audio-snd-local-dma-submission-chunk-submission-chunk-src-mq3-audio-snd-local-ml-1505684897"></a>
### submission_chunk

```ml
submission_chunk
```

Minimum number of samples submitted to the audio device at once.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L80)
