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

Evaluates playable projectile view `alive` and returns `false`, `value.state==STATE_FLYING or nowMilliseconds<value.expiresAt` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.eventAt`, `value.state`, `value.expiresAt`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L100)

<a id="function-function-mq3-client-playable-projectile-view-basecolor-function-basecolor-style-src-mq3-client-playable-projectile-view-ml-574336553"></a>
### baseColor

```ml
function baseColor(style)
```

Evaluates playable projectile view `baseColor` and returns `[255,104,32]`, `[72,208,255]`, `[255,208,64]` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | `dynamic` | — | Value used by `if style==STYLE_ROCKET then return [255,104,32] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L116)

<a id="function-function-mq3-client-playable-projectile-view-command-function-command-kind-a-b-radius-rgb-src-mq3-client-playable-projectile-view-ml-1673583684"></a>
### command

```ml
function command(kind, a, b, radius, rgb)
```

Creates a `mq3.client.playable_projectile_view.EffectCommand` record. Assigns `kind` from `kind`, `a` from `a`, `b` from `b`, `radius` from `radius`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — | Value used to initialize `EffectCommand.kind`. |
| `a` | `dynamic` | — | Value used to initialize `EffectCommand.a`. |
| `b` | `dynamic` | — | Value used to initialize `EffectCommand.b`. |
| `radius` | `dynamic` | — | Value used to initialize `EffectCommand.radius`. |
| `rgb` | `dynamic` | — | Value used to initialize `EffectCommand.red`, `EffectCommand.green`, `EffectCommand.blue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L139)

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

Copies three vector components with float32 rounding for playable projectile view.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence read at `value[0]`, `value[1]`, `value[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L33)

<a id="function-function-mq3-client-playable-projectile-view-cross-function-cross-center-radius-rgb-src-mq3-client-playable-projectile-view-ml-352006314"></a>
### cross

```ml
function cross(center, radius, rgb)
```

Adapts `mq3.client.playable_projectile_view.command` to playable projectile view `cross`, returning its result for `COMMAND_CROSS, center, center, radius, rgb`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | `dynamic` | — | Argument 2, 3 of `mq3.client.playable_projectile_view.command`. |
| `radius` | `dynamic` | — | Radius used by the spatial or visual calculation. Forwarded to `mq3.client.playable_projectile_view.command`. |
| `rgb` | `dynamic` | — | Argument 5 of `mq3.client.playable_projectile_view.command`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L154)

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

Adapts `mq3.client.playable_projectile_view.impact` to playable projectile view `defaultImpact`, returning its result for `entityId, style, position, normal, eventAt, DEFAULT_IMPACT_MILLISECONDS`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entityId` | `dynamic` | — | Argument 1 of `mq3.client.playable_projectile_view.impact`. |
| `style` | `dynamic` | — | Argument 2 of `mq3.client.playable_projectile_view.impact`. |
| `position` | `dynamic` | — | Argument 3 of `mq3.client.playable_projectile_view.impact`. |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. Forwarded to `mq3.client.playable_projectile_view.impact`. |
| `eventAt` | `dynamic` | — | Argument 5 of `mq3.client.playable_projectile_view.impact`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L81)

<a id="function-function-mq3-client-playable-projectile-view-draw-function-draw-commands-src-mq3-client-playable-projectile-view-ml-1042480400"></a>
### draw

```ml
function draw(commands)
```

Calls `mq3.client.playable_projectile_view.drawCommand` from playable projectile view `draw`. The final path returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — | Value used by `for each entry in commands count=count+drawCommand(entry) end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L249)

<a id="function-function-mq3-client-playable-projectile-view-drawcommand-function-drawcommand-entry-src-mq3-client-playable-projectile-view-ml-938201474"></a>
### drawCommand

```ml
function drawCommand(entry)
```

Calls `mq3.platform.playable_window.drawLine`, `mq3.client.playable_projectile_view.screenPoint` from playable projectile view `drawCommand`. The final path returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — | Record read through `entry.kind`, `entry.a`, `entry.b`, `entry.red` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L229)

- [mq3.client.playable_projectile_view.EffectCommand](Type-mq3-client-playable-projectile-view-effectcommand-1953427621.md) — struct
<a id="function-function-mq3-client-playable-projectile-view-fadedcolor-function-fadedcolor-style-fraction-src-mq3-client-playable-projectile-view-ml-2058211071"></a>
### fadedColor

```ml
function fadedColor(style, fraction)
```

Calls `mq3.client.playable_projectile_view.baseColor`, `mq3.compat.numeric.trunc32` from playable projectile view `fadedColor`. The final path returns `[numeric.trunc32(rgb[0]*value),numeric.trunc32(rgb[1]*value),numeric.trunc32(rgb[2]*value)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | `dynamic` | — | Value used by `rgb=baseColor(style)`. |
| `fraction` | `dynamic` | — | Interpolation or blend fraction between the endpoint values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L127)

<a id="function-function-mq3-client-playable-projectile-view-fadefraction-function-fadefraction-value-nowmilliseconds-src-mq3-client-playable-projectile-view-ml-1908807575"></a>
### fadeFraction

```ml
function fadeFraction(value, nowMilliseconds)
```

Calls `mq3.client.playable_projectile_view.alive`, `mq3.compat.numeric.fdiv`, `mq3.compat.numeric.f32` from playable projectile view `fadeFraction`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.state`, `value.expiresAt`, `value.eventAt`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L108)

<a id="function-function-mq3-client-playable-projectile-view-flying-function-flying-entityid-style-previousposition-position-sampledat-src-mq3-client-playable-projectile-view-ml-1884269331"></a>
### flying

```ml
function flying(entityId, style, previousPosition, position, sampledAt)
```

Adapts `mq3.client.playable_projectile_view.snapshot` to playable projectile view `flying`, returning its result for `entityId, style, previousPosition, position, [0.0,0.0,0.0], STATE_FLYING, sampledAt, 0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entityId` | `dynamic` | — | Argument 1 of `mq3.client.playable_projectile_view.snapshot`. |
| `style` | `dynamic` | — | Argument 2 of `mq3.client.playable_projectile_view.snapshot`. |
| `previousPosition` | `dynamic` | — | Argument 3 of `mq3.client.playable_projectile_view.snapshot`. |
| `position` | `dynamic` | — | Argument 4 of `mq3.client.playable_projectile_view.snapshot`. |
| `sampledAt` | `dynamic` | — | Argument 7 of `mq3.client.playable_projectile_view.snapshot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L60)

<a id="function-function-mq3-client-playable-projectile-view-framecommands-function-framecommands-camera-snapshots-nowmilliseconds-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-projectile-view-ml-1674794154"></a>
### frameCommands

```ml
function frameCommands(camera, snapshots, nowMilliseconds, width, height, horizontalFovDegrees, nearDistance)
```

Calls `mq3.client.playable_projectile_view.snapshotCommands` from playable projectile view `frameCommands`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `snapshots` | `dynamic` | — | Value used by `for each value in snapshots result=result+snapshotCommands(camera,value,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance) end for`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |
| `width` | `dynamic` | — | Width in the coordinate space used by `frameCommands`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `frameCommands`. |
| `horizontalFovDegrees` | `dynamic` | — | Horizontal camera field of view in degrees. |
| `nearDistance` | `dynamic` | — | Distance from the camera to the near clipping plane. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L206)

<a id="function-function-mq3-client-playable-projectile-view-glow-function-glow-center-radius-rgb-src-mq3-client-playable-projectile-view-ml-2052194090"></a>
### glow

```ml
function glow(center, radius, rgb)
```

Adapts `mq3.client.playable_projectile_view.command` to playable projectile view `glow`, returning its result for `COMMAND_GLOW, center, center, radius, rgb`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | `dynamic` | — | Argument 2, 3 of `mq3.client.playable_projectile_view.command`. |
| `radius` | `dynamic` | — | Radius used by the spatial or visual calculation. Forwarded to `mq3.client.playable_projectile_view.command`. |
| `rgb` | `dynamic` | — | Argument 5 of `mq3.client.playable_projectile_view.command`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L149)

<a id="function-function-mq3-client-playable-projectile-view-glowradius-function-glowradius-depth-src-mq3-client-playable-projectile-view-ml-59415781"></a>
### glowRadius

```ml
function glowRadius(depth)
```

Calls `mq3.compat.numeric.trunc32` from playable projectile view `glowRadius`. The final path returns `radius`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `depth` | `dynamic` | — | Value used by `radius=numeric.trunc32(180.0/depth)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L158)

<a id="function-function-mq3-client-playable-projectile-view-impact-function-impact-entityid-style-position-normal-eventat-durationmilliseconds-src-mq3-client-playable-projectile-view-ml-1304075264"></a>
### impact

```ml
function impact(entityId, style, position, normal, eventAt, durationMilliseconds)
```

Adapts `mq3.client.playable_projectile_view.snapshot` to playable projectile view `impact`, returning its result for `entityId, style, position, position, normal, STATE_IMPACT, eventAt, eventAt+durationMilliseconds`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entityId` | `dynamic` | — | Argument 1 of `mq3.client.playable_projectile_view.snapshot`. |
| `style` | `dynamic` | — | Argument 2 of `mq3.client.playable_projectile_view.snapshot`. |
| `position` | `dynamic` | — | Argument 3, 4 of `mq3.client.playable_projectile_view.snapshot`. |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. Forwarded to `mq3.client.playable_projectile_view.snapshot`. |
| `eventAt` | `dynamic` | — | Argument 7, 8 of `mq3.client.playable_projectile_view.snapshot`; passed as `eventAt`, `eventAt+durationMilliseconds`. |
| `durationMilliseconds` | `dynamic` | — | Argument 8 of `mq3.client.playable_projectile_view.snapshot`; passed as `eventAt+durationMilliseconds`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L71)

<a id="function-function-mq3-client-playable-projectile-view-impacttip-function-impacttip-value-src-mq3-client-playable-projectile-view-ml-570884051"></a>
### impactTip

```ml
function impactTip(value)
```

Evaluates playable projectile view `impactTip` and returns `[value.position[0]+value.normal[0]*length,value.position[1]+value.normal[1]*length,value.position[2]+value.normal[2]*length]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.position`, `value.normal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L167)

<a id="function-function-mq3-client-playable-projectile-view-line-function-line-a-b-rgb-src-mq3-client-playable-projectile-view-ml-846245178"></a>
### line

```ml
function line(a, b, rgb)
```

Adapts `mq3.client.playable_projectile_view.command` to playable projectile view `line`, returning its result for `COMMAND_LINE, a, b, 0, rgb`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Argument 2 of `mq3.client.playable_projectile_view.command`. |
| `b` | `dynamic` | — | Argument 3 of `mq3.client.playable_projectile_view.command`. |
| `rgb` | `dynamic` | — | Argument 5 of `mq3.client.playable_projectile_view.command`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L144)

<a id="function-function-mq3-client-playable-projectile-view-livesnapshots-function-livesnapshots-snapshots-nowmilliseconds-src-mq3-client-playable-projectile-view-ml-1278291241"></a>
### liveSnapshots

```ml
function liveSnapshots(snapshots, nowMilliseconds)
```

Calls `mq3.client.playable_projectile_view.alive` from playable projectile view `liveSnapshots`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshots` | `dynamic` | — | Value used by `for each value in snapshots if alive(value,nowMilliseconds) then result=result+[value] end if end for`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L215)

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
| `entityId` | `dynamic` | — | Value used by `return impact(entityId,style,position,normal,eventAt,duration)`. |
| `style` | `dynamic` | — | Value used by `if style==STYLE_ROCKET then duration=1000 end if`. |
| `position` | `dynamic` | — | Value used by `return impact(entityId,style,position,normal,eventAt,duration)`. |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. |
| `eventAt` | `dynamic` | — | Value used by `return impact(entityId,style,position,normal,eventAt,duration)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L92)

<a id="function-function-mq3-client-playable-projectile-view-screenpoint-function-screenpoint-center-dx-dy-src-mq3-client-playable-projectile-view-ml-524249052"></a>
### screenPoint

```ml
function screenPoint(center, dx, dy)
```

Adapts `mq3.client.playable_viewer.ScreenPoint` to playable projectile view `screenPoint`, returning its result for `center.x+dx, center.y+dy, center.depth`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | `dynamic` | — | Record read through `center.x`, `center.y`, `center.depth`. |
| `dx` | `dynamic` | — | Argument 1 of `mq3.client.playable_viewer.ScreenPoint`; passed as `center.x+dx`. |
| `dy` | `dynamic` | — | Argument 2 of `mq3.client.playable_viewer.ScreenPoint`; passed as `center.y+dy`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L225)

<a id="function-function-mq3-client-playable-projectile-view-snapshot-function-snapshot-entityid-style-previousposition-position-normal-state-eventat-expiresat-src-mq3-client-playable-projectile-view-ml-1380406294"></a>
### snapshot

```ml
function snapshot(entityId, style, previousPosition, position, normal, state, eventAt, expiresAt)
```

Calls `mq3.client.playable_projectile_view.validPoint`, `mq3.client.playable_projectile_view.ProjectileSnapshot`, `mq3.client.playable_projectile_view.copyPoint` from playable projectile view `snapshot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entityId` | `dynamic` | — | Value used by `if entityId<0 then return error(7580,"projectile snapshot entity id cannot be negative") end if`. |
| `style` | `dynamic` | — | Value used by `return ProjectileSnapshot(entityId,style,copyPoint(previousPosition),copyPoint(position),copyPoint(normal),state,eventAt,expiresAt)`. |
| `previousPosition` | `dynamic` | — | Value used by `if not validPoint(previousPosition) or not validPoint(position) or not validPoint(normal) then return error(7581,"projectile snapshot needs th...`. |
| `position` | `dynamic` | — | Value used by `if not validPoint(previousPosition) or not validPoint(position) or not validPoint(normal) then return error(7581,"projectile snapshot needs th...`. |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. |
| `state` | `dynamic` | — | Shared playable projectile view state passed to the helper calls in `snapshot`. |
| `eventAt` | `dynamic` | — | Value used by `if state==STATE_IMPACT and expiresAt<=eventAt then return error(7584,"projectile impact needs a positive lifetime") end if`. |
| `expiresAt` | `dynamic` | — | Value used by `if state==STATE_FLYING and expiresAt!=0 then return error(7583,"flying projectile snapshot cannot have an expiry") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L44)

<a id="function-function-mq3-client-playable-projectile-view-snapshotcommands-function-snapshotcommands-camera-value-nowmilliseconds-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-projectile-view-ml-2038627024"></a>
### snapshotCommands

```ml
function snapshotCommands(camera, value, nowMilliseconds, width, height, horizontalFovDegrees, nearDistance)
```

Calls `mq3.client.playable_projectile_view.alive`, `mq3.client.playable_projectile_view.fadedColor`, `mq3.client.playable_projectile_view.fadeFraction` and additional helpers from playable projectile view `snapshotCommands`. The final path returns `result+[glow(center,radius+2,rgb),cross(center,radius+5,rgb)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `value` | `dynamic` | — | Record read through `value.style`, `value.state`, `value.previousPosition`, `value.position`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |
| `width` | `dynamic` | — | Width in the coordinate space used by `snapshotCommands`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `snapshotCommands`. |
| `horizontalFovDegrees` | `dynamic` | — | Horizontal camera field of view in degrees. |
| `nearDistance` | `dynamic` | — | Distance from the camera to the near clipping plane. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L180)

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

Computes `value!=void and typeof(value)=="array" and len(value)==3` for playable projectile view `validPoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence whose length/content is inspected by `validPoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_view.ml#L30)
