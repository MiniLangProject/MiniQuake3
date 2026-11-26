# `mq3.audio.snd_local.Channel`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-local-ml-298173627.md)

<a id="struct-struct-mq3-audio-snd-local-channel-struct-channel-src-mq3-audio-snd-local-ml-2091338393"></a>
## Channel

```ml
struct Channel
```

Channel record for audio.snd_local, containing `allocTime`, `startSample`, `entnum`, `entchannel`, `leftvol`, `rightvol`, and 7 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L112)

## Members

<a id="field-field-mq3-audio-snd-local-channel-alloctime-alloctime-src-mq3-audio-snd-local-ml-1741610190"></a>
### allocTime

```ml
allocTime
```

Timestamp at which the playback channel was allocated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L114)

<a id="field-field-mq3-audio-snd-local-channel-doppler-doppler-src-mq3-audio-snd-local-ml-2077960238"></a>
### doppler

```ml
doppler
```

True when Doppler resampling is enabled for this source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L138)

<a id="field-field-mq3-audio-snd-local-channel-dopplerscale-dopplerscale-src-mq3-audio-snd-local-ml-1920443238"></a>
### dopplerScale

```ml
dopplerScale
```

Current Doppler scale applied to the source sample-advance rate.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L128)

<a id="field-field-mq3-audio-snd-local-channel-entchannel-entchannel-src-mq3-audio-snd-local-ml-1713241354"></a>
### entchannel

```ml
entchannel
```

Entity-channel identifier used when replacing an existing sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L120)

<a id="field-field-mq3-audio-snd-local-channel-entnum-entnum-src-mq3-audio-snd-local-ml-179694604"></a>
### entnum

```ml
entnum
```

Game-entity number used to spatialize or replace the channel.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L118)

<a id="field-field-mq3-audio-snd-local-channel-fixed-origin-fixed-origin-src-mq3-audio-snd-local-ml-473130156"></a>
### fixed_origin

```ml
fixed_origin
```

True when playback uses the stored origin instead of the current entity origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L134)

<a id="field-field-mq3-audio-snd-local-channel-leftvol-leftvol-src-mq3-audio-snd-local-ml-641734966"></a>
### leftvol

```ml
leftvol
```

Left-channel volume after spatialization, in the range zero through 255.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L122)

<a id="field-field-mq3-audio-snd-local-channel-master-vol-master-vol-src-mq3-audio-snd-local-ml-618546526"></a>
### master_vol

```ml
master_vol
```

Channel volume before spatialization, in the range zero through 255.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L126)

<a id="field-field-mq3-audio-snd-local-channel-olddopplerscale-olddopplerscale-src-mq3-audio-snd-local-ml-1211378826"></a>
### oldDopplerScale

```ml
oldDopplerScale
```

Previous Doppler scale retained when continuing a loop between frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L130)

<a id="field-field-mq3-audio-snd-local-channel-origin-origin-src-mq3-audio-snd-local-ml-902229014"></a>
### origin

```ml
origin
```

World-space XYZ position of the sound source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L132)

<a id="field-field-mq3-audio-snd-local-channel-rightvol-rightvol-src-mq3-audio-snd-local-ml-1734921064"></a>
### rightvol

```ml
rightvol
```

Right-channel volume after spatialization, in the range zero through 255.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L124)

<a id="field-field-mq3-audio-snd-local-channel-startsample-startsample-src-mq3-audio-snd-local-ml-638301446"></a>
### startSample

```ml
startSample
```

Absolute starting sample, or the immediate-start sentinel before the next mix.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L116)

<a id="field-field-mq3-audio-snd-local-channel-thesfx-thesfx-src-mq3-audio-snd-local-ml-1227977998"></a>
### thesfx

```ml
thesfx
```

Sound-effect descriptor supplying this channel's samples.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L136)
