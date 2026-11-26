# `src/mq3/client/playable_player_shadows.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_player_shadows`](Package-mq3-client-playable-player-shadows-339712303.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/collision/world.ml` as `collision` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/platform/playable_multitexture.ml` as `multitexture` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-client-playable-player-shadows-axes-function-axes-shadow-src-mq3-client-playable-player-shadows-ml-2068141570"></a>
### axes

```ml
function axes(shadow)
```

Calls `mq3.client.playable_player_shadows.perpendicular`, `mq3.shared.math.CrossProduct`, `mq3.compat.transcendental.sin` and additional helpers from playable player shadows `axes`. The final path returns `[axis1,axis2]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shadow` | `dynamic` | — | Record read through `shadow.normal`, `shadow.orientation`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L102)

- [mq3.client.playable_player_shadows.Catalog](Type-mq3-client-playable-player-shadows-catalog-199763454.md) — struct
<a id="function-function-mq3-client-playable-player-shadows-color-function-color-shadow-src-mq3-client-playable-player-shadows-ml-374587060"></a>
### color

```ml
function color(shadow)
```

Calls `mq3.compat.numeric.trunc32` from playable player shadows `color`. The final path returns `[value,value,value,255]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shadow` | `dynamic` | — | Record read through `shadow.alpha`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L115)

<a id="function-function-mq3-client-playable-player-shadows-draw-function-draw-shadows-catalog-projection-src-mq3-client-playable-player-shadows-ml-786066437"></a>
### draw

```ml
function draw(shadows, catalog, projection)
```

Calls `mq3.platform.playable_window.createTriangleBatch`, `mq3.platform.playable_multitexture.setAlphaTest`, `mq3.platform.playable_multitexture.setTextureClamp` and additional helpers from playable player shadows `draw`. The final path returns `rendered`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shadows` | `dynamic` | — | Sequence whose length/content is inspected by `draw`. |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.textureSlot`. |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L121)

<a id="function-function-mq3-client-playable-player-shadows-fail-function-fail-message-src-mq3-client-playable-player-shadows-ml-1774094565"></a>
### fail

```ml
function fail(message)
```

Creates the playable player shadows error `7670` with diagnostic text `"playable player shadows: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"playable player shadows: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L51)

<a id="function-function-mq3-client-playable-player-shadows-load-function-load-archive-textureslot-src-mq3-client-playable-player-shadows-ml-1670245405"></a>
### load

```ml
function load(archive, textureSlot)
```

Calls `mq3.renderer.playable_materials.loadImage`, `mq3.client.playable_player_shadows.Catalog` from playable player shadows `load`. The final path returns `Catalog(loaded[0],loaded[1],textureSlot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `textureSlot` | `dynamic` | — | Value used by `if archive==void or textureSlot<0 then return fail("archive and texture slot are required") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L55)

<a id="constant-constant-mq3-client-playable-player-shadows-mask-playersolid-const-mask-playersolid-33619969-src-mq3-client-playable-player-shadows-ml-2057640905"></a>
### MASK_PLAYERSOLID

```ml
const MASK_PLAYERSOLID = 33619969
```

Combined collision-content mask used by player movement traces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L20)

<a id="function-function-mq3-client-playable-player-shadows-perpendicular-function-perpendicular-normal-src-mq3-client-playable-player-shadows-ml-545382807"></a>
### perpendicular

```ml
function perpendicular(normal)
```

Calls `mq3.shared.math.CrossProduct`, `mq3.shared.math.VectorNormalize` from playable player shadows `perpendicular`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L96)

<a id="constant-constant-mq3-client-playable-player-shadows-pi-const-pi-3-141593-src-mq3-client-playable-player-shadows-ml-101999151"></a>
### PI

```ml
const PI = 3.141593
```

Circle constant used to convert or evaluate angles in trigonometric calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L22)

<a id="function-function-mq3-client-playable-player-shadows-point-function-point-shadow-axis1-axis2-x-y-src-mq3-client-playable-player-shadows-ml-2146266484"></a>
### point

```ml
function point(shadow, axis1, axis2, x, y)
```

Adapts `mq3.client.playable_viewer.ScreenPoint` to playable player shadows `point`, returning its result for `shadow.origin[0]+axis1[0]*x+axis2[0]*y, shadow.origin[1]+axis1[1]*x+axis2[1]*y, shadow.origin[2]+axis1[2]*x+axis2[2]*y`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shadow` | `dynamic` | — | Record read through `shadow.origin`. |
| `axis1` | `dynamic` | — | Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `shadow.origin[0]+axis1[0]*x+axis2[0]*y`, `shadow.origin[1]+axis1[1]*x+axis2[1]*y`, `shadow.origin[2]+axis1[2]*x+axis2[2]*y`. |
| `axis2` | `dynamic` | — | Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `shadow.origin[0]+axis1[0]*x+axis2[0]*y`, `shadow.origin[1]+axis1[1]*x+axis2[1]*y`, `shadow.origin[2]+axis1[2]*x+axis2[2]*y`. |
| `x` | `dynamic` | — | Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `shadow.origin[0]+axis1[0]*x+axis2[0]*y`, `shadow.origin[1]+axis1[1]*x+axis2[1]*y`, `shadow.origin[2]+axis1[2]*x+axis2[2]*y`. |
| `y` | `dynamic` | — | Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `shadow.origin[0]+axis1[0]*x+axis2[0]*y`, `shadow.origin[1]+axis1[1]*x+axis2[1]*y`, `shadow.origin[2]+axis1[2]*x+axis2[2]*y`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L112)

<a id="function-function-mq3-client-playable-player-shadows-release-function-release-catalog-src-mq3-client-playable-player-shadows-ml-677537927"></a>
### release

```ml
function release(catalog)
```

Calls `mq3.platform.playable_window.releaseTexture` from playable player shadows `release`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.textureSlot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L65)

- [mq3.client.playable_player_shadows.Shadow](Type-mq3-client-playable-player-shadows-shadow-430357955.md) — struct
<a id="constant-constant-mq3-client-playable-player-shadows-shadow-distance-const-shadow-distance-128-src-mq3-client-playable-player-shadows-ml-1269344070"></a>
### SHADOW_DISTANCE

```ml
const SHADOW_DISTANCE = 128
```

Maximum downward trace distance used to place a player's ground shadow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L16)

<a id="constant-constant-mq3-client-playable-player-shadows-shadow-radius-const-shadow-radius-24-src-mq3-client-playable-player-shadows-ml-222979687"></a>
### SHADOW_RADIUS

```ml
const SHADOW_RADIUS = 24
```

World-space radius used when projecting the player's ground-shadow mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L18)

<a id="function-function-mq3-client-playable-player-shadows-trace-function-trace-world-origin-orientation-src-mq3-client-playable-player-shadows-ml-1572982104"></a>
### trace

```ml
function trace(world, origin, orientation)
```

Adapts `mq3.client.playable_player_shadows.traceWith` to playable player shadows `trace`, returning its result for `worldTrace, world, origin, orientation`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Argument 2 of `mq3.client.playable_player_shadows.traceWith`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.playable_player_shadows.traceWith`. |
| `orientation` | `dynamic` | — | Argument 4 of `mq3.client.playable_player_shadows.traceWith`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L92)

<a id="function-function-mq3-client-playable-player-shadows-tracewith-function-tracewith-tracefn-context-origin-orientation-src-mq3-client-playable-player-shadows-ml-207494638"></a>
### traceWith

```ml
function traceWith(traceFn, context, origin, orientation)
```

Calls `traceFn`, `mq3.shared.math.VectorNormalize`, `mq3.client.playable_player_shadows.Shadow` from playable player shadows `traceWith`. The final path returns `Shadow([hit.endpos[0],hit.endpos[1],hit.endpos[2]],normal,orientation,alpha,SHADOW_RADIUS)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — | Collision-trace callback used to test the requested movement or visibility segment. |
| `context` | `dynamic` | — | context record passed to the playable player shadows helper calls. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `orientation` | `dynamic` | — | Value used by `return Shadow([hit.endpos[0],hit.endpos[1],hit.endpos[2]],normal,orientation,alpha,SHADOW_RADIUS)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L79)

<a id="function-function-mq3-client-playable-player-shadows-upload-function-upload-catalog-src-mq3-client-playable-player-shadows-ml-1521347545"></a>
### upload

```ml
function upload(catalog)
```

Calls `mq3.platform.playable_window.uploadTextureNoMip` from playable player shadows `upload`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.textureSlot`, `catalog.image.pixels`, `catalog.image.width`, `catalog.image.height`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L62)

<a id="function-function-mq3-client-playable-player-shadows-worldtrace-function-worldtrace-context-startpoint-endpoint-mins-maxs-src-mq3-client-playable-player-shadows-ml-496757738"></a>
### worldTrace

```ml
function worldTrace(context, startPoint, endPoint, mins, maxs)
```

Adapts `mq3.collision.world.boxTrace` to playable player shadows `worldTrace`, returning its result for `context, startPoint, endPoint, mins, maxs, 0, MASK_PLAYERSOLID, false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Argument 1 of `mq3.collision.world.boxTrace`. |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`. |
| `mins` | `dynamic` | — | Minimum X, Y and Z coordinates of the axis-aligned bounds. Forwarded to `mq3.collision.world.boxTrace`. |
| `maxs` | `dynamic` | — | Maximum X, Y and Z coordinates of the axis-aligned bounds. Forwarded to `mq3.collision.world.boxTrace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L73)
