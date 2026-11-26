# `src/mq3/client/playable_marks.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_marks`](Package-mq3-client-playable-marks-1530105550.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_projectile_view.ml` as `projectileView` → [src/mq3/client/playable_projectile_view.ml](File-src-mq3-client-playable-projectile-view-ml-1417864517.md)
- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/platform/playable_multitexture.ml` as `multitexture` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/array.ml` as `arrays` → `../MiniLangCompilerML/std/array.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-playable-marks-append-function-append-state-key-profile-origin-normal-bornat-src-mq3-client-playable-marks-ml-925856278"></a>
### append

```ml
function append(state, key, profile, origin, normal, bornAt)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `profile` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `bornAt` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L84)

<a id="function-function-mq3-client-playable-marks-axes-function-axes-mark-src-mq3-client-playable-marks-ml-2108852705"></a>
### axes

```ml
function axes(mark)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mark` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L104)

- [mq3.client.playable_marks.Catalog](Type-mq3-client-playable-marks-catalog-509575647.md) — struct
<a id="function-function-mq3-client-playable-marks-color-function-color-mark-now-src-mq3-client-playable-marks-ml-876139729"></a>
### color

```ml
function color(mark, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mark` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L115)

<a id="function-function-mq3-client-playable-marks-copy3-function-copy3-value-src-mq3-client-playable-marks-ml-852386001"></a>
### copy3

```ml
function copy3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L33)

<a id="function-function-mq3-client-playable-marks-create-function-create-src-mq3-client-playable-marks-ml-506741060"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L31)

<a id="function-function-mq3-client-playable-marks-draw-function-draw-state-catalog-projection-now-src-mq3-client-playable-marks-ml-337404235"></a>
### draw

```ml
function draw(state, catalog, projection, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L122)

<a id="function-function-mq3-client-playable-marks-fail-function-fail-message-src-mq3-client-playable-marks-ml-1529968831"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L30)

<a id="function-function-mq3-client-playable-marks-haskey-function-haskey-state-key-bornat-src-mq3-client-playable-marks-ml-1266124462"></a>
### hasKey

```ml
function hasKey(state, key, bornAt)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `bornAt` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L80)

<a id="constant-constant-mq3-client-playable-marks-kind-bullet-const-kind-bullet-1-src-mq3-client-playable-marks-ml-1917662620"></a>
### KIND_BULLET

```ml
const KIND_BULLET = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L19)

<a id="constant-constant-mq3-client-playable-marks-kind-burn-const-kind-burn-2-src-mq3-client-playable-marks-ml-1949921763"></a>
### KIND_BURN

```ml
const KIND_BURN = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L20)

<a id="constant-constant-mq3-client-playable-marks-kind-energy-const-kind-energy-4-src-mq3-client-playable-marks-ml-771415585"></a>
### KIND_ENERGY

```ml
const KIND_ENERGY = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L22)

<a id="constant-constant-mq3-client-playable-marks-kind-hole-const-kind-hole-3-src-mq3-client-playable-marks-ml-1455659698"></a>
### KIND_HOLE

```ml
const KIND_HOLE = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L21)

<a id="function-function-mq3-client-playable-marks-load-function-load-archive-firsttextureslot-maxtextureslots-src-mq3-client-playable-marks-ml-1567310659"></a>
### load

```ml
function load(archive, firstTextureSlot, maxTextureSlots)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `firstTextureSlot` | `dynamic` | — |  |
| `maxTextureSlots` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L43)

- [mq3.client.playable_marks.Mark](Type-mq3-client-playable-marks-mark-1824883361.md) — struct
<a id="constant-constant-mq3-client-playable-marks-mark-fade-time-const-mark-fade-time-1000-src-mq3-client-playable-marks-ml-278481820"></a>
### MARK_FADE_TIME

```ml
const MARK_FADE_TIME = 1000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L17)

<a id="constant-constant-mq3-client-playable-marks-mark-total-time-const-mark-total-time-10000-src-mq3-client-playable-marks-ml-1779024868"></a>
### MARK_TOTAL_TIME

```ml
const MARK_TOTAL_TIME = 10000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L16)

<a id="constant-constant-mq3-client-playable-marks-max-marks-const-max-marks-256-src-mq3-client-playable-marks-ml-339257162"></a>
### MAX_MARKS

```ml
const MAX_MARKS = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L18)

<a id="function-function-mq3-client-playable-marks-orientation-function-orientation-key-bornat-src-mq3-client-playable-marks-ml-672507689"></a>
### orientation

```ml
function orientation(key, bornAt)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — |  |
| `bornAt` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L79)

<a id="function-function-mq3-client-playable-marks-perpendicular-function-perpendicular-normal-src-mq3-client-playable-marks-ml-508542703"></a>
### perpendicular

```ml
function perpendicular(normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L100)

<a id="constant-constant-mq3-client-playable-marks-pi-const-pi-3-141593-src-mq3-client-playable-marks-ml-830521811"></a>
### PI

```ml
const PI = 3.141593
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L23)

<a id="function-function-mq3-client-playable-marks-point-function-point-mark-axis1-axis2-x-y-src-mq3-client-playable-marks-ml-943101083"></a>
### point

```ml
function point(mark, axis1, axis2, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mark` | `dynamic` | — |  |
| `axis1` | `dynamic` | — |  |
| `axis2` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L109)

<a id="function-function-mq3-client-playable-marks-projectileprofile-function-projectileprofile-style-src-mq3-client-playable-marks-ml-1535585529"></a>
### projectileProfile

```ml
function projectileProfile(style)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L72)

<a id="function-function-mq3-client-playable-marks-release-function-release-catalog-src-mq3-client-playable-marks-ml-1750274097"></a>
### release

```ml
function release(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L58)

- [mq3.client.playable_marks.State](Type-mq3-client-playable-marks-state-1635688085.md) — struct
- [mq3.client.playable_marks.Texture](Type-mq3-client-playable-marks-texture-116477787.md) — struct
<a id="function-function-mq3-client-playable-marks-texturefor-function-texturefor-catalog-kind-src-mq3-client-playable-marks-ml-1611649705"></a>
### textureFor

```ml
function textureFor(catalog, kind)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L59)

<a id="function-function-mq3-client-playable-marks-texturename-function-texturename-kind-src-mq3-client-playable-marks-ml-256855866"></a>
### textureName

```ml
function textureName(kind)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L35)

<a id="function-function-mq3-client-playable-marks-update-function-update-state-snapshots-shoteffects-now-src-mq3-client-playable-marks-ml-746290136"></a>
### update

```ml
function update(state, snapshots, shotEffects, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `snapshots` | `dynamic` | — |  |
| `shotEffects` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L92)

<a id="function-function-mq3-client-playable-marks-upload-function-upload-catalog-src-mq3-client-playable-marks-ml-173336687"></a>
### upload

```ml
function upload(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L53)

<a id="function-function-mq3-client-playable-marks-valid3-function-valid3-value-src-mq3-client-playable-marks-ml-56066361"></a>
### valid3

```ml
function valid3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L32)

<a id="function-function-mq3-client-playable-marks-weaponprofile-function-weaponprofile-classname-src-mq3-client-playable-marks-ml-1722064021"></a>
### weaponProfile

```ml
function weaponProfile(classname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_marks.ml#L61)
