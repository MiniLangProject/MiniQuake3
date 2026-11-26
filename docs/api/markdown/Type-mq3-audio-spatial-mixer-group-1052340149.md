# `mq3.audio.spatial_mixer.Group`

[Home](README.md) · [Source file](File-src-mq3-audio-spatial-mixer-ml-1696381376.md)

<a id="struct-struct-mq3-audio-spatial-mixer-group-struct-group-src-mq3-audio-spatial-mixer-ml-262689131"></a>
## Group

```ml
struct Group
```

Group record for audio.spatial_mixer, containing `key`, `sound`, `cursor`, `step`, `sourceFrames`, `left`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L72)

## Members

<a id="field-field-mq3-audio-spatial-mixer-group-cursor-cursor-src-mq3-audio-spatial-mixer-ml-1675824558"></a>
### cursor

```ml
cursor
```

Current playback position in source sample frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L78)

<a id="field-field-mq3-audio-spatial-mixer-group-key-key-src-mq3-audio-spatial-mixer-ml-591520562"></a>
### key

```ml
key
```

Shared-loop grouping key for these sources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L74)

<a id="field-field-mq3-audio-spatial-mixer-group-left-left-src-mq3-audio-spatial-mixer-ml-1863733444"></a>
### left

```ml
left
```

Sum of the left-channel gains for sources in this shared loop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L84)

<a id="field-field-mq3-audio-spatial-mixer-group-right-right-src-mq3-audio-spatial-mixer-ml-192071670"></a>
### right

```ml
right
```

Sum of the right-channel gains for sources in this shared loop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L86)

<a id="field-field-mq3-audio-spatial-mixer-group-sound-sound-src-mq3-audio-spatial-mixer-ml-1792056106"></a>
### sound

```ml
sound
```

Decoded WAVE sound descriptor supplying the source PCM data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L76)

<a id="field-field-mq3-audio-spatial-mixer-group-sourceframes-sourceframes-src-mq3-audio-spatial-mixer-ml-992335976"></a>
### sourceFrames

```ml
sourceFrames
```

Number of sample frames in the source sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L82)

<a id="field-field-mq3-audio-spatial-mixer-group-sourceindexes-sourceindexes-src-mq3-audio-spatial-mixer-ml-1962784478"></a>
### sourceIndexes

```ml
sourceIndexes
```

Indexes of registered sources represented by this shared playback group.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L88)

<a id="field-field-mq3-audio-spatial-mixer-group-step-step-src-mq3-audio-spatial-mixer-ml-774997326"></a>
### step

```ml
step
```

Fractional source-frame advance for each output frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L80)
