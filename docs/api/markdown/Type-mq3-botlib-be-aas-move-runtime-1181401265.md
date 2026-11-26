# `mq3.botlib.be_aas_move.Runtime`

[Home](README.md) · [Source file](File-src-mq3-botlib-be-aas-move-ml-1175504309.md)

<a id="struct-struct-mq3-botlib-be-aas-move-runtime-struct-runtime-src-mq3-botlib-be-aas-move-ml-481357769"></a>
## Runtime

```ml
struct Runtime
```

`Runtime` record for be aas move, containing `services`, `settings`, `againstLadderFn`, `debugClearFn` and `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L90)

## Members

<a id="field-field-mq3-botlib-be-aas-move-runtime-againstladderfn-againstladderfn-src-mq3-botlib-be-aas-move-ml-1212898763"></a>
### againstLadderFn

```ml
againstLadderFn
```

Host callback that reports whether the bot hull is against a climbable ladder.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L96)

<a id="field-field-mq3-botlib-be-aas-move-runtime-context-context-src-mq3-botlib-be-aas-move-ml-1378014939"></a>
### context

```ml
context
```

Caller-supplied data associated with ladder checks and debug cleanup around AAS movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L101)

<a id="field-field-mq3-botlib-be-aas-move-runtime-debugclearfn-debugclearfn-src-mq3-botlib-be-aas-move-ml-454399171"></a>
### debugClearFn

```ml
debugClearFn
```

Host callback that removes host-side navigation debug drawings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L98)

<a id="field-field-mq3-botlib-be-aas-move-runtime-services-services-src-mq3-botlib-be-aas-move-ml-1764832363"></a>
### services

```ml
services
```

Prediction trace and contents services used by the AAS movement facade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L92)

<a id="field-field-mq3-botlib-be-aas-move-runtime-settings-settings-src-mq3-botlib-be-aas-move-ml-621884625"></a>
### settings

```ml
settings
```

Area or runtime settings controlling navigation behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L94)
