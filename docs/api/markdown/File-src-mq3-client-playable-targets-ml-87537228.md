# `src/mq3/client/playable_targets.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_targets`](Package-mq3-client-playable-targets-1150888742.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/textnumbers.ml` as `textnumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/format/bsp.ml` as `bsp` → [src/mq3/format/bsp.ml](File-src-mq3-format-bsp-ml-526613882.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-playable-targets-activecount-function-activecount-state-src-mq3-client-playable-targets-ml-263152295"></a>
### activeCount

```ml
function activeCount(state)
```

Evaluates playable targets `activeCount` and returns `0`, `count` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.targets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L134)

<a id="function-function-mq3-client-playable-targets-applydefaultshot-function-applydefaultshot-state-shot-now-src-mq3-client-playable-targets-ml-467187407"></a>
### applyDefaultShot

```ml
function applyDefaultShot(state, shot, now)
```

Adapts `mq3.client.playable_targets.applyShot` to playable targets `applyDefaultShot`, returning its result for `state, shot, DEFAULT_DAMAGE, now`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.playable_targets.applyShot`. |
| `shot` | `dynamic` | — | Argument 2 of `mq3.client.playable_targets.applyShot`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. Forwarded to `mq3.client.playable_targets.applyShot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L204)

<a id="function-function-mq3-client-playable-targets-applyshot-function-applyshot-state-shot-damage-now-src-mq3-client-playable-targets-ml-1090787728"></a>
### applyShot

```ml
function applyShot(state, shot, damage, now)
```

The Shot endpoint already contains the BSP world hit, so targets behind a wall cannot win this nearest-segment test.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable targets record/storage; this routine assigns `state.score`. |
| `shot` | `dynamic` | — | Record read through `shot.start`, `shot.endPoint`. |
| `damage` | `dynamic` | — | Value used by `if damage<=0 or now<0 then return fail("positive damage and non-negative time are required") end if`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L175)

<a id="constant-constant-mq3-client-playable-targets-default-damage-const-default-damage-34-src-mq3-client-playable-targets-ml-2042600152"></a>
### DEFAULT_DAMAGE

```ml
const DEFAULT_DAMAGE = 34
```

Fallback damage setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L14)

<a id="constant-constant-mq3-client-playable-targets-default-health-const-default-health-100-src-mq3-client-playable-targets-ml-1849089210"></a>
### DEFAULT_HEALTH

```ml
const DEFAULT_HEALTH = 100
```

Fallback health setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L12)

<a id="constant-constant-mq3-client-playable-targets-default-max-z-const-default-max-z-32-src-mq3-client-playable-targets-ml-220775498"></a>
### DEFAULT_MAX_Z

```ml
const DEFAULT_MAX_Z = 32
```

Fallback max z setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L20)

<a id="constant-constant-mq3-client-playable-targets-default-min-z-const-default-min-z-24-src-mq3-client-playable-targets-ml-1022808558"></a>
### DEFAULT_MIN_Z

```ml
const DEFAULT_MIN_Z = -24
```

Fallback min z setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L18)

<a id="constant-constant-mq3-client-playable-targets-default-patrol-radius-const-default-patrol-radius-24-src-mq3-client-playable-targets-ml-1185464435"></a>
### DEFAULT_PATROL_RADIUS

```ml
const DEFAULT_PATROL_RADIUS = 24
```

Fallback patrol radius setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L25)

<a id="constant-constant-mq3-client-playable-targets-default-radius-const-default-radius-15-src-mq3-client-playable-targets-ml-1660248597"></a>
### DEFAULT_RADIUS

```ml
const DEFAULT_RADIUS = 15
```

Fallback radius setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L16)

<a id="constant-constant-mq3-client-playable-targets-default-respawn-milliseconds-const-default-respawn-milliseconds-3000-src-mq3-client-playable-targets-ml-1676292644"></a>
### DEFAULT_RESPAWN_MILLISECONDS

```ml
const DEFAULT_RESPAWN_MILLISECONDS = 3000
```

Default respawn duration in milliseconds when the caller supplies no override.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L22)

<a id="function-function-mq3-client-playable-targets-fail-function-fail-message-src-mq3-client-playable-targets-ml-1040443375"></a>
### fail

```ml
function fail(message)
```

Creates the playable targets error `7520` with diagnostic text `"preview targets: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"preview targets: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L90)

<a id="function-function-mq3-client-playable-targets-field-function-field-fields-key-src-mq3-client-playable-targets-ml-969172396"></a>
### field

```ml
function field(fields, key)
```

Calls `std.string.toLowerAscii` from playable targets `field`. The final path returns `""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fields` | `dynamic` | — | Value used by `for each pair in fields`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding playable targets entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L95)

<a id="function-function-mq3-client-playable-targets-fromentities-function-fromentities-entities-playerspawnindex-src-mq3-client-playable-targets-ml-1037707139"></a>
### fromEntities

```ml
function fromEntities(entities, playerSpawnIndex)
```

Calls `std.string.toLowerAscii`, `mq3.client.playable_targets.field`, `mq3.compat.textnumbers.vector` and additional helpers from playable targets `fromEntities`. The final path returns `State(targets,0,0,DEFAULT_RESPAWN_MILLISECONDS,DEFAULT_RADIUS,DEFAULT_MIN_Z,DEFAULT_MAX_Z)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value used by `if entities==void or playerSpawnIndex< -1 then return fail("entities and a valid player spawn index are required") end if`. |
| `playerSpawnIndex` | `dynamic` | — | Value used by `if entities==void or playerSpawnIndex< -1 then return fail("entities and a valid player spawn index are required") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L106)

- [mq3.client.playable_targets.Hit](Type-mq3-client-playable-targets-hit-1354902781.md) — struct
<a id="function-function-mq3-client-playable-targets-load-function-load-map-playerspawnindex-src-mq3-client-playable-targets-ml-368232594"></a>
### load

```ml
function load(map, playerSpawnIndex)
```

Calls `mq3.format.bsp.entities`, `mq3.client.playable_targets.fromEntities` from playable targets `load`. The final path returns `fromEntities(entities,playerSpawnIndex)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | map record passed to the playable targets helper calls. |
| `playerSpawnIndex` | `dynamic` | — | Value used by `return fromEntities(entities,playerSpawnIndex)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L127)

<a id="function-function-mq3-client-playable-targets-segmentfraction-function-segmentfraction-startpoint-endpoint-target-radius-minz-maxz-src-mq3-client-playable-targets-ml-691799380"></a>
### segmentFraction

```ml
function segmentFraction(startPoint, endPoint, target, radius, minZ, maxZ)
```

Returns the normalized entry fraction for a segment/AABB hit, or -1 on miss.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. |
| `target` | `dynamic` | — | Record read through `target.origin`. |
| `radius` | `dynamic` | — | Radius used by the spatial or visual calculation. |
| `minZ` | `dynamic` | — | Value used by `if axis==2 then low=target.origin[2]+minZ`. |
| `maxZ` | `dynamic` | — | Value used by `high=target.origin[2]+maxZ end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L147)

- [mq3.client.playable_targets.State](Type-mq3-client-playable-targets-state-348587645.md) — struct
- [mq3.client.playable_targets.Target](Type-mq3-client-playable-targets-target-163499649.md) — struct
<a id="function-function-mq3-client-playable-targets-update-function-update-state-now-src-mq3-client-playable-targets-ml-1855213799"></a>
### update

```ml
function update(state, now)
```

Absolute-time motion makes previews and contract captures reproducible.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable targets record/storage; this routine assigns `state.lastTime`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L211)
