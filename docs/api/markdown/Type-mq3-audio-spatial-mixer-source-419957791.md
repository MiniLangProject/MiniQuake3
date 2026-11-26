# `mq3.audio.spatial_mixer.Source`

[Home](README.md) · [Source file](File-src-mq3-audio-spatial-mixer-ml-1696381376.md)

<a id="struct-struct-mq3-audio-spatial-mixer-source-struct-source-src-mq3-audio-spatial-mixer-ml-393249699"></a>
## Source

```ml
struct Source
```

Source record for audio.spatial_mixer, containing `id`, `key`, `origin`, `sound`, `volume`, `globalSound`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L20)

## Members

<a id="field-field-mq3-audio-spatial-mixer-source-cursor-cursor-src-mq3-audio-spatial-mixer-ml-470970832"></a>
### cursor

```ml
cursor
```

Current playback position in source sample frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L34)

<a id="field-field-mq3-audio-spatial-mixer-source-enabled-enabled-src-mq3-audio-spatial-mixer-ml-2041248512"></a>
### enabled

```ml
enabled
```

Whether render considers this source; disabled sources retain their current playback cursor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L36)

<a id="field-field-mq3-audio-spatial-mixer-source-globalsound-globalsound-src-mq3-audio-spatial-mixer-ml-1392993152"></a>
### globalSound

```ml
globalSound
```

True when source gain is independent of listener position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L32)

<a id="field-field-mq3-audio-spatial-mixer-source-id-id-src-mq3-audio-spatial-mixer-ml-2078145654"></a>
### id

```ml
id
```

Caller-supplied identifier used to find or update this sound source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L22)

<a id="field-field-mq3-audio-spatial-mixer-source-key-key-src-mq3-audio-spatial-mixer-ml-167852140"></a>
### key

```ml
key
```

Candidate loop-sharing key; render also requires the same sound record and playback cursor before grouping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L24)

<a id="field-field-mq3-audio-spatial-mixer-source-origin-origin-src-mq3-audio-spatial-mixer-ml-1938474612"></a>
### origin

```ml
origin
```

World-space XYZ position of the sound source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L26)

<a id="field-field-mq3-audio-spatial-mixer-source-sound-sound-src-mq3-audio-spatial-mixer-ml-1285754644"></a>
### sound

```ml
sound
```

Decoded WAVE sound descriptor supplying the source PCM data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L28)

<a id="field-field-mq3-audio-spatial-mixer-source-volume-volume-src-mq3-audio-spatial-mixer-ml-1196033516"></a>
### volume

```ml
volume
```

Source gain before distance attenuation, in the range zero through one.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L30)
