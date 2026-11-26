# `mq3.audio.wav.Sound`

[Home](README.md) · [Source file](File-src-mq3-audio-wav-ml-983927564.md)

<a id="struct-struct-mq3-audio-wav-sound-struct-sound-src-mq3-audio-wav-ml-760323551"></a>
## Sound

```ml
struct Sound
```

Decoded integer PCM sound with interleaved sample data and its validated WAVE format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/wav.ml#L13)

## Members

<a id="field-field-mq3-audio-wav-sound-bitspersample-bitspersample-src-mq3-audio-wav-ml-1804853998"></a>
### bitsPerSample

```ml
bitsPerSample
```

Number of bits used for each sample in one channel.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/wav.ml#L19)

<a id="field-field-mq3-audio-wav-sound-blockalign-blockalign-src-mq3-audio-wav-ml-514442394"></a>
### blockAlign

```ml
blockAlign
```

Bytes occupied by one complete interleaved sample frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/wav.ml#L21)

<a id="field-field-mq3-audio-wav-sound-byterate-byterate-src-mq3-audio-wav-ml-1303925470"></a>
### byteRate

```ml
byteRate
```

PCM byte rate computed from sample rate and block alignment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/wav.ml#L23)

<a id="field-field-mq3-audio-wav-sound-channels-channels-src-mq3-audio-wav-ml-874299550"></a>
### channels

```ml
channels
```

Number of interleaved PCM channels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/wav.ml#L17)

<a id="field-field-mq3-audio-wav-sound-samplerate-samplerate-src-mq3-audio-wav-ml-1958476574"></a>
### sampleRate

```ml
sampleRate
```

Source sample rate in hertz.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/wav.ml#L15)

<a id="field-field-mq3-audio-wav-sound-samples-samples-src-mq3-audio-wav-ml-267445338"></a>
### samples

```ml
samples
```

Independent copy of the first WAVE data chunk; unsigned 8-bit or little-endian signed 16-bit PCM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/wav.ml#L25)
