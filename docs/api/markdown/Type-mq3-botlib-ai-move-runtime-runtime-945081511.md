# `mq3.botlib.ai_move_runtime.Runtime`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-move-runtime-ml-1991141291.md)

<a id="struct-struct-mq3-botlib-ai-move-runtime-runtime-struct-runtime-src-mq3-botlib-ai-move-runtime-ml-264853629"></a>
## Runtime

```ml
struct Runtime
```

`Runtime` record for ai move runtime, containing `pools`, `aas`, `router` and `services`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L187)

## Members

<a id="field-field-mq3-botlib-ai-move-runtime-runtime-aas-aas-src-mq3-botlib-ai-move-runtime-ml-355353347"></a>
### aas

```ml
aas
```

AAS navigation runtime used for area and route queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L191)

<a id="field-field-mq3-botlib-ai-move-runtime-runtime-pools-pools-src-mq3-botlib-ai-move-runtime-ml-589321279"></a>
### pools

```ml
pools
```

Managed pools containing bot chat, goal, movement, and weapon resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L189)

<a id="field-field-mq3-botlib-ai-move-runtime-runtime-router-router-src-mq3-botlib-ai-move-runtime-ml-1174718501"></a>
### router

```ml
router
```

AAS navigation state supplying area settings and reachabilities for route searches.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L193)

<a id="field-field-mq3-botlib-ai-move-runtime-runtime-services-services-src-mq3-botlib-ai-move-runtime-ml-26271975"></a>
### services

```ml
services
```

Movement host operations for traces, movers, route selection, and action execution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L195)
