# `mq3.audio.qvm_playback.Voice`

[Home](README.md) · [Source file](File-src-mq3-audio-qvm-playback-ml-324023706.md)

<a id="struct-struct-mq3-audio-qvm-playback-voice-struct-voice-src-mq3-audio-qvm-playback-ml-1286570495"></a>
## Voice

```ml
struct Voice
```

Voice record for audio.qvm_playback, containing `id`, `slot`, `entity`, `channel`, `handle`, `origin`, and 7 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L39)

## Members

<a id="field-field-mq3-audio-qvm-playback-voice-active-active-src-mq3-audio-qvm-playback-ml-204189837"></a>
### active

```ml
active
```

True while this sound, channel, or music stream participates in playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L65)

<a id="field-field-mq3-audio-qvm-playback-voice-channel-channel-src-mq3-audio-qvm-playback-ml-1155556189"></a>
### channel

```ml
channel
```

Entity-channel identifier used when replacing an existing sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L47)

<a id="field-field-mq3-audio-qvm-playback-voice-compressed-compressed-src-mq3-audio-qvm-playback-ml-820691771"></a>
### compressed

```ml
compressed
```

Compressed sound descriptor when playback uses encoded sample blocks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L59)

<a id="field-field-mq3-audio-qvm-playback-voice-cursor-cursor-src-mq3-audio-qvm-playback-ml-1852614061"></a>
### cursor

```ml
cursor
```

Current playback position in source sample frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L63)

<a id="field-field-mq3-audio-qvm-playback-voice-entity-entity-src-mq3-audio-qvm-playback-ml-1309986387"></a>
### entity

```ml
entity
```

Game-entity number to which the sound source or channel belongs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L45)

<a id="field-field-mq3-audio-qvm-playback-voice-fixedorigin-fixedorigin-src-mq3-audio-qvm-playback-ml-984583625"></a>
### fixedOrigin

```ml
fixedOrigin
```

True when playback uses the stored origin instead of the current entity origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L53)

<a id="field-field-mq3-audio-qvm-playback-voice-handle-handle-src-mq3-audio-qvm-playback-ml-913202093"></a>
### handle

```ml
handle
```

Registered sound handle used to resolve the sound asset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L49)

<a id="field-field-mq3-audio-qvm-playback-voice-id-id-src-mq3-audio-qvm-playback-ml-1890350375"></a>
### id

```ml
id
```

Caller-supplied identifier used to find or update this sound source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L41)

<a id="field-field-mq3-audio-qvm-playback-voice-localsound-localsound-src-mq3-audio-qvm-playback-ml-599888685"></a>
### localSound

```ml
localSound
```

True when the sound bypasses world-distance spatialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L55)

<a id="field-field-mq3-audio-qvm-playback-voice-mono-mono-src-mq3-audio-qvm-playback-ml-1126657615"></a>
### mono

```ml
mono
```

Decoded signed mono samples cached for channel painting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L61)

<a id="field-field-mq3-audio-qvm-playback-voice-origin-origin-src-mq3-audio-qvm-playback-ml-1922853949"></a>
### origin

```ml
origin
```

World-space XYZ position of the sound source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L51)

<a id="field-field-mq3-audio-qvm-playback-voice-slot-slot-src-mq3-audio-qvm-playback-ml-1107463961"></a>
### slot

```ml
slot
```

Index of the channel slot allocated for this playback voice.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L43)

<a id="field-field-mq3-audio-qvm-playback-voice-sound-sound-src-mq3-audio-qvm-playback-ml-259294473"></a>
### sound

```ml
sound
```

Decoded WAVE sound descriptor supplying the source PCM data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L57)
