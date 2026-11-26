# `mq3.audio.snd_wavelet_runtime.Stream`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-wavelet-runtime-ml-154787381.md)

<a id="struct-struct-mq3-audio-snd-wavelet-runtime-stream-struct-stream-src-mq3-audio-snd-wavelet-runtime-ml-813627573"></a>
## Stream

```ml
struct Stream
```

Stream record for audio.snd_wavelet_runtime, containing `data`, `count`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_wavelet_runtime.ml#L12)

## Members

<a id="field-field-mq3-audio-snd-wavelet-runtime-stream-count-count-src-mq3-audio-snd-wavelet-runtime-ml-1501629877"></a>
### count

```ml
count
```

Number of logical source samples represented by the encoded stream.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_wavelet_runtime.ml#L16)

<a id="field-field-mq3-audio-snd-wavelet-runtime-stream-data-data-src-mq3-audio-snd-wavelet-runtime-ml-2115321873"></a>
### data

```ml
data
```

Encoded byte stream supplied to the wavelet or mu-law decoder.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_wavelet_runtime.ml#L14)
