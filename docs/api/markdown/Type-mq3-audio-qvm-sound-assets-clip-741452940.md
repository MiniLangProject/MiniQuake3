# `mq3.audio.qvm_sound_assets.Clip`

[Home](README.md) · [Source file](File-src-mq3-audio-qvm-sound-assets-ml-1587569282.md)

<a id="struct-struct-mq3-audio-qvm-sound-assets-clip-struct-clip-src-mq3-audio-qvm-sound-assets-ml-1351739181"></a>
## Clip

```ml
struct Clip
```

Clip record for audio.qvm_sound_assets, containing `handle`, `path`, `sound`, `compressed`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_sound_assets.ml#L18)

## Members

<a id="field-field-mq3-audio-qvm-sound-assets-clip-compressed-compressed-src-mq3-audio-qvm-sound-assets-ml-446914039"></a>
### compressed

```ml
compressed
```

Compressed sound descriptor when playback uses encoded sample blocks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_sound_assets.ml#L26)

<a id="field-field-mq3-audio-qvm-sound-assets-clip-handle-handle-src-mq3-audio-qvm-sound-assets-ml-1865530353"></a>
### handle

```ml
handle
```

Registered sound handle used to resolve the sound asset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_sound_assets.ml#L20)

<a id="field-field-mq3-audio-qvm-sound-assets-clip-path-path-src-mq3-audio-qvm-sound-assets-ml-1464112483"></a>
### path

```ml
path
```

Asset path used to find the sound inside the archive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_sound_assets.ml#L22)

<a id="field-field-mq3-audio-qvm-sound-assets-clip-sound-sound-src-mq3-audio-qvm-sound-assets-ml-701279741"></a>
### sound

```ml
sound
```

Decoded WAVE sound descriptor supplying the source PCM data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_sound_assets.ml#L24)
