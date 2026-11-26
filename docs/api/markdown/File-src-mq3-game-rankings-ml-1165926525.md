# `src/mq3/game/rankings.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.rankings`](Package-mq3-game-rankings-1367885789.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/game_internal_headers.ml` as `internal` → [src/mq3/game/game_internal_headers.ml](File-src-mq3-game-game-internal-headers-ml-370319487.md)

## Declarations

<a id="function-function-mq3-game-rankings-action-function-action-state-kind-client-text-value-src-mq3-game-rankings-ml-1133284610"></a>
### action

```ml
function action(state, kind, client, text, value)
```

Set `state.actions` to `state.actions+[Action(kind,client,text,value)]` in `mq3.game.rankings.action`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `actions`. May update `state.actions` in place. |
| `kind` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Action.kind`. |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Action.client`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `value` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Action.value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L174)

- [mq3.game.rankings.Action](Type-mq3-game-rankings-action-447411339.md) — struct
<a id="function-function-mq3-game-rankings-ammoordinal-function-ammoordinal-weapon-src-mq3-game-rankings-ml-2120407572"></a>
### ammoOrdinal

```ml
function ammoOrdinal(weapon)
```

Map ammunition-bearing weapon identifiers to the ranking service's ammunition ordinal values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L255)

<a id="function-function-mq3-game-rankings-client-function-client-src-mq3-game-rankings-ml-1278078994"></a>
### client

```ml
function client()
```

Create a `mq3.game.rankings.Client` record, initializing `present` as `true`, `inuse` as `true` and `team` as `TEAM_SPECTATOR`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L146)

- [mq3.game.rankings.Client](Type-mq3-game-rankings-client-1131561538.md) — struct
<a id="function-function-mq3-game-rankings-create-function-create-maxclients-src-mq3-game-rankings-ml-1494739024"></a>
### create

```ml
function create(maxclients)
```

Build the `mq3.game.rankings.State` result for `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxclients` | `dynamic` | — | Initial value stored in `mq3.game.rankings.State.maxclients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L149)

<a id="function-function-mq3-game-rankings-cvarvalue-function-cvarvalue-state-name-src-mq3-game-rankings-ml-701522140"></a>
### cvarValue

```ml
function cvarValue(state, name)
```

Look up a ranking cvar by exact name, returning an empty string when it is absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `cvars`. |
| `name` | `dynamic` | — | Lookup text matched against `pair[0]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L318)

<a id="function-function-mq3-game-rankings-damagespecific-function-damagespecific-base-weapon-src-mq3-game-rankings-ml-393363047"></a>
### damageSpecific

```ml
function damageSpecific(base, weapon)
```

Apply `mq3.game.rankings.ordinal` while evaluating `damageSpecific`. Return paths include `base+value*100`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `base` | `dynamic` | — | Operand used to evaluate the returned expression `base+value*100`. |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L189)

<a id="constant-constant-mq3-game-rankings-ef-award-excellent-const-ef-award-excellent-8-src-mq3-game-rankings-ml-1164174615"></a>
### EF_AWARD_EXCELLENT

```ml
const EF_AWARD_EXCELLENT = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L55)

<a id="constant-constant-mq3-game-rankings-ef-award-impressive-const-ef-award-impressive-32768-src-mq3-game-rankings-ml-827984257"></a>
### EF_AWARD_IMPRESSIVE

```ml
const EF_AWARD_IMPRESSIVE = 32768
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L56)

<a id="constant-constant-mq3-game-rankings-entitynum-world-const-entitynum-world-1022-src-mq3-game-rankings-ml-1367783808"></a>
### ENTITYNUM_WORLD

```ml
const ENTITYNUM_WORLD = 1022
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L22)

<a id="function-function-mq3-game-rankings-g-rankcapture-function-g-rankcapture-state-self-src-mq3-game-rankings-ml-125845127"></a>
### G_RankCapture

```ml
function G_RankCapture(state, self)
```

G_RankCapture

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `warmupTime`. |
| `self` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L299)

<a id="function-function-mq3-game-rankings-g-rankclientdisconnect-function-g-rankclientdisconnect-state-self-src-mq3-game-rankings-ml-1121146903"></a>
### G_RankClientDisconnect

```ml
function G_RankClientDisconnect(state, self)
```

G_RankClientDisconnect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `warmupTime`, `time` and `clients`. |
| `self` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L308)

<a id="function-function-mq3-game-rankings-g-rankdamage-function-g-rankdamage-state-self-attacker-damage-mod-src-mq3-game-rankings-ml-1769369905"></a>
### G_RankDamage

```ml
function G_RankDamage(state, self, attacker, damage, mod)
```

G_RankDamage

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `warmupTime`, `framenum`, `lastFrame`, `lastSelf` and `lastAttacker` and related fields. May update `state.lastFrame`, `state.lastSelf` and `state.lastAttacker` and additional fields in place. |
| `self` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index1`. |
| `attacker` | `dynamic` | — | Entity credited with the attack. |
| `damage` | `dynamic` | — | Damage amount before the current operation applies its rules. |
| `mod` | `dynamic` | — | Means-of-death code used for damage attribution. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L224)

<a id="function-function-mq3-game-rankings-g-rankfireweapon-function-g-rankfireweapon-state-self-weapon-src-mq3-game-rankings-ml-1274395783"></a>
### G_RankFireWeapon

```ml
function G_RankFireWeapon(state, self, weapon)
```

G_RankFireWeapon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `warmupTime`. |
| `self` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index1`. |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L216)

<a id="function-function-mq3-game-rankings-g-rankgameover-function-g-rankgameover-state-src-mq3-game-rankings-ml-2102443957"></a>
### G_RankGameOver

```ml
function G_RankGameOver(state)
```

G_RankGameOver

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `warmupTime`, `maxclients`, `gametype`, `fraglimit` and `timelimit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L311)

<a id="function-function-mq3-game-rankings-g-rankpickupammo-function-g-rankpickupammo-state-self-weapon-quantity-src-mq3-game-rankings-ml-1503905478"></a>
### G_RankPickupAmmo

```ml
function G_RankPickupAmmo(state, self, weapon, quantity)
```

G_RankPickupAmmo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `warmupTime`. |
| `self` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index1`. |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |
| `quantity` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L261)

<a id="function-function-mq3-game-rankings-g-rankpickuparmor-function-g-rankpickuparmor-state-self-quantity-src-mq3-game-rankings-ml-387427940"></a>
### G_RankPickupArmor

```ml
function G_RankPickupArmor(state, self, quantity)
```

G_RankPickupArmor

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `warmupTime`. |
| `self` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index1`. |
| `quantity` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L271)

<a id="function-function-mq3-game-rankings-g-rankpickuphealth-function-g-rankpickuphealth-state-self-quantity-src-mq3-game-rankings-ml-1214381054"></a>
### G_RankPickupHealth

```ml
function G_RankPickupHealth(state, self, quantity)
```

G_RankPickupHealth

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `warmupTime`. |
| `self` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index1`. |
| `quantity` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L266)

<a id="function-function-mq3-game-rankings-g-rankpickupholdable-function-g-rankpickupholdable-state-self-holdable-src-mq3-game-rankings-ml-2111205246"></a>
### G_RankPickupHoldable

```ml
function G_RankPickupHoldable(state, self, holdable)
```

G_RankPickupHoldable

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `warmupTime`. |
| `self` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index1`. |
| `holdable` | `dynamic` | — | Value used by `holdableKey` in `if holdable==HI_MEDKIT then if use then return QGR_KEY_MEDKIT_USE end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L285)

<a id="function-function-mq3-game-rankings-g-rankpickuppowerup-function-g-rankpickuppowerup-state-self-powerup-src-mq3-game-rankings-ml-1198232075"></a>
### G_RankPickupPowerup

```ml
function G_RankPickupPowerup(state, self, powerup)
```

G_RankPickupPowerup

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `warmupTime`. |
| `self` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index1`. |
| `powerup` | `dynamic` | — | Value used by `G_RankPickupPowerup` in `if powerup==PW_REDFLAG or powerup==PW_BLUEFLAG then reportInt(state,self,-1,QGR_KEY_FLAG_PICKUP,1,true)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L276)

<a id="function-function-mq3-game-rankings-g-rankpickupweapon-function-g-rankpickupweapon-state-self-weapon-src-mq3-game-rankings-ml-222798095"></a>
### G_RankPickupWeapon

```ml
function G_RankPickupWeapon(state, self, weapon)
```

G_RankPickupWeapon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `warmupTime`. |
| `self` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index1`. |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L252)

<a id="function-function-mq3-game-rankings-g-rankplayerdie-function-g-rankplayerdie-state-self-attacker-mod-src-mq3-game-rankings-ml-643505048"></a>
### G_RankPlayerDie

```ml
function G_RankPlayerDie(state, self, attacker, mod)
```

G_RankPlayerDie

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `warmupTime`. |
| `self` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index1`. |
| `attacker` | `dynamic` | — | Entity credited with the attack. |
| `mod` | `dynamic` | — | Means-of-death code used for damage attribution. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L240)

<a id="function-function-mq3-game-rankings-g-rankreward-function-g-rankreward-state-self-award-src-mq3-game-rankings-ml-744140406"></a>
### G_RankReward

```ml
function G_RankReward(state, self, award)
```

G_RankReward

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `warmupTime`. |
| `self` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index1`. |
| `award` | `dynamic` | — | Value used by `G_RankReward` in `if state.warmupTime==0 then if award==EF_AWARD_IMPRESSIVE then reportInt(state,self,-1,1111090000,1,true) else i...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L295)

<a id="function-function-mq3-game-rankings-g-rankrunframe-function-g-rankrunframe-state-src-mq3-game-rankings-ml-1224638061"></a>
### G_RankRunFrame

```ml
function G_RankRunFrame(state)
```

G_RankRunFrame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `initialized`, `rankBeginFn`, `rankPollFn`, `active` and `maxclients` and related fields. May update `state.initialized`, `state.timelimit` and `state.cvars` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L207)

<a id="function-function-mq3-game-rankings-g-rankuseholdable-function-g-rankuseholdable-state-self-holdable-src-mq3-game-rankings-ml-79371254"></a>
### G_RankUseHoldable

```ml
function G_RankUseHoldable(state, self, holdable)
```

G_RankUseHoldable

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `warmupTime`. |
| `self` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index1`. |
| `holdable` | `dynamic` | — | Value used by `holdableKey` in `if holdable==HI_MEDKIT then if use then return QGR_KEY_MEDKIT_USE end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L290)

<a id="function-function-mq3-game-rankings-g-rankuserteamname-function-g-rankuserteamname-state-self-teamname-src-mq3-game-rankings-ml-1049545117"></a>
### G_RankUserTeamName

```ml
function G_RankUserTeamName(state, self, teamName)
```

G_RankUserTeamName

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `warmupTime`. |
| `self` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index1`. |
| `teamName` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L304)

<a id="function-function-mq3-game-rankings-g-rankweapontime-function-g-rankweapontime-state-self-weapon-src-mq3-game-rankings-ml-763914995"></a>
### G_RankWeaponTime

```ml
function G_RankWeaponTime(state, self, weapon)
```

G_RankWeaponTime

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `warmupTime`, `time` and `clients`. May update `state.clients[self].weaponChangeTime` in place. |
| `self` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index1`. |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L247)

<a id="constant-constant-mq3-game-rankings-gt-team-const-gt-team-3-src-mq3-game-rankings-ml-1050414298"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L23)

<a id="function-function-mq3-game-rankings-hazardkey-function-hazardkey-mod-src-mq3-game-rankings-ml-2099279354"></a>
### hazardKey

```ml
function hazardKey(mod)
```

Map environmental death causes to the corresponding ranking hazard key.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mod` | `dynamic` | — | Means-of-death code used for damage attribution. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L234)

<a id="function-function-mq3-game-rankings-hazardmod-function-hazardmod-mod-src-mq3-game-rankings-ml-1270735188"></a>
### hazardMod

```ml
function hazardMod(mod)
```

Test `mod==MOD_WATER or mod==MOD_SLIME or mod==MOD_LAVA or mod==MOD_CRUSH or mod==MOD_TELEFRAG or mod==MOD_FALLING or mod==MOD_SUICIDE or mod==MOD_TRIGGE...` as the condition for `hazardMod`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mod` | `dynamic` | — | Means-of-death code used for damage attribution. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L198)

<a id="constant-constant-mq3-game-rankings-hi-invulnerability-const-hi-invulnerability-5-src-mq3-game-rankings-ml-1647746232"></a>
### HI_INVULNERABILITY

```ml
const HI_INVULNERABILITY = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L54)

<a id="constant-constant-mq3-game-rankings-hi-kamikaze-const-hi-kamikaze-3-src-mq3-game-rankings-ml-1486171338"></a>
### HI_KAMIKAZE

```ml
const HI_KAMIKAZE = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L52)

<a id="constant-constant-mq3-game-rankings-hi-medkit-const-hi-medkit-2-src-mq3-game-rankings-ml-848368767"></a>
### HI_MEDKIT

```ml
const HI_MEDKIT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L51)

<a id="constant-constant-mq3-game-rankings-hi-portal-const-hi-portal-4-src-mq3-game-rankings-ml-756751629"></a>
### HI_PORTAL

```ml
const HI_PORTAL = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L53)

<a id="constant-constant-mq3-game-rankings-hi-teleporter-const-hi-teleporter-1-src-mq3-game-rankings-ml-188635316"></a>
### HI_TELEPORTER

```ml
const HI_TELEPORTER = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L50)

<a id="function-function-mq3-game-rankings-holdablekey-function-holdablekey-holdable-use-src-mq3-game-rankings-ml-1842765072"></a>
### holdableKey

```ml
function holdableKey(holdable, use)
```

Choose the ranking key for pickup or use of the selected holdable item.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `holdable` | `dynamic` | — | Value used by `holdableKey` in `if holdable==HI_MEDKIT then if use then return QGR_KEY_MEDKIT_USE end if`. |
| `use` | `dynamic` | — | Value used by `holdableKey` in `if holdable==HI_MEDKIT then if use then return QGR_KEY_MEDKIT_USE end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L280)

<a id="constant-constant-mq3-game-rankings-mod-bfg-const-mod-bfg-12-src-mq3-game-rankings-ml-614287534"></a>
### MOD_BFG

```ml
const MOD_BFG = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L70)

<a id="constant-constant-mq3-game-rankings-mod-bfg-splash-const-mod-bfg-splash-13-src-mq3-game-rankings-ml-2021868397"></a>
### MOD_BFG_SPLASH

```ml
const MOD_BFG_SPLASH = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L71)

<a id="constant-constant-mq3-game-rankings-mod-crush-const-mod-crush-17-src-mq3-game-rankings-ml-418597403"></a>
### MOD_CRUSH

```ml
const MOD_CRUSH = 17
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L75)

<a id="constant-constant-mq3-game-rankings-mod-falling-const-mod-falling-19-src-mq3-game-rankings-ml-1206720653"></a>
### MOD_FALLING

```ml
const MOD_FALLING = 19
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L77)

<a id="constant-constant-mq3-game-rankings-mod-gauntlet-const-mod-gauntlet-2-src-mq3-game-rankings-ml-1935008703"></a>
### MOD_GAUNTLET

```ml
const MOD_GAUNTLET = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L60)

<a id="constant-constant-mq3-game-rankings-mod-grapple-const-mod-grapple-28-src-mq3-game-rankings-ml-747351089"></a>
### MOD_GRAPPLE

```ml
const MOD_GRAPPLE = 28
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L80)

<a id="constant-constant-mq3-game-rankings-mod-grenade-const-mod-grenade-4-src-mq3-game-rankings-ml-624683901"></a>
### MOD_GRENADE

```ml
const MOD_GRENADE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L62)

<a id="constant-constant-mq3-game-rankings-mod-grenade-splash-const-mod-grenade-splash-5-src-mq3-game-rankings-ml-80471268"></a>
### MOD_GRENADE_SPLASH

```ml
const MOD_GRENADE_SPLASH = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L63)

<a id="constant-constant-mq3-game-rankings-mod-lava-const-mod-lava-16-src-mq3-game-rankings-ml-1660954786"></a>
### MOD_LAVA

```ml
const MOD_LAVA = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L74)

<a id="constant-constant-mq3-game-rankings-mod-lightning-const-mod-lightning-11-src-mq3-game-rankings-ml-972638245"></a>
### MOD_LIGHTNING

```ml
const MOD_LIGHTNING = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L69)

<a id="constant-constant-mq3-game-rankings-mod-machinegun-const-mod-machinegun-3-src-mq3-game-rankings-ml-418086076"></a>
### MOD_MACHINEGUN

```ml
const MOD_MACHINEGUN = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L61)

<a id="constant-constant-mq3-game-rankings-mod-plasma-const-mod-plasma-8-src-mq3-game-rankings-ml-1155091289"></a>
### MOD_PLASMA

```ml
const MOD_PLASMA = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L66)

<a id="constant-constant-mq3-game-rankings-mod-plasma-splash-const-mod-plasma-splash-9-src-mq3-game-rankings-ml-31854028"></a>
### MOD_PLASMA_SPLASH

```ml
const MOD_PLASMA_SPLASH = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L67)

<a id="constant-constant-mq3-game-rankings-mod-railgun-const-mod-railgun-10-src-mq3-game-rankings-ml-762275016"></a>
### MOD_RAILGUN

```ml
const MOD_RAILGUN = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L68)

<a id="constant-constant-mq3-game-rankings-mod-rocket-const-mod-rocket-6-src-mq3-game-rankings-ml-673250327"></a>
### MOD_ROCKET

```ml
const MOD_ROCKET = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L64)

<a id="constant-constant-mq3-game-rankings-mod-rocket-splash-const-mod-rocket-splash-7-src-mq3-game-rankings-ml-1020494974"></a>
### MOD_ROCKET_SPLASH

```ml
const MOD_ROCKET_SPLASH = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L65)

<a id="constant-constant-mq3-game-rankings-mod-shotgun-const-mod-shotgun-1-src-mq3-game-rankings-ml-1171250972"></a>
### MOD_SHOTGUN

```ml
const MOD_SHOTGUN = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L59)

<a id="constant-constant-mq3-game-rankings-mod-slime-const-mod-slime-15-src-mq3-game-rankings-ml-1242251981"></a>
### MOD_SLIME

```ml
const MOD_SLIME = 15
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L73)

<a id="constant-constant-mq3-game-rankings-mod-suicide-const-mod-suicide-20-src-mq3-game-rankings-ml-308212577"></a>
### MOD_SUICIDE

```ml
const MOD_SUICIDE = 20
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L78)

<a id="constant-constant-mq3-game-rankings-mod-telefrag-const-mod-telefrag-18-src-mq3-game-rankings-ml-1905377208"></a>
### MOD_TELEFRAG

```ml
const MOD_TELEFRAG = 18
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L76)

<a id="constant-constant-mq3-game-rankings-mod-trigger-hurt-const-mod-trigger-hurt-22-src-mq3-game-rankings-ml-165749643"></a>
### MOD_TRIGGER_HURT

```ml
const MOD_TRIGGER_HURT = 22
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L79)

<a id="constant-constant-mq3-game-rankings-mod-unknown-const-mod-unknown-0-src-mq3-game-rankings-ml-1999171817"></a>
### MOD_UNKNOWN

```ml
const MOD_UNKNOWN = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L58)

<a id="constant-constant-mq3-game-rankings-mod-water-const-mod-water-14-src-mq3-game-rankings-ml-495841608"></a>
### MOD_WATER

```ml
const MOD_WATER = 14
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L72)

<a id="function-function-mq3-game-rankings-ordinal-function-ordinal-weapon-src-mq3-game-rankings-ml-994955192"></a>
### ordinal

```ml
function ordinal(weapon)
```

Map weapon identifiers to the ranking service's weapon ordinal values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L181)

<a id="constant-constant-mq3-game-rankings-pw-ammoregen-const-pw-ammoregen-13-src-mq3-game-rankings-ml-1823992703"></a>
### PW_AMMOREGEN

```ml
const PW_AMMOREGEN = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L49)

<a id="constant-constant-mq3-game-rankings-pw-battlesuit-const-pw-battlesuit-2-src-mq3-game-rankings-ml-730281215"></a>
### PW_BATTLESUIT

```ml
const PW_BATTLESUIT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L39)

<a id="constant-constant-mq3-game-rankings-pw-blueflag-const-pw-blueflag-8-src-mq3-game-rankings-ml-1660976985"></a>
### PW_BLUEFLAG

```ml
const PW_BLUEFLAG = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L45)

<a id="constant-constant-mq3-game-rankings-pw-doubler-const-pw-doubler-12-src-mq3-game-rankings-ml-136485782"></a>
### PW_DOUBLER

```ml
const PW_DOUBLER = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L48)

<a id="constant-constant-mq3-game-rankings-pw-flight-const-pw-flight-6-src-mq3-game-rankings-ml-1371166959"></a>
### PW_FLIGHT

```ml
const PW_FLIGHT = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L43)

<a id="constant-constant-mq3-game-rankings-pw-guard-const-pw-guard-11-src-mq3-game-rankings-ml-267604901"></a>
### PW_GUARD

```ml
const PW_GUARD = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L47)

<a id="constant-constant-mq3-game-rankings-pw-haste-const-pw-haste-3-src-mq3-game-rankings-ml-1140917770"></a>
### PW_HASTE

```ml
const PW_HASTE = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L40)

<a id="constant-constant-mq3-game-rankings-pw-invis-const-pw-invis-4-src-mq3-game-rankings-ml-5791109"></a>
### PW_INVIS

```ml
const PW_INVIS = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L41)

<a id="constant-constant-mq3-game-rankings-pw-quad-const-pw-quad-1-src-mq3-game-rankings-ml-2014252988"></a>
### PW_QUAD

```ml
const PW_QUAD = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L38)

<a id="constant-constant-mq3-game-rankings-pw-redflag-const-pw-redflag-7-src-mq3-game-rankings-ml-1400532630"></a>
### PW_REDFLAG

```ml
const PW_REDFLAG = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L44)

<a id="constant-constant-mq3-game-rankings-pw-regen-const-pw-regen-5-src-mq3-game-rankings-ml-1264443968"></a>
### PW_REGEN

```ml
const PW_REGEN = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L42)

<a id="constant-constant-mq3-game-rankings-pw-scout-const-pw-scout-10-src-mq3-game-rankings-ml-589928774"></a>
### PW_SCOUT

```ml
const PW_SCOUT = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L46)

<a id="constant-constant-mq3-game-rankings-qgr-key-armor-const-qgr-key-armor-internal-qgr-key-armor-src-mq3-game-rankings-ml-647884136"></a>
### QGR_KEY_ARMOR

```ml
const QGR_KEY_ARMOR = internal.QGR_KEY_ARMOR
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L111)

<a id="constant-constant-mq3-game-rankings-qgr-key-armor-total-const-qgr-key-armor-total-internal-qgr-key-armor-total-src-mq3-game-rankings-ml-2001195247"></a>
### QGR_KEY_ARMOR_TOTAL

```ml
const QGR_KEY_ARMOR_TOTAL = internal.QGR_KEY_ARMOR_TOTAL
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L112)

<a id="constant-constant-mq3-game-rankings-qgr-key-boxes-const-qgr-key-boxes-internal-qgr-key-boxes-src-mq3-game-rankings-ml-609535954"></a>
### QGR_KEY_BOXES

```ml
const QGR_KEY_BOXES = internal.QGR_KEY_BOXES
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L107)

<a id="constant-constant-mq3-game-rankings-qgr-key-damage-given-const-qgr-key-damage-given-internal-qgr-key-damage-given-src-mq3-game-rankings-ml-1472256448"></a>
### QGR_KEY_DAMAGE_GIVEN

```ml
const QGR_KEY_DAMAGE_GIVEN = internal.QGR_KEY_DAMAGE_GIVEN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L101)

<a id="constant-constant-mq3-game-rankings-qgr-key-damage-taken-const-qgr-key-damage-taken-internal-qgr-key-damage-taken-src-mq3-game-rankings-ml-1338029170"></a>
### QGR_KEY_DAMAGE_TAKEN

```ml
const QGR_KEY_DAMAGE_TAKEN = internal.QGR_KEY_DAMAGE_TAKEN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L102)

<a id="constant-constant-mq3-game-rankings-qgr-key-dedicated-const-qgr-key-dedicated-internal-qgr-key-dedicated-src-mq3-game-rankings-ml-969626670"></a>
### QGR_KEY_DEDICATED

```ml
const QGR_KEY_DEDICATED = internal.QGR_KEY_DEDICATED
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L94)

<a id="constant-constant-mq3-game-rankings-qgr-key-flag-capture-const-qgr-key-flag-capture-internal-qgr-key-flag-capture-src-mq3-game-rankings-ml-503537512"></a>
### QGR_KEY_FLAG_CAPTURE

```ml
const QGR_KEY_FLAG_CAPTURE = internal.QGR_KEY_FLAG_CAPTURE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L134)

<a id="constant-constant-mq3-game-rankings-qgr-key-flag-pickup-const-qgr-key-flag-pickup-internal-qgr-key-flag-pickup-src-mq3-game-rankings-ml-1265341248"></a>
### QGR_KEY_FLAG_PICKUP

```ml
const QGR_KEY_FLAG_PICKUP = internal.QGR_KEY_FLAG_PICKUP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L133)

<a id="constant-constant-mq3-game-rankings-qgr-key-frag-const-qgr-key-frag-internal-qgr-key-frag-src-mq3-game-rankings-ml-1475654895"></a>
### QGR_KEY_FRAG

```ml
const QGR_KEY_FRAG = internal.QGR_KEY_FRAG
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L96)

<a id="constant-constant-mq3-game-rankings-qgr-key-fraglimit-const-qgr-key-fraglimit-internal-qgr-key-fraglimit-src-mq3-game-rankings-ml-755698080"></a>
### QGR_KEY_FRAGLIMIT

```ml
const QGR_KEY_FRAGLIMIT = internal.QGR_KEY_FRAGLIMIT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L88)

<a id="constant-constant-mq3-game-rankings-qgr-key-gametype-const-qgr-key-gametype-internal-qgr-key-gametype-src-mq3-game-rankings-ml-2062282433"></a>
### QGR_KEY_GAMETYPE

```ml
const QGR_KEY_GAMETYPE = internal.QGR_KEY_GAMETYPE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L87)

<a id="constant-constant-mq3-game-rankings-qgr-key-hazard-death-const-qgr-key-hazard-death-internal-qgr-key-hazard-death-src-mq3-game-rankings-ml-1106867550"></a>
### QGR_KEY_HAZARD_DEATH

```ml
const QGR_KEY_HAZARD_DEATH = internal.QGR_KEY_HAZARD_DEATH
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L124)

<a id="constant-constant-mq3-game-rankings-qgr-key-health-const-qgr-key-health-internal-qgr-key-health-src-mq3-game-rankings-ml-145033553"></a>
### QGR_KEY_HEALTH

```ml
const QGR_KEY_HEALTH = internal.QGR_KEY_HEALTH
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L109)

<a id="constant-constant-mq3-game-rankings-qgr-key-health-total-const-qgr-key-health-total-internal-qgr-key-health-total-src-mq3-game-rankings-ml-1308562780"></a>
### QGR_KEY_HEALTH_TOTAL

```ml
const QGR_KEY_HEALTH_TOTAL = internal.QGR_KEY_HEALTH_TOTAL
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L110)

<a id="constant-constant-mq3-game-rankings-qgr-key-hit-given-const-qgr-key-hit-given-internal-qgr-key-hit-given-src-mq3-game-rankings-ml-1620340640"></a>
### QGR_KEY_HIT_GIVEN

```ml
const QGR_KEY_HIT_GIVEN = internal.QGR_KEY_HIT_GIVEN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L99)

<a id="constant-constant-mq3-game-rankings-qgr-key-hit-taken-const-qgr-key-hit-taken-internal-qgr-key-hit-taken-src-mq3-game-rankings-ml-1259359726"></a>
### QGR_KEY_HIT_TAKEN

```ml
const QGR_KEY_HIT_TAKEN = internal.QGR_KEY_HIT_TAKEN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L100)

<a id="constant-constant-mq3-game-rankings-qgr-key-hostname-const-qgr-key-hostname-internal-qgr-key-hostname-src-mq3-game-rankings-ml-217062490"></a>
### QGR_KEY_HOSTNAME

```ml
const QGR_KEY_HOSTNAME = internal.QGR_KEY_HOSTNAME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L84)

<a id="constant-constant-mq3-game-rankings-qgr-key-invulnerability-const-qgr-key-invulnerability-internal-qgr-key-invulnerability-src-mq3-game-rankings-ml-501476728"></a>
### QGR_KEY_INVULNERABILITY

```ml
const QGR_KEY_INVULNERABILITY = internal.QGR_KEY_INVULNERABILITY
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L122)

<a id="constant-constant-mq3-game-rankings-qgr-key-invulnerability-use-const-qgr-key-invulnerability-use-internal-qgr-key-invulnerability-use-src-mq3-game-rankings-ml-1883506460"></a>
### QGR_KEY_INVULNERABILITY_USE

```ml
const QGR_KEY_INVULNERABILITY_USE = internal.QGR_KEY_INVULNERABILITY_USE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L123)

<a id="constant-constant-mq3-game-rankings-qgr-key-kamikaze-const-qgr-key-kamikaze-internal-qgr-key-kamikaze-src-mq3-game-rankings-ml-1816028"></a>
### QGR_KEY_KAMIKAZE

```ml
const QGR_KEY_KAMIKAZE = internal.QGR_KEY_KAMIKAZE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L118)

<a id="constant-constant-mq3-game-rankings-qgr-key-kamikaze-use-const-qgr-key-kamikaze-use-internal-qgr-key-kamikaze-use-src-mq3-game-rankings-ml-1610080704"></a>
### QGR_KEY_KAMIKAZE_USE

```ml
const QGR_KEY_KAMIKAZE_USE = internal.QGR_KEY_KAMIKAZE_USE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L119)

<a id="constant-constant-mq3-game-rankings-qgr-key-map-const-qgr-key-map-internal-qgr-key-map-src-mq3-game-rankings-ml-482013199"></a>
### QGR_KEY_MAP

```ml
const QGR_KEY_MAP = internal.QGR_KEY_MAP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L85)

<a id="constant-constant-mq3-game-rankings-qgr-key-match-rating-const-qgr-key-match-rating-internal-qgr-key-match-rating-src-mq3-game-rankings-ml-664526316"></a>
### QGR_KEY_MATCH_RATING

```ml
const QGR_KEY_MATCH_RATING = internal.QGR_KEY_MATCH_RATING
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L82)

<a id="constant-constant-mq3-game-rankings-qgr-key-maxclients-const-qgr-key-maxclients-internal-qgr-key-maxclients-src-mq3-game-rankings-ml-508209701"></a>
### QGR_KEY_MAXCLIENTS

```ml
const QGR_KEY_MAXCLIENTS = internal.QGR_KEY_MAXCLIENTS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L90)

<a id="constant-constant-mq3-game-rankings-qgr-key-maxping-const-qgr-key-maxping-internal-qgr-key-maxping-src-mq3-game-rankings-ml-1150779579"></a>
### QGR_KEY_MAXPING

```ml
const QGR_KEY_MAXPING = internal.QGR_KEY_MAXPING
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L93)

<a id="constant-constant-mq3-game-rankings-qgr-key-maxrate-const-qgr-key-maxrate-internal-qgr-key-maxrate-src-mq3-game-rankings-ml-597318877"></a>
### QGR_KEY_MAXRATE

```ml
const QGR_KEY_MAXRATE = internal.QGR_KEY_MAXRATE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L91)

<a id="constant-constant-mq3-game-rankings-qgr-key-medkit-const-qgr-key-medkit-internal-qgr-key-medkit-src-mq3-game-rankings-ml-718066429"></a>
### QGR_KEY_MEDKIT

```ml
const QGR_KEY_MEDKIT = internal.QGR_KEY_MEDKIT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L114)

<a id="constant-constant-mq3-game-rankings-qgr-key-medkit-use-const-qgr-key-medkit-use-internal-qgr-key-medkit-use-src-mq3-game-rankings-ml-1908085313"></a>
### QGR_KEY_MEDKIT_USE

```ml
const QGR_KEY_MEDKIT_USE = internal.QGR_KEY_MEDKIT_USE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L115)

<a id="constant-constant-mq3-game-rankings-qgr-key-minping-const-qgr-key-minping-internal-qgr-key-minping-src-mq3-game-rankings-ml-1246362957"></a>
### QGR_KEY_MINPING

```ml
const QGR_KEY_MINPING = internal.QGR_KEY_MINPING
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L92)

<a id="constant-constant-mq3-game-rankings-qgr-key-mod-const-qgr-key-mod-internal-qgr-key-mod-src-mq3-game-rankings-ml-1894699149"></a>
### QGR_KEY_MOD

```ml
const QGR_KEY_MOD = internal.QGR_KEY_MOD
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L86)

<a id="constant-constant-mq3-game-rankings-qgr-key-pickup-weapon-const-qgr-key-pickup-weapon-internal-qgr-key-pickup-weapon-src-mq3-game-rankings-ml-1287582234"></a>
### QGR_KEY_PICKUP_WEAPON

```ml
const QGR_KEY_PICKUP_WEAPON = internal.QGR_KEY_PICKUP_WEAPON
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L105)

<a id="constant-constant-mq3-game-rankings-qgr-key-played-with-const-qgr-key-played-with-internal-qgr-key-played-with-src-mq3-game-rankings-ml-1064498021"></a>
### QGR_KEY_PLAYED_WITH

```ml
const QGR_KEY_PLAYED_WITH = internal.QGR_KEY_PLAYED_WITH
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L83)

<a id="constant-constant-mq3-game-rankings-qgr-key-portal-const-qgr-key-portal-internal-qgr-key-portal-src-mq3-game-rankings-ml-2020525389"></a>
### QGR_KEY_PORTAL

```ml
const QGR_KEY_PORTAL = internal.QGR_KEY_PORTAL
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L120)

<a id="constant-constant-mq3-game-rankings-qgr-key-portal-use-const-qgr-key-portal-use-internal-qgr-key-portal-use-src-mq3-game-rankings-ml-1031101889"></a>
### QGR_KEY_PORTAL_USE

```ml
const QGR_KEY_PORTAL_USE = internal.QGR_KEY_PORTAL_USE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L121)

<a id="constant-constant-mq3-game-rankings-qgr-key-powerup-const-qgr-key-powerup-internal-qgr-key-powerup-src-mq3-game-rankings-ml-611225325"></a>
### QGR_KEY_POWERUP

```ml
const QGR_KEY_POWERUP = internal.QGR_KEY_POWERUP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L113)

<a id="constant-constant-mq3-game-rankings-qgr-key-rounds-const-qgr-key-rounds-internal-qgr-key-rounds-src-mq3-game-rankings-ml-2045223830"></a>
### QGR_KEY_ROUNDS

```ml
const QGR_KEY_ROUNDS = internal.QGR_KEY_ROUNDS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L108)

<a id="constant-constant-mq3-game-rankings-qgr-key-shot-fired-const-qgr-key-shot-fired-internal-qgr-key-shot-fired-src-mq3-game-rankings-ml-1667896144"></a>
### QGR_KEY_SHOT_FIRED

```ml
const QGR_KEY_SHOT_FIRED = internal.QGR_KEY_SHOT_FIRED
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L98)

<a id="constant-constant-mq3-game-rankings-qgr-key-splash-given-const-qgr-key-splash-given-internal-qgr-key-splash-given-src-mq3-game-rankings-ml-830689626"></a>
### QGR_KEY_SPLASH_GIVEN

```ml
const QGR_KEY_SPLASH_GIVEN = internal.QGR_KEY_SPLASH_GIVEN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L103)

<a id="constant-constant-mq3-game-rankings-qgr-key-splash-taken-const-qgr-key-splash-taken-internal-qgr-key-splash-taken-src-mq3-game-rankings-ml-1206117648"></a>
### QGR_KEY_SPLASH_TAKEN

```ml
const QGR_KEY_SPLASH_TAKEN = internal.QGR_KEY_SPLASH_TAKEN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L104)

<a id="constant-constant-mq3-game-rankings-qgr-key-suicide-const-qgr-key-suicide-internal-qgr-key-suicide-src-mq3-game-rankings-ml-1595891285"></a>
### QGR_KEY_SUICIDE

```ml
const QGR_KEY_SUICIDE = internal.QGR_KEY_SUICIDE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L97)

<a id="constant-constant-mq3-game-rankings-qgr-key-team-name-const-qgr-key-team-name-internal-qgr-key-team-name-src-mq3-game-rankings-ml-2130158614"></a>
### QGR_KEY_TEAM_NAME

```ml
const QGR_KEY_TEAM_NAME = internal.QGR_KEY_TEAM_NAME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L132)

<a id="constant-constant-mq3-game-rankings-qgr-key-teammate-damage-given-const-qgr-key-teammate-damage-given-internal-qgr-key-teammate-damage-given-src-mq3-game-rankings-ml-192784547"></a>
### QGR_KEY_TEAMMATE_DAMAGE_GIVEN

```ml
const QGR_KEY_TEAMMATE_DAMAGE_GIVEN = internal.QGR_KEY_TEAMMATE_DAMAGE_GIVEN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L128)

<a id="constant-constant-mq3-game-rankings-qgr-key-teammate-damage-taken-const-qgr-key-teammate-damage-taken-internal-qgr-key-teammate-damage-taken-src-mq3-game-rankings-ml-1608240721"></a>
### QGR_KEY_TEAMMATE_DAMAGE_TAKEN

```ml
const QGR_KEY_TEAMMATE_DAMAGE_TAKEN = internal.QGR_KEY_TEAMMATE_DAMAGE_TAKEN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L129)

<a id="constant-constant-mq3-game-rankings-qgr-key-teammate-frag-const-qgr-key-teammate-frag-internal-qgr-key-teammate-frag-src-mq3-game-rankings-ml-648061438"></a>
### QGR_KEY_TEAMMATE_FRAG

```ml
const QGR_KEY_TEAMMATE_FRAG = internal.QGR_KEY_TEAMMATE_FRAG
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L125)

<a id="constant-constant-mq3-game-rankings-qgr-key-teammate-hit-given-const-qgr-key-teammate-hit-given-internal-qgr-key-teammate-hit-given-src-mq3-game-rankings-ml-304538379"></a>
### QGR_KEY_TEAMMATE_HIT_GIVEN

```ml
const QGR_KEY_TEAMMATE_HIT_GIVEN = internal.QGR_KEY_TEAMMATE_HIT_GIVEN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L126)

<a id="constant-constant-mq3-game-rankings-qgr-key-teammate-hit-taken-const-qgr-key-teammate-hit-taken-internal-qgr-key-teammate-hit-taken-src-mq3-game-rankings-ml-484551653"></a>
### QGR_KEY_TEAMMATE_HIT_TAKEN

```ml
const QGR_KEY_TEAMMATE_HIT_TAKEN = internal.QGR_KEY_TEAMMATE_HIT_TAKEN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L127)

<a id="constant-constant-mq3-game-rankings-qgr-key-teammate-splash-given-const-qgr-key-teammate-splash-given-internal-qgr-key-teammate-splash-given-src-mq3-game-rankings-ml-703412657"></a>
### QGR_KEY_TEAMMATE_SPLASH_GIVEN

```ml
const QGR_KEY_TEAMMATE_SPLASH_GIVEN = internal.QGR_KEY_TEAMMATE_SPLASH_GIVEN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L130)

<a id="constant-constant-mq3-game-rankings-qgr-key-teammate-splash-taken-const-qgr-key-teammate-splash-taken-internal-qgr-key-teammate-splash-taken-src-mq3-game-rankings-ml-2030230027"></a>
### QGR_KEY_TEAMMATE_SPLASH_TAKEN

```ml
const QGR_KEY_TEAMMATE_SPLASH_TAKEN = internal.QGR_KEY_TEAMMATE_SPLASH_TAKEN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L131)

<a id="constant-constant-mq3-game-rankings-qgr-key-teleporter-const-qgr-key-teleporter-internal-qgr-key-teleporter-src-mq3-game-rankings-ml-1735524619"></a>
### QGR_KEY_TELEPORTER

```ml
const QGR_KEY_TELEPORTER = internal.QGR_KEY_TELEPORTER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L116)

<a id="constant-constant-mq3-game-rankings-qgr-key-teleporter-use-const-qgr-key-teleporter-use-internal-qgr-key-teleporter-use-src-mq3-game-rankings-ml-1081181591"></a>
### QGR_KEY_TELEPORTER_USE

```ml
const QGR_KEY_TELEPORTER_USE = internal.QGR_KEY_TELEPORTER_USE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L117)

<a id="constant-constant-mq3-game-rankings-qgr-key-time-const-qgr-key-time-internal-qgr-key-time-src-mq3-game-rankings-ml-1716474830"></a>
### QGR_KEY_TIME

```ml
const QGR_KEY_TIME = internal.QGR_KEY_TIME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L106)

<a id="constant-constant-mq3-game-rankings-qgr-key-timelimit-const-qgr-key-timelimit-internal-qgr-key-timelimit-src-mq3-game-rankings-ml-824713437"></a>
### QGR_KEY_TIMELIMIT

```ml
const QGR_KEY_TIMELIMIT = internal.QGR_KEY_TIMELIMIT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L89)

<a id="constant-constant-mq3-game-rankings-qgr-key-version-const-qgr-key-version-internal-qgr-key-version-src-mq3-game-rankings-ml-1972064641"></a>
### QGR_KEY_VERSION

```ml
const QGR_KEY_VERSION = internal.QGR_KEY_VERSION
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L95)

<a id="constant-constant-mq3-game-rankings-qgr-status-active-const-qgr-status-active-2-src-mq3-game-rankings-ml-1791136051"></a>
### QGR_STATUS_ACTIVE

```ml
const QGR_STATUS_ACTIVE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L11)

<a id="constant-constant-mq3-game-rankings-qgr-status-bad-password-const-qgr-status-bad-password-7-src-mq3-game-rankings-ml-433750154"></a>
### QGR_STATUS_BAD_PASSWORD

```ml
const QGR_STATUS_BAD_PASSWORD = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L14)

<a id="constant-constant-mq3-game-rankings-qgr-status-error-const-qgr-status-error-12-src-mq3-game-rankings-ml-1160140684"></a>
### QGR_STATUS_ERROR

```ml
const QGR_STATUS_ERROR = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L18)

<a id="constant-constant-mq3-game-rankings-qgr-status-invaliduser-const-qgr-status-invaliduser-11-src-mq3-game-rankings-ml-1521726275"></a>
### QGR_STATUS_INVALIDUSER

```ml
const QGR_STATUS_INVALIDUSER = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L17)

<a id="constant-constant-mq3-game-rankings-qgr-status-new-const-qgr-status-new-0-src-mq3-game-rankings-ml-70655719"></a>
### QGR_STATUS_NEW

```ml
const QGR_STATUS_NEW = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L9)

<a id="constant-constant-mq3-game-rankings-qgr-status-no-membership-const-qgr-status-no-membership-9-src-mq3-game-rankings-ml-1462095954"></a>
### QGR_STATUS_NO_MEMBERSHIP

```ml
const QGR_STATUS_NO_MEMBERSHIP = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L15)

<a id="constant-constant-mq3-game-rankings-qgr-status-no-user-const-qgr-status-no-user-6-src-mq3-game-rankings-ml-1386339579"></a>
### QGR_STATUS_NO_USER

```ml
const QGR_STATUS_NO_USER = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L13)

<a id="constant-constant-mq3-game-rankings-qgr-status-pending-const-qgr-status-pending-4-src-mq3-game-rankings-ml-942145989"></a>
### QGR_STATUS_PENDING

```ml
const QGR_STATUS_PENDING = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L12)

<a id="constant-constant-mq3-game-rankings-qgr-status-spectator-const-qgr-status-spectator-1-src-mq3-game-rankings-ml-2026159196"></a>
### QGR_STATUS_SPECTATOR

```ml
const QGR_STATUS_SPECTATOR = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L10)

<a id="constant-constant-mq3-game-rankings-qgr-status-timeout-const-qgr-status-timeout-10-src-mq3-game-rankings-ml-1001067568"></a>
### QGR_STATUS_TIMEOUT

```ml
const QGR_STATUS_TIMEOUT = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L16)

- [mq3.game.rankings.Report](Type-mq3-game-rankings-report-2143402279.md) — struct
<a id="function-function-mq3-game-rankings-reportint-function-reportint-state-index1-index2-key-value-accum-src-mq3-game-rankings-ml-1049819423"></a>
### reportInt

```ml
function reportInt(state, index1, index2, key, value, accum)
```

Set `state.reports` to `state.reports+[Report(false,index1,index2,key,value,"",accum)]` in `mq3.game.rankings.reportInt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `reports` and `reportIntFn`. May update `state.reports` in place. |
| `index1` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index1`. |
| `index2` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index2`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `value` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.value`. |
| `accum` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.accum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L160)

<a id="function-function-mq3-game-rankings-reportstr-function-reportstr-state-index1-index2-key-value-src-mq3-game-rankings-ml-2126423070"></a>
### reportStr

```ml
function reportStr(state, index1, index2, key, value)
```

Set `state.reports` to `state.reports+[Report(true,index1,index2,key,0,value,false)]` in `mq3.game.rankings.reportStr`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `reports` and `reportStrFn`. May update `state.reports` in place. |
| `index1` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index1`. |
| `index2` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.index2`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `value` | `dynamic` | — | Initial value stored in `mq3.game.rankings.Report.text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L167)

<a id="function-function-mq3-game-rankings-sameteam-function-sameteam-state-a-b-src-mq3-game-rankings-ml-686813550"></a>
### sameTeam

```ml
function sameTeam(state, a, b)
```

Test `a>=0 and b>=0 and a<state.maxclients and b<state.maxclients and state.clients[a].team==state.clients[b].team` as the condition for `sameTeam`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `maxclients` and `clients`. |
| `a` | `dynamic` | — | Operand used to evaluate the returned expression `a>=0 and b>=0 and a<state.maxclients and b<state.maxclients and state.clients[a].team==state.clients[b].team`. |
| `b` | `dynamic` | — | Operand used to evaluate the returned expression `a>=0 and b>=0 and a<state.maxclients and b<state.maxclients and state.clients[a].team==state.clients[b].team`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L203)

<a id="function-function-mq3-game-rankings-specific-function-specific-base-weapon-src-mq3-game-rankings-ml-477731331"></a>
### specific

```ml
function specific(base, weapon)
```

Return `base+ordinal(weapon)*100` for `specific`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `base` | `dynamic` | — | Operand used to evaluate the returned expression `base+ordinal(weapon)*100`. |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L185)

<a id="constant-constant-mq3-game-rankings-spectator-free-const-spectator-free-1-src-mq3-game-rankings-ml-342905530"></a>
### SPECTATOR_FREE

```ml
const SPECTATOR_FREE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L20)

<a id="function-function-mq3-game-rankings-splashmod-function-splashmod-mod-src-mq3-game-rankings-ml-1051146726"></a>
### splashMod

```ml
function splashMod(mod)
```

Test `mod==MOD_GRENADE_SPLASH or mod==MOD_ROCKET_SPLASH or mod==MOD_PLASMA_SPLASH or mod==MOD_BFG_SPLASH` as the condition for `splashMod`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mod` | `dynamic` | — | Means-of-death code used for damage attribution. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L195)

- [mq3.game.rankings.State](Type-mq3-game-rankings-state-1265489706.md) — struct
<a id="function-function-mq3-game-rankings-status-function-status-state-index-src-mq3-game-rankings-ml-645810565"></a>
### status

```ml
function status(state, index)
```

Use `state.statusFn` to perform `status`. Return paths include `state.clients[index].status`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Rankings state; accesses `statusFn` and `clients`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L178)

<a id="constant-constant-mq3-game-rankings-svf-bot-const-svf-bot-8-src-mq3-game-rankings-ml-2065643281"></a>
### SVF_BOT

```ml
const SVF_BOT = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L21)

<a id="constant-constant-mq3-game-rankings-team-spectator-const-team-spectator-3-src-mq3-game-rankings-ml-595515050"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L19)

<a id="function-function-mq3-game-rankings-weaponformod-function-weaponformod-mod-src-mq3-game-rankings-ml-313546352"></a>
### weaponForMod

```ml
function weaponForMod(mod)
```

Map a means-of-death code to the weapon responsible for the ranking event.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mod` | `dynamic` | — | Means-of-death code used for damage attribution. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L192)

<a id="constant-constant-mq3-game-rankings-wp-bfg-const-wp-bfg-9-src-mq3-game-rankings-ml-2056522508"></a>
### WP_BFG

```ml
const WP_BFG = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L33)

<a id="constant-constant-mq3-game-rankings-wp-chaingun-const-wp-chaingun-13-src-mq3-game-rankings-ml-292676443"></a>
### WP_CHAINGUN

```ml
const WP_CHAINGUN = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L37)

<a id="constant-constant-mq3-game-rankings-wp-gauntlet-const-wp-gauntlet-1-src-mq3-game-rankings-ml-1873160152"></a>
### WP_GAUNTLET

```ml
const WP_GAUNTLET = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L25)

<a id="constant-constant-mq3-game-rankings-wp-grappling-hook-const-wp-grappling-hook-10-src-mq3-game-rankings-ml-2100415044"></a>
### WP_GRAPPLING_HOOK

```ml
const WP_GRAPPLING_HOOK = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L34)

<a id="constant-constant-mq3-game-rankings-wp-grenade-launcher-const-wp-grenade-launcher-4-src-mq3-game-rankings-ml-1975996337"></a>
### WP_GRENADE_LAUNCHER

```ml
const WP_GRENADE_LAUNCHER = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L28)

<a id="constant-constant-mq3-game-rankings-wp-lightning-const-wp-lightning-6-src-mq3-game-rankings-ml-355681793"></a>
### WP_LIGHTNING

```ml
const WP_LIGHTNING = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L30)

<a id="constant-constant-mq3-game-rankings-wp-machinegun-const-wp-machinegun-2-src-mq3-game-rankings-ml-1767286191"></a>
### WP_MACHINEGUN

```ml
const WP_MACHINEGUN = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L26)

<a id="constant-constant-mq3-game-rankings-wp-nailgun-const-wp-nailgun-11-src-mq3-game-rankings-ml-1395443799"></a>
### WP_NAILGUN

```ml
const WP_NAILGUN = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L35)

<a id="constant-constant-mq3-game-rankings-wp-plasmagun-const-wp-plasmagun-8-src-mq3-game-rankings-ml-654348071"></a>
### WP_PLASMAGUN

```ml
const WP_PLASMAGUN = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L32)

<a id="constant-constant-mq3-game-rankings-wp-prox-launcher-const-wp-prox-launcher-12-src-mq3-game-rankings-ml-1122580936"></a>
### WP_PROX_LAUNCHER

```ml
const WP_PROX_LAUNCHER = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L36)

<a id="constant-constant-mq3-game-rankings-wp-railgun-const-wp-railgun-7-src-mq3-game-rankings-ml-1790683264"></a>
### WP_RAILGUN

```ml
const WP_RAILGUN = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L31)

<a id="constant-constant-mq3-game-rankings-wp-rocket-launcher-const-wp-rocket-launcher-5-src-mq3-game-rankings-ml-297740508"></a>
### WP_ROCKET_LAUNCHER

```ml
const WP_ROCKET_LAUNCHER = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L29)

<a id="constant-constant-mq3-game-rankings-wp-shotgun-const-wp-shotgun-3-src-mq3-game-rankings-ml-897782560"></a>
### WP_SHOTGUN

```ml
const WP_SHOTGUN = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/rankings.ml#L27)
