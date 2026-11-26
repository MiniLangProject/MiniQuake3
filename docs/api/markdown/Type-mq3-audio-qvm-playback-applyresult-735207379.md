# `mq3.audio.qvm_playback.ApplyResult`

[Home](README.md) · [Source file](File-src-mq3-audio-qvm-playback-ml-324023706.md)

<a id="struct-struct-mq3-audio-qvm-playback-applyresult-struct-applyresult-src-mq3-audio-qvm-playback-ml-1225061281"></a>
## ApplyResult

```ml
struct ApplyResult
```

ApplyResult record for audio.qvm_playback, containing `applied`, `missing`, `ignored`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L145)

## Members

<a id="field-field-mq3-audio-qvm-playback-applyresult-applied-applied-src-mq3-audio-qvm-playback-ml-679588230"></a>
### applied

```ml
applied
```

Number of audio commands successfully applied.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L147)

<a id="field-field-mq3-audio-qvm-playback-applyresult-ignored-ignored-src-mq3-audio-qvm-playback-ml-1751738558"></a>
### ignored

```ml
ignored
```

Number of commands skipped because they were unsupported or inapplicable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L151)

<a id="field-field-mq3-audio-qvm-playback-applyresult-missing-missing-src-mq3-audio-qvm-playback-ml-586660454"></a>
### missing

```ml
missing
```

Number of commands whose referenced sound asset was unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_playback.ml#L149)
