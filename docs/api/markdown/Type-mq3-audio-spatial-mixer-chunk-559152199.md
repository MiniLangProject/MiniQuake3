# `mq3.audio.spatial_mixer.Chunk`

[Home](README.md) · [Source file](File-src-mq3-audio-spatial-mixer-ml-1696381376.md)

<a id="struct-struct-mq3-audio-spatial-mixer-chunk-struct-chunk-src-mq3-audio-spatial-mixer-ml-365351839"></a>
## Chunk

```ml
struct Chunk
```

Chunk record for audio.spatial_mixer, containing `samples`, `frames`, `audibleSources`, `peak`, `limiterGain`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/spatial_mixer.ml#L48)

## Members

<a id="field-field-mq3-audio-spatial-mixer-chunk-audiblesources-audiblesources-src-mq3-audio-spatial-mixer-ml-1578821824"></a>
### audibleSources

```ml
audibleSources
```

Number of enabled sources with a positive left or right gain; counted even when their current PCM samples are silent.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/spatial_mixer.ml#L54)

<a id="field-field-mq3-audio-spatial-mixer-chunk-frames-frames-src-mq3-audio-spatial-mixer-ml-228003232"></a>
### frames

```ml
frames
```

Number of stereo sample frames contained in this output chunk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/spatial_mixer.ml#L52)

<a id="field-field-mq3-audio-spatial-mixer-chunk-limitergain-limitergain-src-mq3-audio-spatial-mixer-ml-758248472"></a>
### limiterGain

```ml
limiterGain
```

Gain applied to keep the mixed output within the supported sample range.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/spatial_mixer.ml#L58)

<a id="field-field-mq3-audio-spatial-mixer-chunk-peak-peak-src-mq3-audio-spatial-mixer-ml-159231062"></a>
### peak

```ml
peak
```

Largest absolute mixed sample magnitude measured before output clipping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/spatial_mixer.ml#L56)

<a id="field-field-mq3-audio-spatial-mixer-chunk-samples-samples-src-mq3-audio-spatial-mixer-ml-62926108"></a>
### samples

```ml
samples
```

Interleaved little-endian signed 16-bit stereo PCM output bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/spatial_mixer.ml#L50)
