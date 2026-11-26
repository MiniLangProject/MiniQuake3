# `src/mq3/client/playable_weapon_barrel.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_weapon_barrel`](Package-mq3-client-playable-weapon-barrel-264735557.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_item_models.ml` as `itemModels` → [src/mq3/client/playable_item_models.ml](File-src-mq3-client-playable-item-models-ml-1740601852.md)
- `mq3/client/playable_muzzle_flash.ml` as `attachmentMath` → [src/mq3/client/playable_muzzle_flash.ml](File-src-mq3-client-playable-muzzle-flash-ml-1875198432.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-client-playable-weapon-barrel-advance-function-advance-value-now-firing-src-mq3-client-playable-weapon-barrel-ml-405200882"></a>
### advance

```ml
function advance(value, now, firing)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `firing` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L37)

<a id="function-function-mq3-client-playable-weapon-barrel-anglemod-function-anglemod-angle-src-mq3-client-playable-weapon-barrel-ml-1398982327"></a>
### angleMod

```ml
function angleMod(angle)
```

Q3's AngleMod macro stores the accumulated angle through a 16-bit turn.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L35)

<a id="function-function-mq3-client-playable-weapon-barrel-classnames-function-classnames-src-mq3-client-playable-weapon-barrel-ml-2083835402"></a>
### classnames

```ml
function classnames()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L31)

<a id="constant-constant-mq3-client-playable-weapon-barrel-coast-time-const-coast-time-1000-src-mq3-client-playable-weapon-barrel-ml-1317417478"></a>
### COAST_TIME

```ml
const COAST_TIME = 1000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L11)

<a id="function-function-mq3-client-playable-weapon-barrel-definition-function-definition-classname-src-mq3-client-playable-weapon-barrel-ml-68444075"></a>
### definition

```ml
function definition(classname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L26)

- [mq3.client.playable_weapon_barrel.Definition](Type-mq3-client-playable-weapon-barrel-definition-2024353908.md) — struct
<a id="function-function-mq3-client-playable-weapon-barrel-definitions-function-definitions-src-mq3-client-playable-weapon-barrel-ml-130255046"></a>
### definitions

```ml
function definitions()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L18)

<a id="function-function-mq3-client-playable-weapon-barrel-fail-function-fail-message-src-mq3-client-playable-weapon-barrel-ml-1156644171"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L16)

<a id="function-function-mq3-client-playable-weapon-barrel-render-function-render-catalog-weaponclass-guntransform-angle-maxtriangles-src-mq3-client-playable-weapon-barrel-ml-1884777413"></a>
### render

```ml
function render(catalog, weaponClass, gunTransform, angle, maxTriangles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `weaponClass` | `dynamic` | — |  |
| `gunTransform` | `dynamic` | — |  |
| `angle` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L61)

<a id="function-function-mq3-client-playable-weapon-barrel-rotatedtransform-function-rotatedtransform-parent-tag-roll-src-mq3-client-playable-weapon-barrel-ml-333977355"></a>
### rotatedTransform

```ml
function rotatedTransform(parent, tag, roll)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — |  |
| `tag` | `dynamic` | — |  |
| `roll` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L53)

<a id="constant-constant-mq3-client-playable-weapon-barrel-spin-speed-const-spin-speed-0-9-src-mq3-client-playable-weapon-barrel-ml-777026192"></a>
### SPIN_SPEED

```ml
const SPIN_SPEED = 0.9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L10)

<a id="function-function-mq3-client-playable-weapon-barrel-state-function-state-src-mq3-client-playable-weapon-barrel-ml-1490718776"></a>
### state

```ml
function state()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L32)

- [mq3.client.playable_weapon_barrel.State](Type-mq3-client-playable-weapon-barrel-state-1471042690.md) — struct
