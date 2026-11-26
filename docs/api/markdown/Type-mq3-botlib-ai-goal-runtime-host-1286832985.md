# `mq3.botlib.ai_goal_runtime.Host`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-goal-runtime-ml-319872757.md)

<a id="struct-struct-mq3-botlib-ai-goal-runtime-host-struct-host-src-mq3-botlib-ai-goal-runtime-ml-154717499"></a>
## Host

```ml
struct Host
```

`Host` record for ai goal runtime, containing `userContext`, `timeFn`, `logFn`, `printFn` and `levelItems`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L19)

## Members

<a id="field-field-mq3-botlib-ai-goal-runtime-host-levelitems-levelitems-src-mq3-botlib-ai-goal-runtime-ml-1645111459"></a>
### levelItems

```ml
levelItems
```

Current item goals discovered from the map and its dynamic entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L29)

<a id="field-field-mq3-botlib-ai-goal-runtime-host-logfn-logfn-src-mq3-botlib-ai-goal-runtime-ml-1380006959"></a>
### logFn

```ml
logFn
```

Host callback that writes a bot-runtime message to the host log.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L25)

<a id="field-field-mq3-botlib-ai-goal-runtime-host-printfn-printfn-src-mq3-botlib-ai-goal-runtime-ml-199014775"></a>
### printFn

```ml
printFn
```

Host callback that prints messages from the native-compatible bot goal API.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L27)

<a id="field-field-mq3-botlib-ai-goal-runtime-host-timefn-timefn-src-mq3-botlib-ai-goal-runtime-ml-751289001"></a>
### timeFn

```ml
timeFn
```

Host callback that supplies the current time used by the bot runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L23)

<a id="field-field-mq3-botlib-ai-goal-runtime-host-usercontext-usercontext-src-mq3-botlib-ai-goal-runtime-ml-1393308911"></a>
### userContext

```ml
userContext
```

Caller-owned context forwarded to the configured host services.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L21)
