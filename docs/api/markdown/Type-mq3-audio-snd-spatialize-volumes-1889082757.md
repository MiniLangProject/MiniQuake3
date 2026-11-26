# `mq3.audio.snd_spatialize.Volumes`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-spatialize-ml-2009248822.md)

<a id="struct-struct-mq3-audio-snd-spatialize-volumes-struct-volumes-src-mq3-audio-snd-spatialize-ml-844921485"></a>
## Volumes

```ml
struct Volumes
```

Volumes record for audio.snd_spatialize, containing `left`, `right`, `distance`, `attenuation`, `dot`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_spatialize.ml#L14)

## Members

<a id="field-field-mq3-audio-snd-spatialize-volumes-attenuation-attenuation-src-mq3-audio-snd-spatialize-ml-1496087528"></a>
### attenuation

```ml
attenuation
```

Distance-dependent gain remaining after the full-volume region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_spatialize.ml#L22)

<a id="field-field-mq3-audio-snd-spatialize-volumes-distance-distance-src-mq3-audio-snd-spatialize-ml-445296214"></a>
### distance

```ml
distance
```

Distance in world units from the source to the listener.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_spatialize.ml#L20)

<a id="field-field-mq3-audio-snd-spatialize-volumes-dot-dot-src-mq3-audio-snd-spatialize-ml-1808691668"></a>
### dot

```ml
dot
```

Clamped dot product between source direction and the listener's right axis.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_spatialize.ml#L24)

<a id="field-field-mq3-audio-snd-spatialize-volumes-left-left-src-mq3-audio-snd-spatialize-ml-528683822"></a>
### left

```ml
left
```

Left-channel integer volume after distance and direction attenuation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_spatialize.ml#L16)

<a id="field-field-mq3-audio-snd-spatialize-volumes-right-right-src-mq3-audio-snd-spatialize-ml-1283055236"></a>
### right

```ml
right
```

Right-channel integer volume after distance and direction attenuation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_spatialize.ml#L18)
