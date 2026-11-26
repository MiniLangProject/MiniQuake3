# `mq3.botlib.ai_console_messages.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-console-messages-ml-2082793327.md)

<a id="struct-struct-mq3-botlib-ai-console-messages-state-struct-state-src-mq3-botlib-ai-console-messages-ml-783647963"></a>
## State

```ml
struct State
```

`State` record for ai console messages, containing `pools`, `nodes`, `freeSlots`, `time` and `capacity`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L42)

## Members

<a id="field-field-mq3-botlib-ai-console-messages-state-capacity-capacity-src-mq3-botlib-ai-console-messages-ml-68205406"></a>
### capacity

```ml
capacity
```

Maximum number of entries allowed in the managed collection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L52)

<a id="field-field-mq3-botlib-ai-console-messages-state-freeslots-freeslots-src-mq3-botlib-ai-console-messages-ml-882648946"></a>
### freeSlots

```ml
freeSlots
```

Indexes of resource slots available for reuse.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L48)

<a id="field-field-mq3-botlib-ai-console-messages-state-nodes-nodes-src-mq3-botlib-ai-console-messages-ml-1763704890"></a>
### nodes

```ml
nodes
```

BSP nodes used to partition the collision or navigation world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L46)

<a id="field-field-mq3-botlib-ai-console-messages-state-pools-pools-src-mq3-botlib-ai-console-messages-ml-45822258"></a>
### pools

```ml
pools
```

Managed pools containing bot chat, goal, movement, and weapon resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L44)

<a id="field-field-mq3-botlib-ai-console-messages-state-time-time-src-mq3-botlib-ai-console-messages-ml-2051667836"></a>
### time

```ml
time
```

Current bot-runtime timestamp assigned to newly queued messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L50)
