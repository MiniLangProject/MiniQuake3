# `src/mq3/client/playable_combat_view.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_combat_view`](Package-mq3-client-playable-combat-view-162703800.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_hud.ml` as `hud` → [src/mq3/client/playable_hud.ml](File-src-mq3-client-playable-hud-ml-310363425.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)

## Declarations

<a id="function-function-mq3-client-playable-combat-view-clampnonnegative-function-clampnonnegative-value-src-mq3-client-playable-combat-view-ml-1774376657"></a>
### clampNonnegative

```ml
function clampNonnegative(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L24)

- [mq3.client.playable_combat_view.CombatLayout](Type-mq3-client-playable-combat-view-combatlayout-1835032184.md) — struct
- [mq3.client.playable_combat_view.CombatPulse](Type-mq3-client-playable-combat-view-combatpulse-789671119.md) — struct
- [mq3.client.playable_combat_view.CombatView](Type-mq3-client-playable-combat-view-combatview-1354122127.md) — struct
<a id="constant-constant-mq3-client-playable-combat-view-damage-mark-ms-const-damage-mark-ms-350-src-mq3-client-playable-combat-view-ml-1178434083"></a>
### DAMAGE_MARK_MS

```ml
const DAMAGE_MARK_MS = 350
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L12)

<a id="function-function-mq3-client-playable-combat-view-draw-function-draw-view-width-height-now-src-mq3-client-playable-combat-view-ml-482320340"></a>
### draw

```ml
function draw(view, width, height, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L128)

<a id="function-function-mq3-client-playable-combat-view-drawdamagemark-function-drawdamagemark-view-placement-intensity-src-mq3-client-playable-combat-view-ml-1327745281"></a>
### drawDamageMark

```ml
function drawDamageMark(view, placement, intensity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — |  |
| `placement` | `dynamic` | — |  |
| `intensity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L116)

<a id="function-function-mq3-client-playable-combat-view-drawfeedback-function-drawfeedback-view-width-height-now-src-mq3-client-playable-combat-view-ml-1329043324"></a>
### drawFeedback

```ml
function drawFeedback(view, width, height, now)
```

HUD/feedback pass for callers which draw the actual first-person MD3 weapon.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L144)

<a id="function-function-mq3-client-playable-combat-view-drawhitmark-function-drawhitmark-placement-intensity-src-mq3-client-playable-combat-view-ml-43804948"></a>
### drawHitMark

```ml
function drawHitMark(placement, intensity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `placement` | `dynamic` | — |  |
| `intensity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L108)

<a id="function-function-mq3-client-playable-combat-view-drawtransientfeedback-function-drawtransientfeedback-view-width-height-now-src-mq3-client-playable-combat-view-ml-839980806"></a>
### drawTransientFeedback

```ml
function drawTransientFeedback(view, width, height, now)
```

Crosshair hit and damage feedback layered over the retail Baseq3 HUD.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L159)

<a id="function-function-mq3-client-playable-combat-view-drawweapon-function-drawweapon-placement-recoil-muzzle-src-mq3-client-playable-combat-view-ml-1152438232"></a>
### drawWeapon

```ml
function drawWeapon(placement, recoil, muzzle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `placement` | `dynamic` | — |  |
| `recoil` | `dynamic` | — |  |
| `muzzle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L81)

<a id="function-function-mq3-client-playable-combat-view-fire-function-fire-view-now-src-mq3-client-playable-combat-view-ml-49933155"></a>
### fire

```ml
function fire(view, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L31)

<a id="constant-constant-mq3-client-playable-combat-view-fire-flash-ms-const-fire-flash-ms-90-src-mq3-client-playable-combat-view-ml-498942254"></a>
### FIRE_FLASH_MS

```ml
const FIRE_FLASH_MS = 90
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L9)

<a id="constant-constant-mq3-client-playable-combat-view-hit-mark-ms-const-hit-mark-ms-160-src-mq3-client-playable-combat-view-ml-30200342"></a>
### HIT_MARK_MS

```ml
const HIT_MARK_MS = 160
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L11)

<a id="constant-constant-mq3-client-playable-combat-view-kill-mark-ms-const-kill-mark-ms-900-src-mq3-client-playable-combat-view-ml-22698664"></a>
### KILL_MARK_MS

```ml
const KILL_MARK_MS = 900
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L13)

<a id="function-function-mq3-client-playable-combat-view-layout-function-layout-width-height-src-mq3-client-playable-combat-view-ml-1258685395"></a>
### layout

```ml
function layout(width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L69)

<a id="function-function-mq3-client-playable-combat-view-line-function-line-x0-y0-x1-y1-red-green-blue-src-mq3-client-playable-combat-view-ml-1242087762"></a>
### line

```ml
function line(x0, y0, x1, y1, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x0` | `dynamic` | — |  |
| `y0` | `dynamic` | — |  |
| `x1` | `dynamic` | — |  |
| `y1` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L76)

<a id="function-function-mq3-client-playable-combat-view-pulse-function-pulse-view-now-src-mq3-client-playable-combat-view-ml-1370894261"></a>
### pulse

```ml
function pulse(view, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L64)

<a id="constant-constant-mq3-client-playable-combat-view-recoil-ms-const-recoil-ms-180-src-mq3-client-playable-combat-view-ml-373605748"></a>
### RECOIL_MS

```ml
const RECOIL_MS = 180
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L10)

<a id="function-function-mq3-client-playable-combat-view-registerdeath-function-registerdeath-view-src-mq3-client-playable-combat-view-ml-370603003"></a>
### registerDeath

```ml
function registerDeath(view)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L53)

<a id="function-function-mq3-client-playable-combat-view-registerhit-function-registerhit-view-now-src-mq3-client-playable-combat-view-ml-2056477135"></a>
### registerHit

```ml
function registerHit(view, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L36)

<a id="function-function-mq3-client-playable-combat-view-registerkill-function-registerkill-view-now-score-src-mq3-client-playable-combat-view-ml-350839167"></a>
### registerKill

```ml
function registerKill(view, now, score)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `score` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L48)

<a id="function-function-mq3-client-playable-combat-view-remaining-function-remaining-now-start-duration-src-mq3-client-playable-combat-view-ml-1331388720"></a>
### remaining

```ml
function remaining(now, start, duration)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `now` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `duration` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L58)

<a id="function-function-mq3-client-playable-combat-view-setscore-function-setscore-view-value-src-mq3-client-playable-combat-view-ml-992597322"></a>
### setScore

```ml
function setScore(view, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L26)

<a id="function-function-mq3-client-playable-combat-view-state-function-state-weaponname-src-mq3-client-playable-combat-view-ml-712871985"></a>
### state

```ml
function state(weaponName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weaponName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L19)

<a id="function-function-mq3-client-playable-combat-view-takedamage-function-takedamage-view-now-amount-side-src-mq3-client-playable-combat-view-ml-156668940"></a>
### takeDamage

```ml
function takeDamage(view, now, amount, side)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `amount` | `dynamic` | — |  |
| `side` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_combat_view.ml#L41)
