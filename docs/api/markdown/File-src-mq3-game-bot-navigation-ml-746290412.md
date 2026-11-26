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

Set `bot.reachedAltRouteGoalTime` to `need(services.floatTimeFn,"FloatTime")(services)` in `mq3.game.bot_navigation.alternateRoute`. Return paths include `goal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `areaTravelTimeFn` and `floatTimeFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `altRouteGoal`, `reachedAltRouteGoalTime`, `areanum`, `origin` and `tfl`. May update `bot.reachedAltRouteGoalTime` in place. |
| `goal` | `dynamic` | — | Target record; accesses `areanum`, `entitynum`, `origin`, `mins` and `maxs` and related fields. May update `goal.areanum`, `goal.entitynum` and `goal.origin` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L470)

<a id="constant-constant-mq3-game-bot-navigation-areacontents-modelnum-const-areacontents-modelnum-4278190080-src-mq3-game-bot-navigation-ml-1732080608"></a>
### AREACONTENTS_MODELNUM

```ml
const AREACONTENTS_MODELNUM = 4278190080
```

AAS area-content flag marking modelnum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L43)

<a id="constant-constant-mq3-game-bot-navigation-areacontents-modelnumshift-const-areacontents-modelnumshift-24-src-mq3-game-bot-navigation-ml-30627659"></a>
### AREACONTENTS_MODELNUMSHIFT

```ml
const AREACONTENTS_MODELNUMSHIFT = 24
```

AAS area-content flag marking modelnumshift.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L41)

<a id="constant-constant-mq3-game-bot-navigation-areacontents-mover-const-areacontents-mover-1024-src-mq3-game-bot-navigation-ml-793555752"></a>
### AREACONTENTS_MOVER

```ml
const AREACONTENTS_MOVER = 1024
```

AAS area-content flag marking mover.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L39)

<a id="constant-constant-mq3-game-bot-navigation-characteristic-camper-const-characteristic-camper-headers-characteristic-camper-src-mq3-game-bot-navigation-ml-1213545405"></a>
### CHARACTERISTIC_CAMPER

```ml
const CHARACTERISTIC_CAMPER = headers.CHARACTERISTIC_CAMPER
```

Bot-character characteristic index for camper. Definition: tendency to camp float [0, 1].


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L53)

<a id="constant-constant-mq3-game-bot-navigation-characteristic-croucher-const-characteristic-croucher-headers-characteristic-croucher-src-mq3-game-bot-navigation-ml-1679712492"></a>
### CHARACTERISTIC_CROUCHER

```ml
const CHARACTERISTIC_CROUCHER = headers.CHARACTERISTIC_CROUCHER
```

Bot-character characteristic index for croucher. Definition: movement tendency to crouch float [0, 1].


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L56)

<a id="function-function-mq3-game-bot-navigation-clearactivategoalstack-function-clearactivategoalstack-services-bot-src-mq3-game-bot-navigation-ml-228358353"></a>
### clearActivateGoalStack

```ml
function clearActivateGoalStack(services, bot)
```

Apply `mq3.game.bot_navigation.popActivateGoal` while evaluating `clearActivateGoalStack`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `floatTimeFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `activateStackIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L545)

<a id="constant-constant-mq3-game-bot-navigation-contents-lava-const-contents-lava-headers-contents-lava-src-mq3-game-bot-navigation-ml-1546513850"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = headers.CONTENTS_LAVA
```

Collision-contents bit identifying lava space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L104)

<a id="constant-constant-mq3-game-bot-navigation-contents-playerclip-const-contents-playerclip-headers-contents-playerclip-src-mq3-game-bot-navigation-ml-1842138325"></a>
### CONTENTS_PLAYERCLIP

```ml
const CONTENTS_PLAYERCLIP = headers.CONTENTS_PLAYERCLIP
```

Collision-contents bit identifying playerclip space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L110)

<a id="constant-constant-mq3-game-bot-navigation-contents-slime-const-contents-slime-headers-contents-slime-src-mq3-game-bot-navigation-ml-844865458"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = headers.CONTENTS_SLIME
```

Collision-contents bit identifying slime space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L106)

<a id="constant-constant-mq3-game-bot-navigation-contents-solid-const-contents-solid-headers-contents-solid-src-mq3-game-bot-navigation-ml-1301639069"></a>
### CONTENTS_SOLID

```ml
const CONTENTS_SOLID = headers.CONTENTS_SOLID
```

Collision-contents bit identifying solid space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L102)

<a id="constant-constant-mq3-game-bot-navigation-contents-water-const-contents-water-headers-contents-water-src-mq3-game-bot-navigation-ml-1399031613"></a>
### CONTENTS_WATER

```ml
const CONTENTS_WATER = headers.CONTENTS_WATER
```

Collision-contents bit identifying water space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L108)

<a id="function-function-mq3-game-bot-navigation-copyactivategoal-function-copyactivategoal-source-src-mq3-game-bot-navigation-ml-640102713"></a>
### copyActivateGoal

```ml
function copyActivateGoal(source)
```

Build the `mq3.game.bot_navigation.ActivateGoal` result for `copyActivateGoal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `goal`, `areas`, `inuse`, `time` and `startTime` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L511)

<a id="function-function-mq3-game-bot-navigation-copygoalinto-function-copygoalinto-target-source-src-mq3-game-bot-navigation-ml-1928082516"></a>
### copyGoalInto

```ml
function copyGoalInto(target, source)
```

Update `target.areanum`, `target.entitynum`, `target.origin` and `target.mins` and related state during `copyGoalInto`. Return paths include `target`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `target` | `dynamic` | — | Target record; accesses `areanum`, `entitynum`, `origin`, `mins` and `maxs` and related fields. May update `target.areanum`, `target.entitynum` and `target.origin` and additional fields in place. |
| `source` | `dynamic` | — | Parser source state; accesses `areanum`, `entitynum`, `origin`, `mins` and `maxs` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L458)

<a id="function-function-mq3-game-bot-navigation-create-function-create-src-mq3-game-bot-navigation-ml-687923580"></a>
### create

```ml
function create()
```

Create a `mq3.game.bot_navigation.Services` record with the declared empty defaults.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L379)

<a id="function-function-mq3-game-bot-navigation-currentactivationduplicate-function-currentactivationduplicate-services-bot-activategoal-src-mq3-game-bot-navigation-ml-598425383"></a>
### currentActivationDuplicate

```ml
function currentActivationDuplicate(services, bot, activategoal)
```

Apply `mq3.game.bot_navigation.ensureActivateHeap` and `mq3.game.bot_navigation.need` while evaluating `currentActivationDuplicate`. Return paths include `top.startTime<n.fsub(need(services.floatTimeFn,"FloatTime")(services),2.0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `floatTimeFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `activateStackIndex` and `activateGoalHeap`. |
| `activategoal` | `dynamic` | — | Activategoal record; accesses `goal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L588)

<a id="function-function-mq3-game-bot-navigation-distsquared-function-distsquared-a-b-src-mq3-game-bot-navigation-ml-352556217"></a>
### distSquared

```ml
function distSquared(a, b)
```

Calculate squared Euclidean distance between two navigation points using single-precision arithmetic.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L760)

<a id="function-function-mq3-game-bot-navigation-dontavoid-function-dontavoid-services-bot-itemname-src-mq3-game-bot-navigation-ml-561409989"></a>
### dontAvoid

```ml
function dontAvoid(services, bot, itemname)
```

Use `services.levelItemGoalFn` and `services.removeAvoidGoalFn` to perform `dontAvoid`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `levelItemGoalFn` and `removeAvoidGoalFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `gs`. |
| `itemname` | `dynamic` | — | Value passed as argument 3 to `services.levelItemGoalFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L698)

<a id="function-function-mq3-game-bot-navigation-emptyactivategoal-function-emptyactivategoal-src-mq3-game-bot-navigation-ml-1715302898"></a>
### emptyActivateGoal

```ml
function emptyActivateGoal()
```

Create a `mq3.game.bot_navigation.ActivateGoal` record, initializing `origin` as `[0.0,0.0,0.0]`, `goal` as `Goal(0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0)` and `nextIndex` as `-1`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L500)

<a id="function-function-mq3-game-bot-navigation-enableactivategoalareas-function-enableactivategoalareas-services-activategoal-enable-src-mq3-game-bot-navigation-ml-710801391"></a>
### enableActivateGoalAreas

```ml
function enableActivateGoalAreas(services, activategoal, enable)
```

Set `activategoal.areasdisabled` to `disabled` in `mq3.game.bot_navigation.enableActivateGoalAreas`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `enableRoutingAreaFn`. |
| `activategoal` | `dynamic` | — | Activategoal record; accesses `areasdisabled`, `numareas` and `areas`. May update `activategoal.areasdisabled` in place. |
| `enable` | `dynamic` | — | Value used by `enableActivateGoalAreas` in `disabled=not enable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L520)

<a id="function-function-mq3-game-bot-navigation-ensureactivateheap-function-ensureactivateheap-bot-src-mq3-game-bot-navigation-ml-1380944305"></a>
### ensureActivateHeap

```ml
function ensureActivateHeap(bot)
```

Set `bot.activateGoalHeap` to `[]` and `bot.activateGoalHeap` to `bot.activateGoalHeap+[emptyActivateGoal()]` in `mq3.game.bot_navigation.ensureActivateHeap`. Return paths include `bot.activateGoalHeap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bot` | `dynamic` | — | Bot AI state; accesses `activateGoalHeap`. May update `bot.activateGoalHeap` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L505)

- [mq3.game.bot_navigation.EntityInfo](Type-mq3-game-bot-navigation-entityinfo-1868580807.md) — struct
<a id="constant-constant-mq3-game-bot-navigation-entitynum-none-const-entitynum-none-1023-src-mq3-game-bot-navigation-ml-250346873"></a>
### ENTITYNUM_NONE

```ml
const ENTITYNUM_NONE = 1023
```

Entity-number sentinel meaning that no entity was hit or referenced.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L11)

<a id="constant-constant-mq3-game-bot-navigation-et-mover-const-et-mover-4-src-mq3-game-bot-navigation-ml-313016553"></a>
### ET_MOVER

```ml
const ET_MOVER = 4
```

Network entity-type identifier representing mover.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L33)

<a id="function-function-mq3-game-bot-navigation-getactivategoal-function-getactivategoal-services-bot-entitynum-activategoal-src-mq3-game-bot-navigation-ml-1460589788"></a>
### getActivateGoal

```ml
function getActivateGoal(services, bot, entitynum, activategoal)
```

Set `activategoal.areas` to `activategoal.areas+[area]` and `activategoal.numareas` to `activategoal.numareas+1` in `mq3.game.bot_navigation.getActivateGoal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `entityInfoFn`, `nextBspEntityFn`, `diagnosticFn`, `floatKeyFn` and `doorActivateGoalFn` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `areanum`, `origin` and `tfl`. |
| `entitynum` | `dynamic` | — | Value used by `getActivateGoal` in `info=need(services.entityInfoFn,"BotEntityInfo")(services,entitynum)`. |
| `activategoal` | `dynamic` | — | Activategoal record; accesses `numareas` and `areas`. May update `activategoal.areas` and `activategoal.numareas` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L619)

<a id="function-function-mq3-game-bot-navigation-getairgoal-function-getairgoal-services-bot-goal-src-mq3-game-bot-navigation-ml-1755663626"></a>
### getAirGoal

```ml
function getAirGoal(services, bot, goal)
```

Update `goal.origin`, `goal.areanum`, `goal.mins` and `goal.maxs` and related state during `getAirGoal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `traceFn` and `pointAreaFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `origin` and `entitynum`. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `origin`, `areanum`, `mins`, `maxs` and `flags` and related fields. May update `goal.origin`, `goal.areanum` and `goal.mins` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L715)

<a id="function-function-mq3-game-bot-navigation-getalternateroutegoal-function-getalternateroutegoal-services-bot-base-redgoals-bluegoals-src-mq3-game-bot-navigation-ml-1330800975"></a>
### getAlternateRouteGoal

```ml
function getAlternateRouteGoal(services, bot, base, redGoals, blueGoals)
```

Set `bot.altRouteGoal` to `goal` and `bot.reachedAltRouteGoalTime` to `0.0` in `mq3.game.bot_navigation.getAlternateRouteGoal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `randomFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `altRouteGoal` and `reachedAltRouteGoalTime`. May update `bot.altRouteGoal` and `bot.reachedAltRouteGoalTime` in place. |
| `base` | `dynamic` | — | Value used by `getAlternateRouteGoal` in `if base==TEAM_RED then goals=redGoals end if`. |
| `redGoals` | `dynamic` | — | Value used by `getAlternateRouteGoal` in `if base==TEAM_RED then goals=redGoals end if`. |
| `blueGoals` | `dynamic` | — | Value used by `getAlternateRouteGoal` in `goals=blueGoals`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L488)

<a id="function-function-mq3-game-bot-navigation-getitemlongtermgoal-function-getitemlongtermgoal-services-bot-tfl-goal-src-mq3-game-bot-navigation-ml-128392330"></a>
### getItemLongTermGoal

```ml
function getItemLongTermGoal(services, bot, tfl, goal)
```

Set `bot.ltgTime` to `0.0` and `bot.ltgTime` to `n.fadd(services.floatTimeFn(services),20.0)` in `mq3.game.bot_navigation.getItemLongTermGoal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `topGoalFn`, `chooseWeaponFn`, `floatTimeFn`, `popGoalFn` and `chooseLtgFn` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `gs`, `ltgTime`, `origin`, `inventory` and `ms`. May update `bot.ltgTime` in place. |
| `tfl` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `goal` | `dynamic` | — | Target record; accesses `areanum`, `entitynum`, `origin`, `mins` and `maxs` and related fields. May update `goal.areanum`, `goal.entitynum` and `goal.origin` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L752)

<a id="function-function-mq3-game-bot-navigation-getlongtermgoal-function-getlongtermgoal-services-bot-tfl-retreat-goal-src-mq3-game-bot-navigation-ml-1264061621"></a>
### getLongTermGoal

```ml
function getLongTermGoal(services, bot, tfl, retreat, goal)
```

ai_dmnet.c BotGetLongTermGoal: common Baseq3 and CTF long-term goal policy.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `floatTimeFn`, `entityVisibleFn`, `resetAvoidReachFn`, `pointAreaFn` and `areaReachabilityFn` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ltgtype`, `teammessageTime`, `teammate`, `teamgoalTime` and `teammatevisibleTime` and related fields. May update `bot.teammessageTime`, `bot.ltgtype` and `bot.teammatevisibleTime` and additional fields in place. |
| `tfl` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `retreat` | `dynamic` | — | Value used by `getLongTermGoal` in `if bot.ltgtype==LTG_TEAMHELP and not retreat then`. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L794)

<a id="constant-constant-mq3-game-bot-navigation-gfl-air-const-gfl-air-128-src-mq3-game-bot-navigation-ml-1240894302"></a>
### GFL_AIR

```ml
const GFL_AIR = 128
```

Bot goal flag marking the goal as air.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L100)

<a id="constant-constant-mq3-game-bot-navigation-gfl-dropped-const-gfl-dropped-4-src-mq3-game-bot-navigation-ml-1159622885"></a>
### GFL_DROPPED

```ml
const GFL_DROPPED = 4
```

Bot goal flag marking the goal as dropped.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L98)

<a id="constant-constant-mq3-game-bot-navigation-gfl-item-const-gfl-item-1-src-mq3-game-bot-navigation-ml-1068008108"></a>
### GFL_ITEM

```ml
const GFL_ITEM = 1
```

Bot goal flag marking the goal as item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L96)

- [mq3.game.bot_navigation.Goal](Type-mq3-game-bot-navigation-goal-483576123.md) — struct
<a id="function-function-mq3-game-bot-navigation-gocamp-function-gocamp-services-bot-goal-src-mq3-game-bot-navigation-ml-1180440058"></a>
### goCamp

```ml
function goCamp(services, bot, goal)
```

Update `bot.decisionmaker`, `bot.teammessageTime`, `bot.ltgtype` and `bot.teamGoal` and related state during `goCamp`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `characteristicFn`, `floatTimeFn` and `randomFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `decisionmaker`, `client`, `teammessageTime`, `ltgtype` and `teamGoal` and related fields. May update `bot.decisionmaker`, `bot.teammessageTime` and `bot.ltgtype` and additional fields in place. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `areanum`, `entitynum`, `origin`, `mins` and `maxs` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L673)

<a id="function-function-mq3-game-bot-navigation-goforactivategoal-function-goforactivategoal-services-bot-activategoal-src-mq3-game-bot-navigation-ml-2025345805"></a>
### goForActivateGoal

```ml
function goForActivateGoal(services, bot, activategoal)
```

Update `activategoal.inuse`, `activategoal.time`, `activategoal.startTime` and `activategoal.origin` during `goForActivateGoal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `floatTimeFn`, `entityInfoFn` and `enterActivateNodeFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `activateGoalHeap` and `activateStackIndex`. May update `bot.activateGoalHeap[best]` and `bot.activateStackIndex` in place. |
| `activategoal` | `dynamic` | — | Activategoal record; accesses `inuse`, `time`, `startTime`, `goal` and `origin`. May update `activategoal.inuse`, `activategoal.time` and `activategoal.startTime` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L560)

<a id="function-function-mq3-game-bot-navigation-goforair-function-goforair-services-bot-tfl-ltg-range-src-mq3-game-bot-navigation-ml-2143326235"></a>
### goForAir

```ml
function goForAir(services, bot, tfl, ltg, range)
```

Use `services.floatTimeFn`, `services.pushGoalFn` and `services.chooseNbgFn` to perform `goForAir`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `floatTimeFn`, `pushGoalFn`, `chooseNbgFn`, `topGoalFn` and `pointContentsFn` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `lastairTime`, `gs`, `origin` and `inventory`. |
| `tfl` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `ltg` | `dynamic` | — | Value passed as argument 6 to `services.chooseNbgFn`. |
| `range` | `dynamic` | — | Value passed as argument 7 to `services.chooseNbgFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L726)

<a id="function-function-mq3-game-bot-navigation-goforpowerups-function-goforpowerups-services-bot-src-mq3-game-bot-navigation-ml-1463950025"></a>
### goForPowerups

```ml
function goForPowerups(services, bot)
```

Set `bot.ltgTime` to `0.0` in `mq3.game.bot_navigation.goForPowerups`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `levelItemGoalFn` and `removeAvoidGoalFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ltgTime`. May update `bot.ltgTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L706)

<a id="constant-constant-mq3-game-bot-navigation-gt-ctf-const-gt-ctf-4-src-mq3-game-bot-navigation-ml-1222660417"></a>
### GT_CTF

```ml
const GT_CTF = 4
```

Game-mode identifier selecting capture the flag rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L82)

- [mq3.game.bot_navigation.InitMove](Type-mq3-game-bot-navigation-initmove-606379543.md) — struct
<a id="constant-constant-mq3-game-bot-navigation-inventory-bfg10k-const-inventory-bfg10k-headers-inventory-bfg10k-src-mq3-game-bot-navigation-ml-1843710471"></a>
### INVENTORY_BFG10K

```ml
const INVENTORY_BFG10K = headers.INVENTORY_BFG10K
```

Bot inventory slot used to read or update bfg10 k.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L90)

<a id="constant-constant-mq3-game-bot-navigation-inventory-bfgammo-const-inventory-bfgammo-headers-inventory-bfgammo-src-mq3-game-bot-navigation-ml-580580045"></a>
### INVENTORY_BFGAMMO

```ml
const INVENTORY_BFGAMMO = headers.INVENTORY_BFGAMMO
```

Bot inventory slot used to read or update bfgammo.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L94)

<a id="constant-constant-mq3-game-bot-navigation-inventory-railgun-const-inventory-railgun-headers-inventory-railgun-src-mq3-game-bot-navigation-ml-992892126"></a>
### INVENTORY_RAILGUN

```ml
const INVENTORY_RAILGUN = headers.INVENTORY_RAILGUN
```

Bot inventory slot used to read or update railgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L88)

<a id="constant-constant-mq3-game-bot-navigation-inventory-rocketlauncher-const-inventory-rocketlauncher-headers-inventory-rocketlauncher-src-mq3-game-bot-navigation-ml-289287794"></a>
### INVENTORY_ROCKETLAUNCHER

```ml
const INVENTORY_ROCKETLAUNCHER = headers.INVENTORY_ROCKETLAUNCHER
```

Bot inventory slot used to read or update rocket launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L86)

<a id="constant-constant-mq3-game-bot-navigation-inventory-slugs-const-inventory-slugs-headers-inventory-slugs-src-mq3-game-bot-navigation-ml-1496555380"></a>
### INVENTORY_SLUGS

```ml
const INVENTORY_SLUGS = headers.INVENTORY_SLUGS
```

Bot inventory slot used to read or update slugs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L92)

<a id="function-function-mq3-game-bot-navigation-isgoingtoactivateentity-function-isgoingtoactivateentity-services-bot-entitynum-src-mq3-game-bot-navigation-ml-394361560"></a>
### isGoingToActivateEntity

```ml
function isGoingToActivateEntity(services, bot, entitynum)
```

Apply `mq3.game.bot_navigation.ensureActivateHeap` and `mq3.game.bot_navigation.need` while evaluating `isGoingToActivateEntity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `floatTimeFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `activateStackIndex` and `activateGoalHeap`. |
| `entitynum` | `dynamic` | — | Value used by `isGoingToActivateEntity` in `if goal.time>=need(services.floatTimeFn,"FloatTime")(services) and goal.goal.entitynum==entitynum then return tr...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L550)

<a id="function-function-mq3-game-bot-navigation-key-function-key-services-entity-name-src-mq3-game-bot-navigation-ml-939746158"></a>
### key

```ml
function key(services, entity, name)
```

Return `need(services.stringKeyFn,"AAS_ValueForBSPEpairKey")(services,entity,name)` for `key`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `stringKeyFn`. |
| `entity` | `dynamic` | — | Operand used to evaluate the returned expression `need(services.stringKeyFn,"AAS_ValueForBSPEpairKey")(services,entity,name)`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L583)

<a id="function-function-mq3-game-bot-navigation-longtermentity-function-longtermentity-services-entity-src-mq3-game-bot-navigation-ml-1449102055"></a>
### longTermEntity

```ml
function longTermEntity(services, entity)
```

Return `need(services.entityLongTermInfoFn,"BotEntityInfo")(services,entity)` for `longTermEntity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `entityLongTermInfoFn`. |
| `entity` | `dynamic` | — | Operand used to evaluate the returned expression `need(services.entityLongTermInfoFn,"BotEntityInfo")(services,entity)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L774)

- [mq3.game.bot_navigation.LongTermEntity](Type-mq3-game-bot-navigation-longtermentity-868813615.md) — struct
<a id="function-function-mq3-game-bot-navigation-longtermgoal-function-longtermgoal-services-bot-tfl-retreat-goal-src-mq3-game-bot-navigation-ml-661556367"></a>
### longTermGoal

```ml
function longTermGoal(services, bot, tfl, retreat, goal)
```

ai_dmnet.c BotLongTermGoal: leading policy before the LTG dispatcher.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `floatTimeFn` and `entityVisibleFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `leadTime`, `leadTeammate`, `leadmessageTime`, `leadTeamGoal` and `entitynum` and related fields. May update `bot.leadTime`, `bot.leadmessageTime` and `bot.leadvisibleTime` and additional fields in place. |
| `tfl` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `retreat` | `dynamic` | — | Value used by `getLongTermGoal` in `if bot.ltgtype==LTG_TEAMHELP and not retreat then`. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L881)

<a id="constant-constant-mq3-game-bot-navigation-ltg-camp-const-ltg-camp-aiheaders-ltg-camp-src-mq3-game-bot-navigation-ml-1531131642"></a>
### LTG_CAMP

```ml
const LTG_CAMP = aiheaders.LTG_CAMP
```

Long-term bot goal identifier selecting camp behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L68)

<a id="constant-constant-mq3-game-bot-navigation-ltg-camporder-const-ltg-camporder-aiheaders-ltg-camporder-src-mq3-game-bot-navigation-ml-1643494504"></a>
### LTG_CAMPORDER

```ml
const LTG_CAMPORDER = aiheaders.LTG_CAMPORDER
```

Long-term bot goal identifier selecting follow a camp order behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L70)

<a id="constant-constant-mq3-game-bot-navigation-ltg-defendkeyarea-const-ltg-defendkeyarea-aiheaders-ltg-defendkeyarea-src-mq3-game-bot-navigation-ml-598007491"></a>
### LTG_DEFENDKEYAREA

```ml
const LTG_DEFENDKEYAREA = aiheaders.LTG_DEFENDKEYAREA
```

Long-term bot goal identifier selecting defend a key area behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L62)

<a id="constant-constant-mq3-game-bot-navigation-ltg-getflag-const-ltg-getflag-aiheaders-ltg-getflag-src-mq3-game-bot-navigation-ml-1299564051"></a>
### LTG_GETFLAG

```ml
const LTG_GETFLAG = aiheaders.LTG_GETFLAG
```

Long-term bot goal identifier selecting capture the flag behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L64)

<a id="constant-constant-mq3-game-bot-navigation-ltg-getitem-const-ltg-getitem-aiheaders-ltg-getitem-src-mq3-game-bot-navigation-ml-1805815648"></a>
### LTG_GETITEM

```ml
const LTG_GETITEM = aiheaders.LTG_GETITEM
```

Long-term bot goal identifier selecting getitem behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L76)

<a id="constant-constant-mq3-game-bot-navigation-ltg-kill-const-ltg-kill-aiheaders-ltg-kill-src-mq3-game-bot-navigation-ml-1668114447"></a>
### LTG_KILL

```ml
const LTG_KILL = aiheaders.LTG_KILL
```

Long-term bot goal identifier selecting kill behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L78)

<a id="constant-constant-mq3-game-bot-navigation-ltg-patrol-const-ltg-patrol-aiheaders-ltg-patrol-src-mq3-game-bot-navigation-ml-746347961"></a>
### LTG_PATROL

```ml
const LTG_PATROL = aiheaders.LTG_PATROL
```

Long-term bot goal identifier selecting patrol behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L72)

<a id="constant-constant-mq3-game-bot-navigation-ltg-returnflag-const-ltg-returnflag-aiheaders-ltg-returnflag-src-mq3-game-bot-navigation-ml-2000230791"></a>
### LTG_RETURNFLAG

```ml
const LTG_RETURNFLAG = aiheaders.LTG_RETURNFLAG
```

Long-term bot goal identifier selecting return the flag behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L74)

<a id="constant-constant-mq3-game-bot-navigation-ltg-rushbase-const-ltg-rushbase-aiheaders-ltg-rushbase-src-mq3-game-bot-navigation-ml-1659515972"></a>
### LTG_RUSHBASE

```ml
const LTG_RUSHBASE = aiheaders.LTG_RUSHBASE
```

Long-term bot goal identifier selecting rush the base behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L66)

<a id="constant-constant-mq3-game-bot-navigation-ltg-teamaccompany-const-ltg-teamaccompany-aiheaders-ltg-teamaccompany-src-mq3-game-bot-navigation-ml-849565681"></a>
### LTG_TEAMACCOMPANY

```ml
const LTG_TEAMACCOMPANY = aiheaders.LTG_TEAMACCOMPANY
```

Long-term bot goal identifier selecting teamaccompany behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L60)

<a id="constant-constant-mq3-game-bot-navigation-ltg-teamhelp-const-ltg-teamhelp-aiheaders-ltg-teamhelp-src-mq3-game-bot-navigation-ml-167952645"></a>
### LTG_TEAMHELP

```ml
const LTG_TEAMHELP = aiheaders.LTG_TEAMHELP
```

Long-term bot goal identifier selecting teamhelp behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L58)

<a id="constant-constant-mq3-game-bot-navigation-max-activateareas-const-max-activateareas-aiheaders-max-activateareas-src-mq3-game-bot-navigation-ml-1843134355"></a>
### MAX_ACTIVATEAREAS

```ml
const MAX_ACTIVATEAREAS = aiheaders.MAX_ACTIVATEAREAS
```

Upper bound on activateareas represented by mq3.game.bot_navigation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L51)

<a id="constant-constant-mq3-game-bot-navigation-max-activatestack-const-max-activatestack-aiheaders-max-activatestack-src-mq3-game-bot-navigation-ml-593037401"></a>
### MAX_ACTIVATESTACK

```ml
const MAX_ACTIVATESTACK = aiheaders.MAX_ACTIVATESTACK
```

Upper bound on activatestack represented by mq3.game.bot_navigation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L49)

<a id="constant-constant-mq3-game-bot-navigation-mfl-onground-const-mfl-onground-2-src-mq3-game-bot-navigation-ml-1306019877"></a>
### MFL_ONGROUND

```ml
const MFL_ONGROUND = 2
```

Bot movement-state flag indicating onground.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L23)

<a id="constant-constant-mq3-game-bot-navigation-mfl-teleported-const-mfl-teleported-32-src-mq3-game-bot-navigation-ml-458671004"></a>
### MFL_TELEPORTED

```ml
const MFL_TELEPORTED = 32
```

Bot movement-state flag indicating teleported.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L27)

<a id="constant-constant-mq3-game-bot-navigation-mfl-walk-const-mfl-walk-512-src-mq3-game-bot-navigation-ml-112989593"></a>
### MFL_WALK

```ml
const MFL_WALK = 512
```

Bot movement-state flag indicating walk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L29)

<a id="constant-constant-mq3-game-bot-navigation-mfl-waterjump-const-mfl-waterjump-16-src-mq3-game-bot-navigation-ml-2096785168"></a>
### MFL_WATERJUMP

```ml
const MFL_WATERJUMP = 16
```

Bot movement-state flag indicating waterjump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L25)

<a id="function-function-mq3-game-bot-navigation-modelindex-function-modelindex-text-src-mq3-game-bot-navigation-ml-1313569075"></a>
### modelIndex

```ml
function modelIndex(text)
```

Parse the numeric model identifier after the leading inline-model marker.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L578)

<a id="constant-constant-mq3-game-bot-navigation-move-walk-const-move-walk-1-src-mq3-game-bot-navigation-ml-612353184"></a>
### MOVE_WALK

```ml
const MOVE_WALK = 1
```

Bot movement-type flag selecting walk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L31)

- [mq3.game.bot_navigation.MoveResult](Type-mq3-game-bot-navigation-moveresult-1824875700.md) — struct
- [mq3.game.bot_navigation.NavTrace](Type-mq3-game-bot-navigation-navtrace-1715501222.md) — struct
<a id="function-function-mq3-game-bot-navigation-nearbygoal-function-nearbygoal-services-bot-tfl-ltg-range-src-mq3-game-bot-navigation-ml-351652507"></a>
### nearbyGoal

```ml
function nearbyGoal(services, bot, tfl, ltg, range)
```

Use `services.carryingFlagFn`, `services.areaTravelTimeFn` and `services.chooseNbgFn` to perform `nearbyGoal`. Return paths include `services.chooseNbgFn(services,bot.gs,bot.origin,bot.inventory,tfl,ltg,range)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `carryingFlagFn`, `areaTravelTimeFn` and `chooseNbgFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `areanum`, `origin`, `teamGoal`, `gs` and `inventory`. |
| `tfl` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `ltg` | `dynamic` | — | Value passed as argument 6 to `services.chooseNbgFn`. |
| `range` | `dynamic` | — | Value passed as argument 7 to `services.chooseNbgFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L735)

<a id="function-function-mq3-game-bot-navigation-need-function-need-callback-label-src-mq3-game-bot-navigation-ml-1070418083"></a>
### need

```ml
function need(callback, label)
```

Require a navigation service callback and report the missing service by name.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `callback` | `dynamic` | — | Callback invoked by this operation. |
| `label` | `dynamic` | — | Label retained with the diagnostic or action record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L383)

<a id="function-function-mq3-game-bot-navigation-notifylongterm-function-notifylongterm-services-bot-event-target-src-mq3-game-bot-navigation-ml-347140786"></a>
### notifyLongTerm

```ml
function notifyLongTerm(services, bot, event, target)
```

Use `services.notifyFn` to perform `notifyLongTerm`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `notifyFn`. |
| `bot` | `dynamic` | — | Value passed as argument 2 to `services.notifyFn`. |
| `event` | `dynamic` | — | Player or entity event identifier. |
| `target` | `dynamic` | — | Value passed as argument 4 to `services.notifyFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L768)

<a id="constant-constant-mq3-game-bot-navigation-patrol-back-const-patrol-back-aiheaders-patrol-back-src-mq3-game-bot-navigation-ml-187283351"></a>
### PATROL_BACK

```ml
const PATROL_BACK = aiheaders.PATROL_BACK
```

Patrol behavior flag enabling back.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L80)

<a id="constant-constant-mq3-game-bot-navigation-pmf-ducked-const-pmf-ducked-1-src-mq3-game-bot-navigation-ml-556399470"></a>
### PMF_DUCKED

```ml
const PMF_DUCKED = 1
```

Player movement-state bit indicating ducked.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L13)

<a id="constant-constant-mq3-game-bot-navigation-pmf-time-knockback-const-pmf-time-knockback-64-src-mq3-game-bot-navigation-ml-422064655"></a>
### PMF_TIME_KNOCKBACK

```ml
const PMF_TIME_KNOCKBACK = 64
```

Player movement-state bit indicating time knockback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L15)

<a id="constant-constant-mq3-game-bot-navigation-pmf-time-waterjump-const-pmf-time-waterjump-256-src-mq3-game-bot-navigation-ml-1615684146"></a>
### PMF_TIME_WATERJUMP

```ml
const PMF_TIME_WATERJUMP = 256
```

Player movement-state bit indicating time waterjump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L17)

<a id="function-function-mq3-game-bot-navigation-popactivategoal-function-popactivategoal-services-bot-src-mq3-game-bot-navigation-ml-1908882351"></a>
### popActivateGoal

```ml
function popActivateGoal(services, bot)
```

Set `bot.activateStackIndex` to `goal.nextIndex` in `mq3.game.bot_navigation.popActivateGoal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `floatTimeFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `activateStackIndex` and `activateGoalHeap`. May update `bot.activateStackIndex` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L528)

<a id="function-function-mq3-game-bot-navigation-predictobstacles-function-predictobstacles-services-bot-goal-enabled-src-mq3-game-bot-navigation-ml-6838247"></a>
### predictObstacles

```ml
function predictObstacles(services, bot, goal, enabled)
```

Set `bot.predictobstaclesGoalareanum` to `goal.areanum` and `bot.predictobstaclesTime` to `need(services.floatTimeFn,"FloatTime")(services)` in `mq3.game.bot_navigation.predictObstacles`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `floatTimeFn`, `predictRouteFn`, `modelEntityFn`, `getActivateGoalFn` and `activationStackInUseFn` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `predictobstaclesGoalareanum`, `predictobstaclesTime`, `areanum`, `origin` and `tfl`. May update `bot.predictobstaclesGoalareanum` and `bot.predictobstaclesTime` in place. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `areanum` and `entitynum`. |
| `enabled` | `dynamic` | — | Value used by `predictObstacles` in `if not enabled then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L428)

<a id="function-function-mq3-game-bot-navigation-prepareactivator-function-prepareactivator-services-bot-entity-activategoal-kind-src-mq3-game-bot-navigation-ml-1207471834"></a>
### prepareActivator

```ml
function prepareActivator(services, bot, entity, activategoal, kind)
```

Update `activategoal.time` during `prepareActivator`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `buttonActivateGoalFn`, `triggerActivateGoalFn`, `areaReachabilityFn`, `areaTravelTimeFn` and `floatTimeFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `areanum`, `origin` and `tfl`. |
| `entity` | `dynamic` | — | Value used by `prepareActivator` in `if kind==1 then okay=need(services.buttonActivateGoalFn,"BotFuncButtonActivateGoal")(services,bot,entity,activat...`. |
| `activategoal` | `dynamic` | — | Activategoal record; accesses `goal` and `time`. May update `activategoal.time` in place. |
| `kind` | `dynamic` | — | Value used by `prepareActivator` in `if kind==1 then okay=need(services.buttonActivateGoalFn,"BotFuncButtonActivateGoal")(services,bot,entity,activat...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L601)

<a id="constant-constant-mq3-game-bot-navigation-presence-crouch-const-presence-crouch-aiheaders-presence-crouch-src-mq3-game-bot-navigation-ml-317996811"></a>
### PRESENCE_CROUCH

```ml
const PRESENCE_CROUCH = aiheaders.PRESENCE_CROUCH
```

AAS presence-mask value selecting the crouch collision shape.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L21)

<a id="constant-constant-mq3-game-bot-navigation-presence-normal-const-presence-normal-aiheaders-presence-normal-src-mq3-game-bot-navigation-ml-537439196"></a>
### PRESENCE_NORMAL

```ml
const PRESENCE_NORMAL = aiheaders.PRESENCE_NORMAL
```

AAS presence-mask value selecting the normal collision shape.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L19)

<a id="function-function-mq3-game-bot-navigation-pushactivategoal-function-pushactivategoal-services-bot-activategoal-src-mq3-game-bot-navigation-ml-358361399"></a>
### pushActivateGoal

```ml
function pushActivateGoal(services, bot, activategoal)
```

Set `bot.activateGoalHeap[best]` to `stored` and `bot.activateStackIndex` to `best` in `mq3.game.bot_navigation.pushActivateGoal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `floatTimeFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `activateGoalHeap` and `activateStackIndex`. May update `bot.activateGoalHeap[best]` and `bot.activateStackIndex` in place. |
| `activategoal` | `dynamic` | — | Parser source state; accesses `goal`, `areas`, `inuse`, `time` and `startTime` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L536)

<a id="function-function-mq3-game-bot-navigation-randommove-function-randommove-services-bot-moveresult-src-mq3-game-bot-navigation-ml-93353593"></a>
### randomMove

```ml
function randomMove(services, bot, moveresult)
```

Set `moveresult.failure` to `false` and `moveresult.movedir` to `[direction[0],direction[1],direction[2]]` in `mq3.game.bot_navigation.randomMove`. Return paths include `moveresult`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `randomFn` and `moveInDirectionFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ms`. |
| `moveresult` | `dynamic` | — | Moveresult record; accesses `failure` and `movedir`. May update `moveresult.failure` and `moveresult.movedir` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L415)

<a id="function-function-mq3-game-bot-navigation-reachedgoal-function-reachedgoal-services-bot-goal-src-mq3-game-bot-navigation-ml-1814535228"></a>
### reachedGoal

```ml
function reachedGoal(services, bot, goal)
```

Use `services.touchingGoalFn`, `services.setAvoidGoalTimeFn` and `services.itemNotVisibleFn` to perform `reachedGoal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `touchingGoalFn`, `setAvoidGoalTimeFn`, `itemNotVisibleFn`, `swimmingFn` and `floatTimeFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `origin`, `gs`, `entitynum`, `eye` and `viewangles` and related fields. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `flags`, `number`, `areanum`, `origin` and `mins` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L742)

<a id="function-function-mq3-game-bot-navigation-resetactivategoal-function-resetactivategoal-goal-src-mq3-game-bot-navigation-ml-374728477"></a>
### resetActivateGoal

```ml
function resetActivateGoal(goal)
```

Update `goal.inuse`, `goal.time`, `goal.startTime` and `goal.justusedTime` and related state during `resetActivateGoal`. Return paths include `goal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `inuse`, `time`, `startTime`, `justusedTime` and `origin` and related fields. May update `goal.inuse`, `goal.time` and `goal.startTime` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L569)

- [mq3.game.bot_navigation.Route](Type-mq3-game-bot-navigation-route-702984309.md) — struct
<a id="constant-constant-mq3-game-bot-navigation-rse-entercontents-const-rse-entercontents-4-src-mq3-game-bot-navigation-ml-2099735725"></a>
### RSE_ENTERCONTENTS

```ml
const RSE_ENTERCONTENTS = 4
```

AAS route-prediction stop-event flag for entercontents.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L37)

<a id="constant-constant-mq3-game-bot-navigation-rse-usetraveltype-const-rse-usetraveltype-2-src-mq3-game-bot-navigation-ml-365748795"></a>
### RSE_USETRAVELTYPE

```ml
const RSE_USETRAVELTYPE = 2
```

AAS route-prediction stop-event flag for usetraveltype.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L35)

<a id="function-function-mq3-game-bot-navigation-samevector-function-samevector-a-b-src-mq3-game-bot-navigation-ml-497313439"></a>
### sameVector

```ml
function sameVector(a, b)
```

Test `a[0]==b[0] and a[1]==b[1] and a[2]==b[2]` as the condition for `sameVector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L575)

- [mq3.game.bot_navigation.Services](Type-mq3-game-bot-navigation-services-1677460312.md) — struct
<a id="function-function-mq3-game-bot-navigation-setmovedir-function-setmovedir-angles-src-mq3-game-bot-navigation-ml-736502728"></a>
### setMovedir

```ml
function setMovedir(angles)
```

Store a movement direction in the bot navigation command state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L405)

<a id="function-function-mq3-game-bot-navigation-setupformovement-function-setupformovement-services-bot-src-mq3-game-bot-navigation-ml-1681068269"></a>
### setupForMovement

```ml
function setupForMovement(services, bot)
```

Apply `mq3.game.bot_navigation.need` while evaluating `setupForMovement`. Return paths include `initmove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `initMoveStateFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `curPs`, `entitynum`, `client`, `thinktime` and `viewangles` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L388)

<a id="constant-constant-mq3-game-bot-navigation-team-red-const-team-red-1-src-mq3-game-bot-navigation-ml-1484279148"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```

Team identifier selecting the red team/category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L47)

<a id="constant-constant-mq3-game-bot-navigation-tfl-bridge-const-tfl-bridge-67108864-src-mq3-game-bot-navigation-ml-683843367"></a>
### TFL_BRIDGE

```ml
const TFL_BRIDGE = 67108864
```

AAS travel-mask bit allowing the bridge travel category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L45)

<a id="constant-constant-mq3-game-bot-navigation-tfl-default-const-tfl-default-18616254-src-mq3-game-bot-navigation-ml-371703142"></a>
### TFL_DEFAULT

```ml
const TFL_DEFAULT = 18616254
```

Default combination of permitted AAS travel types used by bot movement queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L84)

<a id="function-function-mq3-game-bot-navigation-updatemovingteamgoal-function-updatemovingteamgoal-services-bot-entity-teamgoal-src-mq3-game-bot-navigation-ml-637051612"></a>
### updateMovingTeamGoal

```ml
function updateMovingTeamGoal(services, bot, entity, teamGoal)
```

Update `teamGoal.entitynum`, `teamGoal.areanum`, `teamGoal.origin` and `teamGoal.mins` and related state during `updateMovingTeamGoal`. Return paths include `info`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `pointAreaFn` and `areaReachabilityFn`. |
| `bot` | `dynamic` | — | Not read by this implementation; retained in the `updateMovingTeamGoal` signature. |
| `entity` | `dynamic` | — | Operand used to evaluate the returned expression `need(services.entityLongTermInfoFn,"BotEntityInfo")(services,entity)`. |
| `teamGoal` | `dynamic` | — | Team goal record; accesses `entitynum`, `areanum`, `origin`, `mins` and `maxs`. May update `teamGoal.entitynum`, `teamGoal.areanum` and `teamGoal.origin` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L782)

<a id="function-function-mq3-game-bot-navigation-wantstocamp-function-wantstocamp-services-bot-src-mq3-game-bot-navigation-ml-1630998471"></a>
### wantsToCamp

```ml
function wantsToCamp(services, bot)
```

Set `bot.campTime` to `services.floatTimeFn(services)` and `bot.ordered` to `false` in `mq3.game.bot_navigation.wantsToCamp`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `characteristicFn`, `floatTimeFn`, `randomFn`, `aggressionFn` and `nextCampSpotFn` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `character`, `ltgtype`, `campTime`, `inventory` and `areanum` and related fields. May update `bot.campTime` and `bot.ordered` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L683)

- [mq3.game.bot_navigation.Waypoint](Type-mq3-game-bot-navigation-waypoint-1377048671.md) — struct
