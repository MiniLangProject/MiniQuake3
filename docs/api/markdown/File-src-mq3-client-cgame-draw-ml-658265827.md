# `src/mq3/client/cgame_draw.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_draw`](Package-mq3-client-cgame-draw-611567635.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-client-cgame-draw-action-function-action-kind-x-y-width-height-text-shader-color-value-client-src-mq3-client-cgame-draw-ml-1463624489"></a>
### action

```ml
function action(kind, x, y, width, height, text, shader, color, value, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L46)

- [mq3.client.cgame_draw.Action](Type-mq3-client-cgame-draw-action-1204758205.md) — struct
<a id="function-function-mq3-client-cgame-draw-addlagometerframeinfo-function-addlagometerframeinfo-value-src-mq3-client-cgame-draw-ml-376739945"></a>
### addLagometerFrameInfo

```ml
function addLagometerFrameInfo(value)
```

CG_AddLagometerFrameInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L162)

<a id="function-function-mq3-client-cgame-draw-addlagometersnapshotinfo-function-addlagometersnapshotinfo-value-ping-flags-present-src-mq3-client-cgame-draw-ml-1341373943"></a>
### addLagometerSnapshotInfo

```ml
function addLagometerSnapshotInfo(value, ping, flags, present)
```

CG_AddLagometerSnapshotInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `ping` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `present` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L164)

<a id="constant-constant-mq3-client-cgame-draw-attacker-head-time-const-attacker-head-time-10000-src-mq3-client-cgame-draw-ml-1964275422"></a>
### ATTACKER_HEAD_TIME

```ml
const ATTACKER_HEAD_TIME = 10000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L36)

<a id="constant-constant-mq3-client-cgame-draw-bigchar-height-const-bigchar-height-16-src-mq3-client-cgame-draw-ml-1709975204"></a>
### BIGCHAR_HEIGHT

```ml
const BIGCHAR_HEIGHT = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L29)

<a id="constant-constant-mq3-client-cgame-draw-bigchar-width-const-bigchar-width-16-src-mq3-client-cgame-draw-ml-1710069878"></a>
### BIGCHAR_WIDTH

```ml
const BIGCHAR_WIDTH = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L28)

<a id="function-function-mq3-client-cgame-draw-centerprint-function-centerprint-value-text-y-charwidth-src-mq3-client-cgame-draw-ml-52624607"></a>
### centerPrint

```ml
function centerPrint(value, text, y, charWidth)
```

CG_CenterPrint

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `charWidth` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L171)

<a id="function-function-mq3-client-cgame-draw-clamp-function-clamp-value-low-high-src-mq3-client-cgame-draw-ml-1641474921"></a>
### clamp

```ml
function clamp(value, low, high)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `low` | `dynamic` | — |  |
| `high` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L56)

<a id="function-function-mq3-client-cgame-draw-clear-function-clear-value-src-mq3-client-cgame-draw-ml-1117025595"></a>
### clear

```ml
function clear(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L54)

<a id="function-function-mq3-client-cgame-draw-client-function-client-name-team-src-mq3-client-cgame-draw-ml-1656745088"></a>
### client

```ml
function client(name, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L48)

- [mq3.client.cgame_draw.Client](Type-mq3-client-cgame-draw-client-255942216.md) — struct
<a id="function-function-mq3-client-cgame-draw-colorhealth-function-colorhealth-health-armor-src-mq3-client-cgame-draw-ml-537516291"></a>
### colorHealth

```ml
function colorHealth(health, armor)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `health` | `dynamic` | — |  |
| `armor` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L57)

<a id="function-function-mq3-client-cgame-draw-draw2dframe-function-draw2dframe-value-trace-retailactive-src-mq3-client-cgame-draw-ml-1778631291"></a>
### draw2DFrame

```ml
function draw2DFrame(value, trace, retailActive)
```

CG_Draw2D

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L201)

<a id="function-function-mq3-client-cgame-draw-draw3dmodel-function-draw3dmodel-value-x-y-w-h-model-skin-origin-angles-retailactive-src-mq3-client-cgame-draw-ml-1807334442"></a>
### draw3DModel

```ml
function draw3DModel(value, x, y, w, h, model, skin, origin, angles, retailActive)
```

CG_Draw3DModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `skin` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L108)

<a id="function-function-mq3-client-cgame-draw-drawactive-function-drawactive-value-stereoview-hassnapshot-trace-retailactive-src-mq3-client-cgame-draw-ml-1103714308"></a>
### drawActive

```ml
function drawActive(value, stereoView, hasSnapshot, trace, retailActive)
```

CG_DrawActive

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `stereoView` | `dynamic` | — |  |
| `hasSnapshot` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L214)

<a id="function-function-mq3-client-cgame-draw-drawammowarning-function-drawammowarning-value-enabled-retailactive-src-mq3-client-cgame-draw-ml-2077451729"></a>
### drawAmmoWarning

```ml
function drawAmmoWarning(value, enabled, retailActive)
```

CG_DrawAmmoWarning

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `enabled` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L193)

<a id="function-function-mq3-client-cgame-draw-drawattacker-function-drawattacker-value-y-retailactive-src-mq3-client-cgame-draw-ml-539271779"></a>
### drawAttacker

```ml
function drawAttacker(value, y, retailActive)
```

CG_DrawAttacker

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L125)

<a id="function-function-mq3-client-cgame-draw-drawcenterstring-function-drawcenterstring-value-centertime-retailactive-src-mq3-client-cgame-draw-ml-261518048"></a>
### drawCenterString

```ml
function drawCenterString(value, centertime, retailActive)
```

CG_DrawCenterString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `centertime` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L173)

<a id="function-function-mq3-client-cgame-draw-drawcrosshair-function-drawcrosshair-value-retailactive-src-mq3-client-cgame-draw-ml-1329456004"></a>
### drawCrosshair

```ml
function drawCrosshair(value, retailActive)
```

CG_DrawCrosshair

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L175)

<a id="function-function-mq3-client-cgame-draw-drawcrosshairnames-function-drawcrosshairnames-value-trace-retailactive-src-mq3-client-cgame-draw-ml-1778584617"></a>
### drawCrosshairNames

```ml
function drawCrosshairNames(value, trace, retailActive)
```

CG_DrawCrosshairNames

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L179)

<a id="function-function-mq3-client-cgame-draw-drawdisconnect-function-drawdisconnect-value-commandtime-currentcmdtime-retailactive-src-mq3-client-cgame-draw-ml-513330022"></a>
### drawDisconnect

```ml
function drawDisconnect(value, commandTime, currentCmdTime, retailActive)
```

CG_DrawDisconnect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `commandTime` | `dynamic` | — |  |
| `currentCmdTime` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L166)

<a id="function-function-mq3-client-cgame-draw-drawfield-function-drawfield-value-x-y-width-number-retailactive-src-mq3-client-cgame-draw-ml-521484224"></a>
### drawField

```ml
function drawField(value, x, y, width, number, retailActive)
```

CG_DrawField

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L103)

<a id="function-function-mq3-client-cgame-draw-drawflagmodel-function-drawflagmodel-value-x-y-w-h-team-force2d-retailactive-src-mq3-client-cgame-draw-ml-1748405440"></a>
### drawFlagModel

```ml
function drawFlagModel(value, x, y, w, h, team, force2D, retailActive)
```

CG_DrawFlagModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `force2D` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L112)

<a id="function-function-mq3-client-cgame-draw-drawfollow-function-drawfollow-value-retailactive-src-mq3-client-cgame-draw-ml-1812923680"></a>
### drawFollow

```ml
function drawFollow(value, retailActive)
```

CG_DrawFollow

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L191)

<a id="function-function-mq3-client-cgame-draw-drawfps-function-drawfps-value-y-milliseconds-retailactive-src-mq3-client-cgame-draw-ml-797014159"></a>
### drawFPS

```ml
function drawFPS(value, y, milliseconds, retailActive)
```

CG_DrawFPS

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `milliseconds` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L129)

<a id="function-function-mq3-client-cgame-draw-drawhead-function-drawhead-value-x-y-w-h-clientnum-angles-retailactive-src-mq3-client-cgame-draw-ml-355120101"></a>
### drawHead

```ml
function drawHead(value, x, y, w, h, clientNum, angles, retailActive)
```

CG_DrawHead

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L110)

<a id="function-function-mq3-client-cgame-draw-drawholdableitem-function-drawholdableitem-value-icon-retailactive-src-mq3-client-cgame-draw-ml-1767152541"></a>
### drawHoldableItem

```ml
function drawHoldableItem(value, icon, retailActive)
```

CG_DrawHoldableItem

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `icon` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L155)

<a id="function-function-mq3-client-cgame-draw-drawintermission-function-drawintermission-value-centertime-retailactive-src-mq3-client-cgame-draw-ml-684769160"></a>
### drawIntermission

```ml
function drawIntermission(value, centertime, retailActive)
```

CG_DrawIntermission

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `centertime` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L189)

<a id="function-function-mq3-client-cgame-draw-drawlagometer-function-drawlagometer-value-enabled-commandtime-currentcmdtime-retailactive-src-mq3-client-cgame-draw-ml-2124869425"></a>
### drawLagometer

```ml
function drawLagometer(value, enabled, commandTime, currentCmdTime, retailActive)
```

CG_DrawLagometer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `enabled` | `dynamic` | — |  |
| `commandTime` | `dynamic` | — |  |
| `currentCmdTime` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L168)

<a id="function-function-mq3-client-cgame-draw-drawlowerleft-function-drawlowerleft-value-itemname-itemicon-pickuptime-retailactive-src-mq3-client-cgame-draw-ml-1003551099"></a>
### drawLowerLeft

```ml
function drawLowerLeft(value, itemName, itemIcon, pickupTime, retailActive)
```

CG_DrawLowerLeft

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `itemName` | `dynamic` | — |  |
| `itemIcon` | `dynamic` | — |  |
| `pickupTime` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L151)

<a id="function-function-mq3-client-cgame-draw-drawlowerright-function-drawlowerright-value-score1-score2-retailactive-src-mq3-client-cgame-draw-ml-1472100257"></a>
### drawLowerRight

```ml
function drawLowerRight(value, score1, score2, retailActive)
```

CG_DrawLowerRight

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `score1` | `dynamic` | — |  |
| `score2` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L147)

<a id="function-function-mq3-client-cgame-draw-drawpersistantpowerup-function-drawpersistantpowerup-value-icon-retailactive-src-mq3-client-cgame-draw-ml-272182603"></a>
### drawPersistantPowerup

```ml
function drawPersistantPowerup(value, icon, retailActive)
```

CG_DrawPersistantPowerup

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `icon` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L157)

<a id="function-function-mq3-client-cgame-draw-drawpic-function-drawpic-value-x-y-w-h-shader-color-retailactive-src-mq3-client-cgame-draw-ml-665871232"></a>
### drawPic

```ml
function drawPic(value, x, y, w, h, shader, color, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L60)

<a id="function-function-mq3-client-cgame-draw-drawpickupitem-function-drawpickupitem-value-y-itemname-itemicon-pickuptime-retailactive-src-mq3-client-cgame-draw-ml-2116903660"></a>
### drawPickupItem

```ml
function drawPickupItem(value, y, itemName, itemIcon, pickupTime, retailActive)
```

CG_DrawPickupItem

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `itemName` | `dynamic` | — |  |
| `itemIcon` | `dynamic` | — |  |
| `pickupTime` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L149)

<a id="function-function-mq3-client-cgame-draw-drawpowerups-function-drawpowerups-value-y-retailactive-src-mq3-client-cgame-draw-ml-1948264811"></a>
### drawPowerups

```ml
function drawPowerups(value, y, retailActive)
```

CG_DrawPowerups

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L145)

<a id="function-function-mq3-client-cgame-draw-drawproxwarning-function-drawproxwarning-value-ticking-proxtick-retailactive-src-mq3-client-cgame-draw-ml-974243677"></a>
### drawProxWarning

```ml
function drawProxWarning(value, ticking, proxTick, retailActive)
```

CG_DrawProxWarning

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `ticking` | `dynamic` | — |  |
| `proxTick` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L195)

<a id="function-function-mq3-client-cgame-draw-drawreward-function-drawreward-value-rewardtime-rewardcount-rewardshader-rewardsound-retailactive-src-mq3-client-cgame-draw-ml-1267597860"></a>
### drawReward

```ml
function drawReward(value, rewardTime, rewardCount, rewardShader, rewardSound, retailActive)
```

CG_DrawReward

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `rewardTime` | `dynamic` | — |  |
| `rewardCount` | `dynamic` | — |  |
| `rewardShader` | `dynamic` | — |  |
| `rewardSound` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L159)

<a id="function-function-mq3-client-cgame-draw-drawscoreboard-function-drawscoreboard-value-retailactive-src-mq3-client-cgame-draw-ml-1080761028"></a>
### drawScoreboard

```ml
function drawScoreboard(value, retailActive)
```

CG_DrawScoreboard

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L187)

<a id="function-function-mq3-client-cgame-draw-drawscores-function-drawscores-value-y-score1-score2-retailactive-src-mq3-client-cgame-draw-ml-558466218"></a>
### drawScores

```ml
function drawScores(value, y, score1, score2, retailActive)
```

CG_DrawScores

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `score1` | `dynamic` | — |  |
| `score2` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L143)

<a id="function-function-mq3-client-cgame-draw-drawsnapshot-function-drawsnapshot-value-y-retailactive-src-mq3-client-cgame-draw-ml-1001431087"></a>
### drawSnapshot

```ml
function drawSnapshot(value, y, retailActive)
```

CG_DrawSnapshot

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L127)

<a id="function-function-mq3-client-cgame-draw-drawspectator-function-drawspectator-value-retailactive-src-mq3-client-cgame-draw-ml-708669958"></a>
### drawSpectator

```ml
function drawSpectator(value, retailActive)
```

CG_DrawSpectator

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L181)

<a id="function-function-mq3-client-cgame-draw-drawstatusbar-function-drawstatusbar-value-retailactive-src-mq3-client-cgame-draw-ml-665236070"></a>
### drawStatusBar

```ml
function drawStatusBar(value, retailActive)
```

CG_DrawStatusBar

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L120)

<a id="function-function-mq3-client-cgame-draw-drawstatusbarflag-function-drawstatusbarflag-value-x-team-retailactive-src-mq3-client-cgame-draw-ml-1102559987"></a>
### drawStatusBarFlag

```ml
function drawStatusBarFlag(value, x, team, retailActive)
```

CG_DrawStatusBarFlag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L116)

<a id="function-function-mq3-client-cgame-draw-drawstatusbarhead-function-drawstatusbarhead-value-x-damagetime-damagex-retailactive-src-mq3-client-cgame-draw-ml-1834358821"></a>
### drawStatusBarHead

```ml
function drawStatusBarHead(value, x, damageTime, damageX, retailActive)
```

CG_DrawStatusBarHead

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `damageTime` | `dynamic` | — |  |
| `damageX` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L114)

<a id="function-function-mq3-client-cgame-draw-drawteambackground-function-drawteambackground-value-x-y-w-h-alpha-team-retailactive-src-mq3-client-cgame-draw-ml-69611821"></a>
### drawTeamBackground

```ml
function drawTeamBackground(value, x, y, w, h, alpha, team, retailActive)
```

CG_DrawTeamBackground

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `alpha` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L118)

<a id="function-function-mq3-client-cgame-draw-drawteaminfo-function-drawteaminfo-value-retailactive-src-mq3-client-cgame-draw-ml-1061803684"></a>
### drawTeamInfo

```ml
function drawTeamInfo(value, retailActive)
```

CG_DrawTeamInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L153)

<a id="function-function-mq3-client-cgame-draw-drawteamoverlay-function-drawteamoverlay-value-y-right-upper-retailactive-src-mq3-client-cgame-draw-ml-424567019"></a>
### drawTeamOverlay

```ml
function drawTeamOverlay(value, y, right, upper, retailActive)
```

CG_DrawTeamOverlay

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `upper` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L133)

<a id="function-function-mq3-client-cgame-draw-drawteamvote-function-drawteamvote-value-retailactive-src-mq3-client-cgame-draw-ml-863718204"></a>
### drawTeamVote

```ml
function drawTeamVote(value, retailActive)
```

CG_DrawTeamVote

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L185)

<a id="function-function-mq3-client-cgame-draw-drawtext-function-drawtext-value-x-y-text-size-color-retailactive-src-mq3-client-cgame-draw-ml-282281068"></a>
### drawText

```ml
function drawText(value, x, y, text, size, color, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L59)

<a id="function-function-mq3-client-cgame-draw-drawtimedmenus-function-drawtimedmenus-value-retailactive-src-mq3-client-cgame-draw-ml-506258128"></a>
### drawTimedMenus

```ml
function drawTimedMenus(value, retailActive)
```

CG_DrawTimedMenus

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L199)

<a id="function-function-mq3-client-cgame-draw-drawtimer-function-drawtimer-value-y-retailactive-src-mq3-client-cgame-draw-ml-875145741"></a>
### drawTimer

```ml
function drawTimer(value, y, retailActive)
```

CG_DrawTimer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L131)

<a id="function-function-mq3-client-cgame-draw-drawtourneyscoreboard-function-drawtourneyscoreboard-value-retailactive-src-mq3-client-cgame-draw-ml-910785524"></a>
### drawTourneyScoreboard

```ml
function drawTourneyScoreboard(value, retailActive)
```

CG_DrawTourneyScoreboard

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L212)

<a id="function-function-mq3-client-cgame-draw-drawupperright-function-drawupperright-value-milliseconds-retailactive-src-mq3-client-cgame-draw-ml-2126227642"></a>
### drawUpperRight

```ml
function drawUpperRight(value, milliseconds, retailActive)
```

CG_DrawUpperRight

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `milliseconds` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L140)

<a id="function-function-mq3-client-cgame-draw-drawvote-function-drawvote-value-retailactive-src-mq3-client-cgame-draw-ml-394075668"></a>
### drawVote

```ml
function drawVote(value, retailActive)
```

CG_DrawVote

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L183)

<a id="function-function-mq3-client-cgame-draw-drawwarmup-function-drawwarmup-value-retailactive-src-mq3-client-cgame-draw-ml-1906095276"></a>
### drawWarmup

```ml
function drawWarmup(value, retailActive)
```

CG_DrawWarmup

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L197)

<a id="constant-constant-mq3-client-cgame-draw-fade-time-const-fade-time-200-src-mq3-client-cgame-draw-ml-1891827379"></a>
### FADE_TIME

```ml
const FADE_TIME = 200
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L27)

<a id="function-function-mq3-client-cgame-draw-fadealpha-function-fadealpha-value-start-total-src-mq3-client-cgame-draw-ml-784739827"></a>
### fadeAlpha

```ml
function fadeAlpha(value, start, total)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `total` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L58)

<a id="constant-constant-mq3-client-cgame-draw-giant-height-const-giant-height-48-src-mq3-client-cgame-draw-ml-508199019"></a>
### GIANT_HEIGHT

```ml
const GIANT_HEIGHT = 48
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L31)

<a id="constant-constant-mq3-client-cgame-draw-giant-width-const-giant-width-32-src-mq3-client-cgame-draw-ml-1658261324"></a>
### GIANT_WIDTH

```ml
const GIANT_WIDTH = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L30)

- [mq3.client.cgame_draw.Glyph](Type-mq3-client-cgame-draw-glyph-2074225799.md) — struct
<a id="constant-constant-mq3-client-cgame-draw-gt-ctf-const-gt-ctf-4-src-mq3-client-cgame-draw-ml-1242809909"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L18)

<a id="constant-constant-mq3-client-cgame-draw-gt-ffa-const-gt-ffa-0-src-mq3-client-cgame-draw-ml-22151233"></a>
### GT_FFA

```ml
const GT_FFA = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L14)

<a id="constant-constant-mq3-client-cgame-draw-gt-single-player-const-gt-single-player-2-src-mq3-client-cgame-draw-ml-1903452941"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L16)

<a id="constant-constant-mq3-client-cgame-draw-gt-team-const-gt-team-3-src-mq3-client-cgame-draw-ml-708610706"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L17)

<a id="constant-constant-mq3-client-cgame-draw-gt-tournament-const-gt-tournament-1-src-mq3-client-cgame-draw-ml-511968384"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L15)

<a id="constant-constant-mq3-client-cgame-draw-icon-size-const-icon-size-48-src-mq3-client-cgame-draw-ml-2079988175"></a>
### ICON_SIZE

```ml
const ICON_SIZE = 48
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L34)

<a id="constant-constant-mq3-client-cgame-draw-item-blob-time-const-item-blob-time-200-src-mq3-client-cgame-draw-ml-964137875"></a>
### ITEM_BLOB_TIME

```ml
const ITEM_BLOB_TIME = 200
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L35)

<a id="constant-constant-mq3-client-cgame-draw-lag-samples-const-lag-samples-128-src-mq3-client-cgame-draw-ml-1008355790"></a>
### LAG_SAMPLES

```ml
const LAG_SAMPLES = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L25)

<a id="function-function-mq3-client-cgame-draw-lagometer-function-lagometer-src-mq3-client-cgame-draw-ml-340910942"></a>
### lagometer

```ml
function lagometer()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L50)

- [mq3.client.cgame_draw.Lagometer](Type-mq3-client-cgame-draw-lagometer-1572914679.md) — struct
<a id="constant-constant-mq3-client-cgame-draw-max-clients-const-max-clients-64-src-mq3-client-cgame-draw-ml-488723977"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L23)

<a id="constant-constant-mq3-client-cgame-draw-max-locations-const-max-locations-64-src-mq3-client-cgame-draw-ml-1541394337"></a>
### MAX_LOCATIONS

```ml
const MAX_LOCATIONS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L24)

<a id="constant-constant-mq3-client-cgame-draw-pm-intermission-const-pm-intermission-5-src-mq3-client-cgame-draw-ml-1209839204"></a>
### PM_INTERMISSION

```ml
const PM_INTERMISSION = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L19)

<a id="constant-constant-mq3-client-cgame-draw-pmf-follow-const-pmf-follow-4096-src-mq3-client-cgame-draw-ml-2026695574"></a>
### PMF_FOLLOW

```ml
const PMF_FOLLOW = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L20)

<a id="constant-constant-mq3-client-cgame-draw-pmf-scoreboard-const-pmf-scoreboard-8192-src-mq3-client-cgame-draw-ml-1707477489"></a>
### PMF_SCOREBOARD

```ml
const PMF_SCOREBOARD = 8192
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L21)

<a id="function-function-mq3-client-cgame-draw-powerup-function-powerup-expires-icon-src-mq3-client-cgame-draw-ml-285432637"></a>
### powerup

```ml
function powerup(expires, icon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `expires` | `dynamic` | — |  |
| `icon` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L49)

- [mq3.client.cgame_draw.Powerup](Type-mq3-client-cgame-draw-powerup-677849029.md) — struct
<a id="function-function-mq3-client-cgame-draw-printablelength-function-printablelength-text-src-mq3-client-cgame-draw-ml-284129015"></a>
### printableLength

```ml
function printableLength(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L55)

<a id="function-function-mq3-client-cgame-draw-publish-function-publish-state-command-retailactive-src-mq3-client-cgame-draw-ml-1104847579"></a>
### publish

```ml
function publish(state, command, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L47)

<a id="function-function-mq3-client-cgame-draw-scanforcrosshairentity-function-scanforcrosshairentity-value-trace-src-mq3-client-cgame-draw-ml-751014508"></a>
### scanForCrosshairEntity

```ml
function scanForCrosshairEntity(value, trace)
```

CG_ScanForCrosshairEntity

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L177)

<a id="constant-constant-mq3-client-cgame-draw-snapflag-rate-delayed-const-snapflag-rate-delayed-1-src-mq3-client-cgame-draw-ml-1339160196"></a>
### SNAPFLAG_RATE_DELAYED

```ml
const SNAPFLAG_RATE_DELAYED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L22)

<a id="function-function-mq3-client-cgame-draw-state-function-state-src-mq3-client-cgame-draw-ml-695311296"></a>
### state

```ml
function state()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L51)

- [mq3.client.cgame_draw.State](Type-mq3-client-cgame-draw-state-1790363816.md) — struct
<a id="constant-constant-mq3-client-cgame-draw-team-blue-const-team-blue-2-src-mq3-client-cgame-draw-ml-790549327"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L12)

<a id="constant-constant-mq3-client-cgame-draw-team-free-const-team-free-0-src-mq3-client-cgame-draw-ml-840232769"></a>
### TEAM_FREE

```ml
const TEAM_FREE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L10)

<a id="constant-constant-mq3-client-cgame-draw-team-red-const-team-red-1-src-mq3-client-cgame-draw-ml-811640460"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L11)

<a id="constant-constant-mq3-client-cgame-draw-team-spectator-const-team-spectator-3-src-mq3-client-cgame-draw-ml-2106377002"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L13)

<a id="function-function-mq3-client-cgame-draw-textheight-function-textheight-text-scale-limit-glyphs-glyphscale-src-mq3-client-cgame-draw-ml-1873873651"></a>
### textHeight

```ml
function textHeight(text, scale, limit, glyphs, glyphScale)
```

CG_Text_Height

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |
| `glyphs` | `dynamic` | — |  |
| `glyphScale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L74)

<a id="function-function-mq3-client-cgame-draw-textpaint-function-textpaint-value-x-y-scale-color-text-adjust-limit-style-glyphs-glyphscale-retailactive-src-mq3-client-cgame-draw-ml-1460931127"></a>
### textPaint

```ml
function textPaint(value, x, y, scale, color, text, adjust, limit, style, glyphs, glyphScale, retailActive)
```

CG_Text_Paint

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `adjust` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `glyphs` | `dynamic` | — |  |
| `glyphScale` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L87)

<a id="function-function-mq3-client-cgame-draw-textpaintchar-function-textpaintchar-value-x-y-width-height-scale-s-t-s2-t2-shader-retailactive-src-mq3-client-cgame-draw-ml-1417190871"></a>
### textPaintChar

```ml
function textPaintChar(value, x, y, width, height, scale, s, t, s2, t2, shader, retailActive)
```

CG_Text_PaintChar

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `s` | `dynamic` | — |  |
| `t` | `dynamic` | — |  |
| `s2` | `dynamic` | — |  |
| `t2` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L85)

<a id="function-function-mq3-client-cgame-draw-textwidth-function-textwidth-text-scale-limit-glyphs-glyphscale-src-mq3-client-cgame-draw-ml-687302853"></a>
### textWidth

```ml
function textWidth(text, scale, limit, glyphs, glyphScale)
```

CG_Text_Width

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |
| `glyphs` | `dynamic` | — |  |
| `glyphScale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L63)

<a id="constant-constant-mq3-client-cgame-draw-tinychar-height-const-tinychar-height-8-src-mq3-client-cgame-draw-ml-395234753"></a>
### TINYCHAR_HEIGHT

```ml
const TINYCHAR_HEIGHT = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L33)

<a id="constant-constant-mq3-client-cgame-draw-tinychar-width-const-tinychar-width-8-src-mq3-client-cgame-draw-ml-731760785"></a>
### TINYCHAR_WIDTH

```ml
const TINYCHAR_WIDTH = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L32)

- [mq3.client.cgame_draw.TraceResult](Type-mq3-client-cgame-draw-traceresult-1778805101.md) — struct
<a id="constant-constant-mq3-client-cgame-draw-vote-time-const-vote-time-30000-src-mq3-client-cgame-draw-ml-327002058"></a>
### VOTE_TIME

```ml
const VOTE_TIME = 30000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L26)
