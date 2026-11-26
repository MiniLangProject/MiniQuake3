# `mq3.audio.snd_local.WavInfo`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-local-ml-298173627.md)

<a id="struct-struct-mq3-audio-snd-local-wavinfo-struct-wavinfo-src-mq3-audio-snd-local-ml-394194339"></a>
## WavInfo

```ml
struct WavInfo
```

WavInfo record for audio.snd_local, containing `format`, `rate`, `width`, `channels`, `samples`, `dataofs`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L141)

## Members

<a id="field-field-mq3-audio-snd-local-wavinfo-channels-channels-src-mq3-audio-snd-local-ml-1019293473"></a>
### channels

```ml
channels
```

Number of interleaved source channels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L149)

<a id="field-field-mq3-audio-snd-local-wavinfo-dataofs-dataofs-src-mq3-audio-snd-local-ml-1001624569"></a>
### dataofs

```ml
dataofs
```

Byte offset of the PCM payload from the start of the WAVE file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L153)

<a id="field-field-mq3-audio-snd-local-wavinfo-format-format-src-mq3-audio-snd-local-ml-740852663"></a>
### format

```ml
format
```

RIFF WAVE format tag; uncompressed integer PCM uses tag one.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L143)

<a id="field-field-mq3-audio-snd-local-wavinfo-rate-rate-src-mq3-audio-snd-local-ml-958657745"></a>
### rate

```ml
rate
```

Source sample rate in hertz.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L145)

<a id="field-field-mq3-audio-snd-local-wavinfo-samples-samples-src-mq3-audio-snd-local-ml-1006509325"></a>
### samples

```ml
samples
```

Number of mono samples described by the WAVE data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L151)

<a id="field-field-mq3-audio-snd-local-wavinfo-width-width-src-mq3-audio-snd-local-ml-1502480597"></a>
### width

```ml
width
```

Bytes used to store one sample in one source channel.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L147)
