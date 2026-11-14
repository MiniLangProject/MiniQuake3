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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `score` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L41)

<a id="function-function-mq3-game-g-team-checkobeliskattack-function-checkobeliskattack-level-obelisk-attacker-src-mq3-game-g-team-ml-699592254"></a>
### CheckObeliskAttack

```ml
function CheckObeliskAttack(level, obelisk, attacker)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `obelisk` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L106)

<a id="function-function-mq3-game-g-team-checkteamstatus-function-checkteamstatus-level-src-mq3-game-g-team-ml-887090556"></a>
### CheckTeamStatus

```ml
function CheckTeamStatus(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L92)

<a id="function-function-mq3-game-g-team-obeliskdie-function-obeliskdie-level-self-inflictor-attacker-damage-mod-src-mq3-game-g-team-ml-1120477132"></a>
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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L99)

<a id="function-function-mq3-game-g-team-obeliskpain-function-obeliskpain-level-self-attacker-damage-src-mq3-game-g-team-ml-82032816"></a>
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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L101)

<a id="function-function-mq3-game-g-team-obeliskregen-function-obeliskregen-level-self-src-mq3-game-g-team-ml-796299036"></a>
### ObeliskRegen

```ml
function ObeliskRegen(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L97)

<a id="function-function-mq3-game-g-team-obeliskrespawn-function-obeliskrespawn-level-self-src-mq3-game-g-team-ml-1587060052"></a>
### ObeliskRespawn

```ml
function ObeliskRespawn(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L98)

<a id="function-function-mq3-game-g-team-obelisktouch-function-obelisktouch-level-self-other-trace-src-mq3-game-g-team-ml-1361088511"></a>
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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L100)

<a id="function-function-mq3-game-g-team-onsameteam-function-onsameteam-level-first-second-src-mq3-game-g-team-ml-146148962"></a>
### OnSameTeam

```ml
function OnSameTeam(level, first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L42)

<a id="function-function-mq3-game-g-team-otherteam-function-otherteam-team-src-mq3-game-g-team-ml-477509833"></a>
### OtherTeam

```ml
function OtherTeam(team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L23)

<a id="function-function-mq3-game-g-team-otherteamname-function-otherteamname-team-src-mq3-game-g-team-ml-830822403"></a>
### OtherTeamName

```ml
function OtherTeamName(team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L25)

<a id="function-function-mq3-game-g-team-pickup-team-function-pickup-team-level-ent-other-src-mq3-game-g-team-ml-732150887"></a>
### Pickup_Team

```ml
function Pickup_Team(level, ent, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L67)

<a id="function-function-mq3-game-g-team-printmsg-function-printmsg-level-ent-text-src-mq3-game-g-team-ml-1279396982"></a>
### PrintMsg

```ml
function PrintMsg(level, ent, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L32)

<a id="function-function-mq3-game-g-team-selectctfspawnpoint-function-selectctfspawnpoint-level-team-teamstate-origin-angles-src-mq3-game-g-team-ml-181573511"></a>
### SelectCTFSpawnPoint

```ml
function SelectCTFSpawnPoint(level, team, teamstate, origin, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `teamstate` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L89)

<a id="function-function-mq3-game-g-team-selectrandomteamspawnpoint-function-selectrandomteamspawnpoint-level-teamstate-team-src-mq3-game-g-team-ml-215302023"></a>
### SelectRandomTeamSpawnPoint

```ml
function SelectRandomTeamSpawnPoint(level, teamstate, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `teamstate` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L88)

<a id="function-function-mq3-game-g-team-sortclients-function-sortclients-a-b-src-mq3-game-g-team-ml-454757253"></a>
### SortClients

```ml
function SortClients(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L90)

<a id="function-function-mq3-game-g-team-sp-team-blueobelisk-function-sp-team-blueobelisk-level-ent-src-mq3-game-g-team-ml-938153527"></a>
### SP_team_blueobelisk

```ml
function SP_team_blueobelisk(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L104)

<a id="function-function-mq3-game-g-team-sp-team-ctf-blueplayer-function-sp-team-ctf-blueplayer-level-ent-src-mq3-game-g-team-ml-700647677"></a>
### SP_team_CTF_blueplayer

```ml
function SP_team_CTF_blueplayer(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L94)

<a id="function-function-mq3-game-g-team-sp-team-ctf-bluespawn-function-sp-team-ctf-bluespawn-level-ent-src-mq3-game-g-team-ml-522639531"></a>
### SP_team_CTF_bluespawn

```ml
function SP_team_CTF_bluespawn(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L96)

<a id="function-function-mq3-game-g-team-sp-team-ctf-redplayer-function-sp-team-ctf-redplayer-level-ent-src-mq3-game-g-team-ml-116838909"></a>
### SP_team_CTF_redplayer

```ml
function SP_team_CTF_redplayer(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L93)

<a id="function-function-mq3-game-g-team-sp-team-ctf-redspawn-function-sp-team-ctf-redspawn-level-ent-src-mq3-game-g-team-ml-1900555769"></a>
### SP_team_CTF_redspawn

```ml
function SP_team_CTF_redspawn(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L95)

<a id="function-function-mq3-game-g-team-sp-team-neutralobelisk-function-sp-team-neutralobelisk-level-ent-src-mq3-game-g-team-ml-1949894317"></a>
### SP_team_neutralobelisk

```ml
function SP_team_neutralobelisk(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L105)

<a id="function-function-mq3-game-g-team-sp-team-redobelisk-function-sp-team-redobelisk-level-ent-src-mq3-game-g-team-ml-271319117"></a>
### SP_team_redobelisk

```ml
function SP_team_redobelisk(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L103)

<a id="function-function-mq3-game-g-team-spawnobelisk-function-spawnobelisk-level-origin-team-spawnflags-src-mq3-game-g-team-ml-84482215"></a>
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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L102)

<a id="function-function-mq3-game-g-team-team-captureflagsound-function-team-captureflagsound-level-ent-team-src-mq3-game-g-team-ml-2040701126"></a>
### Team_CaptureFlagSound

```ml
function Team_CaptureFlagSound(level, ent, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L52)

<a id="function-function-mq3-game-g-team-team-checkdroppeditem-function-team-checkdroppeditem-level-dropped-src-mq3-game-g-team-ml-1729625104"></a>
### Team_CheckDroppedItem

```ml
function Team_CheckDroppedItem(level, dropped)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `dropped` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L44)

<a id="function-function-mq3-game-g-team-team-checkhurtcarrier-function-team-checkhurtcarrier-level-targ-attacker-src-mq3-game-g-team-ml-2062560759"></a>
### Team_CheckHurtCarrier

```ml
function Team_CheckHurtCarrier(level, targ, attacker)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `targ` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L47)

<a id="function-function-mq3-game-g-team-team-droppedflagthink-function-team-droppedflagthink-level-ent-src-mq3-game-g-team-ml-1666719705"></a>
### Team_DroppedFlagThink

```ml
function Team_DroppedFlagThink(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L55)

<a id="function-function-mq3-game-g-team-team-forcegesture-function-team-forcegesture-level-team-src-mq3-game-g-team-ml-1389381551"></a>
### Team_ForceGesture

```ml
function Team_ForceGesture(level, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L45)

<a id="function-function-mq3-game-g-team-team-fragbonuses-function-team-fragbonuses-level-targ-inflictor-attacker-src-mq3-game-g-team-ml-268638677"></a>
### Team_FragBonuses

```ml
function Team_FragBonuses(level, targ, inflictor, attacker)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `targ` | `dynamic` | — |  |
| `inflictor` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L46)

<a id="function-function-mq3-game-g-team-team-freeentity-function-team-freeentity-level-ent-src-mq3-game-g-team-ml-348426927"></a>
### Team_FreeEntity

```ml
function Team_FreeEntity(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L54)

<a id="function-function-mq3-game-g-team-team-getlocation-function-team-getlocation-level-ent-src-mq3-game-g-team-ml-1437119981"></a>
### Team_GetLocation

```ml
function Team_GetLocation(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L86)

<a id="function-function-mq3-game-g-team-team-getlocationmsg-function-team-getlocationmsg-level-ent-capacity-src-mq3-game-g-team-ml-947619917"></a>
### Team_GetLocationMsg

```ml
function Team_GetLocationMsg(level, ent, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L87)

<a id="function-function-mq3-game-g-team-team-initgame-function-team-initgame-level-src-mq3-game-g-team-ml-971176018"></a>
### Team_InitGame

```ml
function Team_InitGame(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L16)

<a id="function-function-mq3-game-g-team-team-resetflag-function-team-resetflag-level-team-src-mq3-game-g-team-ml-1530454955"></a>
### Team_ResetFlag

```ml
function Team_ResetFlag(level, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L48)

<a id="function-function-mq3-game-g-team-team-resetflags-function-team-resetflags-level-src-mq3-game-g-team-ml-72733550"></a>
### Team_ResetFlags

```ml
function Team_ResetFlags(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L49)

<a id="function-function-mq3-game-g-team-team-returnflag-function-team-returnflag-level-team-src-mq3-game-g-team-ml-1564729727"></a>
### Team_ReturnFlag

```ml
function Team_ReturnFlag(level, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L53)

<a id="function-function-mq3-game-g-team-team-returnflagsound-function-team-returnflagsound-level-ent-team-src-mq3-game-g-team-ml-871744560"></a>
### Team_ReturnFlagSound

```ml
function Team_ReturnFlagSound(level, ent, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L50)

<a id="function-function-mq3-game-g-team-team-setflagstatus-function-team-setflagstatus-level-team-value-src-mq3-game-g-team-ml-1429383286"></a>
### Team_SetFlagStatus

```ml
function Team_SetFlagStatus(level, team, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L43)

<a id="function-function-mq3-game-g-team-team-takeflagsound-function-team-takeflagsound-level-ent-team-src-mq3-game-g-team-ml-966102020"></a>
### Team_TakeFlagSound

```ml
function Team_TakeFlagSound(level, ent, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L51)

<a id="function-function-mq3-game-g-team-team-touchenemyflag-function-team-touchenemyflag-level-ent-other-team-src-mq3-game-g-team-ml-1986344724"></a>
### Team_TouchEnemyFlag

```ml
function Team_TouchEnemyFlag(level, ent, other, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L57)

<a id="function-function-mq3-game-g-team-team-touchourflag-function-team-touchourflag-level-ent-other-team-src-mq3-game-g-team-ml-1263707572"></a>
### Team_TouchOurFlag

```ml
function Team_TouchOurFlag(level, ent, other, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L56)

<a id="function-function-mq3-game-g-team-teamcolorstring-function-teamcolorstring-team-src-mq3-game-g-team-ml-147960817"></a>
### TeamColorString

```ml
function TeamColorString(team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L26)

<a id="function-function-mq3-game-g-team-teamname-function-teamname-team-src-mq3-game-g-team-ml-1508817027"></a>
### TeamName

```ml
function TeamName(team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L24)

<a id="function-function-mq3-game-g-team-teamplayinfomessage-function-teamplayinfomessage-level-ent-src-mq3-game-g-team-ml-213251429"></a>
### TeamplayInfoMessage

```ml
function TeamplayInfoMessage(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_team.ml#L91)
