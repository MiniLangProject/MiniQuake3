# `src/mq3/client/playable_projectile_view.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_projectile_view`](Package-mq3-client-playable-projectile-view-2009046785.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)

## Declarations

<a id="function-function-mq3-client-playable-projectile-view-alive-function-alive-value-nowmilliseconds-src-mq3-client-playable-projectile-view-ml-1235501761"></a>
### alive

```ml
function alive(value, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L59)

<a id="function-function-mq3-client-playable-projectile-view-basecolor-function-basecolor-style-src-mq3-client-playable-projectile-view-ml-574336553"></a>
### baseColor

```ml
function baseColor(style)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L70)

<a id="function-function-mq3-client-playable-projectile-view-command-function-command-kind-a-b-radius-rgb-src-mq3-client-playable-projectile-view-ml-1673583684"></a>
### command

```ml
function command(kind, a, b, radius, rgb)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `rgb` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L84)

<a id="constant-constant-mq3-client-playable-projectile-view-command-cross-const-command-cross-3-src-mq3-client-playable-projectile-view-ml-2031364198"></a>
### COMMAND_CROSS

```ml
const COMMAND_CROSS = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L17)

<a id="constant-constant-mq3-client-playable-projectile-view-command-glow-const-command-glow-2-src-mq3-client-playable-projectile-view-ml-1223447331"></a>
### COMMAND_GLOW

```ml
const COMMAND_GLOW = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L16)

<a id="constant-constant-mq3-client-playable-projectile-view-command-line-const-command-line-1-src-mq3-client-playable-projectile-view-ml-425412818"></a>
### COMMAND_LINE

```ml
const COMMAND_LINE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L15)

<a id="function-function-mq3-client-playable-projectile-view-copypoint-function-copypoint-value-src-mq3-client-playable-projectile-view-ml-590866091"></a>
### copyPoint

```ml
function copyPoint(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L28)

<a id="function-function-mq3-client-playable-projectile-view-cross-function-cross-center-radius-rgb-src-mq3-client-playable-projectile-view-ml-352006314"></a>
### cross

```ml
function cross(center, radius, rgb)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `rgb` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L87)

<a id="constant-constant-mq3-client-playable-projectile-view-default-impact-milliseconds-const-default-impact-milliseconds-360-src-mq3-client-playable-projectile-view-ml-1276426628"></a>
### DEFAULT_IMPACT_MILLISECONDS

```ml
const DEFAULT_IMPACT_MILLISECONDS = 360
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L18)

<a id="function-function-mq3-client-playable-projectile-view-defaultimpact-function-defaultimpact-entityid-style-position-normal-eventat-src-mq3-client-playable-projectile-view-ml-1528156092"></a>
### defaultImpact

```ml
function defaultImpact(entityId, style, position, normal, eventAt)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entityId` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `eventAt` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L48)

<a id="function-function-mq3-client-playable-projectile-view-draw-function-draw-commands-src-mq3-client-playable-projectile-view-ml-1042480400"></a>
### draw

```ml
function draw(commands)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L151)

<a id="function-function-mq3-client-playable-projectile-view-drawcommand-function-drawcommand-entry-src-mq3-client-playable-projectile-view-ml-938201474"></a>
### drawCommand

```ml
function drawCommand(entry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L133)

- [mq3.client.playable_projectile_view.EffectCommand](Type-mq3-client-playable-projectile-view-effectcommand-1953427621.md) — struct
<a id="function-function-mq3-client-playable-projectile-view-fadedcolor-function-fadedcolor-style-fraction-src-mq3-client-playable-projectile-view-ml-2058211071"></a>
### fadedColor

```ml
function fadedColor(style, fraction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | `dynamic` | — |  |
| `fraction` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L78)

<a id="function-function-mq3-client-playable-projectile-view-fadefraction-function-fadefraction-value-nowmilliseconds-src-mq3-client-playable-projectile-view-ml-1908807575"></a>
### fadeFraction

```ml
function fadeFraction(value, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L64)

<a id="function-function-mq3-client-playable-projectile-view-flying-function-flying-entityid-style-previousposition-position-sampledat-src-mq3-client-playable-projectile-view-ml-1884269331"></a>
### flying

```ml
function flying(entityId, style, previousPosition, position, sampledAt)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entityId` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `previousPosition` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `sampledAt` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L40)

<a id="function-function-mq3-client-playable-projectile-view-framecommands-function-framecommands-camera-snapshots-nowmilliseconds-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-projectile-view-ml-1674794154"></a>
### frameCommands

```ml
function frameCommands(camera, snapshots, nowMilliseconds, width, height, horizontalFovDegrees, nearDistance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `snapshots` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `horizontalFovDegrees` | `dynamic` | — |  |
| `nearDistance` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L119)

<a id="function-function-mq3-client-playable-projectile-view-glow-function-glow-center-radius-rgb-src-mq3-client-playable-projectile-view-ml-2052194090"></a>
### glow

```ml
function glow(center, radius, rgb)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `rgb` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L86)

<a id="function-function-mq3-client-playable-projectile-view-glowradius-function-glowradius-depth-src-mq3-client-playable-projectile-view-ml-59415781"></a>
### glowRadius

```ml
function glowRadius(depth)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `depth` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L89)

<a id="function-function-mq3-client-playable-projectile-view-impact-function-impact-entityid-style-position-normal-eventat-durationmilliseconds-src-mq3-client-playable-projectile-view-ml-1304075264"></a>
### impact

```ml
function impact(entityId, style, position, normal, eventAt, durationMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entityId` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `eventAt` | `dynamic` | — |  |
| `durationMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L44)

<a id="function-function-mq3-client-playable-projectile-view-impacttip-function-impacttip-value-src-mq3-client-playable-projectile-view-ml-570884051"></a>
### impactTip

```ml
function impactTip(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L96)

<a id="function-function-mq3-client-playable-projectile-view-line-function-line-a-b-rgb-src-mq3-client-playable-projectile-view-ml-846245178"></a>
### line

```ml
function line(a, b, rgb)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `rgb` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L85)

<a id="function-function-mq3-client-playable-projectile-view-livesnapshots-function-livesnapshots-snapshots-nowmilliseconds-src-mq3-client-playable-projectile-view-ml-1278291241"></a>
### liveSnapshots

```ml
function liveSnapshots(snapshots, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshots` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L125)

<a id="constant-constant-mq3-client-playable-projectile-view-max-impact-milliseconds-const-max-impact-milliseconds-1200-src-mq3-client-playable-projectile-view-ml-1382009998"></a>
### MAX_IMPACT_MILLISECONDS

```ml
const MAX_IMPACT_MILLISECONDS = 1200
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L19)

- [mq3.client.playable_projectile_view.ProjectileSnapshot](Type-mq3-client-playable-projectile-view-projectilesnapshot-827156542.md) — struct
<a id="function-function-mq3-client-playable-projectile-view-retailimpact-function-retailimpact-entityid-style-position-normal-eventat-src-mq3-client-playable-projectile-view-ml-1138597554"></a>
### retailImpact

```ml
function retailImpact(entityId, style, position, normal, eventAt)
```

CG_MissileHitWall keeps rocket explosions for 1000 ms and the remaining Baseq3 projectile explosions for the default 600 ms.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entityId` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `eventAt` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L54)

<a id="function-function-mq3-client-playable-projectile-view-screenpoint-function-screenpoint-center-dx-dy-src-mq3-client-playable-projectile-view-ml-524249052"></a>
### screenPoint

```ml
function screenPoint(center, dx, dy)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | `dynamic` | — |  |
| `dx` | `dynamic` | — |  |
| `dy` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L131)

<a id="function-function-mq3-client-playable-projectile-view-snapshot-function-snapshot-entityid-style-previousposition-position-normal-state-eventat-expiresat-src-mq3-client-playable-projectile-view-ml-1380406294"></a>
### snapshot

```ml
function snapshot(entityId, style, previousPosition, position, normal, state, eventAt, expiresAt)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entityId` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `previousPosition` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `eventAt` | `dynamic` | — |  |
| `expiresAt` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L30)

<a id="function-function-mq3-client-playable-projectile-view-snapshotcommands-function-snapshotcommands-camera-value-nowmilliseconds-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-projectile-view-ml-2038627024"></a>
### snapshotCommands

```ml
function snapshotCommands(camera, value, nowMilliseconds, width, height, horizontalFovDegrees, nearDistance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `horizontalFovDegrees` | `dynamic` | — |  |
| `nearDistance` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L101)

<a id="constant-constant-mq3-client-playable-projectile-view-state-flying-const-state-flying-1-src-mq3-client-playable-projectile-view-ml-905700072"></a>
### STATE_FLYING

```ml
const STATE_FLYING = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L9)

<a id="constant-constant-mq3-client-playable-projectile-view-state-impact-const-state-impact-2-src-mq3-client-playable-projectile-view-ml-376660897"></a>
### STATE_IMPACT

```ml
const STATE_IMPACT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L10)

<a id="constant-constant-mq3-client-playable-projectile-view-style-bfg-const-style-bfg-4-src-mq3-client-playable-projectile-view-ml-54477981"></a>
### STYLE_BFG

```ml
const STYLE_BFG = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L14)

<a id="constant-constant-mq3-client-playable-projectile-view-style-grenade-const-style-grenade-3-src-mq3-client-playable-projectile-view-ml-1139008734"></a>
### STYLE_GRENADE

```ml
const STYLE_GRENADE = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L13)

<a id="constant-constant-mq3-client-playable-projectile-view-style-plasma-const-style-plasma-2-src-mq3-client-playable-projectile-view-ml-1637703765"></a>
### STYLE_PLASMA

```ml
const STYLE_PLASMA = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L12)

<a id="constant-constant-mq3-client-playable-projectile-view-style-rocket-const-style-rocket-1-src-mq3-client-playable-projectile-view-ml-1404600350"></a>
### STYLE_ROCKET

```ml
const STYLE_ROCKET = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L11)

<a id="function-function-mq3-client-playable-projectile-view-validpoint-function-validpoint-value-src-mq3-client-playable-projectile-view-ml-211022125"></a>
### validPoint

```ml
function validPoint(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L27)
