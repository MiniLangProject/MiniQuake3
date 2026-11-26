# `mq3.botlib.ai_chat_goal_tail.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-chat-goal-tail-ml-1426920332.md)

<a id="struct-struct-mq3-botlib-ai-chat-goal-tail-state-struct-state-src-mq3-botlib-ai-chat-goal-tail-ml-420455127"></a>
## State

```ml
struct State
```

`State` record for ai chat goal tail, containing `chatProfiles`, `goalRuntime` and `levelItems`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_goal_tail.ml#L27)

## Members

<a id="field-field-mq3-botlib-ai-chat-goal-tail-state-chatprofiles-chatprofiles-src-mq3-botlib-ai-chat-goal-tail-ml-47964396"></a>
### chatProfiles

```ml
chatProfiles
```

Initial-chat profile runtime used by the supplemental chat operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_goal_tail.ml#L29)

<a id="field-field-mq3-botlib-ai-chat-goal-tail-state-goalruntime-goalruntime-src-mq3-botlib-ai-chat-goal-tail-ml-1307123312"></a>
### goalRuntime

```ml
goalRuntime
```

Bot goal runtime used by the supplemental goal operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_goal_tail.ml#L31)

<a id="field-field-mq3-botlib-ai-chat-goal-tail-state-levelitems-levelitems-src-mq3-botlib-ai-chat-goal-tail-ml-888806800"></a>
### levelItems

```ml
levelItems
```

Current item goals discovered from the map and its dynamic entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_goal_tail.ml#L33)
