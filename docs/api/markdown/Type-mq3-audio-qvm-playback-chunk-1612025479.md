# `mq3.audio.qvm_playback.Chunk`

[Home](README.md) · [Source file](File-src-mq3-audio-qvm-playback-ml-324023706.md)

<a id="struct-struct-mq3-audio-qvm-playback-chunk-struct-chunk-src-mq3-audio-qvm-playback-ml-1227116749"></a>
## Chunk

```ml
struct Chunk
```

Chunk record for audio.qvm_playback, containing `samples`, `frames`, `audibleVoices`, `audibleLoops`, `peak`, `limiterGain`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L154)

## Members

<a id="field-field-mq3-audio-qvm-playback-chunk-audibleloops-audibleloops-src-mq3-audio-qvm-playback-ml-819312552"></a>
### audibleLoops

```ml
audibleLoops
```

Number of looping sources that contributed to this chunk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L162)

<a id="field-field-mq3-audio-qvm-playback-chunk-audiblevoices-audiblevoices-src-mq3-audio-qvm-playback-ml-1591504038"></a>
### audibleVoices

```ml
audibleVoices
```

Number of one-shot voices that contributed to this chunk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L160)

<a id="field-field-mq3-audio-qvm-playback-chunk-frames-frames-src-mq3-audio-qvm-playback-ml-1009279062"></a>
### frames

```ml
frames
```

Number of stereo sample frames contained in this output chunk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L158)

<a id="field-field-mq3-audio-qvm-playback-chunk-limitergain-limitergain-src-mq3-audio-qvm-playback-ml-1788909246"></a>
### limiterGain

```ml
limiterGain
```

Gain applied to keep the mixed output within the supported sample range.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L166)

<a id="field-field-mq3-audio-qvm-playback-chunk-peak-peak-src-mq3-audio-qvm-playback-ml-356544768"></a>
### peak

```ml
peak
```

Largest absolute mixed sample magnitude measured before output clipping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L164)

<a id="field-field-mq3-audio-qvm-playback-chunk-samples-samples-src-mq3-audio-qvm-playback-ml-1122822770"></a>
### samples

```ml
samples
```

Interleaved little-endian signed 16-bit stereo PCM output bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/qvm_playback.ml#L156)
