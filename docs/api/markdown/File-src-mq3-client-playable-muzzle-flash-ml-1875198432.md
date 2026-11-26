# `src/mq3/client/playable_muzzle_flash.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_muzzle_flash`](Package-mq3-client-playable-muzzle-flash-609638244.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_item_models.ml` as `itemModels` → [src/mq3/client/playable_item_models.ml](File-src-mq3-client-playable-item-models-ml-1740601852.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/playable_dynamic_lights.ml` as `dynamicLights` → [src/mq3/renderer/playable_dynamic_lights.ml](File-src-mq3-renderer-playable-dynamic-lights-ml-229722941.md)

## Declarations

<a id="function-function-mq3-client-playable-muzzle-flash-attachtransform-function-attachtransform-parent-attachment-src-mq3-client-playable-muzzle-flash-ml-934688615"></a>
### attachTransform

```ml
function attachTransform(parent, attachment)
```

CG_PositionRotatedEntityOnTag, including the view weapon's uniform scale.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | Record read through `parent.origin`, `parent.scale`, `parent.axis`. |
| `attachment` | `dynamic` | — | Record read through `attachment.origin`, `attachment.axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_muzzle_flash.ml#L130)

<a id="function-function-mq3-client-playable-muzzle-flash-classnames-function-classnames-src-mq3-client-playable-muzzle-flash-ml-647291762"></a>
### classnames

```ml
function classnames()
```

Calls `mq3.client.playable_muzzle_flash.definitions` from playable muzzle flash `classnames`. The final path returns `result`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_muzzle_flash.ml#L68)

<a id="function-function-mq3-client-playable-muzzle-flash-definition-function-definition-classname-src-mq3-client-playable-muzzle-flash-ml-747150259"></a>
### definition

```ml
function definition(classname)
```

Calls `mq3.client.playable_muzzle_flash.definitions`, `stringEqualsIgnoreCaseAscii` from playable muzzle flash `definition`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — | Value used by `for each value in definitions() if stringEqualsIgnoreCaseAscii(value.weaponClass,classname) then return value end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_muzzle_flash.ml#L62)

- [mq3.client.playable_muzzle_flash.Definition](Type-mq3-client-playable-muzzle-flash-definition-1390755383.md) — struct
<a id="function-function-mq3-client-playable-muzzle-flash-definitions-function-definitions-src-mq3-client-playable-muzzle-flash-ml-503162098"></a>
### definitions

```ml
function definitions()
```

Builds the playable muzzle flash `definitions` sequence from `[ Definition("weapon_gauntlet","flash_gauntlet","models/weapons2/gauntlet/gauntlet_flash.md3",true,153,153,255), Definition("weapon_machinegun","flash_machinegun","models/weapons2/machinegun/machin...`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_muzzle_flash.ml#L46)

<a id="function-function-mq3-client-playable-muzzle-flash-dynamiclight-function-dynamiclight-catalog-weaponclass-guntransform-lastfire-now-triggerheld-src-mq3-client-playable-muzzle-flash-ml-1213793118"></a>
### dynamicLight

```ml
function dynamicLight(catalog, weaponClass, gunTransform, lastFire, now, triggerHeld)
```

Calls `mq3.client.playable_muzzle_flash.definition`, `mq3.client.playable_muzzle_flash.visible`, `mq3.client.playable_muzzle_flash.muzzleTransform` and additional helpers from playable muzzle flash `dynamicLight`. The final path returns `dynamicLights.Light(placed.origin,lightRadius(now),lightColor(def),false)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `weaponClass` | `dynamic` | — | Value used by `def=definition(weaponClass)`. |
| `gunTransform` | `dynamic` | — | Value used by `if def==void or not visible(def,lastFire,now,triggerHeld) or catalog==void or gunTransform==void then return void end if`. |
| `lastFire` | `dynamic` | — | Value used by `if def==void or not visible(def,lastFire,now,triggerHeld) or catalog==void or gunTransform==void then return void end if`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `triggerHeld` | `dynamic` | — | Value used by `if def==void or not visible(def,lastFire,now,triggerHeld) or catalog==void or gunTransform==void then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_muzzle_flash.ml#L156)

<a id="function-function-mq3-client-playable-muzzle-flash-fail-function-fail-message-src-mq3-client-playable-muzzle-flash-ml-233693159"></a>
### fail

```ml
function fail(message)
```

Creates the playable muzzle flash error `7610` with diagnostic text `"playable muzzle flash: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"playable muzzle flash: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_muzzle_flash.ml#L43)

<a id="function-function-mq3-client-playable-muzzle-flash-lightcolor-function-lightcolor-value-src-mq3-client-playable-muzzle-flash-ml-712941773"></a>
### lightColor

```ml
function lightColor(value)
```

Evaluates playable muzzle flash `lightColor` and returns `[0.0,0.0,0.0]`, `[0.6,0.6,1.0]`, `[1.0,0.7,0.0]` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.weaponClass`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_muzzle_flash.ml#L74)

<a id="function-function-mq3-client-playable-muzzle-flash-lightradius-function-lightradius-now-src-mq3-client-playable-muzzle-flash-ml-1902499602"></a>
### lightRadius

```ml
function lightRadius(now)
```

Baseq3 uses 300 + (rand() & 31). Keep that exact radius range while deriving the variation deterministically from frame time for reproducible preview runs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_muzzle_flash.ml#L87)

<a id="function-function-mq3-client-playable-muzzle-flash-multiplyaxis-function-multiplyaxis-left-right-src-mq3-client-playable-muzzle-flash-ml-374768145"></a>
### multiplyAxis

```ml
function multiplyAxis(left, right)
```

Evaluates playable muzzle flash `multiplyAxis` and returns `result` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Sequence read at `left[row]`. |
| `right` | `dynamic` | — | Sequence read at `right[0]`, `right[1]`, `right[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_muzzle_flash.ml#L117)

<a id="constant-constant-mq3-client-playable-muzzle-flash-muzzle-flash-time-const-muzzle-flash-time-20-src-mq3-client-playable-muzzle-flash-ml-552795175"></a>
### MUZZLE_FLASH_TIME

```ml
const MUZZLE_FLASH_TIME = 20
```

Milliseconds for which a weapon muzzle flash remains visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_muzzle_flash.ml#L10)

<a id="function-function-mq3-client-playable-muzzle-flash-muzzletransform-function-muzzletransform-catalog-weaponclass-guntransform-src-mq3-client-playable-muzzle-flash-ml-1865068029"></a>
### muzzleTransform

```ml
function muzzleTransform(catalog, weaponClass, gunTransform)
```

Resolve the weapon's retail tag_flash independently of flash visibility so projectile simulation and rendering can share the exact muzzle origin.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `weaponClass` | `dynamic` | — | Value used by `gun=itemModels.find(catalog,weaponClass)`. |
| `gunTransform` | `dynamic` | — | Value used by `if catalog==void or gunTransform==void then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_muzzle_flash.ml#L142)

<a id="function-function-mq3-client-playable-muzzle-flash-render-function-render-catalog-weaponclass-guntransform-lastfire-now-triggerheld-maxtriangles-src-mq3-client-playable-muzzle-flash-ml-934653947"></a>
### render

```ml
function render(catalog, weaponClass, gunTransform, lastFire, now, triggerHeld, maxTriangles)
```

Calls `mq3.client.playable_muzzle_flash.definition`, `mq3.client.playable_muzzle_flash.visible`, `mq3.client.playable_muzzle_flash.Rendered` and additional helpers from playable muzzle flash `render`. The final path returns `Rendered(triangles,def.red,def.green,def.blue)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `weaponClass` | `dynamic` | — | Value used by `def=definition(weaponClass)`. |
| `gunTransform` | `dynamic` | — | Value used by `placed=muzzleTransform(catalog,weaponClass,gunTransform)`. |
| `lastFire` | `dynamic` | — | Value used by `if def==void or not visible(def,lastFire,now,triggerHeld) then return Rendered([],255,255,255) end if`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `triggerHeld` | `dynamic` | — | Value used by `if def==void or not visible(def,lastFire,now,triggerHeld) then return Rendered([],255,255,255) end if`. |
| `maxTriangles` | `dynamic` | — | Upper bound on emitted render triangles. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_muzzle_flash.ml#L170)

- [mq3.client.playable_muzzle_flash.Rendered](Type-mq3-client-playable-muzzle-flash-rendered-462901155.md) — struct
<a id="function-function-mq3-client-playable-muzzle-flash-tag-function-tag-model-name-src-mq3-client-playable-muzzle-flash-ml-135983860"></a>
### tag

```ml
function tag(model, name)
```

Calls `stringEqualsIgnoreCaseAscii` from playable muzzle flash `tag`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Record read through `model.tags`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable muzzle flash resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_muzzle_flash.ml#L108)

<a id="function-function-mq3-client-playable-muzzle-flash-visible-function-visible-value-lastfire-now-triggerheld-src-mq3-client-playable-muzzle-flash-ml-1943424552"></a>
### visible

```ml
function visible(value, lastFire, now, triggerHeld)
```

CG_AddPlayerWeapon keeps Lightning/Gauntlet flashes while EF_FIRING is set; all other weapons use the 20 ms MUZZLE_FLASH_TIME impulse window.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.continuous`. |
| `lastFire` | `dynamic` | — | Value used by `elapsed=now-lastFire`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `triggerHeld` | `dynamic` | — | Value used by `if value.continuous and triggerHeld then return true end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_muzzle_flash.ml#L98)
