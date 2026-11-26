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

Updates `state.puffs` during playable projectile fx `addPuff`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable projectile fx record/storage; this routine assigns `state.puffs`. |
| `entityId` | `dynamic` | — | Value used by `state.puffs=state.puffs+[Puff(entityId,style,copy3(origin),bornAt,bornAt+p.lifetime,p.radius)]`. |
| `style` | `dynamic` | — | Value used by `state.puffs=state.puffs+[Puff(entityId,style,copy3(origin),bornAt,bornAt+p.lifetime,p.radius)]`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `bornAt` | `dynamic` | — | Value used by `state.puffs=state.puffs+[Puff(entityId,style,copy3(origin),bornAt,bornAt+p.lifetime,p.radius)]`. |
| `p` | `dynamic` | — | Record read through `p.lifetime`, `p.radius`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L172)

<a id="function-function-mq3-client-playable-projectile-fx-alignednext-function-alignednext-time-src-mq3-client-playable-projectile-fx-ml-15990219"></a>
### alignedNext

```ml
function alignedNext(time)
```

Computes `numeric.trunc32((time+TRAIL_STEP_MILLISECONDS)/TRAIL_STEP_MILLISECONDS)*TRAIL_STEP_MILLISECONDS` for playable projectile fx `alignedNext`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | `dynamic` | — | Value used by `return numeric.trunc32((time+TRAIL_STEP_MILLISECONDS)/TRAIL_STEP_MILLISECONDS)*TRAIL_STEP_MILLISECONDS`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L153)

<a id="function-function-mq3-client-playable-projectile-fx-command-function-command-kind-center-radius-red-green-blue-src-mq3-client-playable-projectile-fx-ml-429677765"></a>
### command

```ml
function command(kind, center, radius, red, green, blue)
```

Creates a `mq3.client.playable_projectile_fx.Command` record. Assigns `kind` from `kind`, `center` from `center`, `radius` from `radius`, `red` from `red`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — | Value used to initialize `Command.kind`. |
| `center` | `dynamic` | — | Value used to initialize `Command.center`. |
| `radius` | `dynamic` | — | Value used to initialize `Command.radius`. |
| `red` | `dynamic` | — | Value used to initialize `Command.red`. |
| `green` | `dynamic` | — | Value used to initialize `Command.green`. |
| `blue` | `dynamic` | — | Value used to initialize `Command.blue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L253)

- [mq3.client.playable_projectile_fx.Command](Type-mq3-client-playable-projectile-fx-command-191431529.md) — struct
<a id="constant-constant-mq3-client-playable-projectile-fx-command-light-const-command-light-2-src-mq3-client-playable-projectile-fx-ml-256699631"></a>
### COMMAND_LIGHT

```ml
const COMMAND_LIGHT = 2
```

Effect command kind selecting the light rendering operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L33)

<a id="constant-constant-mq3-client-playable-projectile-fx-command-puff-const-command-puff-1-src-mq3-client-playable-projectile-fx-ml-1209481980"></a>
### COMMAND_PUFF

```ml
const COMMAND_PUFF = 1
```

Effect command kind selecting the puff rendering operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L31)

<a id="function-function-mq3-client-playable-projectile-fx-copy3-function-copy3-value-src-mq3-client-playable-projectile-fx-ml-1123774849"></a>
### copy3

```ml
function copy3(value)
```

Copies three vector components with float32 rounding for playable projectile fx.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence read at `value[0]`, `value[1]`, `value[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L125)

<a id="function-function-mq3-client-playable-projectile-fx-create-function-create-src-mq3-client-playable-projectile-fx-ml-410173668"></a>
### create

```ml
function create()
```

Creates a `mq3.client.playable_projectile_fx.State` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L140)

<a id="function-function-mq3-client-playable-projectile-fx-diamond-function-diamond-center-radius-red-green-blue-src-mq3-client-playable-projectile-fx-ml-908135993"></a>
### diamond

```ml
function diamond(center, radius, red, green, blue)
```

Calls `mq3.platform.playable_window.drawLine`, `mq3.client.playable_projectile_fx.point` from playable projectile fx `diamond`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | `dynamic` | — | Value used by `window.drawLine(point(center,0,0-radius),point(center,radius,0),red,green,blue)`. |
| `radius` | `dynamic` | — | Radius used by the spatial or visual calculation. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L318)

<a id="function-function-mq3-client-playable-projectile-fx-draw-function-draw-commands-src-mq3-client-playable-projectile-fx-ml-1504234834"></a>
### draw

```ml
function draw(commands)
```

Screen-space rings approximate R_AddLightToScene in the current software raster path. Three attenuated rings make the radius readable without a framebuffer blend or a BSP shader rewrite.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — | Value used by `for each entry in commands`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L329)

<a id="function-function-mq3-client-playable-projectile-fx-drawpuffs-function-drawpuffs-commands-src-mq3-client-playable-projectile-fx-ml-1983388986"></a>
### drawPuffs

```ml
function drawPuffs(commands)
```

Calls `mq3.client.playable_projectile_fx.diamond` from playable projectile fx `drawPuffs`. The final path returns `lines`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — | Value used by `for each entry in commands if entry.kind==COMMAND_PUFF then diamond(entry.center,entry.radius,entry.red,entry.green,entry.blue)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L343)

<a id="constant-constant-mq3-client-playable-projectile-fx-explosion-dlight-radius-const-explosion-dlight-radius-300-src-mq3-client-playable-projectile-fx-ml-1727529466"></a>
### EXPLOSION_DLIGHT_RADIUS

```ml
const EXPLOSION_DLIGHT_RADIUS = 300
```

World-space radius of the dynamic light emitted by an explosion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L29)

<a id="function-function-mq3-client-playable-projectile-fx-fail-function-fail-message-src-mq3-client-playable-projectile-fx-ml-1288355603"></a>
### fail

```ml
function fail(message)
```

Creates the playable projectile fx error `7610` with diagnostic text `"preview projectile fx: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"preview projectile fx: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L119)

<a id="function-function-mq3-client-playable-projectile-fx-framecommands-function-framecommands-state-camera-snapshots-now-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-projectile-fx-ml-1501948671"></a>
### frameCommands

```ml
function frameCommands(state, camera, snapshots, now, width, height, horizontalFovDegrees, nearDistance)
```

Calls `mq3.client.playable_viewer.projectPoint`, `mq3.client.playable_projectile_fx.puffFraction`, `mq3.client.playable_projectile_fx.projectedRadius` and additional helpers from playable projectile fx `frameCommands`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.puffs`. |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `snapshots` | `dynamic` | — | Value used by `for each snapshot in snapshots`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `width` | `dynamic` | — | Width in the coordinate space used by `frameCommands`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `frameCommands`. |
| `horizontalFovDegrees` | `dynamic` | — | Horizontal camera field of view in degrees. |
| `nearDistance` | `dynamic` | — | Distance from the camera to the near clipping plane. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L281)

<a id="constant-constant-mq3-client-playable-projectile-fx-grenade-trail-milliseconds-const-grenade-trail-milliseconds-700-src-mq3-client-playable-projectile-fx-ml-403027280"></a>
### GRENADE_TRAIL_MILLISECONDS

```ml
const GRENADE_TRAIL_MILLISECONDS = 700
```

Duration or scheduling interval in milliseconds controlling grenade trail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L17)

<a id="constant-constant-mq3-client-playable-projectile-fx-grenade-trail-radius-const-grenade-trail-radius-32-src-mq3-client-playable-projectile-fx-ml-332947792"></a>
### GRENADE_TRAIL_RADIUS

```ml
const GRENADE_TRAIL_RADIUS = 32
```

Radius used by the grenade's smoke-trail effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L23)

<a id="function-function-mq3-client-playable-projectile-fx-impactstart-function-impactstart-snapshot-src-mq3-client-playable-projectile-fx-ml-1936277212"></a>
### impactStart

```ml
function impactStart(snapshot)
```

Computes `snapshot.eventAt-(numeric.i32(snapshot.entityId*97+snapshot.eventAt*17) & 63)` for playable projectile fx `impactStart`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | Record read through `snapshot.eventAt`, `snapshot.entityId`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L256)

<a id="function-function-mq3-client-playable-projectile-fx-interpolate-function-interpolate-a-b-fraction-src-mq3-client-playable-projectile-fx-ml-177554507"></a>
### interpolate

```ml
function interpolate(a, b, fraction)
```

Builds the playable projectile fx `interpolate` sequence from `[a[0]+(b[0]-a[0])*fraction,a[1]+(b[1]-a[1])*fraction,a[2]+(b[2]-a[2])*fraction]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Sequence read at `a[0]`, `a[1]`, `a[2]`. |
| `b` | `dynamic` | — | Sequence read at `b[0]`, `b[1]`, `b[2]`. |
| `fraction` | `dynamic` | — | Interpolation or blend fraction between the endpoint values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L161)

<a id="constant-constant-mq3-client-playable-projectile-fx-max-puffs-const-max-puffs-512-src-mq3-client-playable-projectile-fx-ml-471092441"></a>
### MAX_PUFFS

```ml
const MAX_PUFFS = 512
```

Capacity limit for the puffs collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L35)

<a id="constant-constant-mq3-client-playable-projectile-fx-plasma-trail-milliseconds-const-plasma-trail-milliseconds-600-src-mq3-client-playable-projectile-fx-ml-96414615"></a>
### PLASMA_TRAIL_MILLISECONDS

```ml
const PLASMA_TRAIL_MILLISECONDS = 600
```

Duration or scheduling interval in milliseconds controlling plasma trail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L19)

<a id="constant-constant-mq3-client-playable-projectile-fx-plasma-trail-radius-const-plasma-trail-radius-4-src-mq3-client-playable-projectile-fx-ml-224370421"></a>
### PLASMA_TRAIL_RADIUS

```ml
const PLASMA_TRAIL_RADIUS = 4
```

Radius used by the plasma projectile's trail effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L25)

<a id="function-function-mq3-client-playable-projectile-fx-point-function-point-center-x-y-src-mq3-client-playable-projectile-fx-ml-943507790"></a>
### point

```ml
function point(center, x, y)
```

Adapts `mq3.client.playable_viewer.ScreenPoint` to playable projectile fx `point`, returning its result for `center.x+x, center.y+y, center.depth`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | `dynamic` | — | Record read through `center.x`, `center.y`, `center.depth`. |
| `x` | `dynamic` | — | Argument 1 of `mq3.client.playable_viewer.ScreenPoint`; passed as `center.x+x`. |
| `y` | `dynamic` | — | Argument 2 of `mq3.client.playable_viewer.ScreenPoint`; passed as `center.y+y`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L311)

<a id="function-function-mq3-client-playable-projectile-fx-profile-function-profile-style-src-mq3-client-playable-projectile-fx-ml-857860615"></a>
### profile

```ml
function profile(style)
```

Values are taken from CG_RegisterWeapon, CG_RocketTrail, CG_PlasmaTrail and CG_MissileHitWall. Grenade and plasma intentionally have no flying dlight; Baseq3 only assigns missileDlight to the rocket launcher.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | `dynamic` | — | Value used by `if style==projectileView.STYLE_ROCKET then return Profile(true,ROCKET_TRAIL_RADIUS,ROCKET_TRAIL_MILLISECONDS,ROCKET_DLIGHT_RADIUS,EXPLOSION_DL...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L131)

- [mq3.client.playable_projectile_fx.Profile](Type-mq3-client-playable-projectile-fx-profile-59277573.md) — struct
<a id="function-function-mq3-client-playable-projectile-fx-projectedradius-function-projectedradius-worldradius-depth-width-src-mq3-client-playable-projectile-fx-ml-441382561"></a>
### projectedRadius

```ml
function projectedRadius(worldRadius, depth, width)
```

Calls `mq3.compat.numeric.trunc32` from playable projectile fx `projectedRadius`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `worldRadius` | `dynamic` | — | Value used by `value=numeric.trunc32(worldRadius*(width/2)/depth)`. |
| `depth` | `dynamic` | — | Value used by `if depth<=0.0 then return 0 end if`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `projectedRadius`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L240)

- [mq3.client.playable_projectile_fx.Puff](Type-mq3-client-playable-projectile-fx-puff-2111551975.md) — struct
<a id="function-function-mq3-client-playable-projectile-fx-pufffraction-function-pufffraction-puff-now-src-mq3-client-playable-projectile-fx-ml-138737329"></a>
### puffFraction

```ml
function puffFraction(puff, now)
```

Returns a smoke puff's remaining lifetime fraction, or zero before its birth and after expiration.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `puff` | `dynamic` | — | Record read through `puff.bornAt`, `puff.expiresAt`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L231)

<a id="constant-constant-mq3-client-playable-projectile-fx-rocket-dlight-radius-const-rocket-dlight-radius-200-src-mq3-client-playable-projectile-fx-ml-1940360841"></a>
### ROCKET_DLIGHT_RADIUS

```ml
const ROCKET_DLIGHT_RADIUS = 200
```

World-space radius of the dynamic light attached to a rocket.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L27)

<a id="constant-constant-mq3-client-playable-projectile-fx-rocket-trail-milliseconds-const-rocket-trail-milliseconds-2000-src-mq3-client-playable-projectile-fx-ml-1211965083"></a>
### ROCKET_TRAIL_MILLISECONDS

```ml
const ROCKET_TRAIL_MILLISECONDS = 2000
```

Duration or scheduling interval in milliseconds controlling rocket trail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L15)

<a id="constant-constant-mq3-client-playable-projectile-fx-rocket-trail-radius-const-rocket-trail-radius-64-src-mq3-client-playable-projectile-fx-ml-149575511"></a>
### ROCKET_TRAIL_RADIUS

```ml
const ROCKET_TRAIL_RADIUS = 64
```

Radius used by the rocket's smoke-trail effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L21)

<a id="function-function-mq3-client-playable-projectile-fx-sampleflight-function-sampleflight-state-snapshot-now-src-mq3-client-playable-projectile-fx-ml-2009096939"></a>
### sampleFlight

```ml
function sampleFlight(state, snapshot, now)
```

Updates `state.trackers` during playable projectile fx `sampleFlight`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable projectile fx record/storage; this routine assigns `state.trackers`. |
| `snapshot` | `dynamic` | — | Record read through `snapshot.style`, `snapshot.entityId`, `snapshot.eventAt`, `snapshot.position`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L182)

- [mq3.client.playable_projectile_fx.State](Type-mq3-client-playable-projectile-fx-state-936042933.md) — struct
- [mq3.client.playable_projectile_fx.Tracker](Type-mq3-client-playable-projectile-fx-tracker-1578326684.md) — struct
<a id="function-function-mq3-client-playable-projectile-fx-trackerindex-function-trackerindex-state-entityid-src-mq3-client-playable-projectile-fx-ml-592421827"></a>
### trackerIndex

```ml
function trackerIndex(state, entityId)
```

Evaluates playable projectile fx `trackerIndex` and returns `-1`, `index` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.trackers`. |
| `entityId` | `dynamic` | — | Value used by `for index=0 to len(state.trackers)-1 if state.trackers[index].entityId==entityId then return index end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L145)

<a id="constant-constant-mq3-client-playable-projectile-fx-trail-step-milliseconds-const-trail-step-milliseconds-50-src-mq3-client-playable-projectile-fx-ml-781431858"></a>
### TRAIL_STEP_MILLISECONDS

```ml
const TRAIL_STEP_MILLISECONDS = 50
```

Duration or scheduling interval in milliseconds controlling trail step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L13)

<a id="function-function-mq3-client-playable-projectile-fx-update-function-update-state-snapshots-now-src-mq3-client-playable-projectile-fx-ml-808568762"></a>
### update

```ml
function update(state, snapshots, now)
```

Updates `state.puffs`, `state.trackers` during playable projectile fx `update`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable projectile fx record/storage; this routine assigns `state.puffs`, `state.trackers`. |
| `snapshots` | `dynamic` | — | Value used by `if state==void or snapshots==void or now<0 then return fail("state, snapshots and non-negative time are required") end if`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L218)

<a id="function-function-mq3-client-playable-projectile-fx-valid3-function-valid3-value-src-mq3-client-playable-projectile-fx-ml-1977187145"></a>
### valid3

```ml
function valid3(value)
```

Computes `value!=void and typeof(value)=="array" and len(value)==3` for playable projectile fx `valid3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence whose length/content is inspected by `valid3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L122)

<a id="function-function-mq3-client-playable-projectile-fx-worldlights-function-worldlights-snapshots-now-src-mq3-client-playable-projectile-fx-ml-1575941545"></a>
### worldLights

```ml
function worldLights(snapshots, now)
```

Calls `mq3.client.playable_projectile_fx.profile`, `mq3.client.playable_projectile_fx.impactStart`, `mq3.renderer.playable_dynamic_lights.Light` and additional helpers from playable projectile fx `worldLights`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshots` | `dynamic` | — | Value used by `for each snapshot in snapshots`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L261)
