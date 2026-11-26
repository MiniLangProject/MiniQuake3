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
| `parent` | `dynamic` | — |  |
| `attachment` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_muzzle_flash.ml#L82)

<a id="function-function-mq3-client-playable-muzzle-flash-classnames-function-classnames-src-mq3-client-playable-muzzle-flash-ml-647291762"></a>
### classnames

```ml
function classnames()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_muzzle_flash.ml#L35)

<a id="function-function-mq3-client-playable-muzzle-flash-definition-function-definition-classname-src-mq3-client-playable-muzzle-flash-ml-747150259"></a>
### definition

```ml
function definition(classname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_muzzle_flash.ml#L30)

- [mq3.client.playable_muzzle_flash.Definition](Type-mq3-client-playable-muzzle-flash-definition-1390755383.md) — struct
<a id="function-function-mq3-client-playable-muzzle-flash-definitions-function-definitions-src-mq3-client-playable-muzzle-flash-ml-503162098"></a>
### definitions

```ml
function definitions()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_muzzle_flash.ml#L16)

<a id="function-function-mq3-client-playable-muzzle-flash-dynamiclight-function-dynamiclight-catalog-weaponclass-guntransform-lastfire-now-triggerheld-src-mq3-client-playable-muzzle-flash-ml-1213793118"></a>
### dynamicLight

```ml
function dynamicLight(catalog, weaponClass, gunTransform, lastFire, now, triggerHeld)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `weaponClass` | `dynamic` | — |  |
| `gunTransform` | `dynamic` | — |  |
| `lastFire` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `triggerHeld` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_muzzle_flash.ml#L98)

<a id="function-function-mq3-client-playable-muzzle-flash-fail-function-fail-message-src-mq3-client-playable-muzzle-flash-ml-233693159"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_muzzle_flash.ml#L14)

<a id="function-function-mq3-client-playable-muzzle-flash-lightcolor-function-lightcolor-value-src-mq3-client-playable-muzzle-flash-ml-712941773"></a>
### lightColor

```ml
function lightColor(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_muzzle_flash.ml#L39)

<a id="function-function-mq3-client-playable-muzzle-flash-lightradius-function-lightradius-now-src-mq3-client-playable-muzzle-flash-ml-1902499602"></a>
### lightRadius

```ml
function lightRadius(now)
```

Baseq3 uses 300 + (rand() & 31). Keep that exact radius range while deriving the variation deterministically from frame time for reproducible preview runs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_muzzle_flash.ml#L51)

<a id="function-function-mq3-client-playable-muzzle-flash-multiplyaxis-function-multiplyaxis-left-right-src-mq3-client-playable-muzzle-flash-ml-374768145"></a>
### multiplyAxis

```ml
function multiplyAxis(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_muzzle_flash.ml#L71)

<a id="constant-constant-mq3-client-playable-muzzle-flash-muzzle-flash-time-const-muzzle-flash-time-20-src-mq3-client-playable-muzzle-flash-ml-552795175"></a>
### MUZZLE_FLASH_TIME

```ml
const MUZZLE_FLASH_TIME = 20
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_muzzle_flash.ml#L9)

<a id="function-function-mq3-client-playable-muzzle-flash-muzzletransform-function-muzzletransform-catalog-weaponclass-guntransform-src-mq3-client-playable-muzzle-flash-ml-1865068029"></a>
### muzzleTransform

```ml
function muzzleTransform(catalog, weaponClass, gunTransform)
```

Resolve the weapon's retail tag_flash independently of flash visibility so projectile simulation and rendering can share the exact muzzle origin.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `weaponClass` | `dynamic` | — |  |
| `gunTransform` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_muzzle_flash.ml#L91)

<a id="function-function-mq3-client-playable-muzzle-flash-render-function-render-catalog-weaponclass-guntransform-lastfire-now-triggerheld-maxtriangles-src-mq3-client-playable-muzzle-flash-ml-934653947"></a>
### render

```ml
function render(catalog, weaponClass, gunTransform, lastFire, now, triggerHeld, maxTriangles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `weaponClass` | `dynamic` | — |  |
| `gunTransform` | `dynamic` | — |  |
| `lastFire` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `triggerHeld` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_muzzle_flash.ml#L104)

- [mq3.client.playable_muzzle_flash.Rendered](Type-mq3-client-playable-muzzle-flash-rendered-462901155.md) — struct
<a id="function-function-mq3-client-playable-muzzle-flash-tag-function-tag-model-name-src-mq3-client-playable-muzzle-flash-ml-135983860"></a>
### tag

```ml
function tag(model, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_muzzle_flash.ml#L65)

<a id="function-function-mq3-client-playable-muzzle-flash-visible-function-visible-value-lastfire-now-triggerheld-src-mq3-client-playable-muzzle-flash-ml-1943424552"></a>
### visible

```ml
function visible(value, lastFire, now, triggerHeld)
```

CG_AddPlayerWeapon keeps Lightning/Gauntlet flashes while EF_FIRING is set; all other weapons use the 20 ms MUZZLE_FLASH_TIME impulse window.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `lastFire` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `triggerHeld` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_muzzle_flash.ml#L58)
