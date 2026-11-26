# `mq3.botlib.ai_chat_matches.Template`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-chat-matches-ml-369456329.md)

<a id="struct-struct-mq3-botlib-ai-chat-matches-template-struct-template-src-mq3-botlib-ai-chat-matches-ml-1155142639"></a>
## Template

```ml
struct Template
```

`Template` record for ai chat matches, containing `context`, `pieces`, `type` and `subtype`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L31)

## Members

<a id="field-field-mq3-botlib-ai-chat-matches-template-context-context-src-mq3-botlib-ai-chat-matches-ml-993297983"></a>
### context

```ml
context
```

Bit mask selecting the chat contexts in which this message pattern may match.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L33)

<a id="field-field-mq3-botlib-ai-chat-matches-template-pieces-pieces-src-mq3-botlib-ai-chat-matches-ml-1539439681"></a>
### pieces

```ml
pieces
```

Ordered literal and variable components of the match template.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L35)

<a id="field-field-mq3-botlib-ai-chat-matches-template-subtype-subtype-src-mq3-botlib-ai-chat-matches-ml-796731863"></a>
### subtype

```ml
subtype
```

Chat match subtype assigned when this template matches a message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L39)

<a id="field-field-mq3-botlib-ai-chat-matches-template-type-type-src-mq3-botlib-ai-chat-matches-ml-364446327"></a>
### type

```ml
type
```

Match-category bits associated with this chat template.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_matches.ml#L37)
