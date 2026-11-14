# `src/mq3/game/g_weapon.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_weapon`](Package-mq3-game-g-weapon-1668934988.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `crt` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/game/combat.ml` as `combat` → [src/mq3/game/combat.ml](File-src-mq3-game-combat-ml-473208184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/missiles.ml` as `missiles` → [src/mq3/game/missiles.ml](File-src-mq3-game-missiles-ml-1154787103.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/snapshot.ml` as `snapshot` → [src/mq3/game/snapshot.ml](File-src-mq3-game-snapshot-ml-1144176980.md)
- `mq3/game/weapon_hitscan.ml` as `hitscan` → [src/mq3/game/weapon_hitscan.ml](File-src-mq3-game-weapon-hitscan-ml-1375014721.md)
- `mq3/game/weapon_state.ml` as `weaponState` → [src/mq3/game/weapon_state.ml](File-src-mq3-game-weapon-state-ml-1905655678.md)
- `mq3/game/weapons.ml` as `base` → [src/mq3/game/weapons.ml](File-src-mq3-game-weapons-ml-121002605.md)
- `mq3/server/world.ml` as `sv` → [src/mq3/server/world.ml](File-src-mq3-server-world-ml-118313937.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-g-weapon-angletoshort-function-angletoshort-value-src-mq3-game-g-weapon-ml-197342229"></a>
### angleToShort

```ml
function angleToShort(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L160)

<a id="function-function-mq3-game-g-weapon-bfg-fire-function-bfg-fire-level-ent-src-mq3-game-g-weapon-ml-197827115"></a>
### BFG_Fire

```ml
function BFG_Fire(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L39)

<a id="function-function-mq3-game-g-weapon-bullet-fire-function-bullet-fire-level-ent-spread-damage-src-mq3-game-g-weapon-ml-1507077631"></a>
### Bullet_Fire

```ml
function Bullet_Fire(level, ent, spread, damage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `spread` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L38)

<a id="function-function-mq3-game-g-weapon-calcmuzzlepoint-function-calcmuzzlepoint-ent-forward-right-up-muzzlepoint-src-mq3-game-g-weapon-ml-1871172490"></a>
### CalcMuzzlePoint

```ml
function CalcMuzzlePoint(ent, forward, right, up, muzzlePoint)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |
| `forward` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `muzzlePoint` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L52)

<a id="function-function-mq3-game-g-weapon-calcmuzzlepointorigin-function-calcmuzzlepointorigin-ent-origin-forward-right-up-muzzlepoint-src-mq3-game-g-weapon-ml-2086620884"></a>
### CalcMuzzlePointOrigin

```ml
function CalcMuzzlePointOrigin(ent, origin, forward, right, up, muzzlePoint)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `forward` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `muzzlePoint` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L53)

<a id="function-function-mq3-game-g-weapon-centeredrandom-function-centeredrandom-level-src-mq3-game-g-weapon-ml-203220254"></a>
### centeredRandom

```ml
function centeredRandom(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L56)

<a id="function-function-mq3-game-g-weapon-checkgauntletattack-function-checkgauntletattack-level-ent-src-mq3-game-g-weapon-ml-1778788683"></a>
### CheckGauntletAttack

```ml
function CheckGauntletAttack(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L36)

<a id="constant-constant-mq3-game-g-weapon-damage-no-protection-const-damage-no-protection-8-src-mq3-game-g-weapon-ml-581667109"></a>
### DAMAGE_NO_PROTECTION

```ml
const DAMAGE_NO_PROTECTION = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L30)

<a id="constant-constant-mq3-game-g-weapon-damage-no-team-protection-const-damage-no-team-protection-16-src-mq3-game-g-weapon-ml-2121490032"></a>
### DAMAGE_NO_TEAM_PROTECTION

```ml
const DAMAGE_NO_TEAM_PROTECTION = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L31)

<a id="constant-constant-mq3-game-g-weapon-damage-radius-const-damage-radius-1-src-mq3-game-g-weapon-ml-1655137992"></a>
### DAMAGE_RADIUS

```ml
const DAMAGE_RADIUS = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L29)

<a id="function-function-mq3-game-g-weapon-edgedistance-function-edgedistance-origin-ent-src-mq3-game-g-weapon-ml-1111962151"></a>
### edgeDistance

```ml
function edgeDistance(origin, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L122)

<a id="constant-constant-mq3-game-g-weapon-ef-kamikaze-const-ef-kamikaze-512-src-mq3-game-g-weapon-ml-220177177"></a>
### EF_KAMIKAZE

```ml
const EF_KAMIKAZE = 512
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L28)

<a id="function-function-mq3-game-g-weapon-firenail-function-firenail-level-self-start-forward-right-up-src-mq3-game-g-weapon-ml-788744500"></a>
### fireNail

```ml
function fireNail(level, self, start, forward, right, up)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `forward` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L58)

<a id="function-function-mq3-game-g-weapon-fireprox-function-fireprox-level-self-start-direction-src-mq3-game-g-weapon-ml-625333649"></a>
### fireProx

```ml
function fireProx(level, self, start, direction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L72)

<a id="function-function-mq3-game-g-weapon-fireweapon-function-fireweapon-level-ent-missionpack-doubler-src-mq3-game-g-weapon-ml-1242718011"></a>
### FireWeapon

```ml
function FireWeapon(level, ent, missionpack, doubler)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `missionpack` | `dynamic` | — |  |
| `doubler` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L94)

<a id="function-function-mq3-game-g-weapon-g-bounceprojectile-function-g-bounceprojectile-start-impact-dir-endout-src-mq3-game-g-weapon-ml-686062366"></a>
### G_BounceProjectile

```ml
function G_BounceProjectile(start, impact, dir, endout)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `impact` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |
| `endout` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L34)

<a id="function-function-mq3-game-g-weapon-g-startkamikaze-function-g-startkamikaze-level-ent-src-mq3-game-g-weapon-ml-602838337"></a>
### G_StartKamikaze

```ml
function G_StartKamikaze(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L175)

<a id="function-function-mq3-game-g-weapon-kamikazedamage-function-kamikazedamage-level-self-src-mq3-game-g-weapon-ml-976126704"></a>
### KamikazeDamage

```ml
function KamikazeDamage(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L161)

<a id="function-function-mq3-game-g-weapon-kamikazeradiusdamage-function-kamikazeradiusdamage-level-origin-attacker-damage-radius-src-mq3-game-g-weapon-ml-2075367432"></a>
### KamikazeRadiusDamage

```ml
function KamikazeRadiusDamage(level, origin, attacker, damage, radius)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L131)

<a id="function-function-mq3-game-g-weapon-kamikazeshockwave-function-kamikazeshockwave-level-origin-attacker-damage-push-radius-src-mq3-game-g-weapon-ml-2107732112"></a>
### KamikazeShockWave

```ml
function KamikazeShockWave(level, origin, attacker, damage, push, radius)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |
| `push` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L145)

<a id="function-function-mq3-game-g-weapon-logaccuracyhit-function-logaccuracyhit-level-target-attacker-src-mq3-game-g-weapon-ml-722654108"></a>
### LogAccuracyHit

```ml
function LogAccuracyHit(level, target, attacker)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L51)

<a id="constant-constant-mq3-game-g-weapon-mask-shot-const-mask-shot-100663297-src-mq3-game-g-weapon-ml-1476739603"></a>
### MASK_SHOT

```ml
const MASK_SHOT = 100663297
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L32)

<a id="constant-constant-mq3-game-g-weapon-mod-chaingun-const-mod-chaingun-25-src-mq3-game-g-weapon-ml-1374888844"></a>
### MOD_CHAINGUN

```ml
const MOD_CHAINGUN = 25
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L25)

<a id="constant-constant-mq3-game-g-weapon-mod-kamikaze-const-mod-kamikaze-27-src-mq3-game-g-weapon-ml-255465094"></a>
### MOD_KAMIKAZE

```ml
const MOD_KAMIKAZE = 27
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L27)

<a id="constant-constant-mq3-game-g-weapon-mod-nail-const-mod-nail-24-src-mq3-game-g-weapon-ml-464741283"></a>
### MOD_NAIL

```ml
const MOD_NAIL = 24
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L24)

<a id="constant-constant-mq3-game-g-weapon-mod-proximity-mine-const-mod-proximity-mine-26-src-mq3-game-g-weapon-ml-475770343"></a>
### MOD_PROXIMITY_MINE

```ml
const MOD_PROXIMITY_MINE = 26
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L26)

<a id="function-function-mq3-game-g-weapon-randomfloat-function-randomfloat-level-src-mq3-game-g-weapon-ml-788957480"></a>
### randomFloat

```ml
function randomFloat(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L55)

<a id="function-function-mq3-game-g-weapon-shotgunpattern-function-shotgunpattern-level-origin-origin2-seed-ent-src-mq3-game-g-weapon-ml-1714987886"></a>
### ShotgunPattern

```ml
function ShotgunPattern(level, origin, origin2, seed, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `origin2` | `dynamic` | — |  |
| `seed` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L41)

<a id="function-function-mq3-game-g-weapon-shotgunpellet-function-shotgunpellet-level-start-finish-ent-src-mq3-game-g-weapon-ml-949066330"></a>
### ShotgunPellet

```ml
function ShotgunPellet(level, start, finish, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L40)

<a id="function-function-mq3-game-g-weapon-snapvectortowards-function-snapvectortowards-value-towards-src-mq3-game-g-weapon-ml-301681509"></a>
### SnapVectorTowards

```ml
function SnapVectorTowards(value, towards)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `towards` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L37)

<a id="function-function-mq3-game-g-weapon-weapon-gauntlet-function-weapon-gauntlet-level-ent-src-mq3-game-g-weapon-ml-389817945"></a>
### Weapon_Gauntlet

```ml
function Weapon_Gauntlet(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L35)

<a id="function-function-mq3-game-g-weapon-weapon-grapplinghook-fire-function-weapon-grapplinghook-fire-level-ent-src-mq3-game-g-weapon-ml-554800361"></a>
### Weapon_GrapplingHook_Fire

```ml
function Weapon_GrapplingHook_Fire(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L47)

<a id="function-function-mq3-game-g-weapon-weapon-grenadelauncher-fire-function-weapon-grenadelauncher-fire-level-ent-src-mq3-game-g-weapon-ml-1136599051"></a>
### weapon_grenadelauncher_fire

```ml
function weapon_grenadelauncher_fire(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L43)

<a id="function-function-mq3-game-g-weapon-weapon-hookfree-function-weapon-hookfree-level-ent-src-mq3-game-g-weapon-ml-2021116151"></a>
### Weapon_HookFree

```ml
function Weapon_HookFree(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L48)

<a id="function-function-mq3-game-g-weapon-weapon-hookthink-function-weapon-hookthink-level-ent-src-mq3-game-g-weapon-ml-2100676523"></a>
### Weapon_HookThink

```ml
function Weapon_HookThink(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L49)

<a id="function-function-mq3-game-g-weapon-weapon-lightningfire-function-weapon-lightningfire-level-ent-src-mq3-game-g-weapon-ml-908791699"></a>
### Weapon_LightningFire

```ml
function Weapon_LightningFire(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L50)

<a id="function-function-mq3-game-g-weapon-weapon-nailgun-fire-function-weapon-nailgun-fire-level-ent-src-mq3-game-g-weapon-ml-1431713995"></a>
### Weapon_Nailgun_Fire

```ml
function Weapon_Nailgun_Fire(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L81)

<a id="function-function-mq3-game-g-weapon-weapon-plasmagun-fire-function-weapon-plasmagun-fire-level-ent-src-mq3-game-g-weapon-ml-1387183955"></a>
### Weapon_Plasmagun_Fire

```ml
function Weapon_Plasmagun_Fire(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L45)

<a id="function-function-mq3-game-g-weapon-weapon-proxlauncher-fire-function-weapon-proxlauncher-fire-level-ent-src-mq3-game-g-weapon-ml-1897083703"></a>
### weapon_proxlauncher_fire

```ml
function weapon_proxlauncher_fire(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L89)

<a id="function-function-mq3-game-g-weapon-weapon-railgun-fire-function-weapon-railgun-fire-level-ent-src-mq3-game-g-weapon-ml-1157013483"></a>
### weapon_railgun_fire

```ml
function weapon_railgun_fire(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L46)

<a id="function-function-mq3-game-g-weapon-weapon-rocketlauncher-fire-function-weapon-rocketlauncher-fire-level-ent-src-mq3-game-g-weapon-ml-1805610411"></a>
### Weapon_RocketLauncher_Fire

```ml
function Weapon_RocketLauncher_Fire(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L44)

<a id="function-function-mq3-game-g-weapon-weapon-supershotgun-fire-function-weapon-supershotgun-fire-level-ent-src-mq3-game-g-weapon-ml-644829051"></a>
### weapon_supershotgun_fire

```ml
function weapon_supershotgun_fire(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L42)

<a id="constant-constant-mq3-game-g-weapon-wp-chaingun-const-wp-chaingun-13-src-mq3-game-g-weapon-ml-1223646845"></a>
### WP_CHAINGUN

```ml
const WP_CHAINGUN = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L23)

<a id="constant-constant-mq3-game-g-weapon-wp-nailgun-const-wp-nailgun-11-src-mq3-game-g-weapon-ml-322209349"></a>
### WP_NAILGUN

```ml
const WP_NAILGUN = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L21)

<a id="constant-constant-mq3-game-g-weapon-wp-prox-launcher-const-wp-prox-launcher-12-src-mq3-game-g-weapon-ml-2081719782"></a>
### WP_PROX_LAUNCHER

```ml
const WP_PROX_LAUNCHER = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_weapon.ml#L22)
