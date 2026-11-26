# `src/mq3/client/ui_players.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_players`](Package-mq3-client-ui-players-1091427150.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/compat/transcendental.ml` as `crt` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-players-absolute-function-absolute-value-src-mq3-client-ui-players-ml-2048369229"></a>
### absolute

```ml
function absolute(value)
```

Evaluates UI players `absolute` and returns `0-value`, `value` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<0` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L332)

- [mq3.client.ui_players.Action](Type-mq3-client-ui-players-action-2037211834.md) — struct
<a id="function-function-mq3-client-ui-players-anglesubtract-function-anglesubtract-a-b-src-mq3-client-ui-players-ml-1989633821"></a>
### angleSubtract

```ml
function angleSubtract(a, b)
```

Evaluates UI players `angleSubtract` and returns `value` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Value used by `value=a-b`. |
| `b` | `dynamic` | — | Value used by `value=a-b`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L329)

<a id="constant-constant-mq3-client-ui-players-anim-togglebit-const-anim-togglebit-128-src-mq3-client-ui-players-ml-1051420818"></a>
### ANIM_TOGGLEBIT

```ml
const ANIM_TOGGLEBIT = 128
```

Bit toggled when restarting an animation so repeated identifiers still trigger a transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L35)

- [mq3.client.ui_players.Animation](Type-mq3-client-ui-players-animation-1459264302.md) — struct
<a id="function-function-mq3-client-ui-players-animationtext-function-animationtext-source-path-src-mq3-client-ui-players-ml-2064857744"></a>
### animationText

```ml
function animationText(source, path)
```

Calls `mq3.client.ui_players.same` from UI players `animationText`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record read through `source.animationFiles`. |
| `path` | `dynamic` | — | File or asset path used by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L316)

<a id="function-function-mq3-client-ui-players-assetsource-function-assetsource-files-animationfiles-retailactive-src-mq3-client-ui-players-ml-227950237"></a>
### assetSource

```ml
function assetSource(files, animationFiles, retailActive)
```

Creates a `mq3.client.ui_players.AssetSource` record. Assigns `files` from `files`, `animationFiles` from `animationFiles`, `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `files` | `dynamic` | — | Value used to initialize `AssetSource.files`. |
| `animationFiles` | `dynamic` | — | Value used to initialize `AssetSource.animationFiles`. |
| `retailActive` | `dynamic` | — | Value used to initialize `AssetSource.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L292)

- [mq3.client.ui_players.AssetSource](Type-mq3-client-ui-players-assetsource-586603349.md) — struct
<a id="constant-constant-mq3-client-ui-players-both-death1-const-both-death1-0-src-mq3-client-ui-players-ml-120738765"></a>
### BOTH_DEATH1

```ml
const BOTH_DEATH1 = 0
```

Native whole-body animation slot for the death1 sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L39)

<a id="function-function-mq3-client-ui-players-create-function-create-src-mq3-client-ui-players-ml-37526172"></a>
### create

```ml
function create()
```

Creates a `mq3.client.ui_players.PlayerInfo` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L294)

<a id="function-function-mq3-client-ui-players-emit-function-emit-list-boundary-kind-name-detail-number-vector-retailactive-src-mq3-client-ui-players-ml-1241888437"></a>
### emit

```ml
function emit(list, boundary, kind, name, detail, number, vector, retailActive)
```

Computes `list+[Action(boundary,kind,name,detail,number,vector,not retailActive)]` for UI players `emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | Value used by `return list+[Action(boundary,kind,name,detail,number,vector,not retailActive)]`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI players resource. |
| `detail` | `dynamic` | — | Value used by `return list+[Action(boundary,kind,name,detail,number,vector,not retailActive)]`. |
| `number` | `dynamic` | — | Value used by `return list+[Action(boundary,kind,name,detail,number,vector,not retailActive)]`. |
| `vector` | `dynamic` | — | Value used by `return list+[Action(boundary,kind,name,detail,number,vector,not retailActive)]`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L304)

<a id="function-function-mq3-client-ui-players-exists-function-exists-source-path-src-mq3-client-ui-players-ml-2101122758"></a>
### exists

```ml
function exists(source, path)
```

Calls `mq3.client.ui_players.same` from UI players `exists`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record read through `source.files`. |
| `path` | `dynamic` | — | File or asset path used by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L312)

<a id="function-function-mq3-client-ui-players-flashcolor-function-flashcolor-weapon-src-mq3-client-ui-players-ml-1078171984"></a>
### flashColor

```ml
function flashColor(weapon)
```

Evaluates UI players `flashColor` and returns `[0.6,0.6,1.0]`, `[1.0,0.7,0.5]`, `[1.0,0.75,0.0]` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — | Value used by `if weapon==WP_GAUNTLET or weapon==WP_LIGHTNING or weapon==WP_PLASMAGUN or weapon==WP_GRAPPLING_HOOK then return [0.6,0.6,1.0] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L344)

<a id="function-function-mq3-client-ui-players-identityaxis-function-identityaxis-src-mq3-client-ui-players-ml-1746874324"></a>
### identityAxis

```ml
function identityAxis()
```

Creates the three orthonormal unit axes used as the identity orientation in UI players.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L285)

<a id="constant-constant-mq3-client-ui-players-jump-height-const-jump-height-56-src-mq3-client-ui-players-ml-1543089976"></a>
### JUMP_HEIGHT

```ml
const JUMP_HEIGHT = 56
```

Vertical displacement used by the menu's player-model jump preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L33)

<a id="constant-constant-mq3-client-ui-players-legs-idle-const-legs-idle-22-src-mq3-client-ui-players-ml-1237629437"></a>
### LEGS_IDLE

```ml
const LEGS_IDLE = 22
```

Native lower-body animation slot for the idle sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L61)

<a id="constant-constant-mq3-client-ui-players-legs-jump-const-legs-jump-18-src-mq3-client-ui-players-ml-1743734810"></a>
### LEGS_JUMP

```ml
const LEGS_JUMP = 18
```

Native lower-body animation slot for the jump sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L57)

<a id="constant-constant-mq3-client-ui-players-legs-land-const-legs-land-19-src-mq3-client-ui-players-ml-37739211"></a>
### LEGS_LAND

```ml
const LEGS_LAND = 19
```

Native lower-body animation slot for the land sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L59)

<a id="constant-constant-mq3-client-ui-players-legs-turn-const-legs-turn-24-src-mq3-client-ui-players-ml-1049021255"></a>
### LEGS_TURN

```ml
const LEGS_TURN = 24
```

Native lower-body animation slot for the turn sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L63)

<a id="constant-constant-mq3-client-ui-players-legs-walkcr-const-legs-walkcr-13-src-mq3-client-ui-players-ml-938400021"></a>
### LEGS_WALKCR

```ml
const LEGS_WALKCR = 13
```

Native lower-body animation slot for the walkcr sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L55)

<a id="function-function-mq3-client-ui-players-lerpframe-function-lerpframe-src-mq3-client-ui-players-ml-1099622528"></a>
### lerpFrame

```ml
function lerpFrame()
```

Creates a `mq3.client.ui_players.LerpFrame` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L287)

- [mq3.client.ui_players.LerpFrame](Type-mq3-client-ui-players-lerpframe-1938263498.md) — struct
<a id="function-function-mq3-client-ui-players-matrixmultiply-function-matrixmultiply-a-b-src-mq3-client-ui-players-ml-1181529083"></a>
### matrixMultiply

```ml
function matrixMultiply(a, b)
```

Evaluates UI players `matrixMultiply` and returns `result` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Sequence read at `a[i]`. |
| `b` | `dynamic` | — | Sequence read at `b[0]`, `b[1]`, `b[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L325)

<a id="constant-constant-mq3-client-ui-players-max-animations-const-max-animations-31-src-mq3-client-ui-players-ml-1037580607"></a>
### MAX_ANIMATIONS

```ml
const MAX_ANIMATIONS = 31
```

Capacity limit for the animations collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L37)

<a id="function-function-mq3-client-ui-players-numberstarts-function-numberstarts-token-src-mq3-client-ui-players-ml-549348745"></a>
### numberStarts

```ml
function numberStarts(token)
```

Evaluates UI players `numberStarts` and returns `false`, `c>=48 and c<=57` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — | Value used by `if token=="" then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L494)

- [mq3.client.ui_players.Orientation](Type-mq3-client-ui-players-orientation-1749867754.md) — struct
- [mq3.client.ui_players.PlayerInfo](Type-mq3-client-ui-players-playerinfo-863292821.md) — struct
<a id="function-function-mq3-client-ui-players-register-function-register-source-kind-path-src-mq3-client-ui-players-ml-9576084"></a>
### register

```ml
function register(source, kind, path)
```

Updates `source.actions` during UI players `register`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `source.actions`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `path` | `dynamic` | — | File or asset path used by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L321)

<a id="function-function-mq3-client-ui-players-renderentity-function-renderentity-kind-model-skin-tag-src-mq3-client-ui-players-ml-1032246330"></a>
### renderEntity

```ml
function renderEntity(kind, model, skin, tag)
```

Creates a `mq3.client.ui_players.RenderEntity` record. Assigns `kind` from `kind`, `model` from `model`, `skin` from `skin`, `tag` from `tag`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — | Value used to initialize `RenderEntity.kind`. |
| `model` | `dynamic` | — | Value used to initialize `RenderEntity.model`. |
| `skin` | `dynamic` | — | Value used to initialize `RenderEntity.skin`. |
| `tag` | `dynamic` | — | Value used to initialize `RenderEntity.tag`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L466)

- [mq3.client.ui_players.RenderEntity](Type-mq3-client-ui-players-renderentity-1022602091.md) — struct
<a id="function-function-mq3-client-ui-players-resetinfo-function-resetinfo-pi-src-mq3-client-ui-players-ml-1889757957"></a>
### resetInfo

```ml
function resetInfo(pi)
```

Updates `pi.legsModel`, `pi.legsSkin`, `pi.legs`, `pi.torsoModel` and additional values during UI players `resetInfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `pi.legsModel`, `pi.legsSkin`, `pi.legs`, `pi.torsoModel` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L512)

<a id="function-function-mq3-client-ui-players-same-function-same-a-b-src-mq3-client-ui-players-ml-840162419"></a>
### same

```ml
function same(a, b)
```

Compares two UI players names using ASCII case-insensitive equality.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Argument 1 of `std.string.equalsIgnoreCaseAscii`. |
| `b` | `dynamic` | — | Argument 2 of `std.string.equalsIgnoreCaseAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L308)

<a id="function-function-mq3-client-ui-players-stripmd3-function-stripmd3-path-src-mq3-client-ui-players-ml-926831871"></a>
### stripMd3

```ml
function stripMd3(path)
```

Calls `std.string.equalsIgnoreCaseAscii`, `std.string.substr` from UI players `stripMd3`. The final path returns `path`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | File or asset path used by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L341)

<a id="extern_function-extern-function-mq3-client-ui-players-tan-extern-function-tan-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-client-ui-players-ml-1638259840"></a>
### tan

```ml
extern function tan(value as double) from "ucrtbase.dll" returns double
```

Evaluates the tangent of an angle in radians using the Windows C runtime. This binding is used by UI players.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Angle in radians, passed as a native double. |


**Returns:** The tangent of the supplied angle.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L16)

<a id="constant-constant-mq3-client-ui-players-torso-attack-const-torso-attack-7-src-mq3-client-ui-players-ml-1189246356"></a>
### TORSO_ATTACK

```ml
const TORSO_ATTACK = 7
```

Native upper-body animation slot for the attack sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L43)

<a id="constant-constant-mq3-client-ui-players-torso-attack2-const-torso-attack2-8-src-mq3-client-ui-players-ml-252759197"></a>
### TORSO_ATTACK2

```ml
const TORSO_ATTACK2 = 8
```

Native upper-body animation slot for the attack2 sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L45)

<a id="constant-constant-mq3-client-ui-players-torso-drop-const-torso-drop-9-src-mq3-client-ui-players-ml-1656398596"></a>
### TORSO_DROP

```ml
const TORSO_DROP = 9
```

Native upper-body animation slot for the drop sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L47)

<a id="constant-constant-mq3-client-ui-players-torso-gesture-const-torso-gesture-6-src-mq3-client-ui-players-ml-1124319863"></a>
### TORSO_GESTURE

```ml
const TORSO_GESTURE = 6
```

Native upper-body animation slot for the gesture sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L41)

<a id="constant-constant-mq3-client-ui-players-torso-getflag-const-torso-getflag-25-src-mq3-client-ui-players-ml-1484118526"></a>
### TORSO_GETFLAG

```ml
const TORSO_GETFLAG = 25
```

Native upper-body animation slot for the getflag sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L65)

<a id="constant-constant-mq3-client-ui-players-torso-raise-const-torso-raise-10-src-mq3-client-ui-players-ml-177538142"></a>
### TORSO_RAISE

```ml
const TORSO_RAISE = 10
```

Native upper-body animation slot for the raise sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L49)

<a id="constant-constant-mq3-client-ui-players-torso-stand-const-torso-stand-11-src-mq3-client-ui-players-ml-1725754375"></a>
### TORSO_STAND

```ml
const TORSO_STAND = 11
```

Native upper-body animation slot for the stand sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L51)

<a id="constant-constant-mq3-client-ui-players-torso-stand2-const-torso-stand2-12-src-mq3-client-ui-players-ml-1086288986"></a>
### TORSO_STAND2

```ml
const TORSO_STAND2 = 12
```

Native upper-body animation slot for the stand2 sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L53)

<a id="function-function-mq3-client-ui-players-ui-drawplayer-function-ui-drawplayer-source-x-y-w-h-pi-time-frametime-retailactive-src-mq3-client-ui-players-ml-586311076"></a>
### UI_DrawPlayer

```ml
function UI_DrawPlayer(source, x, y, w, h, pi, time, frametime, retailActive)
```

UI_DrawPlayer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `frames=UI_PlayerAnimation(source,pi,frametime,time)`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_DrawPlayer`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_DrawPlayer`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `UI_DrawPlayer`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `UI_DrawPlayer`. |
| `pi` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `pi.realtime`, `pi.weapon`, `pi.lastWeapon`, `pi.pendingWeapon` and additional values. |
| `time` | `dynamic` | — | Value assigned to `pi.realtime`. |
| `frametime` | `dynamic` | — | Value used by `axes=UI_PlayerAngles(pi,frametime)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L477)

<a id="function-function-mq3-client-ui-players-ui-forcelegsanim-function-ui-forcelegsanim-pi-anim-src-mq3-client-ui-players-ml-1780204514"></a>
### UI_ForceLegsAnim

```ml
function UI_ForceLegsAnim(pi, anim)
```

UI_ForceLegsAnim

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `pi.legsAnim`, `pi.legsAnimationTimer`. |
| `anim` | `dynamic` | — | Value used by `pi.legsAnim=((pi.legsAnim&ANIM_TOGGLEBIT)^ANIM_TOGGLEBIT)\|anim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L362)

<a id="function-function-mq3-client-ui-players-ui-forcetorsoanim-function-ui-forcetorsoanim-pi-anim-src-mq3-client-ui-players-ml-188595962"></a>
### UI_ForceTorsoAnim

```ml
function UI_ForceTorsoAnim(pi, anim)
```

UI_ForceTorsoAnim

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `pi.torsoAnim`, `pi.torsoAnimationTimer`. |
| `anim` | `dynamic` | — | Value used by `pi.torsoAnim=((pi.torsoAnim&ANIM_TOGGLEBIT)^ANIM_TOGGLEBIT)\|anim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L370)

<a id="function-function-mq3-client-ui-players-ui-legssequencing-function-ui-legssequencing-pi-src-mq3-client-ui-players-ml-1978335379"></a>
### UI_LegsSequencing

```ml
function UI_LegsSequencing(pi)
```

UI_LegsSequencing

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `pi.jumpHeight`, `pi.legsAnimationTimer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L385)

<a id="function-function-mq3-client-ui-players-ui-machinegunspinangle-function-ui-machinegunspinangle-pi-realtime-src-mq3-client-ui-players-ml-206024278"></a>
### UI_MachinegunSpinAngle

```ml
function UI_MachinegunSpinAngle(pi, realtime)
```

UI_MachinegunSpinAngle

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `pi.barrelTime`, `pi.barrelAngle`, `pi.barrelSpinning`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L450)

<a id="function-function-mq3-client-ui-players-ui-movediradjustment-function-ui-movediradjustment-pi-src-mq3-client-ui-players-ml-179978099"></a>
### UI_MovedirAdjustment

```ml
function UI_MovedirAdjustment(pi)
```

UI_MovedirAdjustment

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Player-model preview state with model parts, animations and orientation. Record read through `pi.viewAngles`, `pi.moveAngles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L433)

<a id="function-function-mq3-client-ui-players-ui-parseanimationfile-function-ui-parseanimationfile-filename-text-src-mq3-client-ui-players-ml-274161514"></a>
### UI_ParseAnimationFile

```ml
function UI_ParseAnimationFile(filename, text)
```

UI_ParseAnimationFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `filename` | `dynamic` | — | Accepted for compatibility with `UI_ParseAnimationFile`; the current implementation does not read it. |
| `text` | `dynamic` | — | Text consumed or emitted by `UI_ParseAnimationFile` in the UI players path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L498)

<a id="function-function-mq3-client-ui-players-ui-playerangles-function-ui-playerangles-pi-frametime-src-mq3-client-ui-players-ml-1982610617"></a>
### UI_PlayerAngles

```ml
function UI_PlayerAngles(pi, frametime)
```

UI_PlayerAngles

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `pi.torso.yawing`, `pi.torso.pitching`, `pi.legs.yawing`, `pi.torso.yawAngle` and additional values. |
| `frametime` | `dynamic` | — | Value used by `swung=UI_SwingAngles(torso[1],25.0,90.0,0.3,pi.torso.yawAngle,pi.torso.yawing,frametime)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L437)

<a id="function-function-mq3-client-ui-players-ui-playeranimation-function-ui-playeranimation-source-pi-frametime-realtime-src-mq3-client-ui-players-ml-157310239"></a>
### UI_PlayerAnimation

```ml
function UI_PlayerAnimation(source, pi, frametime, realtime)
```

UI_PlayerAnimation

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `UI_TorsoSequencing(source,pi)`. |
| `pi` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `pi.legsAnimationTimer`, `pi.torsoAnimationTimer`. |
| `frametime` | `dynamic` | — | Value used by `pi.legsAnimationTimer=pi.legsAnimationTimer-frametime`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L418)

<a id="function-function-mq3-client-ui-players-ui-playerfloatsprite-function-ui-playerfloatsprite-pi-origin-shader-retailactive-src-mq3-client-ui-players-ml-1387959101"></a>
### UI_PlayerFloatSprite

```ml
function UI_PlayerFloatSprite(pi, origin, shader, retailActive)
```

UI_PlayerFloatSprite

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `pi.actions`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L446)

<a id="function-function-mq3-client-ui-players-ui-playerinfo-setinfo-function-ui-playerinfo-setinfo-source-pi-legsanim-torsoanim-viewangles-moveangles-weaponnumber-chat-src-mq3-client-ui-players-ml-770073901"></a>
### UI_PlayerInfo_SetInfo

```ml
function UI_PlayerInfo_SetInfo(source, pi, legsAnim, torsoAnim, viewAngles, moveAngles, weaponNumber, chat)
```

UI_PlayerInfo_SetInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `UI_PlayerInfo_SetWeapon(source,pi,pi.weapon) end if`. |
| `pi` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `pi.chat`, `pi.viewAngles`, `pi.moveAngles`, `pi.newModel` and additional values. |
| `legsAnim` | `dynamic` | — | Value assigned to `pi.pendingLegsAnim`. |
| `torsoAnim` | `dynamic` | — | Value assigned to `pi.pendingTorsoAnim`. |
| `viewAngles` | `dynamic` | — | Sequence read at `viewAngles[0]`, `viewAngles[1]`, `viewAngles[2]`. |
| `moveAngles` | `dynamic` | — | Sequence read at `moveAngles[0]`, `moveAngles[1]`, `moveAngles[2]`. |
| `weaponNumber` | `dynamic` | — | Value assigned to `pi.weapon`, `pi.currentWeapon`, `pi.lastWeapon`, `pi.pendingWeapon`. |
| `chat` | `dynamic` | — | Value assigned to `pi.chat`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L527)

<a id="function-function-mq3-client-ui-players-ui-playerinfo-setmodel-function-ui-playerinfo-setmodel-source-pi-model-src-mq3-client-ui-players-ml-302180663"></a>
### UI_PlayerInfo_SetModel

```ml
function UI_PlayerInfo_SetModel(source, pi, model)
```

UI_PlayerInfo_SetModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `UI_RegisterClientModelname(source,pi,model)`. |
| `pi` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `pi.weapon`, `pi.currentWeapon`, `pi.lastWeapon`, `pi.pendingWeapon` and additional values. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this UI players operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L517)

<a id="function-function-mq3-client-ui-players-ui-playerinfo-setweapon-function-ui-playerinfo-setweapon-source-pi-weaponnum-src-mq3-client-ui-players-ml-2056038424"></a>
### UI_PlayerInfo_SetWeapon

```ml
function UI_PlayerInfo_SetWeapon(source, pi, weaponNum)
```

UI_PlayerInfo_SetWeapon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `if path!="" then pi.weaponModel=register(source,"model",path) end if`. |
| `pi` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `pi.currentWeapon`, `pi.realWeapon`, `pi.weaponModel`, `pi.barrelModel` and additional values. |
| `weaponNum` | `dynamic` | — | Quake III weapon identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L350)

<a id="function-function-mq3-client-ui-players-ui-positionentityontag-function-ui-positionentityontag-entity-parent-orientation-src-mq3-client-ui-players-ml-1462700003"></a>
### UI_PositionEntityOnTag

```ml
function UI_PositionEntityOnTag(entity, parent, orientation)
```

UI_PositionEntityOnTag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `entity.origin`, `entity.axis`, `entity.backlerp`. |
| `parent` | `dynamic` | — | Record read through `parent.origin`, `parent.axis`, `parent.backlerp`. |
| `orientation` | `dynamic` | — | Record read through `orientation.found`, `orientation.origin`, `orientation.axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L392)

<a id="function-function-mq3-client-ui-players-ui-positionrotatedentityontag-function-ui-positionrotatedentityontag-entity-parent-orientation-src-mq3-client-ui-players-ml-1029651641"></a>
### UI_PositionRotatedEntityOnTag

```ml
function UI_PositionRotatedEntityOnTag(entity, parent, orientation)
```

UI_PositionRotatedEntityOnTag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `entity.origin`, `entity.axis`. |
| `parent` | `dynamic` | — | Record read through `parent.origin`, `parent.axis`. |
| `orientation` | `dynamic` | — | Record read through `orientation.found`, `orientation.origin`, `orientation.axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L397)

<a id="function-function-mq3-client-ui-players-ui-registerclientmodelname-function-ui-registerclientmodelname-source-pi-modelskinname-src-mq3-client-ui-players-ml-1020686509"></a>
### UI_RegisterClientModelname

```ml
function UI_RegisterClientModelname(source, pi, modelSkinName)
```

UI_RegisterClientModelname

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `pi.legsModel=register(source,"model","models/players/"+model+"/lower.md3")`. |
| `pi` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `pi.torsoModel`, `pi.headModel`, `pi.legsModel`, `pi.animations`. |
| `modelSkinName` | `dynamic` | — | Sequence whose length/content is inspected by `UI_RegisterClientModelname`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L507)

<a id="function-function-mq3-client-ui-players-ui-registerclientskin-function-ui-registerclientskin-source-pi-modelname-skinname-src-mq3-client-ui-players-ml-908482758"></a>
### UI_RegisterClientSkin

```ml
function UI_RegisterClientSkin(source, pi, modelName, skinName)
```

UI_RegisterClientSkin

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `pi.legsSkin=register(source,"skin","models/players/"+modelName+"/lower_"+skinName+".skin")`. |
| `pi` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `pi.legsSkin`, `pi.torsoSkin`, `pi.headSkin`. |
| `modelName` | `dynamic` | — | Value used by `pi.legsSkin=register(source,"skin","models/players/"+modelName+"/lower_"+skinName+".skin")`. |
| `skinName` | `dynamic` | — | Value used by `pi.legsSkin=register(source,"skin","models/players/"+modelName+"/lower_"+skinName+".skin")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L491)

<a id="function-function-mq3-client-ui-players-ui-runlerpframe-function-ui-runlerpframe-pi-lf-newanimation-realtime-src-mq3-client-ui-players-ml-48091812"></a>
### UI_RunLerpFrame

```ml
function UI_RunLerpFrame(pi, lf, newAnimation, realtime)
```

UI_RunLerpFrame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Player-model preview state with model parts, animations and orientation. |
| `lf` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `lf.oldFrame`, `lf.oldFrameTime`, `lf.frameTime`, `lf.frame` and additional values. |
| `newAnimation` | `dynamic` | — | Value used by `if newAnimation!=lf.animationNumber or lf.animation==void then selected=UI_SetLerpFrameAnimation(pi,lf,newAnimation)`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L408)

<a id="function-function-mq3-client-ui-players-ui-setlegsanim-function-ui-setlegsanim-pi-anim-src-mq3-client-ui-players-ml-1626913242"></a>
### UI_SetLegsAnim

```ml
function UI_SetLegsAnim(pi, anim)
```

UI_SetLegsAnim

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `pi.pendingLegsAnim`. |
| `anim` | `dynamic` | — | Value used by `if pi.pendingLegsAnim!=0 then anim=pi.pendingLegsAnim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L366)

<a id="function-function-mq3-client-ui-players-ui-setlerpframeanimation-function-ui-setlerpframeanimation-pi-lf-newanimation-src-mq3-client-ui-players-ml-883658941"></a>
### UI_SetLerpFrameAnimation

```ml
function UI_SetLerpFrameAnimation(pi, lf, newAnimation)
```

UI_SetLerpFrameAnimation

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Player-model preview state with model parts, animations and orientation. Record read through `pi.animations`. |
| `lf` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `lf.animationNumber`, `lf.animation`, `lf.animationTime`. |
| `newAnimation` | `dynamic` | — | Value assigned to `lf.animationNumber`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L402)

<a id="function-function-mq3-client-ui-players-ui-settorsoanim-function-ui-settorsoanim-pi-anim-src-mq3-client-ui-players-ml-652563832"></a>
### UI_SetTorsoAnim

```ml
function UI_SetTorsoAnim(pi, anim)
```

UI_SetTorsoAnim

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `pi.pendingTorsoAnim`. |
| `anim` | `dynamic` | — | Value used by `if pi.pendingTorsoAnim!=0 then anim=pi.pendingTorsoAnim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L374)

<a id="function-function-mq3-client-ui-players-ui-swingangles-function-ui-swingangles-destination-swingtolerance-clamptolerance-speed-angle-swinging-frametime-src-mq3-client-ui-players-ml-1909530829"></a>
### UI_SwingAngles

```ml
function UI_SwingAngles(destination, swingTolerance, clampTolerance, speed, angle, swinging, frametime)
```

UI_SwingAngles

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Value used by `if not swinging then swing=angleSubtract(angle,destination)`. |
| `swingTolerance` | `dynamic` | — | Value used by `if swing>swingTolerance or swing<0-swingTolerance then swinging=true end if end if`. |
| `clampTolerance` | `dynamic` | — | Value used by `if swing>clampTolerance then angle=q.AngleNormalize360(destination-(clampTolerance-1)) else if swing<0-clampTolerance then angle=q.AngleNormal...`. |
| `speed` | `dynamic` | — | Value used by `if swing>=0 then move=frametime*scale*speed`. |
| `angle` | `dynamic` | — | Value used by `if not swinging then swing=angleSubtract(angle,destination)`. |
| `swinging` | `dynamic` | — | Value used by `if not swinging then swing=angleSubtract(angle,destination)`. |
| `frametime` | `dynamic` | — | Value used by `if swing>=0 then move=frametime*scale*speed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L427)

<a id="constant-constant-mq3-client-ui-players-ui-timer-attack-const-ui-timer-attack-500-src-mq3-client-ui-players-ml-1224582248"></a>
### UI_TIMER_ATTACK

```ml
const UI_TIMER_ATTACK = 500
```

Player-preview duration in milliseconds for the attack animation phase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L27)

<a id="constant-constant-mq3-client-ui-players-ui-timer-gesture-const-ui-timer-gesture-2300-src-mq3-client-ui-players-ml-997166254"></a>
### UI_TIMER_GESTURE

```ml
const UI_TIMER_GESTURE = 2300
```

Player-preview duration in milliseconds for the gesture animation phase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L19)

<a id="constant-constant-mq3-client-ui-players-ui-timer-jump-const-ui-timer-jump-1000-src-mq3-client-ui-players-ml-1143595362"></a>
### UI_TIMER_JUMP

```ml
const UI_TIMER_JUMP = 1000
```

Player-preview duration in milliseconds for the jump animation phase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L21)

<a id="constant-constant-mq3-client-ui-players-ui-timer-land-const-ui-timer-land-130-src-mq3-client-ui-players-ml-1118820997"></a>
### UI_TIMER_LAND

```ml
const UI_TIMER_LAND = 130
```

Player-preview duration in milliseconds for the land animation phase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L23)

<a id="constant-constant-mq3-client-ui-players-ui-timer-muzzle-flash-const-ui-timer-muzzle-flash-20-src-mq3-client-ui-players-ml-2143818907"></a>
### UI_TIMER_MUZZLE_FLASH

```ml
const UI_TIMER_MUZZLE_FLASH = 20
```

Player-preview duration in milliseconds for the muzzle flash animation phase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L29)

<a id="constant-constant-mq3-client-ui-players-ui-timer-weapon-delay-const-ui-timer-weapon-delay-250-src-mq3-client-ui-players-ml-1110105912"></a>
### UI_TIMER_WEAPON_DELAY

```ml
const UI_TIMER_WEAPON_DELAY = 250
```

Player-preview duration in milliseconds for the weapon delay animation phase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L31)

<a id="constant-constant-mq3-client-ui-players-ui-timer-weapon-switch-const-ui-timer-weapon-switch-300-src-mq3-client-ui-players-ml-931723524"></a>
### UI_TIMER_WEAPON_SWITCH

```ml
const UI_TIMER_WEAPON_SWITCH = 300
```

Player-preview duration in milliseconds for the weapon switch animation phase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L25)

<a id="function-function-mq3-client-ui-players-ui-torsosequencing-function-ui-torsosequencing-source-pi-src-mq3-client-ui-players-ml-1779659770"></a>
### UI_TorsoSequencing

```ml
function UI_TorsoSequencing(source, pi)
```

UI_TorsoSequencing

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `if current==TORSO_DROP then UI_PlayerInfo_SetWeapon(source,pi,pi.weapon)`. |
| `pi` | `dynamic` | — | Mutable UI players record/storage; this routine assigns `pi.torsoAnimationTimer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L378)

<a id="function-function-mq3-client-ui-players-weaponpath-function-weaponpath-weapon-src-mq3-client-ui-players-ml-385094444"></a>
### weaponPath

```ml
function weaponPath(weapon)
```

Evaluates UI players `weaponPath` and returns `""`, `names[weapon]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — | Value used by `if weapon<0 or weapon>=len(names) then return "" end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L336)

<a id="constant-constant-mq3-client-ui-players-wp-bfg-const-wp-bfg-9-src-mq3-client-ui-players-ml-1881232348"></a>
### WP_BFG

```ml
const WP_BFG = 9
```

Native weapon identifier selecting the BFG.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L85)

<a id="constant-constant-mq3-client-ui-players-wp-gauntlet-const-wp-gauntlet-1-src-mq3-client-ui-players-ml-292852264"></a>
### WP_GAUNTLET

```ml
const WP_GAUNTLET = 1
```

Native weapon identifier selecting the gauntlet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L69)

<a id="constant-constant-mq3-client-ui-players-wp-grappling-hook-const-wp-grappling-hook-10-src-mq3-client-ui-players-ml-1783281014"></a>
### WP_GRAPPLING_HOOK

```ml
const WP_GRAPPLING_HOOK = 10
```

Native weapon identifier selecting the grappling hook.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L87)

<a id="constant-constant-mq3-client-ui-players-wp-grenade-launcher-const-wp-grenade-launcher-4-src-mq3-client-ui-players-ml-292528349"></a>
### WP_GRENADE_LAUNCHER

```ml
const WP_GRENADE_LAUNCHER = 4
```

Native weapon identifier selecting the grenade launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L75)

<a id="constant-constant-mq3-client-ui-players-wp-lightning-const-wp-lightning-6-src-mq3-client-ui-players-ml-83462485"></a>
### WP_LIGHTNING

```ml
const WP_LIGHTNING = 6
```

Native weapon identifier selecting the lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L79)

<a id="constant-constant-mq3-client-ui-players-wp-machinegun-const-wp-machinegun-2-src-mq3-client-ui-players-ml-709477907"></a>
### WP_MACHINEGUN

```ml
const WP_MACHINEGUN = 2
```

Native weapon identifier selecting the machine gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L71)

<a id="constant-constant-mq3-client-ui-players-wp-none-const-wp-none-0-src-mq3-client-ui-players-ml-1722983969"></a>
### WP_NONE

```ml
const WP_NONE = 0
```

Native weapon identifier selecting no selected weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L67)

<a id="constant-constant-mq3-client-ui-players-wp-plasmagun-const-wp-plasmagun-8-src-mq3-client-ui-players-ml-1840399127"></a>
### WP_PLASMAGUN

```ml
const WP_PLASMAGUN = 8
```

Native weapon identifier selecting the plasma gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L83)

<a id="constant-constant-mq3-client-ui-players-wp-railgun-const-wp-railgun-7-src-mq3-client-ui-players-ml-982178828"></a>
### WP_RAILGUN

```ml
const WP_RAILGUN = 7
```

Native weapon identifier selecting the railgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L81)

<a id="constant-constant-mq3-client-ui-players-wp-rocket-launcher-const-wp-rocket-launcher-5-src-mq3-client-ui-players-ml-1031081344"></a>
### WP_ROCKET_LAUNCHER

```ml
const WP_ROCKET_LAUNCHER = 5
```

Native weapon identifier selecting the rocket launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L77)

<a id="constant-constant-mq3-client-ui-players-wp-shotgun-const-wp-shotgun-3-src-mq3-client-ui-players-ml-1649174072"></a>
### WP_SHOTGUN

```ml
const WP_SHOTGUN = 3
```

Native weapon identifier selecting the shotgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L73)
