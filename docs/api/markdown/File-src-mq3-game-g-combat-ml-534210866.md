# `src/mq3/game/g_combat.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_combat`](Package-mq3-game-g-combat-396867880.md)

Reachable from entry: **no**

## Imports

- `mq3/game/bodies.ml` as `bodies` → [src/mq3/game/bodies.ml](File-src-mq3-game-bodies-ml-247011888.md)
- `mq3/game/combat.ml` as `combat` → [src/mq3/game/combat.ml](File-src-mq3-game-combat-ml-473208184.md)
- `mq3/game/combat_missionpack.ml` as `mission` → [src/mq3/game/combat_missionpack.ml](File-src-mq3-game-combat-missionpack-ml-607885236.md)
- `mq3/game/deaths.ml` as `deaths` → [src/mq3/game/deaths.ml](File-src-mq3-game-deaths-ml-761874289.md)
- `mq3/game/scores.ml` as `scores` → [src/mq3/game/scores.ml](File-src-mq3-game-scores-ml-660975489.md)

## Declarations

<a id="function-function-mq3-game-g-combat-addscore-function-addscore-level-ent-origin-score-src-mq3-game-g-combat-ml-1835822725"></a>
### AddScore

```ml
function AddScore(level, ent, origin, score)
```

Forward `AddScore` to `mq3.game.scores.addScore` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `teamScores`. May update `level.teamScores[team]` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. May update `ent.client.ps.persistant[c.PERS_SCORE]` in place. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `score` | `dynamic` | — | Value used by `scorePlum` in `plum.s.time = score`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L22)

<a id="function-function-mq3-game-g-combat-body-die-function-body-die-level-self-inflictor-attacker-damage-meansofdeath-src-mq3-game-g-combat-ml-274273967"></a>
### body_die

```ml
function body_die(level, self, inflictor, attacker, damage, meansOfDeath)
```

Forward `body_die` to `mq3.game.bodies.die` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `blood`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `health`. May update `self.health` in place. |
| `inflictor` | `dynamic` | — | Entity directly delivering the damage. |
| `attacker` | `dynamic` | — | Entity credited with the attack. |
| `damage` | `dynamic` | — | Damage amount before the current operation applies its rules. |
| `meansOfDeath` | `dynamic` | — | Value passed as argument 6 to `mq3.game.bodies.die`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L53)

<a id="function-function-mq3-game-g-combat-candamage-function-candamage-level-targ-origin-src-mq3-game-g-combat-ml-253745374"></a>
### CanDamage

```ml
function CanDamage(level, targ, origin)
```

Forward `CanDamage` to `mq3.game.combat.canDamage` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `traceObserveFn`. |
| `targ` | `dynamic` | — | Targ record; accesses `r` and `s`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L117)

<a id="function-function-mq3-game-g-combat-checkalmostcapture-function-checkalmostcapture-level-self-attacker-src-mq3-game-g-combat-ml-632171599"></a>
### CheckAlmostCapture

```ml
function CheckAlmostCapture(level, self, attacker)
```

Forward `CheckAlmostCapture` to `mq3.game.deaths.checkAlmostCapture` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `client`. |
| `attacker` | `dynamic` | — | Entity credited with the attack. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L66)

<a id="function-function-mq3-game-g-combat-checkalmostscored-function-checkalmostscored-level-self-attacker-src-mq3-game-g-combat-ml-385712851"></a>
### CheckAlmostScored

```ml
function CheckAlmostScored(level, self, attacker)
```

Forward `CheckAlmostScored` to `mq3.game.deaths.checkAlmostScored` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `client`. May update `self.client.ps.persistant[c.PERS_PLAYEREVENTS]` in place. |
| `attacker` | `dynamic` | — | Entity credited with the attack. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L71)

<a id="function-function-mq3-game-g-combat-checkarmor-function-checkarmor-ent-damage-dflags-src-mq3-game-g-combat-ml-582022887"></a>
### CheckArmor

```ml
function CheckArmor(ent, damage, dflags)
```

Forward `CheckArmor` to `mq3.game.combat.checkArmor` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `client`. May update `ent.client.ps.stats[c.STAT_ARMOR]` in place. |
| `damage` | `dynamic` | — | Damage amount before the current operation applies its rules. |
| `dflags` | `dynamic` | — | Value used by `checkArmor` in `if amount == 0 or ent.client == void or (dflags & DAMAGE_NO_ARMOR) != 0 then return 0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L86)

<a id="function-function-mq3-game-g-combat-g-damage-function-g-damage-level-targ-inflictor-attacker-dir-point-damage-dflags-mod-src-mq3-game-g-combat-ml-1675295966"></a>
### G_Damage

```ml
function G_Damage(level, targ, inflictor, attacker, dir, point, damage, dflags, mod)
```

Forward `G_Damage` to `mq3.game.combat.damage` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermissionQueued`, `time`, `entities`, `obeliskAttackFn` and `knockback` and related fields. |
| `targ` | `dynamic` | — | Targ record; accesses `takedamage`, `client`, `s`, `use` and `moverState` and related fields. May update `targ.client.lasthurt_client`, `targ.client.lasthurt_mod` and `targ.health` and additional fields in place. |
| `inflictor` | `dynamic` | — | Entity directly delivering the damage. |
| `attacker` | `dynamic` | — | Entity credited with the attack. |
| `dir` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |
| `damage` | `dynamic` | — | Damage amount before the current operation applies its rules. |
| `dflags` | `dynamic` | — | Value used by `checkArmor` in `if amount == 0 or ent.client == void or (dflags & DAMAGE_NO_ARMOR) != 0 then return 0 end if`. |
| `mod` | `dynamic` | — | Means-of-death code used for damage attribution. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L112)

<a id="function-function-mq3-game-g-combat-g-invulnerabilityeffect-function-g-invulnerabilityeffect-level-targ-dir-point-impactpoint-bouncedir-src-mq3-game-g-combat-ml-221165362"></a>
### G_InvulnerabilityEffect

```ml
function G_InvulnerabilityEffect(level, targ, dir, point, impactpoint, bouncedir)
```

Forward `G_InvulnerabilityEffect` to `mq3.game.combat.invulnerabilityEffect` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `targ` | `dynamic` | — | Targ record; accesses `client`. |
| `dir` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |
| `impactpoint` | `dynamic` | — | Array or byte sequence accessed at `axis`. Entries are written in place. |
| `bouncedir` | `dynamic` | — | Array or byte sequence accessed at `axis`. Entries are written in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L101)

<a id="function-function-mq3-game-g-combat-g-radiusdamage-function-g-radiusdamage-level-origin-attacker-damage-radius-ignore-mod-src-mq3-game-g-combat-ml-300050910"></a>
### G_RadiusDamage

```ml
function G_RadiusDamage(level, origin, attacker, damage, radius, ignore, mod)
```

Forward `G_RadiusDamage` to `mq3.game.combat.radiusDamage` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `entities`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `attacker` | `dynamic` | — | Entity credited with the attack. |
| `damage` | `dynamic` | — | Damage amount before the current operation applies its rules. |
| `radius` | `dynamic` | — | Radius used by the spatial or damage query. |
| `ignore` | `dynamic` | — | Value used by `radiusDamage` in `if ent == ignore or not ent.takedamage then continue end if`. |
| `mod` | `dynamic` | — | Means-of-death code used for damage attribution. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L126)

<a id="function-function-mq3-game-g-combat-gibentity-function-gibentity-level-self-killer-src-mq3-game-g-combat-ml-289174525"></a>
### GibEntity

```ml
function GibEntity(level, self, killer)
```

Forward `GibEntity` to `mq3.game.bodies.gib` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`, `takedamage` and `r`. May update `self.takedamage`, `self.s.eType` and `self.r.contents` in place. |
| `killer` | `dynamic` | — | Integer parameter stored alongside the emitted event. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L45)

<a id="function-function-mq3-game-g-combat-kamikaze-deathactivate-function-kamikaze-deathactivate-level-ent-src-mq3-game-g-combat-ml-1798222787"></a>
### Kamikaze_DeathActivate

```ml
function Kamikaze_DeathActivate(level, ent)
```

Forward `Kamikaze_DeathActivate` to `mq3.game.combat_missionpack.Kamikaze_DeathActivate` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `activator` and `s`. May update `ent.s.eFlags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L57)

<a id="function-function-mq3-game-g-combat-kamikaze-deathtimer-function-kamikaze-deathtimer-level-self-src-mq3-game-g-combat-ml-891075846"></a>
### Kamikaze_DeathTimer

```ml
function Kamikaze_DeathTimer(level, self)
```

Forward `Kamikaze_DeathTimer` to `mq3.game.combat_missionpack.Kamikaze_DeathTimer` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L61)

<a id="function-function-mq3-game-g-combat-lookatkiller-function-lookatkiller-level-self-inflictor-attacker-src-mq3-game-g-combat-ml-467972557"></a>
### LookAtKiller

```ml
function LookAtKiller(level, self, inflictor, attacker)
```

Forward `LookAtKiller` to `mq3.game.bodies.lookAtKiller` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `mq3.game.bodies.lookAtKiller`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `client` and `s`. May update `self.client.ps.stats[c.STAT_DEAD_YAW]` in place. |
| `inflictor` | `dynamic` | — | Entity directly delivering the damage. |
| `attacker` | `dynamic` | — | Entity credited with the attack. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L40)

<a id="function-function-mq3-game-g-combat-player-die-function-player-die-level-self-inflictor-attacker-damage-meansofdeath-src-mq3-game-g-combat-ml-132442971"></a>
### player_die

```ml
function player_die(level, self, inflictor, attacker, damage, meansOfDeath)
```

Forward `player_die` to `mq3.game.deaths.playerDie` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermissiontime`, `time`, `scene`, `maxclients` and `clients` and related fields. May update `level.deathAnimIndex` in place. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `client`, `s`, `r`, `enemy` and `takedamage` and related fields. May update `self.client.ps.pm_type`, `self.enemy` and `self.client.ps.persistant[c.PERS_KILLED]` and additional fields in place. |
| `inflictor` | `dynamic` | — | Entity directly delivering the damage. |
| `attacker` | `dynamic` | — | Entity credited with the attack. |
| `damage` | `dynamic` | — | Damage amount before the current operation applies its rules. |
| `meansOfDeath` | `dynamic` | — | Means-of-death code used for damage attribution. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L79)

<a id="function-function-mq3-game-g-combat-raysphereintersections-function-raysphereintersections-origin-radius-point-dir-intersections-src-mq3-game-g-combat-ml-731931553"></a>
### RaySphereIntersections

```ml
function RaySphereIntersections(origin, radius, point, dir, intersections)
```

Forward `RaySphereIntersections` to `mq3.game.combat.raySphereIntersections` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `radius` | `dynamic` | — | Radius used by the spatial or damage query. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |
| `dir` | `dynamic` | — | Value passed as argument 1 to `mq3.shared.math.VectorNormalize`. |
| `intersections` | `dynamic` | — | Array or byte sequence accessed at `0` and `1`. Entries are written in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L93)

<a id="function-function-mq3-game-g-combat-scoreplum-function-scoreplum-level-ent-origin-score-src-mq3-game-g-combat-ml-581838305"></a>
### ScorePlum

```ml
function ScorePlum(level, ent, origin, score)
```

Forward `ScorePlum` to `mq3.game.scores.scorePlum` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `score` | `dynamic` | — | Value used by `scorePlum` in `plum.s.time = score`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L16)

<a id="function-function-mq3-game-g-combat-tossclientcubes-function-tossclientcubes-level-self-src-mq3-game-g-combat-ml-1809154428"></a>
### TossClientCubes

```ml
function TossClientCubes(level, self)
```

Forward `TossClientCubes` to `mq3.game.combat_missionpack.TossClientCubes` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time` and `neutralObelisk`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `client`. May update `self.client.ps.generic1` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L30)

<a id="function-function-mq3-game-g-combat-tossclientitems-function-tossclientitems-level-self-src-mq3-game-g-combat-ml-671179180"></a>
### TossClientItems

```ml
function TossClientItems(level, self)
```

Forward `TossClientItems` to `mq3.game.deaths.tossClientItems` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `client` and `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L26)

<a id="function-function-mq3-game-g-combat-tossclientpersistantpowerups-function-tossclientpersistantpowerups-level-ent-src-mq3-game-g-combat-ml-1643911835"></a>
### TossClientPersistantPowerups

```ml
function TossClientPersistantPowerups(level, ent)
```

Forward `TossClientPersistantPowerups` to `mq3.game.combat_missionpack.TossClientPersistantPowerups` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. May update `ent.client.ps.stats[STAT_PERSISTANT_POWERUP]` and `ent.client.persistantPowerup` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_combat.ml#L34)
