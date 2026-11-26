# `mq3.botlib.be_ai_move.Adapter`

[Home](README.md) · [Source file](File-src-mq3-botlib-be-ai-move-ml-1287990866.md)

<a id="struct-struct-mq3-botlib-be-ai-move-adapter-struct-adapter-src-mq3-botlib-be-ai-move-ml-1946474785"></a>
## Adapter

```ml
struct Adapter
```

`Adapter` record for be ai move, containing `runtime`, `modelTypes`, `context`, `visibleTraceFn` and `moverInfoFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L52)

## Members

<a id="field-field-mq3-botlib-be-ai-move-adapter-context-context-src-mq3-botlib-be-ai-move-ml-1449368740"></a>
### context

```ml
context
```

Caller-supplied data associated with host mover inspection, visibility checks, and movement-AI setup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L59)

<a id="field-field-mq3-botlib-be-ai-move-adapter-modeltypes-modeltypes-src-mq3-botlib-be-ai-move-ml-1070754304"></a>
### modelTypes

```ml
modelTypes
```

Movement classifications assigned to brush models.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L56)

<a id="field-field-mq3-botlib-be-ai-move-adapter-moverinfofn-moverinfofn-src-mq3-botlib-be-ai-move-ml-37599064"></a>
### moverInfoFn

```ml
moverInfoFn
```

Host callback that retrieves the position and behavior of a moving platform.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L63)

<a id="field-field-mq3-botlib-be-ai-move-adapter-onmoverfn-onmoverfn-src-mq3-botlib-be-ai-move-ml-1203415164"></a>
### onMoverFn

```ml
onMoverFn
```

Host callback that tests whether the bot is standing on a moving entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L65)

<a id="field-field-mq3-botlib-be-ai-move-adapter-ontopfn-ontopfn-src-mq3-botlib-be-ai-move-ml-83800952"></a>
### onTopFn

```ml
onTopFn
```

Host callback that tests whether the bot is above the specified obstacle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L67)

<a id="field-field-mq3-botlib-be-ai-move-adapter-runtime-runtime-src-mq3-botlib-be-ai-move-ml-2128970148"></a>
### runtime

```ml
runtime
```

Bot movement runtime delegated to by the native-compatible movement API.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L54)

<a id="field-field-mq3-botlib-be-ai-move-adapter-setupfn-setupfn-src-mq3-botlib-be-ai-move-ml-1417435124"></a>
### setupFn

```ml
setupFn
```

Host callback that initializes the supplied bot-library adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L69)

<a id="field-field-mq3-botlib-be-ai-move-adapter-shutdownfn-shutdownfn-src-mq3-botlib-be-ai-move-ml-442085888"></a>
### shutdownFn

```ml
shutdownFn
```

Host callback that shuts down the host subsystem and releases its resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L71)

<a id="field-field-mq3-botlib-be-ai-move-adapter-visibletracefn-visibletracefn-src-mq3-botlib-be-ai-move-ml-194131970"></a>
### visibleTraceFn

```ml
visibleTraceFn
```

Host callback that traces visibility to a potential movement target.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L61)
