# `mq3.botlib.ai_chat_profiles.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-chat-profiles-ml-1781106722.md)

<a id="struct-struct-mq3-botlib-ai-chat-profiles-state-struct-state-src-mq3-botlib-ai-chat-profiles-ml-2008823361"></a>
## State

```ml
struct State
```

`State` record for ai chat profiles, containing `pools`, `context`, `readFn`, `cache` and `reload` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L90)

## Members

<a id="field-field-mq3-botlib-ai-chat-profiles-state-cache-cache-src-mq3-botlib-ai-chat-profiles-ml-333304654"></a>
### cache

```ml
cache
```

Cached lookup or routing data reused by subsequent requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L98)

<a id="field-field-mq3-botlib-ai-chat-profiles-state-context-context-src-mq3-botlib-ai-chat-profiles-ml-1645195726"></a>
### context

```ml
context
```

Caller-supplied data associated with loading initial-chat profiles and their included files.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L94)

<a id="field-field-mq3-botlib-ai-chat-profiles-state-filereads-filereads-src-mq3-botlib-ai-chat-profiles-ml-72819394"></a>
### fileReads

```ml
fileReads
```

Number of source-file reads performed through the loading interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L102)

<a id="field-field-mq3-botlib-ai-chat-profiles-state-pools-pools-src-mq3-botlib-ai-chat-profiles-ml-794744742"></a>
### pools

```ml
pools
```

Managed pools containing bot chat, goal, movement, and weapon resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L92)

<a id="field-field-mq3-botlib-ai-chat-profiles-state-readfn-readfn-src-mq3-botlib-ai-chat-profiles-ml-850689166"></a>
### readFn

```ml
readFn
```

Host callback that reads initial-chat profile definitions and included chat sources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L96)

<a id="field-field-mq3-botlib-ai-chat-profiles-state-reload-reload-src-mq3-botlib-ai-chat-profiles-ml-1722651240"></a>
### reload

```ml
reload
```

True when chat profiles should be reloaded instead of reused from cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_profiles.ml#L100)
