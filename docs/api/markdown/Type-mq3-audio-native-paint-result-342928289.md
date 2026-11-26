# `mq3.audio.native_paint.Result`

[Home](README.md) · [Source file](File-src-mq3-audio-native-paint-ml-953565760.md)

<a id="struct-struct-mq3-audio-native-paint-result-struct-result-src-mq3-audio-native-paint-ml-1794854369"></a>
## Result

```ml
struct Result
```

Result record for audio.native_paint, containing `samples`, `peak`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/native_paint.ml#L53)

## Members

<a id="field-field-mq3-audio-native-paint-result-peak-peak-src-mq3-audio-native-paint-ml-1342092784"></a>
### peak

```ml
peak
```

Largest absolute mixed sample magnitude measured before output clipping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/native_paint.ml#L57)

<a id="field-field-mq3-audio-native-paint-result-samples-samples-src-mq3-audio-native-paint-ml-1127339430"></a>
### samples

```ml
samples
```

Interleaved little-endian signed 16-bit stereo PCM output bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/native_paint.ml#L55)
