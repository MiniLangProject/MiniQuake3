# `mq3.audio.snd_adpcm_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-adpcm-runtime-ml-2127584322.md)

<a id="struct-struct-mq3-audio-snd-adpcm-runtime-state-struct-state-src-mq3-audio-snd-adpcm-runtime-ml-34548403"></a>
## State

```ml
struct State
```

State record for audio.snd_adpcm_runtime, containing `sample`, `index`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_adpcm_runtime.ml#L14)

## Members

<a id="field-field-mq3-audio-snd-adpcm-runtime-state-index-index-src-mq3-audio-snd-adpcm-runtime-ml-4484936"></a>
### index

```ml
index
```

Index into the ADPCM step-size table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_adpcm_runtime.ml#L18)

<a id="field-field-mq3-audio-snd-adpcm-runtime-state-sample-sample-src-mq3-audio-snd-adpcm-runtime-ml-1178492428"></a>
### sample

```ml
sample
```

Previous reconstructed sample used as the ADPCM predictor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_adpcm_runtime.ml#L16)
