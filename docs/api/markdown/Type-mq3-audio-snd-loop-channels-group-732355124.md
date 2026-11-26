# `mq3.audio.snd_loop_channels.Group`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-loop-channels-ml-1602965463.md)

<a id="struct-struct-mq3-audio-snd-loop-channels-group-struct-group-src-mq3-audio-snd-loop-channels-ml-422736517"></a>
## Group

```ml
struct Group
```

Group record for audio.snd_loop_channels, containing `handle`, `primary`, `ids`, `left`, `right`, `doppler`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_loop_channels.ml#L30)

## Members

<a id="field-field-mq3-audio-snd-loop-channels-group-doppler-doppler-src-mq3-audio-snd-loop-channels-ml-1974025030"></a>
### doppler

```ml
doppler
```

True when Doppler resampling is enabled for this source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_loop_channels.ml#L42)

<a id="field-field-mq3-audio-snd-loop-channels-group-dopplerscale-dopplerscale-src-mq3-audio-snd-loop-channels-ml-13788398"></a>
### dopplerScale

```ml
dopplerScale
```

Current Doppler scale applied to the source sample-advance rate.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_loop_channels.ml#L44)

<a id="field-field-mq3-audio-snd-loop-channels-group-handle-handle-src-mq3-audio-snd-loop-channels-ml-426674798"></a>
### handle

```ml
handle
```

Sound handle shared by the loop sources in this group.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_loop_channels.ml#L32)

<a id="field-field-mq3-audio-snd-loop-channels-group-ids-ids-src-mq3-audio-snd-loop-channels-ml-767294526"></a>
### ids

```ml
ids
```

Identifiers of all sources contributing to this merged loop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_loop_channels.ml#L36)

<a id="field-field-mq3-audio-snd-loop-channels-group-left-left-src-mq3-audio-snd-loop-channels-ml-1836591964"></a>
### left

```ml
left
```

Combined left-channel gain for the merged looping sources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_loop_channels.ml#L38)

<a id="field-field-mq3-audio-snd-loop-channels-group-olddopplerscale-olddopplerscale-src-mq3-audio-snd-loop-channels-ml-1166802506"></a>
### oldDopplerScale

```ml
oldDopplerScale
```

Previous Doppler scale retained when continuing a loop between frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_loop_channels.ml#L46)

<a id="field-field-mq3-audio-snd-loop-channels-group-primary-primary-src-mq3-audio-snd-loop-channels-ml-1047188206"></a>
### primary

```ml
primary
```

Index of the source whose playback cursor leads the merged group.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_loop_channels.ml#L34)

<a id="field-field-mq3-audio-snd-loop-channels-group-right-right-src-mq3-audio-snd-loop-channels-ml-1653207758"></a>
### right

```ml
right
```

Combined right-channel gain for the merged looping sources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_loop_channels.ml#L40)
