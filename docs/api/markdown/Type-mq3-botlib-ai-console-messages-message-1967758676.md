# `mq3.botlib.ai_console_messages.Message`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-console-messages-ml-2082793327.md)

<a id="struct-struct-mq3-botlib-ai-console-messages-message-struct-message-src-mq3-botlib-ai-console-messages-ml-1389858175"></a>
## Message

```ml
struct Message
```

`Message` record for ai console messages, containing `slot`, `handle`, `time`, `type` and `data`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L29)

## Members

<a id="field-field-mq3-botlib-ai-console-messages-message-data-data-src-mq3-botlib-ai-console-messages-ml-1667673080"></a>
### data

```ml
data
```

Text of the queued console or chat message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L39)

<a id="field-field-mq3-botlib-ai-console-messages-message-handle-handle-src-mq3-botlib-ai-console-messages-ml-1145638484"></a>
### handle

```ml
handle
```

Identifier used to remove or advance past this queued console message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L33)

<a id="field-field-mq3-botlib-ai-console-messages-message-slot-slot-src-mq3-botlib-ai-console-messages-ml-1315335848"></a>
### slot

```ml
slot
```

Index identifying this entry in its owning slot table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L31)

<a id="field-field-mq3-botlib-ai-console-messages-message-time-time-src-mq3-botlib-ai-console-messages-ml-358138182"></a>
### time

```ml
time
```

Bot-runtime timestamp at which this console message was queued.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L35)

<a id="field-field-mq3-botlib-ai-console-messages-message-type-type-src-mq3-botlib-ai-console-messages-ml-1490082488"></a>
### type

```ml
type
```

Console-message category distinguishing ordinary output from chat.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L37)
