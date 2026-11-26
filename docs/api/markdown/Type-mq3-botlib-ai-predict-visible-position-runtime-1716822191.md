# `mq3.botlib.ai_predict_visible_position.Runtime`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-predict-visible-position-ml-125650055.md)

<a id="struct-struct-mq3-botlib-ai-predict-visible-position-runtime-struct-runtime-src-mq3-botlib-ai-predict-visible-position-ml-1815068197"></a>
## Runtime

```ml
struct Runtime
```

`Runtime` record for ai predict visible position, containing `router`, `context` and `traceFn`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_predict_visible_position.ml#L17)

## Members

<a id="field-field-mq3-botlib-ai-predict-visible-position-runtime-context-context-src-mq3-botlib-ai-predict-visible-position-ml-1782343955"></a>
### context

```ml
context
```

Caller-supplied data associated with visibility traces along a predicted navigation route.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_predict_visible_position.ml#L21)

<a id="field-field-mq3-botlib-ai-predict-visible-position-runtime-router-router-src-mq3-botlib-ai-predict-visible-position-ml-165674289"></a>
### router

```ml
router
```

AAS navigation state supplying area settings and reachabilities for route searches.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_predict_visible_position.ml#L19)

<a id="field-field-mq3-botlib-ai-predict-visible-position-runtime-tracefn-tracefn-src-mq3-botlib-ai-predict-visible-position-ml-1303523007"></a>
### traceFn

```ml
traceFn
```

Host callback that performs a collision sweep through the host world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_predict_visible_position.ml#L23)
