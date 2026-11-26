# `mq3.audio.snd_channels.State`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-channels-ml-1574683136.md)

<a id="struct-struct-mq3-audio-snd-channels-state-struct-state-src-mq3-audio-snd-channels-ml-464177893"></a>
## State

```ml
struct State
```

State record for audio.snd_channels, containing `channels`, `freeSlots`, `listener`, `time`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_channels.ml#L26)

## Members

<a id="field-field-mq3-audio-snd-channels-state-channels-channels-src-mq3-audio-snd-channels-ml-506363006"></a>
### channels

```ml
channels
```

Fixed-size channel records used for allocation and replacement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_channels.ml#L28)

<a id="field-field-mq3-audio-snd-channels-state-freeslots-freeslots-src-mq3-audio-snd-channels-ml-1669444110"></a>
### freeSlots

```ml
freeSlots
```

Indexes of channel slots available for new playback requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_channels.ml#L30)

<a id="field-field-mq3-audio-snd-channels-state-listener-listener-src-mq3-audio-snd-channels-ml-1756664302"></a>
### listener

```ml
listener
```

Entity number treated as the local listener by allocation priority rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_channels.ml#L32)

<a id="field-field-mq3-audio-snd-channels-state-time-time-src-mq3-audio-snd-channels-ml-570293128"></a>
### time

```ml
time
```

Current allocation timestamp used to select the oldest replaceable channel.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_channels.ml#L34)
