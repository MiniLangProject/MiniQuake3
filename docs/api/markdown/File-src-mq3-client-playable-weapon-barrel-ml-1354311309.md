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

Updates `value.time`, `value.angle`, `value.spinning` during playable weapon barrel `advance`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable playable weapon barrel record/storage; this routine assigns `value.time`, `value.angle`, `value.spinning`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `firing` | `dynamic` | — | Value assigned to `value.spinning`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L51)

<a id="function-function-mq3-client-playable-weapon-barrel-anglemod-function-anglemod-angle-src-mq3-client-playable-weapon-barrel-ml-1398982327"></a>
### angleMod

```ml
function angleMod(angle)
```

Q3's AngleMod macro stores the accumulated angle through a 16-bit turn.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angle` | `dynamic` | — | Value used by `return (numeric.trunc32(angle*65536.0/360.0)&65535)*(360.0/65536.0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L45)

<a id="function-function-mq3-client-playable-weapon-barrel-classnames-function-classnames-src-mq3-client-playable-weapon-barrel-ml-2083835402"></a>
### classnames

```ml
function classnames()
```

Calls `mq3.client.playable_weapon_barrel.definitions` from playable weapon barrel `classnames`. The final path returns `result`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L39)

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

Calls `mq3.client.playable_weapon_barrel.definitions`, `stringEqualsIgnoreCaseAscii` from playable weapon barrel `definition`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — | Value used by `for each value in definitions() if stringEqualsIgnoreCaseAscii(value.weaponClass,classname) then return value end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L33)

- [mq3.client.playable_weapon_barrel.Definition](Type-mq3-client-playable-weapon-barrel-definition-2024353908.md) — struct
<a id="function-function-mq3-client-playable-weapon-barrel-definitions-function-definitions-src-mq3-client-playable-weapon-barrel-ml-130255046"></a>
### definitions

```ml
function definitions()
```

Builds the playable weapon barrel `definitions` sequence from `[ Definition("weapon_gauntlet","barrel_gauntlet","models/weapons2/gauntlet/gauntlet_barrel.md3"), Definition("weapon_machinegun","barrel_machinegun","models/weapons2/machinegun/machinegun_barrel.md...`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L23)

<a id="function-function-mq3-client-playable-weapon-barrel-fail-function-fail-message-src-mq3-client-playable-weapon-barrel-ml-1156644171"></a>
### fail

```ml
function fail(message)
```

Creates the playable weapon barrel error `7630` with diagnostic text `"playable weapon barrel: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"playable weapon barrel: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L20)

<a id="function-function-mq3-client-playable-weapon-barrel-render-function-render-catalog-weaponclass-guntransform-angle-maxtriangles-src-mq3-client-playable-weapon-barrel-ml-1884777413"></a>
### render

```ml
function render(catalog, weaponClass, gunTransform, angle, maxTriangles)
```

Calls `mq3.client.playable_weapon_barrel.definition`, `mq3.client.playable_item_models.find`, `mq3.client.playable_muzzle_flash.tag` and additional helpers from playable weapon barrel `render`. The final path returns `itemModels.renderAsset(barrel,placed,maxTriangles)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `weaponClass` | `dynamic` | — | Value used by `def=definition(weaponClass)`. |
| `gunTransform` | `dynamic` | — | Value used by `placed=rotatedTransform(gunTransform,tag,angle)`. |
| `angle` | `dynamic` | — | Value used by `placed=rotatedTransform(gunTransform,tag,angle)`. |
| `maxTriangles` | `dynamic` | — | Upper bound on emitted render triangles. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L85)

<a id="function-function-mq3-client-playable-weapon-barrel-rotatedtransform-function-rotatedtransform-parent-tag-roll-src-mq3-client-playable-weapon-barrel-ml-333977355"></a>
### rotatedTransform

```ml
function rotatedTransform(parent, tag, roll)
```

Calls `mq3.client.playable_muzzle_flash.attachTransform`, `mq3.shared.math.AngleVectors`, `mq3.shared.math.VectorScale` and additional helpers from playable weapon barrel `rotatedTransform`. The final path returns `itemModels.transform(attached.origin,attachmentMath.multiplyAxis(temp,parent.axis),parent.scale)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | Record read through `parent.axis`, `parent.scale`. |
| `tag` | `dynamic` | — | Record read through `tag.axis`. |
| `roll` | `dynamic` | — | Value used by `localAxis=qmath.AngleVectors([0.0,0.0,roll])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L71)

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

Creates a `mq3.client.playable_weapon_barrel.State` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_barrel.ml#L41)

- [mq3.client.playable_weapon_barrel.State](Type-mq3-client-playable-weapon-barrel-state-1471042690.md) — struct
