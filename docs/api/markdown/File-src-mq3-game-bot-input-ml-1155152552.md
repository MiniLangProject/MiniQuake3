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

Bot input-action bit requesting affirmative.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L36)

<a id="constant-constant-mq3-game-bot-input-action-attack-const-action-attack-1-src-mq3-game-bot-input-ml-2037431106"></a>
### ACTION_ATTACK

```ml
const ACTION_ATTACK = 1
```

Bot input-action bit requesting attack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L10)

<a id="constant-constant-mq3-game-bot-input-action-crouch-const-action-crouch-128-src-mq3-game-bot-input-ml-1088579712"></a>
### ACTION_CROUCH

```ml
const ACTION_CROUCH = 128
```

Bot input-action bit requesting crouch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L18)

<a id="constant-constant-mq3-game-bot-input-action-delayedjump-const-action-delayedjump-32768-src-mq3-game-bot-input-ml-1295336241"></a>
### ACTION_DELAYEDJUMP

```ml
const ACTION_DELAYEDJUMP = 32768
```

Bot input-action bit requesting delayedjump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L28)

<a id="constant-constant-mq3-game-bot-input-action-followme-const-action-followme-134217728-src-mq3-game-bot-input-ml-265755464"></a>
### ACTION_FOLLOWME

```ml
const ACTION_FOLLOWME = 134217728
```

Bot input-action bit requesting followme.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L46)

<a id="constant-constant-mq3-game-bot-input-action-gesture-const-action-gesture-131072-src-mq3-game-bot-input-ml-1094076711"></a>
### ACTION_GESTURE

```ml
const ACTION_GESTURE = 131072
```

Bot input-action bit requesting gesture.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L32)

<a id="constant-constant-mq3-game-bot-input-action-getflag-const-action-getflag-8388608-src-mq3-game-bot-input-ml-1472837764"></a>
### ACTION_GETFLAG

```ml
const ACTION_GETFLAG = 8388608
```

Bot input-action bit requesting capture the flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L40)

<a id="constant-constant-mq3-game-bot-input-action-guardbase-const-action-guardbase-16777216-src-mq3-game-bot-input-ml-463748426"></a>
### ACTION_GUARDBASE

```ml
const ACTION_GUARDBASE = 16777216
```

Bot input-action bit requesting guardbase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L42)

<a id="constant-constant-mq3-game-bot-input-action-jump-const-action-jump-16-src-mq3-game-bot-input-ml-334670122"></a>
### ACTION_JUMP

```ml
const ACTION_JUMP = 16
```

Bot input-action bit requesting jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L16)

<a id="constant-constant-mq3-game-bot-input-action-moveback-const-action-moveback-2048-src-mq3-game-bot-input-ml-1831442651"></a>
### ACTION_MOVEBACK

```ml
const ACTION_MOVEBACK = 2048
```

Bot input-action bit requesting moveback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L22)

<a id="constant-constant-mq3-game-bot-input-action-moveforward-const-action-moveforward-512-src-mq3-game-bot-input-ml-1672741213"></a>
### ACTION_MOVEFORWARD

```ml
const ACTION_MOVEFORWARD = 512
```

Bot input-action bit requesting moveforward.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L20)

<a id="constant-constant-mq3-game-bot-input-action-moveleft-const-action-moveleft-4096-src-mq3-game-bot-input-ml-306440126"></a>
### ACTION_MOVELEFT

```ml
const ACTION_MOVELEFT = 4096
```

Bot input-action bit requesting moveleft.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L24)

<a id="constant-constant-mq3-game-bot-input-action-moveright-const-action-moveright-8192-src-mq3-game-bot-input-ml-1880835747"></a>
### ACTION_MOVERIGHT

```ml
const ACTION_MOVERIGHT = 8192
```

Bot input-action bit requesting moveright.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L26)

<a id="constant-constant-mq3-game-bot-input-action-negative-const-action-negative-2097152-src-mq3-game-bot-input-ml-1292531903"></a>
### ACTION_NEGATIVE

```ml
const ACTION_NEGATIVE = 2097152
```

Bot input-action bit requesting negative.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L38)

<a id="constant-constant-mq3-game-bot-input-action-patrol-const-action-patrol-33554432-src-mq3-game-bot-input-ml-2012779324"></a>
### ACTION_PATROL

```ml
const ACTION_PATROL = 33554432
```

Bot input-action bit requesting patrol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L44)

<a id="constant-constant-mq3-game-bot-input-action-respawn-const-action-respawn-8-src-mq3-game-bot-input-ml-554025869"></a>
### ACTION_RESPAWN

```ml
const ACTION_RESPAWN = 8
```

Bot input-action bit requesting respawn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L14)

<a id="constant-constant-mq3-game-bot-input-action-talk-const-action-talk-65536-src-mq3-game-bot-input-ml-475679436"></a>
### ACTION_TALK

```ml
const ACTION_TALK = 65536
```

Bot input-action bit requesting talk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L30)

<a id="constant-constant-mq3-game-bot-input-action-use-const-action-use-2-src-mq3-game-bot-input-ml-1617897977"></a>
### ACTION_USE

```ml
const ACTION_USE = 2
```

Bot input-action bit requesting use.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L12)

<a id="constant-constant-mq3-game-bot-input-action-walk-const-action-walk-524288-src-mq3-game-bot-input-ml-1546751372"></a>
### ACTION_WALK

```ml
const ACTION_WALK = 524288
```

Bot input-action bit requesting walk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L34)

<a id="function-function-mq3-game-bot-input-addmove-function-addmove-value-delta-src-mq3-game-bot-input-ml-2097103073"></a>
### addMove

```ml
function addMove(value, delta)
```

Forward `addMove` to `mq3.compat.numeric.i8` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `n.i8(value+delta)`. |
| `delta` | `dynamic` | — | Operand used to evaluate the returned expression `n.i8(value+delta)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L180)

<a id="function-function-mq3-game-bot-input-angledifference-function-angledifference-a-b-src-mq3-game-bot-input-ml-1853987663"></a>
### angleDifference

```ml
function angleDifference(a, b)
```

Compute the shortest signed angular difference used by bot view steering.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fsub`. |
| `b` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fsub`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L124)

<a id="function-function-mq3-game-bot-input-anglemod-function-anglemod-value-src-mq3-game-bot-input-ml-74544617"></a>
### angleMod

```ml
function angleMod(value)
```

Wrap an angle using the Quake III fixed-point angle representation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.shared.math.AngleNormalize360`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L112)

<a id="function-function-mq3-game-bot-input-angletoshort-function-angletoshort-value-src-mq3-game-bot-input-ml-1721910053"></a>
### angleToShort

```ml
function angleToShort(value)
```

Convert a degree angle into the signed sixteen-bit network user-command representation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.f32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L118)

- [mq3.game.bot_input.BotInput](Type-mq3-game-bot-input-botinput-701196905.md) — struct
<a id="constant-constant-mq3-game-bot-input-button-affirmative-const-button-affirmative-32-src-mq3-game-bot-input-ml-1610381276"></a>
### BUTTON_AFFIRMATIVE

```ml
const BUTTON_AFFIRMATIVE = 32
```

User-command button-mask bit requesting affirmative.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L59)

<a id="constant-constant-mq3-game-bot-input-button-attack-const-button-attack-1-src-mq3-game-bot-input-ml-404124370"></a>
### BUTTON_ATTACK

```ml
const BUTTON_ATTACK = 1
```

User-command button-mask bit requesting attack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L49)

<a id="constant-constant-mq3-game-bot-input-button-followme-const-button-followme-1024-src-mq3-game-bot-input-ml-605864378"></a>
### BUTTON_FOLLOWME

```ml
const BUTTON_FOLLOWME = 1024
```

User-command button-mask bit requesting followme.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L69)

<a id="constant-constant-mq3-game-bot-input-button-gesture-const-button-gesture-8-src-mq3-game-bot-input-ml-883492639"></a>
### BUTTON_GESTURE

```ml
const BUTTON_GESTURE = 8
```

User-command button-mask bit requesting gesture.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L55)

<a id="constant-constant-mq3-game-bot-input-button-getflag-const-button-getflag-128-src-mq3-game-bot-input-ml-2118478656"></a>
### BUTTON_GETFLAG

```ml
const BUTTON_GETFLAG = 128
```

User-command button-mask bit requesting capture the flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L63)

<a id="constant-constant-mq3-game-bot-input-button-guardbase-const-button-guardbase-256-src-mq3-game-bot-input-ml-352904000"></a>
### BUTTON_GUARDBASE

```ml
const BUTTON_GUARDBASE = 256
```

User-command button-mask bit requesting guardbase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L65)

<a id="constant-constant-mq3-game-bot-input-button-negative-const-button-negative-64-src-mq3-game-bot-input-ml-229310667"></a>
### BUTTON_NEGATIVE

```ml
const BUTTON_NEGATIVE = 64
```

User-command button-mask bit requesting negative.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L61)

<a id="constant-constant-mq3-game-bot-input-button-patrol-const-button-patrol-512-src-mq3-game-bot-input-ml-1984927237"></a>
### BUTTON_PATROL

```ml
const BUTTON_PATROL = 512
```

User-command button-mask bit requesting patrol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L67)

<a id="constant-constant-mq3-game-bot-input-button-talk-const-button-talk-2-src-mq3-game-bot-input-ml-671300471"></a>
### BUTTON_TALK

```ml
const BUTTON_TALK = 2
```

User-command button-mask bit requesting talk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L51)

<a id="constant-constant-mq3-game-bot-input-button-use-holdable-const-button-use-holdable-4-src-mq3-game-bot-input-ml-308470001"></a>
### BUTTON_USE_HOLDABLE

```ml
const BUTTON_USE_HOLDABLE = 4
```

User-command button-mask bit requesting use holdable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L53)

<a id="constant-constant-mq3-game-bot-input-button-walking-const-button-walking-16-src-mq3-game-bot-input-ml-652608848"></a>
### BUTTON_WALKING

```ml
const BUTTON_WALKING = 16
```

User-command button-mask bit requesting walking.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L57)

<a id="function-function-mq3-game-bot-input-changeviewangle-function-changeviewangle-angle-ideal-speed-src-mq3-game-bot-input-ml-1840539991"></a>
### changeViewAngle

```ml
function changeViewAngle(angle, ideal, speed)
```

Move one bot view angle toward its target with the specified maximum angular change.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angle` | `dynamic` | — | Value passed as argument 1 to `mq3.shared.math.AngleNormalize360`. |
| `ideal` | `dynamic` | — | Value passed as argument 1 to `mq3.shared.math.AngleNormalize360`. |
| `speed` | `dynamic` | — | Requested movement speed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L134)

<a id="function-function-mq3-game-bot-input-changeviewangles-function-changeviewangles-services-bot-thinktime-src-mq3-game-bot-input-ml-1376037976"></a>
### changeViewAngles

```ml
function changeViewAngles(services, bot, thinktime)
```

Update `bot.idealViewangles[0]`, `bot.viewangles[axis]`, `bot.idealViewangles[axis]` and `bot.viewanglespeed[axis]` and related state during `changeViewAngles`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `characteristicFloatFn`, `challenge` and `viewFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `idealViewangles`, `enemy`, `character`, `viewangles` and `viewanglespeed` and related fields. May update `bot.idealViewangles[0]`, `bot.viewangles[axis]` and `bot.idealViewangles[axis]` and additional fields in place. |
| `thinktime` | `dynamic` | — | Bot thinking interval in seconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L148)

<a id="constant-constant-mq3-game-bot-input-characteristic-view-factor-const-characteristic-view-factor-headers-characteristic-view-factor-src-mq3-game-bot-input-ml-1135412466"></a>
### CHARACTERISTIC_VIEW_FACTOR

```ml
const CHARACTERISTIC_VIEW_FACTOR = headers.CHARACTERISTIC_VIEW_FACTOR
```

Bot-character characteristic index for view factor. Definition: view angle difference to angle change factor float <0, 1].


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L72)

<a id="constant-constant-mq3-game-bot-input-characteristic-view-maxchange-const-characteristic-view-maxchange-headers-characteristic-view-maxchange-src-mq3-game-bot-input-ml-1348710819"></a>
### CHARACTERISTIC_VIEW_MAXCHANGE

```ml
const CHARACTERISTIC_VIEW_MAXCHANGE = headers.CHARACTERISTIC_VIEW_MAXCHANGE
```

Bot-character characteristic index for view maxchange. Definition: maximum view angle change float [1, 360].


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L75)

<a id="function-function-mq3-game-bot-input-create-function-create-src-mq3-game-bot-input-ml-617923714"></a>
### create

```ml
function create()
```

Create a `mq3.game.bot_input.Services` record with the declared empty defaults.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L107)

<a id="function-function-mq3-game-bot-input-inputtousercommand-function-inputtousercommand-input-command-deltaangles-time-src-mq3-game-bot-input-ml-1717469422"></a>
### inputToUserCommand

```ml
function inputToUserCommand(input, command, deltaAngles, time)
```

Update `command.serverTime`, `command.buttons`, `command.angles` and `command.weapon` and related state during `inputToUserCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — | Input record; accesses `actionflags`, `weapon`, `viewangles`, `dir` and `speed`. May update `input.actionflags` and `input.speed` in place. |
| `command` | `dynamic` | — | Command record; accesses `serverTime`, `buttons`, `angles`, `weapon` and `forwardmove` and related fields. May update `command.serverTime`, `command.buttons` and `command.angles` and additional fields in place. |
| `deltaAngles` | `dynamic` | — | Array or byte sequence accessed at `axis`. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L186)

- [mq3.game.bot_input.Services](Type-mq3-game-bot-input-services-1485568830.md) — struct
<a id="function-function-mq3-game-bot-input-shorttoangle-function-shorttoangle-value-src-mq3-game-bot-input-ml-1429475481"></a>
### shortToAngle

```ml
function shortToAngle(value)
```

Return the result of `n.fmul(n.i16(value),n.f32(360.0/65536.0))` for `shortToAngle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.i16`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L115)

<a id="function-function-mq3-game-bot-input-updateinput-function-updateinput-services-bot-command-time-elapsed-src-mq3-game-bot-input-ml-51987223"></a>
### updateInput

```ml
function updateInput(services, bot, command, time, elapsed)
```

Update `bot.viewangles[axis]` during `updateInput`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `getInputFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `viewangles`, `curPs` and `client`. May update `bot.viewangles[axis]` in place. |
| `command` | `dynamic` | — | Command record; accesses `buttons`. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |
| `elapsed` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fdiv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L219)
