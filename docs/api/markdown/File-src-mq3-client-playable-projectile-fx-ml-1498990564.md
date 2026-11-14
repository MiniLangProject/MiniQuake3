# `src/mq3/client/playable_projectile_fx.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_projectile_fx`](Package-mq3-client-playable-projectile-fx-901626158.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_projectile_view.ml` as `projectileView` → [src/mq3/client/playable_projectile_view.ml](File-src-mq3-client-playable-projectile-view-ml-1417864517.md)
- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/playable_dynamic_lights.ml` as `dynamicLights` → [src/mq3/renderer/playable_dynamic_lights.ml](File-src-mq3-renderer-playable-dynamic-lights-ml-229722941.md)
- `std/array.ml` as `arrays` → `../MiniLangCompilerML/std/array.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-playable-projectile-fx-addpuff-function-addpuff-state-entityid-style-origin-bornat-p-src-mq3-client-playable-projectile-fx-ml-437719432"></a>
### addPuff

```ml
function addPuff(state, entityId, style, origin, bornAt, p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entityId` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `bornAt` | `dynamic` | — |  |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L62)

<a id="function-function-mq3-client-playable-projectile-fx-alignednext-function-alignednext-time-src-mq3-client-playable-projectile-fx-ml-15990219"></a>
### alignedNext

```ml
function alignedNext(time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L54)

<a id="function-function-mq3-client-playable-projectile-fx-command-function-command-kind-center-radius-red-green-blue-src-mq3-client-playable-projectile-fx-ml-429677765"></a>
### command

```ml
function command(kind, center, radius, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — |  |
| `center` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L121)

- [mq3.client.playable_projectile_fx.Command](Type-mq3-client-playable-projectile-fx-command-191431529.md) — struct
<a id="constant-constant-mq3-client-playable-projectile-fx-command-light-const-command-light-2-src-mq3-client-playable-projectile-fx-ml-256699631"></a>
### COMMAND_LIGHT

```ml
const COMMAND_LIGHT = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L22)

<a id="constant-constant-mq3-client-playable-projectile-fx-command-puff-const-command-puff-1-src-mq3-client-playable-projectile-fx-ml-1209481980"></a>
### COMMAND_PUFF

```ml
const COMMAND_PUFF = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L21)

<a id="function-function-mq3-client-playable-projectile-fx-copy3-function-copy3-value-src-mq3-client-playable-projectile-fx-ml-1123774849"></a>
### copy3

```ml
function copy3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L33)

<a id="function-function-mq3-client-playable-projectile-fx-create-function-create-src-mq3-client-playable-projectile-fx-ml-410173668"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L46)

<a id="function-function-mq3-client-playable-projectile-fx-diamond-function-diamond-center-radius-red-green-blue-src-mq3-client-playable-projectile-fx-ml-908135993"></a>
### diamond

```ml
function diamond(center, radius, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L162)

<a id="function-function-mq3-client-playable-projectile-fx-draw-function-draw-commands-src-mq3-client-playable-projectile-fx-ml-1504234834"></a>
### draw

```ml
function draw(commands)
```

Screen-space rings approximate R_AddLightToScene in the current software raster path. Three attenuated rings make the radius readable without a framebuffer blend or a BSP shader rewrite.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L172)

<a id="function-function-mq3-client-playable-projectile-fx-drawpuffs-function-drawpuffs-commands-src-mq3-client-playable-projectile-fx-ml-1983388986"></a>
### drawPuffs

```ml
function drawPuffs(commands)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L184)

<a id="constant-constant-mq3-client-playable-projectile-fx-explosion-dlight-radius-const-explosion-dlight-radius-300-src-mq3-client-playable-projectile-fx-ml-180425094"></a>
### EXPLOSION_DLIGHT_RADIUS

```ml
const EXPLOSION_DLIGHT_RADIUS = 300.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L20)

<a id="function-function-mq3-client-playable-projectile-fx-fail-function-fail-message-src-mq3-client-playable-projectile-fx-ml-1288355603"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L31)

<a id="function-function-mq3-client-playable-projectile-fx-framecommands-function-framecommands-state-camera-snapshots-now-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-projectile-fx-ml-1501948671"></a>
### frameCommands

```ml
function frameCommands(state, camera, snapshots, now, width, height, horizontalFovDegrees, nearDistance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `snapshots` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `horizontalFovDegrees` | `dynamic` | — |  |
| `nearDistance` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L135)

<a id="constant-constant-mq3-client-playable-projectile-fx-grenade-trail-milliseconds-const-grenade-trail-milliseconds-700-src-mq3-client-playable-projectile-fx-ml-403027280"></a>
### GRENADE_TRAIL_MILLISECONDS

```ml
const GRENADE_TRAIL_MILLISECONDS = 700
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L14)

<a id="constant-constant-mq3-client-playable-projectile-fx-grenade-trail-radius-const-grenade-trail-radius-32-src-mq3-client-playable-projectile-fx-ml-515623796"></a>
### GRENADE_TRAIL_RADIUS

```ml
const GRENADE_TRAIL_RADIUS = 32.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L17)

<a id="function-function-mq3-client-playable-projectile-fx-impactstart-function-impactstart-snapshot-src-mq3-client-playable-projectile-fx-ml-1936277212"></a>
### impactStart

```ml
function impactStart(snapshot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L122)

<a id="function-function-mq3-client-playable-projectile-fx-interpolate-function-interpolate-a-b-fraction-src-mq3-client-playable-projectile-fx-ml-177554507"></a>
### interpolate

```ml
function interpolate(a, b, fraction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `fraction` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L58)

<a id="constant-constant-mq3-client-playable-projectile-fx-max-puffs-const-max-puffs-512-src-mq3-client-playable-projectile-fx-ml-471092441"></a>
### MAX_PUFFS

```ml
const MAX_PUFFS = 512
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L23)

<a id="constant-constant-mq3-client-playable-projectile-fx-plasma-trail-milliseconds-const-plasma-trail-milliseconds-600-src-mq3-client-playable-projectile-fx-ml-96414615"></a>
### PLASMA_TRAIL_MILLISECONDS

```ml
const PLASMA_TRAIL_MILLISECONDS = 600
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L15)

<a id="constant-constant-mq3-client-playable-projectile-fx-plasma-trail-radius-const-plasma-trail-radius-4-src-mq3-client-playable-projectile-fx-ml-858730087"></a>
### PLASMA_TRAIL_RADIUS

```ml
const PLASMA_TRAIL_RADIUS = 4.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L18)

<a id="function-function-mq3-client-playable-projectile-fx-point-function-point-center-x-y-src-mq3-client-playable-projectile-fx-ml-943507790"></a>
### point

```ml
function point(center, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L161)

<a id="function-function-mq3-client-playable-projectile-fx-profile-function-profile-style-src-mq3-client-playable-projectile-fx-ml-857860615"></a>
### profile

```ml
function profile(style)
```

Values are taken from CG_RegisterWeapon, CG_RocketTrail, CG_PlasmaTrail and CG_MissileHitWall. Grenade and plasma intentionally have no flying dlight; Baseq3 only assigns missileDlight to the rocket launcher.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L38)

- [mq3.client.playable_projectile_fx.Profile](Type-mq3-client-playable-projectile-fx-profile-59277573.md) — struct
<a id="function-function-mq3-client-playable-projectile-fx-projectedradius-function-projectedradius-worldradius-depth-width-src-mq3-client-playable-projectile-fx-ml-441382561"></a>
### projectedRadius

```ml
function projectedRadius(worldRadius, depth, width)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `worldRadius` | `dynamic` | — |  |
| `depth` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L115)

- [mq3.client.playable_projectile_fx.Puff](Type-mq3-client-playable-projectile-fx-puff-2111551975.md) — struct
<a id="function-function-mq3-client-playable-projectile-fx-pufffraction-function-pufffraction-puff-now-src-mq3-client-playable-projectile-fx-ml-138737329"></a>
### puffFraction

```ml
function puffFraction(puff, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `puff` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L110)

<a id="constant-constant-mq3-client-playable-projectile-fx-rocket-dlight-radius-const-rocket-dlight-radius-200-src-mq3-client-playable-projectile-fx-ml-39776555"></a>
### ROCKET_DLIGHT_RADIUS

```ml
const ROCKET_DLIGHT_RADIUS = 200.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L19)

<a id="constant-constant-mq3-client-playable-projectile-fx-rocket-trail-milliseconds-const-rocket-trail-milliseconds-2000-src-mq3-client-playable-projectile-fx-ml-1211965083"></a>
### ROCKET_TRAIL_MILLISECONDS

```ml
const ROCKET_TRAIL_MILLISECONDS = 2000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L13)

<a id="constant-constant-mq3-client-playable-projectile-fx-rocket-trail-radius-const-rocket-trail-radius-64-src-mq3-client-playable-projectile-fx-ml-1500072665"></a>
### ROCKET_TRAIL_RADIUS

```ml
const ROCKET_TRAIL_RADIUS = 64.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L16)

<a id="function-function-mq3-client-playable-projectile-fx-sampleflight-function-sampleflight-state-snapshot-now-src-mq3-client-playable-projectile-fx-ml-2009096939"></a>
### sampleFlight

```ml
function sampleFlight(state, snapshot, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `snapshot` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L68)

- [mq3.client.playable_projectile_fx.State](Type-mq3-client-playable-projectile-fx-state-936042933.md) — struct
- [mq3.client.playable_projectile_fx.Tracker](Type-mq3-client-playable-projectile-fx-tracker-1578326684.md) — struct
<a id="function-function-mq3-client-playable-projectile-fx-trackerindex-function-trackerindex-state-entityid-src-mq3-client-playable-projectile-fx-ml-592421827"></a>
### trackerIndex

```ml
function trackerIndex(state, entityId)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entityId` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L48)

<a id="constant-constant-mq3-client-playable-projectile-fx-trail-step-milliseconds-const-trail-step-milliseconds-50-src-mq3-client-playable-projectile-fx-ml-781431858"></a>
### TRAIL_STEP_MILLISECONDS

```ml
const TRAIL_STEP_MILLISECONDS = 50
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L12)

<a id="function-function-mq3-client-playable-projectile-fx-update-function-update-state-snapshots-now-src-mq3-client-playable-projectile-fx-ml-808568762"></a>
### update

```ml
function update(state, snapshots, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `snapshots` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L100)

<a id="function-function-mq3-client-playable-projectile-fx-valid3-function-valid3-value-src-mq3-client-playable-projectile-fx-ml-1977187145"></a>
### valid3

```ml
function valid3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L32)

<a id="function-function-mq3-client-playable-projectile-fx-worldlights-function-worldlights-snapshots-now-src-mq3-client-playable-projectile-fx-ml-1575941545"></a>
### worldLights

```ml
function worldLights(snapshots, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshots` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_projectile_fx.ml#L124)
