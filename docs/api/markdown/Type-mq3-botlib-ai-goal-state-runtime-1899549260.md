# `mq3.botlib.ai_goal_state.Runtime`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-goal-state-ml-857672002.md)

<a id="struct-struct-mq3-botlib-ai-goal-state-runtime-struct-runtime-src-mq3-botlib-ai-goal-state-ml-1152333381"></a>
## Runtime

```ml
struct Runtime
```

`Runtime` record for ai goal state, containing `pools`, `context`, `timeFn`, `goalNameFn` and `logFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_state.ml#L35)

## Members

<a id="field-field-mq3-botlib-ai-goal-state-runtime-context-context-src-mq3-botlib-ai-goal-state-ml-998764269"></a>
### context

```ml
context
```

Caller-supplied data associated with goal timing, goal-name lookup, logging, and goal-stack diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_state.ml#L40)

<a id="field-field-mq3-botlib-ai-goal-state-runtime-goalnamefn-goalnamefn-src-mq3-botlib-ai-goal-state-ml-798793085"></a>
### goalNameFn

```ml
goalNameFn
```

Host callback that resolves a bot goal to its display name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_state.ml#L44)

<a id="field-field-mq3-botlib-ai-goal-state-runtime-logfn-logfn-src-mq3-botlib-ai-goal-state-ml-1022651013"></a>
### logFn

```ml
logFn
```

Host callback that writes a bot-runtime message to the host log.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_state.ml#L46)

<a id="field-field-mq3-botlib-ai-goal-state-runtime-pools-pools-src-mq3-botlib-ai-goal-state-ml-1402175301"></a>
### pools

```ml
pools
```

Managed pools containing bot chat, goal, movement, and weapon resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_state.ml#L37)

<a id="field-field-mq3-botlib-ai-goal-state-runtime-printfn-printfn-src-mq3-botlib-ai-goal-state-ml-813334221"></a>
### printFn

```ml
printFn
```

Host callback that prints goal-stack and goal-state diagnostic output.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_state.ml#L48)

<a id="field-field-mq3-botlib-ai-goal-state-runtime-timefn-timefn-src-mq3-botlib-ai-goal-state-ml-1308526995"></a>
### timeFn

```ml
timeFn
```

Host callback that supplies the current time used by the bot runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_state.ml#L42)
