# `mq3.botlib.ai_chat_output.Reply`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-chat-output-ml-737978343.md)

<a id="struct-struct-mq3-botlib-ai-chat-output-reply-struct-reply-src-mq3-botlib-ai-chat-output-ml-2076828593"></a>
## Reply

```ml
struct Reply
```

`Reply` record for ai chat output, containing `keys`, `priority` and `messages`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L70)

## Members

<a id="field-field-mq3-botlib-ai-chat-output-reply-keys-keys-src-mq3-botlib-ai-chat-output-ml-418864937"></a>
### keys

```ml
keys
```

Conditions that an incoming message must satisfy for this reply.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L72)

<a id="field-field-mq3-botlib-ai-chat-output-reply-messages-messages-src-mq3-botlib-ai-chat-output-ml-327585001"></a>
### messages

```ml
messages
```

Reply messages available when the key conditions match.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L76)

<a id="field-field-mq3-botlib-ai-chat-output-reply-priority-priority-src-mq3-botlib-ai-chat-output-ml-1906605033"></a>
### priority

```ml
priority
```

Priority assigned to this reply-chat definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L74)
