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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L124)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-2ndplace-const-cg-2ndplace-68-src-mq3-client-cgame-newdraw-ml-1892332247"></a>
### CG_2NDPLACE

```ml
const CG_2NDPLACE = 68
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L125)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-accuracy-const-cg-accuracy-53-src-mq3-client-cgame-newdraw-ml-245131137"></a>
### CG_ACCURACY

```ml
const CG_ACCURACY = 53
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L110)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-area-chat-const-cg-area-chat-48-src-mq3-client-cgame-newdraw-ml-1311935249"></a>
### CG_AREA_CHAT

```ml
const CG_AREA_CHAT = 48
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L105)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-area-powerup-const-cg-area-powerup-36-src-mq3-client-cgame-newdraw-ml-2107828324"></a>
### CG_AREA_POWERUP

```ml
const CG_AREA_POWERUP = 36
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L97)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-area-systemchat-const-cg-area-systemchat-46-src-mq3-client-cgame-newdraw-ml-1113537065"></a>
### CG_AREA_SYSTEMCHAT

```ml
const CG_AREA_SYSTEMCHAT = 46
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L103)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-area-teamchat-const-cg-area-teamchat-47-src-mq3-client-cgame-newdraw-ml-870006410"></a>
### CG_AREA_TEAMCHAT

```ml
const CG_AREA_TEAMCHAT = 47
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L104)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-assists-const-cg-assists-54-src-mq3-client-cgame-newdraw-ml-1421049508"></a>
### CG_ASSISTS

```ml
const CG_ASSISTS = 54
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L111)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-blue-flaghead-const-cg-blue-flaghead-21-src-mq3-client-cgame-newdraw-ml-373739974"></a>
### CG_BLUE_FLAGHEAD

```ml
const CG_BLUE_FLAGHEAD = 21
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L82)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-blue-flagname-const-cg-blue-flagname-23-src-mq3-client-cgame-newdraw-ml-58450126"></a>
### CG_BLUE_FLAGNAME

```ml
const CG_BLUE_FLAGNAME = 23
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L84)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-blue-flagstatus-const-cg-blue-flagstatus-22-src-mq3-client-cgame-newdraw-ml-79934507"></a>
### CG_BLUE_FLAGSTATUS

```ml
const CG_BLUE_FLAGSTATUS = 22
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L83)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-blue-name-const-cg-blue-name-30-src-mq3-client-cgame-newdraw-ml-1135121614"></a>
### CG_BLUE_NAME

```ml
const CG_BLUE_NAME = 30
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L91)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-blue-score-const-cg-blue-score-27-src-mq3-client-cgame-newdraw-ml-390032374"></a>
### CG_BLUE_SCORE

```ml
const CG_BLUE_SCORE = 27
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L88)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-capfraglimit-const-cg-capfraglimit-66-src-mq3-client-cgame-newdraw-ml-1041077765"></a>
### CG_CAPFRAGLIMIT

```ml
const CG_CAPFRAGLIMIT = 66
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L123)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-captures-const-cg-captures-69-src-mq3-client-cgame-newdraw-ml-1015330580"></a>
### CG_CAPTURES

```ml
const CG_CAPTURES = 69
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L126)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-ctf-powerup-const-cg-ctf-powerup-35-src-mq3-client-cgame-newdraw-ml-1486139089"></a>
### CG_CTF_POWERUP

```ml
const CG_CTF_POWERUP = 35
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L96)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-defend-const-cg-defend-55-src-mq3-client-cgame-newdraw-ml-1184396967"></a>
### CG_DEFEND

```ml
const CG_DEFEND = 55
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L112)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-excellent-const-cg-excellent-56-src-mq3-client-cgame-newdraw-ml-172080762"></a>
### CG_EXCELLENT

```ml
const CG_EXCELLENT = 56
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L113)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-game-status-const-cg-game-status-49-src-mq3-client-cgame-newdraw-ml-990480836"></a>
### CG_GAME_STATUS

```ml
const CG_GAME_STATUS = 49
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L106)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-game-type-const-cg-game-type-39-src-mq3-client-cgame-newdraw-ml-2134108279"></a>
### CG_GAME_TYPE

```ml
const CG_GAME_TYPE = 39
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L99)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-gauntlet-const-cg-gauntlet-59-src-mq3-client-cgame-newdraw-ml-384829375"></a>
### CG_GAUNTLET

```ml
const CG_GAUNTLET = 59
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L116)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-harvester-skulls-const-cg-harvester-skulls-31-src-mq3-client-cgame-newdraw-ml-1751535873"></a>
### CG_HARVESTER_SKULLS

```ml
const CG_HARVESTER_SKULLS = 31
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L92)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-harvester-skulls2d-const-cg-harvester-skulls2d-65-src-mq3-client-cgame-newdraw-ml-1290662748"></a>
### CG_HARVESTER_SKULLS2D

```ml
const CG_HARVESTER_SKULLS2D = 65
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L122)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-impressive-const-cg-impressive-57-src-mq3-client-cgame-newdraw-ml-1181394745"></a>
### CG_IMPRESSIVE

```ml
const CG_IMPRESSIVE = 57
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L114)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-killer-const-cg-killer-50-src-mq3-client-cgame-newdraw-ml-766964900"></a>
### CG_KILLER

```ml
const CG_KILLER = 50
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L107)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-oneflag-status-const-cg-oneflag-status-32-src-mq3-client-cgame-newdraw-ml-1460842504"></a>
### CG_ONEFLAG_STATUS

```ml
const CG_ONEFLAG_STATUS = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L93)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-perfect-const-cg-perfect-58-src-mq3-client-cgame-newdraw-ml-1913248290"></a>
### CG_PERFECT

```ml
const CG_PERFECT = 58
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L115)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-ammo-icon-const-cg-player-ammo-icon-5-src-mq3-client-cgame-newdraw-ml-393567152"></a>
### CG_PLAYER_AMMO_ICON

```ml
const CG_PLAYER_AMMO_ICON = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L72)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-ammo-icon2d-const-cg-player-ammo-icon2d-52-src-mq3-client-cgame-newdraw-ml-1850942662"></a>
### CG_PLAYER_AMMO_ICON2D

```ml
const CG_PLAYER_AMMO_ICON2D = 52
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L109)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-ammo-value-const-cg-player-ammo-value-6-src-mq3-client-cgame-newdraw-ml-400911861"></a>
### CG_PLAYER_AMMO_VALUE

```ml
const CG_PLAYER_AMMO_VALUE = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L73)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-armor-icon-const-cg-player-armor-icon-1-src-mq3-client-cgame-newdraw-ml-2131072038"></a>
### CG_PLAYER_ARMOR_ICON

```ml
const CG_PLAYER_ARMOR_ICON = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L68)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-armor-icon2d-const-cg-player-armor-icon2d-51-src-mq3-client-cgame-newdraw-ml-1932057265"></a>
### CG_PLAYER_ARMOR_ICON2D

```ml
const CG_PLAYER_ARMOR_ICON2D = 51
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L108)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-armor-value-const-cg-player-armor-value-2-src-mq3-client-cgame-newdraw-ml-1864142769"></a>
### CG_PLAYER_ARMOR_VALUE

```ml
const CG_PLAYER_ARMOR_VALUE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L69)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-hasflag-const-cg-player-hasflag-38-src-mq3-client-cgame-newdraw-ml-2048416230"></a>
### CG_PLAYER_HASFLAG

```ml
const CG_PLAYER_HASFLAG = 38
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L98)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-hasflag2d-const-cg-player-hasflag2d-64-src-mq3-client-cgame-newdraw-ml-981734051"></a>
### CG_PLAYER_HASFLAG2D

```ml
const CG_PLAYER_HASFLAG2D = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L121)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-head-const-cg-player-head-3-src-mq3-client-cgame-newdraw-ml-2111541618"></a>
### CG_PLAYER_HEAD

```ml
const CG_PLAYER_HEAD = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L70)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-health-const-cg-player-health-4-src-mq3-client-cgame-newdraw-ml-1917891199"></a>
### CG_PLAYER_HEALTH

```ml
const CG_PLAYER_HEALTH = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L71)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-item-const-cg-player-item-19-src-mq3-client-cgame-newdraw-ml-714131025"></a>
### CG_PLAYER_ITEM

```ml
const CG_PLAYER_ITEM = 19
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L80)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-location-const-cg-player-location-33-src-mq3-client-cgame-newdraw-ml-1482062501"></a>
### CG_PLAYER_LOCATION

```ml
const CG_PLAYER_LOCATION = 33
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L94)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-score-const-cg-player-score-20-src-mq3-client-cgame-newdraw-ml-1831186791"></a>
### CG_PLAYER_SCORE

```ml
const CG_PLAYER_SCORE = 20
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L81)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-player-status-const-cg-player-status-42-src-mq3-client-cgame-newdraw-ml-899248727"></a>
### CG_PLAYER_STATUS

```ml
const CG_PLAYER_STATUS = 42
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L102)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-red-flaghead-const-cg-red-flaghead-24-src-mq3-client-cgame-newdraw-ml-2013782995"></a>
### CG_RED_FLAGHEAD

```ml
const CG_RED_FLAGHEAD = 24
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L85)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-red-flagname-const-cg-red-flagname-26-src-mq3-client-cgame-newdraw-ml-2085814141"></a>
### CG_RED_FLAGNAME

```ml
const CG_RED_FLAGNAME = 26
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L87)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-red-flagstatus-const-cg-red-flagstatus-25-src-mq3-client-cgame-newdraw-ml-337847612"></a>
### CG_RED_FLAGSTATUS

```ml
const CG_RED_FLAGSTATUS = 25
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L86)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-red-name-const-cg-red-name-29-src-mq3-client-cgame-newdraw-ml-649274388"></a>
### CG_RED_NAME

```ml
const CG_RED_NAME = 29
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L90)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-red-score-const-cg-red-score-28-src-mq3-client-cgame-newdraw-ml-2146362963"></a>
### CG_RED_SCORE

```ml
const CG_RED_SCORE = 28
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L89)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-selectedplayer-armor-const-cg-selectedplayer-armor-40-src-mq3-client-cgame-newdraw-ml-1945960293"></a>
### CG_SELECTEDPLAYER_ARMOR

```ml
const CG_SELECTEDPLAYER_ARMOR = 40
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L100)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-selectedplayer-head-const-cg-selectedplayer-head-7-src-mq3-client-cgame-newdraw-ml-1683044112"></a>
### CG_SELECTEDPLAYER_HEAD

```ml
const CG_SELECTEDPLAYER_HEAD = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L74)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-selectedplayer-health-const-cg-selectedplayer-health-41-src-mq3-client-cgame-newdraw-ml-1529797360"></a>
### CG_SELECTEDPLAYER_HEALTH

```ml
const CG_SELECTEDPLAYER_HEALTH = 41
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L101)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-selectedplayer-location-const-cg-selectedplayer-location-9-src-mq3-client-cgame-newdraw-ml-1107624732"></a>
### CG_SELECTEDPLAYER_LOCATION

```ml
const CG_SELECTEDPLAYER_LOCATION = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L76)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-selectedplayer-name-const-cg-selectedplayer-name-8-src-mq3-client-cgame-newdraw-ml-1851905267"></a>
### CG_SELECTEDPLAYER_NAME

```ml
const CG_SELECTEDPLAYER_NAME = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L75)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-selectedplayer-powerup-const-cg-selectedplayer-powerup-12-src-mq3-client-cgame-newdraw-ml-1176778530"></a>
### CG_SELECTEDPLAYER_POWERUP

```ml
const CG_SELECTEDPLAYER_POWERUP = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L79)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-selectedplayer-status-const-cg-selectedplayer-status-10-src-mq3-client-cgame-newdraw-ml-2090339818"></a>
### CG_SELECTEDPLAYER_STATUS

```ml
const CG_SELECTEDPLAYER_STATUS = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L77)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-selectedplayer-weapon-const-cg-selectedplayer-weapon-11-src-mq3-client-cgame-newdraw-ml-812532505"></a>
### CG_SELECTEDPLAYER_WEAPON

```ml
const CG_SELECTEDPLAYER_WEAPON = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L78)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-2donly-const-cg-show-2donly-268435456-src-mq3-client-cgame-newdraw-ml-1829335540"></a>
### CG_SHOW_2DONLY

```ml
const CG_SHOW_2DONLY = 268435456
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L66)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-anynonteamgame-const-cg-show-anynonteamgame-524288-src-mq3-client-cgame-newdraw-ml-244691696"></a>
### CG_SHOW_ANYNONTEAMGAME

```ml
const CG_SHOW_ANYNONTEAMGAME = 524288
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L65)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-anyteamgame-const-cg-show-anyteamgame-4-src-mq3-client-cgame-newdraw-ml-1383359195"></a>
### CG_SHOW_ANYTEAMGAME

```ml
const CG_SHOW_ANYTEAMGAME = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L50)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-blue-team-has-redflag-const-cg-show-blue-team-has-redflag-1-src-mq3-client-cgame-newdraw-ml-1967148084"></a>
### CG_SHOW_BLUE_TEAM_HAS_REDFLAG

```ml
const CG_SHOW_BLUE_TEAM_HAS_REDFLAG = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L48)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-ctf-const-cg-show-ctf-32-src-mq3-client-cgame-newdraw-ml-682050524"></a>
### CG_SHOW_CTF

```ml
const CG_SHOW_CTF = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L53)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-duringincomingvoice-const-cg-show-duringincomingvoice-1024-src-mq3-client-cgame-newdraw-ml-280337878"></a>
### CG_SHOW_DURINGINCOMINGVOICE

```ml
const CG_SHOW_DURINGINCOMINGVOICE = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L58)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-harvester-const-cg-show-harvester-8-src-mq3-client-cgame-newdraw-ml-63478135"></a>
### CG_SHOW_HARVESTER

```ml
const CG_SHOW_HARVESTER = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L51)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-healthcritical-const-cg-show-healthcritical-128-src-mq3-client-cgame-newdraw-ml-1398801000"></a>
### CG_SHOW_HEALTHCRITICAL

```ml
const CG_SHOW_HEALTHCRITICAL = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L55)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-healthok-const-cg-show-healthok-16384-src-mq3-client-cgame-newdraw-ml-747689999"></a>
### CG_SHOW_HEALTHOK

```ml
const CG_SHOW_HEALTHOK = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L60)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-if-player-has-flag-const-cg-show-if-player-has-flag-2048-src-mq3-client-cgame-newdraw-ml-1650503765"></a>
### CG_SHOW_IF_PLAYER_HAS_FLAG

```ml
const CG_SHOW_IF_PLAYER_HAS_FLAG = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L59)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-noteaminfo-const-cg-show-noteaminfo-65536-src-mq3-client-cgame-newdraw-ml-1857222102"></a>
### CG_SHOW_NOTEAMINFO

```ml
const CG_SHOW_NOTEAMINFO = 65536
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L62)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-obelisk-const-cg-show-obelisk-64-src-mq3-client-cgame-newdraw-ml-1439946927"></a>
### CG_SHOW_OBELISK

```ml
const CG_SHOW_OBELISK = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L54)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-oneflag-const-cg-show-oneflag-16-src-mq3-client-cgame-newdraw-ml-1866309098"></a>
### CG_SHOW_ONEFLAG

```ml
const CG_SHOW_ONEFLAG = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L52)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-otherteamhasflag-const-cg-show-otherteamhasflag-131072-src-mq3-client-cgame-newdraw-ml-891587403"></a>
### CG_SHOW_OTHERTEAMHASFLAG

```ml
const CG_SHOW_OTHERTEAMHASFLAG = 131072
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L63)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-red-team-has-blueflag-const-cg-show-red-team-has-blueflag-2-src-mq3-client-cgame-newdraw-ml-1753810133"></a>
### CG_SHOW_RED_TEAM_HAS_BLUEFLAG

```ml
const CG_SHOW_RED_TEAM_HAS_BLUEFLAG = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L49)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-singleplayer-const-cg-show-singleplayer-256-src-mq3-client-cgame-newdraw-ml-615988864"></a>
### CG_SHOW_SINGLEPLAYER

```ml
const CG_SHOW_SINGLEPLAYER = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L56)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-teaminfo-const-cg-show-teaminfo-32768-src-mq3-client-cgame-newdraw-ml-174496653"></a>
### CG_SHOW_TEAMINFO

```ml
const CG_SHOW_TEAMINFO = 32768
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L61)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-tournament-const-cg-show-tournament-512-src-mq3-client-cgame-newdraw-ml-982924445"></a>
### CG_SHOW_TOURNAMENT

```ml
const CG_SHOW_TOURNAMENT = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L57)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-show-yourteamhasenemyflag-const-cg-show-yourteamhasenemyflag-262144-src-mq3-client-cgame-newdraw-ml-1667313504"></a>
### CG_SHOW_YOURTEAMHASENEMYFLAG

```ml
const CG_SHOW_YOURTEAMHASENEMYFLAG = 262144
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L64)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-spectators-const-cg-spectators-60-src-mq3-client-cgame-newdraw-ml-1987207823"></a>
### CG_SPECTATORS

```ml
const CG_SPECTATORS = 60
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L117)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-team-color-const-cg-team-color-34-src-mq3-client-cgame-newdraw-ml-1501787186"></a>
### CG_TEAM_COLOR

```ml
const CG_TEAM_COLOR = 34
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L95)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-teaminfo-const-cg-teaminfo-61-src-mq3-client-cgame-newdraw-ml-1064039952"></a>
### CG_TEAMINFO

```ml
const CG_TEAMINFO = 61
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L118)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-voice-head-const-cg-voice-head-62-src-mq3-client-cgame-newdraw-ml-1912188241"></a>
### CG_VOICE_HEAD

```ml
const CG_VOICE_HEAD = 62
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L119)

<a id="constant-constant-mq3-client-cgame-newdraw-cg-voice-name-const-cg-voice-name-63-src-mq3-client-cgame-newdraw-ml-1144618254"></a>
### CG_VOICE_NAME

```ml
const CG_VOICE_NAME = 63
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L120)

<a id="constant-constant-mq3-client-cgame-newdraw-cgame-event-edithud-const-cgame-event-edithud-3-src-mq3-client-cgame-newdraw-ml-510808230"></a>
### CGAME_EVENT_EDITHUD

```ml
const CGAME_EVENT_EDITHUD = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L43)

<a id="constant-constant-mq3-client-cgame-newdraw-cgame-event-none-const-cgame-event-none-0-src-mq3-client-cgame-newdraw-ml-2146325619"></a>
### CGAME_EVENT_NONE

```ml
const CGAME_EVENT_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L40)

<a id="constant-constant-mq3-client-cgame-newdraw-cgame-event-scoreboard-const-cgame-event-scoreboard-2-src-mq3-client-cgame-newdraw-ml-1833338985"></a>
### CGAME_EVENT_SCOREBOARD

```ml
const CGAME_EVENT_SCOREBOARD = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L42)

<a id="constant-constant-mq3-client-cgame-newdraw-cgame-event-teammenu-const-cgame-event-teammenu-1-src-mq3-client-cgame-newdraw-ml-1483420036"></a>
### CGAME_EVENT_TEAMMENU

```ml
const CGAME_EVENT_TEAMMENU = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L41)

<a id="function-function-mq3-client-cgame-newdraw-checkorderpending-function-checkorderpending-state-src-mq3-client-cgame-newdraw-ml-1079004801"></a>
### checkOrderPending

```ml
function checkOrderPending(state)
```

CG_CheckOrderPending

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L169)

<a id="function-function-mq3-client-cgame-newdraw-client-function-client-name-team-src-mq3-client-cgame-newdraw-ml-1620631044"></a>
### client

```ml
function client(name, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L135)

- [mq3.client.cgame_newdraw.Client](Type-mq3-client-cgame-newdraw-client-464952916.md) — struct
<a id="function-function-mq3-client-cgame-newdraw-clientnumfromname-function-clientnumfromname-state-name-src-mq3-client-cgame-newdraw-ml-1195909910"></a>
### clientNumFromName

```ml
function clientNumFromName(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L285)

<a id="function-function-mq3-client-cgame-newdraw-copycolor-function-copycolor-value-src-mq3-client-cgame-newdraw-ml-445659339"></a>
### copyColor

```ml
function copyColor(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L141)

<a id="function-function-mq3-client-cgame-newdraw-create-function-create-retailactive-src-mq3-client-cgame-newdraw-ml-1466001961"></a>
### create

```ml
function create(retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L137)

<a id="function-function-mq3-client-cgame-newdraw-currentclient-function-currentclient-state-src-mq3-client-cgame-newdraw-ml-668591159"></a>
### currentClient

```ml
function currentClient(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L148)

<a id="function-function-mq3-client-cgame-newdraw-draw1stplace-function-draw1stplace-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1982436737"></a>
### draw1stPlace

```ml
function draw1stPlace(state, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L250)

<a id="function-function-mq3-client-cgame-newdraw-draw2ndplace-function-draw2ndplace-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1397921761"></a>
### draw2ndPlace

```ml
function draw2ndPlace(state, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L251)

<a id="function-function-mq3-client-cgame-newdraw-drawareachat-function-drawareachat-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1113261209"></a>
### drawAreaChat

```ml
function drawAreaChat(state, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L246)

<a id="function-function-mq3-client-cgame-newdraw-drawareapowerup-function-drawareapowerup-state-r-align-special-scale-color-src-mq3-client-cgame-newdraw-ml-1280663568"></a>
### drawAreaPowerUp

```ml
function drawAreaPowerUp(state, r, align, special, scale, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `align` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L229)

<a id="function-function-mq3-client-cgame-newdraw-drawareasystemchat-function-drawareasystemchat-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1528088533"></a>
### drawAreaSystemChat

```ml
function drawAreaSystemChat(state, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L244)

<a id="function-function-mq3-client-cgame-newdraw-drawareateamchat-function-drawareateamchat-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1423931509"></a>
### drawAreaTeamChat

```ml
function drawAreaTeamChat(state, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L245)

<a id="function-function-mq3-client-cgame-newdraw-drawblueflaghead-function-drawblueflaghead-state-r-src-mq3-client-cgame-newdraw-ml-529577341"></a>
### drawBlueFlagHead

```ml
function drawBlueFlagHead(state, r)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L222)

<a id="function-function-mq3-client-cgame-newdraw-drawblueflagname-function-drawblueflagname-state-r-scale-color-src-mq3-client-cgame-newdraw-ml-1589028674"></a>
### drawBlueFlagName

```ml
function drawBlueFlagName(state, r, scale, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L218)

<a id="function-function-mq3-client-cgame-newdraw-drawblueflagstatus-function-drawblueflagstatus-state-r-shader-src-mq3-client-cgame-newdraw-ml-662579282"></a>
### drawBlueFlagStatus

```ml
function drawBlueFlagStatus(state, r, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L220)

<a id="function-function-mq3-client-cgame-newdraw-drawbluename-function-drawbluename-state-r-scale-color-src-mq3-client-cgame-newdraw-ml-105780598"></a>
### drawBlueName

```ml
function drawBlueName(state, r, scale, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L216)

<a id="function-function-mq3-client-cgame-newdraw-drawbluescore-function-drawbluescore-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1659785505"></a>
### drawBlueScore

```ml
function drawBlueScore(state, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L214)

<a id="function-function-mq3-client-cgame-newdraw-drawcapfraglimit-function-drawcapfraglimit-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-222064961"></a>
### drawCapFragLimit

```ml
function drawCapFragLimit(state, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L249)

<a id="function-function-mq3-client-cgame-newdraw-drawctfpowerup-function-drawctfpowerup-state-r-src-mq3-client-cgame-newdraw-ml-579631205"></a>
### drawCTFPowerUp

```ml
function drawCTFPowerUp(state, r)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L226)

<a id="function-function-mq3-client-cgame-newdraw-drawgamestatus-function-drawgamestatus-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1382672601"></a>
### drawGameStatus

```ml
function drawGameStatus(state, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L254)

<a id="function-function-mq3-client-cgame-newdraw-drawgametype-function-drawgametype-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1898628689"></a>
### drawGameType

```ml
function drawGameType(state, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L256)

<a id="function-function-mq3-client-cgame-newdraw-drawkiller-function-drawkiller-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-2039572993"></a>
### drawKiller

```ml
function drawKiller(state, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L248)

<a id="function-function-mq3-client-cgame-newdraw-drawmedal-function-drawmedal-state-ownerdraw-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1880028202"></a>
### drawMedal

```ml
function drawMedal(state, ownerDraw, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ownerDraw` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L272)

<a id="function-function-mq3-client-cgame-newdraw-drawnewteaminfo-function-drawnewteaminfo-state-r-textx-texty-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1806598868"></a>
### drawNewTeamInfo

```ml
function drawNewTeamInfo(state, r, textX, textY, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `textX` | `dynamic` | — |  |
| `textY` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L264)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerammoicon-function-drawplayerammoicon-state-r-draw2d-src-mq3-client-cgame-newdraw-ml-699771169"></a>
### drawPlayerAmmoIcon

```ml
function drawPlayerAmmoIcon(state, r, draw2D)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `draw2D` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L196)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerammovalue-function-drawplayerammovalue-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-168424981"></a>
### drawPlayerAmmoValue

```ml
function drawPlayerAmmoValue(state, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L197)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerarmoricon-function-drawplayerarmoricon-state-r-draw2d-src-mq3-client-cgame-newdraw-ml-282633367"></a>
### drawPlayerArmorIcon

```ml
function drawPlayerArmorIcon(state, r, draw2D)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `draw2D` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L194)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerarmorvalue-function-drawplayerarmorvalue-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1271604217"></a>
### drawPlayerArmorValue

```ml
function drawPlayerArmorValue(state, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L195)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerhasflag-function-drawplayerhasflag-state-r-force2d-src-mq3-client-cgame-newdraw-ml-2092263056"></a>
### drawPlayerHasFlag

```ml
function drawPlayerHasFlag(state, r, force2D)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `force2D` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L243)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerhead-function-drawplayerhead-state-r-draw2d-src-mq3-client-cgame-newdraw-ml-978080337"></a>
### drawPlayerHead

```ml
function drawPlayerHead(state, r, draw2D)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `draw2D` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L198)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerhealth-function-drawplayerhealth-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1601082665"></a>
### drawPlayerHealth

```ml
function drawPlayerHealth(state, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L212)

<a id="function-function-mq3-client-cgame-newdraw-drawplayeritem-function-drawplayeritem-state-r-scale-draw2d-src-mq3-client-cgame-newdraw-ml-9967851"></a>
### drawPlayerItem

```ml
function drawPlayerItem(state, r, scale, draw2D)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `draw2D` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L208)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerlocation-function-drawplayerlocation-state-r-scale-color-src-mq3-client-cgame-newdraw-ml-1891435162"></a>
### drawPlayerLocation

```ml
function drawPlayerLocation(state, r, scale, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L205)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerscore-function-drawplayerscore-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1619519839"></a>
### drawPlayerScore

```ml
function drawPlayerScore(state, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L207)

<a id="function-function-mq3-client-cgame-newdraw-drawplayerstatus-function-drawplayerstatus-state-r-src-mq3-client-cgame-newdraw-ml-1789393081"></a>
### drawPlayerStatus

```ml
function drawPlayerStatus(state, r)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L202)

<a id="function-function-mq3-client-cgame-newdraw-drawredflaghead-function-drawredflaghead-state-r-src-mq3-client-cgame-newdraw-ml-603745787"></a>
### drawRedFlagHead

```ml
function drawRedFlagHead(state, r)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L223)

<a id="function-function-mq3-client-cgame-newdraw-drawredflagname-function-drawredflagname-state-r-scale-color-src-mq3-client-cgame-newdraw-ml-1478096306"></a>
### drawRedFlagName

```ml
function drawRedFlagName(state, r, scale, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L219)

<a id="function-function-mq3-client-cgame-newdraw-drawredflagstatus-function-drawredflagstatus-state-r-shader-src-mq3-client-cgame-newdraw-ml-1643796404"></a>
### drawRedFlagStatus

```ml
function drawRedFlagStatus(state, r, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L221)

<a id="function-function-mq3-client-cgame-newdraw-drawredname-function-drawredname-state-r-scale-color-src-mq3-client-cgame-newdraw-ml-1113209266"></a>
### drawRedName

```ml
function drawRedName(state, r, scale, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L215)

<a id="function-function-mq3-client-cgame-newdraw-drawredscore-function-drawredscore-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-716289293"></a>
### drawRedScore

```ml
function drawRedScore(state, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L213)

<a id="function-function-mq3-client-cgame-newdraw-drawselectedplayerarmor-function-drawselectedplayerarmor-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-222087179"></a>
### drawSelectedPlayerArmor

```ml
function drawSelectedPlayerArmor(state, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L200)

<a id="function-function-mq3-client-cgame-newdraw-drawselectedplayerhead-function-drawselectedplayerhead-state-r-draw2d-voice-src-mq3-client-cgame-newdraw-ml-620219451"></a>
### drawSelectedPlayerHead

```ml
function drawSelectedPlayerHead(state, r, draw2D, voice)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `draw2D` | `dynamic` | — |  |
| `voice` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L211)

<a id="function-function-mq3-client-cgame-newdraw-drawselectedplayerhealth-function-drawselectedplayerhealth-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-1443506201"></a>
### drawSelectedPlayerHealth

```ml
function drawSelectedPlayerHealth(state, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L199)

<a id="function-function-mq3-client-cgame-newdraw-drawselectedplayerlocation-function-drawselectedplayerlocation-state-r-scale-color-src-mq3-client-cgame-newdraw-ml-1253835474"></a>
### drawSelectedPlayerLocation

```ml
function drawSelectedPlayerLocation(state, r, scale, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L204)

<a id="function-function-mq3-client-cgame-newdraw-drawselectedplayername-function-drawselectedplayername-state-r-scale-color-voice-src-mq3-client-cgame-newdraw-ml-774211362"></a>
### drawSelectedPlayerName

```ml
function drawSelectedPlayerName(state, r, scale, color, voice)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `voice` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L203)

<a id="function-function-mq3-client-cgame-newdraw-drawselectedplayerpowerup-function-drawselectedplayerpowerup-state-r-draw2d-src-mq3-client-cgame-newdraw-ml-2028855857"></a>
### drawSelectedPlayerPowerup

```ml
function drawSelectedPlayerPowerup(state, r, draw2D)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `draw2D` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L210)

<a id="function-function-mq3-client-cgame-newdraw-drawselectedplayerstatus-function-drawselectedplayerstatus-state-r-src-mq3-client-cgame-newdraw-ml-773378645"></a>
### drawSelectedPlayerStatus

```ml
function drawSelectedPlayerStatus(state, r)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L201)

<a id="function-function-mq3-client-cgame-newdraw-drawselectedplayerweapon-function-drawselectedplayerweapon-state-r-src-mq3-client-cgame-newdraw-ml-430085661"></a>
### drawSelectedPlayerWeapon

```ml
function drawSelectedPlayerWeapon(state, r)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L206)

<a id="function-function-mq3-client-cgame-newdraw-drawteamcolor-function-drawteamcolor-state-r-color-src-mq3-client-cgame-newdraw-ml-657079488"></a>
### drawTeamColor

```ml
function drawTeamColor(state, r, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L227)

<a id="function-function-mq3-client-cgame-newdraw-drawteamspectators-function-drawteamspectators-state-r-scale-color-shader-src-mq3-client-cgame-newdraw-ml-719341377"></a>
### drawTeamSpectators

```ml
function drawTeamSpectators(state, r, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L267)

<a id="function-function-mq3-client-cgame-newdraw-emit-function-emit-state-kind-r-text-shader-model-color-value-clientnum-src-mq3-client-cgame-newdraw-ml-683034227"></a>
### emit

```ml
function emit(state, kind, r, text, shader, model, color, value, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L142)

<a id="function-function-mq3-client-cgame-newdraw-eventhandling-function-eventhandling-state-type-src-mq3-client-cgame-newdraw-ml-1585594381"></a>
### eventHandling

```ml
function eventHandling(state, type)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L283)

<a id="function-function-mq3-client-cgame-newdraw-firstpowerup-function-firstpowerup-bits-src-mq3-client-cgame-newdraw-ml-1533023382"></a>
### firstPowerup

```ml
function firstPowerup(bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L209)

<a id="constant-constant-mq3-client-cgame-newdraw-flag-atbase-const-flag-atbase-0-src-mq3-client-cgame-newdraw-ml-1760103647"></a>
### FLAG_ATBASE

```ml
const FLAG_ATBASE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L22)

<a id="constant-constant-mq3-client-cgame-newdraw-flag-dropped-const-flag-dropped-2-src-mq3-client-cgame-newdraw-ml-1114840801"></a>
### FLAG_DROPPED

```ml
const FLAG_DROPPED = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L24)

<a id="constant-constant-mq3-client-cgame-newdraw-flag-taken-const-flag-taken-1-src-mq3-client-cgame-newdraw-ml-1559642582"></a>
### FLAG_TAKEN

```ml
const FLAG_TAKEN = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L23)

<a id="constant-constant-mq3-client-cgame-newdraw-flag-taken-blue-const-flag-taken-blue-4-src-mq3-client-cgame-newdraw-ml-157340275"></a>
### FLAG_TAKEN_BLUE

```ml
const FLAG_TAKEN_BLUE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L26)

<a id="constant-constant-mq3-client-cgame-newdraw-flag-taken-red-const-flag-taken-red-3-src-mq3-client-cgame-newdraw-ml-212284700"></a>
### FLAG_TAKEN_RED

```ml
const FLAG_TAKEN_RED = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L25)

<a id="function-function-mq3-client-cgame-newdraw-flagcarrier-function-flagcarrier-state-wantedteam-powerup-src-mq3-client-cgame-newdraw-ml-415877485"></a>
### flagCarrier

```ml
function flagCarrier(state, wantedTeam, powerup)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `wantedTeam` | `dynamic` | — |  |
| `powerup` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L217)

<a id="function-function-mq3-client-cgame-newdraw-gametypestring-function-gametypestring-state-src-mq3-client-cgame-newdraw-ml-1444808699"></a>
### gameTypeString

```ml
function gameTypeString(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L255)

<a id="function-function-mq3-client-cgame-newdraw-getgamestatustext-function-getgamestatustext-state-src-mq3-client-cgame-newdraw-ml-1670054073"></a>
### getGameStatusText

```ml
function getGameStatusText(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L253)

<a id="function-function-mq3-client-cgame-newdraw-getkillertext-function-getkillertext-state-src-mq3-client-cgame-newdraw-ml-765047631"></a>
### getKillerText

```ml
function getKillerText(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L247)

<a id="function-function-mq3-client-cgame-newdraw-getselectedplayer-function-getselectedplayer-state-src-mq3-client-cgame-newdraw-ml-2122214991"></a>
### getSelectedPlayer

```ml
function getSelectedPlayer(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L186)

<a id="function-function-mq3-client-cgame-newdraw-getteamcolor-function-getteamcolor-state-src-mq3-client-cgame-newdraw-ml-1045829495"></a>
### getTeamColor

```ml
function getTeamColor(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L290)

<a id="function-function-mq3-client-cgame-newdraw-getvalue-function-getvalue-state-ownerdraw-src-mq3-client-cgame-newdraw-ml-1198027504"></a>
### getValue

```ml
function getValue(state, ownerDraw)
```

CG_GetValue

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ownerDraw` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L232)

<a id="constant-constant-mq3-client-cgame-newdraw-gt-1fctf-const-gt-1fctf-5-src-mq3-client-cgame-newdraw-ml-69306150"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L19)

<a id="constant-constant-mq3-client-cgame-newdraw-gt-ctf-const-gt-ctf-4-src-mq3-client-cgame-newdraw-ml-916130495"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L18)

<a id="constant-constant-mq3-client-cgame-newdraw-gt-ffa-const-gt-ffa-0-src-mq3-client-cgame-newdraw-ml-722879443"></a>
### GT_FFA

```ml
const GT_FFA = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L14)

<a id="constant-constant-mq3-client-cgame-newdraw-gt-harvester-const-gt-harvester-7-src-mq3-client-cgame-newdraw-ml-1013950744"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L21)

<a id="constant-constant-mq3-client-cgame-newdraw-gt-obelisk-const-gt-obelisk-6-src-mq3-client-cgame-newdraw-ml-711639297"></a>
### GT_OBELISK

```ml
const GT_OBELISK = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L20)

<a id="constant-constant-mq3-client-cgame-newdraw-gt-single-player-const-gt-single-player-2-src-mq3-client-cgame-newdraw-ml-1783392815"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L16)

<a id="constant-constant-mq3-client-cgame-newdraw-gt-team-const-gt-team-3-src-mq3-client-cgame-newdraw-ml-1521732754"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L17)

<a id="constant-constant-mq3-client-cgame-newdraw-gt-tournament-const-gt-tournament-1-src-mq3-client-cgame-newdraw-ml-1455258180"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L15)

<a id="function-function-mq3-client-cgame-newdraw-harvesterskulls-function-harvesterskulls-state-r-scale-color-force2d-src-mq3-client-cgame-newdraw-ml-1091364175"></a>
### harvesterSkulls

```ml
function harvesterSkulls(state, r, scale, color, force2D)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `force2D` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L224)

<a id="function-function-mq3-client-cgame-newdraw-hasplayerflag-function-hasplayerflag-state-src-mq3-client-cgame-newdraw-ml-695109613"></a>
### hasPlayerFlag

```ml
function hasPlayerFlag(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L237)

<a id="function-function-mq3-client-cgame-newdraw-hideteammenu-function-hideteammenu-state-src-mq3-client-cgame-newdraw-ml-718771271"></a>
### hideTeamMenu

```ml
function hideTeamMenu(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L281)

<a id="constant-constant-mq3-client-cgame-newdraw-hud-vertical-const-hud-vertical-0-src-mq3-client-cgame-newdraw-ml-1441063425"></a>
### HUD_VERTICAL

```ml
const HUD_VERTICAL = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L46)

<a id="function-function-mq3-client-cgame-newdraw-initteamchat-function-initteamchat-state-src-mq3-client-cgame-newdraw-ml-1682875263"></a>
### initTeamChat

```ml
function initTeamChat(state)
```

CG_InitTeamChat / CG_SetPrintString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L155)

<a id="constant-constant-mq3-client-cgame-newdraw-k-mouse2-const-k-mouse2-179-src-mq3-client-cgame-newdraw-ml-1520881776"></a>
### K_MOUSE2

```ml
const K_MOUSE2 = 179
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L44)

<a id="function-function-mq3-client-cgame-newdraw-keyevent-function-keyevent-state-key-down-src-mq3-client-cgame-newdraw-ml-2083805466"></a>
### keyEvent

```ml
function keyEvent(state, key, down)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L284)

<a id="function-function-mq3-client-cgame-newdraw-location-function-location-state-id-src-mq3-client-cgame-newdraw-ml-2051431404"></a>
### location

```ml
function location(state, id)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L151)

<a id="function-function-mq3-client-cgame-newdraw-medal-function-medal-src-mq3-client-cgame-newdraw-ml-127740068"></a>
### medal

```ml
function medal()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L136)

- [mq3.client.cgame_newdraw.Medal](Type-mq3-client-cgame-newdraw-medal-437857318.md) — struct
<a id="function-function-mq3-client-cgame-newdraw-medalvalue-function-medalvalue-score-ownerdraw-src-mq3-client-cgame-newdraw-ml-1164127827"></a>
### medalValue

```ml
function medalValue(score, ownerDraw)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `score` | `dynamic` | — |  |
| `ownerDraw` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L271)

<a id="function-function-mq3-client-cgame-newdraw-model-function-model-state-r-name-clientnum-src-mq3-client-cgame-newdraw-ml-1444007175"></a>
### model

```ml
function model(state, r, name, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L147)

<a id="function-function-mq3-client-cgame-newdraw-mouseevent-function-mouseevent-state-x-y-src-mq3-client-cgame-newdraw-ml-1630847090"></a>
### mouseEvent

```ml
function mouseEvent(state, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L280)

<a id="function-function-mq3-client-cgame-newdraw-numericdraw-function-numericdraw-state-r-value-scale-color-shader-src-mq3-client-cgame-newdraw-ml-996353680"></a>
### numericDraw

```ml
function numericDraw(state, r, value, scale, color, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L193)

<a id="function-function-mq3-client-cgame-newdraw-oneflagstatus-function-oneflagstatus-state-r-src-mq3-client-cgame-newdraw-ml-306944277"></a>
### oneFlagStatus

```ml
function oneFlagStatus(state, r)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L225)

<a id="function-function-mq3-client-cgame-newdraw-otherteamhasflag-function-otherteamhasflag-state-src-mq3-client-cgame-newdraw-ml-302077103"></a>
### otherTeamHasFlag

```ml
function otherTeamHasFlag(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L235)

<a id="function-function-mq3-client-cgame-newdraw-ownerdraw-function-ownerdraw-state-x-y-w-h-textx-texty-owner-flags-align-special-scale-color-shader-textstyle-src-mq3-client-cgame-newdraw-ml-1167269666"></a>
### ownerDraw

```ml
function ownerDraw(state, x, y, w, h, textX, textY, owner, flags, align, special, scale, color, shader, textStyle)
```

CG_OwnerDraw dispatcher

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `textX` | `dynamic` | — |  |
| `textY` | `dynamic` | — |  |
| `owner` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `align` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L275)

<a id="function-function-mq3-client-cgame-newdraw-ownerdrawvisible-function-ownerdrawvisible-state-flags-src-mq3-client-cgame-newdraw-ml-1730532358"></a>
### ownerDrawVisible

```ml
function ownerDrawVisible(state, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L238)

<a id="function-function-mq3-client-cgame-newdraw-pic-function-pic-state-r-shader-color-src-mq3-client-cgame-newdraw-ml-1183740117"></a>
### pic

```ml
function pic(state, r, shader, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L146)

<a id="function-function-mq3-client-cgame-newdraw-placestring-function-placestring-rank-src-mq3-client-cgame-newdraw-ml-30955856"></a>
### placeString

```ml
function placeString(rank)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rank` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L252)

<a id="constant-constant-mq3-client-cgame-newdraw-pm-normal-const-pm-normal-0-src-mq3-client-cgame-newdraw-ml-1460058051"></a>
### PM_NORMAL

```ml
const PM_NORMAL = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L38)

<a id="constant-constant-mq3-client-cgame-newdraw-pm-spectator-const-pm-spectator-2-src-mq3-client-cgame-newdraw-ml-1215657377"></a>
### PM_SPECTATOR

```ml
const PM_SPECTATOR = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L39)

- [mq3.client.cgame_newdraw.Powerup](Type-mq3-client-cgame-newdraw-powerup-1112814521.md) — struct
<a id="constant-constant-mq3-client-cgame-newdraw-pw-blueflag-const-pw-blueflag-8-src-mq3-client-cgame-newdraw-ml-1379887995"></a>
### PW_BLUEFLAG

```ml
const PW_BLUEFLAG = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L28)

<a id="constant-constant-mq3-client-cgame-newdraw-pw-neutralflag-const-pw-neutralflag-9-src-mq3-client-cgame-newdraw-ml-346868740"></a>
### PW_NEUTRALFLAG

```ml
const PW_NEUTRALFLAG = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L29)

<a id="constant-constant-mq3-client-cgame-newdraw-pw-redflag-const-pw-redflag-7-src-mq3-client-cgame-newdraw-ml-1904482206"></a>
### PW_REDFLAG

```ml
const PW_REDFLAG = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L27)

<a id="function-function-mq3-client-cgame-newdraw-rect-function-rect-x-y-w-h-src-mq3-client-cgame-newdraw-ml-569523194"></a>
### rect

```ml
function rect(x, y, w, h)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L140)

- [mq3.client.cgame_newdraw.Rect](Type-mq3-client-cgame-newdraw-rect-1855648725.md) — struct
<a id="function-function-mq3-client-cgame-newdraw-runmenuscript-function-runmenuscript-state-args-src-mq3-client-cgame-newdraw-ml-2098242102"></a>
### runMenuScript

```ml
function runMenuScript(state, args)
```

The original body is empty. Preserve that behavior while making the host boundary deterministic and observable for future menu script extensions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L289)

<a id="constant-constant-mq3-client-cgame-newdraw-score-not-present-const-score-not-present-9999-src-mq3-client-cgame-newdraw-ml-1082692240"></a>
### SCORE_NOT_PRESENT

```ml
const SCORE_NOT_PRESENT = -9999
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L45)

<a id="function-function-mq3-client-cgame-newdraw-selectnextplayer-function-selectnextplayer-state-src-mq3-client-cgame-newdraw-ml-1151572059"></a>
### selectNextPlayer

```ml
function selectNextPlayer(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L187)

<a id="function-function-mq3-client-cgame-newdraw-selectprevplayer-function-selectprevplayer-state-src-mq3-client-cgame-newdraw-ml-1888395887"></a>
### selectPrevPlayer

```ml
function selectPrevPlayer(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L188)

<a id="function-function-mq3-client-cgame-newdraw-selfclient-function-selfclient-state-src-mq3-client-cgame-newdraw-ml-2058930775"></a>
### selfClient

```ml
function selfClient(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L149)

<a id="function-function-mq3-client-cgame-newdraw-setprintstring-function-setprintstring-state-type-value-src-mq3-client-cgame-newdraw-ml-1255936440"></a>
### setPrintString

```ml
function setPrintString(state, type, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L156)

<a id="function-function-mq3-client-cgame-newdraw-setselectedplayername-function-setselectedplayername-state-src-mq3-client-cgame-newdraw-ml-512423221"></a>
### setSelectedPlayerName

```ml
function setSelectedPlayerName(state)
```

CG_SetSelectedPlayerName

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L183)

<a id="function-function-mq3-client-cgame-newdraw-showresponsehead-function-showresponsehead-state-src-mq3-client-cgame-newdraw-ml-1227504307"></a>
### showResponseHead

```ml
function showResponseHead(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L286)

<a id="function-function-mq3-client-cgame-newdraw-showteammenu-function-showteammenu-state-src-mq3-client-cgame-newdraw-ml-1186749767"></a>
### showTeamMenu

```ml
function showTeamMenu(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L282)

<a id="function-function-mq3-client-cgame-newdraw-sortedpowerups-function-sortedpowerups-state-src-mq3-client-cgame-newdraw-ml-1054733927"></a>
### sortedPowerups

```ml
function sortedPowerups(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L228)

- [mq3.client.cgame_newdraw.State](Type-mq3-client-cgame-newdraw-state-1072933844.md) — struct
<a id="function-function-mq3-client-cgame-newdraw-statushandle-function-statushandle-task-src-mq3-client-cgame-newdraw-ml-1561494177"></a>
### statusHandle

```ml
function statusHandle(task)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `task` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L190)

<a id="function-function-mq3-client-cgame-newdraw-taskvoice-function-taskvoice-task-src-mq3-client-cgame-newdraw-ml-777344703"></a>
### taskVoice

```ml
function taskVoice(task)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `task` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L158)

<a id="constant-constant-mq3-client-cgame-newdraw-team-blue-const-team-blue-2-src-mq3-client-cgame-newdraw-ml-527067677"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L12)

<a id="constant-constant-mq3-client-cgame-newdraw-team-free-const-team-free-0-src-mq3-client-cgame-newdraw-ml-1253644787"></a>
### TEAM_FREE

```ml
const TEAM_FREE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L10)

<a id="constant-constant-mq3-client-cgame-newdraw-team-red-const-team-red-1-src-mq3-client-cgame-newdraw-ml-502870256"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L11)

<a id="constant-constant-mq3-client-cgame-newdraw-team-spectator-const-team-spectator-3-src-mq3-client-cgame-newdraw-ml-126745242"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L13)

<a id="constant-constant-mq3-client-cgame-newdraw-teamtask-camp-const-teamtask-camp-7-src-mq3-client-cgame-newdraw-ml-780335722"></a>
### TEAMTASK_CAMP

```ml
const TEAMTASK_CAMP = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L37)

<a id="constant-constant-mq3-client-cgame-newdraw-teamtask-defense-const-teamtask-defense-2-src-mq3-client-cgame-newdraw-ml-2031923497"></a>
### TEAMTASK_DEFENSE

```ml
const TEAMTASK_DEFENSE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L32)

<a id="constant-constant-mq3-client-cgame-newdraw-teamtask-escort-const-teamtask-escort-6-src-mq3-client-cgame-newdraw-ml-403587029"></a>
### TEAMTASK_ESCORT

```ml
const TEAMTASK_ESCORT = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L36)

<a id="constant-constant-mq3-client-cgame-newdraw-teamtask-follow-const-teamtask-follow-4-src-mq3-client-cgame-newdraw-ml-384537391"></a>
### TEAMTASK_FOLLOW

```ml
const TEAMTASK_FOLLOW = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L34)

<a id="constant-constant-mq3-client-cgame-newdraw-teamtask-none-const-teamtask-none-0-src-mq3-client-cgame-newdraw-ml-773939099"></a>
### TEAMTASK_NONE

```ml
const TEAMTASK_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L30)

<a id="constant-constant-mq3-client-cgame-newdraw-teamtask-offense-const-teamtask-offense-1-src-mq3-client-cgame-newdraw-ml-929811200"></a>
### TEAMTASK_OFFENSE

```ml
const TEAMTASK_OFFENSE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L31)

<a id="constant-constant-mq3-client-cgame-newdraw-teamtask-patrol-const-teamtask-patrol-3-src-mq3-client-cgame-newdraw-ml-1513598534"></a>
### TEAMTASK_PATROL

```ml
const TEAMTASK_PATROL = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L33)

<a id="constant-constant-mq3-client-cgame-newdraw-teamtask-retrieve-const-teamtask-retrieve-5-src-mq3-client-cgame-newdraw-ml-490198448"></a>
### TEAMTASK_RETRIEVE

```ml
const TEAMTASK_RETRIEVE = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L35)

<a id="function-function-mq3-client-cgame-newdraw-text-function-text-state-r-value-scale-color-src-mq3-client-cgame-newdraw-ml-1028638253"></a>
### text

```ml
function text(state, r, value, scale, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L145)

<a id="function-function-mq3-client-cgame-newdraw-textpaintlimit-function-textpaintlimit-state-maxx-x-y-scale-color-value-adjust-limit-src-mq3-client-cgame-newdraw-ml-108963180"></a>
### textPaintLimit

```ml
function textPaintLimit(state, maxX, x, y, scale, color, value, adjust, limit)
```

CG_Text_Paint_Limit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `maxX` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `adjust` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L259)

<a id="function-function-mq3-client-cgame-newdraw-two-function-two-value-src-mq3-client-cgame-newdraw-ml-1122284819"></a>
### two

```ml
function two(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L152)

<a id="function-function-mq3-client-cgame-newdraw-voiceclient-function-voiceclient-state-src-mq3-client-cgame-newdraw-ml-1672219409"></a>
### voiceClient

```ml
function voiceClient(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L150)

<a id="function-function-mq3-client-cgame-newdraw-yourteamhasflag-function-yourteamhasflag-state-src-mq3-client-cgame-newdraw-ml-699853543"></a>
### yourTeamHasFlag

```ml
function yourTeamHasFlag(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L236)
