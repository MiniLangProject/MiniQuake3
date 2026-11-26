# `mq3.audio.spatial_mixer.Spatial`

[Home](README.md) · [Source file](File-src-mq3-audio-spatial-mixer-ml-1696381376.md)

<a id="struct-struct-mq3-audio-spatial-mixer-spatial-struct-spatial-src-mq3-audio-spatial-mixer-ml-1024861925"></a>
## Spatial

```ml
struct Spatial
```

Spatial record for audio.spatial_mixer, containing `left`, `right`, `distance`, `attenuation`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L61)

## Members

<a id="field-field-mq3-audio-spatial-mixer-spatial-attenuation-attenuation-src-mq3-audio-spatial-mixer-ml-799887335"></a>
### attenuation

```ml
attenuation
```

Distance-dependent gain remaining after the full-volume region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L69)

<a id="field-field-mq3-audio-spatial-mixer-spatial-distance-distance-src-mq3-audio-spatial-mixer-ml-2141720645"></a>
### distance

```ml
distance
```

Distance in world units from the source to the listener.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L67)

<a id="field-field-mq3-audio-spatial-mixer-spatial-left-left-src-mq3-audio-spatial-mixer-ml-453157493"></a>
### left

```ml
left
```

Left-channel floating-point gain after spatialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L63)

<a id="field-field-mq3-audio-spatial-mixer-spatial-right-right-src-mq3-audio-spatial-mixer-ml-1501195651"></a>
### right

```ml
right
```

Right-channel floating-point gain after spatialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L65)
