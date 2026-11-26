# `src/mq3/client/cgame_newdraw.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_newdraw`](Package-mq3-client-cgame-newdraw-1107300063.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.cgame_newdraw.Action](Type-mq3-client-cgame-newdraw-action-1399488817.md) — struct
<a id="constant-constant-mq3-client-cgame-newdraw-cg-1stplace-const-cg-1stplace-67-src-mq3-client-cgame-newdraw-ml-1137712566"></a>
### CG_1STPLACE

```ml
const CG_1STPLACE = 67
```

CGame owner-draw identifier selecting the 1 stplace HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L241)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-2ndplace-const-cg-2ndplace-68-src-mq3-client-cgame-newdraw-ml-1892332247"></a>
### CG_2NDPLACE

```ml
const CG_2NDPLACE = 68
```

CGame owner-draw identifier selecting the 2 ndplace HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L243)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-accuracy-const-cg-accuracy-53-src-mq3-client-cgame-newdraw-ml-245131137"></a>
### CG_ACCURACY

```ml
const CG_ACCURACY = 53
```

CGame owner-draw identifier selecting the accuracy HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L213)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-area-chat-const-cg-area-chat-48-src-mq3-client-cgame-newdraw-ml-1311935249"></a>
### CG_AREA_CHAT

```ml
const CG_AREA_CHAT = 48
```

CGame owner-draw identifier selecting the area chat HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L203)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-area-powerup-const-cg-area-powerup-36-src-mq3-client-cgame-newdraw-ml-2107828324"></a>
### CG_AREA_POWERUP

```ml
const CG_AREA_POWERUP = 36
```

CGame owner-draw identifier selecting the area powerup HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L187)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-area-systemchat-const-cg-area-systemchat-46-src-mq3-client-cgame-newdraw-ml-1113537065"></a>
### CG_AREA_SYSTEMCHAT

```ml
const CG_AREA_SYSTEMCHAT = 46
```

CGame owner-draw identifier selecting the area systemchat HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L199)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-area-teamchat-const-cg-area-teamchat-47-src-mq3-client-cgame-newdraw-ml-870006410"></a>
### CG_AREA_TEAMCHAT

```ml
const CG_AREA_TEAMCHAT = 47
```

CGame owner-draw identifier selecting the area teamchat HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L201)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-assists-const-cg-assists-54-src-mq3-client-cgame-newdraw-ml-1421049508"></a>
### CG_ASSISTS

```ml
const CG_ASSISTS = 54
```

CGame owner-draw identifier selecting the assists HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L215)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-blue-flaghead-const-cg-blue-flaghead-21-src-mq3-client-cgame-newdraw-ml-373739974"></a>
### CG_BLUE_FLAGHEAD

```ml
const CG_BLUE_FLAGHEAD = 21
```

CGame owner-draw identifier selecting the blue flaghead HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L157)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-blue-flagname-const-cg-blue-flagname-23-src-mq3-client-cgame-newdraw-ml-58450126"></a>
### CG_BLUE_FLAGNAME

```ml
const CG_BLUE_FLAGNAME = 23
```

CGame owner-draw identifier selecting the blue flagname HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L161)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-blue-flagstatus-const-cg-blue-flagstatus-22-src-mq3-client-cgame-newdraw-ml-79934507"></a>
### CG_BLUE_FLAGSTATUS

```ml
const CG_BLUE_FLAGSTATUS = 22
```

CGame owner-draw identifier selecting the blue flagstatus HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L159)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-blue-name-const-cg-blue-name-30-src-mq3-client-cgame-newdraw-ml-1135121614"></a>
### CG_BLUE_NAME

```ml
const CG_BLUE_NAME = 30
```

CGame owner-draw identifier selecting the blue name HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L175)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-blue-score-const-cg-blue-score-27-src-mq3-client-cgame-newdraw-ml-390032374"></a>
### CG_BLUE_SCORE

```ml
const CG_BLUE_SCORE = 27
```

CGame owner-draw identifier selecting the blue score HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L169)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-capfraglimit-const-cg-capfraglimit-66-src-mq3-client-cgame-newdraw-ml-1041077765"></a>
### CG_CAPFRAGLIMIT

```ml
const CG_CAPFRAGLIMIT = 66
```

CGame owner-draw identifier selecting the capfraglimit HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L239)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-captures-const-cg-captures-69-src-mq3-client-cgame-newdraw-ml-1015330580"></a>
### CG_CAPTURES

```ml
const CG_CAPTURES = 69
```

CGame owner-draw identifier selecting the captures HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L245)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-ctf-powerup-const-cg-ctf-powerup-35-src-mq3-client-cgame-newdraw-ml-1486139089"></a>
### CG_CTF_POWERUP

```ml
const CG_CTF_POWERUP = 35
```

CGame owner-draw identifier selecting the ctf powerup HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L185)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-defend-const-cg-defend-55-src-mq3-client-cgame-newdraw-ml-1184396967"></a>
### CG_DEFEND

```ml
const CG_DEFEND = 55
```

CGame owner-draw identifier selecting the defend HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L217)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-excellent-const-cg-excellent-56-src-mq3-client-cgame-newdraw-ml-172080762"></a>
### CG_EXCELLENT

```ml
const CG_EXCELLENT = 56
```

CGame owner-draw identifier selecting the excellent HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L219)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-game-status-const-cg-game-status-49-src-mq3-client-cgame-newdraw-ml-990480836"></a>
### CG_GAME_STATUS

```ml
const CG_GAME_STATUS = 49
```

CGame owner-draw identifier selecting the game status HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L205)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-game-type-const-cg-game-type-39-src-mq3-client-cgame-newdraw-ml-2134108279"></a>
### CG_GAME_TYPE

```ml
const CG_GAME_TYPE = 39
```

CGame owner-draw identifier selecting the game type HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L191)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-gauntlet-const-cg-gauntlet-59-src-mq3-client-cgame-newdraw-ml-384829375"></a>
### CG_GAUNTLET

```ml
const CG_GAUNTLET = 59
```

CGame owner-draw identifier selecting the gauntlet HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L225)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-harvester-skulls-const-cg-harvester-skulls-31-src-mq3-client-cgame-newdraw-ml-1751535873"></a>
### CG_HARVESTER_SKULLS

```ml
const CG_HARVESTER_SKULLS = 31
```

CGame owner-draw identifier selecting the harvester skulls HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L177)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-harvester-skulls2d-const-cg-harvester-skulls2d-65-src-mq3-client-cgame-newdraw-ml-1290662748"></a>
### CG_HARVESTER_SKULLS2D

```ml
const CG_HARVESTER_SKULLS2D = 65
```

CGame owner-draw identifier selecting the harvester skulls2 d HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L237)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-impressive-const-cg-impressive-57-src-mq3-client-cgame-newdraw-ml-1181394745"></a>
### CG_IMPRESSIVE

```ml
const CG_IMPRESSIVE = 57
```

CGame owner-draw identifier selecting the impressive HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L221)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-killer-const-cg-killer-50-src-mq3-client-cgame-newdraw-ml-766964900"></a>
### CG_KILLER

```ml
const CG_KILLER = 50
```

CGame owner-draw identifier selecting the killer HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L207)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-oneflag-status-const-cg-oneflag-status-32-src-mq3-client-cgame-newdraw-ml-1460842504"></a>
### CG_ONEFLAG_STATUS

```ml
const CG_ONEFLAG_STATUS = 32
```

CGame owner-draw identifier selecting the oneflag status HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L179)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-perfect-const-cg-perfect-58-src-mq3-client-cgame-newdraw-ml-1913248290"></a>
### CG_PERFECT

```ml
const CG_PERFECT = 58
```

CGame owner-draw identifier selecting the perfect HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L223)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-ammo-icon-const-cg-player-ammo-icon-5-src-mq3-client-cgame-newdraw-ml-393567152"></a>
### CG_PLAYER_AMMO_ICON

```ml
const CG_PLAYER_AMMO_ICON = 5
```

CGame owner-draw identifier selecting the player ammo icon HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L137)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-ammo-icon2d-const-cg-player-ammo-icon2d-52-src-mq3-client-cgame-newdraw-ml-1850942662"></a>
### CG_PLAYER_AMMO_ICON2D

```ml
const CG_PLAYER_AMMO_ICON2D = 52
```

CGame owner-draw identifier selecting the player ammo icon2 d HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L211)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-ammo-value-const-cg-player-ammo-value-6-src-mq3-client-cgame-newdraw-ml-400911861"></a>
### CG_PLAYER_AMMO_VALUE

```ml
const CG_PLAYER_AMMO_VALUE = 6
```

CGame owner-draw identifier selecting the player ammo value HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L139)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-armor-icon-const-cg-player-armor-icon-1-src-mq3-client-cgame-newdraw-ml-2131072038"></a>
### CG_PLAYER_ARMOR_ICON

```ml
const CG_PLAYER_ARMOR_ICON = 1
```

CGame owner-draw identifier selecting the player armor icon HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L129)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-armor-icon2d-const-cg-player-armor-icon2d-51-src-mq3-client-cgame-newdraw-ml-1932057265"></a>
### CG_PLAYER_ARMOR_ICON2D

```ml
const CG_PLAYER_ARMOR_ICON2D = 51
```

CGame owner-draw identifier selecting the player armor icon2 d HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L209)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-armor-value-const-cg-player-armor-value-2-src-mq3-client-cgame-newdraw-ml-1864142769"></a>
### CG_PLAYER_ARMOR_VALUE

```ml
const CG_PLAYER_ARMOR_VALUE = 2
```

CGame owner-draw identifier selecting the player armor value HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L131)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-hasflag-const-cg-player-hasflag-38-src-mq3-client-cgame-newdraw-ml-2048416230"></a>
### CG_PLAYER_HASFLAG

```ml
const CG_PLAYER_HASFLAG = 38
```

CGame owner-draw identifier selecting the player hasflag HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L189)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-hasflag2d-const-cg-player-hasflag2d-64-src-mq3-client-cgame-newdraw-ml-981734051"></a>
### CG_PLAYER_HASFLAG2D

```ml
const CG_PLAYER_HASFLAG2D = 64
```

CGame owner-draw identifier selecting the player hasflag2 d HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L235)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-head-const-cg-player-head-3-src-mq3-client-cgame-newdraw-ml-2111541618"></a>
### CG_PLAYER_HEAD

```ml
const CG_PLAYER_HEAD = 3
```

CGame owner-draw identifier selecting the player head HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L133)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-health-const-cg-player-health-4-src-mq3-client-cgame-newdraw-ml-1917891199"></a>
### CG_PLAYER_HEALTH

```ml
const CG_PLAYER_HEALTH = 4
```

CGame owner-draw identifier selecting the player health HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L135)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-item-const-cg-player-item-19-src-mq3-client-cgame-newdraw-ml-714131025"></a>
### CG_PLAYER_ITEM

```ml
const CG_PLAYER_ITEM = 19
```

CGame owner-draw identifier selecting the player item HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L153)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-location-const-cg-player-location-33-src-mq3-client-cgame-newdraw-ml-1482062501"></a>
### CG_PLAYER_LOCATION

```ml
const CG_PLAYER_LOCATION = 33
```

CGame owner-draw identifier selecting the player location HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L181)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-score-const-cg-player-score-20-src-mq3-client-cgame-newdraw-ml-1831186791"></a>
### CG_PLAYER_SCORE

```ml
const CG_PLAYER_SCORE = 20
```

CGame owner-draw identifier selecting the player score HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L155)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-status-const-cg-player-status-42-src-mq3-client-cgame-newdraw-ml-899248727"></a>
### CG_PLAYER_STATUS

```ml
const CG_PLAYER_STATUS = 42
```

CGame owner-draw identifier selecting the player status HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L197)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-red-flaghead-const-cg-red-flaghead-24-src-mq3-client-cgame-newdraw-ml-2013782995"></a>
### CG_RED_FLAGHEAD

```ml
const CG_RED_FLAGHEAD = 24
```

CGame owner-draw identifier selecting the red flaghead HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L163)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-red-flagname-const-cg-red-flagname-26-src-mq3-client-cgame-newdraw-ml-2085814141"></a>
### CG_RED_FLAGNAME

```ml
const CG_RED_FLAGNAME = 26
```

CGame owner-draw identifier selecting the red flagname HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L167)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-red-flagstatus-const-cg-red-flagstatus-25-src-mq3-client-cgame-newdraw-ml-337847612"></a>
### CG_RED_FLAGSTATUS

```ml
const CG_RED_FLAGSTATUS = 25
```

CGame owner-draw identifier selecting the red flagstatus HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L165)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-red-name-const-cg-red-name-29-src-mq3-client-cgame-newdraw-ml-649274388"></a>
### CG_RED_NAME

```ml
const CG_RED_NAME = 29
```

CGame owner-draw identifier selecting the red name HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L173)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-red-score-const-cg-red-score-28-src-mq3-client-cgame-newdraw-ml-2146362963"></a>
### CG_RED_SCORE

```ml
const CG_RED_SCORE = 28
```

CGame owner-draw identifier selecting the red score HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L171)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-selectedplayer-armor-const-cg-selectedplayer-armor-40-src-mq3-client-cgame-newdraw-ml-1945960293"></a>
### CG_SELECTEDPLAYER_ARMOR

```ml
const CG_SELECTEDPLAYER_ARMOR = 40
```

CGame owner-draw identifier selecting the selectedplayer armor HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L193)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-selectedplayer-head-const-cg-selectedplayer-head-7-src-mq3-client-cgame-newdraw-ml-1683044112"></a>
### CG_SELECTEDPLAYER_HEAD

```ml
const CG_SELECTEDPLAYER_HEAD = 7
```

CGame owner-draw identifier selecting the selectedplayer head HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L141)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-selectedplayer-health-const-cg-selectedplayer-health-41-src-mq3-client-cgame-newdraw-ml-1529797360"></a>
### CG_SELECTEDPLAYER_HEALTH

```ml
const CG_SELECTEDPLAYER_HEALTH = 41
```

CGame owner-draw identifier selecting the selectedplayer health HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L195)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-selectedplayer-location-const-cg-selectedplayer-location-9-src-mq3-client-cgame-newdraw-ml-1107624732"></a>
### CG_SELECTEDPLAYER_LOCATION

```ml
const CG_SELECTEDPLAYER_LOCATION = 9
```

CGame owner-draw identifier selecting the selectedplayer location HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L145)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-selectedplayer-name-const-cg-selectedplayer-name-8-src-mq3-client-cgame-newdraw-ml-1851905267"></a>
### CG_SELECTEDPLAYER_NAME

```ml
const CG_SELECTEDPLAYER_NAME = 8
```

CGame owner-draw identifier selecting the selectedplayer name HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L143)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-selectedplayer-powerup-const-cg-selectedplayer-powerup-12-src-mq3-client-cgame-newdraw-ml-1176778530"></a>
### CG_SELECTEDPLAYER_POWERUP

```ml
const CG_SELECTEDPLAYER_POWERUP = 12
```

CGame owner-draw identifier selecting the selectedplayer powerup HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L151)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-selectedplayer-status-const-cg-selectedplayer-status-10-src-mq3-client-cgame-newdraw-ml-2090339818"></a>
### CG_SELECTEDPLAYER_STATUS

```ml
const CG_SELECTEDPLAYER_STATUS = 10
```

CGame owner-draw identifier selecting the selectedplayer status HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L147)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-selectedplayer-weapon-const-cg-selectedplayer-weapon-11-src-mq3-client-cgame-newdraw-ml-812532505"></a>
### CG_SELECTEDPLAYER_WEAPON

```ml
const CG_SELECTEDPLAYER_WEAPON = 11
```

CGame owner-draw identifier selecting the selectedplayer weapon HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L149)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-2donly-const-cg-show-2donly-268435456-src-mq3-client-cgame-newdraw-ml-1829335540"></a>
### CG_SHOW_2DONLY

```ml
const CG_SHOW_2DONLY = 268435456
```

Owner-draw visibility flag requiring that only the two-dimensional HUD variant is requested.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L126)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-anynonteamgame-const-cg-show-anynonteamgame-524288-src-mq3-client-cgame-newdraw-ml-244691696"></a>
### CG_SHOW_ANYNONTEAMGAME

```ml
const CG_SHOW_ANYNONTEAMGAME = 524288
```

Owner-draw visibility flag requiring that the game mode has no teams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L124)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-anyteamgame-const-cg-show-anyteamgame-4-src-mq3-client-cgame-newdraw-ml-1383359195"></a>
### CG_SHOW_ANYTEAMGAME

```ml
const CG_SHOW_ANYTEAMGAME = 4
```

Owner-draw visibility flag requiring that the game mode uses teams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L94)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-blue-team-has-redflag-const-cg-show-blue-team-has-redflag-1-src-mq3-client-cgame-newdraw-ml-1967148084"></a>
### CG_SHOW_BLUE_TEAM_HAS_REDFLAG

```ml
const CG_SHOW_BLUE_TEAM_HAS_REDFLAG = 1
```

Owner-draw visibility flag requiring that the blue team is carrying the red flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L90)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-ctf-const-cg-show-ctf-32-src-mq3-client-cgame-newdraw-ml-682050524"></a>
### CG_SHOW_CTF

```ml
const CG_SHOW_CTF = 32
```

Owner-draw visibility flag requiring that the game mode is capture the flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L100)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-duringincomingvoice-const-cg-show-duringincomingvoice-1024-src-mq3-client-cgame-newdraw-ml-280337878"></a>
### CG_SHOW_DURINGINCOMINGVOICE

```ml
const CG_SHOW_DURINGINCOMINGVOICE = 1024
```

Owner-draw visibility flag requiring that an incoming voice-chat announcement is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L110)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-harvester-const-cg-show-harvester-8-src-mq3-client-cgame-newdraw-ml-63478135"></a>
### CG_SHOW_HARVESTER

```ml
const CG_SHOW_HARVESTER = 8
```

Owner-draw visibility flag requiring that the game mode is Harvester.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L96)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-healthcritical-const-cg-show-healthcritical-128-src-mq3-client-cgame-newdraw-ml-1398801000"></a>
### CG_SHOW_HEALTHCRITICAL

```ml
const CG_SHOW_HEALTHCRITICAL = 128
```

Owner-draw visibility flag requiring that the local player's health is in the critical range.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L104)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-healthok-const-cg-show-healthok-16384-src-mq3-client-cgame-newdraw-ml-747689999"></a>
### CG_SHOW_HEALTHOK

```ml
const CG_SHOW_HEALTHOK = 16384
```

Owner-draw visibility flag requiring that the local player's health is above the critical range.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L114)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-if-player-has-flag-const-cg-show-if-player-has-flag-2048-src-mq3-client-cgame-newdraw-ml-1650503765"></a>
### CG_SHOW_IF_PLAYER_HAS_FLAG

```ml
const CG_SHOW_IF_PLAYER_HAS_FLAG = 2048
```

Owner-draw visibility flag requiring that the local player is carrying a flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L112)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-noteaminfo-const-cg-show-noteaminfo-65536-src-mq3-client-cgame-newdraw-ml-1857222102"></a>
### CG_SHOW_NOTEAMINFO

```ml
const CG_SHOW_NOTEAMINFO = 65536
```

Owner-draw visibility flag requiring that team information should be hidden.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L118)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-obelisk-const-cg-show-obelisk-64-src-mq3-client-cgame-newdraw-ml-1439946927"></a>
### CG_SHOW_OBELISK

```ml
const CG_SHOW_OBELISK = 64
```

Owner-draw visibility flag requiring that the game mode is Overload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L102)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-oneflag-const-cg-show-oneflag-16-src-mq3-client-cgame-newdraw-ml-1866309098"></a>
### CG_SHOW_ONEFLAG

```ml
const CG_SHOW_ONEFLAG = 16
```

Owner-draw visibility flag requiring that the game mode is one-flag capture the flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L98)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-otherteamhasflag-const-cg-show-otherteamhasflag-131072-src-mq3-client-cgame-newdraw-ml-891587403"></a>
### CG_SHOW_OTHERTEAMHASFLAG

```ml
const CG_SHOW_OTHERTEAMHASFLAG = 131072
```

Owner-draw visibility flag requiring that the opposing team holds the relevant flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L120)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-red-team-has-blueflag-const-cg-show-red-team-has-blueflag-2-src-mq3-client-cgame-newdraw-ml-1753810133"></a>
### CG_SHOW_RED_TEAM_HAS_BLUEFLAG

```ml
const CG_SHOW_RED_TEAM_HAS_BLUEFLAG = 2
```

Owner-draw visibility flag requiring that the red team is carrying the blue flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L92)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-singleplayer-const-cg-show-singleplayer-256-src-mq3-client-cgame-newdraw-ml-615988864"></a>
### CG_SHOW_SINGLEPLAYER

```ml
const CG_SHOW_SINGLEPLAYER = 256
```

Owner-draw visibility flag requiring that the game mode is single player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L106)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-teaminfo-const-cg-show-teaminfo-32768-src-mq3-client-cgame-newdraw-ml-174496653"></a>
### CG_SHOW_TEAMINFO

```ml
const CG_SHOW_TEAMINFO = 32768
```

Owner-draw visibility flag requiring that team information should be displayed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L116)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-tournament-const-cg-show-tournament-512-src-mq3-client-cgame-newdraw-ml-982924445"></a>
### CG_SHOW_TOURNAMENT

```ml
const CG_SHOW_TOURNAMENT = 512
```

Owner-draw visibility flag requiring that the game mode is a tournament.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L108)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-yourteamhasenemyflag-const-cg-show-yourteamhasenemyflag-262144-src-mq3-client-cgame-newdraw-ml-1667313504"></a>
### CG_SHOW_YOURTEAMHASENEMYFLAG

```ml
const CG_SHOW_YOURTEAMHASENEMYFLAG = 262144
```

Owner-draw visibility flag requiring that the local team holds the enemy flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L122)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-spectators-const-cg-spectators-60-src-mq3-client-cgame-newdraw-ml-1987207823"></a>
### CG_SPECTATORS

```ml
const CG_SPECTATORS = 60
```

CGame owner-draw identifier selecting the spectators HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L227)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-team-color-const-cg-team-color-34-src-mq3-client-cgame-newdraw-ml-1501787186"></a>
### CG_TEAM_COLOR

```ml
const CG_TEAM_COLOR = 34
```

CGame owner-draw identifier selecting the team color HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L183)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-teaminfo-const-cg-teaminfo-61-src-mq3-client-cgame-newdraw-ml-1064039952"></a>
### CG_TEAMINFO

```ml
const CG_TEAMINFO = 61
```

CGame owner-draw identifier selecting the teaminfo HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L229)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-voice-head-const-cg-voice-head-62-src-mq3-client-cgame-newdraw-ml-1912188241"></a>
### CG_VOICE_HEAD

```ml
const CG_VOICE_HEAD = 62
```

CGame owner-draw identifier selecting the voice head HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L231)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-voice-name-const-cg-voice-name-63-src-mq3-client-cgame-newdraw-ml-1144618254"></a>
### CG_VOICE_NAME

```ml
const CG_VOICE_NAME = 63
```

CGame owner-draw identifier selecting the voice name HUD element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L233)

<a id="constant-constant-mq3-client-cgame-newdraw-cgame-event-edithud-const-cgame-event-edithud-3-src-mq3-client-cgame-newdraw-ml-510808230"></a>
### CGAME_EVENT_EDITHUD

```ml
const CGAME_EVENT_EDITHUD = 3
```

CGame event-handling mode selecting the edithud interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L81)

<a id="constant-constant-mq3-client-cgame-newdraw-cgame-event-none-const-cgame-event-none-0-src-mq3-client-cgame-newdraw-ml-2146325619"></a>
### CGAME_EVENT_NONE

```ml
const CGAME_EVENT_NONE = 0
```

CGame event-handling mode selecting the none interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L75)

<a id="constant-constant-mq3-client-cgame-newdraw-cgame-event-scoreboard-const-cgame-event-scoreboard-2-src-mq3-client-cgame-newdraw-ml-1833338985"></a>
### CGAME_EVENT_SCOREBOARD

```ml
const CGAME_EVENT_SCOREBOARD = 2
```

CGame event-handling mode selecting the scoreboard interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L79)

<a id="constant-constant-mq3-client-cgame-newdraw-cgame-event-teammenu-const-cgame-event-teammenu-1-src-mq3-client-cgame-newdraw-ml-1483420036"></a>
### CGAME_EVENT_TEAMMENU

```ml
const CGAME_EVENT_TEAMMENU = 1
```

CGame event-handling mode selecting the teammenu interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L77)

<a id="function-function-mq3-client-cgame-newdraw-checkorderpending-function-checkorderpending-state-src-mq3-client-cgame-newdraw-ml-1079004801"></a>
### checkOrderPending

```ml
function checkOrderPending(state)
```

CG_CheckOrderPending

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game newdraw record/storage; this routine assigns `state.commands`, `state.orderPending`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L601)

<a id="function-function-mq3-client-cgame-newdraw-client-function-client-name-team-src-mq3-client-cgame-newdraw-ml-1620631044"></a>
### client

```ml
function client(name, team)
```

Creates a `mq3.client.cgame_newdraw.Client` record. Assigns `name` from `name`, `team` from `team`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Value used to initialize `Client.name`. |
| `team` | `dynamic` | — | Value used to initialize `Client.team`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L512)

- [mq3.client.cgame_newdraw.Client](Type-mq3-client-cgame-newdraw-client-464952916.md) — struct
<a id="function-function-mq3-client-cgame-newdraw-clientnumfromname-function-clientnumfromname-state-name-src-mq3-client-cgame-newdraw-ml-1195909910"></a>
### clientNumFromName

```ml
function clientNumFromName(state, name)
```

Calls `std.string.equalsIgnoreCaseAscii` from client game newdraw `clientNumFromName`. The final path returns `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.clients`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding client game newdraw resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L1040)

<a id="function-function-mq3-client-cgame-newdraw-copycolor-function-copycolor-value-src-mq3-client-cgame-newdraw-ml-445659339"></a>
### copyColor

```ml
function copyColor(value)
```

Evaluates client game newdraw `copyColor` and returns `[1.0,1.0,1.0,1.0]`, `[value[0],value[1],value[2],value[3]]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence read at `value[0]`, `value[1]`, `value[2]`, `value[3]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L528)

<a id="function-function-mq3-client-cgame-newdraw-create-function-create-retailactive-src-mq3-client-cgame-newdraw-ml-1466001961"></a>
### create

```ml
function create(retailActive)
```

Creates a `mq3.client.cgame_newdraw.State` record. Assigns `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Value used to initialize `State.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L517)

<a id="function-function-mq3-client-cgame-newdraw-currentclient-function-currentclient-state-src-mq3-client-cgame-newdraw-ml-668591159"></a>
### currentClient

```ml
function currentClient(state)
```

Evaluates client game newdraw `currentClient` and returns `void`, `state.clients[0]`, `state.clients[id]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.clients`, `state.selected`, `state.sorted`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L563)

<a id="function-function-mq3-client-cgame-newdraw-draw1stplace-function-draw1stplace-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1982436737"></a>
### draw1stPlace

```ml
function draw1stPlace(state, r, scale, color, shader)
```

Calls `mq3.client.cgame_newdraw.text`, `mq3.client.cgame_newdraw.two` from client game newdraw `draw1stPlace`. The final path returns `text(state,r,two(state.scores1),scale,color)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.scores1`. |
| `r` | `dynamic` | — | Value used by `return text(state,r,two(state.scores1),scale,color)`. |
| `scale` | `dynamic` | — | Value used by `return text(state,r,two(state.scores1),scale,color)`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |
| `shader` | `dynamic` | — | Accepted for compatibility with `draw1stPlace`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L915)

<a id="function-function-mq3-client-cgame-newdraw-draw2ndplace-function-draw2ndplace-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1397921761"></a>
### draw2ndPlace

```ml
function draw2ndPlace(state, r, scale, color, shader)
```

Calls `mq3.client.cgame_newdraw.text`, `mq3.client.cgame_newdraw.two` from client game newdraw `draw2ndPlace`. The final path returns `text(state,r,two(state.scores2),scale,color)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.scores2`. |
| `r` | `dynamic` | — | Value used by `return text(state,r,two(state.scores2),scale,color)`. |
| `scale` | `dynamic` | — | Value used by `return text(state,r,two(state.scores2),scale,color)`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |
| `shader` | `dynamic` | — | Accepted for compatibility with `draw2ndPlace`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L922)

<a id="function-function-mq3-client-cgame-newdraw-drawareachat-function-drawareachat-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1113261209"></a>
### drawAreaChat

```ml
function drawAreaChat(state, r, scale, color, shader)
```

Adapts `mq3.client.cgame_newdraw.text` to client game newdraw `drawAreaChat`, returning its result for `state, r, state.teamChat2, scale, color`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.teamChat2`. |
| `r` | `dynamic` | — | Argument 2 of `mq3.client.cgame_newdraw.text`. |
| `scale` | `dynamic` | — | Argument 4 of `mq3.client.cgame_newdraw.text`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.cgame_newdraw.text`. |
| `shader` | `dynamic` | — | Accepted for compatibility with `drawAreaChat`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L891)

<a id="function-function-mq3-client-cgame-newdraw-drawareapowerup-function-drawareapowerup-state-r-align-special-scale-color-src-mq3-client-cgame-newdraw-ml-1280663568"></a>
### drawAreaPowerUp

```ml
function drawAreaPowerUp(state, r, align, special, scale, color)
```

Calls `mq3.client.cgame_newdraw.sortedPowerups`, `mq3.compat.numeric.trunc32`, `mq3.client.cgame_newdraw.pic` and additional helpers from client game newdraw `drawAreaPowerUp`. The final path returns `len(items)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.health`, `state.time`. |
| `r` | `dynamic` | — | Record read through `r.x`, `r.y`, `r.w`, `r.h`. |
| `align` | `dynamic` | — | Value used by `if align==HUD_VERTICAL then y=y+r.w+special else x=x+r.w+special end if end for`. |
| `special` | `dynamic` | — | Value used by `if align==HUD_VERTICAL then y=y+r.w+special else x=x+r.w+special end if end for`. |
| `scale` | `dynamic` | — | Value used by `text(state,Rect(x+r.w*0.75+3,y,r.w*0.25,r.h),str(n.trunc32(remaining/1000.0)),scale,color)`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L841)

<a id="function-function-mq3-client-cgame-newdraw-drawareasystemchat-function-drawareasystemchat-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1528088533"></a>
### drawAreaSystemChat

```ml
function drawAreaSystemChat(state, r, scale, color, shader)
```

Adapts `mq3.client.cgame_newdraw.text` to client game newdraw `drawAreaSystemChat`, returning its result for `state, r, state.systemChat, scale, color`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.systemChat`. |
| `r` | `dynamic` | — | Argument 2 of `mq3.client.cgame_newdraw.text`. |
| `scale` | `dynamic` | — | Argument 4 of `mq3.client.cgame_newdraw.text`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.cgame_newdraw.text`. |
| `shader` | `dynamic` | — | Accepted for compatibility with `drawAreaSystemChat`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L877)

<a id="function-function-mq3-client-cgame-newdraw-drawareateamchat-function-drawareateamchat-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1423931509"></a>
### drawAreaTeamChat

```ml
function drawAreaTeamChat(state, r, scale, color, shader)
```

Adapts `mq3.client.cgame_newdraw.text` to client game newdraw `drawAreaTeamChat`, returning its result for `state, r, state.teamChat1, scale, color`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.teamChat1`. |
| `r` | `dynamic` | — | Argument 2 of `mq3.client.cgame_newdraw.text`. |
| `scale` | `dynamic` | — | Argument 4 of `mq3.client.cgame_newdraw.text`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.cgame_newdraw.text`. |
| `shader` | `dynamic` | — | Accepted for compatibility with `drawAreaTeamChat`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L884)

<a id="function-function-mq3-client-cgame-newdraw-drawblueflaghead-function-drawblueflaghead-state-r-src-mq3-client-cgame-newdraw-ml-529577341"></a>
### drawBlueFlagHead

```ml
function drawBlueFlagHead(state, r)
```

Calls `mq3.client.cgame_newdraw.flagCarrier`, `mq3.client.cgame_newdraw.model` from client game newdraw `drawBlueFlagHead`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game newdraw state passed to the helper calls in `drawBlueFlagHead`. |
| `r` | `dynamic` | — | Value used by `if id>=0 then return model(state,r,"clientHead",0) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L806)

<a id="function-function-mq3-client-cgame-newdraw-drawblueflagname-function-drawblueflagname-state-r-scale-color-src-mq3-client-cgame-newdraw-ml-1589028674"></a>
### drawBlueFlagName

```ml
function drawBlueFlagName(state, r, scale, color)
```

Calls `mq3.client.cgame_newdraw.flagCarrier`, `mq3.client.cgame_newdraw.text` from client game newdraw `drawBlueFlagName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.clients`. |
| `r` | `dynamic` | — | Value used by `if id>=0 then return text(state,r,state.clients[id].name,scale,color) end if`. |
| `scale` | `dynamic` | — | Value used by `if id>=0 then return text(state,r,state.clients[id].name,scale,color) end if`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L786)

<a id="function-function-mq3-client-cgame-newdraw-drawblueflagstatus-function-drawblueflagstatus-state-r-shader-src-mq3-client-cgame-newdraw-ml-662579282"></a>
### drawBlueFlagStatus

```ml
function drawBlueFlagStatus(state, r, shader)
```

Calls `mq3.client.cgame_newdraw.pic` from client game newdraw `drawBlueFlagStatus`. The final path returns `pic(state,r,"flag"+str(index),[0.0,0.0,1.0,1.0])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.gametype`, `state.blueflag`. |
| `r` | `dynamic` | — | Value used by `if state.gametype==GT_HARVESTER then return pic(state,r,"blueCubeIcon",[0.0,0.0,1.0,1.0]) end if`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L797)

<a id="function-function-mq3-client-cgame-newdraw-drawbluename-function-drawbluename-state-r-scale-color-src-mq3-client-cgame-newdraw-ml-105780598"></a>
### drawBlueName

```ml
function drawBlueName(state, r, scale, color)
```

Adapts `mq3.client.cgame_newdraw.text` to client game newdraw `drawBlueName`, returning its result for `state, r, state.blueTeamName, scale, color`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.blueTeamName`. |
| `r` | `dynamic` | — | Argument 2 of `mq3.client.cgame_newdraw.text`. |
| `scale` | `dynamic` | — | Argument 4 of `mq3.client.cgame_newdraw.text`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.cgame_newdraw.text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L775)

<a id="function-function-mq3-client-cgame-newdraw-drawbluescore-function-drawbluescore-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1659785505"></a>
### drawBlueScore

```ml
function drawBlueScore(state, r, scale, color, shader)
```

Calls `mq3.client.cgame_newdraw.text` from client game newdraw `drawBlueScore`. The final path returns `text(state,r,value,scale,color)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.scores2`. |
| `r` | `dynamic` | — | Value used by `return text(state,r,value,scale,color)`. |
| `scale` | `dynamic` | — | Value used by `return text(state,r,value,scale,color)`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |
| `shader` | `dynamic` | — | Accepted for compatibility with `drawBlueScore`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L763)

<a id="function-function-mq3-client-cgame-newdraw-drawcapfraglimit-function-drawcapfraglimit-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-222064961"></a>
### drawCapFragLimit

```ml
function drawCapFragLimit(state, r, scale, color, shader)
```

Calls `mq3.client.cgame_newdraw.text`, `mq3.client.cgame_newdraw.two` from client game newdraw `drawCapFragLimit`. The final path returns `text(state,r,two(limit),scale,color)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.fraglimit`, `state.gametype`, `state.capturelimit`. |
| `r` | `dynamic` | — | Value used by `return text(state,r,two(limit),scale,color)`. |
| `scale` | `dynamic` | — | Value used by `return text(state,r,two(limit),scale,color)`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |
| `shader` | `dynamic` | — | Accepted for compatibility with `drawCapFragLimit`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L908)

<a id="function-function-mq3-client-cgame-newdraw-drawctfpowerup-function-drawctfpowerup-state-r-src-mq3-client-cgame-newdraw-ml-579631205"></a>
### drawCTFPowerUp

```ml
function drawCTFPowerUp(state, r)
```

Calls `mq3.client.cgame_newdraw.pic` from client game newdraw `drawCTFPowerUp`. The final path returns `pic(state,r,"item"+str(state.persistentPowerup)+"Icon",void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.gametype`, `state.persistentPowerup`. |
| `r` | `dynamic` | — | Value used by `return pic(state,r,"item"+str(state.persistentPowerup)+"Icon",void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L825)

<a id="function-function-mq3-client-cgame-newdraw-drawgamestatus-function-drawgamestatus-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1382672601"></a>
### drawGameStatus

```ml
function drawGameStatus(state, r, scale, color, shader)
```

Adapts `mq3.client.cgame_newdraw.text` to client game newdraw `drawGameStatus`, returning its result for `state, r, getGameStatusText(state), scale, color`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1, 3 of `mq3.client.cgame_newdraw.text`; passed as `state`, `getGameStatusText(state)`. |
| `r` | `dynamic` | — | Argument 2 of `mq3.client.cgame_newdraw.text`. |
| `scale` | `dynamic` | — | Argument 4 of `mq3.client.cgame_newdraw.text`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.cgame_newdraw.text`. |
| `shader` | `dynamic` | — | Accepted for compatibility with `drawGameStatus`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L935)

<a id="function-function-mq3-client-cgame-newdraw-drawgametype-function-drawgametype-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1898628689"></a>
### drawGameType

```ml
function drawGameType(state, r, scale, color, shader)
```

Adapts `mq3.client.cgame_newdraw.text` to client game newdraw `drawGameType`, returning its result for `state, r, gameTypeString(state), scale, color`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1, 3 of `mq3.client.cgame_newdraw.text`; passed as `state`, `gameTypeString(state)`. |
| `r` | `dynamic` | — | Argument 2 of `mq3.client.cgame_newdraw.text`. |
| `scale` | `dynamic` | — | Argument 4 of `mq3.client.cgame_newdraw.text`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.cgame_newdraw.text`. |
| `shader` | `dynamic` | — | Accepted for compatibility with `drawGameType`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L945)

<a id="function-function-mq3-client-cgame-newdraw-drawkiller-function-drawkiller-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-2039572993"></a>
### drawKiller

```ml
function drawKiller(state, r, scale, color, shader)
```

Calls `mq3.client.cgame_newdraw.getKillerText`, `mq3.client.cgame_newdraw.text` from client game newdraw `drawKiller`. The final path returns `text(state,r,value,scale,color)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game newdraw state passed to the helper calls in `drawKiller`. |
| `r` | `dynamic` | — | Value used by `return text(state,r,value,scale,color)`. |
| `scale` | `dynamic` | — | Value used by `return text(state,r,value,scale,color)`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |
| `shader` | `dynamic` | — | Accepted for compatibility with `drawKiller`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L901)

<a id="function-function-mq3-client-cgame-newdraw-drawmedal-function-drawmedal-state-ownerdraw-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1880028202"></a>
### drawMedal

```ml
function drawMedal(state, ownerDraw, r, scale, color, shader)
```

Calls `mq3.client.cgame_newdraw.medalValue`, `mq3.client.cgame_newdraw.copyColor`, `mq3.client.cgame_newdraw.pic` and additional helpers from client game newdraw `drawMedal`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.selectedScore`, `state.medals`. |
| `ownerDraw` | `dynamic` | — | Value used by `value=medalValue(score,ownerDraw)`. |
| `r` | `dynamic` | — | Value used by `pic(state,r,shader,shade)`. |
| `scale` | `dynamic` | — | Value used by `if label!="" then text(state,r,label,scale,[shade[0],shade[1],shade[2],1.0]) end if`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L994)

<a id="function-function-mq3-client-cgame-newdraw-drawnewteaminfo-function-drawnewteaminfo-state-r-textx-texty-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1806598868"></a>
### drawNewTeamInfo

```ml
function drawNewTeamInfo(state, r, textX, textY, scale, color, shader)
```

Calls `mq3.client.cgame_newdraw.pic`, `mq3.client.cgame_newdraw.Rect`, `mq3.client.cgame_newdraw.statusHandle` and additional helpers from client game newdraw `drawNewTeamInfo`. The final path returns `drawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.sorted`, `state.clients`, `state.team`. |
| `r` | `dynamic` | — | Record read through `r.y`, `r.x`, `r.w`, `r.h`. |
| `textX` | `dynamic` | — | Accepted for compatibility with `drawNewTeamInfo`; the current implementation does not read it. |
| `textY` | `dynamic` | — | Value used by `textPaintLimit(state,r.x+r.w,x+27,y+textY,scale,color,ci.name,0.0,0)`. |
| `scale` | `dynamic` | — | Value used by `textPaintLimit(state,r.x+r.w,x+27,y+textY,scale,color,ci.name,0.0,0)`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |
| `shader` | `dynamic` | — | Accepted for compatibility with `drawNewTeamInfo`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L970)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerammoicon-function-drawplayerammoicon-state-r-draw2d-src-mq3-client-cgame-newdraw-ml-699771169"></a>
### drawPlayerAmmoIcon

```ml
function drawPlayerAmmoIcon(state, r, draw2D)
```

Calls `mq3.client.cgame_newdraw.pic`, `mq3.client.cgame_newdraw.model` from client game newdraw `drawPlayerAmmoIcon`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.draw3dIcons`, `state.drawIcons`, `state.weapon`. |
| `r` | `dynamic` | — | Value used by `if draw2D or (not state.draw3dIcons and state.drawIcons) then return pic(state,r,"weapon"+str(state.weapon)+"AmmoIcon",void) else if state.dra...`. |
| `draw2D` | `dynamic` | — | Value used by `if draw2D or (not state.draw3dIcons and state.drawIcons) then return pic(state,r,"weapon"+str(state.weapon)+"AmmoIcon",void) else if state.dra...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L658)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerammovalue-function-drawplayerammovalue-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-168424981"></a>
### drawPlayerAmmoValue

```ml
function drawPlayerAmmoValue(state, r, scale, color, shader)
```

Calls `mq3.client.cgame_newdraw.numericDraw` from client game newdraw `drawPlayerAmmoValue`. The final path returns `numericDraw(state,r,state.ammo,scale,color,shader)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.weapon`, `state.ammo`. |
| `r` | `dynamic` | — | Value used by `return numericDraw(state,r,state.ammo,scale,color,shader)`. |
| `scale` | `dynamic` | — | Value used by `return numericDraw(state,r,state.ammo,scale,color,shader)`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L665)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerarmoricon-function-drawplayerarmoricon-state-r-draw2d-src-mq3-client-cgame-newdraw-ml-282633367"></a>
### drawPlayerArmorIcon

```ml
function drawPlayerArmorIcon(state, r, draw2D)
```

Calls `mq3.client.cgame_newdraw.pic`, `mq3.client.cgame_newdraw.model` from client game newdraw `drawPlayerArmorIcon`. The final path returns `model(state,r,"armorModel",0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.drawStatus`, `state.draw3dIcons`, `state.drawIcons`. |
| `r` | `dynamic` | — | Value used by `if draw2D or (not state.draw3dIcons and state.drawIcons) then return pic(state,r,"armorIcon",void) else if state.draw3dIcons then return model...`. |
| `draw2D` | `dynamic` | — | Value used by `if draw2D or (not state.draw3dIcons and state.drawIcons) then return pic(state,r,"armorIcon",void) else if state.draw3dIcons then return model...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L646)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerarmorvalue-function-drawplayerarmorvalue-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1271604217"></a>
### drawPlayerArmorValue

```ml
function drawPlayerArmorValue(state, r, scale, color, shader)
```

Adapts `mq3.client.cgame_newdraw.numericDraw` to client game newdraw `drawPlayerArmorValue`, returning its result for `state, r, state.armor, scale, color, shader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.armor`. |
| `r` | `dynamic` | — | Argument 2 of `mq3.client.cgame_newdraw.numericDraw`. |
| `scale` | `dynamic` | — | Argument 4 of `mq3.client.cgame_newdraw.numericDraw`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.cgame_newdraw.numericDraw`. |
| `shader` | `dynamic` | — | Argument 6 of `mq3.client.cgame_newdraw.numericDraw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L653)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerhasflag-function-drawplayerhasflag-state-r-force2d-src-mq3-client-cgame-newdraw-ml-2092263056"></a>
### drawPlayerHasFlag

```ml
function drawPlayerHasFlag(state, r, force2D)
```

Calls `mq3.client.cgame_newdraw.emit` from client game newdraw `drawPlayerHasFlag`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.playerPowerups`. |
| `r` | `dynamic` | — | Value used by `if (state.playerPowerups&(1<<PW_REDFLAG))!=0 then return emit(state,"flag",r,"red","","",void,force2D,TEAM_RED) else if (state.playerPowerups&...`. |
| `force2D` | `dynamic` | — | Value used by `if (state.playerPowerups&(1<<PW_REDFLAG))!=0 then return emit(state,"flag",r,"red","","",void,force2D,TEAM_RED) else if (state.playerPowerups&...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L870)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerhead-function-drawplayerhead-state-r-draw2d-src-mq3-client-cgame-newdraw-ml-978080337"></a>
### drawPlayerHead

```ml
function drawPlayerHead(state, r, draw2D)
```

Calls `mq3.client.cgame_newdraw.selfClient`, `mq3.client.cgame_newdraw.pic`, `mq3.client.cgame_newdraw.model` from client game newdraw `drawPlayerHead`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.draw3dIcons`. |
| `r` | `dynamic` | — | Value used by `if ci!=void then return pic(state,r,ci.modelIcon,void) end if else return model(state,r,"playerHead",0) end if`. |
| `draw2D` | `dynamic` | — | Value used by `if draw2D or not state.draw3dIcons then ci=selfClient(state)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L670)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerhealth-function-drawplayerhealth-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1601082665"></a>
### drawPlayerHealth

```ml
function drawPlayerHealth(state, r, scale, color, shader)
```

Adapts `mq3.client.cgame_newdraw.numericDraw` to client game newdraw `drawPlayerHealth`, returning its result for `state, r, state.health, scale, color, shader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.health`. |
| `r` | `dynamic` | — | Argument 2 of `mq3.client.cgame_newdraw.numericDraw`. |
| `scale` | `dynamic` | — | Argument 4 of `mq3.client.cgame_newdraw.numericDraw`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.cgame_newdraw.numericDraw`. |
| `shader` | `dynamic` | — | Argument 6 of `mq3.client.cgame_newdraw.numericDraw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L749)

<a id="function-function-mq3-client-cgame-newdraw-drawplayeritem-function-drawplayeritem-state-r-scale-draw2d-src-mq3-client-cgame-newdraw-ml-9967851"></a>
### drawPlayerItem

```ml
function drawPlayerItem(state, r, scale, draw2D)
```

Calls `mq3.client.cgame_newdraw.pic` from client game newdraw `drawPlayerItem`. The final path returns `pic(state,r,"item"+str(state.holdable)+"Icon",void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.holdable`. |
| `r` | `dynamic` | — | Value used by `return pic(state,r,"item"+str(state.holdable)+"Icon",void)`. |
| `scale` | `dynamic` | — | Accepted for compatibility with `drawPlayerItem`; the current implementation does not read it. |
| `draw2D` | `dynamic` | — | Accepted for compatibility with `drawPlayerItem`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L728)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerlocation-function-drawplayerlocation-state-r-scale-color-src-mq3-client-cgame-newdraw-ml-1891435162"></a>
### drawPlayerLocation

```ml
function drawPlayerLocation(state, r, scale, color)
```

Calls `mq3.client.cgame_newdraw.selfClient`, `mq3.client.cgame_newdraw.text`, `mq3.client.cgame_newdraw.location` from client game newdraw `drawPlayerLocation`. The final path returns `text(state,r,location(state,ci.location),scale,color)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game newdraw state passed to the helper calls in `drawPlayerLocation`. |
| `r` | `dynamic` | — | Value used by `return text(state,r,location(state,ci.location),scale,color)`. |
| `scale` | `dynamic` | — | Value used by `return text(state,r,location(state,ci.location),scale,color)`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L711)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerscore-function-drawplayerscore-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1619519839"></a>
### drawPlayerScore

```ml
function drawPlayerScore(state, r, scale, color, shader)
```

Adapts `mq3.client.cgame_newdraw.numericDraw` to client game newdraw `drawPlayerScore`, returning its result for `state, r, state.score, scale, color, shader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.score`. |
| `r` | `dynamic` | — | Argument 2 of `mq3.client.cgame_newdraw.numericDraw`. |
| `scale` | `dynamic` | — | Argument 4 of `mq3.client.cgame_newdraw.numericDraw`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.cgame_newdraw.numericDraw`. |
| `shader` | `dynamic` | — | Argument 6 of `mq3.client.cgame_newdraw.numericDraw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L722)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerstatus-function-drawplayerstatus-state-r-src-mq3-client-cgame-newdraw-ml-1789393081"></a>
### drawPlayerStatus

```ml
function drawPlayerStatus(state, r)
```

Calls `mq3.client.cgame_newdraw.selfClient`, `mq3.client.cgame_newdraw.pic`, `mq3.client.cgame_newdraw.statusHandle` from client game newdraw `drawPlayerStatus`. The final path returns `pic(state,r,statusHandle(ci.teamTask),void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game newdraw state passed to the helper calls in `drawPlayerStatus`. |
| `r` | `dynamic` | — | Value used by `return pic(state,r,statusHandle(ci.teamTask),void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L692)

<a id="function-function-mq3-client-cgame-newdraw-drawredflaghead-function-drawredflaghead-state-r-src-mq3-client-cgame-newdraw-ml-603745787"></a>
### drawRedFlagHead

```ml
function drawRedFlagHead(state, r)
```

Calls `mq3.client.cgame_newdraw.flagCarrier`, `mq3.client.cgame_newdraw.model` from client game newdraw `drawRedFlagHead`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game newdraw state passed to the helper calls in `drawRedFlagHead`. |
| `r` | `dynamic` | — | Value used by `if id>=0 then return model(state,r,"clientHead",0) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L810)

<a id="function-function-mq3-client-cgame-newdraw-drawredflagname-function-drawredflagname-state-r-scale-color-src-mq3-client-cgame-newdraw-ml-1478096306"></a>
### drawRedFlagName

```ml
function drawRedFlagName(state, r, scale, color)
```

Calls `mq3.client.cgame_newdraw.flagCarrier`, `mq3.client.cgame_newdraw.text` from client game newdraw `drawRedFlagName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.clients`. |
| `r` | `dynamic` | — | Value used by `if id>=0 then return text(state,r,state.clients[id].name,scale,color) end if`. |
| `scale` | `dynamic` | — | Value used by `if id>=0 then return text(state,r,state.clients[id].name,scale,color) end if`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L792)

<a id="function-function-mq3-client-cgame-newdraw-drawredflagstatus-function-drawredflagstatus-state-r-shader-src-mq3-client-cgame-newdraw-ml-1643796404"></a>
### drawRedFlagStatus

```ml
function drawRedFlagStatus(state, r, shader)
```

Calls `mq3.client.cgame_newdraw.pic` from client game newdraw `drawRedFlagStatus`. The final path returns `pic(state,r,"flag"+str(index),[1.0,0.0,0.0,1.0])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.gametype`, `state.redflag`. |
| `r` | `dynamic` | — | Value used by `if state.gametype==GT_HARVESTER then return pic(state,r,"redCubeIcon",[1.0,0.0,0.0,1.0]) end if`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L802)

<a id="function-function-mq3-client-cgame-newdraw-drawredname-function-drawredname-state-r-scale-color-src-mq3-client-cgame-newdraw-ml-1113209266"></a>
### drawRedName

```ml
function drawRedName(state, r, scale, color)
```

Adapts `mq3.client.cgame_newdraw.text` to client game newdraw `drawRedName`, returning its result for `state, r, state.redTeamName, scale, color`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.redTeamName`. |
| `r` | `dynamic` | — | Argument 2 of `mq3.client.cgame_newdraw.text`. |
| `scale` | `dynamic` | — | Argument 4 of `mq3.client.cgame_newdraw.text`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.cgame_newdraw.text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L769)

<a id="function-function-mq3-client-cgame-newdraw-drawredscore-function-drawredscore-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-716289293"></a>
### drawRedScore

```ml
function drawRedScore(state, r, scale, color, shader)
```

Calls `mq3.client.cgame_newdraw.text` from client game newdraw `drawRedScore`. The final path returns `text(state,r,value,scale,color)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.scores1`. |
| `r` | `dynamic` | — | Value used by `return text(state,r,value,scale,color)`. |
| `scale` | `dynamic` | — | Value used by `return text(state,r,value,scale,color)`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |
| `shader` | `dynamic` | — | Accepted for compatibility with `drawRedScore`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L756)

<a id="function-function-mq3-client-cgame-newdraw-drawselectedplayerarmor-function-drawselectedplayerarmor-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-222087179"></a>
### drawSelectedPlayerArmor

```ml
function drawSelectedPlayerArmor(state, r, scale, color, shader)
```

Calls `mq3.client.cgame_newdraw.currentClient`, `mq3.client.cgame_newdraw.numericDraw` from client game newdraw `drawSelectedPlayerArmor`. The final path returns `numericDraw(state,r,ci.armor,scale,color,shader)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game newdraw state passed to the helper calls in `drawSelectedPlayerArmor`. |
| `r` | `dynamic` | — | Value used by `return numericDraw(state,r,ci.armor,scale,color,shader)`. |
| `scale` | `dynamic` | — | Value used by `return numericDraw(state,r,ci.armor,scale,color,shader)`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L684)

<a id="function-function-mq3-client-cgame-newdraw-drawselectedplayerhead-function-drawselectedplayerhead-state-r-draw2d-voice-src-mq3-client-cgame-newdraw-ml-620219451"></a>
### drawSelectedPlayerHead

```ml
function drawSelectedPlayerHead(state, r, draw2D, voice)
```

Calls `mq3.client.cgame_newdraw.currentClient`, `mq3.client.cgame_newdraw.voiceClient`, `mq3.client.cgame_newdraw.model` and additional helpers from client game newdraw `drawSelectedPlayerHead`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.selectedClient`, `state.voiceClient`, `state.draw3dIcons`, `state.drawIcons`. |
| `r` | `dynamic` | — | Value used by `if state.draw3dIcons and not draw2D then result=model(state,r,ci.headModel,id) else if state.drawIcons then result=pic(state,r,ci.modelIcon,vo...`. |
| `draw2D` | `dynamic` | — | Value used by `if state.draw3dIcons and not draw2D then result=model(state,r,ci.headModel,id) else if state.drawIcons then result=pic(state,r,ci.modelIcon,vo...`. |
| `voice` | `dynamic` | — | Value used by `if voice then ci=voiceClient(state)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L742)

<a id="function-function-mq3-client-cgame-newdraw-drawselectedplayerhealth-function-drawselectedplayerhealth-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1443506201"></a>
### drawSelectedPlayerHealth

```ml
function drawSelectedPlayerHealth(state, r, scale, color, shader)
```

Calls `mq3.client.cgame_newdraw.currentClient`, `mq3.client.cgame_newdraw.numericDraw` from client game newdraw `drawSelectedPlayerHealth`. The final path returns `numericDraw(state,r,ci.health,scale,color,shader)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game newdraw state passed to the helper calls in `drawSelectedPlayerHealth`. |
| `r` | `dynamic` | — | Value used by `return numericDraw(state,r,ci.health,scale,color,shader)`. |
| `scale` | `dynamic` | — | Value used by `return numericDraw(state,r,ci.health,scale,color,shader)`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L677)

<a id="function-function-mq3-client-cgame-newdraw-drawselectedplayerlocation-function-drawselectedplayerlocation-state-r-scale-color-src-mq3-client-cgame-newdraw-ml-1253835474"></a>
### drawSelectedPlayerLocation

```ml
function drawSelectedPlayerLocation(state, r, scale, color)
```

Calls `mq3.client.cgame_newdraw.currentClient`, `mq3.client.cgame_newdraw.text`, `mq3.client.cgame_newdraw.location` from client game newdraw `drawSelectedPlayerLocation`. The final path returns `text(state,r,location(state,ci.location),scale,color)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game newdraw state passed to the helper calls in `drawSelectedPlayerLocation`. |
| `r` | `dynamic` | — | Value used by `return text(state,r,location(state,ci.location),scale,color)`. |
| `scale` | `dynamic` | — | Value used by `return text(state,r,location(state,ci.location),scale,color)`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L705)

<a id="function-function-mq3-client-cgame-newdraw-drawselectedplayername-function-drawselectedplayername-state-r-scale-color-voice-src-mq3-client-cgame-newdraw-ml-774211362"></a>
### drawSelectedPlayerName

```ml
function drawSelectedPlayerName(state, r, scale, color, voice)
```

Calls `mq3.client.cgame_newdraw.currentClient`, `mq3.client.cgame_newdraw.voiceClient`, `mq3.client.cgame_newdraw.text` from client game newdraw `drawSelectedPlayerName`. The final path returns `text(state,r,ci.name,scale,color)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game newdraw state passed to the helper calls in `drawSelectedPlayerName`. |
| `r` | `dynamic` | — | Value used by `return text(state,r,ci.name,scale,color)`. |
| `scale` | `dynamic` | — | Value used by `return text(state,r,ci.name,scale,color)`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |
| `voice` | `dynamic` | — | Value used by `if voice then ci=voiceClient(state) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L699)

<a id="function-function-mq3-client-cgame-newdraw-drawselectedplayerpowerup-function-drawselectedplayerpowerup-state-r-draw2d-src-mq3-client-cgame-newdraw-ml-2028855857"></a>
### drawSelectedPlayerPowerup

```ml
function drawSelectedPlayerPowerup(state, r, draw2D)
```

Calls `mq3.client.cgame_newdraw.currentClient`, `mq3.client.cgame_newdraw.firstPowerup`, `mq3.client.cgame_newdraw.pic` from client game newdraw `drawSelectedPlayerPowerup`. The final path returns `pic(state,r,"powerup"+str(id)+"Icon",void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game newdraw state passed to the helper calls in `drawSelectedPlayerPowerup`. |
| `r` | `dynamic` | — | Value used by `return pic(state,r,"powerup"+str(id)+"Icon",void)`. |
| `draw2D` | `dynamic` | — | Accepted for compatibility with `drawSelectedPlayerPowerup`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L736)

<a id="function-function-mq3-client-cgame-newdraw-drawselectedplayerstatus-function-drawselectedplayerstatus-state-r-src-mq3-client-cgame-newdraw-ml-773378645"></a>
### drawSelectedPlayerStatus

```ml
function drawSelectedPlayerStatus(state, r)
```

Calls `mq3.client.cgame_newdraw.currentClient`, `mq3.client.cgame_newdraw.pic`, `mq3.client.cgame_newdraw.statusHandle` from client game newdraw `drawSelectedPlayerStatus`. The final path returns `pic(state,r,statusHandle(task),void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.orderPending`, `state.time`, `state.orderTime`, `state.currentOrder`. |
| `r` | `dynamic` | — | Value used by `return pic(state,r,statusHandle(task),void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L688)

<a id="function-function-mq3-client-cgame-newdraw-drawselectedplayerweapon-function-drawselectedplayerweapon-state-r-src-mq3-client-cgame-newdraw-ml-430085661"></a>
### drawSelectedPlayerWeapon

```ml
function drawSelectedPlayerWeapon(state, r)
```

Calls `mq3.client.cgame_newdraw.currentClient`, `mq3.client.cgame_newdraw.pic` from client game newdraw `drawSelectedPlayerWeapon`. The final path returns `pic(state,r,name,void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game newdraw state passed to the helper calls in `drawSelectedPlayerWeapon`. |
| `r` | `dynamic` | — | Value used by `return pic(state,r,name,void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L715)

<a id="function-function-mq3-client-cgame-newdraw-drawteamcolor-function-drawteamcolor-state-r-color-src-mq3-client-cgame-newdraw-ml-657079488"></a>
### drawTeamColor

```ml
function drawTeamColor(state, r, color)
```

Adapts `mq3.client.cgame_newdraw.emit` to client game newdraw `drawTeamColor`, returning its result for `state, "team-background", r, "", "", "", color, color[3], state.team`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.team`. |
| `r` | `dynamic` | — | Argument 3 of `mq3.client.cgame_newdraw.emit`. |
| `color` | `dynamic` | — | Argument 7, 8 of `mq3.client.cgame_newdraw.emit`; passed as `color`, `color[3]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L830)

<a id="function-function-mq3-client-cgame-newdraw-drawteamspectators-function-drawteamspectators-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-719341377"></a>
### drawTeamSpectators

```ml
function drawTeamSpectators(state, r, scale, color, shader)
```

Updates `state.spectatorWidth`, `state.spectatorPaintX`, `state.spectatorPaintX2`, `state.spectatorOffset` and additional values during client game newdraw `drawTeamSpectators`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game newdraw record/storage; this routine assigns `state.spectatorWidth`, `state.spectatorPaintX`, `state.spectatorPaintX2`, `state.spectatorOffset` and additional values. |
| `r` | `dynamic` | — | Record read through `r.x`, `r.w`, `r.y`, `r.h`. |
| `scale` | `dynamic` | — | Value used by `if state.spectatorPaintX<=r.x+2 then if state.spectatorOffset<state.spectatorLen then state.spectatorPaintX=state.spectatorPaintX+state.glyphW...`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |
| `shader` | `dynamic` | — | Accepted for compatibility with `drawTeamSpectators`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L979)

<a id="function-function-mq3-client-cgame-newdraw-emit-function-emit-state-kind-r-text-shader-model-color-value-clientnum-src-mq3-client-cgame-newdraw-ml-683034227"></a>
### emit

```ml
function emit(state, kind, r, text, shader, model, color, value, clientNum)
```

Appends a client game newdraw action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game newdraw record/storage; this routine assigns `state.actions`, `state.emitted`, `state.suppressed`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `r` | `dynamic` | — | Value used by `a=Action("cgame-newdraw",kind,r,text,shader,model,copyColor(color),value,clientNum,dispatched)`. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the client game newdraw path. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this client game newdraw operation. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |
| `value` | `dynamic` | — | Value used by `a=Action("cgame-newdraw",kind,r,text,shader,model,copyColor(color),value,clientNum,dispatched)`. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L539)

<a id="function-function-mq3-client-cgame-newdraw-eventhandling-function-eventhandling-state-type-src-mq3-client-cgame-newdraw-ml-1585594381"></a>
### eventHandling

```ml
function eventHandling(state, type)
```

Updates `state.eventHandling` during client game newdraw `eventHandling`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game newdraw record/storage; this routine assigns `state.eventHandling`. |
| `type` | `dynamic` | — | Value assigned to `state.eventHandling`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L1031)

<a id="function-function-mq3-client-cgame-newdraw-firstpowerup-function-firstpowerup-bits-src-mq3-client-cgame-newdraw-ml-1533023382"></a>
### firstPowerup

```ml
function firstPowerup(bits)
```

Evaluates client game newdraw `firstPowerup` and returns `id`, `-1` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bits` | `dynamic` | — | Value used by `for id=0 to 31 if (bits&(1<<id))!=0 then return id end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L731)

<a id="constant-constant-mq3-client-cgame-newdraw-flag-atbase-const-flag-atbase-0-src-mq3-client-cgame-newdraw-ml-1760103647"></a>
### FLAG_ATBASE

```ml
const FLAG_ATBASE = 0
```

Flag-objective status identifying the atbase ownership or location state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L39)

<a id="constant-constant-mq3-client-cgame-newdraw-flag-dropped-const-flag-dropped-2-src-mq3-client-cgame-newdraw-ml-1114840801"></a>
### FLAG_DROPPED

```ml
const FLAG_DROPPED = 2
```

Flag-objective status identifying the dropped ownership or location state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L43)

<a id="constant-constant-mq3-client-cgame-newdraw-flag-taken-const-flag-taken-1-src-mq3-client-cgame-newdraw-ml-1559642582"></a>
### FLAG_TAKEN

```ml
const FLAG_TAKEN = 1
```

Flag-objective status identifying the taken ownership or location state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L41)

<a id="constant-constant-mq3-client-cgame-newdraw-flag-taken-blue-const-flag-taken-blue-4-src-mq3-client-cgame-newdraw-ml-157340275"></a>
### FLAG_TAKEN_BLUE

```ml
const FLAG_TAKEN_BLUE = 4
```

Flag-objective status identifying the taken blue ownership or location state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L47)

<a id="constant-constant-mq3-client-cgame-newdraw-flag-taken-red-const-flag-taken-red-3-src-mq3-client-cgame-newdraw-ml-212284700"></a>
### FLAG_TAKEN_RED

```ml
const FLAG_TAKEN_RED = 3
```

Flag-objective status identifying the taken red ownership or location state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L45)

<a id="function-function-mq3-client-cgame-newdraw-flagcarrier-function-flagcarrier-state-wantedteam-powerup-src-mq3-client-cgame-newdraw-ml-415877485"></a>
### flagCarrier

```ml
function flagCarrier(state, wantedTeam, powerup)
```

Evaluates client game newdraw `flagCarrier` and returns `id`, `-1` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.clients`. |
| `wantedTeam` | `dynamic` | — | Value used by `if ci.infoValid and ci.team==wantedTeam and (ci.powerups&(1<<powerup))!=0 then return id end if end for`. |
| `powerup` | `dynamic` | — | Value used by `if ci.infoValid and ci.team==wantedTeam and (ci.powerups&(1<<powerup))!=0 then return id end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L780)

<a id="function-function-mq3-client-cgame-newdraw-gametypestring-function-gametypestring-state-src-mq3-client-cgame-newdraw-ml-1444808699"></a>
### gameTypeString

```ml
function gameTypeString(state)
```

Evaluates client game newdraw `gameTypeString` and returns `"Free For All"`, `"Team Deathmatch"`, `"Capture the Flag"` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.gametype`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L938)

<a id="function-function-mq3-client-cgame-newdraw-getgamestatustext-function-getgamestatustext-state-src-mq3-client-cgame-newdraw-ml-1670054073"></a>
### getGameStatusText

```ml
function getGameStatusText(state)
```

Calls `mq3.client.cgame_newdraw.placeString` from client game newdraw `getGameStatusText`. The final path returns `"Blue leads Red, "+str(state.teamScores[1])+" to "+str(state.teamScores[0])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.gametype`, `state.team`, `state.rank`, `state.score` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L928)

<a id="function-function-mq3-client-cgame-newdraw-getkillertext-function-getkillertext-state-src-mq3-client-cgame-newdraw-ml-765047631"></a>
### getKillerText

```ml
function getKillerText(state)
```

Evaluates client game newdraw `getKillerText` and returns `"Fragged by "+state.killerName`, `""` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.killerName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L894)

<a id="function-function-mq3-client-cgame-newdraw-getselectedplayer-function-getselectedplayer-state-src-mq3-client-cgame-newdraw-ml-2122214991"></a>
### getSelectedPlayer

```ml
function getSelectedPlayer(state)
```

Updates `state.selected` during client game newdraw `getSelectedPlayer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game newdraw record/storage; this routine assigns `state.selected`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L621)

<a id="function-function-mq3-client-cgame-newdraw-getteamcolor-function-getteamcolor-state-src-mq3-client-cgame-newdraw-ml-1045829495"></a>
### getTeamColor

```ml
function getTeamColor(state)
```

Evaluates client game newdraw `getTeamColor` and returns `[1.0,0.0,0.0,0.25]`, `[0.0,0.0,1.0,0.25]`, `[0.0,0.17,0.0,0.25]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.team`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L1051)

<a id="function-function-mq3-client-cgame-newdraw-getvalue-function-getvalue-state-ownerdraw-src-mq3-client-cgame-newdraw-ml-1198027504"></a>
### getValue

```ml
function getValue(state, ownerDraw)
```

CG_GetValue

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.armor`, `state.weapon`, `state.ammo`, `state.score` and additional values. |
| `ownerDraw` | `dynamic` | — | Value used by `if ownerDraw==CG_SELECTEDPLAYER_ARMOR and ci!=void then return ci.armor end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L846)

<a id="constant-constant-mq3-client-cgame-newdraw-gt-1fctf-const-gt-1fctf-5-src-mq3-client-cgame-newdraw-ml-69306150"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```

Native game-type identifier selecting one-flag capture the flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L33)

<a id="constant-constant-mq3-client-cgame-newdraw-gt-ctf-const-gt-ctf-4-src-mq3-client-cgame-newdraw-ml-916130495"></a>
### GT_CTF

```ml
const GT_CTF = 4
```

Native game-type value for capture the flag, used when selecting mode-dependent Missionpack HUD widgets and visibility.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L31)

<a id="constant-constant-mq3-client-cgame-newdraw-gt-ffa-const-gt-ffa-0-src-mq3-client-cgame-newdraw-ml-722879443"></a>
### GT_FFA

```ml
const GT_FFA = 0
```

Native game-type identifier selecting free-for-all deathmatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L19)

<a id="constant-constant-mq3-client-cgame-newdraw-gt-harvester-const-gt-harvester-7-src-mq3-client-cgame-newdraw-ml-1013950744"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```

Native game-type identifier selecting Harvester.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L37)

<a id="constant-constant-mq3-client-cgame-newdraw-gt-obelisk-const-gt-obelisk-6-src-mq3-client-cgame-newdraw-ml-711639297"></a>
### GT_OBELISK

```ml
const GT_OBELISK = 6
```

Native game-type identifier selecting Overload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L35)

<a id="constant-constant-mq3-client-cgame-newdraw-gt-single-player-const-gt-single-player-2-src-mq3-client-cgame-newdraw-ml-1783392815"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```

Native game-type value for single-player arena progression, used when selecting mode-dependent Missionpack HUD widgets and visibility.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L25)

<a id="constant-constant-mq3-client-cgame-newdraw-gt-team-const-gt-team-3-src-mq3-client-cgame-newdraw-ml-1521732754"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```

Native game-type value for team deathmatch, used when selecting mode-dependent Missionpack HUD widgets and visibility.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L28)

<a id="constant-constant-mq3-client-cgame-newdraw-gt-tournament-const-gt-tournament-1-src-mq3-client-cgame-newdraw-ml-1455258180"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```

Native game-type value for one-on-one tournament play, used when selecting mode-dependent Missionpack HUD widgets and visibility.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L22)

<a id="function-function-mq3-client-cgame-newdraw-harvesterskulls-function-harvesterskulls-state-r-scale-color-force2d-src-mq3-client-cgame-newdraw-ml-1091364175"></a>
### harvesterSkulls

```ml
function harvesterSkulls(state, r, scale, color, force2D)
```

Calls `mq3.client.cgame_newdraw.text`, `mq3.client.cgame_newdraw.model`, `mq3.client.cgame_newdraw.pic` from client game newdraw `harvesterSkulls`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.gametype`, `state.generic1`, `state.team`, `state.drawIcons` and additional values. |
| `r` | `dynamic` | — | Value used by `text(state,r,str(value),scale,color)`. |
| `scale` | `dynamic` | — | Value used by `text(state,r,str(value),scale,color)`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |
| `force2D` | `dynamic` | — | Value used by `if state.drawIcons then if not force2D and state.draw3dIcons then model(state,r,enemy+"CubeModel",0) else pic(state,r,enemy+"CubeIcon",void) e...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L817)

<a id="function-function-mq3-client-cgame-newdraw-hasplayerflag-function-hasplayerflag-state-src-mq3-client-cgame-newdraw-ml-695109613"></a>
### hasPlayerFlag

```ml
function hasPlayerFlag(state)
```

Computes `(state.playerPowerups&(1<<PW_REDFLAG))!=0 or (state.playerPowerups&(1<<PW_BLUEFLAG))!=0 or (state.playerPowerups&(1<<PW_NEUTRALFLAG))!=0` for client game newdraw `hasPlayerFlag`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.playerPowerups`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L857)

<a id="function-function-mq3-client-cgame-newdraw-hideteammenu-function-hideteammenu-state-src-mq3-client-cgame-newdraw-ml-718771271"></a>
### hideTeamMenu

```ml
function hideTeamMenu(state)
```

Updates `state.menus` during client game newdraw `hideTeamMenu`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game newdraw record/storage; this routine assigns `state.menus`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L1024)

<a id="constant-constant-mq3-client-cgame-newdraw-hud-vertical-const-hud-vertical-0-src-mq3-client-cgame-newdraw-ml-1441063425"></a>
### HUD_VERTICAL

```ml
const HUD_VERTICAL = 0
```

HUD powerup-list layout selector choosing vertical arrangement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L87)

<a id="function-function-mq3-client-cgame-newdraw-initteamchat-function-initteamchat-state-src-mq3-client-cgame-newdraw-ml-1682875263"></a>
### initTeamChat

```ml
function initTeamChat(state)
```

CG_InitTeamChat / CG_SetPrintString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game newdraw record/storage; this routine assigns `state.systemChat`, `state.teamChat1`, `state.teamChat2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L580)

<a id="constant-constant-mq3-client-cgame-newdraw-k-mouse2-const-k-mouse2-179-src-mq3-client-cgame-newdraw-ml-1520881776"></a>
### K_MOUSE2

```ml
const K_MOUSE2 = 179
```

Engine key code for the mouse2 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L83)

<a id="function-function-mq3-client-cgame-newdraw-keyevent-function-keyevent-state-key-down-src-mq3-client-cgame-newdraw-ml-2083805466"></a>
### keyEvent

```ml
function keyEvent(state, key, down)
```

Updates `state.capturedItem` during client game newdraw `keyEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game newdraw record/storage; this routine assigns `state.capturedItem`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding client game newdraw entry. |
| `down` | `dynamic` | — | Whether this event presses the key/button; false represents its release. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L1036)

<a id="function-function-mq3-client-cgame-newdraw-location-function-location-state-id-src-mq3-client-cgame-newdraw-ml-2051431404"></a>
### location

```ml
function location(state, id)
```

Evaluates client game newdraw `location` and returns `state.locations[id]`, `"unknown"` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.locations`. |
| `id` | `dynamic` | — | Value used by `if id>=0 and id<len(state.locations) and state.locations[id]!="" then return state.locations[id] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L573)

<a id="function-function-mq3-client-cgame-newdraw-medal-function-medal-src-mq3-client-cgame-newdraw-ml-127740068"></a>
### medal

```ml
function medal()
```

Creates a `mq3.client.cgame_newdraw.Medal` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L514)

- [mq3.client.cgame_newdraw.Medal](Type-mq3-client-cgame-newdraw-medal-437857318.md) — struct
<a id="function-function-mq3-client-cgame-newdraw-medalvalue-function-medalvalue-score-ownerdraw-src-mq3-client-cgame-newdraw-ml-1164127827"></a>
### medalValue

```ml
function medalValue(score, ownerDraw)
```

Evaluates client game newdraw `medalValue` and returns `0`, `score.accuracy`, `score.assists` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `score` | `dynamic` | — | Record read through `score.accuracy`, `score.assists`, `score.defend`, `score.excellent` and additional values. |
| `ownerDraw` | `dynamic` | — | Value used by `if ownerDraw==CG_ACCURACY then return score.accuracy else if ownerDraw==CG_ASSISTS then return score.assists else if ownerDraw==CG_DEFEND then...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L986)

<a id="function-function-mq3-client-cgame-newdraw-model-function-model-state-r-name-clientnum-src-mq3-client-cgame-newdraw-ml-1444007175"></a>
### model

```ml
function model(state, r, name, clientNum)
```

Calls `mq3.client.cgame_newdraw.emit` from client game newdraw `model`. The final path returns `emit(state,"model",r,"","",name,void,0.0,clientNum)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game newdraw state passed to the helper calls in `model`. |
| `r` | `dynamic` | — | Value used by `return emit(state,"model",r,"","",name,void,0.0,clientNum)`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding client game newdraw resource. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L560)

<a id="function-function-mq3-client-cgame-newdraw-mouseevent-function-mouseevent-state-x-y-src-mq3-client-cgame-newdraw-ml-1630847090"></a>
### mouseEvent

```ml
function mouseEvent(state, x, y)
```

Updates `state.cursorX`, `state.cursorY` during client game newdraw `mouseEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game newdraw record/storage; this routine assigns `state.cursorX`, `state.cursorY`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `mouseEvent`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `mouseEvent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L1021)

<a id="function-function-mq3-client-cgame-newdraw-numericdraw-function-numericdraw-state-r-value-scale-color-shader-src-mq3-client-cgame-newdraw-ml-996353680"></a>
### numericDraw

```ml
function numericDraw(state, r, value, scale, color, shader)
```

Calls `mq3.client.cgame_newdraw.pic`, `mq3.client.cgame_newdraw.text` from client game newdraw `numericDraw`. The final path returns `text(state,r,str(value),scale,color)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game newdraw state passed to the helper calls in `numericDraw`. |
| `r` | `dynamic` | — | Value used by `if shader!="" then return pic(state,r,shader,color) end if`. |
| `value` | `dynamic` | — | Value used by `return text(state,r,str(value),scale,color)`. |
| `scale` | `dynamic` | — | Value used by `return text(state,r,str(value),scale,color)`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L641)

<a id="function-function-mq3-client-cgame-newdraw-oneflagstatus-function-oneflagstatus-state-r-src-mq3-client-cgame-newdraw-ml-306944277"></a>
### oneFlagStatus

```ml
function oneFlagStatus(state, r)
```

Calls `mq3.client.cgame_newdraw.pic` from client game newdraw `oneFlagStatus`. The final path returns `pic(state,r,"flag"+str(index),color)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.gametype`, `state.flagStatus`. |
| `r` | `dynamic` | — | Value used by `return pic(state,r,"flag"+str(index),color)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L821)

<a id="function-function-mq3-client-cgame-newdraw-otherteamhasflag-function-otherteamhasflag-state-src-mq3-client-cgame-newdraw-ml-302077103"></a>
### otherTeamHasFlag

```ml
function otherTeamHasFlag(state)
```

Evaluates client game newdraw `otherTeamHasFlag` and returns `false`, `(state.team==TEAM_RED and state.flagStatus==FLAG_TAKEN_BLUE) or (state.team==TEAM_BLUE and state.flagStatus==FLAG_TAKEN_RED)`, `(state.team==TEAM_RED and state.redflag==FLAG_TAKEN) or (state.team==TEAM_BLUE and state.blueflag==FLAG_TAKEN)` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.gametype`, `state.team`, `state.flagStatus`, `state.redflag` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L851)

<a id="function-function-mq3-client-cgame-newdraw-ownerdraw-function-ownerdraw-state-x-y-w-h-textx-texty-owner-flags-align-special-scale-color-shader-textstyle-src-mq3-client-cgame-newdraw-ml-1167269666"></a>
### ownerDraw

```ml
function ownerDraw(state, x, y, w, h, textX, textY, owner, flags, align, special, scale, color, shader, textStyle)
```

CG_OwnerDraw dispatcher

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.drawStatus`, `state.selected`, `state.sorted`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `ownerDraw`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `ownerDraw`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `ownerDraw`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `ownerDraw`. |
| `textX` | `dynamic` | — | Value used by `if owner==CG_PLAYER_ARMOR_ICON or owner==CG_PLAYER_ARMOR_ICON2D then return drawPlayerArmorIcon(state,r,force2D or owner==CG_PLAYER_ARMOR_ICON...`. |
| `textY` | `dynamic` | — | Value used by `if owner==CG_PLAYER_ARMOR_ICON or owner==CG_PLAYER_ARMOR_ICON2D then return drawPlayerArmorIcon(state,r,force2D or owner==CG_PLAYER_ARMOR_ICON...`. |
| `owner` | `dynamic` | — | Value used by `if owner==CG_PLAYER_ARMOR_ICON or owner==CG_PLAYER_ARMOR_ICON2D then return drawPlayerArmorIcon(state,r,force2D or owner==CG_PLAYER_ARMOR_ICON...`. |
| `flags` | `dynamic` | — | Value used by `force2D=(flags&CG_SHOW_2DONLY)!=0`. |
| `align` | `dynamic` | — | Value used by `if owner==CG_PLAYER_ARMOR_ICON or owner==CG_PLAYER_ARMOR_ICON2D then return drawPlayerArmorIcon(state,r,force2D or owner==CG_PLAYER_ARMOR_ICON...`. |
| `special` | `dynamic` | — | Value used by `if owner==CG_PLAYER_ARMOR_ICON or owner==CG_PLAYER_ARMOR_ICON2D then return drawPlayerArmorIcon(state,r,force2D or owner==CG_PLAYER_ARMOR_ICON...`. |
| `scale` | `dynamic` | — | Value used by `if owner==CG_PLAYER_ARMOR_ICON or owner==CG_PLAYER_ARMOR_ICON2D then return drawPlayerArmorIcon(state,r,force2D or owner==CG_PLAYER_ARMOR_ICON...`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `textStyle` | `dynamic` | — | Accepted for compatibility with `ownerDraw`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L1012)

<a id="function-function-mq3-client-cgame-newdraw-ownerdrawvisible-function-ownerdrawvisible-state-flags-src-mq3-client-cgame-newdraw-ml-1730532358"></a>
### ownerDrawVisible

```ml
function ownerDrawVisible(state, flags)
```

Calls `mq3.client.cgame_newdraw.otherTeamHasFlag`, `mq3.client.cgame_newdraw.yourTeamHasFlag`, `mq3.client.cgame_newdraw.hasPlayerFlag` from client game newdraw `ownerDrawVisible`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.selected`, `state.sorted`, `state.redflag`, `state.flagStatus` and additional values. |
| `flags` | `dynamic` | — | Value used by `if (flags&CG_SHOW_TEAMINFO)!=0 then return state.selected==len(state.sorted) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L861)

<a id="function-function-mq3-client-cgame-newdraw-pic-function-pic-state-r-shader-color-src-mq3-client-cgame-newdraw-ml-1183740117"></a>
### pic

```ml
function pic(state, r, shader, color)
```

Calls `mq3.client.cgame_newdraw.emit` from client game newdraw `pic`. The final path returns `emit(state,"pic",r,"",shader,"",color,0.0,-1)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game newdraw state passed to the helper calls in `pic`. |
| `r` | `dynamic` | — | Value used by `return emit(state,"pic",r,"",shader,"",color,0.0,-1)`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L554)

<a id="function-function-mq3-client-cgame-newdraw-placestring-function-placestring-rank-src-mq3-client-cgame-newdraw-ml-30955856"></a>
### placeString

```ml
function placeString(rank)
```

Evaluates client game newdraw `placeString` and returns `str(rank)+"th"`, `str(rank)+"st"`, `str(rank)+"nd"` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rank` | `dynamic` | — | Value used by `if rank%100>=11 and rank%100<=13 then return str(rank)+"th" end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L925)

<a id="constant-constant-mq3-client-cgame-newdraw-pm-normal-const-pm-normal-0-src-mq3-client-cgame-newdraw-ml-1460058051"></a>
### PM_NORMAL

```ml
const PM_NORMAL = 0
```

Player-movement mode selecting normal input and physics behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L71)

<a id="constant-constant-mq3-client-cgame-newdraw-pm-spectator-const-pm-spectator-2-src-mq3-client-cgame-newdraw-ml-1215657377"></a>
### PM_SPECTATOR

```ml
const PM_SPECTATOR = 2
```

Player-movement mode selecting spectator input and physics behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L73)

- [mq3.client.cgame_newdraw.Powerup](Type-mq3-client-cgame-newdraw-powerup-1112814521.md) — struct
<a id="constant-constant-mq3-client-cgame-newdraw-pw-blueflag-const-pw-blueflag-8-src-mq3-client-cgame-newdraw-ml-1379887995"></a>
### PW_BLUEFLAG

```ml
const PW_BLUEFLAG = 8
```

Player powerup slot for blueflag, also used when constructing active-powerup bitsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L51)

<a id="constant-constant-mq3-client-cgame-newdraw-pw-neutralflag-const-pw-neutralflag-9-src-mq3-client-cgame-newdraw-ml-346868740"></a>
### PW_NEUTRALFLAG

```ml
const PW_NEUTRALFLAG = 9
```

Player powerup slot for neutralflag, also used when constructing active-powerup bitsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L53)

<a id="constant-constant-mq3-client-cgame-newdraw-pw-redflag-const-pw-redflag-7-src-mq3-client-cgame-newdraw-ml-1904482206"></a>
### PW_REDFLAG

```ml
const PW_REDFLAG = 7
```

Player powerup slot for redflag, also used when constructing active-powerup bitsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L49)

<a id="function-function-mq3-client-cgame-newdraw-rect-function-rect-x-y-w-h-src-mq3-client-cgame-newdraw-ml-569523194"></a>
### rect

```ml
function rect(x, y, w, h)
```

Creates a `mq3.client.cgame_newdraw.Rect` record. Assigns `x` from `x`, `y` from `y`, `w` from `w`, `h` from `h`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Value used to initialize `Rect.x`. |
| `y` | `dynamic` | — | Value used to initialize `Rect.y`. |
| `w` | `dynamic` | — | Value used to initialize `Rect.w`. |
| `h` | `dynamic` | — | Value used to initialize `Rect.h`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L525)

- [mq3.client.cgame_newdraw.Rect](Type-mq3-client-cgame-newdraw-rect-1855648725.md) — struct
<a id="function-function-mq3-client-cgame-newdraw-runmenuscript-function-runmenuscript-state-args-src-mq3-client-cgame-newdraw-ml-2098242102"></a>
### runMenuScript

```ml
function runMenuScript(state, args)
```

The original body is empty. Preserve that behavior while making the host boundary deterministic and observable for future menu script extensions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game newdraw state passed to the helper calls in `runMenuScript`. |
| `args` | `dynamic` | — | Value used by `emit(state,"menu-script",Rect(0,0,0,0),args,"","",void,0,-1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L1048)

<a id="constant-constant-mq3-client-cgame-newdraw-score-not-present-const-score-not-present-9999-src-mq3-client-cgame-newdraw-ml-1082692240"></a>
### SCORE_NOT_PRESENT

```ml
const SCORE_NOT_PRESENT = -9999
```

Sentinel score value used when a second score or scoreboard entry is absent.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L85)

<a id="function-function-mq3-client-cgame-newdraw-selectnextplayer-function-selectnextplayer-state-src-mq3-client-cgame-newdraw-ml-1151572059"></a>
### selectNextPlayer

```ml
function selectNextPlayer(state)
```

Updates `state.selected` during client game newdraw `selectNextPlayer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game newdraw record/storage; this routine assigns `state.selected`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L624)

<a id="function-function-mq3-client-cgame-newdraw-selectprevplayer-function-selectprevplayer-state-src-mq3-client-cgame-newdraw-ml-1888395887"></a>
### selectPrevPlayer

```ml
function selectPrevPlayer(state)
```

Updates `state.selected` during client game newdraw `selectPrevPlayer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game newdraw record/storage; this routine assigns `state.selected`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L627)

<a id="function-function-mq3-client-cgame-newdraw-selfclient-function-selfclient-state-src-mq3-client-cgame-newdraw-ml-2058930775"></a>
### selfClient

```ml
function selfClient(state)
```

Evaluates client game newdraw `selfClient` and returns `void`, `state.clients[0]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.clients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L566)

<a id="function-function-mq3-client-cgame-newdraw-setprintstring-function-setprintstring-state-type-value-src-mq3-client-cgame-newdraw-ml-1255936440"></a>
### setPrintString

```ml
function setPrintString(state, type, value)
```

Updates `state.systemChat`, `state.teamChat2`, `state.teamChat1` during client game newdraw `setPrintString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game newdraw record/storage; this routine assigns `state.systemChat`, `state.teamChat2`, `state.teamChat1`. |
| `type` | `dynamic` | — | Value used by `if type==0 then state.systemChat=value else state.teamChat2=state.teamChat1`. |
| `value` | `dynamic` | — | Value assigned to `state.systemChat`, `state.teamChat1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L585)

<a id="function-function-mq3-client-cgame-newdraw-setselectedplayername-function-setselectedplayername-state-src-mq3-client-cgame-newdraw-ml-512423221"></a>
### setSelectedPlayerName

```ml
function setSelectedPlayerName(state)
```

CG_SetSelectedPlayerName

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game newdraw record/storage; this routine assigns `state.selectedName`, `state.selectedClient`, `state.currentOrder`, `state.cvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L616)

<a id="function-function-mq3-client-cgame-newdraw-showresponsehead-function-showresponsehead-state-src-mq3-client-cgame-newdraw-ml-1227504307"></a>
### showResponseHead

```ml
function showResponseHead(state)
```

Updates `state.menus`, `state.cvars`, `state.voiceTime` during client game newdraw `showResponseHead`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game newdraw record/storage; this routine assigns `state.menus`, `state.cvars`, `state.voiceTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L1043)

<a id="function-function-mq3-client-cgame-newdraw-showteammenu-function-showteammenu-state-src-mq3-client-cgame-newdraw-ml-1186749767"></a>
### showTeamMenu

```ml
function showTeamMenu(state)
```

Updates `state.menus` during client game newdraw `showTeamMenu`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game newdraw record/storage; this routine assigns `state.menus`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L1027)

<a id="function-function-mq3-client-cgame-newdraw-sortedpowerups-function-sortedpowerups-state-src-mq3-client-cgame-newdraw-ml-1054733927"></a>
### sortedPowerups

```ml
function sortedPowerups(state)
```

Evaluates client game newdraw `sortedPowerups` and returns `result` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.powerups`, `state.time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L833)

- [mq3.client.cgame_newdraw.State](Type-mq3-client-cgame-newdraw-state-1072933844.md) — struct
<a id="function-function-mq3-client-cgame-newdraw-statushandle-function-statushandle-task-src-mq3-client-cgame-newdraw-ml-1561494177"></a>
### statusHandle

```ml
function statusHandle(task)
```

Evaluates client game newdraw `statusHandle` and returns `"defend"`, `"patrol"`, `"follow"` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `task` | `dynamic` | — | Value used by `if task==TEAMTASK_DEFENSE then return "defend" else if task==TEAMTASK_PATROL then return "patrol" else if task==TEAMTASK_FOLLOW then return "f...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L631)

<a id="function-function-mq3-client-cgame-newdraw-taskvoice-function-taskvoice-task-src-mq3-client-cgame-newdraw-ml-777344703"></a>
### taskVoice

```ml
function taskVoice(task)
```

Evaluates client game newdraw `taskVoice` and returns `["onoffense","offense","+button7; wait; -button7"]`, `["ondefense","defend","+button8; wait; -button8"]`, `["onpatrol","patrol","+button9; wait; -button9"]` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `task` | `dynamic` | — | Value used by `if task==TEAMTASK_OFFENSE then return ["onoffense","offense","+button7`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L589)

<a id="constant-constant-mq3-client-cgame-newdraw-team-blue-const-team-blue-2-src-mq3-client-cgame-newdraw-ml-527067677"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```

Native team identifier for blue, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L15)

<a id="constant-constant-mq3-client-cgame-newdraw-team-free-const-team-free-0-src-mq3-client-cgame-newdraw-ml-1253644787"></a>
### TEAM_FREE

```ml
const TEAM_FREE = 0
```

Native team identifier for free, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L11)

<a id="constant-constant-mq3-client-cgame-newdraw-team-red-const-team-red-1-src-mq3-client-cgame-newdraw-ml-502870256"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```

Native team identifier for red, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L13)

<a id="constant-constant-mq3-client-cgame-newdraw-team-spectator-const-team-spectator-3-src-mq3-client-cgame-newdraw-ml-126745242"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```

Native team identifier for spectator, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L17)

<a id="constant-constant-mq3-client-cgame-newdraw-teamtask-camp-const-teamtask-camp-7-src-mq3-client-cgame-newdraw-ml-780335722"></a>
### TEAMTASK_CAMP

```ml
const TEAMTASK_CAMP = 7
```

Team-order identifier assigning the player the camp tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L69)

<a id="constant-constant-mq3-client-cgame-newdraw-teamtask-defense-const-teamtask-defense-2-src-mq3-client-cgame-newdraw-ml-2031923497"></a>
### TEAMTASK_DEFENSE

```ml
const TEAMTASK_DEFENSE = 2
```

Team-order identifier assigning the player the defense tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L59)

<a id="constant-constant-mq3-client-cgame-newdraw-teamtask-escort-const-teamtask-escort-6-src-mq3-client-cgame-newdraw-ml-403587029"></a>
### TEAMTASK_ESCORT

```ml
const TEAMTASK_ESCORT = 6
```

Team-order identifier assigning the player the escort tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L67)

<a id="constant-constant-mq3-client-cgame-newdraw-teamtask-follow-const-teamtask-follow-4-src-mq3-client-cgame-newdraw-ml-384537391"></a>
### TEAMTASK_FOLLOW

```ml
const TEAMTASK_FOLLOW = 4
```

Team-order identifier assigning the player the follow tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L63)

<a id="constant-constant-mq3-client-cgame-newdraw-teamtask-none-const-teamtask-none-0-src-mq3-client-cgame-newdraw-ml-773939099"></a>
### TEAMTASK_NONE

```ml
const TEAMTASK_NONE = 0
```

Team-order identifier assigning the player the none tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L55)

<a id="constant-constant-mq3-client-cgame-newdraw-teamtask-offense-const-teamtask-offense-1-src-mq3-client-cgame-newdraw-ml-929811200"></a>
### TEAMTASK_OFFENSE

```ml
const TEAMTASK_OFFENSE = 1
```

Team-order identifier assigning the player the offense tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L57)

<a id="constant-constant-mq3-client-cgame-newdraw-teamtask-patrol-const-teamtask-patrol-3-src-mq3-client-cgame-newdraw-ml-1513598534"></a>
### TEAMTASK_PATROL

```ml
const TEAMTASK_PATROL = 3
```

Team-order identifier assigning the player the patrol tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L61)

<a id="constant-constant-mq3-client-cgame-newdraw-teamtask-retrieve-const-teamtask-retrieve-5-src-mq3-client-cgame-newdraw-ml-490198448"></a>
### TEAMTASK_RETRIEVE

```ml
const TEAMTASK_RETRIEVE = 5
```

Team-order identifier assigning the player the retrieve tactical role.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L65)

<a id="function-function-mq3-client-cgame-newdraw-text-function-text-state-r-value-scale-color-src-mq3-client-cgame-newdraw-ml-1028638253"></a>
### text

```ml
function text(state, r, value, scale, color)
```

Adapts `mq3.client.cgame_newdraw.emit` to client game newdraw `text`, returning its result for `state, "text", r, value, "", "", color, scale, -1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_newdraw.emit`. |
| `r` | `dynamic` | — | Argument 3 of `mq3.client.cgame_newdraw.emit`. |
| `value` | `dynamic` | — | Argument 4 of `mq3.client.cgame_newdraw.emit`. |
| `scale` | `dynamic` | — | Argument 8 of `mq3.client.cgame_newdraw.emit`. |
| `color` | `dynamic` | — | Argument 7 of `mq3.client.cgame_newdraw.emit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L548)

<a id="function-function-mq3-client-cgame-newdraw-textpaintlimit-function-textpaintlimit-state-maxx-x-y-scale-color-value-adjust-limit-src-mq3-client-cgame-newdraw-ml-108963180"></a>
### textPaintLimit

```ml
function textPaintLimit(state, maxX, x, y, scale, color, value, adjust, limit)
```

CG_Text_Paint_Limit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.glyphWidth`. |
| `maxX` | `dynamic` | — | Value used by `if value==void then return [maxX,""] end if`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `textPaintLimit`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `textPaintLimit`. |
| `scale` | `dynamic` | — | Value used by `while at<len(value) and count<maximum if at+1<len(value) and value[at]=="^" and value[at+1]!="^" then at=at+2 else width=state.glyphWidth*scale`. |
| `color` | `dynamic` | — | Color value used by the client game newdraw drawing or interpolation operation. |
| `value` | `dynamic` | — | Sequence read at `value[at]`, `value[at+1]`. |
| `adjust` | `dynamic` | — | Value used by `cursor=cursor+width+adjust`. |
| `limit` | `dynamic` | — | Upper limit applied while collecting or rendering the result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L957)

<a id="function-function-mq3-client-cgame-newdraw-two-function-two-value-src-mq3-client-cgame-newdraw-ml-1122284819"></a>
### two

```ml
function two(value)
```

Evaluates client game newdraw `two` and returns `" "+str(value)`, `str(value)` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value>=0 and value<10` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L576)

<a id="function-function-mq3-client-cgame-newdraw-voiceclient-function-voiceclient-state-src-mq3-client-cgame-newdraw-ml-1672219409"></a>
### voiceClient

```ml
function voiceClient(state)
```

Evaluates client game newdraw `voiceClient` and returns `void`, `state.clients[state.voiceClient]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.voiceClient`, `state.clients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L569)

<a id="function-function-mq3-client-cgame-newdraw-yourteamhasflag-function-yourteamhasflag-state-src-mq3-client-cgame-newdraw-ml-699853543"></a>
### yourTeamHasFlag

```ml
function yourTeamHasFlag(state)
```

Evaluates client game newdraw `yourTeamHasFlag` and returns `false`, `(state.team==TEAM_RED and state.flagStatus==FLAG_TAKEN_RED) or (state.team==TEAM_BLUE and state.flagStatus==FLAG_TAKEN_BLUE)`, `(state.team==TEAM_RED and state.blueflag==FLAG_TAKEN) or (state.team==TEAM_BLUE and state.redflag==FLAG_TAKEN)` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.gametype`, `state.team`, `state.flagStatus`, `state.blueflag` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L854)
