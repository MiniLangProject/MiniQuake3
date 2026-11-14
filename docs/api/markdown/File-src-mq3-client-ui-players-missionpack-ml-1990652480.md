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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L70)

- [mq3.client.ui_players_missionpack.Action](Type-mq3-client-ui-players-missionpack-action-845694746.md) — struct
<a id="function-function-mq3-client-ui-players-missionpack-anglesubtract-function-anglesubtract-a-b-src-mq3-client-ui-players-missionpack-ml-52532333"></a>
### angleSubtract

```ml
function angleSubtract(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L69)

<a id="constant-constant-mq3-client-ui-players-missionpack-anim-togglebit-const-anim-togglebit-128-src-mq3-client-ui-players-missionpack-ml-1116551162"></a>
### ANIM_TOGGLEBIT

```ml
const ANIM_TOGGLEBIT = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L23)

- [mq3.client.ui_players_missionpack.Animation](Type-mq3-client-ui-players-missionpack-animation-1510277646.md) — struct
<a id="function-function-mq3-client-ui-players-missionpack-animationtext-function-animationtext-source-path-src-mq3-client-ui-players-missionpack-ml-1063134764"></a>
### animationText

```ml
function animationText(source, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L66)

<a id="function-function-mq3-client-ui-players-missionpack-assetsource-function-assetsource-files-animationfiles-retailactive-src-mq3-client-ui-players-missionpack-ml-855961133"></a>
### assetSource

```ml
function assetSource(files, animationFiles, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `files` | `dynamic` | — |  |
| `animationFiles` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L61)

- [mq3.client.ui_players_missionpack.AssetSource](Type-mq3-client-ui-players-missionpack-assetsource-2019359989.md) — struct
<a id="constant-constant-mq3-client-ui-players-missionpack-both-death1-const-both-death1-0-src-mq3-client-ui-players-missionpack-ml-1168858269"></a>
### BOTH_DEATH1

```ml
const BOTH_DEATH1 = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L25)

<a id="function-function-mq3-client-ui-players-missionpack-create-function-create-src-mq3-client-ui-players-missionpack-ml-1580926680"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L62)

<a id="function-function-mq3-client-ui-players-missionpack-emit-function-emit-list-boundary-kind-name-detail-number-vector-retailactive-src-mq3-client-ui-players-missionpack-ml-358127989"></a>
### emit

```ml
function emit(list, boundary, kind, name, detail, number, vector, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `detail` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `vector` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L63)

<a id="function-function-mq3-client-ui-players-missionpack-exists-function-exists-source-path-src-mq3-client-ui-players-missionpack-ml-1311440846"></a>
### exists

```ml
function exists(source, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L65)

<a id="function-function-mq3-client-ui-players-missionpack-flashcolor-function-flashcolor-weapon-src-mq3-client-ui-players-missionpack-ml-1632750156"></a>
### flashColor

```ml
function flashColor(weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L76)

<a id="function-function-mq3-client-ui-players-missionpack-identityaxis-function-identityaxis-src-mq3-client-ui-players-missionpack-ml-542679584"></a>
### identityAxis

```ml
function identityAxis()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L59)

<a id="constant-constant-mq3-client-ui-players-missionpack-jump-height-const-jump-height-56-src-mq3-client-ui-players-missionpack-ml-168940452"></a>
### JUMP_HEIGHT

```ml
const JUMP_HEIGHT = 56
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L22)

<a id="constant-constant-mq3-client-ui-players-missionpack-legs-idle-const-legs-idle-22-src-mq3-client-ui-players-missionpack-ml-1981840013"></a>
### LEGS_IDLE

```ml
const LEGS_IDLE = 22
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L36)

<a id="constant-constant-mq3-client-ui-players-missionpack-legs-jump-const-legs-jump-18-src-mq3-client-ui-players-missionpack-ml-381293746"></a>
### LEGS_JUMP

```ml
const LEGS_JUMP = 18
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L34)

<a id="constant-constant-mq3-client-ui-players-missionpack-legs-land-const-legs-land-19-src-mq3-client-ui-players-missionpack-ml-981016871"></a>
### LEGS_LAND

```ml
const LEGS_LAND = 19
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L35)

<a id="constant-constant-mq3-client-ui-players-missionpack-legs-turn-const-legs-turn-24-src-mq3-client-ui-players-missionpack-ml-1219188195"></a>
### LEGS_TURN

```ml
const LEGS_TURN = 24
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L37)

<a id="constant-constant-mq3-client-ui-players-missionpack-legs-walkcr-const-legs-walkcr-13-src-mq3-client-ui-players-missionpack-ml-12463733"></a>
### LEGS_WALKCR

```ml
const LEGS_WALKCR = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L33)

<a id="function-function-mq3-client-ui-players-missionpack-lerpframe-function-lerpframe-src-mq3-client-ui-players-missionpack-ml-563050236"></a>
### lerpFrame

```ml
function lerpFrame()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L60)

- [mq3.client.ui_players_missionpack.LerpFrame](Type-mq3-client-ui-players-missionpack-lerpframe-2061827178.md) — struct
<a id="function-function-mq3-client-ui-players-missionpack-matrixmultiply-function-matrixmultiply-a-b-src-mq3-client-ui-players-missionpack-ml-2097119895"></a>
### matrixMultiply

```ml
function matrixMultiply(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L68)

<a id="constant-constant-mq3-client-ui-players-missionpack-max-animations-const-max-animations-31-src-mq3-client-ui-players-missionpack-ml-1444842123"></a>
### MAX_ANIMATIONS

```ml
const MAX_ANIMATIONS = 31
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L24)

<a id="function-function-mq3-client-ui-players-missionpack-numberstarts-function-numberstarts-token-src-mq3-client-ui-players-missionpack-ml-2005233033"></a>
### numberStarts

```ml
function numberStarts(token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L196)

- [mq3.client.ui_players_missionpack.Orientation](Type-mq3-client-ui-players-missionpack-orientation-999988426.md) — struct
- [mq3.client.ui_players_missionpack.PlayerInfo](Type-mq3-client-ui-players-missionpack-playerinfo-724093749.md) — struct
<a id="function-function-mq3-client-ui-players-missionpack-register-function-register-source-kind-path-src-mq3-client-ui-players-missionpack-ml-2043759808"></a>
### register

```ml
function register(source, kind, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L67)

<a id="function-function-mq3-client-ui-players-missionpack-renderentity-function-renderentity-kind-model-skin-tag-src-mq3-client-ui-players-missionpack-ml-460855954"></a>
### renderEntity

```ml
function renderEntity(kind, model, skin, tag)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `skin` | `dynamic` | — |  |
| `tag` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L146)

- [mq3.client.ui_players_missionpack.RenderEntity](Type-mq3-client-ui-players-missionpack-renderentity-7579403.md) — struct
<a id="function-function-mq3-client-ui-players-missionpack-resetinfo-function-resetinfo-pi-src-mq3-client-ui-players-missionpack-ml-1418058629"></a>
### resetInfo

```ml
function resetInfo(pi)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L215)

<a id="function-function-mq3-client-ui-players-missionpack-same-function-same-a-b-src-mq3-client-ui-players-missionpack-ml-388874943"></a>
### same

```ml
function same(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L64)

<a id="function-function-mq3-client-ui-players-missionpack-stripmd3-function-stripmd3-path-src-mq3-client-ui-players-missionpack-ml-1631652875"></a>
### stripMd3

```ml
function stripMd3(path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L75)

<a id="extern_function-extern-function-mq3-client-ui-players-missionpack-tan-extern-function-tan-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-client-ui-players-missionpack-ml-931830932"></a>
### tan

```ml
extern function tan(value as double) from "ucrtbase.dll" returns double
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L13)

<a id="constant-constant-mq3-client-ui-players-missionpack-torso-attack-const-torso-attack-7-src-mq3-client-ui-players-missionpack-ml-59636000"></a>
### TORSO_ATTACK

```ml
const TORSO_ATTACK = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L27)

<a id="constant-constant-mq3-client-ui-players-missionpack-torso-attack2-const-torso-attack2-8-src-mq3-client-ui-players-missionpack-ml-309520173"></a>
### TORSO_ATTACK2

```ml
const TORSO_ATTACK2 = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L28)

<a id="constant-constant-mq3-client-ui-players-missionpack-torso-drop-const-torso-drop-9-src-mq3-client-ui-players-missionpack-ml-485971536"></a>
### TORSO_DROP

```ml
const TORSO_DROP = 9
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L29)

<a id="constant-constant-mq3-client-ui-players-missionpack-torso-gesture-const-torso-gesture-6-src-mq3-client-ui-players-missionpack-ml-1821024659"></a>
### TORSO_GESTURE

```ml
const TORSO_GESTURE = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L26)

<a id="constant-constant-mq3-client-ui-players-missionpack-torso-getflag-const-torso-getflag-25-src-mq3-client-ui-players-missionpack-ml-1962889462"></a>
### TORSO_GETFLAG

```ml
const TORSO_GETFLAG = 25
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L38)

<a id="constant-constant-mq3-client-ui-players-missionpack-torso-raise-const-torso-raise-10-src-mq3-client-ui-players-missionpack-ml-957758934"></a>
### TORSO_RAISE

```ml
const TORSO_RAISE = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L30)

<a id="constant-constant-mq3-client-ui-players-missionpack-torso-stand-const-torso-stand-11-src-mq3-client-ui-players-missionpack-ml-866474979"></a>
### TORSO_STAND

```ml
const TORSO_STAND = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L31)

<a id="constant-constant-mq3-client-ui-players-missionpack-torso-stand2-const-torso-stand2-12-src-mq3-client-ui-players-missionpack-ml-847692146"></a>
### TORSO_STAND2

```ml
const TORSO_STAND2 = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L32)

<a id="function-function-mq3-client-ui-players-missionpack-ui-drawplayer-function-ui-drawplayer-source-x-y-w-h-pi-time-frametime-retailactive-src-mq3-client-ui-players-missionpack-ml-1312023888"></a>
### UI_DrawPlayer

```ml
function UI_DrawPlayer(source, x, y, w, h, pi, time, frametime, retailActive)
```

UI_DrawPlayer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `pi` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `frametime` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L148)

<a id="function-function-mq3-client-ui-players-missionpack-ui-fileexists-function-ui-fileexists-source-filename-src-mq3-client-ui-players-missionpack-ml-902819966"></a>
### UI_FileExists

```ml
function UI_FileExists(source, filename)
```

UI_FileExists

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L160)

<a id="function-function-mq3-client-ui-players-missionpack-ui-findclientheadfile-function-ui-findclientheadfile-source-filename-length-teamname-headmodelname-headskinname-base-ext-src-mq3-client-ui-players-missionpack-ml-733662416"></a>
### UI_FindClientHeadFile

```ml
function UI_FindClientHeadFile(source, filename, length, teamName, headModelName, headSkinName, base, ext)
```

UI_FindClientHeadFile The C function returns qboolean and writes filename.  Returning the selected path preserves both results without an unsafe writable character buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |
| `teamName` | `dynamic` | — |  |
| `headModelName` | `dynamic` | — |  |
| `headSkinName` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `ext` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L165)

<a id="function-function-mq3-client-ui-players-missionpack-ui-forcelegsanim-function-ui-forcelegsanim-pi-anim-src-mq3-client-ui-players-missionpack-ml-1038508394"></a>
### UI_ForceLegsAnim

```ml
function UI_ForceLegsAnim(pi, anim)
```

UI_ForceLegsAnim

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L89)

<a id="function-function-mq3-client-ui-players-missionpack-ui-forcetorsoanim-function-ui-forcetorsoanim-pi-anim-src-mq3-client-ui-players-missionpack-ml-587499954"></a>
### UI_ForceTorsoAnim

```ml
function UI_ForceTorsoAnim(pi, anim)
```

UI_ForceTorsoAnim

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L93)

<a id="function-function-mq3-client-ui-players-missionpack-ui-legssequencing-function-ui-legssequencing-pi-src-mq3-client-ui-players-missionpack-ml-144399807"></a>
### UI_LegsSequencing

```ml
function UI_LegsSequencing(pi)
```

UI_LegsSequencing

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L103)

<a id="function-function-mq3-client-ui-players-missionpack-ui-machinegunspinangle-function-ui-machinegunspinangle-pi-realtime-src-mq3-client-ui-players-missionpack-ml-2124270174"></a>
### UI_MachinegunSpinAngle

```ml
function UI_MachinegunSpinAngle(pi, realtime)
```

UI_MachinegunSpinAngle

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L135)

<a id="function-function-mq3-client-ui-players-missionpack-ui-movediradjustment-function-ui-movediradjustment-pi-src-mq3-client-ui-players-missionpack-ml-74804255"></a>
### UI_MovedirAdjustment

```ml
function UI_MovedirAdjustment(pi)
```

UI_MovedirAdjustment

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L126)

<a id="function-function-mq3-client-ui-players-missionpack-ui-parseanimationfile-function-ui-parseanimationfile-filename-text-src-mq3-client-ui-players-missionpack-ml-1099236066"></a>
### UI_ParseAnimationFile

```ml
function UI_ParseAnimationFile(filename, text)
```

UI_ParseAnimationFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `filename` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L198)

<a id="function-function-mq3-client-ui-players-missionpack-ui-playerangles-function-ui-playerangles-pi-frametime-src-mq3-client-ui-players-missionpack-ml-137939897"></a>
### UI_PlayerAngles

```ml
function UI_PlayerAngles(pi, frametime)
```

UI_PlayerAngles

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |
| `frametime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L128)

<a id="function-function-mq3-client-ui-players-missionpack-ui-playeranimation-function-ui-playeranimation-source-pi-frametime-realtime-src-mq3-client-ui-players-missionpack-ml-1667831307"></a>
### UI_PlayerAnimation

```ml
function UI_PlayerAnimation(source, pi, frametime, realtime)
```

UI_PlayerAnimation

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `pi` | `dynamic` | — |  |
| `frametime` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L119)

<a id="function-function-mq3-client-ui-players-missionpack-ui-playerfloatsprite-function-ui-playerfloatsprite-pi-origin-shader-retailactive-src-mq3-client-ui-players-missionpack-ml-1369855117"></a>
### UI_PlayerFloatSprite

```ml
function UI_PlayerFloatSprite(pi, origin, shader, retailActive)
```

UI_PlayerFloatSprite

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L133)

<a id="function-function-mq3-client-ui-players-missionpack-ui-playerinfo-setinfo-function-ui-playerinfo-setinfo-source-pi-legsanim-torsoanim-viewangles-moveangles-weaponnumber-chat-src-mq3-client-ui-players-missionpack-ml-564790557"></a>
### UI_PlayerInfo_SetInfo

```ml
function UI_PlayerInfo_SetInfo(source, pi, legsAnim, torsoAnim, viewAngles, moveAngles, weaponNumber, chat)
```

UI_PlayerInfo_SetInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `pi` | `dynamic` | — |  |
| `legsAnim` | `dynamic` | — |  |
| `torsoAnim` | `dynamic` | — |  |
| `viewAngles` | `dynamic` | — |  |
| `moveAngles` | `dynamic` | — |  |
| `weaponNumber` | `dynamic` | — |  |
| `chat` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L219)

<a id="function-function-mq3-client-ui-players-missionpack-ui-playerinfo-setmodel-function-ui-playerinfo-setmodel-source-pi-model-headmodel-teamname-src-mq3-client-ui-players-missionpack-ml-761127568"></a>
### UI_PlayerInfo_SetModel

```ml
function UI_PlayerInfo_SetModel(source, pi, model, headmodel, teamName)
```

UI_PlayerInfo_SetModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `pi` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `headmodel` | `dynamic` | — |  |
| `teamName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L217)

<a id="function-function-mq3-client-ui-players-missionpack-ui-playerinfo-setweapon-function-ui-playerinfo-setweapon-source-pi-weaponnum-src-mq3-client-ui-players-missionpack-ml-1390909700"></a>
### UI_PlayerInfo_SetWeapon

```ml
function UI_PlayerInfo_SetWeapon(source, pi, weaponNum)
```

UI_PlayerInfo_SetWeapon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `pi` | `dynamic` | — |  |
| `weaponNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L79)

<a id="function-function-mq3-client-ui-players-missionpack-ui-positionentityontag-function-ui-positionentityontag-entity-parent-orientation-src-mq3-client-ui-players-missionpack-ml-273986863"></a>
### UI_PositionEntityOnTag

```ml
function UI_PositionEntityOnTag(entity, parent, orientation)
```

UI_PositionEntityOnTag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — |  |
| `parent` | `dynamic` | — |  |
| `orientation` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L107)

<a id="function-function-mq3-client-ui-players-missionpack-ui-positionrotatedentityontag-function-ui-positionrotatedentityontag-entity-parent-orientation-src-mq3-client-ui-players-missionpack-ml-113978745"></a>
### UI_PositionRotatedEntityOnTag

```ml
function UI_PositionRotatedEntityOnTag(entity, parent, orientation)
```

UI_PositionRotatedEntityOnTag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — |  |
| `parent` | `dynamic` | — |  |
| `orientation` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L109)

<a id="function-function-mq3-client-ui-players-missionpack-ui-registerclientmodelname-function-ui-registerclientmodelname-source-pi-modelskinname-headmodelskinname-teamname-src-mq3-client-ui-players-missionpack-ml-974158192"></a>
### UI_RegisterClientModelname

```ml
function UI_RegisterClientModelname(source, pi, modelSkinName, headModelSkinName, teamName)
```

UI_RegisterClientModelname

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `pi` | `dynamic` | — |  |
| `modelSkinName` | `dynamic` | — |  |
| `headModelSkinName` | `dynamic` | — |  |
| `teamName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L204)

<a id="function-function-mq3-client-ui-players-missionpack-ui-registerclientskin-function-ui-registerclientskin-source-pi-modelname-skinname-headmodelname-headskinname-teamname-src-mq3-client-ui-players-missionpack-ml-1874510312"></a>
### UI_RegisterClientSkin

```ml
function UI_RegisterClientSkin(source, pi, modelName, skinName, headModelName, headSkinName, teamName)
```

UI_RegisterClientSkin

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `pi` | `dynamic` | — |  |
| `modelName` | `dynamic` | — |  |
| `skinName` | `dynamic` | — |  |
| `headModelName` | `dynamic` | — |  |
| `headSkinName` | `dynamic` | — |  |
| `teamName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L185)

<a id="function-function-mq3-client-ui-players-missionpack-ui-runlerpframe-function-ui-runlerpframe-pi-lf-newanimation-realtime-src-mq3-client-ui-players-missionpack-ml-1014240848"></a>
### UI_RunLerpFrame

```ml
function UI_RunLerpFrame(pi, lf, newAnimation, realtime)
```

UI_RunLerpFrame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |
| `lf` | `dynamic` | — |  |
| `newAnimation` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L113)

<a id="function-function-mq3-client-ui-players-missionpack-ui-setlegsanim-function-ui-setlegsanim-pi-anim-src-mq3-client-ui-players-missionpack-ml-1049735762"></a>
### UI_SetLegsAnim

```ml
function UI_SetLegsAnim(pi, anim)
```

UI_SetLegsAnim

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L91)

<a id="function-function-mq3-client-ui-players-missionpack-ui-setlerpframeanimation-function-ui-setlerpframeanimation-pi-lf-newanimation-src-mq3-client-ui-players-missionpack-ml-10302829"></a>
### UI_SetLerpFrameAnimation

```ml
function UI_SetLerpFrameAnimation(pi, lf, newAnimation)
```

UI_SetLerpFrameAnimation

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |
| `lf` | `dynamic` | — |  |
| `newAnimation` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L111)

<a id="function-function-mq3-client-ui-players-missionpack-ui-settorsoanim-function-ui-settorsoanim-pi-anim-src-mq3-client-ui-players-missionpack-ml-1710966212"></a>
### UI_SetTorsoAnim

```ml
function UI_SetTorsoAnim(pi, anim)
```

UI_SetTorsoAnim

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L95)

<a id="function-function-mq3-client-ui-players-missionpack-ui-swingangles-function-ui-swingangles-destination-swingtolerance-clamptolerance-speed-angle-swinging-frametime-src-mq3-client-ui-players-missionpack-ml-850102301"></a>
### UI_SwingAngles

```ml
function UI_SwingAngles(destination, swingTolerance, clampTolerance, speed, angle, swinging, frametime)
```

UI_SwingAngles

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `swingTolerance` | `dynamic` | — |  |
| `clampTolerance` | `dynamic` | — |  |
| `speed` | `dynamic` | — |  |
| `angle` | `dynamic` | — |  |
| `swinging` | `dynamic` | — |  |
| `frametime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L121)

<a id="constant-constant-mq3-client-ui-players-missionpack-ui-timer-attack-const-ui-timer-attack-500-src-mq3-client-ui-players-missionpack-ml-530941844"></a>
### UI_TIMER_ATTACK

```ml
const UI_TIMER_ATTACK = 500
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L19)

<a id="constant-constant-mq3-client-ui-players-missionpack-ui-timer-gesture-const-ui-timer-gesture-2300-src-mq3-client-ui-players-missionpack-ml-474466982"></a>
### UI_TIMER_GESTURE

```ml
const UI_TIMER_GESTURE = 2300
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L15)

<a id="constant-constant-mq3-client-ui-players-missionpack-ui-timer-jump-const-ui-timer-jump-1000-src-mq3-client-ui-players-missionpack-ml-781038410"></a>
### UI_TIMER_JUMP

```ml
const UI_TIMER_JUMP = 1000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L16)

<a id="constant-constant-mq3-client-ui-players-missionpack-ui-timer-land-const-ui-timer-land-130-src-mq3-client-ui-players-missionpack-ml-1671840229"></a>
### UI_TIMER_LAND

```ml
const UI_TIMER_LAND = 130
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L17)

<a id="constant-constant-mq3-client-ui-players-missionpack-ui-timer-muzzle-flash-const-ui-timer-muzzle-flash-20-src-mq3-client-ui-players-missionpack-ml-367573431"></a>
### UI_TIMER_MUZZLE_FLASH

```ml
const UI_TIMER_MUZZLE_FLASH = 20
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L20)

<a id="constant-constant-mq3-client-ui-players-missionpack-ui-timer-weapon-delay-const-ui-timer-weapon-delay-250-src-mq3-client-ui-players-missionpack-ml-258352868"></a>
### UI_TIMER_WEAPON_DELAY

```ml
const UI_TIMER_WEAPON_DELAY = 250
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L21)

<a id="constant-constant-mq3-client-ui-players-missionpack-ui-timer-weapon-switch-const-ui-timer-weapon-switch-300-src-mq3-client-ui-players-missionpack-ml-1949773904"></a>
### UI_TIMER_WEAPON_SWITCH

```ml
const UI_TIMER_WEAPON_SWITCH = 300
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L18)

<a id="function-function-mq3-client-ui-players-missionpack-ui-torsosequencing-function-ui-torsosequencing-source-pi-src-mq3-client-ui-players-missionpack-ml-2033594514"></a>
### UI_TorsoSequencing

```ml
function UI_TorsoSequencing(source, pi)
```

UI_TorsoSequencing

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `pi` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L97)

<a id="function-function-mq3-client-ui-players-missionpack-weaponpath-function-weaponpath-weapon-src-mq3-client-ui-players-missionpack-ml-1698091880"></a>
### weaponPath

```ml
function weaponPath(weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L72)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-bfg-const-wp-bfg-9-src-mq3-client-ui-players-missionpack-ml-970159064"></a>
### WP_BFG

```ml
const WP_BFG = 9
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L48)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-gauntlet-const-wp-gauntlet-1-src-mq3-client-ui-players-missionpack-ml-1204237780"></a>
### WP_GAUNTLET

```ml
const WP_GAUNTLET = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L40)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-grappling-hook-const-wp-grappling-hook-10-src-mq3-client-ui-players-missionpack-ml-2015208862"></a>
### WP_GRAPPLING_HOOK

```ml
const WP_GRAPPLING_HOOK = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L49)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-grenade-launcher-const-wp-grenade-launcher-4-src-mq3-client-ui-players-missionpack-ml-842205677"></a>
### WP_GRENADE_LAUNCHER

```ml
const WP_GRENADE_LAUNCHER = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L43)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-lightning-const-wp-lightning-6-src-mq3-client-ui-players-missionpack-ml-1419968821"></a>
### WP_LIGHTNING

```ml
const WP_LIGHTNING = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L45)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-machinegun-const-wp-machinegun-2-src-mq3-client-ui-players-missionpack-ml-72048351"></a>
### WP_MACHINEGUN

```ml
const WP_MACHINEGUN = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L41)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-none-const-wp-none-0-src-mq3-client-ui-players-missionpack-ml-665097521"></a>
### WP_NONE

```ml
const WP_NONE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L39)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-plasmagun-const-wp-plasmagun-8-src-mq3-client-ui-players-missionpack-ml-1978123187"></a>
### WP_PLASMAGUN

```ml
const WP_PLASMAGUN = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L47)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-railgun-const-wp-railgun-7-src-mq3-client-ui-players-missionpack-ml-230779784"></a>
### WP_RAILGUN

```ml
const WP_RAILGUN = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L46)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-rocket-launcher-const-wp-rocket-launcher-5-src-mq3-client-ui-players-missionpack-ml-1228942268"></a>
### WP_ROCKET_LAUNCHER

```ml
const WP_ROCKET_LAUNCHER = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L44)

<a id="constant-constant-mq3-client-ui-players-missionpack-wp-shotgun-const-wp-shotgun-3-src-mq3-client-ui-players-missionpack-ml-1355866148"></a>
### WP_SHOTGUN

```ml
const WP_SHOTGUN = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L42)
