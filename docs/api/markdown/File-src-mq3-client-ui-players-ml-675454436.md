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
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-players-absolute-function-absolute-value-src-mq3-client-ui-players-ml-2048369229"></a>
### absolute

```ml
function absolute(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L70)

- [mq3.client.ui_players.Action](Type-mq3-client-ui-players-action-2037211834.md) — struct
<a id="function-function-mq3-client-ui-players-anglesubtract-function-anglesubtract-a-b-src-mq3-client-ui-players-ml-1989633821"></a>
### angleSubtract

```ml
function angleSubtract(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L69)

<a id="constant-constant-mq3-client-ui-players-anim-togglebit-const-anim-togglebit-128-src-mq3-client-ui-players-ml-1051420818"></a>
### ANIM_TOGGLEBIT

```ml
const ANIM_TOGGLEBIT = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L23)

- [mq3.client.ui_players.Animation](Type-mq3-client-ui-players-animation-1459264302.md) — struct
<a id="function-function-mq3-client-ui-players-animationtext-function-animationtext-source-path-src-mq3-client-ui-players-ml-2064857744"></a>
### animationText

```ml
function animationText(source, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L66)

<a id="function-function-mq3-client-ui-players-assetsource-function-assetsource-files-animationfiles-retailactive-src-mq3-client-ui-players-ml-227950237"></a>
### assetSource

```ml
function assetSource(files, animationFiles, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `files` | `dynamic` | — |  |
| `animationFiles` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L61)

- [mq3.client.ui_players.AssetSource](Type-mq3-client-ui-players-assetsource-586603349.md) — struct
<a id="constant-constant-mq3-client-ui-players-both-death1-const-both-death1-0-src-mq3-client-ui-players-ml-120738765"></a>
### BOTH_DEATH1

```ml
const BOTH_DEATH1 = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L25)

<a id="function-function-mq3-client-ui-players-create-function-create-src-mq3-client-ui-players-ml-37526172"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L62)

<a id="function-function-mq3-client-ui-players-emit-function-emit-list-boundary-kind-name-detail-number-vector-retailactive-src-mq3-client-ui-players-ml-1241888437"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L63)

<a id="function-function-mq3-client-ui-players-exists-function-exists-source-path-src-mq3-client-ui-players-ml-2101122758"></a>
### exists

```ml
function exists(source, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L65)

<a id="function-function-mq3-client-ui-players-flashcolor-function-flashcolor-weapon-src-mq3-client-ui-players-ml-1078171984"></a>
### flashColor

```ml
function flashColor(weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L76)

<a id="function-function-mq3-client-ui-players-identityaxis-function-identityaxis-src-mq3-client-ui-players-ml-1746874324"></a>
### identityAxis

```ml
function identityAxis()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L59)

<a id="constant-constant-mq3-client-ui-players-jump-height-const-jump-height-56-src-mq3-client-ui-players-ml-1543089976"></a>
### JUMP_HEIGHT

```ml
const JUMP_HEIGHT = 56
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L22)

<a id="constant-constant-mq3-client-ui-players-legs-idle-const-legs-idle-22-src-mq3-client-ui-players-ml-1237629437"></a>
### LEGS_IDLE

```ml
const LEGS_IDLE = 22
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L36)

<a id="constant-constant-mq3-client-ui-players-legs-jump-const-legs-jump-18-src-mq3-client-ui-players-ml-1743734810"></a>
### LEGS_JUMP

```ml
const LEGS_JUMP = 18
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L34)

<a id="constant-constant-mq3-client-ui-players-legs-land-const-legs-land-19-src-mq3-client-ui-players-ml-37739211"></a>
### LEGS_LAND

```ml
const LEGS_LAND = 19
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L35)

<a id="constant-constant-mq3-client-ui-players-legs-turn-const-legs-turn-24-src-mq3-client-ui-players-ml-1049021255"></a>
### LEGS_TURN

```ml
const LEGS_TURN = 24
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L37)

<a id="constant-constant-mq3-client-ui-players-legs-walkcr-const-legs-walkcr-13-src-mq3-client-ui-players-ml-938400021"></a>
### LEGS_WALKCR

```ml
const LEGS_WALKCR = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L33)

<a id="function-function-mq3-client-ui-players-lerpframe-function-lerpframe-src-mq3-client-ui-players-ml-1099622528"></a>
### lerpFrame

```ml
function lerpFrame()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L60)

- [mq3.client.ui_players.LerpFrame](Type-mq3-client-ui-players-lerpframe-1938263498.md) — struct
<a id="function-function-mq3-client-ui-players-matrixmultiply-function-matrixmultiply-a-b-src-mq3-client-ui-players-ml-1181529083"></a>
### matrixMultiply

```ml
function matrixMultiply(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L68)

<a id="constant-constant-mq3-client-ui-players-max-animations-const-max-animations-31-src-mq3-client-ui-players-ml-1037580607"></a>
### MAX_ANIMATIONS

```ml
const MAX_ANIMATIONS = 31
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L24)

<a id="function-function-mq3-client-ui-players-numberstarts-function-numberstarts-token-src-mq3-client-ui-players-ml-549348745"></a>
### numberStarts

```ml
function numberStarts(token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L159)

- [mq3.client.ui_players.Orientation](Type-mq3-client-ui-players-orientation-1749867754.md) — struct
- [mq3.client.ui_players.PlayerInfo](Type-mq3-client-ui-players-playerinfo-863292821.md) — struct
<a id="function-function-mq3-client-ui-players-register-function-register-source-kind-path-src-mq3-client-ui-players-ml-9576084"></a>
### register

```ml
function register(source, kind, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L67)

<a id="function-function-mq3-client-ui-players-renderentity-function-renderentity-kind-model-skin-tag-src-mq3-client-ui-players-ml-1032246330"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L146)

- [mq3.client.ui_players.RenderEntity](Type-mq3-client-ui-players-renderentity-1022602091.md) — struct
<a id="function-function-mq3-client-ui-players-resetinfo-function-resetinfo-pi-src-mq3-client-ui-players-ml-1889757957"></a>
### resetInfo

```ml
function resetInfo(pi)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L170)

<a id="function-function-mq3-client-ui-players-same-function-same-a-b-src-mq3-client-ui-players-ml-840162419"></a>
### same

```ml
function same(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L64)

<a id="function-function-mq3-client-ui-players-stripmd3-function-stripmd3-path-src-mq3-client-ui-players-ml-926831871"></a>
### stripMd3

```ml
function stripMd3(path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L75)

<a id="extern_function-extern-function-mq3-client-ui-players-tan-extern-function-tan-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-client-ui-players-ml-1638259840"></a>
### tan

```ml
extern function tan(value as double) from "ucrtbase.dll" returns double
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L13)

<a id="constant-constant-mq3-client-ui-players-torso-attack-const-torso-attack-7-src-mq3-client-ui-players-ml-1189246356"></a>
### TORSO_ATTACK

```ml
const TORSO_ATTACK = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L27)

<a id="constant-constant-mq3-client-ui-players-torso-attack2-const-torso-attack2-8-src-mq3-client-ui-players-ml-252759197"></a>
### TORSO_ATTACK2

```ml
const TORSO_ATTACK2 = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L28)

<a id="constant-constant-mq3-client-ui-players-torso-drop-const-torso-drop-9-src-mq3-client-ui-players-ml-1656398596"></a>
### TORSO_DROP

```ml
const TORSO_DROP = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L29)

<a id="constant-constant-mq3-client-ui-players-torso-gesture-const-torso-gesture-6-src-mq3-client-ui-players-ml-1124319863"></a>
### TORSO_GESTURE

```ml
const TORSO_GESTURE = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L26)

<a id="constant-constant-mq3-client-ui-players-torso-getflag-const-torso-getflag-25-src-mq3-client-ui-players-ml-1484118526"></a>
### TORSO_GETFLAG

```ml
const TORSO_GETFLAG = 25
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L38)

<a id="constant-constant-mq3-client-ui-players-torso-raise-const-torso-raise-10-src-mq3-client-ui-players-ml-177538142"></a>
### TORSO_RAISE

```ml
const TORSO_RAISE = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L30)

<a id="constant-constant-mq3-client-ui-players-torso-stand-const-torso-stand-11-src-mq3-client-ui-players-ml-1725754375"></a>
### TORSO_STAND

```ml
const TORSO_STAND = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L31)

<a id="constant-constant-mq3-client-ui-players-torso-stand2-const-torso-stand2-12-src-mq3-client-ui-players-ml-1086288986"></a>
### TORSO_STAND2

```ml
const TORSO_STAND2 = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L32)

<a id="function-function-mq3-client-ui-players-ui-drawplayer-function-ui-drawplayer-source-x-y-w-h-pi-time-frametime-retailactive-src-mq3-client-ui-players-ml-586311076"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L148)

<a id="function-function-mq3-client-ui-players-ui-forcelegsanim-function-ui-forcelegsanim-pi-anim-src-mq3-client-ui-players-ml-1780204514"></a>
### UI_ForceLegsAnim

```ml
function UI_ForceLegsAnim(pi, anim)
```

UI_ForceLegsAnim

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L89)

<a id="function-function-mq3-client-ui-players-ui-forcetorsoanim-function-ui-forcetorsoanim-pi-anim-src-mq3-client-ui-players-ml-188595962"></a>
### UI_ForceTorsoAnim

```ml
function UI_ForceTorsoAnim(pi, anim)
```

UI_ForceTorsoAnim

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L93)

<a id="function-function-mq3-client-ui-players-ui-legssequencing-function-ui-legssequencing-pi-src-mq3-client-ui-players-ml-1978335379"></a>
### UI_LegsSequencing

```ml
function UI_LegsSequencing(pi)
```

UI_LegsSequencing

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L103)

<a id="function-function-mq3-client-ui-players-ui-machinegunspinangle-function-ui-machinegunspinangle-pi-realtime-src-mq3-client-ui-players-ml-206024278"></a>
### UI_MachinegunSpinAngle

```ml
function UI_MachinegunSpinAngle(pi, realtime)
```

UI_MachinegunSpinAngle

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L135)

<a id="function-function-mq3-client-ui-players-ui-movediradjustment-function-ui-movediradjustment-pi-src-mq3-client-ui-players-ml-179978099"></a>
### UI_MovedirAdjustment

```ml
function UI_MovedirAdjustment(pi)
```

UI_MovedirAdjustment

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L126)

<a id="function-function-mq3-client-ui-players-ui-parseanimationfile-function-ui-parseanimationfile-filename-text-src-mq3-client-ui-players-ml-274161514"></a>
### UI_ParseAnimationFile

```ml
function UI_ParseAnimationFile(filename, text)
```

UI_ParseAnimationFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `filename` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L161)

<a id="function-function-mq3-client-ui-players-ui-playerangles-function-ui-playerangles-pi-frametime-src-mq3-client-ui-players-ml-1982610617"></a>
### UI_PlayerAngles

```ml
function UI_PlayerAngles(pi, frametime)
```

UI_PlayerAngles

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |
| `frametime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L128)

<a id="function-function-mq3-client-ui-players-ui-playeranimation-function-ui-playeranimation-source-pi-frametime-realtime-src-mq3-client-ui-players-ml-157310239"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L119)

<a id="function-function-mq3-client-ui-players-ui-playerfloatsprite-function-ui-playerfloatsprite-pi-origin-shader-retailactive-src-mq3-client-ui-players-ml-1387959101"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L133)

<a id="function-function-mq3-client-ui-players-ui-playerinfo-setinfo-function-ui-playerinfo-setinfo-source-pi-legsanim-torsoanim-viewangles-moveangles-weaponnumber-chat-src-mq3-client-ui-players-ml-770073901"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L174)

<a id="function-function-mq3-client-ui-players-ui-playerinfo-setmodel-function-ui-playerinfo-setmodel-source-pi-model-src-mq3-client-ui-players-ml-302180663"></a>
### UI_PlayerInfo_SetModel

```ml
function UI_PlayerInfo_SetModel(source, pi, model)
```

UI_PlayerInfo_SetModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `pi` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L172)

<a id="function-function-mq3-client-ui-players-ui-playerinfo-setweapon-function-ui-playerinfo-setweapon-source-pi-weaponnum-src-mq3-client-ui-players-ml-2056038424"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L79)

<a id="function-function-mq3-client-ui-players-ui-positionentityontag-function-ui-positionentityontag-entity-parent-orientation-src-mq3-client-ui-players-ml-1462700003"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L107)

<a id="function-function-mq3-client-ui-players-ui-positionrotatedentityontag-function-ui-positionrotatedentityontag-entity-parent-orientation-src-mq3-client-ui-players-ml-1029651641"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L109)

<a id="function-function-mq3-client-ui-players-ui-registerclientmodelname-function-ui-registerclientmodelname-source-pi-modelskinname-src-mq3-client-ui-players-ml-1020686509"></a>
### UI_RegisterClientModelname

```ml
function UI_RegisterClientModelname(source, pi, modelSkinName)
```

UI_RegisterClientModelname

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `pi` | `dynamic` | — |  |
| `modelSkinName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L167)

<a id="function-function-mq3-client-ui-players-ui-registerclientskin-function-ui-registerclientskin-source-pi-modelname-skinname-src-mq3-client-ui-players-ml-908482758"></a>
### UI_RegisterClientSkin

```ml
function UI_RegisterClientSkin(source, pi, modelName, skinName)
```

UI_RegisterClientSkin

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `pi` | `dynamic` | — |  |
| `modelName` | `dynamic` | — |  |
| `skinName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L158)

<a id="function-function-mq3-client-ui-players-ui-runlerpframe-function-ui-runlerpframe-pi-lf-newanimation-realtime-src-mq3-client-ui-players-ml-48091812"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L113)

<a id="function-function-mq3-client-ui-players-ui-setlegsanim-function-ui-setlegsanim-pi-anim-src-mq3-client-ui-players-ml-1626913242"></a>
### UI_SetLegsAnim

```ml
function UI_SetLegsAnim(pi, anim)
```

UI_SetLegsAnim

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L91)

<a id="function-function-mq3-client-ui-players-ui-setlerpframeanimation-function-ui-setlerpframeanimation-pi-lf-newanimation-src-mq3-client-ui-players-ml-883658941"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L111)

<a id="function-function-mq3-client-ui-players-ui-settorsoanim-function-ui-settorsoanim-pi-anim-src-mq3-client-ui-players-ml-652563832"></a>
### UI_SetTorsoAnim

```ml
function UI_SetTorsoAnim(pi, anim)
```

UI_SetTorsoAnim

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pi` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L95)

<a id="function-function-mq3-client-ui-players-ui-swingangles-function-ui-swingangles-destination-swingtolerance-clamptolerance-speed-angle-swinging-frametime-src-mq3-client-ui-players-ml-1909530829"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L121)

<a id="constant-constant-mq3-client-ui-players-ui-timer-attack-const-ui-timer-attack-500-src-mq3-client-ui-players-ml-1224582248"></a>
### UI_TIMER_ATTACK

```ml
const UI_TIMER_ATTACK = 500
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L19)

<a id="constant-constant-mq3-client-ui-players-ui-timer-gesture-const-ui-timer-gesture-2300-src-mq3-client-ui-players-ml-997166254"></a>
### UI_TIMER_GESTURE

```ml
const UI_TIMER_GESTURE = 2300
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L15)

<a id="constant-constant-mq3-client-ui-players-ui-timer-jump-const-ui-timer-jump-1000-src-mq3-client-ui-players-ml-1143595362"></a>
### UI_TIMER_JUMP

```ml
const UI_TIMER_JUMP = 1000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L16)

<a id="constant-constant-mq3-client-ui-players-ui-timer-land-const-ui-timer-land-130-src-mq3-client-ui-players-ml-1118820997"></a>
### UI_TIMER_LAND

```ml
const UI_TIMER_LAND = 130
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L17)

<a id="constant-constant-mq3-client-ui-players-ui-timer-muzzle-flash-const-ui-timer-muzzle-flash-20-src-mq3-client-ui-players-ml-2143818907"></a>
### UI_TIMER_MUZZLE_FLASH

```ml
const UI_TIMER_MUZZLE_FLASH = 20
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L20)

<a id="constant-constant-mq3-client-ui-players-ui-timer-weapon-delay-const-ui-timer-weapon-delay-250-src-mq3-client-ui-players-ml-1110105912"></a>
### UI_TIMER_WEAPON_DELAY

```ml
const UI_TIMER_WEAPON_DELAY = 250
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L21)

<a id="constant-constant-mq3-client-ui-players-ui-timer-weapon-switch-const-ui-timer-weapon-switch-300-src-mq3-client-ui-players-ml-931723524"></a>
### UI_TIMER_WEAPON_SWITCH

```ml
const UI_TIMER_WEAPON_SWITCH = 300
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L18)

<a id="function-function-mq3-client-ui-players-ui-torsosequencing-function-ui-torsosequencing-source-pi-src-mq3-client-ui-players-ml-1779659770"></a>
### UI_TorsoSequencing

```ml
function UI_TorsoSequencing(source, pi)
```

UI_TorsoSequencing

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `pi` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L97)

<a id="function-function-mq3-client-ui-players-weaponpath-function-weaponpath-weapon-src-mq3-client-ui-players-ml-385094444"></a>
### weaponPath

```ml
function weaponPath(weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L72)

<a id="constant-constant-mq3-client-ui-players-wp-bfg-const-wp-bfg-9-src-mq3-client-ui-players-ml-1881232348"></a>
### WP_BFG

```ml
const WP_BFG = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L48)

<a id="constant-constant-mq3-client-ui-players-wp-gauntlet-const-wp-gauntlet-1-src-mq3-client-ui-players-ml-292852264"></a>
### WP_GAUNTLET

```ml
const WP_GAUNTLET = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L40)

<a id="constant-constant-mq3-client-ui-players-wp-grappling-hook-const-wp-grappling-hook-10-src-mq3-client-ui-players-ml-1783281014"></a>
### WP_GRAPPLING_HOOK

```ml
const WP_GRAPPLING_HOOK = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L49)

<a id="constant-constant-mq3-client-ui-players-wp-grenade-launcher-const-wp-grenade-launcher-4-src-mq3-client-ui-players-ml-292528349"></a>
### WP_GRENADE_LAUNCHER

```ml
const WP_GRENADE_LAUNCHER = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L43)

<a id="constant-constant-mq3-client-ui-players-wp-lightning-const-wp-lightning-6-src-mq3-client-ui-players-ml-83462485"></a>
### WP_LIGHTNING

```ml
const WP_LIGHTNING = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L45)

<a id="constant-constant-mq3-client-ui-players-wp-machinegun-const-wp-machinegun-2-src-mq3-client-ui-players-ml-709477907"></a>
### WP_MACHINEGUN

```ml
const WP_MACHINEGUN = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L41)

<a id="constant-constant-mq3-client-ui-players-wp-none-const-wp-none-0-src-mq3-client-ui-players-ml-1722983969"></a>
### WP_NONE

```ml
const WP_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L39)

<a id="constant-constant-mq3-client-ui-players-wp-plasmagun-const-wp-plasmagun-8-src-mq3-client-ui-players-ml-1840399127"></a>
### WP_PLASMAGUN

```ml
const WP_PLASMAGUN = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L47)

<a id="constant-constant-mq3-client-ui-players-wp-railgun-const-wp-railgun-7-src-mq3-client-ui-players-ml-982178828"></a>
### WP_RAILGUN

```ml
const WP_RAILGUN = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L46)

<a id="constant-constant-mq3-client-ui-players-wp-rocket-launcher-const-wp-rocket-launcher-5-src-mq3-client-ui-players-ml-1031081344"></a>
### WP_ROCKET_LAUNCHER

```ml
const WP_ROCKET_LAUNCHER = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L44)

<a id="constant-constant-mq3-client-ui-players-wp-shotgun-const-wp-shotgun-3-src-mq3-client-ui-players-ml-1649174072"></a>
### WP_SHOTGUN

```ml
const WP_SHOTGUN = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L42)
