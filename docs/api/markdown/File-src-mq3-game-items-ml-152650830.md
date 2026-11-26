# `src/mq3/game/items.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.items`](Package-mq3-game-items-2109762454.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/combat.ml` as `itemCombat` → [src/mq3/game/combat.ml](File-src-mq3-game-combat-ml-473208184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/g_utils.ml` as `gUtils` → [src/mq3/game/g_utils.ml](File-src-mq3-game-g-utils-ml-808912811.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/scores.ml` as `scores` → [src/mq3/game/scores.ml](File-src-mq3-game-scores-ml-660975489.md)
- `mq3/game/snapshot.ml` as `snapshot` → [src/mq3/game/snapshot.ml](File-src-mq3-game-snapshot-ml-1144176980.md)
- `mq3/game/spawn_tables.ml` as `tables` → [src/mq3/game/spawn_tables.ml](File-src-mq3-game-spawn-tables-ml-2143892395.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `mq3/game/targets.ml` as `targets` → [src/mq3/game/targets.ml](File-src-mq3-game-targets-ml-1419507080.md)
- `mq3/game/team_bonuses.ml` as `bonuses` → [src/mq3/game/team_bonuses.ml](File-src-mq3-game-team-bonuses-ml-406479811.md)
- `mq3/game/trajectory.ml` as `trajectory` → [src/mq3/game/trajectory.ml](File-src-mq3-game-trajectory-ml-1278285327.md)
- `mq3/qcommon/cvar.ml` as `cv` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)
- `mq3/server/world.ml` as `sv` → [src/mq3/server/world.ml](File-src-mq3-server-world-ml-118313937.md)
- `mq3/shared/info.ml` as `infoStrings` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-items-addammo-function-addammo-ent-weapon-count-src-mq3-game-items-ml-2007310288"></a>
### addAmmo

```ml
function addAmmo(ent, weapon, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L242)

<a id="function-function-mq3-game-items-addteamscore-function-addteamscore-level-origin-team-score-src-mq3-game-items-ml-1650219801"></a>
### addTeamScore

```ml
function addTeamScore(level, origin, team, score)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `score` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L285)

<a id="constant-constant-mq3-game-items-award-mask-const-award-mask-231496-src-mq3-game-items-ml-1748135906"></a>
### AWARD_MASK

```ml
const AWARD_MASK = 231496
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L31)

<a id="function-function-mq3-game-items-bounce-function-bounce-level-ent-hit-src-mq3-game-items-ml-1467144814"></a>
### bounce

```ml
function bounce(level, ent, hit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `hit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L590)

<a id="function-function-mq3-game-items-cangrab-function-cangrab-gametype-ent-state-src-mq3-game-items-ml-570626090"></a>
### canGrab

```ml
function canGrab(gametype, ent, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gametype` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L151)

<a id="function-function-mq3-game-items-captureflagsound-function-captureflagsound-level-ent-team-src-mq3-game-items-ml-1710861568"></a>
### captureFlagSound

```ml
function captureFlagSound(level, ent, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L319)

<a id="function-function-mq3-game-items-centeredrandom-function-centeredrandom-level-src-mq3-game-items-ml-1464189536"></a>
### centeredRandom

```ml
function centeredRandom(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L72)

<a id="function-function-mq3-game-items-checkdropped-function-checkdropped-level-dropped-src-mq3-game-items-ml-437498442"></a>
### checkDropped

```ml
function checkDropped(level, dropped)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `dropped` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L433)

<a id="function-function-mq3-game-items-checkteamitems-function-checkteamitems-level-src-mq3-game-items-ml-883833716"></a>
### checkTeamItems

```ml
function checkTeamItems(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L128)

<a id="function-function-mq3-game-items-clearregistered-function-clearregistered-level-src-mq3-game-items-ml-1511988234"></a>
### clearRegistered

```ml
function clearRegistered(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L89)

<a id="function-function-mq3-game-items-drop-function-drop-level-ent-item-angle-src-mq3-game-items-ml-2047254707"></a>
### drop

```ml
function drop(level, ent, item, angle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |
| `angle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L584)

<a id="function-function-mq3-game-items-droppedflagthink-function-droppedflagthink-level-ent-src-mq3-game-items-ml-940351711"></a>
### droppedFlagThink

```ml
function droppedFlagThink(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L563)

<a id="function-function-mq3-game-items-findclass-function-findclass-level-after-name-src-mq3-game-items-ml-777522933"></a>
### findClass

```ml
function findClass(level, after, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `after` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L514)

<a id="function-function-mq3-game-items-finishspawning-function-finishspawning-level-ent-src-mq3-game-items-ml-1275622787"></a>
### finishSpawning

```ml
function finishSpawning(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L469)

<a id="constant-constant-mq3-game-items-fl-dropped-item-const-fl-dropped-item-4096-src-mq3-game-items-ml-1275240674"></a>
### FL_DROPPED_ITEM

```ml
const FL_DROPPED_ITEM = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L26)

<a id="constant-constant-mq3-game-items-fl-force-gesture-const-fl-force-gesture-32768-src-mq3-game-items-ml-1412434183"></a>
### FL_FORCE_GESTURE

```ml
const FL_FORCE_GESTURE = 32768
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L27)

<a id="constant-constant-mq3-game-items-flag-atbase-const-flag-atbase-0-src-mq3-game-items-ml-1903841837"></a>
### FLAG_ATBASE

```ml
const FLAG_ATBASE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L28)

<a id="constant-constant-mq3-game-items-flag-dropped-const-flag-dropped-4-src-mq3-game-items-ml-625112733"></a>
### FLAG_DROPPED

```ml
const FLAG_DROPPED = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L30)

<a id="constant-constant-mq3-game-items-flag-taken-const-flag-taken-1-src-mq3-game-items-ml-542537512"></a>
### FLAG_TAKEN

```ml
const FLAG_TAKEN = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L29)

<a id="function-function-mq3-game-items-forcegesture-function-forcegesture-level-team-src-mq3-game-items-ml-1416868247"></a>
### forceGesture

```ml
function forceGesture(level, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L299)

<a id="function-function-mq3-game-items-initteamgame-function-initteamgame-level-src-mq3-game-items-ml-104231560"></a>
### initTeamGame

```ml
function initTeamGame(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L112)

<a id="function-function-mq3-game-items-iteminitializationprint-function-iteminitializationprint-level-text-src-mq3-game-items-ml-772366405"></a>
### itemInitializationPrint

```ml
function itemInitializationPrint(level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L98)

<a id="function-function-mq3-game-items-itemname-function-itemname-index-src-mq3-game-items-ml-1693447782"></a>
### itemName

```ml
function itemName(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L40)

<a id="function-function-mq3-game-items-itemquantity-function-itemquantity-index-src-mq3-game-items-ml-1153289734"></a>
### itemQuantity

```ml
function itemQuantity(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L49)

<a id="function-function-mq3-game-items-itemtag-function-itemtag-index-src-mq3-game-items-ml-2137092172"></a>
### itemTag

```ml
function itemTag(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L46)

<a id="function-function-mq3-game-items-itemtype-function-itemtype-index-src-mq3-game-items-ml-1816840130"></a>
### itemType

```ml
function itemType(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L43)

<a id="function-function-mq3-game-items-launch-function-launch-level-item-origin-velocity-src-mq3-game-items-ml-118364562"></a>
### launch

```ml
function launch(level, item, origin, velocity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L569)

<a id="function-function-mq3-game-items-missionpack-function-missionpack-level-src-mq3-game-items-ml-1351554606"></a>
### missionpack

```ml
function missionpack(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L52)

<a id="function-function-mq3-game-items-modeitemname-function-modeitemname-level-index-src-mq3-game-items-ml-1108544"></a>
### modeItemName

```ml
function modeItemName(level, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L60)

<a id="function-function-mq3-game-items-modeitemquantity-function-modeitemquantity-level-index-src-mq3-game-items-ml-920410420"></a>
### modeItemQuantity

```ml
function modeItemQuantity(level, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L69)

<a id="function-function-mq3-game-items-modeitemtag-function-modeitemtag-level-index-src-mq3-game-items-ml-295452176"></a>
### modeItemTag

```ml
function modeItemTag(level, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L66)

<a id="function-function-mq3-game-items-modeitemtype-function-modeitemtype-level-index-src-mq3-game-items-ml-1114185736"></a>
### modeItemType

```ml
function modeItemType(level, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L63)

<a id="function-function-mq3-game-items-pickupammo-function-pickupammo-level-ent-other-src-mq3-game-items-ml-803528847"></a>
### pickupAmmo

```ml
function pickupAmmo(level, ent, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L247)

<a id="function-function-mq3-game-items-pickuparmor-function-pickuparmor-level-ent-other-src-mq3-game-items-ml-166727021"></a>
### pickupArmor

```ml
function pickupArmor(level, ent, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L275)

<a id="function-function-mq3-game-items-pickuphealth-function-pickuphealth-level-ent-other-src-mq3-game-items-ml-483808959"></a>
### pickupHealth

```ml
function pickupHealth(level, ent, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L265)

<a id="function-function-mq3-game-items-pickupholdable-function-pickupholdable-level-ent-other-src-mq3-game-items-ml-1524125111"></a>
### pickupHoldable

```ml
function pickupHoldable(level, ent, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L237)

<a id="function-function-mq3-game-items-pickuppersistantpowerup-function-pickuppersistantpowerup-level-ent-other-src-mq3-game-items-ml-670138089"></a>
### pickupPersistantPowerup

```ml
function pickupPersistantPowerup(level, ent, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L203)

<a id="function-function-mq3-game-items-pickuppowerup-function-pickuppowerup-level-ent-other-src-mq3-game-items-ml-172727803"></a>
### pickupPowerup

```ml
function pickupPowerup(level, ent, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L218)

<a id="function-function-mq3-game-items-pickupteam-function-pickupteam-level-ent-other-src-mq3-game-items-ml-2094974231"></a>
### pickupTeam

```ml
function pickupTeam(level, ent, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L370)

<a id="function-function-mq3-game-items-pickupweapon-function-pickupweapon-level-ent-other-src-mq3-game-items-ml-1038016751"></a>
### pickupWeapon

```ml
function pickupWeapon(level, ent, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L251)

<a id="function-function-mq3-game-items-predictableevent-function-predictableevent-level-ent-event-parm-src-mq3-game-items-ml-286193555"></a>
### predictableEvent

```ml
function predictableEvent(level, ent, event, parm)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |
| `parm` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L146)

<a id="function-function-mq3-game-items-register-function-register-level-item-src-mq3-game-items-ml-1052804565"></a>
### register

```ml
function register(level, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L76)

<a id="function-function-mq3-game-items-requireitem-function-requireitem-index-src-mq3-game-items-ml-786196190"></a>
### requireItem

```ml
function requireItem(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L36)

<a id="function-function-mq3-game-items-requiremodeitem-function-requiremodeitem-level-index-src-mq3-game-items-ml-173365034"></a>
### requireModeItem

```ml
function requireModeItem(level, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L55)

<a id="function-function-mq3-game-items-resetflag-function-resetflag-level-team-src-mq3-game-items-ml-1924854209"></a>
### resetFlag

```ml
function resetFlag(level, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L523)

<a id="function-function-mq3-game-items-resetflags-function-resetflags-level-src-mq3-game-items-ml-1321949576"></a>
### resetFlags

```ml
function resetFlags(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L325)

<a id="function-function-mq3-game-items-respawn-function-respawn-level-ent-src-mq3-game-items-ml-731508059"></a>
### respawn

```ml
function respawn(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L440)

<a id="function-function-mq3-game-items-returnflag-function-returnflag-level-team-src-mq3-game-items-ml-841478751"></a>
### returnFlag

```ml
function returnFlag(level, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L549)

<a id="function-function-mq3-game-items-returnflagsound-function-returnflagsound-level-ent-team-src-mq3-game-items-ml-1434628518"></a>
### returnFlagSound

```ml
function returnFlagSound(level, ent, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L539)

<a id="function-function-mq3-game-items-run-function-run-level-ent-src-mq3-game-items-ml-222478425"></a>
### run

```ml
function run(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L608)

<a id="function-function-mq3-game-items-saveregistered-function-saveregistered-level-src-mq3-game-items-ml-1905839832"></a>
### saveRegistered

```ml
function saveRegistered(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L102)

<a id="function-function-mq3-game-items-setflagstatus-function-setflagstatus-level-team-status-src-mq3-game-items-ml-69767377"></a>
### setFlagStatus

```ml
function setFlagStatus(level, team, status)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `status` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L412)

<a id="function-function-mq3-game-items-spawnitem-function-spawnitem-level-ent-item-src-mq3-game-items-ml-914186626"></a>
### spawnItem

```ml
function spawnItem(level, ent, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L500)

<a id="function-function-mq3-game-items-takeflagsound-function-takeflagsound-level-ent-team-src-mq3-game-items-ml-974912188"></a>
### takeFlagSound

```ml
function takeFlagSound(level, ent, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L306)

<a id="function-function-mq3-game-items-teamfree-function-teamfree-level-ent-src-mq3-game-items-ml-1771347227"></a>
### teamFree

```ml
function teamFree(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L556)

<a id="function-function-mq3-game-items-teammessage-function-teammessage-level-recipient-text-src-mq3-game-items-ml-1477040340"></a>
### teamMessage

```ml
function teamMessage(level, recipient, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `recipient` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L281)

<a id="function-function-mq3-game-items-touch-function-touch-level-ent-other-trace-src-mq3-game-items-ml-1643932484"></a>
### touch

```ml
function touch(level, ent, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L378)

<a id="function-function-mq3-game-items-touchenemyflag-function-touchenemyflag-level-ent-other-team-src-mq3-game-items-ml-1658598564"></a>
### touchEnemyFlag

```ml
function touchEnemyFlag(level, ent, other, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L363)

<a id="function-function-mq3-game-items-touchourflag-function-touchourflag-level-ent-other-team-src-mq3-game-items-ml-1065943288"></a>
### touchOurFlag

```ml
function touchOurFlag(level, ent, other, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L329)

<a id="function-function-mq3-game-items-use-function-use-level-ent-other-activator-src-mq3-game-items-ml-457893442"></a>
### use

```ml
function use(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L466)

<a id="function-function-mq3-game-items-userhandicap-function-userhandicap-level-other-src-mq3-game-items-ml-291227894"></a>
### userHandicap

```ml
function userHandicap(level, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L195)

<a id="function-function-mq3-game-items-validitem-function-validitem-index-src-mq3-game-items-ml-1734051572"></a>
### validItem

```ml
function validItem(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L33)
