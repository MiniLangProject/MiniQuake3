# `src/mq3/game/deaths.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.deaths`](Package-mq3-game-deaths-1661308529.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/bodies.ml` as `bodies` → [src/mq3/game/bodies.ml](File-src-mq3-game-bodies-ml-247011888.md)
- `mq3/game/client_spawn.ml` as `clientSpawn` → [src/mq3/game/client_spawn.ml](File-src-mq3-game-client-spawn-ml-1352690125.md)
- `mq3/game/combat_missionpack.ml` as `combatMissionpack` → [src/mq3/game/combat_missionpack.ml](File-src-mq3-game-combat-missionpack-ml-607885236.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/g_items.ml` as `gItems` → [src/mq3/game/g_items.ml](File-src-mq3-game-g-items-ml-1981196396.md)
- `mq3/game/items.ml` as `itemCore` → [src/mq3/game/items.ml](File-src-mq3-game-items-ml-152650830.md)
- `mq3/game/missiles.ml` as `missiles` → [src/mq3/game/missiles.ml](File-src-mq3-game-missiles-ml-1154787103.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/scores.ml` as `scores` → [src/mq3/game/scores.ml](File-src-mq3-game-scores-ml-660975489.md)
- `mq3/game/team_bonuses.ml` as `bonuses` → [src/mq3/game/team_bonuses.ml](File-src-mq3-game-team-bonuses-ml-406479811.md)
- `mq3/server/world.ml` as `sv` → [src/mq3/server/world.ml](File-src-mq3-server-world-ml-118313937.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-game-deaths-award-mask-const-award-mask-231496-src-mq3-game-deaths-ml-1920832778"></a>
### AWARD_MASK

```ml
const AWARD_MASK = 231496
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L22)

<a id="function-function-mq3-game-deaths-checkalmostcapture-function-checkalmostcapture-level-self-attacker-src-mq3-game-deaths-ml-1788149207"></a>
### checkAlmostCapture

```ml
function checkAlmostCapture(level, self, attacker)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L35)

<a id="function-function-mq3-game-deaths-checkalmostscored-function-checkalmostscored-level-self-attacker-src-mq3-game-deaths-ml-783437991"></a>
### checkAlmostScored

```ml
function checkAlmostScored(level, self, attacker)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L56)

<a id="function-function-mq3-game-deaths-clearaward-function-clearaward-client-award-level-src-mq3-game-deaths-ml-1371742756"></a>
### clearAward

```ml
function clearAward(client, award, level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |
| `award` | `dynamic` | — |  |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L141)

<a id="function-function-mq3-game-deaths-distance-function-distance-first-second-src-mq3-game-deaths-ml-1182187134"></a>
### distance

```ml
function distance(first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L32)

<a id="function-function-mq3-game-deaths-dropitem-function-dropitem-level-self-item-angle-src-mq3-game-deaths-ml-1355237816"></a>
### dropItem

```ml
function dropItem(level, self, item, angle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |
| `angle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L89)

<a id="function-function-mq3-game-deaths-findclass-function-findclass-level-after-name-src-mq3-game-deaths-ml-889749183"></a>
### findClass

```ml
function findClass(level, after, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `after` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L23)

<a id="function-function-mq3-game-deaths-modepowerupitem-function-modepowerupitem-level-powerup-src-mq3-game-deaths-ml-1268025584"></a>
### modePowerupItem

```ml
function modePowerupItem(level, powerup)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `powerup` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L81)

<a id="function-function-mq3-game-deaths-modname-function-modname-level-mod-src-mq3-game-deaths-ml-1189746178"></a>
### modName

```ml
function modName(level, mod)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `mod` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L131)

<a id="function-function-mq3-game-deaths-playerdie-function-playerdie-level-self-inflictor-attacker-damage-meansofdeath-src-mq3-game-deaths-ml-1742369275"></a>
### playerDie

```ml
function playerDie(level, self, inflictor, attacker, damage, meansOfDeath)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `inflictor` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |
| `meansOfDeath` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L145)

<a id="function-function-mq3-game-deaths-powerupitem-function-powerupitem-powerup-src-mq3-game-deaths-ml-1859840626"></a>
### powerupItem

```ml
function powerupItem(powerup)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `powerup` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L75)

<a id="function-function-mq3-game-deaths-respawn-function-respawn-level-ent-src-mq3-game-deaths-ml-339821493"></a>
### respawn

```ml
function respawn(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L213)

<a id="function-function-mq3-game-deaths-returncarriedflag-function-returncarriedflag-level-self-clear-src-mq3-game-deaths-ml-2061024955"></a>
### returnCarriedFlag

```ml
function returnCarriedFlag(level, self, clear)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `clear` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L124)

<a id="function-function-mq3-game-deaths-returnflag-function-returnflag-level-team-src-mq3-game-deaths-ml-1024748747"></a>
### returnFlag

```ml
function returnFlag(level, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L120)

<a id="function-function-mq3-game-deaths-sameteam-function-sameteam-level-first-second-src-mq3-game-deaths-ml-410053102"></a>
### sameTeam

```ml
function sameTeam(level, first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L137)

<a id="function-function-mq3-game-deaths-tossclientitems-function-tossclientitems-level-self-src-mq3-game-deaths-ml-721790772"></a>
### tossClientItems

```ml
function tossClientItems(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L93)

<a id="function-function-mq3-game-deaths-weaponitem-function-weaponitem-weapon-src-mq3-game-deaths-ml-688498706"></a>
### weaponItem

```ml
function weaponItem(weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L67)
