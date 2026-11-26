# `mq3.botlib.ai_chat_matches.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-chat-matches-ml-369456329.md)

<a id="struct-struct-mq3-botlib-ai-chat-matches-state-struct-state-src-mq3-botlib-ai-chat-matches-ml-1506211"></a>
## State

```ml
struct State
```

`State` record for ai chat matches, containing `context`, `readFn`, `templates`, `loaded` and `fileReads`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L60)

## Members

<a id="field-field-mq3-botlib-ai-chat-matches-state-context-context-src-mq3-botlib-ai-chat-matches-ml-1304874562"></a>
### context

```ml
context
```

Caller-supplied data associated with loading chat patterns and their captured-variable templates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L62)

<a id="field-field-mq3-botlib-ai-chat-matches-state-filereads-filereads-src-mq3-botlib-ai-chat-matches-ml-811339070"></a>
### fileReads

```ml
fileReads
```

Number of source-file reads performed through the loading interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L70)

<a id="field-field-mq3-botlib-ai-chat-matches-state-loaded-loaded-src-mq3-botlib-ai-chat-matches-ml-928061628"></a>
### loaded

```ml
loaded
```

True after chat message patterns have been loaded into the template table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L68)

<a id="field-field-mq3-botlib-ai-chat-matches-state-readfn-readfn-src-mq3-botlib-ai-chat-matches-ml-1609371570"></a>
### readFn

```ml
readFn
```

Host callback that reads message-pattern files used by the chat matcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L64)

<a id="field-field-mq3-botlib-ai-chat-matches-state-templates-templates-src-mq3-botlib-ai-chat-matches-ml-38147430"></a>
### templates

```ml
templates
```

Registered chat-match templates searched by this runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L66)
