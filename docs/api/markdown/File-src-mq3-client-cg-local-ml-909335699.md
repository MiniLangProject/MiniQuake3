# `src/mq3/client/cg_local.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cg_local`](Package-mq3-client-cg-local-1427157027.md)

Reachable from entry: **yes**

## Declarations

<a id="constant-constant-mq3-client-cg-local-attacker-head-time-const-attacker-head-time-10000-src-mq3-client-cg-local-ml-1712117054"></a>
### ATTACKER_HEAD_TIME

```ml
const ATTACKER_HEAD_TIME = 10000
```

Milliseconds for which the latest attacker's head icon is displayed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L47)

- [mq3.client.cg_local.CEntity](Type-mq3-client-cg-local-centity-238812519.md) — struct
<a id="function-function-mq3-client-cg-local-centityfieldnames-function-centityfieldnames-src-mq3-client-cg-local-ml-1864847174"></a>
### centityFieldNames

```ml
function centityFieldNames()
```

Lists the centity field names catalog for client game local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1483)

<a id="constant-constant-mq3-client-cg-local-cg-font-threshold-const-cg-font-threshold-0-1-src-mq3-client-cg-local-ml-1485971750"></a>
### CG_FONT_THRESHOLD

```ml
const CG_FONT_THRESHOLD = 0.1
```

Font-scale threshold retained from the native CGame declaration interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L9)

<a id="function-function-mq3-client-cg-local-cgfieldnames-function-cgfieldnames-src-mq3-client-cg-local-ml-318133442"></a>
### cgFieldNames

```ml
function cgFieldNames()
```

Lists the cg field names catalog for client game local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1501)

- [mq3.client.cg_local.CgMedia](Type-mq3-client-cg-local-cgmedia-1455801199.md) — struct
<a id="function-function-mq3-client-cg-local-cgmediafieldnames-function-cgmediafieldnames-src-mq3-client-cg-local-ml-479834206"></a>
### cgMediaFieldNames

```ml
function cgMediaFieldNames()
```

Lists the cg media field names catalog for client game local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1503)

<a id="function-function-mq3-client-cg-local-cgsfieldnames-function-cgsfieldnames-src-mq3-client-cg-local-ml-96011128"></a>
### cgsFieldNames

```ml
function cgsFieldNames()
```

Lists the cgs field names catalog for client game local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1505)

- [mq3.client.cg_local.CgsState](Type-mq3-client-cg-local-cgsstate-863881995.md) — struct
- [mq3.client.cg_local.CgState](Type-mq3-client-cg-local-cgstate-2059897074.md) — struct
<a id="constant-constant-mq3-client-cg-local-char-height-const-char-height-48-src-mq3-client-cg-local-ml-532671123"></a>
### CHAR_HEIGHT

```ml
const CHAR_HEIGHT = 48
```

Height of a standard character in virtual screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L65)

<a id="constant-constant-mq3-client-cg-local-char-width-const-char-width-32-src-mq3-client-cg-local-ml-2138728228"></a>
### CHAR_WIDTH

```ml
const CHAR_WIDTH = 32
```

Width of a standard character in virtual screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L63)

<a id="constant-constant-mq3-client-cg-local-chat-print-const-chat-print-1-src-mq3-client-cg-local-ml-1634292970"></a>
### CHAT_PRINT

```ml
const CHAT_PRINT = 1
```

Print destination selecting the ordinary chat-message presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L179)

<a id="function-function-mq3-client-cg-local-clampteamchatheight-function-clampteamchatheight-value-src-mq3-client-cg-local-ml-1699533179"></a>
### clampTeamChatHeight

```ml
function clampTeamChatHeight(value)
```

Evaluates client game local `clampTeamChatHeight` and returns `0`, `TEAMCHAT_HEIGHT`, `value` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<0`, `value>TEAMCHAT_HEIGHT` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1538)

- [mq3.client.cg_local.ClientInfo](Type-mq3-client-cg-local-clientinfo-1976747684.md) — struct
<a id="function-function-mq3-client-cg-local-clientinfofieldnames-function-clientinfofieldnames-src-mq3-client-cg-local-ml-337162926"></a>
### clientInfoFieldNames

```ml
function clientInfoFieldNames()
```

Lists the client info field names catalog for client game local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1491)

<a id="constant-constant-mq3-client-cg-local-damage-deflect-time-const-damage-deflect-time-100-src-mq3-client-cg-local-ml-774796508"></a>
### DAMAGE_DEFLECT_TIME

```ml
const DAMAGE_DEFLECT_TIME = 100
```

Milliseconds spent deflecting the camera at the start of damage kick.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L19)

<a id="constant-constant-mq3-client-cg-local-damage-return-time-const-damage-return-time-400-src-mq3-client-cg-local-ml-957087099"></a>
### DAMAGE_RETURN_TIME

```ml
const DAMAGE_RETURN_TIME = 400
```

Milliseconds spent returning the camera after damage deflection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L21)

<a id="constant-constant-mq3-client-cg-local-damage-time-const-damage-time-500-src-mq3-client-cg-local-ml-494534372"></a>
### DAMAGE_TIME

```ml
const DAMAGE_TIME = 500
```

Total presentation duration in milliseconds of the damage indicator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L23)

<a id="function-function-mq3-client-cg-local-declarationnames-function-declarationnames-src-mq3-client-cg-local-ml-1908605854"></a>
### declarationNames

```ml
function declarationNames()
```

Lists the declaration names catalog for client game local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1507)

<a id="constant-constant-mq3-client-cg-local-default-blueteam-name-const-default-blueteam-name-pagans-src-mq3-client-cg-local-ml-1443750487"></a>
### DEFAULT_BLUETEAM_NAME

```ml
const DEFAULT_BLUETEAM_NAME = "Pagans"
```

Fallback display name used for the blue team.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L91)

<a id="constant-constant-mq3-client-cg-local-default-model-const-default-model-sarge-src-mq3-client-cg-local-ml-1184164135"></a>
### DEFAULT_MODEL

```ml
const DEFAULT_MODEL = "sarge"
```

Fallback player-model name used when no valid model is selected.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L83)

<a id="constant-constant-mq3-client-cg-local-default-redteam-name-const-default-redteam-name-stroggs-src-mq3-client-cg-local-ml-1941783712"></a>
### DEFAULT_REDTEAM_NAME

```ml
const DEFAULT_REDTEAM_NAME = "Stroggs"
```

Fallback display name used for the red team.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L89)

<a id="constant-constant-mq3-client-cg-local-default-team-head-const-default-team-head-sarge-src-mq3-client-cg-local-ml-800676139"></a>
### DEFAULT_TEAM_HEAD

```ml
const DEFAULT_TEAM_HEAD = "sarge"
```

Fallback head-model name used by team-based player presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L87)

<a id="constant-constant-mq3-client-cg-local-default-team-model-const-default-team-model-sarge-src-mq3-client-cg-local-ml-870661151"></a>
### DEFAULT_TEAM_MODEL

```ml
const DEFAULT_TEAM_MODEL = "sarge"
```

Fallback body-model name used by team-based player presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L85)

<a id="constant-constant-mq3-client-cg-local-duck-time-const-duck-time-100-src-mq3-client-cg-local-ml-612019460"></a>
### DUCK_TIME

```ml
const DUCK_TIME = 100
```

Duration in milliseconds of eye-height smoothing after a crouch transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L31)

<a id="constant-constant-mq3-client-cg-local-fade-time-const-fade-time-200-src-mq3-client-cg-local-ml-303791827"></a>
### FADE_TIME

```ml
const FADE_TIME = 200
```

Duration in milliseconds of the standard CGame presentation fade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L15)

<a id="constant-constant-mq3-client-cg-local-footstep-boot-const-footstep-boot-1-src-mq3-client-cg-local-ml-1394263088"></a>
### FOOTSTEP_BOOT

```ml
const FOOTSTEP_BOOT = 1
```

Player-model footstep-sound category for boot surfaces or footwear.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L110)

<a id="constant-constant-mq3-client-cg-local-footstep-energy-const-footstep-energy-4-src-mq3-client-cg-local-ml-861076925"></a>
### FOOTSTEP_ENERGY

```ml
const FOOTSTEP_ENERGY = 4
```

Player-model footstep-sound category for energy surfaces or footwear.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L116)

<a id="constant-constant-mq3-client-cg-local-footstep-flesh-const-footstep-flesh-2-src-mq3-client-cg-local-ml-1036895291"></a>
### FOOTSTEP_FLESH

```ml
const FOOTSTEP_FLESH = 2
```

Player-model footstep-sound category for flesh surfaces or footwear.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L112)

<a id="constant-constant-mq3-client-cg-local-footstep-mech-const-footstep-mech-3-src-mq3-client-cg-local-ml-187044098"></a>
### FOOTSTEP_MECH

```ml
const FOOTSTEP_MECH = 3
```

Player-model footstep-sound category for mech surfaces or footwear.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L114)

<a id="constant-constant-mq3-client-cg-local-footstep-metal-const-footstep-metal-5-src-mq3-client-cg-local-ml-616672794"></a>
### FOOTSTEP_METAL

```ml
const FOOTSTEP_METAL = 5
```

Player-model footstep-sound category for metal surfaces or footwear.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L118)

<a id="constant-constant-mq3-client-cg-local-footstep-normal-const-footstep-normal-0-src-mq3-client-cg-local-ml-1563499369"></a>
### FOOTSTEP_NORMAL

```ml
const FOOTSTEP_NORMAL = 0
```

Player-model footstep-sound category for normal surfaces or footwear.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L108)

<a id="constant-constant-mq3-client-cg-local-footstep-splash-const-footstep-splash-6-src-mq3-client-cg-local-ml-768527063"></a>
### FOOTSTEP_SPLASH

```ml
const FOOTSTEP_SPLASH = 6
```

Player-model footstep-sound category for splash surfaces or footwear.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L120)

<a id="constant-constant-mq3-client-cg-local-footstep-total-const-footstep-total-7-src-mq3-client-cg-local-ml-460210470"></a>
### FOOTSTEP_TOTAL

```ml
const FOOTSTEP_TOTAL = 7
```

Number of player-model footstep categories, used to size the footstep-sound table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L122)

<a id="constant-constant-mq3-client-cg-local-giant-height-const-giant-height-48-src-mq3-client-cg-local-ml-1552651627"></a>
### GIANT_HEIGHT

```ml
const GIANT_HEIGHT = 48
```

Height of a giant-font character in virtual screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L75)

<a id="constant-constant-mq3-client-cg-local-giant-width-const-giant-width-32-src-mq3-client-cg-local-ml-1184612532"></a>
### GIANT_WIDTH

```ml
const GIANT_WIDTH = 32
```

Width of a giant-font character in virtual screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L73)

<a id="function-function-mq3-client-cg-local-globalnames-function-globalnames-src-mq3-client-cg-local-ml-1216646324"></a>
### globalNames

```ml
function globalNames()
```

Lists the global names catalog for client game local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1509)

<a id="constant-constant-mq3-client-cg-local-icon-size-const-icon-size-48-src-mq3-client-cg-local-ml-1567752519"></a>
### ICON_SIZE

```ml
const ICON_SIZE = 48
```

Default square HUD icon size in virtual screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L61)

<a id="constant-constant-mq3-client-cg-local-impactsound-default-const-impactsound-default-0-src-mq3-client-cg-local-ml-1226590377"></a>
### IMPACTSOUND_DEFAULT

```ml
const IMPACTSOUND_DEFAULT = 0
```

Weapon-impact sound category selecting default surface feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L124)

<a id="constant-constant-mq3-client-cg-local-impactsound-flesh-const-impactsound-flesh-2-src-mq3-client-cg-local-ml-2029501127"></a>
### IMPACTSOUND_FLESH

```ml
const IMPACTSOUND_FLESH = 2
```

Weapon-impact sound category selecting flesh surface feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L128)

<a id="constant-constant-mq3-client-cg-local-impactsound-metal-const-impactsound-metal-1-src-mq3-client-cg-local-ml-264108352"></a>
### IMPACTSOUND_METAL

```ml
const IMPACTSOUND_METAL = 1
```

Weapon-impact sound category selecting metal surface feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L126)

<a id="constant-constant-mq3-client-cg-local-item-blob-time-const-item-blob-time-200-src-mq3-client-cg-local-ml-2003571699"></a>
### ITEM_BLOB_TIME

```ml
const ITEM_BLOB_TIME = 200
```

Duration in milliseconds of the pickup-icon emphasis effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L41)

<a id="constant-constant-mq3-client-cg-local-item-scaleup-time-const-item-scaleup-time-1000-src-mq3-client-cg-local-ml-649194488"></a>
### ITEM_SCALEUP_TIME

```ml
const ITEM_SCALEUP_TIME = 1000
```

Duration in milliseconds of the item-pickup scale animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L37)

- [mq3.client.cg_local.ItemInfo](Type-mq3-client-cg-local-iteminfo-1356544716.md) — struct
<a id="function-function-mq3-client-cg-local-iteminfofieldnames-function-iteminfofieldnames-src-mq3-client-cg-local-ml-1522642726"></a>
### itemInfoFieldNames

```ml
function itemInfoFieldNames()
```

Lists the item info field names catalog for client game local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1495)

<a id="constant-constant-mq3-client-cg-local-land-deflect-time-const-land-deflect-time-150-src-mq3-client-cg-local-ml-1442421675"></a>
### LAND_DEFLECT_TIME

```ml
const LAND_DEFLECT_TIME = 150
```

Milliseconds spent moving the view during the initial landing kick.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L25)

<a id="constant-constant-mq3-client-cg-local-land-return-time-const-land-return-time-300-src-mq3-client-cg-local-ml-1206189748"></a>
### LAND_RETURN_TIME

```ml
const LAND_RETURN_TIME = 300
```

Milliseconds spent restoring the view after the landing kick.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L27)

<a id="constant-constant-mq3-client-cg-local-le-explosion-const-le-explosion-1-src-mq3-client-cg-local-ml-1478451816"></a>
### LE_EXPLOSION

```ml
const LE_EXPLOSION = 1
```

Local-effect entity kind selecting a model-based explosion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L132)

<a id="constant-constant-mq3-client-cg-local-le-fade-rgb-const-le-fade-rgb-6-src-mq3-client-cg-local-ml-948394555"></a>
### LE_FADE_RGB

```ml
const LE_FADE_RGB = 6
```

Local-effect entity kind selecting an effect that fades its RGB color components.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L142)

<a id="constant-constant-mq3-client-cg-local-le-fall-scale-fade-const-le-fall-scale-fade-5-src-mq3-client-cg-local-ml-626797084"></a>
### LE_FALL_SCALE_FADE

```ml
const LE_FALL_SCALE_FADE = 5
```

Local-effect entity kind selecting an effect that falls while scaling and fading.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L140)

<a id="constant-constant-mq3-client-cg-local-le-fragment-const-le-fragment-3-src-mq3-client-cg-local-ml-1766074038"></a>
### LE_FRAGMENT

```ml
const LE_FRAGMENT = 3
```

Local-effect entity kind selecting a moving fragment with collision and bounce handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L136)

<a id="constant-constant-mq3-client-cg-local-le-invulimpact-const-le-invulimpact-10-src-mq3-client-cg-local-ml-1278357618"></a>
### LE_INVULIMPACT

```ml
const LE_INVULIMPACT = 10
```

Local-effect entity kind selecting an impact against the invulnerability shield.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L150)

<a id="constant-constant-mq3-client-cg-local-le-invuljuiced-const-le-invuljuiced-11-src-mq3-client-cg-local-ml-1103625087"></a>
### LE_INVULJUICED

```ml
const LE_INVULJUICED = 11
```

Local-effect entity kind selecting the invulnerability elimination effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L152)

<a id="constant-constant-mq3-client-cg-local-le-kamikaze-const-le-kamikaze-9-src-mq3-client-cg-local-ml-1027637320"></a>
### LE_KAMIKAZE

```ml
const LE_KAMIKAZE = 9
```

Local-effect entity kind selecting the Missionpack kamikaze explosion sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L148)

<a id="constant-constant-mq3-client-cg-local-le-mark-const-le-mark-0-src-mq3-client-cg-local-ml-315989705"></a>
### LE_MARK

```ml
const LE_MARK = 0
```

Local-effect entity kind selecting a persistent impact decal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L130)

<a id="constant-constant-mq3-client-cg-local-le-move-scale-fade-const-le-move-scale-fade-4-src-mq3-client-cg-local-ml-1411411469"></a>
### LE_MOVE_SCALE_FADE

```ml
const LE_MOVE_SCALE_FADE = 4
```

Local-effect entity kind selecting an effect that moves, scales, and fades over its lifetime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L138)

<a id="constant-constant-mq3-client-cg-local-le-scale-fade-const-le-scale-fade-7-src-mq3-client-cg-local-ml-858597254"></a>
### LE_SCALE_FADE

```ml
const LE_SCALE_FADE = 7
```

Local-effect entity kind selecting an effect that scales and fades in place.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L144)

<a id="constant-constant-mq3-client-cg-local-le-scoreplum-const-le-scoreplum-8-src-mq3-client-cg-local-ml-1710987159"></a>
### LE_SCOREPLUM

```ml
const LE_SCOREPLUM = 8
```

Local-effect entity kind selecting a floating score indicator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L146)

<a id="constant-constant-mq3-client-cg-local-le-showrefentity-const-le-showrefentity-12-src-mq3-client-cg-local-ml-1210158018"></a>
### LE_SHOWREFENTITY

```ml
const LE_SHOWREFENTITY = 12
```

Local-effect entity kind selecting a renderer entity displayed without another local-effect update mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L155)

<a id="constant-constant-mq3-client-cg-local-le-sprite-explosion-const-le-sprite-explosion-2-src-mq3-client-cg-local-ml-879410235"></a>
### LE_SPRITE_EXPLOSION

```ml
const LE_SPRITE_EXPLOSION = 2
```

Local-effect entity kind selecting a sprite-based explosion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L134)

<a id="constant-constant-mq3-client-cg-local-lebs-blood-const-lebs-blood-1-src-mq3-client-cg-local-ml-383915408"></a>
### LEBS_BLOOD

```ml
const LEBS_BLOOD = 1
```

Local-fragment bounce-sound kind selecting blood impact feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L173)

<a id="constant-constant-mq3-client-cg-local-lebs-brass-const-lebs-brass-2-src-mq3-client-cg-local-ml-558644397"></a>
### LEBS_BRASS

```ml
const LEBS_BRASS = 2
```

Local-fragment bounce-sound kind selecting brass impact feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L175)

<a id="constant-constant-mq3-client-cg-local-lebs-none-const-lebs-none-0-src-mq3-client-cg-local-ml-1678992745"></a>
### LEBS_NONE

```ml
const LEBS_NONE = 0
```

Local-fragment bounce-sound kind selecting none impact feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L171)

<a id="constant-constant-mq3-client-cg-local-lef-puff-dont-scale-const-lef-puff-dont-scale-1-src-mq3-client-cg-local-ml-900898668"></a>
### LEF_PUFF_DONT_SCALE

```ml
const LEF_PUFF_DONT_SCALE = 1
```

Local-effect flag controlling the puff dont scale behavior of the temporary entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L157)

<a id="constant-constant-mq3-client-cg-local-lef-sound1-const-lef-sound1-4-src-mq3-client-cg-local-ml-440347027"></a>
### LEF_SOUND1

```ml
const LEF_SOUND1 = 4
```

Local-effect flag controlling the sound1 behavior of the temporary entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L161)

<a id="constant-constant-mq3-client-cg-local-lef-sound2-const-lef-sound2-8-src-mq3-client-cg-local-ml-735666161"></a>
### LEF_SOUND2

```ml
const LEF_SOUND2 = 8
```

Local-effect flag controlling the sound2 behavior of the temporary entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L163)

<a id="constant-constant-mq3-client-cg-local-lef-tumble-const-lef-tumble-2-src-mq3-client-cg-local-ml-2039757947"></a>
### LEF_TUMBLE

```ml
const LEF_TUMBLE = 2
```

Local-effect flag controlling the tumble behavior of the temporary entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L159)

<a id="constant-constant-mq3-client-cg-local-lemt-blood-const-lemt-blood-2-src-mq3-client-cg-local-ml-2109246567"></a>
### LEMT_BLOOD

```ml
const LEMT_BLOOD = 2
```

Local-fragment impact-decal kind selecting blood marks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L169)

<a id="constant-constant-mq3-client-cg-local-lemt-burn-const-lemt-burn-1-src-mq3-client-cg-local-ml-1637527576"></a>
### LEMT_BURN

```ml
const LEMT_BURN = 1
```

Local-fragment impact-decal kind selecting burn marks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L167)

<a id="constant-constant-mq3-client-cg-local-lemt-none-const-lemt-none-0-src-mq3-client-cg-local-ml-2033225937"></a>
### LEMT_NONE

```ml
const LEMT_NONE = 0
```

Local-fragment impact-decal kind selecting none marks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L165)

- [mq3.client.cg_local.LerpFrame](Type-mq3-client-cg-local-lerpframe-538038351.md) — struct
<a id="function-function-mq3-client-cg-local-lerpframefieldnames-function-lerpframefieldnames-src-mq3-client-cg-local-ml-888816730"></a>
### lerpFrameFieldNames

```ml
function lerpFrameFieldNames()
```

Lists the lerp frame field names catalog for client game local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1479)

- [mq3.client.cg_local.LocalEntity](Type-mq3-client-cg-local-localentity-2084909029.md) — struct
<a id="function-function-mq3-client-cg-local-localentityfieldnames-function-localentityfieldnames-src-mq3-client-cg-local-ml-1333710482"></a>
### localEntityFieldNames

```ml
function localEntityFieldNames()
```

Lists the local entity field names catalog for client game local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1487)

- [mq3.client.cg_local.MarkPoly](Type-mq3-client-cg-local-markpoly-386723940.md) — struct
<a id="function-function-mq3-client-cg-local-markpolyfieldnames-function-markpolyfieldnames-src-mq3-client-cg-local-ml-521460486"></a>
### markPolyFieldNames

```ml
function markPolyFieldNames()
```

Lists the mark poly field names catalog for client game local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1485)

<a id="constant-constant-mq3-client-cg-local-max-custom-sounds-const-max-custom-sounds-32-src-mq3-client-cg-local-ml-369522652"></a>
### MAX_CUSTOM_SOUNDS

```ml
const MAX_CUSTOM_SOUNDS = 32
```

Capacity limit for the custom sounds collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L93)

<a id="constant-constant-mq3-client-cg-local-max-mark-polys-const-max-mark-polys-256-src-mq3-client-cg-local-ml-1049462008"></a>
### MAX_MARK_POLYS

```ml
const MAX_MARK_POLYS = 256
```

Capacity limit for the mark polys collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L57)

<a id="constant-constant-mq3-client-cg-local-max-predicted-events-const-max-predicted-events-16-src-mq3-client-cg-local-ml-954086286"></a>
### MAX_PREDICTED_EVENTS

```ml
const MAX_PREDICTED_EVENTS = 16
```

Capacity limit for the predicted events collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L101)

<a id="constant-constant-mq3-client-cg-local-max-rewardstack-const-max-rewardstack-10-src-mq3-client-cg-local-ml-276479756"></a>
### MAX_REWARDSTACK

```ml
const MAX_REWARDSTACK = 10
```

Capacity limit for the rewardstack collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L97)

<a id="constant-constant-mq3-client-cg-local-max-skulltrail-const-max-skulltrail-10-src-mq3-client-cg-local-ml-572911598"></a>
### MAX_SKULLTRAIL

```ml
const MAX_SKULLTRAIL = 10
```

Capacity limit for the skulltrail collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L95)

<a id="constant-constant-mq3-client-cg-local-max-soundbuffer-const-max-soundbuffer-20-src-mq3-client-cg-local-ml-1353367929"></a>
### MAX_SOUNDBUFFER

```ml
const MAX_SOUNDBUFFER = 20
```

Capacity limit for the soundbuffer collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L99)

<a id="constant-constant-mq3-client-cg-local-max-step-change-const-max-step-change-32-src-mq3-client-cg-local-ml-883509048"></a>
### MAX_STEP_CHANGE

```ml
const MAX_STEP_CHANGE = 32
```

Largest vertical step displacement accepted by stair-step view smoothing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L53)

<a id="constant-constant-mq3-client-cg-local-max-verts-on-poly-const-max-verts-on-poly-10-src-mq3-client-cg-local-ml-438622728"></a>
### MAX_VERTS_ON_POLY

```ml
const MAX_VERTS_ON_POLY = 10
```

Capacity limit for the verts on poly collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L55)

<a id="constant-constant-mq3-client-cg-local-missionpack-default-team-head-const-missionpack-default-team-head-james-src-mq3-client-cg-local-ml-584849481"></a>
### MISSIONPACK_DEFAULT_TEAM_HEAD

```ml
const MISSIONPACK_DEFAULT_TEAM_HEAD = "*james"
```

Missionpack fallback head-model name for a team player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L105)

<a id="constant-constant-mq3-client-cg-local-missionpack-default-team-model-const-missionpack-default-team-model-james-src-mq3-client-cg-local-ml-23903405"></a>
### MISSIONPACK_DEFAULT_TEAM_MODEL

```ml
const MISSIONPACK_DEFAULT_TEAM_MODEL = "james"
```

Missionpack fallback body-model name for a team player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L103)

<a id="constant-constant-mq3-client-cg-local-muzzle-flash-time-const-muzzle-flash-time-20-src-mq3-client-cg-local-ml-1980269709"></a>
### MUZZLE_FLASH_TIME

```ml
const MUZZLE_FLASH_TIME = 20
```

Milliseconds for which a weapon muzzle flash remains visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L43)

<a id="function-function-mq3-client-cg-local-nextrewardslot-function-nextrewardslot-value-src-mq3-client-cg-local-ml-1575903833"></a>
### nextRewardSlot

```ml
function nextRewardSlot(value)
```

Evaluates client game local `nextRewardSlot` and returns `error(7956,"cg_local.h: invalid reward slot")`, `(value+1)%MAX_REWARDSTACK` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<0 or value>=MAX_REWARDSTACK` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1526)

<a id="function-function-mq3-client-cg-local-nextsoundbufferslot-function-nextsoundbufferslot-value-src-mq3-client-cg-local-ml-472250153"></a>
### nextSoundBufferSlot

```ml
function nextSoundBufferSlot(value)
```

Evaluates client game local `nextSoundBufferSlot` and returns `error(7956,"cg_local.h: invalid sound-buffer slot")`, `(value+1)%MAX_SOUNDBUFFER` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<0 or value>=MAX_SOUNDBUFFER` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1523)

<a id="constant-constant-mq3-client-cg-local-num-crosshairs-const-num-crosshairs-10-src-mq3-client-cg-local-ml-1816796522"></a>
### NUM_CROSSHAIRS

```ml
const NUM_CROSSHAIRS = 10
```

Number of built-in crosshair images available for selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L77)

<a id="constant-constant-mq3-client-cg-local-pain-twitch-time-const-pain-twitch-time-200-src-mq3-client-cg-local-ml-1886306325"></a>
### PAIN_TWITCH_TIME

```ml
const PAIN_TWITCH_TIME = 200
```

Duration in milliseconds of the player-model pain twitch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L33)

- [mq3.client.cg_local.PlayerEntity](Type-mq3-client-cg-local-playerentity-425260613.md) — struct
<a id="function-function-mq3-client-cg-local-playerentityfieldnames-function-playerentityfieldnames-src-mq3-client-cg-local-ml-101558642"></a>
### playerEntityFieldNames

```ml
function playerEntityFieldNames()
```

Lists the player entity field names catalog for client game local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1481)

<a id="constant-constant-mq3-client-cg-local-powerup-blink-time-const-powerup-blink-time-1000-src-mq3-client-cg-local-ml-266478632"></a>
### POWERUP_BLINK_TIME

```ml
const POWERUP_BLINK_TIME = 1000
```

Duration in milliseconds of one powerup-expiration blink interval.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L13)

<a id="constant-constant-mq3-client-cg-local-powerup-blinks-const-powerup-blinks-5-src-mq3-client-cg-local-ml-1411269398"></a>
### POWERUP_BLINKS

```ml
const POWERUP_BLINKS = 5
```

Number of warning blinks played before a timed powerup expires.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L11)

<a id="function-function-mq3-client-cg-local-powerupblinkwindow-function-powerupblinkwindow-timeleft-src-mq3-client-cg-local-ml-224050878"></a>
### powerupBlinkWindow

```ml
function powerupBlinkWindow(timeLeft)
```

Computes `timeLeft>=0 and timeLeft<=POWERUP_BLINKS*POWERUP_BLINK_TIME` for client game local `powerupBlinkWindow`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `timeLeft` | `dynamic` | — | Value used by `return timeLeft>=0 and timeLeft<=POWERUP_BLINKS*POWERUP_BLINK_TIME`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1535)

- [mq3.client.cg_local.PowerupInfo](Type-mq3-client-cg-local-powerupinfo-393370837.md) — struct
<a id="function-function-mq3-client-cg-local-powerupinfofieldnames-function-powerupinfofieldnames-src-mq3-client-cg-local-ml-189371698"></a>
### powerupInfoFieldNames

```ml
function powerupInfoFieldNames()
```

Lists the powerup info field names catalog for client game local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1497)

<a id="constant-constant-mq3-client-cg-local-pulse-scale-const-pulse-scale-1-5-src-mq3-client-cg-local-ml-1517981111"></a>
### PULSE_SCALE

```ml
const PULSE_SCALE = 1.5
```

Maximum scale multiplier used by the HUD pulse animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L51)

<a id="constant-constant-mq3-client-cg-local-pulse-time-const-pulse-time-200-src-mq3-client-cg-local-ml-1819900179"></a>
### PULSE_TIME

```ml
const PULSE_TIME = 200
```

Duration in milliseconds of the standard HUD pulse cycle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L17)

<a id="constant-constant-mq3-client-cg-local-reward-time-const-reward-time-3000-src-mq3-client-cg-local-ml-1764104574"></a>
### REWARD_TIME

```ml
const REWARD_TIME = 3000
```

Milliseconds allocated to displaying one reward announcement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L49)

- [mq3.client.cg_local.Score](Type-mq3-client-cg-local-score-94128459.md) — struct
<a id="function-function-mq3-client-cg-local-scorefieldnames-function-scorefieldnames-src-mq3-client-cg-local-ml-452420190"></a>
### scoreFieldNames

```ml
function scoreFieldNames()
```

Lists the score field names catalog for client game local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1489)

<a id="constant-constant-mq3-client-cg-local-sink-time-const-sink-time-1000-src-mq3-client-cg-local-ml-1016716880"></a>
### SINK_TIME

```ml
const SINK_TIME = 1000
```

Duration in milliseconds over which an expiring local entity sinks away.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L45)

- [mq3.client.cg_local.SkullTrail](Type-mq3-client-cg-local-skulltrail-858985956.md) — struct
<a id="function-function-mq3-client-cg-local-skulltrailfieldnames-function-skulltrailfieldnames-src-mq3-client-cg-local-ml-714323226"></a>
### skulltrailFieldNames

```ml
function skulltrailFieldNames()
```

Lists the skulltrail field names catalog for client game local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1499)

<a id="constant-constant-mq3-client-cg-local-stat-minus-const-stat-minus-10-src-mq3-client-cg-local-ml-1746953220"></a>
### STAT_MINUS

```ml
const STAT_MINUS = 10
```

Digit-image index reserved for the minus sign in numeric HUD rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L59)

<a id="constant-constant-mq3-client-cg-local-step-time-const-step-time-200-src-mq3-client-cg-local-ml-1336442851"></a>
### STEP_TIME

```ml
const STEP_TIME = 200
```

Duration in milliseconds of camera smoothing after stepping onto a ledge.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L29)

<a id="constant-constant-mq3-client-cg-local-system-print-const-system-print-0-src-mq3-client-cg-local-ml-6466505"></a>
### SYSTEM_PRINT

```ml
const SYSTEM_PRINT = 0
```

Print destination selecting a system-message presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L177)

<a id="constant-constant-mq3-client-cg-local-team-overlay-maxlocation-width-const-team-overlay-maxlocation-width-16-src-mq3-client-cg-local-ml-166496382"></a>
### TEAM_OVERLAY_MAXLOCATION_WIDTH

```ml
const TEAM_OVERLAY_MAXLOCATION_WIDTH = 16
```

Maximum displayed location-name width in the team overlay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L81)

<a id="constant-constant-mq3-client-cg-local-team-overlay-maxname-width-const-team-overlay-maxname-width-12-src-mq3-client-cg-local-ml-18473666"></a>
### TEAM_OVERLAY_MAXNAME_WIDTH

```ml
const TEAM_OVERLAY_MAXNAME_WIDTH = 12
```

Maximum displayed player-name width in the team overlay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L79)

<a id="constant-constant-mq3-client-cg-local-teamchat-height-const-teamchat-height-8-src-mq3-client-cg-local-ml-384209101"></a>
### TEAMCHAT_HEIGHT

```ml
const TEAMCHAT_HEIGHT = 8
```

Maximum number of team-chat lines retained by the overlay history.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L71)

<a id="constant-constant-mq3-client-cg-local-teamchat-print-const-teamchat-print-2-src-mq3-client-cg-local-ml-193319099"></a>
### TEAMCHAT_PRINT

```ml
const TEAMCHAT_PRINT = 2
```

Print destination selecting the team-chat presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L181)

<a id="constant-constant-mq3-client-cg-local-teamchat-width-const-teamchat-width-80-src-mq3-client-cg-local-ml-711782961"></a>
### TEAMCHAT_WIDTH

```ml
const TEAMCHAT_WIDTH = 80
```

Maximum visible character count retained for one team-chat line.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L69)

<a id="constant-constant-mq3-client-cg-local-text-icon-space-const-text-icon-space-4-src-mq3-client-cg-local-ml-326461957"></a>
### TEXT_ICON_SPACE

```ml
const TEXT_ICON_SPACE = 4
```

Horizontal gap between text and its adjacent HUD icon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L67)

<a id="function-function-mq3-client-cg-local-typenames-function-typenames-src-mq3-client-cg-local-ml-672725034"></a>
### typeNames

```ml
function typeNames()
```

Lists the type names catalog for client game local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1477)

<a id="function-function-mq3-client-cg-local-validcrosshair-function-validcrosshair-value-src-mq3-client-cg-local-ml-2138852945"></a>
### validCrosshair

```ml
function validCrosshair(value)
```

Computes `value>=0 and value<NUM_CROSSHAIRS` for client game local `validCrosshair`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `return value>=0 and value<NUM_CROSSHAIRS`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1529)

<a id="function-function-mq3-client-cg-local-validfootstep-function-validfootstep-value-src-mq3-client-cg-local-ml-819121705"></a>
### validFootstep

```ml
function validFootstep(value)
```

Computes `value>=FOOTSTEP_NORMAL and value<FOOTSTEP_TOTAL` for client game local `validFootstep`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `return value>=FOOTSTEP_NORMAL and value<FOOTSTEP_TOTAL`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1513)

<a id="function-function-mq3-client-cg-local-validimpactsound-function-validimpactsound-value-src-mq3-client-cg-local-ml-982772705"></a>
### validImpactSound

```ml
function validImpactSound(value)
```

Computes `value>=IMPACTSOUND_DEFAULT and value<=IMPACTSOUND_FLESH` for client game local `validImpactSound`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `return value>=IMPACTSOUND_DEFAULT and value<=IMPACTSOUND_FLESH`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1516)

<a id="function-function-mq3-client-cg-local-validlocalentitytype-function-validlocalentitytype-value-missionpack-src-mq3-client-cg-local-ml-1228723778"></a>
### validLocalEntityType

```ml
function validLocalEntityType(value, missionpack)
```

Evaluates client game local `validLocalEntityType` and returns `true`, `missionpack and value>=LE_KAMIKAZE and value<=LE_SHOWREFENTITY` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value>=LE_MARK and value<=LE_SCOREPLUM` before the calculation continues. |
| `missionpack` | `dynamic` | — | Value used by `return missionpack and value>=LE_KAMIKAZE and value<=LE_SHOWREFENTITY`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1520)

<a id="function-function-mq3-client-cg-local-validmarkpolygon-function-validmarkpolygon-vertexcount-src-mq3-client-cg-local-ml-1372252393"></a>
### validMarkPolygon

```ml
function validMarkPolygon(vertexCount)
```

Computes `vertexCount>=0 and vertexCount<=MAX_VERTS_ON_POLY` for client game local `validMarkPolygon`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexCount` | `dynamic` | — | Value used by `return vertexCount>=0 and vertexCount<=MAX_VERTS_ON_POLY`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1532)

<a id="constant-constant-mq3-client-cg-local-weapon-select-time-const-weapon-select-time-1400-src-mq3-client-cg-local-ml-1466687204"></a>
### WEAPON_SELECT_TIME

```ml
const WEAPON_SELECT_TIME = 1400
```

Milliseconds for which the weapon-selection HUD remains visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L35)

- [mq3.client.cg_local.WeaponInfo](Type-mq3-client-cg-local-weaponinfo-234541299.md) — struct
<a id="function-function-mq3-client-cg-local-weaponinfofieldnames-function-weaponinfofieldnames-src-mq3-client-cg-local-ml-1755669034"></a>
### weaponInfoFieldNames

```ml
function weaponInfoFieldNames()
```

Lists the weapon info field names catalog for client game local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L1493)

<a id="constant-constant-mq3-client-cg-local-zoom-time-const-zoom-time-150-src-mq3-client-cg-local-ml-179129255"></a>
### ZOOM_TIME

```ml
const ZOOM_TIME = 150
```

Duration in milliseconds of the transition into or out of the zoomed view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L39)
