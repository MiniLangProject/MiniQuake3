# `mq3.botlib.ai_move_runtime.GroundTrace`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-move-runtime-ml-1991141291.md)

<a id="struct-struct-mq3-botlib-ai-move-runtime-groundtrace-struct-groundtrace-src-mq3-botlib-ai-move-runtime-ml-2132962273"></a>
## GroundTrace

```ml
struct GroundTrace
```

`GroundTrace` record for ai move runtime, containing `startSolid`, `fraction`, `entity` and `endPos`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L198)

## Members

<a id="field-field-mq3-botlib-ai-move-runtime-groundtrace-endpos-endpos-src-mq3-botlib-ai-move-runtime-ml-480852093"></a>
### endPos

```ml
endPos
```

End position reached by the collision trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L206)

<a id="field-field-mq3-botlib-ai-move-runtime-groundtrace-entity-entity-src-mq3-botlib-ai-move-runtime-ml-299484061"></a>
### entity

```ml
entity
```

Entity number of the ground or obstacle reported by the trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L204)

<a id="field-field-mq3-botlib-ai-move-runtime-groundtrace-fraction-fraction-src-mq3-botlib-ai-move-runtime-ml-2056964071"></a>
### fraction

```ml
fraction
```

Fraction of the requested trace segment completed before the first collision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L202)

<a id="field-field-mq3-botlib-ai-move-runtime-groundtrace-startsolid-startsolid-src-mq3-botlib-ai-move-runtime-ml-1389492677"></a>
### startSolid

```ml
startSolid
```

True when the initial trace position lies inside solid geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L200)
