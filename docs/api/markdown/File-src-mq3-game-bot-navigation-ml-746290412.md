# `src/mq3/game/bot_navigation.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_navigation`](Package-mq3-game-bot-navigation-1340586518.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/bot_ai_headers.ml` as `aiheaders` → [src/mq3/game/bot_ai_headers.ml](File-src-mq3-game-bot-ai-headers-ml-1280419323.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

- [mq3.game.bot_navigation.ActivateGoal](Type-mq3-game-bot-navigation-activategoal-77759570.md) — struct
<a id="function-function-mq3-game-bot-navigation-alternateroute-function-alternateroute-services-bot-goal-src-mq3-game-bot-navigation-ml-239622226"></a>
### alternateRoute

```ml
function alternateRoute(services, bot, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L214)

<a id="constant-constant-mq3-game-bot-navigation-areacontents-modelnum-const-areacontents-modelnum-4278190080-src-mq3-game-bot-navigation-ml-1732080608"></a>
### AREACONTENTS_MODELNUM

```ml
const AREACONTENTS_MODELNUM = 4278190080
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L26)

<a id="constant-constant-mq3-game-bot-navigation-areacontents-modelnumshift-const-areacontents-modelnumshift-24-src-mq3-game-bot-navigation-ml-30627659"></a>
### AREACONTENTS_MODELNUMSHIFT

```ml
const AREACONTENTS_MODELNUMSHIFT = 24
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L25)

<a id="constant-constant-mq3-game-bot-navigation-areacontents-mover-const-areacontents-mover-1024-src-mq3-game-bot-navigation-ml-793555752"></a>
### AREACONTENTS_MOVER

```ml
const AREACONTENTS_MOVER = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L24)

<a id="constant-constant-mq3-game-bot-navigation-characteristic-camper-const-characteristic-camper-headers-characteristic-camper-src-mq3-game-bot-navigation-ml-1213545405"></a>
### CHARACTERISTIC_CAMPER

```ml
const CHARACTERISTIC_CAMPER = headers.CHARACTERISTIC_CAMPER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L31)

<a id="constant-constant-mq3-game-bot-navigation-characteristic-croucher-const-characteristic-croucher-headers-characteristic-croucher-src-mq3-game-bot-navigation-ml-1679712492"></a>
### CHARACTERISTIC_CROUCHER

```ml
const CHARACTERISTIC_CROUCHER = headers.CHARACTERISTIC_CROUCHER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L32)

<a id="function-function-mq3-game-bot-navigation-clearactivategoalstack-function-clearactivategoalstack-services-bot-src-mq3-game-bot-navigation-ml-228358353"></a>
### clearActivateGoalStack

```ml
function clearActivateGoalStack(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L264)

<a id="constant-constant-mq3-game-bot-navigation-contents-lava-const-contents-lava-headers-contents-lava-src-mq3-game-bot-navigation-ml-1546513850"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = headers.CONTENTS_LAVA
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L56)

<a id="constant-constant-mq3-game-bot-navigation-contents-playerclip-const-contents-playerclip-headers-contents-playerclip-src-mq3-game-bot-navigation-ml-1842138325"></a>
### CONTENTS_PLAYERCLIP

```ml
const CONTENTS_PLAYERCLIP = headers.CONTENTS_PLAYERCLIP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L59)

<a id="constant-constant-mq3-game-bot-navigation-contents-slime-const-contents-slime-headers-contents-slime-src-mq3-game-bot-navigation-ml-844865458"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = headers.CONTENTS_SLIME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L57)

<a id="constant-constant-mq3-game-bot-navigation-contents-solid-const-contents-solid-headers-contents-solid-src-mq3-game-bot-navigation-ml-1301639069"></a>
### CONTENTS_SOLID

```ml
const CONTENTS_SOLID = headers.CONTENTS_SOLID
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L55)

<a id="constant-constant-mq3-game-bot-navigation-contents-water-const-contents-water-headers-contents-water-src-mq3-game-bot-navigation-ml-1399031613"></a>
### CONTENTS_WATER

```ml
const CONTENTS_WATER = headers.CONTENTS_WATER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L58)

<a id="function-function-mq3-game-bot-navigation-copyactivategoal-function-copyactivategoal-source-src-mq3-game-bot-navigation-ml-640102713"></a>
### copyActivateGoal

```ml
function copyActivateGoal(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L244)

<a id="function-function-mq3-game-bot-navigation-copygoalinto-function-copygoalinto-target-source-src-mq3-game-bot-navigation-ml-1928082516"></a>
### copyGoalInto

```ml
function copyGoalInto(target, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `target` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L206)

<a id="function-function-mq3-game-bot-navigation-create-function-create-src-mq3-game-bot-navigation-ml-687923580"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L147)

<a id="function-function-mq3-game-bot-navigation-currentactivationduplicate-function-currentactivationduplicate-services-bot-activategoal-src-mq3-game-bot-navigation-ml-598425383"></a>
### currentActivationDuplicate

```ml
function currentActivationDuplicate(services, bot, activategoal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `activategoal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L284)

<a id="function-function-mq3-game-bot-navigation-distsquared-function-distsquared-a-b-src-mq3-game-bot-navigation-ml-352556217"></a>
### distSquared

```ml
function distSquared(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L403)

<a id="function-function-mq3-game-bot-navigation-dontavoid-function-dontavoid-services-bot-itemname-src-mq3-game-bot-navigation-ml-561409989"></a>
### dontAvoid

```ml
function dontAvoid(services, bot, itemname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `itemname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L372)

<a id="function-function-mq3-game-bot-navigation-emptyactivategoal-function-emptyactivategoal-src-mq3-game-bot-navigation-ml-1715302898"></a>
### emptyActivateGoal

```ml
function emptyActivateGoal()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L237)

<a id="function-function-mq3-game-bot-navigation-enableactivategoalareas-function-enableactivategoalareas-services-activategoal-enable-src-mq3-game-bot-navigation-ml-710801391"></a>
### enableActivateGoalAreas

```ml
function enableActivateGoalAreas(services, activategoal, enable)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `activategoal` | `dynamic` | — |  |
| `enable` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L249)

<a id="function-function-mq3-game-bot-navigation-ensureactivateheap-function-ensureactivateheap-bot-src-mq3-game-bot-navigation-ml-1380944305"></a>
### ensureActivateHeap

```ml
function ensureActivateHeap(bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L240)

- [mq3.game.bot_navigation.EntityInfo](Type-mq3-game-bot-navigation-entityinfo-1868580807.md) — struct
<a id="constant-constant-mq3-game-bot-navigation-entitynum-none-const-entitynum-none-1023-src-mq3-game-bot-navigation-ml-250346873"></a>
### ENTITYNUM_NONE

```ml
const ENTITYNUM_NONE = 1023
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L10)

<a id="constant-constant-mq3-game-bot-navigation-et-mover-const-et-mover-4-src-mq3-game-bot-navigation-ml-313016553"></a>
### ET_MOVER

```ml
const ET_MOVER = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L21)

<a id="function-function-mq3-game-bot-navigation-getactivategoal-function-getactivategoal-services-bot-entitynum-activategoal-src-mq3-game-bot-navigation-ml-1460589788"></a>
### getActivateGoal

```ml
function getActivateGoal(services, bot, entitynum, activategoal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `entitynum` | `dynamic` | — |  |
| `activategoal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L304)

<a id="function-function-mq3-game-bot-navigation-getairgoal-function-getairgoal-services-bot-goal-src-mq3-game-bot-navigation-ml-1755663626"></a>
### getAirGoal

```ml
function getAirGoal(services, bot, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L382)

<a id="function-function-mq3-game-bot-navigation-getalternateroutegoal-function-getalternateroutegoal-services-bot-base-redgoals-bluegoals-src-mq3-game-bot-navigation-ml-1330800975"></a>
### getAlternateRouteGoal

```ml
function getAlternateRouteGoal(services, bot, base, redGoals, blueGoals)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `redGoals` | `dynamic` | — |  |
| `blueGoals` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L226)

<a id="function-function-mq3-game-bot-navigation-getitemlongtermgoal-function-getitemlongtermgoal-services-bot-tfl-goal-src-mq3-game-bot-navigation-ml-128392330"></a>
### getItemLongTermGoal

```ml
function getItemLongTermGoal(services, bot, tfl, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `tfl` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L398)

<a id="function-function-mq3-game-bot-navigation-getlongtermgoal-function-getlongtermgoal-services-bot-tfl-retreat-goal-src-mq3-game-bot-navigation-ml-1264061621"></a>
### getLongTermGoal

```ml
function getLongTermGoal(services, bot, tfl, retreat, goal)
```

ai_dmnet.c BotGetLongTermGoal: common Baseq3 and CTF long-term goal policy.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `tfl` | `dynamic` | — |  |
| `retreat` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L419)

<a id="constant-constant-mq3-game-bot-navigation-gfl-air-const-gfl-air-128-src-mq3-game-bot-navigation-ml-1240894302"></a>
### GFL_AIR

```ml
const GFL_AIR = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L54)

<a id="constant-constant-mq3-game-bot-navigation-gfl-dropped-const-gfl-dropped-4-src-mq3-game-bot-navigation-ml-1159622885"></a>
### GFL_DROPPED

```ml
const GFL_DROPPED = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L53)

<a id="constant-constant-mq3-game-bot-navigation-gfl-item-const-gfl-item-1-src-mq3-game-bot-navigation-ml-1068008108"></a>
### GFL_ITEM

```ml
const GFL_ITEM = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L52)

- [mq3.game.bot_navigation.Goal](Type-mq3-game-bot-navigation-goal-483576123.md) — struct
<a id="function-function-mq3-game-bot-navigation-gocamp-function-gocamp-services-bot-goal-src-mq3-game-bot-navigation-ml-1180440058"></a>
### goCamp

```ml
function goCamp(services, bot, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L354)

<a id="function-function-mq3-game-bot-navigation-goforactivategoal-function-goforactivategoal-services-bot-activategoal-src-mq3-game-bot-navigation-ml-2025345805"></a>
### goForActivateGoal

```ml
function goForActivateGoal(services, bot, activategoal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `activategoal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L271)

<a id="function-function-mq3-game-bot-navigation-goforair-function-goforair-services-bot-tfl-ltg-range-src-mq3-game-bot-navigation-ml-2143326235"></a>
### goForAir

```ml
function goForAir(services, bot, tfl, ltg, range)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `tfl` | `dynamic` | — |  |
| `ltg` | `dynamic` | — |  |
| `range` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L387)

<a id="function-function-mq3-game-bot-navigation-goforpowerups-function-goforpowerups-services-bot-src-mq3-game-bot-navigation-ml-1463950025"></a>
### goForPowerups

```ml
function goForPowerups(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L377)

<a id="constant-constant-mq3-game-bot-navigation-gt-ctf-const-gt-ctf-4-src-mq3-game-bot-navigation-ml-1222660417"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L45)

- [mq3.game.bot_navigation.InitMove](Type-mq3-game-bot-navigation-initmove-606379543.md) — struct
<a id="constant-constant-mq3-game-bot-navigation-inventory-bfg10k-const-inventory-bfg10k-headers-inventory-bfg10k-src-mq3-game-bot-navigation-ml-1843710471"></a>
### INVENTORY_BFG10K

```ml
const INVENTORY_BFG10K = headers.INVENTORY_BFG10K
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L49)

<a id="constant-constant-mq3-game-bot-navigation-inventory-bfgammo-const-inventory-bfgammo-headers-inventory-bfgammo-src-mq3-game-bot-navigation-ml-580580045"></a>
### INVENTORY_BFGAMMO

```ml
const INVENTORY_BFGAMMO = headers.INVENTORY_BFGAMMO
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L51)

<a id="constant-constant-mq3-game-bot-navigation-inventory-railgun-const-inventory-railgun-headers-inventory-railgun-src-mq3-game-bot-navigation-ml-992892126"></a>
### INVENTORY_RAILGUN

```ml
const INVENTORY_RAILGUN = headers.INVENTORY_RAILGUN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L48)

<a id="constant-constant-mq3-game-bot-navigation-inventory-rocketlauncher-const-inventory-rocketlauncher-headers-inventory-rocketlauncher-src-mq3-game-bot-navigation-ml-289287794"></a>
### INVENTORY_ROCKETLAUNCHER

```ml
const INVENTORY_ROCKETLAUNCHER = headers.INVENTORY_ROCKETLAUNCHER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L47)

<a id="constant-constant-mq3-game-bot-navigation-inventory-slugs-const-inventory-slugs-headers-inventory-slugs-src-mq3-game-bot-navigation-ml-1496555380"></a>
### INVENTORY_SLUGS

```ml
const INVENTORY_SLUGS = headers.INVENTORY_SLUGS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L50)

<a id="function-function-mq3-game-bot-navigation-isgoingtoactivateentity-function-isgoingtoactivateentity-services-bot-entitynum-src-mq3-game-bot-navigation-ml-394361560"></a>
### isGoingToActivateEntity

```ml
function isGoingToActivateEntity(services, bot, entitynum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `entitynum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L265)

<a id="function-function-mq3-game-bot-navigation-key-function-key-services-entity-name-src-mq3-game-bot-navigation-ml-939746158"></a>
### key

```ml
function key(services, entity, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L283)

<a id="function-function-mq3-game-bot-navigation-longtermentity-function-longtermentity-services-entity-src-mq3-game-bot-navigation-ml-1449102055"></a>
### longTermEntity

```ml
function longTermEntity(services, entity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L409)

- [mq3.game.bot_navigation.LongTermEntity](Type-mq3-game-bot-navigation-longtermentity-868813615.md) — struct
<a id="function-function-mq3-game-bot-navigation-longtermgoal-function-longtermgoal-services-bot-tfl-retreat-goal-src-mq3-game-bot-navigation-ml-661556367"></a>
### longTermGoal

```ml
function longTermGoal(services, bot, tfl, retreat, goal)
```

ai_dmnet.c BotLongTermGoal: leading policy before the LTG dispatcher.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `tfl` | `dynamic` | — |  |
| `retreat` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L501)

<a id="constant-constant-mq3-game-bot-navigation-ltg-camp-const-ltg-camp-aiheaders-ltg-camp-src-mq3-game-bot-navigation-ml-1531131642"></a>
### LTG_CAMP

```ml
const LTG_CAMP = aiheaders.LTG_CAMP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L38)

<a id="constant-constant-mq3-game-bot-navigation-ltg-camporder-const-ltg-camporder-aiheaders-ltg-camporder-src-mq3-game-bot-navigation-ml-1643494504"></a>
### LTG_CAMPORDER

```ml
const LTG_CAMPORDER = aiheaders.LTG_CAMPORDER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L39)

<a id="constant-constant-mq3-game-bot-navigation-ltg-defendkeyarea-const-ltg-defendkeyarea-aiheaders-ltg-defendkeyarea-src-mq3-game-bot-navigation-ml-598007491"></a>
### LTG_DEFENDKEYAREA

```ml
const LTG_DEFENDKEYAREA = aiheaders.LTG_DEFENDKEYAREA
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L35)

<a id="constant-constant-mq3-game-bot-navigation-ltg-getflag-const-ltg-getflag-aiheaders-ltg-getflag-src-mq3-game-bot-navigation-ml-1299564051"></a>
### LTG_GETFLAG

```ml
const LTG_GETFLAG = aiheaders.LTG_GETFLAG
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L36)

<a id="constant-constant-mq3-game-bot-navigation-ltg-getitem-const-ltg-getitem-aiheaders-ltg-getitem-src-mq3-game-bot-navigation-ml-1805815648"></a>
### LTG_GETITEM

```ml
const LTG_GETITEM = aiheaders.LTG_GETITEM
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L42)

<a id="constant-constant-mq3-game-bot-navigation-ltg-kill-const-ltg-kill-aiheaders-ltg-kill-src-mq3-game-bot-navigation-ml-1668114447"></a>
### LTG_KILL

```ml
const LTG_KILL = aiheaders.LTG_KILL
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L43)

<a id="constant-constant-mq3-game-bot-navigation-ltg-patrol-const-ltg-patrol-aiheaders-ltg-patrol-src-mq3-game-bot-navigation-ml-746347961"></a>
### LTG_PATROL

```ml
const LTG_PATROL = aiheaders.LTG_PATROL
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L40)

<a id="constant-constant-mq3-game-bot-navigation-ltg-returnflag-const-ltg-returnflag-aiheaders-ltg-returnflag-src-mq3-game-bot-navigation-ml-2000230791"></a>
### LTG_RETURNFLAG

```ml
const LTG_RETURNFLAG = aiheaders.LTG_RETURNFLAG
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L41)

<a id="constant-constant-mq3-game-bot-navigation-ltg-rushbase-const-ltg-rushbase-aiheaders-ltg-rushbase-src-mq3-game-bot-navigation-ml-1659515972"></a>
### LTG_RUSHBASE

```ml
const LTG_RUSHBASE = aiheaders.LTG_RUSHBASE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L37)

<a id="constant-constant-mq3-game-bot-navigation-ltg-teamaccompany-const-ltg-teamaccompany-aiheaders-ltg-teamaccompany-src-mq3-game-bot-navigation-ml-849565681"></a>
### LTG_TEAMACCOMPANY

```ml
const LTG_TEAMACCOMPANY = aiheaders.LTG_TEAMACCOMPANY
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L34)

<a id="constant-constant-mq3-game-bot-navigation-ltg-teamhelp-const-ltg-teamhelp-aiheaders-ltg-teamhelp-src-mq3-game-bot-navigation-ml-167952645"></a>
### LTG_TEAMHELP

```ml
const LTG_TEAMHELP = aiheaders.LTG_TEAMHELP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L33)

<a id="constant-constant-mq3-game-bot-navigation-max-activateareas-const-max-activateareas-aiheaders-max-activateareas-src-mq3-game-bot-navigation-ml-1843134355"></a>
### MAX_ACTIVATEAREAS

```ml
const MAX_ACTIVATEAREAS = aiheaders.MAX_ACTIVATEAREAS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L30)

<a id="constant-constant-mq3-game-bot-navigation-max-activatestack-const-max-activatestack-aiheaders-max-activatestack-src-mq3-game-bot-navigation-ml-593037401"></a>
### MAX_ACTIVATESTACK

```ml
const MAX_ACTIVATESTACK = aiheaders.MAX_ACTIVATESTACK
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L29)

<a id="constant-constant-mq3-game-bot-navigation-mfl-onground-const-mfl-onground-2-src-mq3-game-bot-navigation-ml-1306019877"></a>
### MFL_ONGROUND

```ml
const MFL_ONGROUND = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L16)

<a id="constant-constant-mq3-game-bot-navigation-mfl-teleported-const-mfl-teleported-32-src-mq3-game-bot-navigation-ml-458671004"></a>
### MFL_TELEPORTED

```ml
const MFL_TELEPORTED = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L18)

<a id="constant-constant-mq3-game-bot-navigation-mfl-walk-const-mfl-walk-512-src-mq3-game-bot-navigation-ml-112989593"></a>
### MFL_WALK

```ml
const MFL_WALK = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L19)

<a id="constant-constant-mq3-game-bot-navigation-mfl-waterjump-const-mfl-waterjump-16-src-mq3-game-bot-navigation-ml-2096785168"></a>
### MFL_WATERJUMP

```ml
const MFL_WATERJUMP = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L17)

<a id="function-function-mq3-game-bot-navigation-modelindex-function-modelindex-text-src-mq3-game-bot-navigation-ml-1313569075"></a>
### modelIndex

```ml
function modelIndex(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L282)

<a id="constant-constant-mq3-game-bot-navigation-move-walk-const-move-walk-1-src-mq3-game-bot-navigation-ml-612353184"></a>
### MOVE_WALK

```ml
const MOVE_WALK = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L20)

- [mq3.game.bot_navigation.MoveResult](Type-mq3-game-bot-navigation-moveresult-1824875700.md) — struct
- [mq3.game.bot_navigation.NavTrace](Type-mq3-game-bot-navigation-navtrace-1715501222.md) — struct
<a id="function-function-mq3-game-bot-navigation-nearbygoal-function-nearbygoal-services-bot-tfl-ltg-range-src-mq3-game-bot-navigation-ml-351652507"></a>
### nearbyGoal

```ml
function nearbyGoal(services, bot, tfl, ltg, range)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `tfl` | `dynamic` | — |  |
| `ltg` | `dynamic` | — |  |
| `range` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L390)

<a id="function-function-mq3-game-bot-navigation-need-function-need-callback-label-src-mq3-game-bot-navigation-ml-1070418083"></a>
### need

```ml
function need(callback, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `callback` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L148)

<a id="function-function-mq3-game-bot-navigation-notifylongterm-function-notifylongterm-services-bot-event-target-src-mq3-game-bot-navigation-ml-347140786"></a>
### notifyLongTerm

```ml
function notifyLongTerm(services, bot, event, target)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L406)

<a id="constant-constant-mq3-game-bot-navigation-patrol-back-const-patrol-back-aiheaders-patrol-back-src-mq3-game-bot-navigation-ml-187283351"></a>
### PATROL_BACK

```ml
const PATROL_BACK = aiheaders.PATROL_BACK
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L44)

<a id="constant-constant-mq3-game-bot-navigation-pmf-ducked-const-pmf-ducked-1-src-mq3-game-bot-navigation-ml-556399470"></a>
### PMF_DUCKED

```ml
const PMF_DUCKED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L11)

<a id="constant-constant-mq3-game-bot-navigation-pmf-time-knockback-const-pmf-time-knockback-64-src-mq3-game-bot-navigation-ml-422064655"></a>
### PMF_TIME_KNOCKBACK

```ml
const PMF_TIME_KNOCKBACK = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L12)

<a id="constant-constant-mq3-game-bot-navigation-pmf-time-waterjump-const-pmf-time-waterjump-256-src-mq3-game-bot-navigation-ml-1615684146"></a>
### PMF_TIME_WATERJUMP

```ml
const PMF_TIME_WATERJUMP = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L13)

<a id="function-function-mq3-game-bot-navigation-popactivategoal-function-popactivategoal-services-bot-src-mq3-game-bot-navigation-ml-1908882351"></a>
### popActivateGoal

```ml
function popActivateGoal(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L254)

<a id="function-function-mq3-game-bot-navigation-predictobstacles-function-predictobstacles-services-bot-goal-enabled-src-mq3-game-bot-navigation-ml-6838247"></a>
### predictObstacles

```ml
function predictObstacles(services, bot, goal, enabled)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |
| `enabled` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L179)

<a id="function-function-mq3-game-bot-navigation-prepareactivator-function-prepareactivator-services-bot-entity-activategoal-kind-src-mq3-game-bot-navigation-ml-1207471834"></a>
### prepareActivator

```ml
function prepareActivator(services, bot, entity, activategoal, kind)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `activategoal` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L291)

<a id="constant-constant-mq3-game-bot-navigation-presence-crouch-const-presence-crouch-aiheaders-presence-crouch-src-mq3-game-bot-navigation-ml-317996811"></a>
### PRESENCE_CROUCH

```ml
const PRESENCE_CROUCH = aiheaders.PRESENCE_CROUCH
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L15)

<a id="constant-constant-mq3-game-bot-navigation-presence-normal-const-presence-normal-aiheaders-presence-normal-src-mq3-game-bot-navigation-ml-537439196"></a>
### PRESENCE_NORMAL

```ml
const PRESENCE_NORMAL = aiheaders.PRESENCE_NORMAL
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L14)

<a id="function-function-mq3-game-bot-navigation-pushactivategoal-function-pushactivategoal-services-bot-activategoal-src-mq3-game-bot-navigation-ml-358361399"></a>
### pushActivateGoal

```ml
function pushActivateGoal(services, bot, activategoal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `activategoal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L258)

<a id="function-function-mq3-game-bot-navigation-randommove-function-randommove-services-bot-moveresult-src-mq3-game-bot-navigation-ml-93353593"></a>
### randomMove

```ml
function randomMove(services, bot, moveresult)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `moveresult` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L171)

<a id="function-function-mq3-game-bot-navigation-reachedgoal-function-reachedgoal-services-bot-goal-src-mq3-game-bot-navigation-ml-1814535228"></a>
### reachedGoal

```ml
function reachedGoal(services, bot, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L393)

<a id="function-function-mq3-game-bot-navigation-resetactivategoal-function-resetactivategoal-goal-src-mq3-game-bot-navigation-ml-374728477"></a>
### resetActivateGoal

```ml
function resetActivateGoal(goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L278)

- [mq3.game.bot_navigation.Route](Type-mq3-game-bot-navigation-route-702984309.md) — struct
<a id="constant-constant-mq3-game-bot-navigation-rse-entercontents-const-rse-entercontents-4-src-mq3-game-bot-navigation-ml-2099735725"></a>
### RSE_ENTERCONTENTS

```ml
const RSE_ENTERCONTENTS = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L23)

<a id="constant-constant-mq3-game-bot-navigation-rse-usetraveltype-const-rse-usetraveltype-2-src-mq3-game-bot-navigation-ml-365748795"></a>
### RSE_USETRAVELTYPE

```ml
const RSE_USETRAVELTYPE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L22)

<a id="function-function-mq3-game-bot-navigation-samevector-function-samevector-a-b-src-mq3-game-bot-navigation-ml-497313439"></a>
### sameVector

```ml
function sameVector(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L281)

- [mq3.game.bot_navigation.Services](Type-mq3-game-bot-navigation-services-1677460312.md) — struct
<a id="function-function-mq3-game-bot-navigation-setmovedir-function-setmovedir-angles-src-mq3-game-bot-navigation-ml-736502728"></a>
### setMovedir

```ml
function setMovedir(angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L165)

<a id="function-function-mq3-game-bot-navigation-setupformovement-function-setupformovement-services-bot-src-mq3-game-bot-navigation-ml-1681068269"></a>
### setupForMovement

```ml
function setupForMovement(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L150)

<a id="constant-constant-mq3-game-bot-navigation-team-red-const-team-red-1-src-mq3-game-bot-navigation-ml-1484279148"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L28)

<a id="constant-constant-mq3-game-bot-navigation-tfl-bridge-const-tfl-bridge-67108864-src-mq3-game-bot-navigation-ml-683843367"></a>
### TFL_BRIDGE

```ml
const TFL_BRIDGE = 67108864
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L27)

<a id="constant-constant-mq3-game-bot-navigation-tfl-default-const-tfl-default-18616254-src-mq3-game-bot-navigation-ml-371703142"></a>
### TFL_DEFAULT

```ml
const TFL_DEFAULT = 18616254
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L46)

<a id="function-function-mq3-game-bot-navigation-updatemovingteamgoal-function-updatemovingteamgoal-services-bot-entity-teamgoal-src-mq3-game-bot-navigation-ml-637051612"></a>
### updateMovingTeamGoal

```ml
function updateMovingTeamGoal(services, bot, entity, teamGoal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `teamGoal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L412)

<a id="function-function-mq3-game-bot-navigation-wantstocamp-function-wantstocamp-services-bot-src-mq3-game-bot-navigation-ml-1630998471"></a>
### wantsToCamp

```ml
function wantsToCamp(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L361)

- [mq3.game.bot_navigation.Waypoint](Type-mq3-game-bot-navigation-waypoint-1377048671.md) — struct
