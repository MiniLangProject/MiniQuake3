# `mq3.audio.snd_loop_channels.Entry`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-loop-channels-ml-1602965463.md)

<a id="struct-struct-mq3-audio-snd-loop-channels-entry-struct-entry-src-mq3-audio-snd-loop-channels-ml-423507859"></a>
## Entry

```ml
struct Entry
```

Entry record for audio.snd_loop_channels, containing `id`, `handle`, `origin`, `realLoop`, `doppler`, `dopplerScale`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_loop_channels.ml#L11)

## Members

<a id="field-field-mq3-audio-snd-loop-channels-entry-active-active-src-mq3-audio-snd-loop-channels-ml-759439671"></a>
### active

```ml
active
```

True while this sound, channel, or music stream participates in playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_loop_channels.ml#L27)

<a id="field-field-mq3-audio-snd-loop-channels-entry-doppler-doppler-src-mq3-audio-snd-loop-channels-ml-542983483"></a>
### doppler

```ml
doppler
```

True when Doppler resampling is enabled for this source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_loop_channels.ml#L21)

<a id="field-field-mq3-audio-snd-loop-channels-entry-dopplerscale-dopplerscale-src-mq3-audio-snd-loop-channels-ml-759977639"></a>
### dopplerScale

```ml
dopplerScale
```

Current Doppler scale applied to the source sample-advance rate.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_loop_channels.ml#L23)

<a id="field-field-mq3-audio-snd-loop-channels-entry-handle-handle-src-mq3-audio-snd-loop-channels-ml-1524776371"></a>
### handle

```ml
handle
```

Registered sound handle used to resolve the sound asset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_loop_channels.ml#L15)

<a id="field-field-mq3-audio-snd-loop-channels-entry-id-id-src-mq3-audio-snd-loop-channels-ml-1022978149"></a>
### id

```ml
id
```

Caller-supplied identifier used to find or update this sound source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_loop_channels.ml#L13)

<a id="field-field-mq3-audio-snd-loop-channels-entry-olddopplerscale-olddopplerscale-src-mq3-audio-snd-loop-channels-ml-1205736903"></a>
### oldDopplerScale

```ml
oldDopplerScale
```

Previous Doppler scale retained when continuing a loop between frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_loop_channels.ml#L25)

<a id="field-field-mq3-audio-snd-loop-channels-entry-origin-origin-src-mq3-audio-snd-loop-channels-ml-1169524871"></a>
### origin

```ml
origin
```

World-space XYZ position of the sound source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_loop_channels.ml#L17)

<a id="field-field-mq3-audio-snd-loop-channels-entry-realloop-realloop-src-mq3-audio-snd-loop-channels-ml-571264531"></a>
### realLoop

```ml
realLoop
```

True for a persistent real looping sound rather than a frame-submitted loop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_loop_channels.ml#L19)
