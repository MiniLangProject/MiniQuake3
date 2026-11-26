# `mq3.audio.spatial_mixer.State`

[Home](README.md) · [Source file](File-src-mq3-audio-spatial-mixer-ml-1696381376.md)

<a id="struct-struct-mq3-audio-spatial-mixer-state-struct-state-src-mq3-audio-spatial-mixer-ml-52237151"></a>
## State

```ml
struct State
```

State record for audio.spatial_mixer, containing `outputRate`, `chunkFrames`, `sources`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L39)

## Members

<a id="field-field-mq3-audio-spatial-mixer-state-chunkframes-chunkframes-src-mq3-audio-spatial-mixer-ml-512318484"></a>
### chunkFrames

```ml
chunkFrames
```

Number of stereo sample frames produced by one mixing pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L43)

<a id="field-field-mq3-audio-spatial-mixer-state-outputrate-outputrate-src-mq3-audio-spatial-mixer-ml-76856374"></a>
### outputRate

```ml
outputRate
```

Output sample rate in hertz.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L41)

<a id="field-field-mq3-audio-spatial-mixer-state-sources-sources-src-mq3-audio-spatial-mixer-ml-1838582072"></a>
### sources

```ml
sources
```

Registered loop sources and their independent enable states.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L45)
