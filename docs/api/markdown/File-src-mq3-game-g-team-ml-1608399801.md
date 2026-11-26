# `src/mq3/game/g_team.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_team`](Package-mq3-game-g-team-578054017.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/combat.ml` as `combat` → [src/mq3/game/combat.ml](File-src-mq3-game-combat-ml-473208184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/items.ml` as `items` → [src/mq3/game/items.ml](File-src-mq3-game-items-ml-152650830.md)
- `mq3/game/player_spawns.ml` as `spawns` → [src/mq3/game/player_spawns.ml](File-src-mq3-game-player-spawns-ml-1960128696.md)
- `mq3/game/team_bonuses.ml` as `bonuses` → [src/mq3/game/team_bonuses.ml](File-src-mq3-game-team-bonuses-ml-406479811.md)
- `mq3/game/team_missionpack.ml` as `mission` → [src/mq3/game/team_missionpack.ml](File-src-mq3-game-team-missionpack-ml-955808983.md)
- `mq3/game/team_status.ml` as `status` → [src/mq3/game/team_status.ml](File-src-mq3-game-team-status-ml-1980544906.md)

## Declarations

<a id="function-function-mq3-game-g-team-addteamscore-function-addteamscore-level-origin-team-score-src-mq3-game-g-team-ml-189197819"></a>
### AddTeamScore

```ml
function AddTeamScore(level, origin, team, score)
```

Forward `AddTeamScore` to `mq3.game.items.addTeamScore` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamScores`. May update `level.teamScores[team]` in place. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `score` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.add32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L60)

<a id="function-function-mq3-game-g-team-checkobeliskattack-function-checkobeliskattack-level-obelisk-attacker-src-mq3-game-g-team-ml-699592254"></a>
### CheckObeliskAttack

```ml
function CheckObeliskAttack(level, obelisk, attacker)
```

Forward `CheckObeliskAttack` to `mq3.game.team_missionpack.CheckObeliskAttack` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `redObeliskAttackedTime` and `blueObeliskAttackedTime`. May update `level.redObeliskAttackedTime` and `level.blueObeliskAttackedTime` in place. |
| `obelisk` | `dynamic` | — | Obelisk record; accesses `die`, `spawnflags` and `s`. |
| `attacker` | `dynamic` | — | Entity credited with the attack. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L266)

<a id="function-function-mq3-game-g-team-checkteamstatus-function-checkteamstatus-level-src-mq3-game-g-team-ml-887090556"></a>
### CheckTeamStatus

```ml
function CheckTeamStatus(level)
```

Forward `CheckTeamStatus` to `mq3.game.team_status.check` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `lastTeamLocationTime` and `entities`. May update `level.lastTeamLocationTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L199)

<a id="function-function-mq3-game-g-team-obeliskdie-function-obeliskdie-level-self-inflictor-attacker-damage-mod-src-mq3-game-g-team-ml-1120477132"></a>
### ObeliskDie

```ml
function ObeliskDie(level, self, inflictor, attacker, damage, mod)
```

Forward `ObeliskDie` to `mq3.game.team_missionpack.ObeliskDie` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `obeliskRespawnDelay`, `redObeliskAttackedTime` and `blueObeliskAttackedTime`. May update `level.redObeliskAttackedTime` and `level.blueObeliskAttackedTime` in place. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `spawnflags`, `s`, `takedamage`, `think` and `nextthink` and related fields. May update `self.takedamage`, `self.think` and `self.nextthink` and additional fields in place. |
| `inflictor` | `dynamic` | — | Entity directly delivering the damage. |
| `attacker` | `dynamic` | — | Entity credited with the attack. |
| `damage` | `dynamic` | — | Damage amount before the current operation applies its rules. |
| `mod` | `dynamic` | — | Means-of-death code used for damage attribution. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L231)

<a id="function-function-mq3-game-g-team-obeliskpain-function-obeliskpain-level-self-attacker-damage-src-mq3-game-g-team-ml-82032816"></a>
### ObeliskPain

```ml
function ObeliskPain(level, self, attacker, damage)
```

Forward `ObeliskPain` to `mq3.game.team_missionpack.ObeliskPain` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `obeliskHealth`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `activator`, `health` and `r`. May update `self.activator.s.modelindex2` and `self.activator.s.frame` in place. |
| `attacker` | `dynamic` | — | Entity credited with the attack. |
| `damage` | `dynamic` | — | Damage amount before the current operation applies its rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L243)

<a id="function-function-mq3-game-g-team-obeliskregen-function-obeliskregen-level-self-src-mq3-game-g-team-ml-796299036"></a>
### ObeliskRegen

```ml
function ObeliskRegen(level, self)
```

Forward `ObeliskRegen` to `mq3.game.team_missionpack.ObeliskRegen` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `obeliskRegenPeriod`, `obeliskHealth` and `obeliskRegenAmount`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `nextthink`, `health` and `activator`. May update `self.nextthink`, `self.health` and `self.activator.s.modelindex2` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L219)

<a id="function-function-mq3-game-g-team-obeliskrespawn-function-obeliskrespawn-level-self-src-mq3-game-g-team-ml-1587060052"></a>
### ObeliskRespawn

```ml
function ObeliskRespawn(level, self)
```

Forward `ObeliskRespawn` to `mq3.game.team_missionpack.ObeliskRespawn` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `obeliskHealth`, `time` and `obeliskRegenPeriod`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `takedamage`, `health`, `think`, `nextthink` and `activator`. May update `self.takedamage`, `self.health` and `self.think` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L223)

<a id="function-function-mq3-game-g-team-obelisktouch-function-obelisktouch-level-self-other-trace-src-mq3-game-g-team-ml-1361088511"></a>
### ObeliskTouch

```ml
function ObeliskTouch(level, self, other, trace)
```

Forward `ObeliskTouch` to `mq3.game.team_missionpack.ObeliskTouch` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `spawnflags`, `s` and `r`. |
| `other` | `dynamic` | — | Other record; accesses `client`. May update `other.client.ps.eFlags`, `other.client.rewardTime` and `other.client.ps.persistant[c.PERS_CAPTURES]` and additional fields in place. |
| `trace` | `dynamic` | — | Value passed as argument 4 to `mq3.game.team_missionpack.ObeliskTouch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L237)

<a id="function-function-mq3-game-g-team-onsameteam-function-onsameteam-level-first-second-src-mq3-game-g-team-ml-146148962"></a>
### OnSameTeam

```ml
function OnSameTeam(level, first, second)
```

Forward `OnSameTeam` to `mq3.game.team_bonuses.sameTeam` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `first` | `dynamic` | — | First record; accesses `client`. |
| `second` | `dynamic` | — | Second record; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L65)

<a id="function-function-mq3-game-g-team-otherteam-function-otherteam-team-src-mq3-game-g-team-ml-477509833"></a>
### OtherTeam

```ml
function OtherTeam(team)
```

Forward `OtherTeam` to `mq3.game.team_bonuses.otherTeam` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L27)

<a id="function-function-mq3-game-g-team-otherteamname-function-otherteamname-team-src-mq3-game-g-team-ml-830822403"></a>
### OtherTeamName

```ml
function OtherTeamName(team)
```

Forward `OtherTeamName` to `mq3.game.team_bonuses.teamName` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L33)

<a id="function-function-mq3-game-g-team-pickup-team-function-pickup-team-level-ent-other-src-mq3-game-g-team-ml-732150887"></a>
### Pickup_Team

```ml
function Pickup_Team(level, ent, other)
```

Set `other.client.ps.generic1` to `n.add32(other.client.ps.generic1,1)` in `mq3.game.g_team.Pickup_Team`. Return paths include `items.pickupTeam(level,ent,other)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `spawnflags` and `classname`. |
| `other` | `dynamic` | — | Other record; accesses `client`. May update `other.client.ps.generic1` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L149)

<a id="function-function-mq3-game-g-team-printmsg-function-printmsg-level-ent-text-src-mq3-game-g-team-ml-1279396982"></a>
### PrintMsg

```ml
function PrintMsg(level, ent, text)
```

Use `level.teamMessageFn` to perform `PrintMsg`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamMessageFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `slot`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L46)

<a id="function-function-mq3-game-g-team-selectctfspawnpoint-function-selectctfspawnpoint-level-team-teamstate-origin-angles-src-mq3-game-g-team-ml-181573511"></a>
### SelectCTFSpawnPoint

```ml
function SelectCTFSpawnPoint(level, team, teamstate, origin, angles)
```

Forward `SelectCTFSpawnPoint` to `mq3.game.player_spawns.ctf` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `teamstate` | `dynamic` | — | Value used by `randomTeam` in `if teamstate == 0 then`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L188)

<a id="function-function-mq3-game-g-team-selectrandomteamspawnpoint-function-selectrandomteamspawnpoint-level-teamstate-team-src-mq3-game-g-team-ml-215302023"></a>
### SelectRandomTeamSpawnPoint

```ml
function SelectRandomTeamSpawnPoint(level, teamstate, team)
```

Forward `SelectRandomTeamSpawnPoint` to `mq3.game.player_spawns.randomTeam` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `teamstate` | `dynamic` | — | Value used by `randomTeam` in `if teamstate == 0 then`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L181)

<a id="function-function-mq3-game-g-team-sortclients-function-sortclients-a-b-src-mq3-game-g-team-ml-454757253"></a>
### SortClients

```ml
function SortClients(a, b)
```

Forward `SortClients` to `mq3.game.team_status.sortClients` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Operand used to evaluate the returned expression `n.i32(a-b)`. |
| `b` | `dynamic` | — | Operand used to evaluate the returned expression `n.i32(a-b)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L192)

<a id="function-function-mq3-game-g-team-sp-team-blueobelisk-function-sp-team-blueobelisk-level-ent-src-mq3-game-g-team-ml-938153527"></a>
### SP_team_blueobelisk

```ml
function SP_team_blueobelisk(level, ent)
```

Forward `SP_team_blueobelisk` to `mq3.game.team_missionpack.SP_team_blueobelisk` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `obeliskAttackFn`. May update `level.obeliskAttackFn` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `s` and `spawnflags`. May update `ent.s.eType`, `ent.s.modelindex2` and `ent.s.frame` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L257)

<a id="function-function-mq3-game-g-team-sp-team-ctf-blueplayer-function-sp-team-ctf-blueplayer-level-ent-src-mq3-game-g-team-ml-700647677"></a>
### SP_team_CTF_blueplayer

```ml
function SP_team_CTF_blueplayer(level, ent)
```

Return `void` for `SP_team_CTF_blueplayer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `SP_team_CTF_blueplayer` signature. |
| `ent` | `dynamic` | — | Not read by this implementation; retained in the `SP_team_CTF_blueplayer` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L207)

<a id="function-function-mq3-game-g-team-sp-team-ctf-bluespawn-function-sp-team-ctf-bluespawn-level-ent-src-mq3-game-g-team-ml-522639531"></a>
### SP_team_CTF_bluespawn

```ml
function SP_team_CTF_bluespawn(level, ent)
```

Return `void` for `SP_team_CTF_bluespawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `SP_team_CTF_bluespawn` signature. |
| `ent` | `dynamic` | — | Not read by this implementation; retained in the `SP_team_CTF_bluespawn` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L215)

<a id="function-function-mq3-game-g-team-sp-team-ctf-redplayer-function-sp-team-ctf-redplayer-level-ent-src-mq3-game-g-team-ml-116838909"></a>
### SP_team_CTF_redplayer

```ml
function SP_team_CTF_redplayer(level, ent)
```

Return `void` for `SP_team_CTF_redplayer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `SP_team_CTF_redplayer` signature. |
| `ent` | `dynamic` | — | Not read by this implementation; retained in the `SP_team_CTF_redplayer` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L203)

<a id="function-function-mq3-game-g-team-sp-team-ctf-redspawn-function-sp-team-ctf-redspawn-level-ent-src-mq3-game-g-team-ml-1900555769"></a>
### SP_team_CTF_redspawn

```ml
function SP_team_CTF_redspawn(level, ent)
```

Return `void` for `SP_team_CTF_redspawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `SP_team_CTF_redspawn` signature. |
| `ent` | `dynamic` | — | Not read by this implementation; retained in the `SP_team_CTF_redspawn` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L211)

<a id="function-function-mq3-game-g-team-sp-team-neutralobelisk-function-sp-team-neutralobelisk-level-ent-src-mq3-game-g-team-ml-1949894317"></a>
### SP_team_neutralobelisk

```ml
function SP_team_neutralobelisk(level, ent)
```

Forward `SP_team_neutralobelisk` to `mq3.game.team_missionpack.SP_team_neutralobelisk` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `obeliskAttackFn` and `neutralObelisk`. May update `level.obeliskAttackFn`, `level.neutralObelisk` and `level.neutralObelisk.spawnflags` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `s` and `spawnflags`. May update `ent.s.eType` and `ent.s.modelindex` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L261)

<a id="function-function-mq3-game-g-team-sp-team-redobelisk-function-sp-team-redobelisk-level-ent-src-mq3-game-g-team-ml-271319117"></a>
### SP_team_redobelisk

```ml
function SP_team_redobelisk(level, ent)
```

Forward `SP_team_redobelisk` to `mq3.game.team_missionpack.SP_team_redobelisk` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `obeliskAttackFn`. May update `level.obeliskAttackFn` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `s` and `spawnflags`. May update `ent.s.eType`, `ent.s.modelindex2` and `ent.s.frame` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L253)

<a id="function-function-mq3-game-g-team-spawnobelisk-function-spawnobelisk-level-origin-team-spawnflags-src-mq3-game-g-team-ml-84482215"></a>
### SpawnObelisk

```ml
function SpawnObelisk(level, origin, team, spawnflags)
```

Forward `SpawnObelisk` to `mq3.game.team_missionpack.SpawnObelisk` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `obeliskHealth`, `time`, `obeliskRegenPeriod` and `scene`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `spawnflags` | `dynamic` | — | Value used by `SpawnObelisk` in `if (spawnflags & 1) != 0 then game.setOrigin(ent,ent.s.origin)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L249)

<a id="function-function-mq3-game-g-team-team-captureflagsound-function-team-captureflagsound-level-ent-team-src-mq3-game-g-team-ml-2040701126"></a>
### Team_CaptureFlagSound

```ml
function Team_CaptureFlagSound(level, ent, team)
```

Forward `Team_CaptureFlagSound` to `mq3.game.items.captureFlagSound` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L111)

<a id="function-function-mq3-game-g-team-team-checkdroppeditem-function-team-checkdroppeditem-level-dropped-src-mq3-game-g-team-ml-1729625104"></a>
### Team_CheckDroppedItem

```ml
function Team_CheckDroppedItem(level, dropped)
```

Forward `Team_CheckDroppedItem` to `mq3.game.items.checkDropped` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `dropped` | `dynamic` | — | Dropped record; accesses `item`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L74)

<a id="function-function-mq3-game-g-team-team-checkhurtcarrier-function-team-checkhurtcarrier-level-targ-attacker-src-mq3-game-g-team-ml-2062560759"></a>
### Team_CheckHurtCarrier

```ml
function Team_CheckHurtCarrier(level, targ, attacker)
```

Forward `Team_CheckHurtCarrier` to `mq3.game.combat.checkHurtCarrier` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `targ` | `dynamic` | — | Targ record; accesses `client`. |
| `attacker` | `dynamic` | — | Entity credited with the attack. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L89)

<a id="function-function-mq3-game-g-team-team-droppedflagthink-function-team-droppedflagthink-level-ent-src-mq3-game-g-team-ml-1666719705"></a>
### Team_DroppedFlagThink

```ml
function Team_DroppedFlagThink(level, ent)
```

Forward `Team_DroppedFlagThink` to `mq3.game.items.droppedFlagThink` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L123)

<a id="function-function-mq3-game-g-team-team-forcegesture-function-team-forcegesture-level-team-src-mq3-game-g-team-ml-1389381551"></a>
### Team_ForceGesture

```ml
function Team_ForceGesture(level, team)
```

Forward `Team_ForceGesture` to `mq3.game.items.forceGesture` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L78)

<a id="function-function-mq3-game-g-team-team-fragbonuses-function-team-fragbonuses-level-targ-inflictor-attacker-src-mq3-game-g-team-ml-268638677"></a>
### Team_FragBonuses

```ml
function Team_FragBonuses(level, targ, inflictor, attacker)
```

Forward `Team_FragBonuses` to `mq3.game.team_bonuses.fragBonuses` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `maxclientsCvar`, `entities` and `scene`. |
| `targ` | `dynamic` | — | Targ record; accesses `client` and `r`. May update `targ.client.lasthurtcarrier` in place. |
| `inflictor` | `dynamic` | — | Entity directly delivering the damage. |
| `attacker` | `dynamic` | — | Entity credited with the attack. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L84)

<a id="function-function-mq3-game-g-team-team-freeentity-function-team-freeentity-level-ent-src-mq3-game-g-team-ml-348426927"></a>
### Team_FreeEntity

```ml
function Team_FreeEntity(level, ent)
```

Forward `Team_FreeEntity` to `mq3.game.items.teamFree` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L119)

<a id="function-function-mq3-game-g-team-team-getlocation-function-team-getlocation-level-ent-src-mq3-game-g-team-ml-1437119981"></a>
### Team_GetLocation

```ml
function Team_GetLocation(level, ent)
```

Forward `Team_GetLocation` to `mq3.game.team_status.getLocation` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `locationHead` and `scene`. |
| `ent` | `dynamic` | — | Game entity; accesses `r`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L171)

<a id="function-function-mq3-game-g-team-team-getlocationmsg-function-team-getlocationmsg-level-ent-capacity-src-mq3-game-g-team-ml-947619917"></a>
### Team_GetLocationMsg

```ml
function Team_GetLocationMsg(level, ent, capacity)
```

Forward `Team_GetLocationMsg` to `mq3.game.team_status.getLocationMsg` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `r`. |
| `capacity` | `dynamic` | — | Maximum number of entries to allocate or retain. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L176)

<a id="function-function-mq3-game-g-team-team-initgame-function-team-initgame-level-src-mq3-game-g-team-ml-971176018"></a>
### Team_InitGame

```ml
function Team_InitGame(level)
```

Set `level.neutralFlagStatus` to `-1` in `mq3.game.g_team.Team_InitGame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `neutralFlagStatus`. May update `level.neutralFlagStatus` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L18)

<a id="function-function-mq3-game-g-team-team-resetflag-function-team-resetflag-level-team-src-mq3-game-g-team-ml-1530454955"></a>
### Team_ResetFlag

```ml
function Team_ResetFlag(level, team)
```

Forward `Team_ResetFlag` to `mq3.game.items.resetFlag` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L93)

<a id="function-function-mq3-game-g-team-team-resetflags-function-team-resetflags-level-src-mq3-game-g-team-ml-72733550"></a>
### Team_ResetFlags

```ml
function Team_ResetFlags(level)
```

Forward `Team_ResetFlags` to `mq3.game.items.resetFlags` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L96)

<a id="function-function-mq3-game-g-team-team-returnflag-function-team-returnflag-level-team-src-mq3-game-g-team-ml-1564729727"></a>
### Team_ReturnFlag

```ml
function Team_ReturnFlag(level, team)
```

Forward `Team_ReturnFlag` to `mq3.game.items.returnFlag` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamMessageFn`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L115)

<a id="function-function-mq3-game-g-team-team-returnflagsound-function-team-returnflagsound-level-ent-team-src-mq3-game-g-team-ml-871744560"></a>
### Team_ReturnFlagSound

```ml
function Team_ReturnFlagSound(level, ent, team)
```

Forward `Team_ReturnFlagSound` to `mq3.game.items.returnFlagSound` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L101)

<a id="function-function-mq3-game-g-team-team-setflagstatus-function-team-setflagstatus-level-team-value-src-mq3-game-g-team-ml-1429383286"></a>
### Team_SetFlagStatus

```ml
function Team_SetFlagStatus(level, team, value)
```

Forward `Team_SetFlagStatus` to `mq3.game.items.setFlagStatus` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `redFlagStatus`, `blueFlagStatus`, `neutralFlagStatus` and `spawner`. May update `level.redFlagStatus`, `level.blueFlagStatus` and `level.neutralFlagStatus` in place. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `value` | `dynamic` | — | Value used by `setFlagStatus` in `if status < 0 or status > 4 then return error(497,"Invalid flag status") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L70)

<a id="function-function-mq3-game-g-team-team-takeflagsound-function-team-takeflagsound-level-ent-team-src-mq3-game-g-team-ml-966102020"></a>
### Team_TakeFlagSound

```ml
function Team_TakeFlagSound(level, ent, team)
```

Forward `Team_TakeFlagSound` to `mq3.game.items.takeFlagSound` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `blueFlagStatus`, `blueTakenTime`, `time`, `redFlagStatus` and `redTakenTime`. May update `level.blueTakenTime` and `level.redTakenTime` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L106)

<a id="function-function-mq3-game-g-team-team-touchenemyflag-function-team-touchenemyflag-level-ent-other-team-src-mq3-game-g-team-ml-1986344724"></a>
### Team_TouchEnemyFlag

```ml
function Team_TouchEnemyFlag(level, ent, other, team)
```

Set `other.client.ps.powerups[c.PW_NEUTRALFLAG]` to `2147483647` and `other.client.flagsince` to `n.f32(level.time)` in `mq3.game.g_team.Team_TouchEnemyFlag`. Return paths include `items.touchEnemyFlag(level,ent,other,team)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `other` | `dynamic` | — | Other record; accesses `client`. May update `other.client.ps.powerups[c.PW_NEUTRALFLAG]` and `other.client.flagsince` in place. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L135)

<a id="function-function-mq3-game-g-team-team-touchourflag-function-team-touchourflag-level-ent-other-team-src-mq3-game-g-team-ml-1263707572"></a>
### Team_TouchOurFlag

```ml
function Team_TouchOurFlag(level, ent, other, team)
```

Forward `Team_TouchOurFlag` to `mq3.game.items.touchOurFlag` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `lastFlagCapture`, `lastCaptureTeam`, `maxclients` and `entities`. May update `level.lastFlagCapture` and `level.lastCaptureTeam` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `flags`, `r` and `s`. |
| `other` | `dynamic` | — | Other record; accesses `client`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L129)

<a id="function-function-mq3-game-g-team-teamcolorstring-function-teamcolorstring-team-src-mq3-game-g-team-ml-147960817"></a>
### TeamColorString

```ml
function TeamColorString(team)
```

Execute `if team == c.TEAM_RED then return "^1" end if if team == c.TEAM_BLUE then return "^4" end if if team == c.TEAM_SPECTA...` in `TeamColorString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L36)

<a id="function-function-mq3-game-g-team-teamname-function-teamname-team-src-mq3-game-g-team-ml-1508817027"></a>
### TeamName

```ml
function TeamName(team)
```

Forward `TeamName` to `mq3.game.team_bonuses.teamName` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L30)

<a id="function-function-mq3-game-g-team-teamplayinfomessage-function-teamplayinfomessage-level-ent-src-mq3-game-g-team-ml-213251429"></a>
### TeamplayInfoMessage

```ml
function TeamplayInfoMessage(level, ent)
```

Forward `TeamplayInfoMessage` to `mq3.game.team_status.sendInfo` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `sortedClients`, `entities` and `serverCommandFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `slot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_team.ml#L196)
