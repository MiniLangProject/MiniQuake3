# `mq3.audio.qvm_playback.LoopSource`

[Home](README.md) · [Source file](File-src-mq3-audio-qvm-playback-ml-324023706.md)

<a id="struct-struct-mq3-audio-qvm-playback-loopsource-struct-loopsource-src-mq3-audio-qvm-playback-ml-1649111333"></a>
## LoopSource

```ml
struct LoopSource
```

LoopSource record for audio.qvm_playback, containing `entity`, `handle`, `origin`, `velocity`, `realLoop`, `sound`, and 7 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L68)

## Members

<a id="field-field-mq3-audio-qvm-playback-loopsource-active-active-src-mq3-audio-qvm-playback-ml-747965988"></a>
### active

```ml
active
```

True while this sound, channel, or music stream participates in playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L88)

<a id="field-field-mq3-audio-qvm-playback-loopsource-compressed-compressed-src-mq3-audio-qvm-playback-ml-511716186"></a>
### compressed

```ml
compressed
```

Compressed sound descriptor when playback uses encoded sample blocks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L82)

<a id="field-field-mq3-audio-qvm-playback-loopsource-cursor-cursor-src-mq3-audio-qvm-playback-ml-652647392"></a>
### cursor

```ml
cursor
```

Current playback position in source sample frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L86)

<a id="field-field-mq3-audio-qvm-playback-loopsource-doppler-doppler-src-mq3-audio-qvm-playback-ml-1856231880"></a>
### doppler

```ml
doppler
```

True when Doppler resampling is enabled for this source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L90)

<a id="field-field-mq3-audio-qvm-playback-loopsource-dopplerscale-dopplerscale-src-mq3-audio-qvm-playback-ml-1268499580"></a>
### dopplerScale

```ml
dopplerScale
```

Current Doppler scale applied to the source sample-advance rate.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L92)

<a id="field-field-mq3-audio-qvm-playback-loopsource-entity-entity-src-mq3-audio-qvm-playback-ml-588495170"></a>
### entity

```ml
entity
```

Game-entity number to which the sound source or channel belongs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L70)

<a id="field-field-mq3-audio-qvm-playback-loopsource-handle-handle-src-mq3-audio-qvm-playback-ml-726891728"></a>
### handle

```ml
handle
```

Registered sound handle used to resolve the sound asset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L72)

<a id="field-field-mq3-audio-qvm-playback-loopsource-mono-mono-src-mq3-audio-qvm-playback-ml-1274105502"></a>
### mono

```ml
mono
```

Decoded signed mono samples cached for channel painting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L84)

<a id="field-field-mq3-audio-qvm-playback-loopsource-olddopplerscale-olddopplerscale-src-mq3-audio-qvm-playback-ml-1753753684"></a>
### oldDopplerScale

```ml
oldDopplerScale
```

Previous Doppler scale retained when continuing a loop between frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L94)

<a id="field-field-mq3-audio-qvm-playback-loopsource-origin-origin-src-mq3-audio-qvm-playback-ml-573141716"></a>
### origin

```ml
origin
```

World-space XYZ position of the sound source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L74)

<a id="field-field-mq3-audio-qvm-playback-loopsource-realloop-realloop-src-mq3-audio-qvm-playback-ml-1875018704"></a>
### realLoop

```ml
realLoop
```

True for a persistent real looping sound rather than a frame-submitted loop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L78)

<a id="field-field-mq3-audio-qvm-playback-loopsource-sound-sound-src-mq3-audio-qvm-playback-ml-1178122284"></a>
### sound

```ml
sound
```

Decoded WAVE sound descriptor supplying the source PCM data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L80)

<a id="field-field-mq3-audio-qvm-playback-loopsource-velocity-velocity-src-mq3-audio-qvm-playback-ml-2066868946"></a>
### velocity

```ml
velocity
```

World-space velocity of the sound source used for Doppler adjustment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L76)
