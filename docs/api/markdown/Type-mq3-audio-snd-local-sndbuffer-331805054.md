# `mq3.audio.snd_local.SndBuffer`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-local-ml-298173627.md)

<a id="struct-struct-mq3-audio-snd-local-sndbuffer-struct-sndbuffer-src-mq3-audio-snd-local-ml-1270979029"></a>
## SndBuffer

```ml
struct SndBuffer
```

SndBuffer record for audio.snd_local, containing `sndChunk`, `next`, `size`, `adpcm`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L42)

## Members

<a id="field-field-mq3-audio-snd-local-sndbuffer-adpcm-adpcm-src-mq3-audio-snd-local-ml-177929056"></a>
### adpcm

```ml
adpcm
```

ADPCM predictor and step-index state at the start of this chunk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L50)

<a id="field-field-mq3-audio-snd-local-sndbuffer-next-next-src-mq3-audio-snd-local-ml-383076610"></a>
### next

```ml
next
```

Next chunk in the sound-buffer chain.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L46)

<a id="field-field-mq3-audio-snd-local-sndbuffer-size-size-src-mq3-audio-snd-local-ml-1887442862"></a>
### size

```ml
size
```

Number of meaningful samples or encoded elements stored in the chunk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L48)

<a id="field-field-mq3-audio-snd-local-sndbuffer-sndchunk-sndchunk-src-mq3-audio-snd-local-ml-27060728"></a>
### sndChunk

```ml
sndChunk
```

Sample storage owned by this sound-memory chunk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L44)
