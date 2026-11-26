# `mq3.botlib.ai_resource_pools.ChatState`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)

<a id="struct-struct-mq3-botlib-ai-resource-pools-chatstate-struct-chatstate-src-mq3-botlib-ai-resource-pools-ml-1624397019"></a>
## ChatState

```ml
struct ChatState
```

`ChatState` record for ai resource pools, containing `gender`, `client`, `name`, `chatMessage` and `handle` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L52)

## Members

<a id="field-field-mq3-botlib-ai-resource-pools-chatstate-chat-chat-src-mq3-botlib-ai-resource-pools-ml-1134835756"></a>
### chat

```ml
chat
```

Loaded initial-chat profile selected for this bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L68)

<a id="field-field-mq3-botlib-ai-resource-pools-chatstate-chatmessage-chatmessage-src-mq3-botlib-ai-resource-pools-ml-1402753356"></a>
### chatMessage

```ml
chatMessage
```

Chat message string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L60)

<a id="field-field-mq3-botlib-ai-resource-pools-chatstate-client-client-src-mq3-botlib-ai-resource-pools-ml-1662576234"></a>
### client

```ml
client
```

Server client number associated with the bot chat state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L56)

<a id="field-field-mq3-botlib-ai-resource-pools-chatstate-consolemessages-consolemessages-src-mq3-botlib-ai-resource-pools-ml-1631070668"></a>
### consoleMessages

```ml
consoleMessages
```

Queued console-message slots owned by this bot chat state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L64)

<a id="field-field-mq3-botlib-ai-resource-pools-chatstate-gender-gender-src-mq3-botlib-ai-resource-pools-ml-744632442"></a>
### gender

```ml
gender
```

Gender identifier used by player sounds or bot chat selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L54)

<a id="field-field-mq3-botlib-ai-resource-pools-chatstate-handle-handle-src-mq3-botlib-ai-resource-pools-ml-454958348"></a>
### handle

```ml
handle
```

Managed handle identifying this allocated chat state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L62)

<a id="field-field-mq3-botlib-ai-resource-pools-chatstate-name-name-src-mq3-botlib-ai-resource-pools-ml-1924981522"></a>
### name

```ml
name
```

Name of the bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L58)

<a id="field-field-mq3-botlib-ai-resource-pools-chatstate-numconsolemessages-numconsolemessages-src-mq3-botlib-ai-resource-pools-ml-1274102658"></a>
### numConsoleMessages

```ml
numConsoleMessages
```

Number of queued console messages owned by this bot chat state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L66)
