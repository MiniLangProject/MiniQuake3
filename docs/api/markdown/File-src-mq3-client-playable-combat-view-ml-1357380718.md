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

Evaluates playable combat view `clampNonnegative` and returns `0`, `value` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<0` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L90)

- [mq3.client.playable_combat_view.CombatLayout](Type-mq3-client-playable-combat-view-combatlayout-1835032184.md) — struct
- [mq3.client.playable_combat_view.CombatPulse](Type-mq3-client-playable-combat-view-combatpulse-789671119.md) — struct
- [mq3.client.playable_combat_view.CombatView](Type-mq3-client-playable-combat-view-combatview-1354122127.md) — struct
<a id="constant-constant-mq3-client-playable-combat-view-damage-mark-ms-const-damage-mark-ms-350-src-mq3-client-playable-combat-view-ml-1178434083"></a>
### DAMAGE_MARK_MS

```ml
const DAMAGE_MARK_MS = 350
```

Duration or timeout in milliseconds controlling damage mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L16)

<a id="function-function-mq3-client-playable-combat-view-draw-function-draw-view-width-height-now-src-mq3-client-playable-combat-view-ml-482320340"></a>
### draw

```ml
function draw(view, width, height, now)
```

Calls `mq3.client.playable_combat_view.layout`, `mq3.client.playable_combat_view.pulse`, `mq3.client.playable_combat_view.drawWeapon` and additional helpers from playable combat view `draw`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — | Record read through `view.weaponName`, `view.score`, `view.kills`, `view.deaths` and additional values. |
| `width` | `dynamic` | — | Width in the coordinate space used by `draw`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `draw`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L248)

<a id="function-function-mq3-client-playable-combat-view-drawdamagemark-function-drawdamagemark-view-placement-intensity-src-mq3-client-playable-combat-view-ml-1327745281"></a>
### drawDamageMark

```ml
function drawDamageMark(view, placement, intensity)
```

Calls `mq3.client.playable_combat_view.line` from playable combat view `drawDamageMark`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — | Record read through `view.damageSide`. |
| `placement` | `dynamic` | — | Record read through `placement.centerY`, `placement.weaponHeight`, `placement.centerX`. |
| `intensity` | `dynamic` | — | Value used by `if intensity<=0 then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L231)

<a id="function-function-mq3-client-playable-combat-view-drawfeedback-function-drawfeedback-view-width-height-now-src-mq3-client-playable-combat-view-ml-1329043324"></a>
### drawFeedback

```ml
function drawFeedback(view, width, height, now)
```

HUD/feedback pass for callers which draw the actual first-person MD3 weapon.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — | Record read through `view.weaponName`, `view.score`, `view.kills`, `view.deaths` and additional values. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawFeedback`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `drawFeedback`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L268)

<a id="function-function-mq3-client-playable-combat-view-drawhitmark-function-drawhitmark-placement-intensity-src-mq3-client-playable-combat-view-ml-43804948"></a>
### drawHitMark

```ml
function drawHitMark(placement, intensity)
```

Calls `mq3.client.playable_combat_view.line` from playable combat view `drawHitMark`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `placement` | `dynamic` | — | Record read through `placement.centerX`, `placement.centerY`. |
| `intensity` | `dynamic` | — | Value used by `if intensity<=0 then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L219)

<a id="function-function-mq3-client-playable-combat-view-drawtransientfeedback-function-drawtransientfeedback-view-width-height-now-src-mq3-client-playable-combat-view-ml-839980806"></a>
### drawTransientFeedback

```ml
function drawTransientFeedback(view, width, height, now)
```

Crosshair hit and damage feedback layered over the retail Baseq3 HUD.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — | Record read through `view.damageAmount`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawTransientFeedback`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `drawTransientFeedback`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L287)

<a id="function-function-mq3-client-playable-combat-view-drawweapon-function-drawweapon-placement-recoil-muzzle-src-mq3-client-playable-combat-view-ml-1152438232"></a>
### drawWeapon

```ml
function drawWeapon(placement, recoil, muzzle)
```

Calls `mq3.client.playable_combat_view.line` from playable combat view `drawWeapon`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `placement` | `dynamic` | — | Record read through `placement.weaponX`, `placement.weaponY`, `placement.weaponWidth`, `placement.weaponHeight`. |
| `recoil` | `dynamic` | — | Value used by `y=placement.weaponY+recoil/90`. |
| `muzzle` | `dynamic` | — | Value used by `if muzzle>0 then`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L189)

<a id="function-function-mq3-client-playable-combat-view-fire-function-fire-view-now-src-mq3-client-playable-combat-view-ml-49933155"></a>
### fire

```ml
function fire(view, now)
```

Updates `view.lastFire`, `view.shots` during playable combat view `fire`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — | Mutable playable combat view record/storage; this routine assigns `view.lastFire`, `view.shots`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L103)

<a id="constant-constant-mq3-client-playable-combat-view-fire-flash-ms-const-fire-flash-ms-90-src-mq3-client-playable-combat-view-ml-498942254"></a>
### FIRE_FLASH_MS

```ml
const FIRE_FLASH_MS = 90
```

Duration or timeout in milliseconds controlling fire flash.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L10)

<a id="constant-constant-mq3-client-playable-combat-view-hit-mark-ms-const-hit-mark-ms-160-src-mq3-client-playable-combat-view-ml-30200342"></a>
### HIT_MARK_MS

```ml
const HIT_MARK_MS = 160
```

Duration or timeout in milliseconds controlling hit mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L14)

<a id="constant-constant-mq3-client-playable-combat-view-kill-mark-ms-const-kill-mark-ms-900-src-mq3-client-playable-combat-view-ml-22698664"></a>
### KILL_MARK_MS

```ml
const KILL_MARK_MS = 900
```

Duration or timeout in milliseconds controlling kill mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L18)

<a id="function-function-mq3-client-playable-combat-view-layout-function-layout-width-height-src-mq3-client-playable-combat-view-ml-1258685395"></a>
### layout

```ml
function layout(width, height)
```

Calls `mq3.client.playable_combat_view.CombatLayout` from playable combat view `layout`. The final path returns `CombatLayout(width/2,height/2,width/2-weaponWidth/2,height-weaponHeight,weaponWidth,weaponHeight)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Width in the coordinate space used by `layout`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `layout`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L165)

<a id="function-function-mq3-client-playable-combat-view-line-function-line-x0-y0-x1-y1-red-green-blue-src-mq3-client-playable-combat-view-ml-1242087762"></a>
### line

```ml
function line(x0, y0, x1, y1, red, green, blue)
```

Calls `mq3.platform.playable_window.lineNative`, `mq3.compat.numeric.trunc32` from playable combat view `line`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x0` | `dynamic` | — | Value used by `window.lineNative(numeric.trunc32(x0),numeric.trunc32(y0),numeric.trunc32(x1),numeric.trunc32(y1),red,green,blue)`. |
| `y0` | `dynamic` | — | Value used by `window.lineNative(numeric.trunc32(x0),numeric.trunc32(y0),numeric.trunc32(x1),numeric.trunc32(y1),red,green,blue)`. |
| `x1` | `dynamic` | — | Value used by `window.lineNative(numeric.trunc32(x0),numeric.trunc32(y0),numeric.trunc32(x1),numeric.trunc32(y1),red,green,blue)`. |
| `y1` | `dynamic` | — | Value used by `window.lineNative(numeric.trunc32(x0),numeric.trunc32(y0),numeric.trunc32(x1),numeric.trunc32(y1),red,green,blue)`. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L180)

<a id="function-function-mq3-client-playable-combat-view-pulse-function-pulse-view-now-src-mq3-client-playable-combat-view-ml-1370894261"></a>
### pulse

```ml
function pulse(view, now)
```

Calls `mq3.client.playable_combat_view.CombatPulse`, `mq3.client.playable_combat_view.remaining` from playable combat view `pulse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — | Record read through `view.lastFire`, `view.lastHit`, `view.lastDamage`, `view.lastKill`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L157)

<a id="constant-constant-mq3-client-playable-combat-view-recoil-ms-const-recoil-ms-180-src-mq3-client-playable-combat-view-ml-373605748"></a>
### RECOIL_MS

```ml
const RECOIL_MS = 180
```

Duration or timeout in milliseconds controlling recoil.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L12)

<a id="function-function-mq3-client-playable-combat-view-registerdeath-function-registerdeath-view-src-mq3-client-playable-combat-view-ml-370603003"></a>
### registerDeath

```ml
function registerDeath(view)
```

Updates `view.deaths` during playable combat view `registerDeath`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — | Mutable playable combat view record/storage; this routine assigns `view.deaths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L139)

<a id="function-function-mq3-client-playable-combat-view-registerhit-function-registerhit-view-now-src-mq3-client-playable-combat-view-ml-2056477135"></a>
### registerHit

```ml
function registerHit(view, now)
```

Updates `view.lastHit`, `view.hits` during playable combat view `registerHit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — | Mutable playable combat view record/storage; this routine assigns `view.lastHit`, `view.hits`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L111)

<a id="function-function-mq3-client-playable-combat-view-registerkill-function-registerkill-view-now-score-src-mq3-client-playable-combat-view-ml-350839167"></a>
### registerKill

```ml
function registerKill(view, now, score)
```

Updates `view.lastKill`, `view.kills`, `view.score` during playable combat view `registerKill`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — | Mutable playable combat view record/storage; this routine assigns `view.lastKill`, `view.kills`, `view.score`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `score` | `dynamic` | — | Value assigned to `view.score`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L132)

<a id="function-function-mq3-client-playable-combat-view-remaining-function-remaining-now-start-duration-src-mq3-client-playable-combat-view-ml-1331388720"></a>
### remaining

```ml
function remaining(now, start, duration)
```

Evaluates playable combat view `remaining` and returns `0`, `((duration-elapsed)*1000)/duration` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `start` | `dynamic` | — | Value used by `elapsed=now-start`. |
| `duration` | `dynamic` | — | Lifetime or interval in the same units as this operation's clock. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L148)

<a id="function-function-mq3-client-playable-combat-view-setscore-function-setscore-view-value-src-mq3-client-playable-combat-view-ml-992597322"></a>
### setScore

```ml
function setScore(view, value)
```

Updates `view.score` during playable combat view `setScore`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — | Mutable playable combat view record/storage; this routine assigns `view.score`. |
| `value` | `dynamic` | — | Value assigned to `view.score`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L95)

<a id="function-function-mq3-client-playable-combat-view-state-function-state-weaponname-src-mq3-client-playable-combat-view-ml-712871985"></a>
### state

```ml
function state(weaponName)
```

Calls `mq3.client.playable_combat_view.CombatView` from playable combat view `state`. The final path returns `CombatView(weaponName,0,0,0,0,0,-1000000,-1000000,-1000000,-1000000,0,0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weaponName` | `dynamic` | — | Sequence whose length/content is inspected by `state`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L83)

<a id="function-function-mq3-client-playable-combat-view-takedamage-function-takedamage-view-now-amount-side-src-mq3-client-playable-combat-view-ml-156668940"></a>
### takeDamage

```ml
function takeDamage(view, now, amount, side)
```

Updates `view.lastDamage`, `view.damageAmount`, `view.damageSide` during playable combat view `takeDamage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — | Mutable playable combat view record/storage; this routine assigns `view.lastDamage`, `view.damageAmount`, `view.damageSide`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `amount` | `dynamic` | — | Value used by `view.damageAmount=clampNonnegative(amount)`. |
| `side` | `dynamic` | — | Value used by `if side<0 then view.damageSide=-1 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L121)
