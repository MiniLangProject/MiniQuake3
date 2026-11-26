# `mq3.format.roq.Audio`

[Home](README.md) · [Source file](File-src-mq3-format-roq-ml-406347091.md)

<a id="struct-struct-mq3-format-roq-audio-struct-audio-src-mq3-format-roq-ml-862158553"></a>
## Audio

```ml
struct Audio
```

Audio record for format.roq, containing `samples`, `frames`, `sampleRate`, `channels`, `bitsPerSample`, `blockAlign`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L54)

## Members

<a id="field-field-mq3-format-roq-audio-bitspersample-bitspersample-src-mq3-format-roq-ml-1421465353"></a>
### bitsPerSample

```ml
bitsPerSample
```

Number of bits stored for each sample in one channel.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L64)

<a id="field-field-mq3-format-roq-audio-blockalign-blockalign-src-mq3-format-roq-ml-74929565"></a>
### blockAlign

```ml
blockAlign
```

Bytes occupied by one complete interleaved audio sample frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L66)

<a id="field-field-mq3-format-roq-audio-channels-channels-src-mq3-format-roq-ml-215390521"></a>
### channels

```ml
channels
```

Number of interleaved audio channels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L62)

<a id="field-field-mq3-format-roq-audio-frames-frames-src-mq3-format-roq-ml-115458097"></a>
### frames

```ml
frames
```

Number of complete audio sample frames in the decoded chunk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L58)

<a id="field-field-mq3-format-roq-audio-samplerate-samplerate-src-mq3-format-roq-ml-28240377"></a>
### sampleRate

```ml
sampleRate
```

Audio sample rate in hertz.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L60)

<a id="field-field-mq3-format-roq-audio-samples-samples-src-mq3-format-roq-ml-1531785597"></a>
### samples

```ml
samples
```

Decoded interleaved signed PCM sample bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L56)
