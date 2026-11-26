# `mq3.game.g_main.Runtime`

[Home](README.md) · [Source file](File-src-mq3-game-g-main-ml-354596393.md)

<a id="struct-struct-mq3-game-g-main-runtime-struct-runtime-src-mq3-game-g-main-ml-89598653"></a>
## Runtime

```ml
struct Runtime
```

Runtime keeps the engine-owned inputs which native qagame obtains through traps.  Function slots default to the real port, while making the ABI switch independently differential-testable without replacing gameplay code.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L50)

## Members

<a id="field-field-mq3-game-g-main-runtime-gmainargv-gmainargv-src-mq3-game-g-main-ml-19855669"></a>
### gmainArgv

```ml
gmainArgv
```

Arguments supplied to the current game-module command dispatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L56)

<a id="field-field-mq3-game-g-main-runtime-gmainbeginfn-gmainbeginfn-src-mq3-game-g-main-ml-334455747"></a>
### gmainBeginFn

```ml
gmainBeginFn
```

Injected callback for gmain begin; invoked through the Runtime service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L72)

<a id="field-field-mq3-game-g-main-runtime-gmainbotframefn-gmainbotframefn-src-mq3-game-g-main-ml-589230301"></a>
### gmainBotFrameFn

```ml
gmainBotFrameFn
```

Injected callback for gmain bot frame; invoked through the Runtime service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L80)

<a id="field-field-mq3-game-g-main-runtime-gmaincommandfn-gmaincommandfn-src-mq3-game-g-main-ml-1628575715"></a>
### gmainCommandFn

```ml
gmainCommandFn
```

Injected callback for gmain command; invoked through the Runtime service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L74)

<a id="field-field-mq3-game-g-main-runtime-gmainconnectfn-gmainconnectfn-src-mq3-game-g-main-ml-675407213"></a>
### gmainConnectFn

```ml
gmainConnectFn
```

Injected callback for gmain connect; invoked through the Runtime service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L64)

<a id="field-field-mq3-game-g-main-runtime-gmainconsolefn-gmainconsolefn-src-mq3-game-g-main-ml-228311907"></a>
### gmainConsoleFn

```ml
gmainConsoleFn
```

Injected callback for gmain console; invoked through the Runtime service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L78)

<a id="field-field-mq3-game-g-main-runtime-gmaincontext-gmaincontext-src-mq3-game-g-main-ml-1984922127"></a>
### gmainContext

```ml
gmainContext
```

Caller context retained for game-module entry-point callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L58)

<a id="field-field-mq3-game-g-main-runtime-gmaindisconnectfn-gmaindisconnectfn-src-mq3-game-g-main-ml-172312949"></a>
### gmainDisconnectFn

```ml
gmainDisconnectFn
```

Injected callback for gmain disconnect; invoked through the Runtime service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L70)

<a id="field-field-mq3-game-g-main-runtime-gmainentitytext-gmainentitytext-src-mq3-game-g-main-ml-1470963665"></a>
### gmainEntityText

```ml
gmainEntityText
```

Map entity text supplied to game-module initialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L54)

<a id="field-field-mq3-game-g-main-runtime-gmainframefn-gmainframefn-src-mq3-game-g-main-ml-38427819"></a>
### gmainFrameFn

```ml
gmainFrameFn
```

Injected callback for gmain frame; invoked through the Runtime service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L76)

<a id="field-field-mq3-game-g-main-runtime-gmaininitfn-gmaininitfn-src-mq3-game-g-main-ml-1643038293"></a>
### gmainInitFn

```ml
gmainInitFn
```

Injected callback for gmain init; invoked through the Runtime service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L60)

<a id="field-field-mq3-game-g-main-runtime-gmainshutdownfn-gmainshutdownfn-src-mq3-game-g-main-ml-426494069"></a>
### gmainShutdownFn

```ml
gmainShutdownFn
```

Injected callback for gmain shutdown; invoked through the Runtime service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L62)

<a id="field-field-mq3-game-g-main-runtime-gmainthinkfn-gmainthinkfn-src-mq3-game-g-main-ml-1423122573"></a>
### gmainThinkFn

```ml
gmainThinkFn
```

Injected callback for gmain think; invoked through the Runtime service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L66)

<a id="field-field-mq3-game-g-main-runtime-gmainuserinfofn-gmainuserinfofn-src-mq3-game-g-main-ml-668621873"></a>
### gmainUserinfoFn

```ml
gmainUserinfoFn
```

Injected callback for gmain user information; invoked through the Runtime service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L68)

<a id="field-field-mq3-game-g-main-runtime-level-level-src-mq3-game-g-main-ml-1265450773"></a>
### level

```ml
level
```

Game-level state shared with the operation or runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L52)
