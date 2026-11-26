# `mq3.audio.snd_mem_runtime.WavInfo`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-mem-runtime-ml-1049815056.md)

<a id="struct-struct-mq3-audio-snd-mem-runtime-wavinfo-struct-wavinfo-src-mq3-audio-snd-mem-runtime-ml-985040021"></a>
## WavInfo

```ml
struct WavInfo
```

WavInfo record for audio.snd_mem_runtime, containing `format`, `channels`, `rate`, `width`, `samples`, `dataofs`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_runtime.ml#L39)

## Members

<a id="field-field-mq3-audio-snd-mem-runtime-wavinfo-channels-channels-src-mq3-audio-snd-mem-runtime-ml-1526074557"></a>
### channels

```ml
channels
```

Number of interleaved source channels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_runtime.ml#L43)

<a id="field-field-mq3-audio-snd-mem-runtime-wavinfo-dataofs-dataofs-src-mq3-audio-snd-mem-runtime-ml-1475293937"></a>
### dataofs

```ml
dataofs
```

Byte offset of the PCM payload from the start of the WAVE file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_runtime.ml#L51)

<a id="field-field-mq3-audio-snd-mem-runtime-wavinfo-format-format-src-mq3-audio-snd-mem-runtime-ml-287080159"></a>
### format

```ml
format
```

RIFF WAVE format tag; uncompressed integer PCM uses tag one.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_runtime.ml#L41)

<a id="field-field-mq3-audio-snd-mem-runtime-wavinfo-rate-rate-src-mq3-audio-snd-mem-runtime-ml-297710345"></a>
### rate

```ml
rate
```

Source sample rate in hertz.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_runtime.ml#L45)

<a id="field-field-mq3-audio-snd-mem-runtime-wavinfo-samples-samples-src-mq3-audio-snd-mem-runtime-ml-1603249149"></a>
### samples

```ml
samples
```

Number of mono samples described by the WAVE data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_runtime.ml#L49)

<a id="field-field-mq3-audio-snd-mem-runtime-wavinfo-width-width-src-mq3-audio-snd-mem-runtime-ml-1354603333"></a>
### width

```ml
width
```

Bytes used to store one sample in one source channel.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_runtime.ml#L47)
