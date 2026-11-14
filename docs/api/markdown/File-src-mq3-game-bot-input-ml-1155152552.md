# `src/mq3/game/bot_input.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_input`](Package-mq3-game-bot-input-215888712.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="constant-constant-mq3-game-bot-input-action-affirmative-const-action-affirmative-1048576-src-mq3-game-bot-input-ml-611112480"></a>
### ACTION_AFFIRMATIVE

```ml
const ACTION_AFFIRMATIVE = 1048576
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L22)

<a id="constant-constant-mq3-game-bot-input-action-attack-const-action-attack-1-src-mq3-game-bot-input-ml-2037431106"></a>
### ACTION_ATTACK

```ml
const ACTION_ATTACK = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L9)

<a id="constant-constant-mq3-game-bot-input-action-crouch-const-action-crouch-128-src-mq3-game-bot-input-ml-1088579712"></a>
### ACTION_CROUCH

```ml
const ACTION_CROUCH = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L13)

<a id="constant-constant-mq3-game-bot-input-action-delayedjump-const-action-delayedjump-32768-src-mq3-game-bot-input-ml-1295336241"></a>
### ACTION_DELAYEDJUMP

```ml
const ACTION_DELAYEDJUMP = 32768
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L18)

<a id="constant-constant-mq3-game-bot-input-action-followme-const-action-followme-134217728-src-mq3-game-bot-input-ml-265755464"></a>
### ACTION_FOLLOWME

```ml
const ACTION_FOLLOWME = 134217728
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L27)

<a id="constant-constant-mq3-game-bot-input-action-gesture-const-action-gesture-131072-src-mq3-game-bot-input-ml-1094076711"></a>
### ACTION_GESTURE

```ml
const ACTION_GESTURE = 131072
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L20)

<a id="constant-constant-mq3-game-bot-input-action-getflag-const-action-getflag-8388608-src-mq3-game-bot-input-ml-1472837764"></a>
### ACTION_GETFLAG

```ml
const ACTION_GETFLAG = 8388608
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L24)

<a id="constant-constant-mq3-game-bot-input-action-guardbase-const-action-guardbase-16777216-src-mq3-game-bot-input-ml-463748426"></a>
### ACTION_GUARDBASE

```ml
const ACTION_GUARDBASE = 16777216
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L25)

<a id="constant-constant-mq3-game-bot-input-action-jump-const-action-jump-16-src-mq3-game-bot-input-ml-334670122"></a>
### ACTION_JUMP

```ml
const ACTION_JUMP = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L12)

<a id="constant-constant-mq3-game-bot-input-action-moveback-const-action-moveback-2048-src-mq3-game-bot-input-ml-1831442651"></a>
### ACTION_MOVEBACK

```ml
const ACTION_MOVEBACK = 2048
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L15)

<a id="constant-constant-mq3-game-bot-input-action-moveforward-const-action-moveforward-512-src-mq3-game-bot-input-ml-1672741213"></a>
### ACTION_MOVEFORWARD

```ml
const ACTION_MOVEFORWARD = 512
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L14)

<a id="constant-constant-mq3-game-bot-input-action-moveleft-const-action-moveleft-4096-src-mq3-game-bot-input-ml-306440126"></a>
### ACTION_MOVELEFT

```ml
const ACTION_MOVELEFT = 4096
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L16)

<a id="constant-constant-mq3-game-bot-input-action-moveright-const-action-moveright-8192-src-mq3-game-bot-input-ml-1880835747"></a>
### ACTION_MOVERIGHT

```ml
const ACTION_MOVERIGHT = 8192
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L17)

<a id="constant-constant-mq3-game-bot-input-action-negative-const-action-negative-2097152-src-mq3-game-bot-input-ml-1292531903"></a>
### ACTION_NEGATIVE

```ml
const ACTION_NEGATIVE = 2097152
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L23)

<a id="constant-constant-mq3-game-bot-input-action-patrol-const-action-patrol-33554432-src-mq3-game-bot-input-ml-2012779324"></a>
### ACTION_PATROL

```ml
const ACTION_PATROL = 33554432
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L26)

<a id="constant-constant-mq3-game-bot-input-action-respawn-const-action-respawn-8-src-mq3-game-bot-input-ml-554025869"></a>
### ACTION_RESPAWN

```ml
const ACTION_RESPAWN = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L11)

<a id="constant-constant-mq3-game-bot-input-action-talk-const-action-talk-65536-src-mq3-game-bot-input-ml-475679436"></a>
### ACTION_TALK

```ml
const ACTION_TALK = 65536
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L19)

<a id="constant-constant-mq3-game-bot-input-action-use-const-action-use-2-src-mq3-game-bot-input-ml-1617897977"></a>
### ACTION_USE

```ml
const ACTION_USE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L10)

<a id="constant-constant-mq3-game-bot-input-action-walk-const-action-walk-524288-src-mq3-game-bot-input-ml-1546751372"></a>
### ACTION_WALK

```ml
const ACTION_WALK = 524288
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L21)

<a id="function-function-mq3-game-bot-input-addmove-function-addmove-value-delta-src-mq3-game-bot-input-ml-2097103073"></a>
### addMove

```ml
function addMove(value, delta)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `delta` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L111)

<a id="function-function-mq3-game-bot-input-angledifference-function-angledifference-a-b-src-mq3-game-bot-input-ml-1853987663"></a>
### angleDifference

```ml
function angleDifference(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L66)

<a id="function-function-mq3-game-bot-input-anglemod-function-anglemod-value-src-mq3-game-bot-input-ml-74544617"></a>
### angleMod

```ml
function angleMod(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L61)

<a id="function-function-mq3-game-bot-input-angletoshort-function-angletoshort-value-src-mq3-game-bot-input-ml-1721910053"></a>
### angleToShort

```ml
function angleToShort(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L63)

- [mq3.game.bot_input.BotInput](Type-mq3-game-bot-input-botinput-701196905.md) — struct
<a id="constant-constant-mq3-game-bot-input-button-affirmative-const-button-affirmative-32-src-mq3-game-bot-input-ml-1610381276"></a>
### BUTTON_AFFIRMATIVE

```ml
const BUTTON_AFFIRMATIVE = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L34)

<a id="constant-constant-mq3-game-bot-input-button-attack-const-button-attack-1-src-mq3-game-bot-input-ml-404124370"></a>
### BUTTON_ATTACK

```ml
const BUTTON_ATTACK = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L29)

<a id="constant-constant-mq3-game-bot-input-button-followme-const-button-followme-1024-src-mq3-game-bot-input-ml-605864378"></a>
### BUTTON_FOLLOWME

```ml
const BUTTON_FOLLOWME = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L39)

<a id="constant-constant-mq3-game-bot-input-button-gesture-const-button-gesture-8-src-mq3-game-bot-input-ml-883492639"></a>
### BUTTON_GESTURE

```ml
const BUTTON_GESTURE = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L32)

<a id="constant-constant-mq3-game-bot-input-button-getflag-const-button-getflag-128-src-mq3-game-bot-input-ml-2118478656"></a>
### BUTTON_GETFLAG

```ml
const BUTTON_GETFLAG = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L36)

<a id="constant-constant-mq3-game-bot-input-button-guardbase-const-button-guardbase-256-src-mq3-game-bot-input-ml-352904000"></a>
### BUTTON_GUARDBASE

```ml
const BUTTON_GUARDBASE = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L37)

<a id="constant-constant-mq3-game-bot-input-button-negative-const-button-negative-64-src-mq3-game-bot-input-ml-229310667"></a>
### BUTTON_NEGATIVE

```ml
const BUTTON_NEGATIVE = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L35)

<a id="constant-constant-mq3-game-bot-input-button-patrol-const-button-patrol-512-src-mq3-game-bot-input-ml-1984927237"></a>
### BUTTON_PATROL

```ml
const BUTTON_PATROL = 512
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L38)

<a id="constant-constant-mq3-game-bot-input-button-talk-const-button-talk-2-src-mq3-game-bot-input-ml-671300471"></a>
### BUTTON_TALK

```ml
const BUTTON_TALK = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L30)

<a id="constant-constant-mq3-game-bot-input-button-use-holdable-const-button-use-holdable-4-src-mq3-game-bot-input-ml-308470001"></a>
### BUTTON_USE_HOLDABLE

```ml
const BUTTON_USE_HOLDABLE = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L31)

<a id="constant-constant-mq3-game-bot-input-button-walking-const-button-walking-16-src-mq3-game-bot-input-ml-652608848"></a>
### BUTTON_WALKING

```ml
const BUTTON_WALKING = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L33)

<a id="function-function-mq3-game-bot-input-changeviewangle-function-changeviewangle-angle-ideal-speed-src-mq3-game-bot-input-ml-1840539991"></a>
### changeViewAngle

```ml
function changeViewAngle(angle, ideal, speed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angle` | `dynamic` | — |  |
| `ideal` | `dynamic` | — |  |
| `speed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L72)

<a id="function-function-mq3-game-bot-input-changeviewangles-function-changeviewangles-services-bot-thinktime-src-mq3-game-bot-input-ml-1376037976"></a>
### changeViewAngles

```ml
function changeViewAngles(services, bot, thinktime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `thinktime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L82)

<a id="constant-constant-mq3-game-bot-input-characteristic-view-factor-const-characteristic-view-factor-headers-characteristic-view-factor-src-mq3-game-bot-input-ml-1135412466"></a>
### CHARACTERISTIC_VIEW_FACTOR

```ml
const CHARACTERISTIC_VIEW_FACTOR = headers.CHARACTERISTIC_VIEW_FACTOR
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L40)

<a id="constant-constant-mq3-game-bot-input-characteristic-view-maxchange-const-characteristic-view-maxchange-headers-characteristic-view-maxchange-src-mq3-game-bot-input-ml-1348710819"></a>
### CHARACTERISTIC_VIEW_MAXCHANGE

```ml
const CHARACTERISTIC_VIEW_MAXCHANGE = headers.CHARACTERISTIC_VIEW_MAXCHANGE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L41)

<a id="function-function-mq3-game-bot-input-create-function-create-src-mq3-game-bot-input-ml-617923714"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L58)

<a id="function-function-mq3-game-bot-input-inputtousercommand-function-inputtousercommand-input-command-deltaangles-time-src-mq3-game-bot-input-ml-1717469422"></a>
### inputToUserCommand

```ml
function inputToUserCommand(input, command, deltaAngles, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `deltaAngles` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L112)

- [mq3.game.bot_input.Services](Type-mq3-game-bot-input-services-1485568830.md) — struct
<a id="function-function-mq3-game-bot-input-shorttoangle-function-shorttoangle-value-src-mq3-game-bot-input-ml-1429475481"></a>
### shortToAngle

```ml
function shortToAngle(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L62)

<a id="function-function-mq3-game-bot-input-updateinput-function-updateinput-services-bot-command-time-elapsed-src-mq3-game-bot-input-ml-51987223"></a>
### updateInput

```ml
function updateInput(services, bot, command, time, elapsed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `elapsed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L139)
