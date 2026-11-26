# `src/mq3/game/client_active.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.client_active`](Package-mq3-game-client-active-2125941284.md)

Reachable from entry: **no**

## Imports

- `mq3/collision/brush.ml` as `brush` → [src/mq3/collision/brush.ml](File-src-mq3-collision-brush-ml-582513812.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/client_frame.ml` as `clientFrame` → [src/mq3/game/client_frame.ml](File-src-mq3-game-client-frame-ml-1603528079.md)
- `mq3/game/combat.ml` as `combat` → [src/mq3/game/combat.ml](File-src-mq3-game-combat-ml-473208184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/follow_commands.ml` as `followCommands` → [src/mq3/game/follow_commands.ml](File-src-mq3-game-follow-commands-ml-511973794.md)
- `mq3/game/g_items.ml` as `gItems` → [src/mq3/game/g_items.ml](File-src-mq3-game-g-items-ml-1981196396.md)
- `mq3/game/g_misc.ml` as `gMisc` → [src/mq3/game/g_misc.ml](File-src-mq3-game-g-misc-ml-587221462.md)
- `mq3/game/g_weapon.ml` as `completeWeapons` → [src/mq3/game/g_weapon.ml](File-src-mq3-game-g-weapon-ml-2045534346.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)
- `mq3/game/missiles.ml` as `missiles` → [src/mq3/game/missiles.ml](File-src-mq3-game-missiles-ml-1154787103.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/player_spawns.ml` as `spawns` → [src/mq3/game/player_spawns.ml](File-src-mq3-game-player-spawns-ml-1960128696.md)
- `mq3/game/pmove.ml` as `pmove` → [src/mq3/game/pmove.ml](File-src-mq3-game-pmove-ml-1046301421.md)
- `mq3/game/snapshot.ml` as `snapshot` → [src/mq3/game/snapshot.ml](File-src-mq3-game-snapshot-ml-1144176980.md)
- `mq3/game/teleport.ml` as `teleport` → [src/mq3/game/teleport.ml](File-src-mq3-game-teleport-ml-594448221.md)
- `mq3/game/triggers.ml` as `triggers` → [src/mq3/game/triggers.ml](File-src-mq3-game-triggers-ml-802018551.md)
- `mq3/game/weapons.ml` as `activeWeapons` → [src/mq3/game/weapons.ml](File-src-mq3-game-weapons-ml-121002605.md)
- `mq3/server/world.ml` as `sv` → [src/mq3/server/world.ml](File-src-mq3-server-world-ml-118313937.md)

## Declarations

<a id="constant-constant-mq3-game-client-active-award-mask-const-award-mask-231496-src-mq3-game-client-active-ml-1032890610"></a>
### AWARD_MASK

```ml
const AWARD_MASK = 231496
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L34)

<a id="constant-constant-mq3-game-client-active-button-attack-const-button-attack-1-src-mq3-game-client-active-ml-891113766"></a>
### BUTTON_ATTACK

```ml
const BUTTON_ATTACK = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L28)

<a id="constant-constant-mq3-game-client-active-button-gesture-const-button-gesture-8-src-mq3-game-client-active-ml-982936047"></a>
### BUTTON_GESTURE

```ml
const BUTTON_GESTURE = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L31)

<a id="constant-constant-mq3-game-client-active-button-talk-const-button-talk-2-src-mq3-game-client-active-ml-520809367"></a>
### BUTTON_TALK

```ml
const BUTTON_TALK = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L29)

<a id="constant-constant-mq3-game-client-active-button-use-holdable-const-button-use-holdable-4-src-mq3-game-client-active-ml-1627713997"></a>
### BUTTON_USE_HOLDABLE

```ml
const BUTTON_USE_HOLDABLE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L30)

<a id="function-function-mq3-game-client-active-clientevents-function-clientevents-level-ent-oldeventsequence-src-mq3-game-client-active-ml-519273269"></a>
### clientEvents

```ml
function clientEvents(level, ent, oldEventSequence)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `oldEventSequence` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L152)

<a id="function-function-mq3-game-client-active-command-function-command-client-src-mq3-game-client-active-ml-1825057625"></a>
### command

```ml
function command(client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L59)

<a id="function-function-mq3-game-client-active-configuremove-function-configuremove-level-ent-cmd-src-mq3-game-client-active-ml-2051820087"></a>
### configureMove

```ml
function configureMove(level, ent, cmd)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `cmd` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L191)

<a id="constant-constant-mq3-game-client-active-contents-body-const-contents-body-headers-contents-body-src-mq3-game-client-active-ml-1834261942"></a>
### CONTENTS_BODY

```ml
const CONTENTS_BODY = headers.CONTENTS_BODY
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L37)

<a id="constant-constant-mq3-game-client-active-contents-botclip-const-contents-botclip-headers-contents-botclip-src-mq3-game-client-active-ml-267128645"></a>
### CONTENTS_BOTCLIP

```ml
const CONTENTS_BOTCLIP = headers.CONTENTS_BOTCLIP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L38)

<a id="constant-constant-mq3-game-client-active-df-no-falling-const-df-no-falling-8-src-mq3-game-client-active-ml-1522598429"></a>
### DF_NO_FALLING

```ml
const DF_NO_FALLING = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L40)

<a id="constant-constant-mq3-game-client-active-df-no-footsteps-const-df-no-footsteps-32-src-mq3-game-client-active-ml-1856824772"></a>
### DF_NO_FOOTSTEPS

```ml
const DF_NO_FOOTSTEPS = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L41)

<a id="function-function-mq3-game-client-active-droppedflag-function-droppedflag-level-ent-powerup-item-src-mq3-game-client-active-ml-1347638024"></a>
### droppedFlag

```ml
function droppedFlag(level, ent, powerup, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `powerup` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L142)

<a id="constant-constant-mq3-game-client-active-ef-firing-const-ef-firing-256-src-mq3-game-client-active-ml-2018815044"></a>
### EF_FIRING

```ml
const EF_FIRING = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L32)

<a id="constant-constant-mq3-game-client-active-ef-talk-const-ef-talk-4096-src-mq3-game-client-active-ml-535921598"></a>
### EF_TALK

```ml
const EF_TALK = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L33)

<a id="constant-constant-mq3-game-client-active-fl-force-gesture-const-fl-force-gesture-32768-src-mq3-game-client-active-ml-1199874623"></a>
### FL_FORCE_GESTURE

```ml
const FL_FORCE_GESTURE = 32768
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L35)

<a id="constant-constant-mq3-game-client-active-gt-harvester-const-gt-harvester-7-src-mq3-game-client-active-ml-1495214450"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L46)

<a id="function-function-mq3-game-client-active-impacts-function-impacts-level-ent-p-src-mq3-game-client-active-ml-1540312835"></a>
### impacts

```ml
function impacts(level, ent, p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L125)

<a id="function-function-mq3-game-client-active-inactivitytimer-function-inactivitytimer-level-client-slot-src-mq3-game-client-active-ml-1281027879"></a>
### inactivityTimer

```ml
function inactivityTimer(level, client, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L70)

<a id="function-function-mq3-game-client-active-intermissionthink-function-intermissionthink-client-src-mq3-game-client-active-ml-1078590035"></a>
### intermissionThink

```ml
function intermissionThink(client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L63)

<a id="constant-constant-mq3-game-client-active-mask-playersolid-const-mask-playersolid-33619969-src-mq3-game-client-active-ml-2115738373"></a>
### MASK_PLAYERSOLID

```ml
const MASK_PLAYERSOLID = 33619969
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L39)

<a id="function-function-mq3-game-client-active-missionpack-function-missionpack-level-src-mq3-game-client-active-ml-624338406"></a>
### missionpack

```ml
function missionpack(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L48)

<a id="function-function-mq3-game-client-active-persistenttag-function-persistenttag-level-client-src-mq3-game-client-active-ml-1665602147"></a>
### persistentTag

```ml
function persistentTag(level, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L52)

<a id="constant-constant-mq3-game-client-active-pmf-invulexpand-const-pmf-invulexpand-16384-src-mq3-game-client-active-ml-1668016441"></a>
### PMF_INVULEXPAND

```ml
const PMF_INVULEXPAND = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L45)

<a id="function-function-mq3-game-client-active-realthink-function-realthink-level-ent-src-mq3-game-client-active-ml-1823520583"></a>
### realThink

```ml
function realThink(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L234)

<a id="function-function-mq3-game-client-active-runclient-function-runclient-level-ent-src-mq3-game-client-active-ml-508576171"></a>
### runClient

```ml
function runClient(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L322)

<a id="constant-constant-mq3-game-client-active-spectator-follow-const-spectator-follow-2-src-mq3-game-client-active-ml-1446589147"></a>
### SPECTATOR_FOLLOW

```ml
const SPECTATOR_FOLLOW = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L42)

<a id="constant-constant-mq3-game-client-active-spectator-scoreboard-const-spectator-scoreboard-3-src-mq3-game-client-active-ml-1952050222"></a>
### SPECTATOR_SCOREBOARD

```ml
const SPECTATOR_SCOREBOARD = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L43)

<a id="function-function-mq3-game-client-active-spectatorthink-function-spectatorthink-level-ent-cmd-src-mq3-game-client-active-ml-1494162125"></a>
### spectatorThink

```ml
function spectatorThink(level, ent, cmd)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `cmd` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L219)

<a id="constant-constant-mq3-game-client-active-stat-persistant-powerup-const-stat-persistant-powerup-7-src-mq3-game-client-active-ml-1399983428"></a>
### STAT_PERSISTANT_POWERUP

```ml
const STAT_PERSISTANT_POWERUP = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L44)

<a id="function-function-mq3-game-client-active-stuckinotherclient-function-stuckinotherclient-level-ent-src-mq3-game-client-active-ml-570327575"></a>
### stuckInOtherClient

```ml
function stuckInOtherClient(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L207)

<a id="constant-constant-mq3-game-client-active-svf-bot-const-svf-bot-8-src-mq3-game-client-active-ml-1665417617"></a>
### SVF_BOT

```ml
const SVF_BOT = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L36)

<a id="function-function-mq3-game-client-active-think-function-think-level-clientnum-src-mq3-game-client-active-ml-298440747"></a>
### think

```ml
function think(level, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L314)

<a id="function-function-mq3-game-client-active-timeractions-function-timeractions-level-ent-msec-src-mq3-game-client-active-ml-150807335"></a>
### timerActions

```ml
function timerActions(level, ent, msec)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `msec` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_active.ml#L89)
