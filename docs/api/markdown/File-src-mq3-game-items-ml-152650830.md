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

Set `ent.client.ps.ammo[weapon]` to `n.add32(ent.client.ps.ammo[weapon],count)` and `ent.client.ps.ammo[weapon]` to `200` in `mq3.game.items.addAmmo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `client`. May update `ent.client.ps.ammo[weapon]` in place. |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L315)

<a id="function-function-mq3-game-items-addteamscore-function-addteamscore-level-origin-team-score-src-mq3-game-items-ml-1650219801"></a>
### addTeamScore

```ml
function addTeamScore(level, origin, team, score)
```

Set `level.teamScores[team]` to `n.add32(level.teamScores[team],score)` in `mq3.game.items.addTeamScore`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamScores`. May update `level.teamScores[team]` in place. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `score` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.add32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L383)

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

Update `ent.s.pos.trDelta`, `ent.s.pos.trDelta[axis]`, `hit.endpos[2]` and `ent.s.groundEntityNum` and related state during `bounce`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `previousTime` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `physicsBounce` and `r`. May update `ent.s.pos.trDelta`, `ent.s.pos.trDelta[axis]` and `ent.s.groundEntityNum` and additional fields in place. |
| `hit` | `dynamic` | — | Hit record; accesses `trace`, `endpos` and `entityNum`. May update `hit.endpos[2]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L776)

<a id="function-function-mq3-game-items-cangrab-function-cangrab-gametype-ent-state-src-mq3-game-items-ml-570626090"></a>
### canGrab

```ml
function canGrab(gametype, ent, state)
```

Apply `mq3.game.spawn_tables.items`, `mq3.game.constants.missionpackItemType` and `mq3.game.constants.missionpackItemTag` while evaluating `canGrab`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gametype` | `dynamic` | — | Value used by `canGrab` in `if gametype == 7 then return true end if`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `state` | `dynamic` | — | Items state; accesses `ammo`, `stats`, `persistant` and `powerups`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L205)

<a id="function-function-mq3-game-items-captureflagsound-function-captureflagsound-level-ent-team-src-mq3-game-items-ml-1710861568"></a>
### captureFlagSound

```ml
function captureFlagSound(level, ent, team)
```

Apply `mq3.game.entities.tempEntity` while evaluating `captureFlagSound`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L428)

<a id="function-function-mq3-game-items-centeredrandom-function-centeredrandom-level-src-mq3-game-items-ml-1464189536"></a>
### centeredRandom

```ml
function centeredRandom(level)
```

Return `2.0*(n.fdiv(game.random(level),32767)-0.5)` for `centeredRandom`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `randSeed`. May update `level.randSeed` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L103)

<a id="function-function-mq3-game-items-checkdropped-function-checkdropped-level-dropped-src-mq3-game-items-ml-437498442"></a>
### checkDropped

```ml
function checkDropped(level, dropped)
```

Apply `mq3.game.items.modeItemTag` and `mq3.game.items.setFlagStatus` while evaluating `checkDropped`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `dropped` | `dynamic` | — | Dropped record; accesses `item`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L570)

<a id="function-function-mq3-game-items-checkteamitems-function-checkteamitems-level-src-mq3-game-items-ml-883833716"></a>
### checkTeamItems

```ml
function checkTeamItems(level)
```

Apply `mq3.game.items.initTeamGame`, `mq3.game.items.itemInitializationPrint` and `mq3.game.items.missionpack` while evaluating `checkTeamItems`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `itemRegistered`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L173)

<a id="function-function-mq3-game-items-clearregistered-function-clearregistered-level-src-mq3-game-items-ml-1511988234"></a>
### clearRegistered

```ml
function clearRegistered(level)
```

Set `level.itemRegistered[index]` to `0` in `mq3.game.items.clearRegistered`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `itemRegistered` and `spawner`. May update `level.itemRegistered[index]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L125)

<a id="function-function-mq3-game-items-drop-function-drop-level-ent-item-angle-src-mq3-game-items-ml-2047254707"></a>
### drop

```ml
function drop(level, ent, item, angle)
```

Apply `mq3.game.movement.copy`, `mq3.game.items.centeredRandom` and `mq3.game.items.launch` while evaluating `drop`. Return paths include `launch(level,item,ent.s.pos.trBase,velocity)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `randSeed`. May update `level.randSeed` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `item` | `dynamic` | — | Index of the entry to access. |
| `angle` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fadd`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L766)

<a id="function-function-mq3-game-items-droppedflagthink-function-droppedflagthink-level-ent-src-mq3-game-items-ml-940351711"></a>
### droppedFlagThink

```ml
function droppedFlagThink(level, ent)
```

Apply `mq3.game.items.modeItemTag`, `mq3.game.items.returnFlagSound` and `mq3.game.items.resetFlag` while evaluating `droppedFlagThink`. Return paths include `returnFlagSound(level,resetFlag(level,team),team)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L735)

<a id="function-function-mq3-game-items-findclass-function-findclass-level-after-name-src-mq3-game-items-ml-777522933"></a>
### findClass

```ml
function findClass(level, after, name)
```

Find the next active entity with a case-insensitive class-name match for items.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `after` | `dynamic` | — | After record; accesses `slot`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L670)

<a id="function-function-mq3-game-items-finishspawning-function-finishspawning-level-ent-src-mq3-game-items-ml-1275622787"></a>
### finishSpawning

```ml
function finishSpawning(level, ent)
```

Update `ent.r.mins`, `ent.r.maxs`, `ent.s.eType` and `ent.s.modelindex` and related state during `finishSpawning`. Return paths include `game.link(level,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`, `r`, `s`, `touch` and `use` and related fields. May update `ent.r.mins`, `ent.r.maxs` and `ent.s.eType` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L617)

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

Set the forced-gesture flag on every active client belonging to the selected team.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L400)

<a id="function-function-mq3-game-items-initteamgame-function-initteamgame-level-src-mq3-game-items-ml-104231560"></a>
### initTeamGame

```ml
function initTeamGame(level)
```

Update `level.lastFlagCapture`, `level.lastCaptureTeam`, `level.redFlagStatus` and `level.blueFlagStatus` and related state during `initTeamGame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `lastFlagCapture`, `lastCaptureTeam`, `redFlagStatus`, `blueFlagStatus` and `neutralFlagStatus` and related fields. May update `level.lastFlagCapture`, `level.lastCaptureTeam` and `level.redFlagStatus` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L155)

<a id="function-function-mq3-game-items-iteminitializationprint-function-iteminitializationprint-level-text-src-mq3-game-items-ml-772366405"></a>
### itemInitializationPrint

```ml
function itemInitializationPrint(level, text)
```

Use `level.gamePrintFn` to perform `itemInitializationPrint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L137)

<a id="function-function-mq3-game-items-itemname-function-itemname-index-src-mq3-game-items-ml-1693447782"></a>
### itemName

```ml
function itemName(index)
```

Return `tables.items()[requireItem(index)]` for `itemName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L46)

<a id="function-function-mq3-game-items-itemquantity-function-itemquantity-index-src-mq3-game-items-ml-1153289734"></a>
### itemQuantity

```ml
function itemQuantity(index)
```

Apply `mq3.game.items.requireItem` and `mq3.game.constants.itemQuantity` while evaluating `itemQuantity`. Return paths include `c.itemQuantity(index)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L61)

<a id="function-function-mq3-game-items-itemtag-function-itemtag-index-src-mq3-game-items-ml-2137092172"></a>
### itemTag

```ml
function itemTag(index)
```

Apply `mq3.game.items.requireItem` and `mq3.game.constants.itemTag` while evaluating `itemTag`. Return paths include `c.itemTag(index)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L56)

<a id="function-function-mq3-game-items-itemtype-function-itemtype-index-src-mq3-game-items-ml-1816840130"></a>
### itemType

```ml
function itemType(index)
```

Apply `mq3.game.items.requireItem` and `mq3.game.constants.itemType` while evaluating `itemType`. Return paths include `c.itemType(index)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L51)

<a id="function-function-mq3-game-items-launch-function-launch-level-item-origin-velocity-src-mq3-game-items-ml-118364562"></a>
### launch

```ml
function launch(level, item, origin, velocity)
```

Apply `mq3.game.items.requireModeItem`, `mq3.game.entities.spawn` and `mq3.game.items.modeItemName` while evaluating `launch`. Return paths include `dropped`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time` and `spawner`. |
| `item` | `dynamic` | — | Index of the entry to access. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `velocity` | `dynamic` | — | Three-component movement velocity. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L746)

<a id="function-function-mq3-game-items-missionpack-function-missionpack-level-src-mq3-game-items-ml-1351554606"></a>
### missionpack

```ml
function missionpack(level)
```

Test `level != void and level.spawner != void and level.spawner.missionpack` as the condition for `missionpack`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L66)

<a id="function-function-mq3-game-items-modeitemname-function-modeitemname-level-index-src-mq3-game-items-ml-1108544"></a>
### modeItemName

```ml
function modeItemName(level, index)
```

Apply `mq3.game.items.requireModeItem`, `mq3.game.items.missionpack` and `mq3.game.spawn_tables.missionpackItems` while evaluating `modeItemName`. Return paths include `tables.items()[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L80)

<a id="function-function-mq3-game-items-modeitemquantity-function-modeitemquantity-level-index-src-mq3-game-items-ml-920410420"></a>
### modeItemQuantity

```ml
function modeItemQuantity(level, index)
```

Apply `mq3.game.items.requireModeItem`, `mq3.game.items.missionpack` and `mq3.game.constants.missionpackItemQuantity` while evaluating `modeItemQuantity`. Return paths include `c.itemQuantity(index)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L98)

<a id="function-function-mq3-game-items-modeitemtag-function-modeitemtag-level-index-src-mq3-game-items-ml-295452176"></a>
### modeItemTag

```ml
function modeItemTag(level, index)
```

Apply `mq3.game.items.requireModeItem`, `mq3.game.items.missionpack` and `mq3.game.constants.missionpackItemTag` while evaluating `modeItemTag`. Return paths include `c.itemTag(index)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L92)

<a id="function-function-mq3-game-items-modeitemtype-function-modeitemtype-level-index-src-mq3-game-items-ml-1114185736"></a>
### modeItemType

```ml
function modeItemType(level, index)
```

Apply `mq3.game.items.requireModeItem`, `mq3.game.items.missionpack` and `mq3.game.constants.missionpackItemType` while evaluating `modeItemType`. Return paths include `c.itemType(index)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L86)

<a id="function-function-mq3-game-items-pickupammo-function-pickupammo-level-ent-other-src-mq3-game-items-ml-803528847"></a>
### pickupAmmo

```ml
function pickupAmmo(level, ent, other)
```

Apply `mq3.game.items.modeItemQuantity`, `mq3.game.items.addAmmo` and `mq3.game.items.modeItemTag` while evaluating `pickupAmmo`. Return paths include `40`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item` and `count`. |
| `other` | `dynamic` | — | Game entity; accesses `client`. May update `other.client.ps.ammo[weapon]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L324)

<a id="function-function-mq3-game-items-pickuparmor-function-pickuparmor-level-ent-other-src-mq3-game-items-ml-166727021"></a>
### pickupArmor

```ml
function pickupArmor(level, ent, other)
```

Set `other.client.ps.stats[c.STAT_ARMOR]` to `value` in `mq3.game.items.pickupArmor`. Return paths include `25`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`. |
| `other` | `dynamic` | — | Other record; accesses `client`. May update `other.client.ps.stats[c.STAT_ARMOR]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L364)

<a id="function-function-mq3-game-items-pickuphealth-function-pickuphealth-level-ent-other-src-mq3-game-items-ml-483808959"></a>
### pickupHealth

```ml
function pickupHealth(level, ent, other)
```

Update `other.health` and `other.client.ps.stats[c.STAT_HEALTH]` during `pickupHealth`. Return paths include `35`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item` and `count`. |
| `other` | `dynamic` | — | Other record; accesses `client` and `health`. May update `other.health` and `other.client.ps.stats[c.STAT_HEALTH]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L350)

<a id="function-function-mq3-game-items-pickupholdable-function-pickupholdable-level-ent-other-src-mq3-game-items-ml-1524125111"></a>
### pickupHoldable

```ml
function pickupHoldable(level, ent, other)
```

Set `other.client.ps.stats[c.STAT_HOLDABLE_ITEM]` to `ent.item` and `other.client.ps.eFlags` to `other.client.ps.eFlags | 0x200` in `mq3.game.items.pickupHoldable`. Return paths include `60`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`. |
| `other` | `dynamic` | — | Other record; accesses `client`. May update `other.client.ps.stats[c.STAT_HOLDABLE_ITEM]` and `other.client.ps.eFlags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L306)

<a id="function-function-mq3-game-items-pickuppersistantpowerup-function-pickuppersistantpowerup-level-ent-other-src-mq3-game-items-ml-670138089"></a>
### pickupPersistantPowerup

```ml
function pickupPersistantPowerup(level, ent, other)
```

Update `other.client.ps.stats[7]`, `other.client.persistantPowerup`, `other.health` and `other.client.ps.stats[c.STAT_HEALTH]` and related state during `pickupPersistantPowerup`. Return paths include `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`. |
| `other` | `dynamic` | — | Other record; accesses `client` and `health`. May update `other.client.ps.stats[7]`, `other.client.persistantPowerup` and `other.health` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L264)

<a id="function-function-mq3-game-items-pickuppowerup-function-pickuppowerup-level-ent-other-src-mq3-game-items-ml-172727803"></a>
### pickupPowerup

```ml
function pickupPowerup(level, ent, other)
```

Apply `mq3.game.items.modeItemTag`, `mq3.game.items.modeItemQuantity` and `mq3.game.combat.shotTrace` while evaluating `pickupPowerup`. Return paths include `120`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `maxclients`, `clients` and `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`, `count` and `s`. |
| `other` | `dynamic` | — | Other record; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L283)

<a id="function-function-mq3-game-items-pickupteam-function-pickupteam-level-ent-other-src-mq3-game-items-ml-2094974231"></a>
### pickupTeam

```ml
function pickupTeam(level, ent, other)
```

Apply `mq3.game.items.teamMessage`, `mq3.game.items.touchOurFlag` and `mq3.game.items.touchEnemyFlag` while evaluating `pickupTeam`. Return paths include `touchEnemyFlag(level,ent,other,team)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamMessageFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `classname`. |
| `other` | `dynamic` | — | Other record; accesses `slot` and `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L495)

<a id="function-function-mq3-game-items-pickupweapon-function-pickupweapon-level-ent-other-src-mq3-game-items-ml-1038016751"></a>
### pickupWeapon

```ml
function pickupWeapon(level, ent, other)
```

Set `other.client.ps.stats[c.STAT_WEAPONS]` to `other.client.ps.stats[c.STAT_WEAPONS] | (1 << tag)` and `other.client.ps.ammo[tag]` to `-1` in `mq3.game.items.pickupWeapon`. Return paths include `level.weaponRespawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `weaponTeamRespawn` and `weaponRespawn`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`, `count` and `flags`. |
| `other` | `dynamic` | — | Other record; accesses `client`. May update `other.client.ps.stats[c.STAT_WEAPONS]` and `other.client.ps.ammo[tag]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L332)

<a id="function-function-mq3-game-items-predictableevent-function-predictableevent-level-ent-event-parm-src-mq3-game-items-ml-286193555"></a>
### predictableEvent

```ml
function predictableEvent(level, ent, event, parm)
```

Append an item event and parameter to the two-slot player-state event ring.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `predictableEvent` signature. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. |
| `event` | `dynamic` | — | Player or entity event identifier. |
| `parm` | `dynamic` | — | Integer parameter stored alongside the emitted event. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L196)

<a id="function-function-mq3-game-items-register-function-register-level-item-src-mq3-game-items-ml-1052804565"></a>
### register

```ml
function register(level, item)
```

Set `level.itemRegistered[item]` to `1` in `mq3.game.items.register`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `itemRegistered`. May update `level.itemRegistered[item]` in place. |
| `item` | `dynamic` | — | Value passed as argument 1 to `typeof`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L110)

<a id="function-function-mq3-game-items-requireitem-function-requireitem-index-src-mq3-game-items-ml-786196190"></a>
### requireItem

```ml
function requireItem(index)
```

Apply `mq3.game.items.validItem` while evaluating `requireItem`. Return paths include `index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L40)

<a id="function-function-mq3-game-items-requiremodeitem-function-requiremodeitem-level-index-src-mq3-game-items-ml-173365034"></a>
### requireModeItem

```ml
function requireModeItem(level, index)
```

Apply `mq3.game.spawn_tables.items`, `mq3.game.items.missionpack` and `mq3.game.spawn_tables.missionpackItems` while evaluating `requireModeItem`. Return paths include `index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L72)

<a id="function-function-mq3-game-items-resetflag-function-resetflag-level-team-src-mq3-game-items-ml-1924854209"></a>
### resetFlag

```ml
function resetFlag(level, team)
```

Apply `mq3.game.items.findClass`, `mq3.game.entities.free` and `mq3.game.items.respawn` while evaluating `resetFlag`. Return paths include `rent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L682)

<a id="function-function-mq3-game-items-resetflags-function-resetflags-level-src-mq3-game-items-ml-1321949576"></a>
### resetFlags

```ml
function resetFlags(level)
```

Apply `mq3.game.items.resetFlag` while evaluating `resetFlags`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L436)

<a id="function-function-mq3-game-items-respawn-function-respawn-level-ent-src-mq3-game-items-ml-731508059"></a>
### respawn

```ml
function respawn(level, ent)
```

Update `ent.r.contents`, `ent.s.eFlags`, `ent.r.svFlags` and `ent.nextthink` during `respawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`, `team`, `teammaster`, `r` and `s` and related fields. May update `ent.r.contents`, `ent.s.eFlags` and `ent.r.svFlags` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L580)

<a id="function-function-mq3-game-items-returnflag-function-returnflag-level-team-src-mq3-game-items-ml-841478751"></a>
### returnFlag

```ml
function returnFlag(level, team)
```

Use `level.teamMessageFn` to perform `returnFlag`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamMessageFn`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L715)

<a id="function-function-mq3-game-items-returnflagsound-function-returnflagsound-level-ent-team-src-mq3-game-items-ml-1434628518"></a>
### returnFlagSound

```ml
function returnFlagSound(level, ent, team)
```

Use `level.gamePrintFn` to perform `returnFlagSound`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L702)

<a id="function-function-mq3-game-items-run-function-run-level-ent-src-mq3-game-items-ml-222478425"></a>
### run

```ml
function run(level, ent)
```

Update `ent.s.pos.trType`, `ent.s.pos.trTime` and `ent.r.currentOrigin` during `run`. Return paths include `bounce(level,ent,hit)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time` and `scene`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`, `physicsObject`, `s`, `clipmask` and `r`. May update `ent.s.pos.trType`, `ent.s.pos.trTime` and `ent.r.currentOrigin` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L797)

<a id="function-function-mq3-game-items-saveregistered-function-saveregistered-level-src-mq3-game-items-ml-1905839832"></a>
### saveRegistered

```ml
function saveRegistered(level)
```

Apply `mq3.game.spawn_tables.items`, `mq3.game.items.missionpack` and `mq3.game.spawn_tables.missionpackItems` while evaluating `saveRegistered`. Return paths include `values.setConfig(level.spawner,27,decode(bits))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `itemRegistered` and `spawner`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L143)

<a id="function-function-mq3-game-items-setflagstatus-function-setflagstatus-level-team-status-src-mq3-game-items-ml-69767377"></a>
### setFlagStatus

```ml
function setFlagStatus(level, team, status)
```

Update `level.redFlagStatus`, `level.blueFlagStatus` and `level.neutralFlagStatus` during `setFlagStatus`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `redFlagStatus`, `blueFlagStatus`, `neutralFlagStatus` and `spawner`. May update `level.redFlagStatus`, `level.blueFlagStatus` and `level.neutralFlagStatus` in place. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `status` | `dynamic` | — | Value used by `setFlagStatus` in `if status < 0 or status > 4 then return error(497,"Invalid flag status") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L546)

<a id="function-function-mq3-game-items-spawnitem-function-spawnitem-level-ent-item-src-mq3-game-items-ml-914186626"></a>
### spawnItem

```ml
function spawnItem(level, ent, item)
```

Update `ent.random`, `ent.wait`, `ent.item` and `ent.nextthink` and related state during `spawnItem`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `random`, `wait`, `item`, `nextthink` and `think` and related fields. May update `ent.random`, `ent.wait` and `ent.item` and additional fields in place. |
| `item` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L652)

<a id="function-function-mq3-game-items-takeflagsound-function-takeflagsound-level-ent-team-src-mq3-game-items-ml-974912188"></a>
### takeFlagSound

```ml
function takeFlagSound(level, ent, team)
```

Set `level.blueTakenTime` to `level.time` and `level.redTakenTime` to `level.time` in `mq3.game.items.takeFlagSound`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `blueFlagStatus`, `blueTakenTime`, `time`, `redFlagStatus` and `redTakenTime`. May update `level.blueTakenTime` and `level.redTakenTime` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L411)

<a id="function-function-mq3-game-items-teamfree-function-teamfree-level-ent-src-mq3-game-items-ml-1771347227"></a>
### teamFree

```ml
function teamFree(level, ent)
```

Apply `mq3.game.items.modeItemTag` and `mq3.game.items.returnFlag` while evaluating `teamFree`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L725)

<a id="function-function-mq3-game-items-teammessage-function-teammessage-level-recipient-text-src-mq3-game-items-ml-1477040340"></a>
### teamMessage

```ml
function teamMessage(level, recipient, text)
```

Use `level.teamMessageFn` to perform `teamMessage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamMessageFn`. |
| `recipient` | `dynamic` | — | Value passed as argument 2 to `level.teamMessageFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L374)

<a id="function-function-mq3-game-items-touch-function-touch-level-ent-other-trace-src-mq3-game-items-ml-1643932484"></a>
### touch

```ml
function touch(level, ent, other, trace)
```

Update `ent.r.svFlags`, `ent.s.eFlags`, `ent.r.contents` and `ent.unlinkAfterEvent` and related state during `touch`. Return paths include `game.link(level,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `gameLogFn` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`, `s`, `speed`, `wait` and `r` and related fields. May update `ent.r.svFlags`, `ent.s.eFlags` and `ent.r.contents` and additional fields in place. |
| `other` | `dynamic` | — | Other record; accesses `client`, `health` and `s`. |
| `trace` | `dynamic` | — | Not read by this implementation; retained in the `touch` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L508)

<a id="function-function-mq3-game-items-touchenemyflag-function-touchenemyflag-level-ent-other-team-src-mq3-game-items-ml-1658598564"></a>
### touchEnemyFlag

```ml
function touchEnemyFlag(level, ent, other, team)
```

Apply `mq3.game.items.teamMessage`, `mq3.game.team_bonuses.teamName` and `mq3.game.items.setFlagStatus` while evaluating `touchEnemyFlag`. Return paths include `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `r`. |
| `other` | `dynamic` | — | Other record; accesses `client`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L484)

<a id="function-function-mq3-game-items-touchourflag-function-touchourflag-level-ent-other-team-src-mq3-game-items-ml-1065943288"></a>
### touchOurFlag

```ml
function touchOurFlag(level, ent, other, team)
```

Set `level.lastFlagCapture` to `n.f32(level.time)` and `level.lastCaptureTeam` to `team` in `mq3.game.items.touchOurFlag`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `lastFlagCapture`, `lastCaptureTeam`, `maxclients` and `entities`. May update `level.lastFlagCapture` and `level.lastCaptureTeam` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `flags`, `r` and `s`. |
| `other` | `dynamic` | — | Other record; accesses `client`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L445)

<a id="function-function-mq3-game-items-use-function-use-level-ent-other-activator-src-mq3-game-items-ml-457893442"></a>
### use

```ml
function use(level, ent, other, activator)
```

Forward `use` to `mq3.game.items.respawn` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`, `team`, `teammaster`, `r` and `s` and related fields. May update `ent.r.contents`, `ent.s.eFlags` and `ent.r.svFlags` and additional fields in place. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `use` signature. |
| `activator` | `dynamic` | — | Not read by this implementation; retained in the `use` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L611)

<a id="function-function-mq3-game-items-userhandicap-function-userhandicap-level-other-src-mq3-game-items-ml-291227894"></a>
### userHandicap

```ml
function userHandicap(level, other)
```

Use `level.userinfoFn` to perform `userHandicap`. Return paths include `handicap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `userinfoFn`. |
| `other` | `dynamic` | — | Other record; accesses `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L252)

<a id="function-function-mq3-game-items-validitem-function-validitem-index-src-mq3-game-items-ml-1734051572"></a>
### validItem

```ml
function validItem(index)
```

Test `typeof(index) == "int" and index > 0 and index < len(tables.items())` as the condition for `validItem`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/items.ml#L35)
