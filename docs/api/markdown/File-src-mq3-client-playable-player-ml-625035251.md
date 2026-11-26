# `src/mq3/client/playable_player.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_player`](Package-mq3-client-playable-player-1014474045.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/textnumbers.ml` as `textnumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/format/bsp.ml` as `bsp` → [src/mq3/format/bsp.ml](File-src-mq3-format-bsp-ml-526613882.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-playable-player-applydamage-function-applydamage-state-amount-now-bypassarmor-src-mq3-client-playable-player-ml-381989380"></a>
### applyDamage

```ml
function applyDamage(state, amount, now, bypassArmor)
```

Updates `state.armor`, `state.health`, `state.alive`, `state.deaths` and additional values during playable player `applyDamage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable player record/storage; this routine assigns `state.armor`, `state.health`, `state.alive`, `state.deaths` and additional values. |
| `amount` | `dynamic` | — | Value tested by `state==void or amount<0 or now<0`, `if amount==0` before the calculation continues. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `bypassArmor` | `dynamic` | — | Value used by `if not bypassArmor then saved=armorSave(state.armor,amount) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L194)

<a id="function-function-mq3-client-playable-player-applynormaldamage-function-applynormaldamage-state-amount-now-src-mq3-client-playable-player-ml-1329402439"></a>
### applyNormalDamage

```ml
function applyNormalDamage(state, amount, now)
```

Adapts `mq3.client.playable_player.applyDamage` to playable player `applyNormalDamage`, returning its result for `state, amount, now, false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.playable_player.applyDamage`. |
| `amount` | `dynamic` | — | Argument 2 of `mq3.client.playable_player.applyDamage`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. Forwarded to `mq3.client.playable_player.applyDamage`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L211)

<a id="function-function-mq3-client-playable-player-armorsave-function-armorsave-armor-damage-src-mq3-client-playable-player-ml-1713939486"></a>
### armorSave

```ml
function armorSave(armor, damage)
```

Mirrors baseq3 CheckArmor: ceil(damage * 0.66), capped by available armor.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `armor` | `dynamic` | — | Value used by `if armor<=0 or damage<=0 then return 0 end if`. |
| `damage` | `dynamic` | — | Value used by `if armor<=0 or damage<=0 then return 0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L183)

<a id="constant-constant-mq3-client-playable-player-camera-eye-height-const-camera-eye-height-48-src-mq3-client-playable-player-ml-237229485"></a>
### CAMERA_EYE_HEIGHT

```ml
const CAMERA_EYE_HEIGHT = 48
```

Vertical camera offset above the player origin in the native preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L27)

<a id="extern_function-extern-function-mq3-client-playable-player-ceil-extern-function-ceil-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-client-playable-player-ml-1392062964"></a>
### ceil

```ml
extern function ceil(value as double) from "ucrtbase.dll" returns double
```

Rounds a floating-point value upward to the nearest integral value using the Windows C runtime. This binding is used by playable player.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Floating-point argument passed to the native mathematical function. |


**Returns:** The smallest integral-valued double greater than or equal to the argument.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L12)

<a id="function-function-mq3-client-playable-player-collectspawns-function-collectspawns-entities-classname-src-mq3-client-playable-player-ml-594763458"></a>
### collectSpawns

```ml
function collectSpawns(entities, classname)
```

Calls `std.string.toLowerAscii`, `mq3.client.playable_player.field`, `mq3.compat.textnumbers.vector` and additional helpers from playable player `collectSpawns`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value used by `for each entity in entities`. |
| `classname` | `dynamic` | — | Value used by `wanted=strings.toLowerAscii(classname)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L124)

<a id="function-function-mq3-client-playable-player-configure-function-configure-state-respawnmilliseconds-invulnerabilitymilliseconds-src-mq3-client-playable-player-ml-1644158026"></a>
### configure

```ml
function configure(state, respawnMilliseconds, invulnerabilityMilliseconds)
```

Updates `state.respawnMilliseconds`, `state.invulnerabilityMilliseconds` during playable player `configure`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable player record/storage; this routine assigns `state.respawnMilliseconds`, `state.invulnerabilityMilliseconds`. |
| `respawnMilliseconds` | `dynamic` | — | Value assigned to `state.respawnMilliseconds`. |
| `invulnerabilityMilliseconds` | `dynamic` | — | Value assigned to `state.invulnerabilityMilliseconds`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L161)

- [mq3.client.playable_player.Damage](Type-mq3-client-playable-player-damage-1907288644.md) — struct
<a id="constant-constant-mq3-client-playable-player-default-ammo-const-default-ammo-50-src-mq3-client-playable-player-ml-2047110222"></a>
### DEFAULT_AMMO

```ml
const DEFAULT_AMMO = 50
```

Fallback ammo setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L19)

<a id="constant-constant-mq3-client-playable-player-default-armor-const-default-armor-0-src-mq3-client-playable-player-ml-502826735"></a>
### DEFAULT_ARMOR

```ml
const DEFAULT_ARMOR = 0
```

Fallback armor setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L17)

<a id="constant-constant-mq3-client-playable-player-default-health-const-default-health-100-src-mq3-client-playable-player-ml-365813562"></a>
### DEFAULT_HEALTH

```ml
const DEFAULT_HEALTH = 100
```

Fallback health setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L15)

<a id="constant-constant-mq3-client-playable-player-default-invulnerability-milliseconds-const-default-invulnerability-milliseconds-1000-src-mq3-client-playable-player-ml-759937026"></a>
### DEFAULT_INVULNERABILITY_MILLISECONDS

```ml
const DEFAULT_INVULNERABILITY_MILLISECONDS = 1000
```

Default invulnerability duration in milliseconds when the caller supplies no override.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L25)

<a id="constant-constant-mq3-client-playable-player-default-respawn-milliseconds-const-default-respawn-milliseconds-1700-src-mq3-client-playable-player-ml-1662729085"></a>
### DEFAULT_RESPAWN_MILLISECONDS

```ml
const DEFAULT_RESPAWN_MILLISECONDS = 1700
```

Default respawn duration in milliseconds when the caller supplies no override.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L23)

<a id="constant-constant-mq3-client-playable-player-default-weapon-const-default-weapon-weapon-machinegun-src-mq3-client-playable-player-ml-142662893"></a>
### DEFAULT_WEAPON

```ml
const DEFAULT_WEAPON = "weapon_machinegun"
```

Fallback weapon setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L21)

<a id="function-function-mq3-client-playable-player-fail-function-fail-message-src-mq3-client-playable-player-ml-1274415877"></a>
### fail

```ml
function fail(message)
```

Creates the playable player error `7540` with diagnostic text `"preview player: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"preview player: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L108)

<a id="function-function-mq3-client-playable-player-field-function-field-fields-key-src-mq3-client-playable-player-ml-341270780"></a>
### field

```ml
function field(fields, key)
```

Calls `std.string.toLowerAscii` from playable player `field`. The final path returns `""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fields` | `dynamic` | — | Value used by `for each pair in fields`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding playable player entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L113)

<a id="function-function-mq3-client-playable-player-fromentities-function-fromentities-entities-src-mq3-client-playable-player-ml-1385562923"></a>
### fromEntities

```ml
function fromEntities(entities)
```

Calls `mq3.client.playable_player.collectSpawns`, `mq3.client.playable_player.Spawn`, `mq3.client.playable_player.State` from playable player `fromEntities`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value used by `if entities==void then return fail("entities are required") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L141)

<a id="function-function-mq3-client-playable-player-load-function-load-map-src-mq3-client-playable-player-ml-1552807674"></a>
### load

```ml
function load(map)
```

Calls `mq3.format.bsp.entities`, `mq3.client.playable_player.fromEntities` from playable player `load`. The final path returns `fromEntities(entities)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | map record passed to the playable player helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L152)

<a id="function-function-mq3-client-playable-player-pollrespawn-function-pollrespawn-state-now-src-mq3-client-playable-player-ml-621441937"></a>
### pollRespawn

```ml
function pollRespawn(state, now)
```

Updates `state.spawnIndex`, `state.position`, `state.yaw`, `state.health` and additional values during playable player `pollRespawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable player record/storage; this routine assigns `state.spawnIndex`, `state.position`, `state.yaw`, `state.health` and additional values. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L216)

- [mq3.client.playable_player.Respawn](Type-mq3-client-playable-player-respawn-1369727395.md) — struct
<a id="function-function-mq3-client-playable-player-setstats-function-setstats-state-health-armor-ammo-weapon-src-mq3-client-playable-player-ml-456380390"></a>
### setStats

```ml
function setStats(state, health, armor, ammo, weapon)
```

Updates `state.health`, `state.maxHealth`, `state.armor`, `state.ammo` and additional values during playable player `setStats`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable player record/storage; this routine assigns `state.health`, `state.maxHealth`, `state.armor`, `state.ammo` and additional values. |
| `health` | `dynamic` | — | Value assigned to `state.health`, `state.maxHealth`, `state.alive`. |
| `armor` | `dynamic` | — | Value assigned to `state.armor`. |
| `ammo` | `dynamic` | — | Value assigned to `state.ammo`. |
| `weapon` | `dynamic` | — | Value assigned to `state.weapon`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player.ml#L173)

- [mq3.client.playable_player.Spawn](Type-mq3-client-playable-player-spawn-644253284.md) — struct
- [mq3.client.playable_player.State](Type-mq3-client-playable-player-state-1404687306.md) — struct
