# `src/mq3/client/ui_players_missionpack.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_players_missionpack`](Package-mq3-client-ui-players-missionpack-1717604334.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/compat/transcendental.ml` as `crt` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-players-missionpack-absolute-function-absolute-value-src-mq3-client-ui-players-missionpack-ml-688609021"></a>
### absolute

```ml
function absolute(value)
```

Evaluates UI players missionpack `absolute` and returns `0-value`, `value` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<0` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L117)

- [mq3.client.ui_players_missionpack.Action](Type-mq3-client-ui-players-missionpack-action-845694746.md) — struct
<a id="function-function-mq3-client-ui-players-missionpack-anglesubtract-function-anglesubtract-a-b-src-mq3-client-ui-players-missionpack-ml-52532333"></a>
### angleSubtract

```ml
function angleSubtract(a, b)
```

Evaluates UI players missionpack `angleSubtract` and returns `value` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Value used by `value=a-b`. |
| `b` | `dynamic` | — | Value used by `value=a-b`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L114)

<a id="constant-constant-mq3-client-ui-players-missionpack-anim-togglebit-const-anim-togglebit-128-src-mq3-client-ui-players-missionpack-ml-1116551162"></a>
### ANIM_TOGGLEBIT

```ml
const ANIM_TOGGLEBIT = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L26)

- [mq3.client.ui_players_missionpack.Animation](Type-mq3-client-ui-players-missionpack-animation-1510277646.md) — struct
<a id="function-function-mq3-client-ui-players-missionpack-animationtext-function-animationtext-source-path-src-mq3-client-ui-players-missionpack-ml-1063134764"></a>
### animationText

```ml
function animationText(source, path)
```

Calls `mq3.client.ui_players_missionpack.same` from UI players missionpack `animationText`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record read through `source.animationFiles`. |
| `path` | `dynamic` | — | File or asset path used by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L101)

<a id="function-function-mq3-client-ui-players-missionpack-assetsource-function-assetsource-files-animationfiles-retailactive-src-mq3-client-ui-players-missionpack-ml-855961133"></a>
### assetSource

```ml
function assetSource(files, animationFiles, retailActive)
```

Creates a `mq3.client.ui_players_missionpack.AssetSource` record. Assigns `files` from `files`, `animationFiles` from `animationFiles`, `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `files` | `dynamic` | — | Value used to initialize `AssetSource.files`. |
| `animationFiles` | `dynamic` | — | Value used to initialize `AssetSource.animationFiles`. |
| `retailActive` | `dynamic` | — | Value used to initialize `AssetSource.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L77)

- [mq3.client.ui_players_missionpack.AssetSource](Type-mq3-client-ui-players-missionpack-assetsource-2019359989.md) — struct
<a id="constant-constant-mq3-client-ui-players-missionpack-both-death1-const-both-death1-0-src-mq3-client-ui-players-missionpack-ml-1168858269"></a>
### BOTH_DEATH1

```ml
const BOTH_DEATH1 = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L28)

<a id="function-function-mq3-client-ui-players-missionpack-create-function-create-src-mq3-client-ui-players-missionpack-ml-1580926680"></a>
### create

```ml
function create()
```

Creates a `mq3.client.ui_players_missionpack.PlayerInfo` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L79)

<a id="function-function-mq3-client-ui-players-missionpack-emit-function-emit-list-boundary-kind-name-detail-number-vector-retailactive-src-mq3-client-ui-players-missionpack-ml-358127989"></a>
### emit

```ml
function emit(list, boundary, kind, name, detail, number, vector, retailActive)
```

Computes `list+[Action(boundary,kind,name,detail,number,vector,not retailActive)]` for UI players missionpack `emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | Value used by `return list+[Action(boundary,kind,name,detail,number,vector,not retailActive)]`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI players missionpack resource. |
| `detail` | `dynamic` | — | Value used by `return list+[Action(boundary,kind,name,detail,number,vector,not retailActive)]`. |
| `number` | `dynamic` | — | Value used by `return list+[Action(boundary,kind,name,detail,number,vector,not retailActive)]`. |
| `vector` | `dynamic` | — | Value used by `return list+[Action(boundary,kind,name,detail,number,vector,not retailActive)]`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L89)

<a id="function-function-mq3-client-ui-players-missionpack-exists-function-exists-source-path-src-mq3-client-ui-players-missionpack-ml-1311440846"></a>
### exists

```ml
function exists(source, path)
```

Calls `mq3.client.ui_players_missionpack.same` from UI players missionpack `exists`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record read through `source.files`. |
| `path` | `dynamic` | — | File or asset path used by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L97)

<a id="function-function-mq3-client-ui-players-missionpack-flashcolor-function-flashcolor-weapon-src-mq3-client-ui-players-missionpack-ml-1632750156"></a>
### flashColor

```ml
function flashColor(weapon)
```

Evaluates UI players missionpack `flashColor` and returns `[0.6,0.6,1.0]`, `[1.0,0.7,0.5]`, `[1.0,0.75,0.0]` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — | Value used by `if weapon==WP_GAUNTLET or weapon==WP_LIGHTNING or weapon==WP_PLASMAGUN or weapon==WP_GRAPPLING_HOOK then return [0.6,0.6,1.0] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L129)

<a id="function-function-mq3-client-ui-players-missionpack-identityaxis-function-identityaxis-src-mq3-client-ui-players-missionpack-ml-542679584"></a>
### identityAxis

```ml
function identityAxis()
```

Creates the three orthonormal unit axes used as the identity orientation in UI players missionpack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L70)

<a id="constant-constant-mq3-client-ui-players-missionpack-jump-height-const-jump-height-56-src-mq3-client-ui-players-missionpack-ml-168940452"></a>
### JUMP_HEIGHT

```ml
const JUMP_HEIGHT = 56
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L25)

<a id="constant-constant-mq3-client-ui-players-missionpack-legs-idle-const-legs-idle-22-src-mq3-client-ui-players-missionpack-ml-1981840013"></a>
### LEGS_IDLE

```ml
const LEGS_IDLE = 22
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L39)

<a id="constant-constant-mq3-client-ui-players-missionpack-legs-jump-const-legs-jump-18-src-mq3-client-ui-players-missionpack-ml-381293746"></a>
### LEGS_JUMP

```ml
const LEGS_JUMP = 18
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L37)

<a id="constant-constant-mq3-client-ui-players-missionpack-legs-land-const-legs-land-19-src-mq3-client-ui-players-missionpack-ml-981016871"></a>
### LEGS_LAND

```ml
const LEGS_LAND = 19
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L38)

<a id="constant-constant-mq3-client-ui-players-missionpack-legs-turn-const-legs-turn-24-src-mq3-client-ui-players-missionpack-ml-1219188195"></a>
### LEGS_TURN

```ml
const LEGS_TURN = 24
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L40)

<a id="constant-constant-mq3-client-ui-players-missionpack-legs-walkcr-const-legs-walkcr-13-src-mq3-client-ui-players-missionpack-ml-12463733"></a>
### LEGS_WALKCR

```ml
const LEGS_WALKCR = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L36)

<a id="function-function-mq3-client-ui-players-missionpack-lerpframe-function-lerpframe-src-mq3-client-ui-players-missionpack-ml-563050236"></a>
### lerpFrame

```ml
function lerpFrame()
```

Creates a `mq3.client.ui_players_missionpack.LerpFrame` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L72)

- [mq3.client.ui_players_missionpack.LerpFrame](Type-mq3-client-ui-players-missionpack-lerpframe-2061827178.md) — struct
<a id="function-function-mq3-client-ui-players-missionpack-matrixmultiply-function-matrixmultiply-a-b-src-mq3-client-ui-players-missionpack-ml-2097119895"></a>
### matrixMultiply

```ml
function matrixMultiply(a, b)
```

Evaluates UI players missionpack `matrixMultiply` and returns `result` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Sequence read at `a[i]`. |
| `b` | `dynamic` | — | Sequence read at `b[0]`, `b[1]`, `b[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L110)

<a id="constant-constant-mq3-client-ui-players-missionpack-max-animations-const-max-animations-31-src-mq3-client-ui-players-missionpack-ml-1444842123"></a>
### MAX_ANIMATIONS

```ml
const MAX_ANIMATIONS = 31
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L27)

<a id="function-function-mq3-client-ui-players-missionpack-numberstarts-function-numberstarts-token-src-mq3-client-ui-players-missionpack-ml-2005233033"></a>
### numberStarts

```ml
function numberStarts(token)
```

Evaluates UI players missionpack `numberStarts` and returns `false`, `c>=48 and c<=57` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — | Value used by `if token=="" then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L329)

- [mq3.client.ui_players_missionpack.Orientation](Type-mq3-client-ui-players-missionpack-orientation-999988426.md) — struct
- [mq3.client.ui_players_missionpack.PlayerInfo](Type-mq3-client-ui-players-missionpack-playerinfo-724093749.md) — struct
<a id="function-function-mq3-client-ui-players-missionpack-register-function-register-source-kind-path-src-mq3-client-ui-players-missionpack-ml-2043759808"></a>
### register

```ml
function register(source, kind, path)
```

Updates `source.actions` during UI players missionpack `register`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `source.actions`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `path` | `dynamic` | — | File or asset path used by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L106)

<a id="function-function-mq3-client-ui-players-missionpack-renderentity-function-renderentity-kind-model-skin-tag-src-mq3-client-ui-players-missionpack-ml-460855954"></a>
### renderEntity

```ml
function renderEntity(kind, model, skin, tag)
```

Creates a `mq3.client.ui_players_missionpack.RenderEntity` record. Assigns `kind` from `kind`, `model` from `model`, `skin` from `skin`, `tag` from `tag`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — | Value used to initialize `RenderEntity.kind`. |
| `model` | `dynamic` | — | Value used to initialize `RenderEntity.model`. |
| `skin` | `dynamic` | — | Value used to initialize `RenderEntity.skin`. |
| `tag` | `dynamic` | — | Value used to initialize `RenderEntity.tag`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L251)

- [mq3.client.ui_players_missionpack.RenderEntity](Type-mq3-client-ui-players-missionpack-renderentity-7579403.md) — struct
<a id="function-function-mq3-client-ui-players-missionpack-resetinfo-function-resetinfo-pi-src-mq3-client-ui-players-missionpack-ml-1418058629"></a>
### resetInfo

```ml
function resetInfo(pi)
```

Updates `pi.legsModel`, `pi.legsSkin`, `pi.legs`, `pi.torsoModel` and additional values during UI players missionpack `resetInfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `pi.legsModel`, `pi.legsSkin`, `pi.legs`, `pi.torsoModel` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L357)

<a id="function-function-mq3-client-ui-players-missionpack-same-function-same-a-b-src-mq3-client-ui-players-missionpack-ml-388874943"></a>
### same

```ml
function same(a, b)
```

Compares two UI players missionpack names using ASCII case-insensitive equality.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Argument 1 of `std.string.equalsIgnoreCaseAscii`. |
| `b` | `dynamic` | — | Argument 2 of `std.string.equalsIgnoreCaseAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L93)

<a id="function-function-mq3-client-ui-players-missionpack-stripmd3-function-stripmd3-path-src-mq3-client-ui-players-missionpack-ml-1631652875"></a>
### stripMd3

```ml
function stripMd3(path)
```

Calls `std.string.equalsIgnoreCaseAscii`, `std.string.substr` from UI players missionpack `stripMd3`. The final path returns `path`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | File or asset path used by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L126)

<a id="extern_function-extern-function-mq3-client-ui-players-missionpack-tan-extern-function-tan-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-client-ui-players-missionpack-ml-931830932"></a>
### tan

```ml
extern function tan(value as double) from "ucrtbase.dll" returns double
```

Evaluates the tangent of an angle in radians using the Windows C runtime. This binding is used by UI players missionpack.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Angle in radians, passed as a native double. |


**Returns:** The tangent of the supplied angle.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L16)

<a id="constant-constant-mq3-client-ui-players-missionpack-torso-attack-const-torso-attack-7-src-mq3-client-ui-players-missionpack-ml-59636000"></a>
### TORSO_ATTACK

```ml
const TORSO_ATTACK = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L30)

<a id="constant-constant-mq3-client-ui-players-missionpack-torso-attack2-const-torso-attack2-8-src-mq3-client-ui-players-missionpack-ml-309520173"></a>
### TORSO_ATTACK2

```ml
const TORSO_ATTACK2 = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L31)

<a id="constant-constant-mq3-client-ui-players-missionpack-torso-drop-const-torso-drop-9-src-mq3-client-ui-players-missionpack-ml-485971536"></a>
### TORSO_DROP

```ml
const TORSO_DROP = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L32)

<a id="constant-constant-mq3-client-ui-players-missionpack-torso-gesture-const-torso-gesture-6-src-mq3-client-ui-players-missionpack-ml-1821024659"></a>
### TORSO_GESTURE

```ml
const TORSO_GESTURE = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L29)

<a id="constant-constant-mq3-client-ui-players-missionpack-torso-getflag-const-torso-getflag-25-src-mq3-client-ui-players-missionpack-ml-1962889462"></a>
### TORSO_GETFLAG

```ml
const TORSO_GETFLAG = 25
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L41)

<a id="constant-constant-mq3-client-ui-players-missionpack-torso-raise-const-torso-raise-10-src-mq3-client-ui-players-missionpack-ml-957758934"></a>
### TORSO_RAISE

```ml
const TORSO_RAISE = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L33)

<a id="constant-constant-mq3-client-ui-players-missionpack-torso-stand-const-torso-stand-11-src-mq3-client-ui-players-missionpack-ml-866474979"></a>
### TORSO_STAND

```ml
const TORSO_STAND = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L34)

<a id="constant-constant-mq3-client-ui-players-missionpack-torso-stand2-const-torso-stand2-12-src-mq3-client-ui-players-missionpack-ml-847692146"></a>
### TORSO_STAND2

```ml
const TORSO_STAND2 = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L35)

<a id="function-function-mq3-client-ui-players-missionpack-ui-drawplayer-function-ui-drawplayer-source-x-y-w-h-pi-time-frametime-retailactive-src-mq3-client-ui-players-missionpack-ml-1312023888"></a>
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
| `pi` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `pi.realtime`, `pi.weapon`, `pi.lastWeapon`, `pi.pendingWeapon` and additional values. |
| `time` | `dynamic` | — | Value assigned to `pi.realtime`. |
| `frametime` | `dynamic` | — | Value used by `axes=UI_PlayerAngles(pi,frametime)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L262)

<a id="function-function-mq3-client-ui-players-missionpack-ui-fileexists-function-ui-fileexists-source-filename-src-mq3-client-ui-players-missionpack-ml-902819966"></a>
### UI_FileExists

```ml
function UI_FileExists(source, filename)
```

UI_FileExists

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Argument 1 of `mq3.client.ui_players_missionpack.exists`. |
| `filename` | `dynamic` | — | File name passed to the corresponding file/asset operation. Forwarded to `mq3.client.ui_players_missionpack.exists`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L276)

<a id="function-function-mq3-client-ui-players-missionpack-ui-findclientheadfile-function-ui-findclientheadfile-source-filename-length-teamname-headmodelname-headskinname-base-ext-src-mq3-client-ui-players-missionpack-ml-733662416"></a>
### UI_FindClientHeadFile

```ml
function UI_FindClientHeadFile(source, filename, length, teamName, headModelName, headSkinName, base, ext)
```

UI_FindClientHeadFile The C function returns qboolean and writes filename.  Returning the selected path preserves both results without an unsafe writable character buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `if UI_FileExists(source,candidate) then return candidate end if`. |
| `filename` | `dynamic` | — | Accepted for compatibility with `UI_FindClientHeadFile`; the current implementation does not read it. |
| `length` | `dynamic` | — | Accepted for compatibility with `UI_FindClientHeadFile`; the current implementation does not read it. |
| `teamName` | `dynamic` | — | Team name used for the menu or model selection. |
| `headModelName` | `dynamic` | — | Value used by `model=headModelName`. |
| `headSkinName` | `dynamic` | — | Value used by `candidate="models/players/"+folder+model+"/"+headSkinName+"/"+teamName+base+"_default."+ext`. |
| `base` | `dynamic` | — | Value used by `candidate="models/players/"+folder+model+"/"+headSkinName+"/"+teamName+base+"_default."+ext`. |
| `ext` | `dynamic` | — | Value used by `candidate="models/players/"+folder+model+"/"+headSkinName+"/"+teamName+base+"_default."+ext`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L289)

<a id="function-function-mq3-client-ui-players-missionpack-ui-forcelegsanim-function-ui-forcelegsanim-pi-anim-src-mq3-client-ui-players-missionpack-ml-1038508394"></a>
### UI_ForceLegsAnim

```ml
function UI_ForceLegsAnim(pi, anim)
```

UI_ForceLegsAnim

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `pi.legsAnim`, `pi.legsAnimationTimer`. |
| `anim` | `dynamic` | — | Value used by `pi.legsAnim=((pi.legsAnim&ANIM_TOGGLEBIT)^ANIM_TOGGLEBIT)\|anim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L147)

<a id="function-function-mq3-client-ui-players-missionpack-ui-forcetorsoanim-function-ui-forcetorsoanim-pi-anim-src-mq3-client-ui-players-missionpack-ml-587499954"></a>
### UI_ForceTorsoAnim

```ml
function UI_ForceTorsoAnim(pi, anim)
```

UI_ForceTorsoAnim

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `pi.torsoAnim`, `pi.torsoAnimationTimer`. |
| `anim` | `dynamic` | — | Value used by `pi.torsoAnim=((pi.torsoAnim&ANIM_TOGGLEBIT)^ANIM_TOGGLEBIT)\|anim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L155)

<a id="function-function-mq3-client-ui-players-missionpack-ui-legssequencing-function-ui-legssequencing-pi-src-mq3-client-ui-players-missionpack-ml-144399807"></a>
### UI_LegsSequencing

```ml
function UI_LegsSequencing(pi)
```

UI_LegsSequencing

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `pi.jumpHeight`, `pi.legsAnimationTimer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L170)

<a id="function-function-mq3-client-ui-players-missionpack-ui-machinegunspinangle-function-ui-machinegunspinangle-pi-realtime-src-mq3-client-ui-players-missionpack-ml-2124270174"></a>
### UI_MachinegunSpinAngle

```ml
function UI_MachinegunSpinAngle(pi, realtime)
```

UI_MachinegunSpinAngle

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `pi.barrelTime`, `pi.barrelAngle`, `pi.barrelSpinning`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L235)

<a id="function-function-mq3-client-ui-players-missionpack-ui-movediradjustment-function-ui-movediradjustment-pi-src-mq3-client-ui-players-missionpack-ml-74804255"></a>
### UI_MovedirAdjustment

```ml
function UI_MovedirAdjustment(pi)
```

UI_MovedirAdjustment

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Player-model preview state with model parts, animations and orientation. Record read through `pi.viewAngles`, `pi.moveAngles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L218)

<a id="function-function-mq3-client-ui-players-missionpack-ui-parseanimationfile-function-ui-parseanimationfile-filename-text-src-mq3-client-ui-players-missionpack-ml-1099236066"></a>
### UI_ParseAnimationFile

```ml
function UI_ParseAnimationFile(filename, text)
```

UI_ParseAnimationFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `filename` | `dynamic` | — | Accepted for compatibility with `UI_ParseAnimationFile`; the current implementation does not read it. |
| `text` | `dynamic` | — | Text consumed or emitted by `UI_ParseAnimationFile` in the UI players missionpack path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L333)

<a id="function-function-mq3-client-ui-players-missionpack-ui-playerangles-function-ui-playerangles-pi-frametime-src-mq3-client-ui-players-missionpack-ml-137939897"></a>
### UI_PlayerAngles

```ml
function UI_PlayerAngles(pi, frametime)
```

UI_PlayerAngles

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `pi.torso.yawing`, `pi.torso.pitching`, `pi.legs.yawing`, `pi.torso.yawAngle` and additional values. |
| `frametime` | `dynamic` | — | Value used by `swung=UI_SwingAngles(torso[1],25.0,90.0,0.3,pi.torso.yawAngle,pi.torso.yawing,frametime)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L222)

<a id="function-function-mq3-client-ui-players-missionpack-ui-playeranimation-function-ui-playeranimation-source-pi-frametime-realtime-src-mq3-client-ui-players-missionpack-ml-1667831307"></a>
### UI_PlayerAnimation

```ml
function UI_PlayerAnimation(source, pi, frametime, realtime)
```

UI_PlayerAnimation

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `UI_TorsoSequencing(source,pi)`. |
| `pi` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `pi.legsAnimationTimer`, `pi.torsoAnimationTimer`. |
| `frametime` | `dynamic` | — | Value used by `pi.legsAnimationTimer=pi.legsAnimationTimer-frametime`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L203)

<a id="function-function-mq3-client-ui-players-missionpack-ui-playerfloatsprite-function-ui-playerfloatsprite-pi-origin-shader-retailactive-src-mq3-client-ui-players-missionpack-ml-1369855117"></a>
### UI_PlayerFloatSprite

```ml
function UI_PlayerFloatSprite(pi, origin, shader, retailActive)
```

UI_PlayerFloatSprite

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `pi.actions`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L231)

<a id="function-function-mq3-client-ui-players-missionpack-ui-playerinfo-setinfo-function-ui-playerinfo-setinfo-source-pi-legsanim-torsoanim-viewangles-moveangles-weaponnumber-chat-src-mq3-client-ui-players-missionpack-ml-564790557"></a>
### UI_PlayerInfo_SetInfo

```ml
function UI_PlayerInfo_SetInfo(source, pi, legsAnim, torsoAnim, viewAngles, moveAngles, weaponNumber, chat)
```

UI_PlayerInfo_SetInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `UI_PlayerInfo_SetWeapon(source,pi,pi.weapon) end if`. |
| `pi` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `pi.chat`, `pi.viewAngles`, `pi.moveAngles`, `pi.newModel` and additional values. |
| `legsAnim` | `dynamic` | — | Value assigned to `pi.pendingLegsAnim`. |
| `torsoAnim` | `dynamic` | — | Value assigned to `pi.pendingTorsoAnim`. |
| `viewAngles` | `dynamic` | — | Sequence read at `viewAngles[0]`, `viewAngles[1]`, `viewAngles[2]`. |
| `moveAngles` | `dynamic` | — | Sequence read at `moveAngles[0]`, `moveAngles[1]`, `moveAngles[2]`. |
| `weaponNumber` | `dynamic` | — | Value assigned to `pi.weapon`, `pi.currentWeapon`, `pi.lastWeapon`, `pi.pendingWeapon`. |
| `chat` | `dynamic` | — | Value assigned to `pi.chat`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L374)

<a id="function-function-mq3-client-ui-players-missionpack-ui-playerinfo-setmodel-function-ui-playerinfo-setmodel-source-pi-model-headmodel-teamname-src-mq3-client-ui-players-missionpack-ml-761127568"></a>
### UI_PlayerInfo_SetModel

```ml
function UI_PlayerInfo_SetModel(source, pi, model, headmodel, teamName)
```

UI_PlayerInfo_SetModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `UI_RegisterClientModelname(source,pi,model,headmodel,teamName)`. |
| `pi` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `pi.weapon`, `pi.currentWeapon`, `pi.lastWeapon`, `pi.pendingWeapon` and additional values. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this UI players missionpack operation. |
| `headmodel` | `dynamic` | — | Value used by `UI_RegisterClientModelname(source,pi,model,headmodel,teamName)`. |
| `teamName` | `dynamic` | — | Team name used for the menu or model selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L364)

<a id="function-function-mq3-client-ui-players-missionpack-ui-playerinfo-setweapon-function-ui-playerinfo-setweapon-source-pi-weaponnum-src-mq3-client-ui-players-missionpack-ml-1390909700"></a>
### UI_PlayerInfo_SetWeapon

```ml
function UI_PlayerInfo_SetWeapon(source, pi, weaponNum)
```

UI_PlayerInfo_SetWeapon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `if path!="" then pi.weaponModel=register(source,"model",path) end if`. |
| `pi` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `pi.currentWeapon`, `pi.realWeapon`, `pi.weaponModel`, `pi.barrelModel` and additional values. |
| `weaponNum` | `dynamic` | — | Quake III weapon identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L135)

<a id="function-function-mq3-client-ui-players-missionpack-ui-positionentityontag-function-ui-positionentityontag-entity-parent-orientation-src-mq3-client-ui-players-missionpack-ml-273986863"></a>
### UI_PositionEntityOnTag

```ml
function UI_PositionEntityOnTag(entity, parent, orientation)
```

UI_PositionEntityOnTag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `entity.origin`, `entity.axis`, `entity.backlerp`. |
| `parent` | `dynamic` | — | Record read through `parent.origin`, `parent.axis`, `parent.backlerp`. |
| `orientation` | `dynamic` | — | Record read through `orientation.found`, `orientation.origin`, `orientation.axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L177)

<a id="function-function-mq3-client-ui-players-missionpack-ui-positionrotatedentityontag-function-ui-positionrotatedentityontag-entity-parent-orientation-src-mq3-client-ui-players-missionpack-ml-113978745"></a>
### UI_PositionRotatedEntityOnTag

```ml
function UI_PositionRotatedEntityOnTag(entity, parent, orientation)
```

UI_PositionRotatedEntityOnTag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `entity.origin`, `entity.axis`. |
| `parent` | `dynamic` | — | Record read through `parent.origin`, `parent.axis`. |
| `orientation` | `dynamic` | — | Record read through `orientation.found`, `orientation.origin`, `orientation.axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L182)

<a id="function-function-mq3-client-ui-players-missionpack-ui-registerclientmodelname-function-ui-registerclientmodelname-source-pi-modelskinname-headmodelskinname-teamname-src-mq3-client-ui-players-missionpack-ml-974158192"></a>
### UI_RegisterClientModelname

```ml
function UI_RegisterClientModelname(source, pi, modelSkinName, headModelSkinName, teamName)
```

UI_RegisterClientModelname

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `pi.legsModel=register(source,"model","models/players/"+model+"/lower.md3")`. |
| `pi` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `pi.torsoModel`, `pi.headModel`, `pi.legsModel`, `pi.animations`. |
| `modelSkinName` | `dynamic` | — | Sequence whose length/content is inspected by `UI_RegisterClientModelname`. |
| `headModelSkinName` | `dynamic` | — | Sequence whose length/content is inspected by `UI_RegisterClientModelname`. |
| `teamName` | `dynamic` | — | Team name used for the menu or model selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L344)

<a id="function-function-mq3-client-ui-players-missionpack-ui-registerclientskin-function-ui-registerclientskin-source-pi-modelname-skinname-headmodelname-headskinname-teamname-src-mq3-client-ui-players-missionpack-ml-1874510312"></a>
### UI_RegisterClientSkin

```ml
function UI_RegisterClientSkin(source, pi, modelName, skinName, headModelName, headSkinName, teamName)
```

UI_RegisterClientSkin

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `pi.legsSkin=register(source,"skin",prefix+"lower_"+skinName+".skin")`. |
| `pi` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `pi.legsSkin`, `pi.torsoSkin`, `pi.headSkin`. |
| `modelName` | `dynamic` | — | Value used by `prefix="models/players/"+modelName+"/"`. |
| `skinName` | `dynamic` | — | Value used by `pi.legsSkin=register(source,"skin",prefix+"lower_"+skinName+".skin")`. |
| `headModelName` | `dynamic` | — | Value used by `headPath=UI_FindClientHeadFile(source,"",128,teamName,headModelName,headSkinName,"head","skin")`. |
| `headSkinName` | `dynamic` | — | Value used by `headPath=UI_FindClientHeadFile(source,"",128,teamName,headModelName,headSkinName,"head","skin")`. |
| `teamName` | `dynamic` | — | Team name used for the menu or model selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L316)

<a id="function-function-mq3-client-ui-players-missionpack-ui-runlerpframe-function-ui-runlerpframe-pi-lf-newanimation-realtime-src-mq3-client-ui-players-missionpack-ml-1014240848"></a>
### UI_RunLerpFrame

```ml
function UI_RunLerpFrame(pi, lf, newAnimation, realtime)
```

UI_RunLerpFrame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Player-model preview state with model parts, animations and orientation. |
| `lf` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `lf.oldFrame`, `lf.oldFrameTime`, `lf.frameTime`, `lf.frame` and additional values. |
| `newAnimation` | `dynamic` | — | Value used by `if newAnimation!=lf.animationNumber or lf.animation==void then selected=UI_SetLerpFrameAnimation(pi,lf,newAnimation)`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L193)

<a id="function-function-mq3-client-ui-players-missionpack-ui-setlegsanim-function-ui-setlegsanim-pi-anim-src-mq3-client-ui-players-missionpack-ml-1049735762"></a>
### UI_SetLegsAnim

```ml
function UI_SetLegsAnim(pi, anim)
```

UI_SetLegsAnim

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `pi.pendingLegsAnim`. |
| `anim` | `dynamic` | — | Value used by `if pi.pendingLegsAnim!=0 then anim=pi.pendingLegsAnim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L151)

<a id="function-function-mq3-client-ui-players-missionpack-ui-setlerpframeanimation-function-ui-setlerpframeanimation-pi-lf-newanimation-src-mq3-client-ui-players-missionpack-ml-10302829"></a>
### UI_SetLerpFrameAnimation

```ml
function UI_SetLerpFrameAnimation(pi, lf, newAnimation)
```

UI_SetLerpFrameAnimation

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Player-model preview state with model parts, animations and orientation. Record read through `pi.animations`. |
| `lf` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `lf.animationNumber`, `lf.animation`, `lf.animationTime`. |
| `newAnimation` | `dynamic` | — | Value assigned to `lf.animationNumber`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L187)

<a id="function-function-mq3-client-ui-players-missionpack-ui-settorsoanim-function-ui-settorsoanim-pi-anim-src-mq3-client-ui-players-missionpack-ml-1710966212"></a>
### UI_SetTorsoAnim

```ml
function UI_SetTorsoAnim(pi, anim)
```

UI_SetTorsoAnim

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `pi.pendingTorsoAnim`. |
| `anim` | `dynamic` | — | Value used by `if pi.pendingTorsoAnim!=0 then anim=pi.pendingTorsoAnim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L159)

<a id="function-function-mq3-client-ui-players-missionpack-ui-swingangles-function-ui-swingangles-destination-swingtolerance-clamptolerance-speed-angle-swinging-frametime-src-mq3-client-ui-players-missionpack-ml-850102301"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L212)

<a id="constant-constant-mq3-client-ui-players-missionpack-ui-timer-attack-const-ui-timer-attack-500-src-mq3-client-ui-players-missionpack-ml-530941844"></a>
### UI_TIMER_ATTACK

```ml
const UI_TIMER_ATTACK = 500
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L22)

<a id="constant-constant-mq3-client-ui-players-missionpack-ui-timer-gesture-const-ui-timer-gesture-2300-src-mq3-client-ui-players-missionpack-ml-474466982"></a>
### UI_TIMER_GESTURE

```ml
const UI_TIMER_GESTURE = 2300
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L18)

<a id="constant-constant-mq3-client-ui-players-missionpack-ui-timer-jump-const-ui-timer-jump-1000-src-mq3-client-ui-players-missionpack-ml-781038410"></a>
### UI_TIMER_JUMP

```ml
const UI_TIMER_JUMP = 1000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L19)

<a id="constant-constant-mq3-client-ui-players-missionpack-ui-timer-land-const-ui-timer-land-130-src-mq3-client-ui-players-missionpack-ml-1671840229"></a>
### UI_TIMER_LAND

```ml
const UI_TIMER_LAND = 130
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L20)

<a id="constant-constant-mq3-client-ui-players-missionpack-ui-timer-muzzle-flash-const-ui-timer-muzzle-flash-20-src-mq3-client-ui-players-missionpack-ml-367573431"></a>
### UI_TIMER_MUZZLE_FLASH

```ml
const UI_TIMER_MUZZLE_FLASH = 20
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L23)

<a id="constant-constant-mq3-client-ui-players-missionpack-ui-timer-weapon-delay-const-ui-timer-weapon-delay-250-src-mq3-client-ui-players-missionpack-ml-258352868"></a>
### UI_TIMER_WEAPON_DELAY

```ml
const UI_TIMER_WEAPON_DELAY = 250
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L24)

<a id="constant-constant-mq3-client-ui-players-missionpack-ui-timer-weapon-switch-const-ui-timer-weapon-switch-300-src-mq3-client-ui-players-missionpack-ml-1949773904"></a>
### UI_TIMER_WEAPON_SWITCH

```ml
const UI_TIMER_WEAPON_SWITCH = 300
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L21)

<a id="function-function-mq3-client-ui-players-missionpack-ui-torsosequencing-function-ui-torsosequencing-source-pi-src-mq3-client-ui-players-missionpack-ml-2033594514"></a>
### UI_TorsoSequencing

```ml
function UI_TorsoSequencing(source, pi)
```

UI_TorsoSequencing

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `if current==TORSO_DROP then UI_PlayerInfo_SetWeapon(source,pi,pi.weapon)`. |
| `pi` | `dynamic` | — | Mutable UI players missionpack record/storage; this routine assigns `pi.torsoAnimationTimer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L163)

<a id="function-function-mq3-client-ui-players-missionpack-weaponpath-function-weaponpath-weapon-src-mq3-client-ui-players-missionpack-ml-1698091880"></a>
### weaponPath

```ml
function weaponPath(weapon)
```

Evaluates UI players missionpack `weaponPath` and returns `""`, `names[weapon]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — | Value used by `if weapon<0 or weapon>=len(names) then return "" end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L121)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-bfg-const-wp-bfg-9-src-mq3-client-ui-players-missionpack-ml-970159064"></a>
### WP_BFG

```ml
const WP_BFG = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L51)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-gauntlet-const-wp-gauntlet-1-src-mq3-client-ui-players-missionpack-ml-1204237780"></a>
### WP_GAUNTLET

```ml
const WP_GAUNTLET = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L43)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-grappling-hook-const-wp-grappling-hook-10-src-mq3-client-ui-players-missionpack-ml-2015208862"></a>
### WP_GRAPPLING_HOOK

```ml
const WP_GRAPPLING_HOOK = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L52)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-grenade-launcher-const-wp-grenade-launcher-4-src-mq3-client-ui-players-missionpack-ml-842205677"></a>
### WP_GRENADE_LAUNCHER

```ml
const WP_GRENADE_LAUNCHER = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L46)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-lightning-const-wp-lightning-6-src-mq3-client-ui-players-missionpack-ml-1419968821"></a>
### WP_LIGHTNING

```ml
const WP_LIGHTNING = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L48)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-machinegun-const-wp-machinegun-2-src-mq3-client-ui-players-missionpack-ml-72048351"></a>
### WP_MACHINEGUN

```ml
const WP_MACHINEGUN = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L44)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-none-const-wp-none-0-src-mq3-client-ui-players-missionpack-ml-665097521"></a>
### WP_NONE

```ml
const WP_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L42)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-plasmagun-const-wp-plasmagun-8-src-mq3-client-ui-players-missionpack-ml-1978123187"></a>
### WP_PLASMAGUN

```ml
const WP_PLASMAGUN = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L50)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-railgun-const-wp-railgun-7-src-mq3-client-ui-players-missionpack-ml-230779784"></a>
### WP_RAILGUN

```ml
const WP_RAILGUN = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L49)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-rocket-launcher-const-wp-rocket-launcher-5-src-mq3-client-ui-players-missionpack-ml-1228942268"></a>
### WP_ROCKET_LAUNCHER

```ml
const WP_ROCKET_LAUNCHER = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L47)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-shotgun-const-wp-shotgun-3-src-mq3-client-ui-players-missionpack-ml-1355866148"></a>
### WP_SHOTGUN

```ml
const WP_SHOTGUN = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L45)
