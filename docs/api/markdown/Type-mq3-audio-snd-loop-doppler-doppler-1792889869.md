# `mq3.audio.snd_loop_doppler.Doppler`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-loop-doppler-ml-749512355.md)

<a id="struct-struct-mq3-audio-snd-loop-doppler-doppler-struct-doppler-src-mq3-audio-snd-loop-doppler-ml-11205543"></a>
## Doppler

```ml
struct Doppler
```

Doppler record for audio.snd_loop_doppler, containing `active`, `scale`, `oldScale`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_loop_doppler.ml#L9)

## Members

<a id="field-field-mq3-audio-snd-loop-doppler-doppler-active-active-src-mq3-audio-snd-loop-doppler-ml-865825889"></a>
### active

```ml
active
```

True when this movement requires Doppler-adjusted playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_loop_doppler.ml#L11)

<a id="field-field-mq3-audio-snd-loop-doppler-doppler-oldscale-oldscale-src-mq3-audio-snd-loop-doppler-ml-1695325559"></a>
### oldScale

```ml
oldScale
```

Previous frame's Doppler ratio retained for continuous loop playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_loop_doppler.ml#L15)

<a id="field-field-mq3-audio-snd-loop-doppler-doppler-scale-scale-src-mq3-audio-snd-loop-doppler-ml-1384288725"></a>
### scale

```ml
scale
```

Current ratio used to advance through the source samples.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_loop_doppler.ml#L13)
