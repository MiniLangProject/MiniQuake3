# `mq3.audio.snd_adpcm_runtime.Encoded`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-adpcm-runtime-ml-2127584322.md)

<a id="struct-struct-mq3-audio-snd-adpcm-runtime-encoded-struct-encoded-src-mq3-audio-snd-adpcm-runtime-ml-1515010593"></a>
## Encoded

```ml
struct Encoded
```

Encoded record for audio.snd_adpcm_runtime, containing `data`, `state`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_adpcm_runtime.ml#L21)

## Members

<a id="field-field-mq3-audio-snd-adpcm-runtime-encoded-data-data-src-mq3-audio-snd-adpcm-runtime-ml-1484867469"></a>
### data

```ml
data
```

Packed four-bit ADPCM codes, with two codes stored in each byte.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_adpcm_runtime.ml#L23)

<a id="field-field-mq3-audio-snd-adpcm-runtime-encoded-state-state-src-mq3-audio-snd-adpcm-runtime-ml-164376693"></a>
### state

```ml
state
```

Final predictor sample and step index needed to continue encoding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_adpcm_runtime.ml#L25)
