# `mq3.botlib.ai_chat_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-chat-runtime-ml-1743095558.md)

<a id="struct-struct-mq3-botlib-ai-chat-runtime-state-struct-state-src-mq3-botlib-ai-chat-runtime-ml-1972979523"></a>
## State

```ml
struct State
```

`State` record for ai chat runtime, containing `pools`, `profiles`, `strings`, `matches` and `output` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L23)

## Members

<a id="field-field-mq3-botlib-ai-chat-runtime-state-actions-actions-src-mq3-botlib-ai-chat-runtime-ml-1870943012"></a>
### actions

```ml
actions
```

Shared elementary-action runtime passed to the assembled chat output handlers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L46)

<a id="field-field-mq3-botlib-ai-chat-runtime-state-console-console-src-mq3-botlib-ai-chat-runtime-ml-935274948"></a>
### console

```ml
console
```

Queued-console-message runtime used by the combined chat interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L35)

<a id="field-field-mq3-botlib-ai-chat-runtime-state-context-context-src-mq3-botlib-ai-chat-runtime-ml-158051112"></a>
### context

```ml
context
```

Caller-supplied data associated with shared chat-resource loading, chat timing, and random reply selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L38)

<a id="field-field-mq3-botlib-ai-chat-runtime-state-diagnostics-diagnostics-src-mq3-botlib-ai-chat-runtime-ml-126772880"></a>
### diagnostics

```ml
diagnostics
```

Diagnostics collected while processing the subsystem's requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L48)

<a id="field-field-mq3-botlib-ai-chat-runtime-state-matches-matches-src-mq3-botlib-ai-chat-runtime-ml-1609184676"></a>
### matches

```ml
matches
```

Chat-match template runtime used by the combined chat interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L31)

<a id="field-field-mq3-botlib-ai-chat-runtime-state-output-output-src-mq3-botlib-ai-chat-runtime-ml-494184322"></a>
### output

```ml
output
```

Runtime that expands and dispatches initial-chat and reply-chat messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L33)

<a id="field-field-mq3-botlib-ai-chat-runtime-state-pools-pools-src-mq3-botlib-ai-chat-runtime-ml-1135090816"></a>
### pools

```ml
pools
```

Managed pools containing bot chat, goal, movement, and weapon resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L25)

<a id="field-field-mq3-botlib-ai-chat-runtime-state-profiles-profiles-src-mq3-botlib-ai-chat-runtime-ml-2009551452"></a>
### profiles

```ml
profiles
```

Loaded initial-chat profiles and their cached message selections.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L27)

<a id="field-field-mq3-botlib-ai-chat-runtime-state-randomfn-randomfn-src-mq3-botlib-ai-chat-runtime-ml-1569616722"></a>
### randomFn

```ml
randomFn
```

Host callback that supplies the random values used by bot selection and fuzzy logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L44)

<a id="field-field-mq3-botlib-ai-chat-runtime-state-readfn-readfn-src-mq3-botlib-ai-chat-runtime-ml-395003120"></a>
### readFn

```ml
readFn
```

Host callback that provides shared file loading to the assembled bot chat runtimes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L40)

<a id="field-field-mq3-botlib-ai-chat-runtime-state-setup-setup-src-mq3-botlib-ai-chat-runtime-ml-1969484092"></a>
### setup

```ml
setup
```

True after the bot-library setup sequence has completed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L50)

<a id="field-field-mq3-botlib-ai-chat-runtime-state-strings-strings-src-mq3-botlib-ai-chat-runtime-ml-1264730512"></a>
### strings

```ml
strings
```

Whitespace and synonym-normalization runtime used by chat processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L29)

<a id="field-field-mq3-botlib-ai-chat-runtime-state-timefn-timefn-src-mq3-botlib-ai-chat-runtime-ml-459916910"></a>
### timeFn

```ml
timeFn
```

Host callback that supplies the current time used by the bot runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_runtime.ml#L42)
