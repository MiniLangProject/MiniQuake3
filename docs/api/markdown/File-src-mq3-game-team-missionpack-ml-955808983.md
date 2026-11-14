# `src/mq3/game/team_missionpack.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.team_missionpack`](Package-mq3-game-team-missionpack-18291251.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/scores.ml` as `scores` → [src/mq3/game/scores.ml](File-src-mq3-game-scores-ml-660975489.md)
- `mq3/server/world.ml` as `sv` → [src/mq3/server/world.ml](File-src-mq3-server-world-ml-118313937.md)

## Declarations

<a id="function-function-mq3-game-team-missionpack-addteamscore-function-addteamscore-level-origin-team-score-src-mq3-game-team-missionpack-ml-1937288971"></a>
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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L49)

<a id="constant-constant-mq3-game-team-missionpack-award-mask-const-award-mask-231496-src-mq3-game-team-missionpack-ml-1358015478"></a>
### AWARD_MASK

```ml
const AWARD_MASK = 231496
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L24)

<a id="function-function-mq3-game-team-missionpack-capturesound-function-capturesound-level-ent-team-src-mq3-game-team-missionpack-ml-975873140"></a>
### captureSound

```ml
function captureSound(level, ent, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L63)

<a id="function-function-mq3-game-team-missionpack-checkobeliskattack-function-checkobeliskattack-level-obelisk-attacker-src-mq3-game-team-missionpack-ml-862334278"></a>
### CheckObeliskAttack

```ml
function CheckObeliskAttack(level, obelisk, attacker)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `obelisk` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L165)

<a id="constant-constant-mq3-game-team-missionpack-contents-solid-const-contents-solid-headers-contents-solid-src-mq3-game-team-missionpack-ml-1709821883"></a>
### CONTENTS_SOLID

```ml
const CONTENTS_SOLID = headers.CONTENTS_SOLID
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L18)

<a id="constant-constant-mq3-game-team-missionpack-contents-trigger-const-contents-trigger-headers-contents-trigger-src-mq3-game-team-missionpack-ml-395642144"></a>
### CONTENTS_TRIGGER

```ml
const CONTENTS_TRIGGER = headers.CONTENTS_TRIGGER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L19)

<a id="constant-constant-mq3-game-team-missionpack-ctf-capture-bonus-const-ctf-capture-bonus-headers-ctf-capture-bonus-src-mq3-game-team-missionpack-ml-1853113443"></a>
### CTF_CAPTURE_BONUS

```ml
const CTF_CAPTURE_BONUS = headers.CTF_CAPTURE_BONUS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L25)

<a id="constant-constant-mq3-game-team-missionpack-entitynum-none-const-entitynum-none-1023-src-mq3-game-team-missionpack-ml-1844737083"></a>
### ENTITYNUM_NONE

```ml
const ENTITYNUM_NONE = 1023
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L21)

<a id="constant-constant-mq3-game-team-missionpack-fl-no-knockback-const-fl-no-knockback-2048-src-mq3-game-team-missionpack-ml-686434945"></a>
### FL_NO_KNOCKBACK

```ml
const FL_NO_KNOCKBACK = 2048
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L22)

<a id="function-function-mq3-game-team-missionpack-forcegesture-function-forcegesture-level-team-src-mq3-game-team-missionpack-ml-1905848643"></a>
### forceGesture

```ml
function forceGesture(level, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L42)

<a id="function-function-mq3-game-team-missionpack-gametype-function-gametype-level-src-mq3-game-team-missionpack-ml-1328048686"></a>
### gametype

```ml
function gametype(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L29)

<a id="constant-constant-mq3-game-team-missionpack-gt-1fctf-const-gt-1fctf-5-src-mq3-game-team-missionpack-ml-1461599434"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L15)

<a id="constant-constant-mq3-game-team-missionpack-gt-harvester-const-gt-harvester-7-src-mq3-game-team-missionpack-ml-1043277572"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L17)

<a id="constant-constant-mq3-game-team-missionpack-gt-obelisk-const-gt-obelisk-6-src-mq3-game-team-missionpack-ml-1433903727"></a>
### GT_OBELISK

```ml
const GT_OBELISK = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L16)

<a id="constant-constant-mq3-game-team-missionpack-gt-team-const-gt-team-3-src-mq3-game-team-missionpack-ml-210553646"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L14)

<a id="constant-constant-mq3-game-team-missionpack-mask-solid-const-mask-solid-1-src-mq3-game-team-missionpack-ml-948979066"></a>
### MASK_SOLID

```ml
const MASK_SOLID = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L20)

<a id="function-function-mq3-game-team-missionpack-message-function-message-level-text-src-mq3-game-team-missionpack-ml-1301500235"></a>
### message

```ml
function message(level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L38)

<a id="function-function-mq3-game-team-missionpack-obeliskdie-function-obeliskdie-level-self-inflictor-attacker-damage-mod-src-mq3-game-team-missionpack-ml-45390208"></a>
### ObeliskDie

```ml
function ObeliskDie(level, self, inflictor, attacker, damage, mod)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `inflictor` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |
| `mod` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L89)

<a id="function-function-mq3-game-team-missionpack-obeliskpain-function-obeliskpain-level-self-attacker-damage-src-mq3-game-team-missionpack-ml-2145119540"></a>
### ObeliskPain

```ml
function ObeliskPain(level, self, attacker, damage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L114)

<a id="function-function-mq3-game-team-missionpack-obeliskregen-function-obeliskregen-level-self-src-mq3-game-team-missionpack-ml-1946889856"></a>
### ObeliskRegen

```ml
function ObeliskRegen(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L72)

<a id="function-function-mq3-game-team-missionpack-obeliskrespawn-function-obeliskrespawn-level-self-src-mq3-game-team-missionpack-ml-1965274600"></a>
### ObeliskRespawn

```ml
function ObeliskRespawn(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L83)

<a id="function-function-mq3-game-team-missionpack-obelisktouch-function-obelisktouch-level-self-other-trace-src-mq3-game-team-missionpack-ml-1290522259"></a>
### ObeliskTouch

```ml
function ObeliskTouch(level, self, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L102)

<a id="function-function-mq3-game-team-missionpack-otherteam-function-otherteam-team-src-mq3-game-team-missionpack-ml-2100319329"></a>
### otherTeam

```ml
function otherTeam(team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L33)

<a id="constant-constant-mq3-game-team-missionpack-overload-attack-base-sound-time-const-overload-attack-base-sound-time-headers-overload-attack-base-sound-time-src-mq3-game-team-missionpack-ml-660576172"></a>
### OVERLOAD_ATTACK_BASE_SOUND_TIME

```ml
const OVERLOAD_ATTACK_BASE_SOUND_TIME = headers.OVERLOAD_ATTACK_BASE_SOUND_TIME
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L27)

<a id="constant-constant-mq3-game-team-missionpack-reward-sprite-time-const-reward-sprite-time-2000-src-mq3-game-team-missionpack-ml-1617690521"></a>
### REWARD_SPRITE_TIME

```ml
const REWARD_SPRITE_TIME = 2000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L26)

<a id="function-function-mq3-game-team-missionpack-sp-team-blueobelisk-function-sp-team-blueobelisk-level-ent-src-mq3-game-team-missionpack-ml-2106041371"></a>
### SP_team_blueobelisk

```ml
function SP_team_blueobelisk(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L155)

<a id="function-function-mq3-game-team-missionpack-sp-team-neutralobelisk-function-sp-team-neutralobelisk-level-ent-src-mq3-game-team-missionpack-ml-1388089829"></a>
### SP_team_neutralobelisk

```ml
function SP_team_neutralobelisk(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L156)

<a id="function-function-mq3-game-team-missionpack-sp-team-redobelisk-function-sp-team-redobelisk-level-ent-src-mq3-game-team-missionpack-ml-131335157"></a>
### SP_team_redobelisk

```ml
function SP_team_redobelisk(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L154)

<a id="function-function-mq3-game-team-missionpack-spawnobelisk-function-spawnobelisk-level-origin-team-spawnflags-src-mq3-game-team-missionpack-ml-1877147923"></a>
### SpawnObelisk

```ml
function SpawnObelisk(level, origin, team, spawnflags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `spawnflags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L122)

<a id="constant-constant-mq3-game-team-missionpack-svf-broadcast-const-svf-broadcast-32-src-mq3-game-team-missionpack-ml-1927212892"></a>
### SVF_BROADCAST

```ml
const SVF_BROADCAST = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L23)

<a id="function-function-mq3-game-team-missionpack-teamobelisk-function-teamobelisk-level-ent-team-src-mq3-game-team-missionpack-ml-273859328"></a>
### teamObelisk

```ml
function teamObelisk(level, ent, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L144)
