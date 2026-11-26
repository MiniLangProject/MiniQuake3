# `mq3.audio.snd_channels.Channel`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-channels-ml-1574683136.md)

<a id="struct-struct-mq3-audio-snd-channels-channel-struct-channel-src-mq3-audio-snd-channels-ml-1861854281"></a>
## Channel

```ml
struct Channel
```

Channel record for audio.snd_channels, containing `active`, `entity`, `handle`, `entchannel`, `allocTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L13)

## Members

<a id="field-field-mq3-audio-snd-channels-channel-active-active-src-mq3-audio-snd-channels-ml-1683345516"></a>
### active

```ml
active
```

True while this sound, channel, or music stream participates in playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L15)

<a id="field-field-mq3-audio-snd-channels-channel-alloctime-alloctime-src-mq3-audio-snd-channels-ml-395457368"></a>
### allocTime

```ml
allocTime
```

Timestamp at which the playback channel was allocated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L23)

<a id="field-field-mq3-audio-snd-channels-channel-entchannel-entchannel-src-mq3-audio-snd-channels-ml-1512357904"></a>
### entchannel

```ml
entchannel
```

Entity-channel identifier used when replacing an existing sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L21)

<a id="field-field-mq3-audio-snd-channels-channel-entity-entity-src-mq3-audio-snd-channels-ml-731033610"></a>
### entity

```ml
entity
```

Game-entity number to which the sound source or channel belongs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L17)

<a id="field-field-mq3-audio-snd-channels-channel-handle-handle-src-mq3-audio-snd-channels-ml-624372880"></a>
### handle

```ml
handle
```

Registered sound handle used to resolve the sound asset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L19)
