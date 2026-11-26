# `mq3.audio.snd_raw_stream.State`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-raw-stream-ml-887602525.md)

<a id="struct-struct-mq3-audio-snd-raw-stream-state-struct-state-src-mq3-audio-snd-raw-stream-ml-700753833"></a>
## State

```ml
struct State
```

State record for audio.snd_raw_stream, containing `outputRate`, `soundTime`, `rawEnd`, `left`, `right`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L13)

## Members

<a id="field-field-mq3-audio-snd-raw-stream-state-left-left-src-mq3-audio-snd-raw-stream-ml-318111482"></a>
### left

```ml
left
```

Ring buffer of left-channel raw sample values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L21)

<a id="field-field-mq3-audio-snd-raw-stream-state-outputrate-outputrate-src-mq3-audio-snd-raw-stream-ml-923272774"></a>
### outputRate

```ml
outputRate
```

Output sample rate in hertz.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L15)

<a id="field-field-mq3-audio-snd-raw-stream-state-rawend-rawend-src-mq3-audio-snd-raw-stream-ml-285813158"></a>
### rawEnd

```ml
rawEnd
```

Exclusive absolute sample position through which raw input has been buffered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L19)

<a id="field-field-mq3-audio-snd-raw-stream-state-right-right-src-mq3-audio-snd-raw-stream-ml-313933888"></a>
### right

```ml
right
```

Ring buffer of right-channel raw sample values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L23)

<a id="field-field-mq3-audio-snd-raw-stream-state-soundtime-soundtime-src-mq3-audio-snd-raw-stream-ml-2072764440"></a>
### soundTime

```ml
soundTime
```

Absolute sample position currently consumed by playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L17)
