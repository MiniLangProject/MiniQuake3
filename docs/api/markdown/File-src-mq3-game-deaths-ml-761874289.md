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
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-game-deaths-award-mask-const-award-mask-231496-src-mq3-game-deaths-ml-1920832778"></a>
### AWARD_MASK

```ml
const AWARD_MASK = 231496
```

Player-award identifier selecting the mask reward.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L23)

<a id="function-function-mq3-game-deaths-checkalmostcapture-function-checkalmostcapture-level-self-attacker-src-mq3-game-deaths-ml-1788149207"></a>
### checkAlmostCapture

```ml
function checkAlmostCapture(level, self, attacker)
```

Set `attacker.client.ps.persistant[c.PERS_PLAYEREVENTS]` to `attacker.client.ps.persistant[c.PERS_PLAYEREVENTS] ^ 4` in `mq3.game.deaths.checkAlmostCapture`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `client`. |
| `attacker` | `dynamic` | — | Attacking entity; accesses `client`. May update `attacker.client.ps.persistant[c.PERS_PLAYEREVENTS]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L47)

<a id="function-function-mq3-game-deaths-checkalmostscored-function-checkalmostscored-level-self-attacker-src-mq3-game-deaths-ml-783437991"></a>
### checkAlmostScored

```ml
function checkAlmostScored(level, self, attacker)
```

Set `self.client.ps.persistant[c.PERS_PLAYEREVENTS]` to `self.client.ps.persistant[c.PERS_PLAYEREVENTS] ^ 4` and `attacker.client.ps.persistant[c.PERS_PLAYEREVENTS]` to `attacker.client.ps.persistant[c.PERS_PLAYEREVENTS] ^ 4` in `mq3.game.deaths.checkAlmostScored`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `client`. May update `self.client.ps.persistant[c.PERS_PLAYEREVENTS]` in place. |
| `attacker` | `dynamic` | — | Attacking entity; accesses `client`. May update `attacker.client.ps.persistant[c.PERS_PLAYEREVENTS]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L72)

<a id="function-function-mq3-game-deaths-clearaward-function-clearaward-client-award-level-src-mq3-game-deaths-ml-1371742756"></a>
### clearAward

```ml
function clearAward(client, award, level)
```

Set `client.ps.eFlags` to `(client.ps.eFlags & n.i32(~AWARD_MASK)) | award` and `client.rewardTime` to `n.add32(level.time,2000)` in `mq3.game.deaths.clearAward`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Client state; accesses `ps` and `rewardTime`. May update `client.ps.eFlags` and `client.rewardTime` in place. |
| `award` | `dynamic` | — | Value used by `clearAward` in `client.ps.eFlags = (client.ps.eFlags & n.i32(~AWARD_MASK)) \| award`. |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L190)

<a id="function-function-mq3-game-deaths-distance-function-distance-first-second-src-mq3-game-deaths-ml-1182187134"></a>
### distance

```ml
function distance(first, second)
```

Calculate Euclidean distance between two three-component points for deaths.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `second` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L40)

<a id="function-function-mq3-game-deaths-dropitem-function-dropitem-level-self-item-angle-src-mq3-game-deaths-ml-1355237816"></a>
### dropItem

```ml
function dropItem(level, self, item, angle)
```

Use `level.itemDropFn` to perform `dropItem`. Return paths include `gItems.Drop_Item(level,self,item,angle)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `itemDropFn`. |
| `self` | `dynamic` | — | Game entity; accesses `s`. |
| `item` | `dynamic` | — | Index of the entry to access. |
| `angle` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fadd`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L117)

<a id="function-function-mq3-game-deaths-findclass-function-findclass-level-after-name-src-mq3-game-deaths-ml-889749183"></a>
### findClass

```ml
function findClass(level, after, name)
```

Find the next active entity with a case-insensitive class-name match for deaths.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `after` | `dynamic` | — | After record; accesses `slot`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L28)

<a id="function-function-mq3-game-deaths-modepowerupitem-function-modepowerupitem-level-powerup-src-mq3-game-deaths-ml-1268025584"></a>
### modePowerupItem

```ml
function modePowerupItem(level, powerup)
```

Apply `mq3.game.deaths.powerupItem` while evaluating `modePowerupItem`. Return paths include `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `powerup` | `dynamic` | — | Operand used to evaluate the returned expression `powerup+27`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L104)

<a id="function-function-mq3-game-deaths-modname-function-modname-level-mod-src-mq3-game-deaths-ml-1189746178"></a>
### modName

```ml
function modName(level, mod)
```

Resolve a means-of-death code to the baseq3 or Team Arena symbolic obituary name.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `mod` | `dynamic` | — | Means-of-death code used for damage attribution. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L172)

<a id="function-function-mq3-game-deaths-playerdie-function-playerdie-level-self-inflictor-attacker-damage-meansofdeath-src-mq3-game-deaths-ml-1742369275"></a>
### playerDie

```ml
function playerDie(level, self, inflictor, attacker, damage, meansOfDeath)
```

Update `self.client.ps.pm_type`, `self.enemy`, `self.client.ps.persistant[c.PERS_KILLED]` and `attacker.client.lastkilled_client` and related state during `playerDie`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermissiontime`, `time`, `scene`, `maxclients` and `clients` and related fields. May update `level.deathAnimIndex` in place. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `client`, `s`, `r`, `enemy` and `takedamage` and related fields. May update `self.client.ps.pm_type`, `self.enemy` and `self.client.ps.persistant[c.PERS_KILLED]` and additional fields in place. |
| `inflictor` | `dynamic` | — | Entity directly delivering the damage. |
| `attacker` | `dynamic` | — | Attacking entity; accesses `s` and `client`. May update `attacker.client.lastkilled_client`, `attacker.client.ps.persistant[c.PERS_GAUNTLET_FRAG_COUNT]` and `attacker.client.ps.persistant[c.PERS_EXCELLENT_COUNT]` and additional fields in place. |
| `damage` | `dynamic` | — | Not read by this implementation; retained in the `playerDie` signature. |
| `meansOfDeath` | `dynamic` | — | Means-of-death code used for damage attribution. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L201)

<a id="function-function-mq3-game-deaths-powerupitem-function-powerupitem-powerup-src-mq3-game-deaths-ml-1859840626"></a>
### powerupItem

```ml
function powerupItem(powerup)
```

Map a powerup identifier to its pickup-item index, including the red and blue flags.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `powerup` | `dynamic` | — | Operand used to evaluate the returned expression `powerup+27`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L95)

<a id="function-function-mq3-game-deaths-respawn-function-respawn-level-ent-src-mq3-game-deaths-ml-339821493"></a>
### respawn

```ml
function respawn(level, ent)
```

Set `level.playerDieFn` to `playerDie` in `mq3.game.deaths.respawn`. Return paths include `clientSpawn.respawn(level,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `playerDieFn`. May update `level.playerDieFn` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `client` and `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L272)

<a id="function-function-mq3-game-deaths-returncarriedflag-function-returncarriedflag-level-self-clear-src-mq3-game-deaths-ml-2061024955"></a>
### returnCarriedFlag

```ml
function returnCarriedFlag(level, self, clear)
```

Apply `mq3.game.deaths.returnFlag` while evaluating `returnCarriedFlag`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `flagReturnFn`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `client`. |
| `clear` | `dynamic` | — | Value used by `returnCarriedFlag` in `if clear then ps.powerups[c.PW_NEUTRALFLAG] = 0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L162)

<a id="function-function-mq3-game-deaths-returnflag-function-returnflag-level-team-src-mq3-game-deaths-ml-1024748747"></a>
### returnFlag

```ml
function returnFlag(level, team)
```

Use `level.flagReturnFn` to perform `returnFlag`. Return paths include `itemCore.returnFlag(level,team)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `flagReturnFn`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L154)

<a id="function-function-mq3-game-deaths-sameteam-function-sameteam-level-first-second-src-mq3-game-deaths-ml-410053102"></a>
### sameTeam

```ml
function sameTeam(level, first, second)
```

Check whether two client entities share a team in a team game for deaths.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `first` | `dynamic` | — | First record; accesses `client`. |
| `second` | `dynamic` | — | Second record; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L182)

<a id="function-function-mq3-game-deaths-tossclientitems-function-tossclientitems-level-self-src-mq3-game-deaths-ml-721790772"></a>
### tossClientItems

```ml
function tossClientItems(level, self)
```

Drop the dying client's carried weapon and active powerup items through the level item-spawn services.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `client` and `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L124)

<a id="function-function-mq3-game-deaths-weaponitem-function-weaponitem-weapon-src-mq3-game-deaths-ml-688498706"></a>
### weaponItem

```ml
function weaponItem(weapon)
```

Map a weapon identifier to its pickup-item index, returning -1 for an unsupported weapon.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/deaths.ml#L85)
