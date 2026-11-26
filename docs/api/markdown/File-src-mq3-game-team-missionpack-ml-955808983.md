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

Set `level.teamScores[team]` to `n.add32(level.teamScores[team],score)` in `mq3.game.team_missionpack.addTeamScore`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamScores`. May update `level.teamScores[team]` in place. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `score` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.add32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L78)

<a id="constant-constant-mq3-game-team-missionpack-award-mask-const-award-mask-231496-src-mq3-game-team-missionpack-ml-1358015478"></a>
### AWARD_MASK

```ml
const AWARD_MASK = 231496
```

Player-award identifier selecting the mask reward.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L35)

<a id="function-function-mq3-game-team-missionpack-capturesound-function-capturesound-level-ent-team-src-mq3-game-team-missionpack-ml-975873140"></a>
### captureSound

```ml
function captureSound(level, ent, team)
```

Apply `mq3.game.entities.diagnostic` and `mq3.game.entities.tempEntity` while evaluating `captureSound`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L96)

<a id="function-function-mq3-game-team-missionpack-checkobeliskattack-function-checkobeliskattack-level-obelisk-attacker-src-mq3-game-team-missionpack-ml-862334278"></a>
### CheckObeliskAttack

```ml
function CheckObeliskAttack(level, obelisk, attacker)
```

Set `level.redObeliskAttackedTime` to `level.time` and `level.blueObeliskAttackedTime` to `level.time` in `mq3.game.team_missionpack.CheckObeliskAttack`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `redObeliskAttackedTime` and `blueObeliskAttackedTime`. May update `level.redObeliskAttackedTime` and `level.blueObeliskAttackedTime` in place. |
| `obelisk` | `dynamic` | — | Obelisk record; accesses `die`, `spawnflags` and `s`. |
| `attacker` | `dynamic` | — | Attacking entity; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L243)

<a id="constant-constant-mq3-game-team-missionpack-contents-solid-const-contents-solid-headers-contents-solid-src-mq3-game-team-missionpack-ml-1709821883"></a>
### CONTENTS_SOLID

```ml
const CONTENTS_SOLID = headers.CONTENTS_SOLID
```

Collision-contents bit identifying solid space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L23)

<a id="constant-constant-mq3-game-team-missionpack-contents-trigger-const-contents-trigger-headers-contents-trigger-src-mq3-game-team-missionpack-ml-395642144"></a>
### CONTENTS_TRIGGER

```ml
const CONTENTS_TRIGGER = headers.CONTENTS_TRIGGER
```

Collision-contents bit identifying trigger space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L25)

<a id="constant-constant-mq3-game-team-missionpack-ctf-capture-bonus-const-ctf-capture-bonus-headers-ctf-capture-bonus-src-mq3-game-team-missionpack-ml-1853113443"></a>
### CTF_CAPTURE_BONUS

```ml
const CTF_CAPTURE_BONUS = headers.CTF_CAPTURE_BONUS
```

Capture-the-flag scoring or timing parameter for capture bonus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L37)

<a id="constant-constant-mq3-game-team-missionpack-entitynum-none-const-entitynum-none-1023-src-mq3-game-team-missionpack-ml-1844737083"></a>
### ENTITYNUM_NONE

```ml
const ENTITYNUM_NONE = 1023
```

Entity-number sentinel meaning that no entity was hit or referenced.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L29)

<a id="constant-constant-mq3-game-team-missionpack-fl-no-knockback-const-fl-no-knockback-2048-src-mq3-game-team-missionpack-ml-686434945"></a>
### FL_NO_KNOCKBACK

```ml
const FL_NO_KNOCKBACK = 2048
```

Game entity-flag bit enabling or marking no knockback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L31)

<a id="function-function-mq3-game-team-missionpack-forcegesture-function-forcegesture-level-team-src-mq3-game-team-missionpack-ml-1905848643"></a>
### forceGesture

```ml
function forceGesture(level, team)
```

Force a team celebration gesture for active clients through the Team Arena entity flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L66)

<a id="function-function-mq3-game-team-missionpack-gametype-function-gametype-level-src-mq3-game-team-missionpack-ml-1328048686"></a>
### gametype

```ml
function gametype(level)
```

Read the Team Arena game type from the spawner, returning zero when the spawner is absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L45)

<a id="constant-constant-mq3-game-team-missionpack-gt-1fctf-const-gt-1fctf-5-src-mq3-game-team-missionpack-ml-1461599434"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```

Game-mode identifier selecting 1 fctf rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L17)

<a id="constant-constant-mq3-game-team-missionpack-gt-harvester-const-gt-harvester-7-src-mq3-game-team-missionpack-ml-1043277572"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```

Game-mode identifier selecting harvester rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L21)

<a id="constant-constant-mq3-game-team-missionpack-gt-obelisk-const-gt-obelisk-6-src-mq3-game-team-missionpack-ml-1433903727"></a>
### GT_OBELISK

```ml
const GT_OBELISK = 6
```

Game-mode identifier selecting obelisk rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L19)

<a id="constant-constant-mq3-game-team-missionpack-gt-team-const-gt-team-3-src-mq3-game-team-missionpack-ml-210553646"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```

Game-mode identifier selecting team rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L15)

<a id="constant-constant-mq3-game-team-missionpack-mask-solid-const-mask-solid-1-src-mq3-game-team-missionpack-ml-948979066"></a>
### MASK_SOLID

```ml
const MASK_SOLID = 1
```

Combined CONTENTS_* mask used for solid collision queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L27)

<a id="function-function-mq3-game-team-missionpack-message-function-message-level-text-src-mq3-game-team-missionpack-ml-1301500235"></a>
### message

```ml
function message(level, text)
```

Use `level.teamMessageFn` to perform `message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamMessageFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L59)

<a id="function-function-mq3-game-team-missionpack-obeliskdie-function-obeliskdie-level-self-inflictor-attacker-damage-mod-src-mq3-game-team-missionpack-ml-45390208"></a>
### ObeliskDie

```ml
function ObeliskDie(level, self, inflictor, attacker, damage, mod)
```

Update `self.takedamage`, `self.think`, `self.nextthink` and `self.activator.s.modelindex2` and related state during `ObeliskDie`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `obeliskRespawnDelay`, `redObeliskAttackedTime` and `blueObeliskAttackedTime`. May update `level.redObeliskAttackedTime` and `level.blueObeliskAttackedTime` in place. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `spawnflags`, `s`, `takedamage`, `think` and `nextthink` and related fields. May update `self.takedamage`, `self.think` and `self.nextthink` and additional fields in place. |
| `inflictor` | `dynamic` | — | Not read by this implementation; retained in the `ObeliskDie` signature. |
| `attacker` | `dynamic` | — | Attacking entity; accesses `client`. May update `attacker.client.ps.eFlags`, `attacker.client.rewardTime` and `attacker.client.ps.persistant[c.PERS_CAPTURES]` in place. |
| `damage` | `dynamic` | — | Not read by this implementation; retained in the `ObeliskDie` signature. |
| `mod` | `dynamic` | — | Not read by this implementation; retained in the `ObeliskDie` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L135)

<a id="function-function-mq3-game-team-missionpack-obeliskpain-function-obeliskpain-level-self-attacker-damage-src-mq3-game-team-missionpack-ml-2145119540"></a>
### ObeliskPain

```ml
function ObeliskPain(level, self, attacker, damage)
```

Update `self.activator.s.modelindex2` and `self.activator.s.frame` during `ObeliskPain`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `obeliskHealth`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `activator`, `health` and `r`. May update `self.activator.s.modelindex2` and `self.activator.s.frame` in place. |
| `attacker` | `dynamic` | — | Entity credited with the attack. |
| `damage` | `dynamic` | — | Damage amount before the current operation applies its rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L170)

<a id="function-function-mq3-game-team-missionpack-obeliskregen-function-obeliskregen-level-self-src-mq3-game-team-missionpack-ml-1946889856"></a>
### ObeliskRegen

```ml
function ObeliskRegen(level, self)
```

Update `self.nextthink`, `self.health`, `self.activator.s.modelindex2` and `self.activator.s.frame` during `ObeliskRegen`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `obeliskRegenPeriod`, `obeliskHealth` and `obeliskRegenAmount`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `nextthink`, `health` and `activator`. May update `self.nextthink`, `self.health` and `self.activator.s.modelindex2` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L108)

<a id="function-function-mq3-game-team-missionpack-obeliskrespawn-function-obeliskrespawn-level-self-src-mq3-game-team-missionpack-ml-1965274600"></a>
### ObeliskRespawn

```ml
function ObeliskRespawn(level, self)
```

Update `self.takedamage`, `self.health`, `self.think` and `self.nextthink` and related state during `ObeliskRespawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `obeliskHealth`, `time` and `obeliskRegenPeriod`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `takedamage`, `health`, `think`, `nextthink` and `activator`. May update `self.takedamage`, `self.health` and `self.think` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L122)

<a id="function-function-mq3-game-team-missionpack-obelisktouch-function-obelisktouch-level-self-other-trace-src-mq3-game-team-missionpack-ml-1290522259"></a>
### ObeliskTouch

```ml
function ObeliskTouch(level, self, other, trace)
```

Update `other.client.ps.eFlags`, `other.client.rewardTime`, `other.client.ps.persistant[c.PERS_CAPTURES]` and `other.client.ps.generic1` during `ObeliskTouch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `spawnflags`, `s` and `r`. |
| `other` | `dynamic` | — | Other record; accesses `client`. May update `other.client.ps.eFlags`, `other.client.rewardTime` and `other.client.ps.persistant[c.PERS_CAPTURES]` and additional fields in place. |
| `trace` | `dynamic` | — | Not read by this implementation; retained in the `ObeliskTouch` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L153)

<a id="function-function-mq3-game-team-missionpack-otherteam-function-otherteam-team-src-mq3-game-team-missionpack-ml-2100319329"></a>
### otherTeam

```ml
function otherTeam(team)
```

Exchange red and blue team identifiers for team missionpack, preserving other team values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L51)

<a id="constant-constant-mq3-game-team-missionpack-overload-attack-base-sound-time-const-overload-attack-base-sound-time-headers-overload-attack-base-sound-time-src-mq3-game-team-missionpack-ml-660576172"></a>
### OVERLOAD_ATTACK_BASE_SOUND_TIME

```ml
const OVERLOAD_ATTACK_BASE_SOUND_TIME = headers.OVERLOAD_ATTACK_BASE_SOUND_TIME
```

Minimum interval in milliseconds between base-under-attack announcements.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L41)

<a id="constant-constant-mq3-game-team-missionpack-reward-sprite-time-const-reward-sprite-time-2000-src-mq3-game-team-missionpack-ml-1617690521"></a>
### REWARD_SPRITE_TIME

```ml
const REWARD_SPRITE_TIME = 2000
```

Duration in milliseconds for which a player reward sprite remains visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L39)

<a id="function-function-mq3-game-team-missionpack-sp-team-blueobelisk-function-sp-team-blueobelisk-level-ent-src-mq3-game-team-missionpack-ml-2106041371"></a>
### SP_team_blueobelisk

```ml
function SP_team_blueobelisk(level, ent)
```

Forward `SP_team_blueobelisk` to `mq3.game.team_missionpack.teamObelisk` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `obeliskAttackFn`. May update `level.obeliskAttackFn` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `s` and `spawnflags`. May update `ent.s.eType`, `ent.s.modelindex2` and `ent.s.frame` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L226)

<a id="function-function-mq3-game-team-missionpack-sp-team-neutralobelisk-function-sp-team-neutralobelisk-level-ent-src-mq3-game-team-missionpack-ml-1388089829"></a>
### SP_team_neutralobelisk

```ml
function SP_team_neutralobelisk(level, ent)
```

Update `level.obeliskAttackFn`, `ent.s.eType`, `level.neutralObelisk` and `level.neutralObelisk.spawnflags` and related state during `SP_team_neutralobelisk`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `obeliskAttackFn` and `neutralObelisk`. May update `level.obeliskAttackFn`, `level.neutralObelisk` and `level.neutralObelisk.spawnflags` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `s` and `spawnflags`. May update `ent.s.eType` and `ent.s.modelindex` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L230)

<a id="function-function-mq3-game-team-missionpack-sp-team-redobelisk-function-sp-team-redobelisk-level-ent-src-mq3-game-team-missionpack-ml-131335157"></a>
### SP_team_redobelisk

```ml
function SP_team_redobelisk(level, ent)
```

Forward `SP_team_redobelisk` to `mq3.game.team_missionpack.teamObelisk` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `obeliskAttackFn`. May update `level.obeliskAttackFn` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `s` and `spawnflags`. May update `ent.s.eType`, `ent.s.modelindex2` and `ent.s.frame` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L222)

<a id="function-function-mq3-game-team-missionpack-spawnobelisk-function-spawnobelisk-level-origin-team-spawnflags-src-mq3-game-team-missionpack-ml-1877147923"></a>
### SpawnObelisk

```ml
function SpawnObelisk(level, origin, team, spawnflags)
```

Apply `mq3.game.entities.spawn`, `mq3.game.movement.copy` and `mq3.game.entities.setOrigin` while evaluating `SpawnObelisk`. Return paths include `ent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `obeliskHealth`, `time`, `obeliskRegenPeriod` and `scene`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. Entries may be updated in place. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `spawnflags` | `dynamic` | — | Value used by `SpawnObelisk` in `if (spawnflags & 1) != 0 then game.setOrigin(ent,ent.s.origin)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L183)

<a id="constant-constant-mq3-game-team-missionpack-svf-broadcast-const-svf-broadcast-32-src-mq3-game-team-missionpack-ml-1927212892"></a>
### SVF_BROADCAST

```ml
const SVF_BROADCAST = 32
```

Server entity-flag bit controlling broadcast.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L33)

<a id="function-function-mq3-game-team-missionpack-teamobelisk-function-teamobelisk-level-ent-team-src-mq3-game-team-missionpack-ml-273859328"></a>
### teamObelisk

```ml
function teamObelisk(level, ent, team)
```

Update `level.obeliskAttackFn`, `ent.s.eType`, `ent.s.modelindex2` and `ent.s.frame` and related state during `teamObelisk`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `obeliskAttackFn`. May update `level.obeliskAttackFn` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `s` and `spawnflags`. May update `ent.s.eType`, `ent.s.modelindex2` and `ent.s.frame` and additional fields in place. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_missionpack.ml#L209)
