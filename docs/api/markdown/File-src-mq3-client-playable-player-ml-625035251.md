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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `amount` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `bypassArmor` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L83)

<a id="function-function-mq3-client-playable-player-applynormaldamage-function-applynormaldamage-state-amount-now-src-mq3-client-playable-player-ml-1329402439"></a>
### applyNormalDamage

```ml
function applyNormalDamage(state, amount, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `amount` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L96)

<a id="function-function-mq3-client-playable-player-armorsave-function-armorsave-armor-damage-src-mq3-client-playable-player-ml-1713939486"></a>
### armorSave

```ml
function armorSave(armor, damage)
```

Mirrors baseq3 CheckArmor: ceil(damage * 0.66), capped by available armor.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `armor` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L77)

<a id="constant-constant-mq3-client-playable-player-camera-eye-height-const-camera-eye-height-48-src-mq3-client-playable-player-ml-1783118777"></a>
### CAMERA_EYE_HEIGHT

```ml
const CAMERA_EYE_HEIGHT = 48.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L17)

<a id="extern_function-extern-function-mq3-client-playable-player-ceil-extern-function-ceil-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-client-playable-player-ml-1392062964"></a>
### ceil

```ml
extern function ceil(value as double) from "ucrtbase.dll" returns double
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L9)

<a id="function-function-mq3-client-playable-player-collectspawns-function-collectspawns-entities-classname-src-mq3-client-playable-player-ml-594763458"></a>
### collectSpawns

```ml
function collectSpawns(entities, classname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L34)

<a id="function-function-mq3-client-playable-player-configure-function-configure-state-respawnmilliseconds-invulnerabilitymilliseconds-src-mq3-client-playable-player-ml-1644158026"></a>
### configure

```ml
function configure(state, respawnMilliseconds, invulnerabilityMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `respawnMilliseconds` | `dynamic` | — |  |
| `invulnerabilityMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L63)

- [mq3.client.playable_player.Damage](Type-mq3-client-playable-player-damage-1907288644.md) — struct
<a id="constant-constant-mq3-client-playable-player-default-ammo-const-default-ammo-50-src-mq3-client-playable-player-ml-2047110222"></a>
### DEFAULT_AMMO

```ml
const DEFAULT_AMMO = 50
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L13)

<a id="constant-constant-mq3-client-playable-player-default-armor-const-default-armor-0-src-mq3-client-playable-player-ml-502826735"></a>
### DEFAULT_ARMOR

```ml
const DEFAULT_ARMOR = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L12)

<a id="constant-constant-mq3-client-playable-player-default-health-const-default-health-100-src-mq3-client-playable-player-ml-365813562"></a>
### DEFAULT_HEALTH

```ml
const DEFAULT_HEALTH = 100
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L11)

<a id="constant-constant-mq3-client-playable-player-default-invulnerability-milliseconds-const-default-invulnerability-milliseconds-1000-src-mq3-client-playable-player-ml-759937026"></a>
### DEFAULT_INVULNERABILITY_MILLISECONDS

```ml
const DEFAULT_INVULNERABILITY_MILLISECONDS = 1000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L16)

<a id="constant-constant-mq3-client-playable-player-default-respawn-milliseconds-const-default-respawn-milliseconds-1700-src-mq3-client-playable-player-ml-1662729085"></a>
### DEFAULT_RESPAWN_MILLISECONDS

```ml
const DEFAULT_RESPAWN_MILLISECONDS = 1700
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L15)

<a id="constant-constant-mq3-client-playable-player-default-weapon-const-default-weapon-weapon-machinegun-src-mq3-client-playable-player-ml-142662893"></a>
### DEFAULT_WEAPON

```ml
const DEFAULT_WEAPON = "weapon_machinegun"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L14)

<a id="function-function-mq3-client-playable-player-fail-function-fail-message-src-mq3-client-playable-player-ml-1274415877"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L24)

<a id="function-function-mq3-client-playable-player-field-function-field-fields-key-src-mq3-client-playable-player-ml-341270780"></a>
### field

```ml
function field(fields, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fields` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L26)

<a id="function-function-mq3-client-playable-player-fromentities-function-fromentities-entities-src-mq3-client-playable-player-ml-1385562923"></a>
### fromEntities

```ml
function fromEntities(entities)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L49)

<a id="function-function-mq3-client-playable-player-load-function-load-map-src-mq3-client-playable-player-ml-1552807674"></a>
### load

```ml
function load(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L58)

<a id="function-function-mq3-client-playable-player-pollrespawn-function-pollrespawn-state-now-src-mq3-client-playable-player-ml-621441937"></a>
### pollRespawn

```ml
function pollRespawn(state, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L98)

- [mq3.client.playable_player.Respawn](Type-mq3-client-playable-player-respawn-1369727395.md) — struct
<a id="function-function-mq3-client-playable-player-setstats-function-setstats-state-health-armor-ammo-weapon-src-mq3-client-playable-player-ml-456380390"></a>
### setStats

```ml
function setStats(state, health, armor, ammo, weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `health` | `dynamic` | — |  |
| `armor` | `dynamic` | — |  |
| `ammo` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_player.ml#L69)

- [mq3.client.playable_player.Spawn](Type-mq3-client-playable-player-spawn-644253284.md) — struct
- [mq3.client.playable_player.State](Type-mq3-client-playable-player-state-1404687306.md) — struct
