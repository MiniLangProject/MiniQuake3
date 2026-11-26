# `mq3.botlib.ai_chat_strings.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-chat-strings-ml-176982668.md)

<a id="struct-struct-mq3-botlib-ai-chat-strings-state-struct-state-src-mq3-botlib-ai-chat-strings-ml-1306204319"></a>
## State

```ml
struct State
```

`State` record for ai chat strings, containing `context`, `readFn`, `groups`, `loaded` and `fileReads`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L36)

## Members

<a id="field-field-mq3-botlib-ai-chat-strings-state-context-context-src-mq3-botlib-ai-chat-strings-ml-59356636"></a>
### context

```ml
context
```

Caller-supplied data associated with loading the synonym groups used to normalize chat text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L38)

<a id="field-field-mq3-botlib-ai-chat-strings-state-filereads-filereads-src-mq3-botlib-ai-chat-strings-ml-1278716704"></a>
### fileReads

```ml
fileReads
```

Number of source-file reads performed through the loading interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L46)

<a id="field-field-mq3-botlib-ai-chat-strings-state-groups-groups-src-mq3-botlib-ai-chat-strings-ml-199124860"></a>
### groups

```ml
groups
```

Synonym groups used when normalizing and varying bot chat text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L42)

<a id="field-field-mq3-botlib-ai-chat-strings-state-loaded-loaded-src-mq3-botlib-ai-chat-strings-ml-527167206"></a>
### loaded

```ml
loaded
```

True after the chat synonym file has been parsed into context groups.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L44)

<a id="field-field-mq3-botlib-ai-chat-strings-state-readfn-readfn-src-mq3-botlib-ai-chat-strings-ml-788054972"></a>
### readFn

```ml
readFn
```

Host callback that reads synonym tables used by chat text normalization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_strings.ml#L40)
