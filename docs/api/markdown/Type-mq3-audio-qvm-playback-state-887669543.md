# `mq3.audio.qvm_playback.State`

[Home](README.md) · [Source file](File-src-mq3-audio-qvm-playback-ml-324023706.md)

<a id="struct-struct-mq3-audio-qvm-playback-state-struct-state-src-mq3-audio-qvm-playback-ml-555919861"></a>
## State

```ml
struct State
```

State record for audio.qvm_playback, containing `outputRate`, `chunkFrames`, `catalog`, `listener`, `entityOrigins`, `voices`, and 10 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L110)

## Members

<a id="field-field-mq3-audio-qvm-playback-state-catalog-catalog-src-mq3-audio-qvm-playback-ml-739295478"></a>
### catalog

```ml
catalog
```

Registered sound assets and any failures encountered while loading them.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L116)

<a id="field-field-mq3-audio-qvm-playback-state-channels-channels-src-mq3-audio-qvm-playback-ml-984081830"></a>
### channels

```ml
channels
```

Channel allocator used to enforce entity-channel replacement rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L132)

<a id="field-field-mq3-audio-qvm-playback-state-chunkframes-chunkframes-src-mq3-audio-qvm-playback-ml-757527682"></a>
### chunkFrames

```ml
chunkFrames
```

Number of stereo sample frames produced by one mixing pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L114)

<a id="field-field-mq3-audio-qvm-playback-state-cliphandles-cliphandles-src-mq3-audio-qvm-playback-ml-1050135090"></a>
### clipHandles

```ml
clipHandles
```

Sound handles corresponding to catalog clip entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L140)

<a id="field-field-mq3-audio-qvm-playback-state-commandcursor-commandcursor-src-mq3-audio-qvm-playback-ml-331982886"></a>
### commandCursor

```ml
commandCursor
```

Next audio command to consume from the VM-issued command sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L130)

<a id="field-field-mq3-audio-qvm-playback-state-entityorigins-entityorigins-src-mq3-audio-qvm-playback-ml-2085954742"></a>
### entityOrigins

```ml
entityOrigins
```

Entity-indexed world positions used by sounds without a fixed origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L120)

<a id="field-field-mq3-audio-qvm-playback-state-listener-listener-src-mq3-audio-qvm-playback-ml-1365227406"></a>
### listener

```ml
listener
```

Current listener position, orientation, entity number, and water state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L118)

<a id="field-field-mq3-audio-qvm-playback-state-looppaintedframes-looppaintedframes-src-mq3-audio-qvm-playback-ml-555083618"></a>
### loopPaintedFrames

```ml
loopPaintedFrames
```

Absolute number of output frames already painted for loop playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L134)

<a id="field-field-mq3-audio-qvm-playback-state-loops-loops-src-mq3-audio-qvm-playback-ml-1502112406"></a>
### loops

```ml
loops
```

Entity-indexed looping sound sources retained between frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L124)

<a id="field-field-mq3-audio-qvm-playback-state-monocache-monocache-src-mq3-audio-qvm-playback-ml-1057726882"></a>
### monoCache

```ml
monoCache
```

Cached mono PCM used to avoid repeatedly decoding registered clips.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L138)

<a id="field-field-mq3-audio-qvm-playback-state-monohandles-monohandles-src-mq3-audio-qvm-playback-ml-271051158"></a>
### monoHandles

```ml
monoHandles
```

Sound handles corresponding to cached mono PCM entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L142)

<a id="field-field-mq3-audio-qvm-playback-state-music-music-src-mq3-audio-qvm-playback-ml-70239922"></a>
### music

```ml
music
```

Current introductory and looping background-music playback state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L128)

<a id="field-field-mq3-audio-qvm-playback-state-nextvoice-nextvoice-src-mq3-audio-qvm-playback-ml-1753073990"></a>
### nextVoice

```ml
nextVoice
```

Identifier assigned to the next one-shot playback voice.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L126)

<a id="field-field-mq3-audio-qvm-playback-state-outputrate-outputrate-src-mq3-audio-qvm-playback-ml-1067929128"></a>
### outputRate

```ml
outputRate
```

Output sample rate in hertz.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L112)

<a id="field-field-mq3-audio-qvm-playback-state-rawstream-rawstream-src-mq3-audio-qvm-playback-ml-350789262"></a>
### rawStream

```ml
rawStream
```

Streaming stereo sample ring used for continuous audio input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L136)

<a id="field-field-mq3-audio-qvm-playback-state-voices-voices-src-mq3-audio-qvm-playback-ml-230613644"></a>
### voices

```ml
voices
```

Allocated one-shot sound voices and their playback cursors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L122)
