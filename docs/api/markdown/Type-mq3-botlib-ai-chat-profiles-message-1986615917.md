# `mq3.botlib.ai_chat_profiles.Message`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-chat-profiles-ml-1781106722.md)

<a id="struct-struct-mq3-botlib-ai-chat-profiles-message-struct-message-src-mq3-botlib-ai-chat-profiles-ml-196832333"></a>
## Message

```ml
struct Message
```

`Message` record for ai chat profiles, containing `encoded`, `components` and `recentTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L49)

## Members

<a id="field-field-mq3-botlib-ai-chat-profiles-message-components-components-src-mq3-botlib-ai-chat-profiles-ml-1217934648"></a>
### components

```ml
components
```

Parsed literal, variable, and random-list components of the message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L53)

<a id="field-field-mq3-botlib-ai-chat-profiles-message-encoded-encoded-src-mq3-botlib-ai-chat-profiles-ml-1323646920"></a>
### encoded

```ml
encoded
```

Encoded chat-message template retained for expansion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L51)

<a id="field-field-mq3-botlib-ai-chat-profiles-message-recenttime-recenttime-src-mq3-botlib-ai-chat-profiles-ml-584061480"></a>
### recentTime

```ml
recentTime
```

Next time at which the chat message may be selected again.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_profiles.ml#L55)
