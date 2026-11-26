# `mq3.botlib.ai_chat_runtime.AliasContext`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-chat-runtime-ml-1743095558.md)

<a id="struct-struct-mq3-botlib-ai-chat-runtime-aliascontext-struct-aliascontext-src-mq3-botlib-ai-chat-runtime-ml-1086064315"></a>
## AliasContext

```ml
struct AliasContext
```

`AliasContext` record for ai chat runtime, containing `runtime`, `requested` and `canonical`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L53)

## Members

<a id="field-field-mq3-botlib-ai-chat-runtime-aliascontext-canonical-canonical-src-mq3-botlib-ai-chat-runtime-ml-1593014854"></a>
### canonical

```ml
canonical
```

Canonical operation name selected after alias resolution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L59)

<a id="field-field-mq3-botlib-ai-chat-runtime-aliascontext-requested-requested-src-mq3-botlib-ai-chat-runtime-ml-173045902"></a>
### requested

```ml
requested
```

Operation name requested by the caller before alias resolution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L57)

<a id="field-field-mq3-botlib-ai-chat-runtime-aliascontext-runtime-runtime-src-mq3-botlib-ai-chat-runtime-ml-583624094"></a>
### runtime

```ml
runtime
```

Chat runtime whose file reader supplies the aliased chat resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_runtime.ml#L55)
