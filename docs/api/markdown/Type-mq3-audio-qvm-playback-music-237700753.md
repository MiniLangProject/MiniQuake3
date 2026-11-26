# `mq3.audio.qvm_playback.Music`

[Home](README.md) · [Source file](File-src-mq3-audio-qvm-playback-ml-324023706.md)

<a id="struct-struct-mq3-audio-qvm-playback-music-struct-music-src-mq3-audio-qvm-playback-ml-1078700401"></a>
## Music

```ml
struct Music
```

Music record for audio.qvm_playback, containing `introSound`, `loopSound`, `cursor`, `inIntro`, `active`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L97)

## Members

<a id="field-field-mq3-audio-qvm-playback-music-active-active-src-mq3-audio-qvm-playback-ml-504917924"></a>
### active

```ml
active
```

True while this sound, channel, or music stream participates in playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L107)

<a id="field-field-mq3-audio-qvm-playback-music-cursor-cursor-src-mq3-audio-qvm-playback-ml-409599328"></a>
### cursor

```ml
cursor
```

Current playback position in source sample frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L103)

<a id="field-field-mq3-audio-qvm-playback-music-inintro-inintro-src-mq3-audio-qvm-playback-ml-1997450888"></a>
### inIntro

```ml
inIntro
```

True while the introductory clip is still playing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L105)

<a id="field-field-mq3-audio-qvm-playback-music-introsound-introsound-src-mq3-audio-qvm-playback-ml-1553746950"></a>
### introSound

```ml
introSound
```

Decoded introductory music clip played once before the loop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L99)

<a id="field-field-mq3-audio-qvm-playback-music-loopsound-loopsound-src-mq3-audio-qvm-playback-ml-771197480"></a>
### loopSound

```ml
loopSound
```

Decoded music clip repeated after the introduction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L101)
