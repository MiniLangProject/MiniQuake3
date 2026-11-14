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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `score` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L12)

<a id="function-function-mq3-game-g-combat-body-die-function-body-die-level-self-inflictor-attacker-damage-meansofdeath-src-mq3-game-g-combat-ml-274273967"></a>
### body_die

```ml
function body_die(level, self, inflictor, attacker, damage, meansOfDeath)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `inflictor` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |
| `meansOfDeath` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L18)

<a id="function-function-mq3-game-g-combat-candamage-function-candamage-level-targ-origin-src-mq3-game-g-combat-ml-253745374"></a>
### CanDamage

```ml
function CanDamage(level, targ, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `targ` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L30)

<a id="function-function-mq3-game-g-combat-checkalmostcapture-function-checkalmostcapture-level-self-attacker-src-mq3-game-g-combat-ml-632171599"></a>
### CheckAlmostCapture

```ml
function CheckAlmostCapture(level, self, attacker)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L21)

<a id="function-function-mq3-game-g-combat-checkalmostscored-function-checkalmostscored-level-self-attacker-src-mq3-game-g-combat-ml-385712851"></a>
### CheckAlmostScored

```ml
function CheckAlmostScored(level, self, attacker)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L22)

<a id="function-function-mq3-game-g-combat-checkarmor-function-checkarmor-ent-damage-dflags-src-mq3-game-g-combat-ml-582022887"></a>
### CheckArmor

```ml
function CheckArmor(ent, damage, dflags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |
| `dflags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L26)

<a id="function-function-mq3-game-g-combat-g-damage-function-g-damage-level-targ-inflictor-attacker-dir-point-damage-dflags-mod-src-mq3-game-g-combat-ml-1675295966"></a>
### G_Damage

```ml
function G_Damage(level, targ, inflictor, attacker, dir, point, damage, dflags, mod)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `targ` | `dynamic` | — |  |
| `inflictor` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |
| `dflags` | `dynamic` | — |  |
| `mod` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L29)

<a id="function-function-mq3-game-g-combat-g-invulnerabilityeffect-function-g-invulnerabilityeffect-level-targ-dir-point-impactpoint-bouncedir-src-mq3-game-g-combat-ml-221165362"></a>
### G_InvulnerabilityEffect

```ml
function G_InvulnerabilityEffect(level, targ, dir, point, impactpoint, bouncedir)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `targ` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `impactpoint` | `dynamic` | — |  |
| `bouncedir` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L28)

<a id="function-function-mq3-game-g-combat-g-radiusdamage-function-g-radiusdamage-level-origin-attacker-damage-radius-ignore-mod-src-mq3-game-g-combat-ml-300050910"></a>
### G_RadiusDamage

```ml
function G_RadiusDamage(level, origin, attacker, damage, radius, ignore, mod)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `ignore` | `dynamic` | — |  |
| `mod` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L31)

<a id="function-function-mq3-game-g-combat-gibentity-function-gibentity-level-self-killer-src-mq3-game-g-combat-ml-289174525"></a>
### GibEntity

```ml
function GibEntity(level, self, killer)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `killer` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L17)

<a id="function-function-mq3-game-g-combat-kamikaze-deathactivate-function-kamikaze-deathactivate-level-ent-src-mq3-game-g-combat-ml-1798222787"></a>
### Kamikaze_DeathActivate

```ml
function Kamikaze_DeathActivate(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L19)

<a id="function-function-mq3-game-g-combat-kamikaze-deathtimer-function-kamikaze-deathtimer-level-self-src-mq3-game-g-combat-ml-891075846"></a>
### Kamikaze_DeathTimer

```ml
function Kamikaze_DeathTimer(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L20)

<a id="function-function-mq3-game-g-combat-lookatkiller-function-lookatkiller-level-self-inflictor-attacker-src-mq3-game-g-combat-ml-467972557"></a>
### LookAtKiller

```ml
function LookAtKiller(level, self, inflictor, attacker)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `inflictor` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L16)

<a id="function-function-mq3-game-g-combat-player-die-function-player-die-level-self-inflictor-attacker-damage-meansofdeath-src-mq3-game-g-combat-ml-132442971"></a>
### player_die

```ml
function player_die(level, self, inflictor, attacker, damage, meansOfDeath)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `inflictor` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |
| `meansOfDeath` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L23)

<a id="function-function-mq3-game-g-combat-raysphereintersections-function-raysphereintersections-origin-radius-point-dir-intersections-src-mq3-game-g-combat-ml-731931553"></a>
### RaySphereIntersections

```ml
function RaySphereIntersections(origin, radius, point, dir, intersections)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |
| `intersections` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L27)

<a id="function-function-mq3-game-g-combat-scoreplum-function-scoreplum-level-ent-origin-score-src-mq3-game-g-combat-ml-581838305"></a>
### ScorePlum

```ml
function ScorePlum(level, ent, origin, score)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `score` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L11)

<a id="function-function-mq3-game-g-combat-tossclientcubes-function-tossclientcubes-level-self-src-mq3-game-g-combat-ml-1809154428"></a>
### TossClientCubes

```ml
function TossClientCubes(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L14)

<a id="function-function-mq3-game-g-combat-tossclientitems-function-tossclientitems-level-self-src-mq3-game-g-combat-ml-671179180"></a>
### TossClientItems

```ml
function TossClientItems(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L13)

<a id="function-function-mq3-game-g-combat-tossclientpersistantpowerups-function-tossclientpersistantpowerups-level-ent-src-mq3-game-g-combat-ml-1643911835"></a>
### TossClientPersistantPowerups

```ml
function TossClientPersistantPowerups(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_combat.ml#L15)
