# `mq3.audio.snd_channels.Start`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-channels-ml-1574683136.md)

<a id="struct-struct-mq3-audio-snd-channels-start-struct-start-src-mq3-audio-snd-channels-ml-1908866075"></a>
## Start

```ml
struct Start
```

Start record for audio.snd_channels, containing `accepted`, `slot`, `replaced`, `reason`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L37)

## Members

<a id="field-field-mq3-audio-snd-channels-start-accepted-accepted-src-mq3-audio-snd-channels-ml-1236463189"></a>
### accepted

```ml
accepted
```

True when a channel was assigned to the requested sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L39)

<a id="field-field-mq3-audio-snd-channels-start-reason-reason-src-mq3-audio-snd-channels-ml-371430379"></a>
### reason

```ml
reason
```

Explanation of the allocation or rejection decision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L45)

<a id="field-field-mq3-audio-snd-channels-start-replaced-replaced-src-mq3-audio-snd-channels-ml-1957065003"></a>
### replaced

```ml
replaced
```

True when accepting the sound displaced an existing channel.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L43)

<a id="field-field-mq3-audio-snd-channels-start-slot-slot-src-mq3-audio-snd-channels-ml-253696331"></a>
### slot

```ml
slot
```

Index of the channel slot allocated for this playback voice.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L41)
