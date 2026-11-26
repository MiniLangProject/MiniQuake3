# `mq3.botlib.ai_chat_output.ReplyKey`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-chat-output-ml-737978343.md)

<a id="struct-struct-mq3-botlib-ai-chat-output-replykey-struct-replykey-src-mq3-botlib-ai-chat-output-ml-1211402119"></a>
## ReplyKey

```ml
struct ReplyKey
```

`ReplyKey` record for ai chat output, containing `flags`, `text` and `pieces`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L61)

## Members

<a id="field-field-mq3-botlib-ai-chat-output-replykey-flags-flags-src-mq3-botlib-ai-chat-output-ml-864934634"></a>
### flags

```ml
flags
```

Reply-key matching conditions combined from KEY flags.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L63)

<a id="field-field-mq3-botlib-ai-chat-output-replykey-pieces-pieces-src-mq3-botlib-ai-chat-output-ml-273085988"></a>
### pieces

```ml
pieces
```

Ordered literal and variable components of the match template.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L67)

<a id="field-field-mq3-botlib-ai-chat-output-replykey-text-text-src-mq3-botlib-ai-chat-output-ml-1810729540"></a>
### text

```ml
text
```

Literal text, bot name, or other criterion used by this reply key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output.ml#L65)
