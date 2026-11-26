# `src/mq3/game/g_public.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_public`](Package-mq3-game-g-public-1758405289.md)

Reachable from entry: **yes**

## Declarations

<a id="constant-constant-mq3-game-g-public-botai-start-frame-const-botai-start-frame-10-src-mq3-game-g-public-ml-1975919684"></a>
### BOTAI_START_FRAME

```ml
const BOTAI_START_FRAME = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L29)

- [mq3.game.g_public.EntityShared](Type-mq3-game-g-public-entityshared-755370735.md) — struct
<a id="constant-constant-mq3-game-g-public-game-api-version-const-game-api-version-8-src-mq3-game-g-public-ml-1709558291"></a>
### GAME_API_VERSION

```ml
const GAME_API_VERSION = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L7)

<a id="constant-constant-mq3-game-g-public-game-client-begin-const-game-client-begin-3-src-mq3-game-g-public-ml-454027614"></a>
### GAME_CLIENT_BEGIN

```ml
const GAME_CLIENT_BEGIN = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L22)

<a id="constant-constant-mq3-game-g-public-game-client-command-const-game-client-command-6-src-mq3-game-g-public-ml-1914157379"></a>
### GAME_CLIENT_COMMAND

```ml
const GAME_CLIENT_COMMAND = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L25)

<a id="constant-constant-mq3-game-g-public-game-client-connect-const-game-client-connect-2-src-mq3-game-g-public-ml-1667415827"></a>
### GAME_CLIENT_CONNECT

```ml
const GAME_CLIENT_CONNECT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L21)

<a id="constant-constant-mq3-game-g-public-game-client-disconnect-const-game-client-disconnect-5-src-mq3-game-g-public-ml-1847391896"></a>
### GAME_CLIENT_DISCONNECT

```ml
const GAME_CLIENT_DISCONNECT = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L24)

<a id="constant-constant-mq3-game-g-public-game-client-think-const-game-client-think-7-src-mq3-game-g-public-ml-1737053210"></a>
### GAME_CLIENT_THINK

```ml
const GAME_CLIENT_THINK = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L26)

<a id="constant-constant-mq3-game-g-public-game-client-userinfo-changed-const-game-client-userinfo-changed-4-src-mq3-game-g-public-ml-1766784589"></a>
### GAME_CLIENT_USERINFO_CHANGED

```ml
const GAME_CLIENT_USERINFO_CHANGED = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L23)

<a id="constant-constant-mq3-game-g-public-game-console-command-const-game-console-command-9-src-mq3-game-g-public-ml-1516213798"></a>
### GAME_CONSOLE_COMMAND

```ml
const GAME_CONSOLE_COMMAND = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L28)

<a id="constant-constant-mq3-game-g-public-game-init-const-game-init-0-src-mq3-game-g-public-ml-739829685"></a>
### GAME_INIT

```ml
const GAME_INIT = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L19)

<a id="constant-constant-mq3-game-g-public-game-run-frame-const-game-run-frame-8-src-mq3-game-g-public-ml-281431595"></a>
### GAME_RUN_FRAME

```ml
const GAME_RUN_FRAME = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L27)

<a id="constant-constant-mq3-game-g-public-game-shutdown-const-game-shutdown-1-src-mq3-game-g-public-ml-2039059404"></a>
### GAME_SHUTDOWN

```ml
const GAME_SHUTDOWN = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L20)

<a id="function-function-mq3-game-g-public-sendstoclient-function-sendstoclient-svflags-singleclient-clientnum-src-mq3-game-g-public-ml-158333076"></a>
### sendsToClient

```ml
function sendsToClient(svFlags, singleClient, clientNum)
```

Apply NOCLIENT, SINGLECLIENT, NOTSINGLECLIENT and CLIENTMASK visibility flags to a client slot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `svFlags` | `dynamic` | — | Value used by `sendsToClient` in `if (svFlags&SVF_NOCLIENT)!=0 then return false end if`. |
| `singleClient` | `dynamic` | — | Operand used to evaluate the returned expression `(singleClient&(1<<clientNum))!=0`. |
| `clientNum` | `dynamic` | — | Client slot number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L42)

- [mq3.game.g_public.SharedEntity](Type-mq3-game-g-public-sharedentity-526774383.md) — struct
<a id="constant-constant-mq3-game-g-public-svf-bot-const-svf-bot-8-src-mq3-game-g-public-ml-1983738061"></a>
### SVF_BOT

```ml
const SVF_BOT = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L10)

<a id="constant-constant-mq3-game-g-public-svf-broadcast-const-svf-broadcast-32-src-mq3-game-g-public-ml-195521636"></a>
### SVF_BROADCAST

```ml
const SVF_BROADCAST = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L11)

<a id="constant-constant-mq3-game-g-public-svf-capsule-const-svf-capsule-1024-src-mq3-game-g-public-ml-2136283942"></a>
### SVF_CAPSULE

```ml
const SVF_CAPSULE = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L16)

<a id="constant-constant-mq3-game-g-public-svf-clientmask-const-svf-clientmask-2-src-mq3-game-g-public-ml-211693095"></a>
### SVF_CLIENTMASK

```ml
const SVF_CLIENTMASK = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L9)

<a id="constant-constant-mq3-game-g-public-svf-noclient-const-svf-noclient-1-src-mq3-game-g-public-ml-1580333434"></a>
### SVF_NOCLIENT

```ml
const SVF_NOCLIENT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L8)

<a id="constant-constant-mq3-game-g-public-svf-noserverinfo-const-svf-noserverinfo-512-src-mq3-game-g-public-ml-729721855"></a>
### SVF_NOSERVERINFO

```ml
const SVF_NOSERVERINFO = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L15)

<a id="constant-constant-mq3-game-g-public-svf-notsingleclient-const-svf-notsingleclient-2048-src-mq3-game-g-public-ml-715471177"></a>
### SVF_NOTSINGLECLIENT

```ml
const SVF_NOTSINGLECLIENT = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L17)

<a id="constant-constant-mq3-game-g-public-svf-portal-const-svf-portal-64-src-mq3-game-g-public-ml-827483003"></a>
### SVF_PORTAL

```ml
const SVF_PORTAL = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L12)

<a id="constant-constant-mq3-game-g-public-svf-singleclient-const-svf-singleclient-256-src-mq3-game-g-public-ml-1686809070"></a>
### SVF_SINGLECLIENT

```ml
const SVF_SINGLECLIENT = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L14)

<a id="constant-constant-mq3-game-g-public-svf-use-current-origin-const-svf-use-current-origin-128-src-mq3-game-g-public-ml-619349060"></a>
### SVF_USE_CURRENT_ORIGIN

```ml
const SVF_USE_CURRENT_ORIGIN = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L13)

<a id="function-function-mq3-game-g-public-typenames-function-typenames-src-mq3-game-g-public-ml-2132833358"></a>
### typeNames

```ml
function typeNames()
```

Return a new array `["entityShared_t","sharedEntity_t"]` for `typeNames`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_public.ml#L36)
