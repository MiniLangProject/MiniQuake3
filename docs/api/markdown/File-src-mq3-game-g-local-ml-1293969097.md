# `src/mq3/game/g_local.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_local`](Package-mq3-game-g-local-543846707.md)

Reachable from entry: **no**

## Declarations

<a id="constant-constant-mq3-game-g-local-body-queue-size-const-body-queue-size-8-src-mq3-game-g-local-ml-1799492099"></a>
### BODY_QUEUE_SIZE

```ml
const BODY_QUEUE_SIZE = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L10)

- [mq3.game.g_local.BotSettings](Type-mq3-game-g-local-botsettings-1300308977.md) — struct
<a id="constant-constant-mq3-game-g-local-carnage-reward-time-const-carnage-reward-time-3000-src-mq3-game-g-local-ml-1275290530"></a>
### CARNAGE_REWARD_TIME

```ml
const CARNAGE_REWARD_TIME = 3000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L13)

<a id="function-function-mq3-game-g-local-clientfieldnames-function-clientfieldnames-src-mq3-game-g-local-ml-1256232382"></a>
### clientFieldNames

```ml
function clientFieldNames()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L67)

- [mq3.game.g_local.ClientPersistant](Type-mq3-game-g-local-clientpersistant-183067153.md) — struct
- [mq3.game.g_local.ClientSession](Type-mq3-game-g-local-clientsession-83131860.md) — struct
<a id="constant-constant-mq3-game-g-local-con-connected-const-con-connected-2-src-mq3-game-g-local-ml-1064930569"></a>
### CON_CONNECTED

```ml
const CON_CONNECTED = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L35)

<a id="constant-constant-mq3-game-g-local-con-connecting-const-con-connecting-1-src-mq3-game-g-local-ml-825794048"></a>
### CON_CONNECTING

```ml
const CON_CONNECTING = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L34)

<a id="constant-constant-mq3-game-g-local-con-disconnected-const-con-disconnected-0-src-mq3-game-g-local-ml-2094094297"></a>
### CON_DISCONNECTED

```ml
const CON_DISCONNECTED = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L33)

<a id="constant-constant-mq3-game-g-local-damage-no-armor-const-damage-no-armor-2-src-mq3-game-g-local-ml-1165560785"></a>
### DAMAGE_NO_ARMOR

```ml
const DAMAGE_NO_ARMOR = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L51)

<a id="constant-constant-mq3-game-g-local-damage-no-knockback-const-damage-no-knockback-4-src-mq3-game-g-local-ml-947654431"></a>
### DAMAGE_NO_KNOCKBACK

```ml
const DAMAGE_NO_KNOCKBACK = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L52)

<a id="constant-constant-mq3-game-g-local-damage-no-protection-const-damage-no-protection-8-src-mq3-game-g-local-ml-813464199"></a>
### DAMAGE_NO_PROTECTION

```ml
const DAMAGE_NO_PROTECTION = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L53)

<a id="constant-constant-mq3-game-g-local-damage-no-team-protection-const-damage-no-team-protection-16-src-mq3-game-g-local-ml-1225243878"></a>
### DAMAGE_NO_TEAM_PROTECTION

```ml
const DAMAGE_NO_TEAM_PROTECTION = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L54)

<a id="constant-constant-mq3-game-g-local-damage-radius-const-damage-radius-1-src-mq3-game-g-local-ml-1329778816"></a>
### DAMAGE_RADIUS

```ml
const DAMAGE_RADIUS = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L50)

<a id="function-function-mq3-game-g-local-damageusesarmor-function-damageusesarmor-flags-src-mq3-game-g-local-ml-1395784225"></a>
### damageUsesArmor

```ml
function damageUsesArmor(flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L72)

<a id="function-function-mq3-game-g-local-declarationnames-function-declarationnames-src-mq3-game-g-local-ml-423205330"></a>
### declarationNames

```ml
function declarationNames()
```

Complete declaration inventory for static parity checks. Calls are routed to their owning game, syscall, bot or AAS module rather than duplicated here.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L85)

<a id="function-function-mq3-game-g-local-entityfieldnames-function-entityfieldnames-src-mq3-game-g-local-ml-1456149142"></a>
### entityFieldNames

```ml
function entityFieldNames()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L66)

<a id="constant-constant-mq3-game-g-local-fl-dropped-item-const-fl-dropped-item-4096-src-mq3-game-g-local-ml-1686861914"></a>
### FL_DROPPED_ITEM

```ml
const FL_DROPPED_ITEM = 4096
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L22)

<a id="constant-constant-mq3-game-g-local-fl-force-gesture-const-fl-force-gesture-32768-src-mq3-game-g-local-ml-1372516221"></a>
### FL_FORCE_GESTURE

```ml
const FL_FORCE_GESTURE = 32768
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L25)

<a id="constant-constant-mq3-game-g-local-fl-godmode-const-fl-godmode-16-src-mq3-game-g-local-ml-647314604"></a>
### FL_GODMODE

```ml
const FL_GODMODE = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L18)

<a id="constant-constant-mq3-game-g-local-fl-no-bots-const-fl-no-bots-8192-src-mq3-game-g-local-ml-1446986965"></a>
### FL_NO_BOTS

```ml
const FL_NO_BOTS = 8192
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L23)

<a id="constant-constant-mq3-game-g-local-fl-no-humans-const-fl-no-humans-16384-src-mq3-game-g-local-ml-1363782711"></a>
### FL_NO_HUMANS

```ml
const FL_NO_HUMANS = 16384
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L24)

<a id="constant-constant-mq3-game-g-local-fl-no-knockback-const-fl-no-knockback-2048-src-mq3-game-g-local-ml-113447747"></a>
### FL_NO_KNOCKBACK

```ml
const FL_NO_KNOCKBACK = 2048
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L21)

<a id="constant-constant-mq3-game-g-local-fl-notarget-const-fl-notarget-32-src-mq3-game-g-local-ml-815985860"></a>
### FL_NOTARGET

```ml
const FL_NOTARGET = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L19)

<a id="constant-constant-mq3-game-g-local-fl-teamslave-const-fl-teamslave-1024-src-mq3-game-g-local-ml-1108591482"></a>
### FL_TEAMSLAVE

```ml
const FL_TEAMSLAVE = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L20)

<a id="function-function-mq3-game-g-local-fofs-function-fofs-fieldname-src-mq3-game-g-local-ml-348543097"></a>
### FOFS

```ml
function FOFS(fieldName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fieldName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L75)

<a id="constant-constant-mq3-game-g-local-follow-active1-const-follow-active1-1-src-mq3-game-g-local-ml-30522503"></a>
### FOLLOW_ACTIVE1

```ml
const FOLLOW_ACTIVE1 = -1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L42)

<a id="constant-constant-mq3-game-g-local-follow-active2-const-follow-active2-2-src-mq3-game-g-local-ml-643173872"></a>
### FOLLOW_ACTIVE2

```ml
const FOLLOW_ACTIVE2 = -2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L43)

<a id="constant-constant-mq3-game-g-local-frametime-const-frametime-100-src-mq3-game-g-local-ml-1398937552"></a>
### FRAMETIME

```ml
const FRAMETIME = 100
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L12)

<a id="constant-constant-mq3-game-g-local-gameversion-const-gameversion-baseq3-src-mq3-game-g-local-ml-118836626"></a>
### GAMEVERSION

```ml
const GAMEVERSION = "baseq3"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L9)

<a id="constant-constant-mq3-game-g-local-infinite-const-infinite-1000000-src-mq3-game-g-local-ml-281346014"></a>
### INFINITE

```ml
const INFINITE = 1000000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L11)

<a id="constant-constant-mq3-game-g-local-intermission-delay-time-const-intermission-delay-time-1000-src-mq3-game-g-local-ml-1408950624"></a>
### INTERMISSION_DELAY_TIME

```ml
const INTERMISSION_DELAY_TIME = 1000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L15)

<a id="function-function-mq3-game-g-local-isfollowsentinel-function-isfollowsentinel-clientnum-src-mq3-game-g-local-ml-228251659"></a>
### isFollowSentinel

```ml
function isFollowSentinel(clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L71)

<a id="function-function-mq3-game-g-local-levelfieldnames-function-levelfieldnames-src-mq3-game-g-local-ml-1591622750"></a>
### levelFieldNames

```ml
function levelFieldNames()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L68)

<a id="constant-constant-mq3-game-g-local-max-filepath-const-max-filepath-144-src-mq3-game-g-local-ml-1462853418"></a>
### MAX_FILEPATH

```ml
const MAX_FILEPATH = 144
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L55)

<a id="constant-constant-mq3-game-g-local-max-netname-const-max-netname-36-src-mq3-game-g-local-ml-931811256"></a>
### MAX_NETNAME

```ml
const MAX_NETNAME = 36
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L45)

<a id="constant-constant-mq3-game-g-local-max-spawn-vars-const-max-spawn-vars-64-src-mq3-game-g-local-ml-1434929951"></a>
### MAX_SPAWN_VARS

```ml
const MAX_SPAWN_VARS = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L47)

<a id="constant-constant-mq3-game-g-local-max-spawn-vars-chars-const-max-spawn-vars-chars-4096-src-mq3-game-g-local-ml-755094046"></a>
### MAX_SPAWN_VARS_CHARS

```ml
const MAX_SPAWN_VARS_CHARS = 4096
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L48)

<a id="constant-constant-mq3-game-g-local-max-vote-count-const-max-vote-count-3-src-mq3-game-g-local-ml-1663764206"></a>
### MAX_VOTE_COUNT

```ml
const MAX_VOTE_COUNT = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L46)

<a id="constant-constant-mq3-game-g-local-mover-1to2-const-mover-1to2-2-src-mq3-game-g-local-ml-1624001159"></a>
### MOVER_1TO2

```ml
const MOVER_1TO2 = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L29)

<a id="constant-constant-mq3-game-g-local-mover-2to1-const-mover-2to1-3-src-mq3-game-g-local-ml-1378783336"></a>
### MOVER_2TO1

```ml
const MOVER_2TO1 = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L30)

<a id="constant-constant-mq3-game-g-local-mover-pos1-const-mover-pos1-0-src-mq3-game-g-local-ml-1161185067"></a>
### MOVER_POS1

```ml
const MOVER_POS1 = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L27)

<a id="constant-constant-mq3-game-g-local-mover-pos2-const-mover-pos2-1-src-mq3-game-g-local-ml-47350286"></a>
### MOVER_POS2

```ml
const MOVER_POS2 = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L28)

<a id="function-function-mq3-game-g-local-nextbodyqueueslot-function-nextbodyqueueslot-slot-src-mq3-game-g-local-ml-1306725498"></a>
### nextBodyQueueSlot

```ml
function nextBodyQueueSlot(slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L74)

- [mq3.game.g_local.PlayerTeamState](Type-mq3-game-g-local-playerteamstate-1913452256.md) — struct
<a id="constant-constant-mq3-game-g-local-reward-sprite-time-const-reward-sprite-time-2000-src-mq3-game-g-local-ml-17954315"></a>
### REWARD_SPRITE_TIME

```ml
const REWARD_SPRITE_TIME = 2000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L14)

<a id="constant-constant-mq3-game-g-local-sp-intermission-delay-time-const-sp-intermission-delay-time-5000-src-mq3-game-g-local-ml-1146691546"></a>
### SP_INTERMISSION_DELAY_TIME

```ml
const SP_INTERMISSION_DELAY_TIME = 5000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L16)

<a id="constant-constant-mq3-game-g-local-sp-podium-model-const-sp-podium-model-models-mapobjects-podium-podium4-md3-src-mq3-game-g-local-ml-1670433226"></a>
### SP_PODIUM_MODEL

```ml
const SP_PODIUM_MODEL = "models/mapobjects/podium/podium4.md3"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L31)

<a id="constant-constant-mq3-game-g-local-spectator-follow-const-spectator-follow-2-src-mq3-game-g-local-ml-953000033"></a>
### SPECTATOR_FOLLOW

```ml
const SPECTATOR_FOLLOW = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L38)

<a id="constant-constant-mq3-game-g-local-spectator-free-const-spectator-free-1-src-mq3-game-g-local-ml-738475762"></a>
### SPECTATOR_FREE

```ml
const SPECTATOR_FREE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L37)

<a id="constant-constant-mq3-game-g-local-spectator-not-const-spectator-not-0-src-mq3-game-g-local-ml-1824504351"></a>
### SPECTATOR_NOT

```ml
const SPECTATOR_NOT = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L36)

<a id="constant-constant-mq3-game-g-local-spectator-scoreboard-const-spectator-scoreboard-3-src-mq3-game-g-local-ml-1359951640"></a>
### SPECTATOR_SCOREBOARD

```ml
const SPECTATOR_SCOREBOARD = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L39)

<a id="constant-constant-mq3-game-g-local-team-active-const-team-active-1-src-mq3-game-g-local-ml-1927552664"></a>
### TEAM_ACTIVE

```ml
const TEAM_ACTIVE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L41)

<a id="constant-constant-mq3-game-g-local-team-begin-const-team-begin-0-src-mq3-game-g-local-ml-1895912435"></a>
### TEAM_BEGIN

```ml
const TEAM_BEGIN = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L40)

<a id="function-function-mq3-game-g-local-typenames-function-typenames-src-mq3-game-g-local-ml-847145790"></a>
### typeNames

```ml
function typeNames()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L65)

<a id="function-function-mq3-game-g-local-validmoverstate-function-validmoverstate-state-src-mq3-game-g-local-ml-1037133999"></a>
### validMoverState

```ml
function validMoverState(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L70)

<a id="function-function-mq3-game-g-local-validspawnstorage-function-validspawnstorage-paircount-charcount-src-mq3-game-g-local-ml-1263938536"></a>
### validSpawnStorage

```ml
function validSpawnStorage(pairCount, charCount)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pairCount` | `dynamic` | — |  |
| `charCount` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_local.ml#L73)
