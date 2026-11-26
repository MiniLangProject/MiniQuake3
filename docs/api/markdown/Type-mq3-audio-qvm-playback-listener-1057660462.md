# `mq3.audio.qvm_playback.Listener`

[Home](README.md) · [Source file](File-src-mq3-audio-qvm-playback-ml-324023706.md)

<a id="struct-struct-mq3-audio-qvm-playback-listener-struct-listener-src-mq3-audio-qvm-playback-ml-54747033"></a>
## Listener

```ml
struct Listener
```

Listener record for audio.qvm_playback, containing `entity`, `origin`, `axis`, `inWater`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L28)

## Members

<a id="field-field-mq3-audio-qvm-playback-listener-axis-axis-src-mq3-audio-qvm-playback-ml-588564801"></a>
### axis

```ml
axis
```

Three listener orientation axes used to spatialize sounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L34)

<a id="field-field-mq3-audio-qvm-playback-listener-entity-entity-src-mq3-audio-qvm-playback-ml-1669137397"></a>
### entity

```ml
entity
```

Entity number whose local sounds are heard without attenuation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L30)

<a id="field-field-mq3-audio-qvm-playback-listener-inwater-inwater-src-mq3-audio-qvm-playback-ml-377522583"></a>
### inWater

```ml
inWater
```

True when the listener is inside water.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L36)

<a id="field-field-mq3-audio-qvm-playback-listener-origin-origin-src-mq3-audio-qvm-playback-ml-272919087"></a>
### origin

```ml
origin
```

World-space XYZ position of the listener.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L32)
