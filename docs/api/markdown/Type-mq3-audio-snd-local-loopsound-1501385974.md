# `mq3.audio.snd_local.LoopSound`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-local-ml-298173627.md)

<a id="struct-struct-mq3-audio-snd-local-loopsound-struct-loopsound-src-mq3-audio-snd-local-ml-195609973"></a>
## LoopSound

```ml
struct LoopSound
```

LoopSound record for audio.snd_local, containing `origin`, `velocity`, `sfx`, `mergeFrame`, `active`, `kill`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L89)

## Members

<a id="field-field-mq3-audio-snd-local-loopsound-active-active-src-mq3-audio-snd-local-ml-1871764380"></a>
### active

```ml
active
```

True while this sound, channel, or music stream participates in playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L99)

<a id="field-field-mq3-audio-snd-local-loopsound-doppler-doppler-src-mq3-audio-snd-local-ml-716560372"></a>
### doppler

```ml
doppler
```

True when Doppler resampling is enabled for this source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L103)

<a id="field-field-mq3-audio-snd-local-loopsound-dopplerscale-dopplerscale-src-mq3-audio-snd-local-ml-98588828"></a>
### dopplerScale

```ml
dopplerScale
```

Current Doppler scale applied to the source sample-advance rate.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L105)

<a id="field-field-mq3-audio-snd-local-loopsound-framenum-framenum-src-mq3-audio-snd-local-ml-1799985962"></a>
### framenum

```ml
framenum
```

Frame number associated with the loop and its Doppler state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L109)

<a id="field-field-mq3-audio-snd-local-loopsound-kill-kill-src-mq3-audio-snd-local-ml-1742932708"></a>
### kill

```ml
kill
```

True when the loop should be removed after its current submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L101)

<a id="field-field-mq3-audio-snd-local-loopsound-mergeframe-mergeframe-src-mq3-audio-snd-local-ml-465455682"></a>
### mergeFrame

```ml
mergeFrame
```

Frame marker used when combining loops that share the same sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L97)

<a id="field-field-mq3-audio-snd-local-loopsound-olddopplerscale-olddopplerscale-src-mq3-audio-snd-local-ml-629082192"></a>
### oldDopplerScale

```ml
oldDopplerScale
```

Previous Doppler scale retained when continuing a loop between frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L107)

<a id="field-field-mq3-audio-snd-local-loopsound-origin-origin-src-mq3-audio-snd-local-ml-1509867052"></a>
### origin

```ml
origin
```

World-space XYZ position of the sound source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L91)

<a id="field-field-mq3-audio-snd-local-loopsound-sfx-sfx-src-mq3-audio-snd-local-ml-505594900"></a>
### sfx

```ml
sfx
```

Sound-effect descriptor used by this loop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L95)

<a id="field-field-mq3-audio-snd-local-loopsound-velocity-velocity-src-mq3-audio-snd-local-ml-1095581894"></a>
### velocity

```ml
velocity
```

World-space velocity of the sound source used for Doppler adjustment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L93)
