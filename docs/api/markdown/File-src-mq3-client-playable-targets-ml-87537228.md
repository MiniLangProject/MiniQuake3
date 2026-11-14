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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L56)

<a id="function-function-mq3-client-playable-targets-applydefaultshot-function-applydefaultshot-state-shot-now-src-mq3-client-playable-targets-ml-467187407"></a>
### applyDefaultShot

```ml
function applyDefaultShot(state, shot, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shot` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L112)

<a id="function-function-mq3-client-playable-targets-applyshot-function-applyshot-state-shot-damage-now-src-mq3-client-playable-targets-ml-1090787728"></a>
### applyShot

```ml
function applyShot(state, shot, damage, now)
```

The Shot endpoint already contains the BSP world hit, so targets behind a wall cannot win this nearest-segment test.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shot` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L87)

<a id="constant-constant-mq3-client-playable-targets-default-damage-const-default-damage-34-src-mq3-client-playable-targets-ml-2042600152"></a>
### DEFAULT_DAMAGE

```ml
const DEFAULT_DAMAGE = 34
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L12)

<a id="constant-constant-mq3-client-playable-targets-default-health-const-default-health-100-src-mq3-client-playable-targets-ml-1849089210"></a>
### DEFAULT_HEALTH

```ml
const DEFAULT_HEALTH = 100
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L11)

<a id="constant-constant-mq3-client-playable-targets-default-max-z-const-default-max-z-32-src-mq3-client-playable-targets-ml-2046798846"></a>
### DEFAULT_MAX_Z

```ml
const DEFAULT_MAX_Z = 32.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L15)

<a id="constant-constant-mq3-client-playable-targets-default-min-z-const-default-min-z-24-src-mq3-client-playable-targets-ml-1568373042"></a>
### DEFAULT_MIN_Z

```ml
const DEFAULT_MIN_Z = -24.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L14)

<a id="constant-constant-mq3-client-playable-targets-default-patrol-radius-const-default-patrol-radius-24-src-mq3-client-playable-targets-ml-1843126601"></a>
### DEFAULT_PATROL_RADIUS

```ml
const DEFAULT_PATROL_RADIUS = 24.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L17)

<a id="constant-constant-mq3-client-playable-targets-default-radius-const-default-radius-15-src-mq3-client-playable-targets-ml-2141369355"></a>
### DEFAULT_RADIUS

```ml
const DEFAULT_RADIUS = 15.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L13)

<a id="constant-constant-mq3-client-playable-targets-default-respawn-milliseconds-const-default-respawn-milliseconds-3000-src-mq3-client-playable-targets-ml-1676292644"></a>
### DEFAULT_RESPAWN_MILLISECONDS

```ml
const DEFAULT_RESPAWN_MILLISECONDS = 3000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L16)

<a id="function-function-mq3-client-playable-targets-fail-function-fail-message-src-mq3-client-playable-targets-ml-1040443375"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L23)

<a id="function-function-mq3-client-playable-targets-field-function-field-fields-key-src-mq3-client-playable-targets-ml-969172396"></a>
### field

```ml
function field(fields, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fields` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L25)

<a id="function-function-mq3-client-playable-targets-fromentities-function-fromentities-entities-playerspawnindex-src-mq3-client-playable-targets-ml-1037707139"></a>
### fromEntities

```ml
function fromEntities(entities, playerSpawnIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `playerSpawnIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L33)

- [mq3.client.playable_targets.Hit](Type-mq3-client-playable-targets-hit-1354902781.md) — struct
<a id="function-function-mq3-client-playable-targets-load-function-load-map-playerspawnindex-src-mq3-client-playable-targets-ml-368232594"></a>
### load

```ml
function load(map, playerSpawnIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `playerSpawnIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L51)

<a id="function-function-mq3-client-playable-targets-segmentfraction-function-segmentfraction-startpoint-endpoint-target-radius-minz-maxz-src-mq3-client-playable-targets-ml-691799380"></a>
### segmentFraction

```ml
function segmentFraction(startPoint, endPoint, target, radius, minZ, maxZ)
```

Returns the normalized entry fraction for a segment/AABB hit, or -1 on miss.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `startPoint` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `minZ` | `dynamic` | — |  |
| `maxZ` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L63)

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
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L117)
