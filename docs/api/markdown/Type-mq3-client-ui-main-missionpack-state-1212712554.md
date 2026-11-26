# `mq3.client.ui_main_missionpack.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-main-missionpack-ml-2627719.md)

<a id="struct-struct-mq3-client-ui-main-missionpack-state-struct-state-src-mq3-client-ui-main-missionpack-ml-250587207"></a>
## State

```ml
struct State
```

Stores UI main missionpack state, including `actions`, `retailActive`, `hostFn`, `initialized`, `shutdown`, `ingameLoad` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L253)

## Members

<a id="field-field-mq3-client-ui-main-missionpack-state-actions-actions-src-mq3-client-ui-main-missionpack-ml-1314214406"></a>
### actions

```ml
actions
```

Host requests queued while running scripted Missionpack menus and updating browser or game selections, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L256)

<a id="field-field-mq3-client-ui-main-missionpack-state-activemenu-activemenu-src-mq3-client-ui-main-missionpack-ml-1229656320"></a>
### activeMenu

```ml
activeMenu
```

When constructing this record, `create` supplies `0` for this member. Used by `_UI_KeyEvent` and `_UI_SetActiveMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L281)

<a id="field-field-mq3-client-ui-main-missionpack-state-aliases-aliases-src-mq3-client-ui-main-missionpack-ml-707656538"></a>
### aliases

```ml
aliases
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_AIFromName` and `UI_AIIndex` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L308)

<a id="field-field-mq3-client-ui-main-missionpack-state-assets-assets-src-mq3-client-ui-main-missionpack-ml-975201860"></a>
### assets

```ml
assets
```

Missionpack UI media cache used by parsed menu definitions and owner-draw widgets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L293)

<a id="field-field-mq3-client-ui-main-missionpack-state-characters-characters-src-mq3-client-ui-main-missionpack-ml-870923458"></a>
### characters

```ml
characters
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_HeadCountByTeam` and `UI_SelectedHead` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L305)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentbot-currentbot-src-mq3-client-ui-main-missionpack-ml-183495906"></a>
### currentBot

```ml
currentBot
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_DrawBotName` and `UI_OwnerDrawWidth` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L370)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentbotskill-currentbotskill-src-mq3-client-ui-main-missionpack-ml-1800779166"></a>
### currentBotSkill

```ml
currentBotSkill
```

When constructing this record, `create` supplies `2` for this member. Used by `UI_DrawSkill` and `UI_DrawBotSkill` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L373)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentcrosshair-currentcrosshair-src-mq3-client-ui-main-missionpack-ml-1710546424"></a>
### currentCrosshair

```ml
currentCrosshair
```

When constructing this record, `create` supplies `4` for this member. Used by `UI_DrawCrosshair` and `UI_Crosshair_HandleKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L376)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentgametype-currentgametype-src-mq3-client-ui-main-missionpack-ml-1380859498"></a>
### currentGameType

```ml
currentGameType
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_DrawGameType` and `UI_DrawMapTimeToBeat` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L355)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentjoingametype-currentjoingametype-src-mq3-client-ui-main-missionpack-ml-1534431126"></a>
### currentJoinGameType

```ml
currentJoinGameType
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_DrawJoinGameType` and `UI_JoinGameType_HandleKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L361)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentmap-currentmap-src-mq3-client-ui-main-missionpack-ml-268033976"></a>
### currentMap

```ml
currentMap
```

When constructing this record, `create` supplies `0` for this member. Used by `currentMap` and `UI_GameType_HandleKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L352)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentnetfilter-currentnetfilter-src-mq3-client-ui-main-missionpack-ml-752764346"></a>
### currentNetFilter

```ml
currentNetFilter
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_DrawNetFilter` and `UI_NetFilter_HandleKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L382)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentnetgametype-currentnetgametype-src-mq3-client-ui-main-missionpack-ml-400384642"></a>
### currentNetGameType

```ml
currentNetGameType
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_DrawNetGameType` and `UI_OwnerDrawVisible` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L358)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentnetsource-currentnetsource-src-mq3-client-ui-main-missionpack-ml-483448304"></a>
### currentNetSource

```ml
currentNetSource
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_DrawNetSource` and `UI_OwnerDrawVisible` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L379)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentopponent-currentopponent-src-mq3-client-ui-main-missionpack-ml-779817170"></a>
### currentOpponent

```ml
currentOpponent
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_OpponentLeaderName` and `UI_NextOpponent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L367)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentteam-currentteam-src-mq3-client-ui-main-missionpack-ml-571750210"></a>
### currentTeam

```ml
currentTeam
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_DrawClanLogo` and `UI_DrawClanCinematic` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L364)

<a id="field-field-mq3-client-ui-main-missionpack-state-cursorx-cursorx-src-mq3-client-ui-main-missionpack-ml-2132088522"></a>
### cursorx

```ml
cursorx
```

Horizontal position of the UI pointer in the menu coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L276)

<a id="field-field-mq3-client-ui-main-missionpack-state-cursory-cursory-src-mq3-client-ui-main-missionpack-ml-1833481062"></a>
### cursory

```ml
cursory
```

Vertical position of the UI pointer in the menu coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L278)

<a id="field-field-mq3-client-ui-main-missionpack-state-cvars-cvars-src-mq3-client-ui-main-missionpack-ml-459732334"></a>
### cvars

```ml
cvars
```

Configuration-variable values exposed to the native UI implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L291)

<a id="field-field-mq3-client-ui-main-missionpack-state-demoavailable-demoavailable-src-mq3-client-ui-main-missionpack-ml-811265690"></a>
### demoAvailable

```ml
demoAvailable
```

When constructing this record, `create` supplies `false` for this member. Used by `UI_OwnerDrawVisible` and `UI_RunMenuScript` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L412)

<a id="field-field-mq3-client-ui-main-missionpack-state-demos-demos-src-mq3-client-ui-main-missionpack-ml-2132729914"></a>
### demos

```ml
demos
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_FeederCount` and `UI_FeederItemText` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L344)

<a id="field-field-mq3-client-ui-main-missionpack-state-displayservers-displayservers-src-mq3-client-ui-main-missionpack-ml-2035157466"></a>
### displayServers

```ml
displayServers
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_ServersSort` and `UI_InsertServerIntoDisplayList` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L320)

<a id="field-field-mq3-client-ui-main-missionpack-state-fontheight-fontheight-src-mq3-client-ui-main-missionpack-ml-1734351298"></a>
### fontHeight

```ml
fontHeight
```

When constructing this record, `create` supplies `16.0` for this member. Used by `Font_Report` and `Text_Height` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L430)

<a id="field-field-mq3-client-ui-main-missionpack-state-fontwidths-fontwidths-src-mq3-client-ui-main-missionpack-ml-1814773834"></a>
### fontWidths

```ml
fontWidths
```

When constructing this record, `create` supplies `widths` for this member. Used by `Font_Report` and `Text_Width` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L427)

<a id="field-field-mq3-client-ui-main-missionpack-state-foundplayeraddresses-foundplayeraddresses-src-mq3-client-ui-main-missionpack-ml-907955064"></a>
### foundPlayerAddresses

```ml
foundPlayerAddresses
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_BuildFindPlayerList` and `UI_FeederSelection` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L329)

<a id="field-field-mq3-client-ui-main-missionpack-state-foundplayernames-foundplayernames-src-mq3-client-ui-main-missionpack-ml-1555790032"></a>
### foundPlayerNames

```ml
foundPlayerNames
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_BuildFindPlayerList` and `UI_FeederCount` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L326)

<a id="field-field-mq3-client-ui-main-missionpack-state-frametime-frametime-src-mq3-client-ui-main-missionpack-ml-2132239826"></a>
### frametime

```ml
frametime
```

Elapsed client time in milliseconds since the preceding frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L274)

<a id="field-field-mq3-client-ui-main-missionpack-state-fullscreen-fullscreen-src-mq3-client-ui-main-missionpack-ml-1308533140"></a>
### fullscreen

```ml
fullscreen
```

Whether the Missionpack main menu covers the entire UI instead of appearing over the underlying game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L284)

<a id="field-field-mq3-client-ui-main-missionpack-state-gametypes-gametypes-src-mq3-client-ui-main-missionpack-ml-2030819822"></a>
### gameTypes

```ml
gameTypes
```

When constructing this record, `create` supplies `games` for this member. Used by `UI_DrawGameType` and `UI_DrawNetGameType` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L311)

<a id="field-field-mq3-client-ui-main-missionpack-state-glinfo-glinfo-src-mq3-client-ui-main-missionpack-ml-717232032"></a>
### glInfo

```ml
glInfo
```

When constructing this record, `create` supplies an empty string for this member. Used by `UI_DrawGLInfo` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L424)

<a id="field-field-mq3-client-ui-main-missionpack-state-hostfn-hostfn-src-mq3-client-ui-main-missionpack-ml-1519348514"></a>
### hostFn

```ml
hostFn
```

Host callback for the host operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L261)

<a id="field-field-mq3-client-ui-main-missionpack-state-ingameload-ingameload-src-mq3-client-ui-main-missionpack-ml-1580408812"></a>
### ingameLoad

```ml
ingameLoad
```

When constructing this record, `create` supplies `false` for this member. Used by `_UI_Init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L270)

<a id="field-field-mq3-client-ui-main-missionpack-state-initialized-initialized-src-mq3-client-ui-main-missionpack-ml-1552911586"></a>
### initialized

```ml
initialized
```

True after Missionpack UI initialization has established menu, cvar, and browser state, until UI shutdown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L264)

<a id="field-field-mq3-client-ui-main-missionpack-state-joingametypes-joingametypes-src-mq3-client-ui-main-missionpack-ml-1364926486"></a>
### joinGameTypes

```ml
joinGameTypes
```

When constructing this record, `create` supplies `games` for this member. Used by `UI_DrawJoinGameType` and `UI_JoinGameType_HandleKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L314)

<a id="field-field-mq3-client-ui-main-missionpack-state-keycatcher-keycatcher-src-mq3-client-ui-main-missionpack-ml-1169027336"></a>
### keyCatcher

```ml
keyCatcher
```

Input-capture bitmask selecting which client subsystem currently receives key events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L286)

<a id="field-field-mq3-client-ui-main-missionpack-state-lastconnstate-lastconnstate-src-mq3-client-ui-main-missionpack-ml-82739310"></a>
### lastConnState

```ml
lastConnState
```

When constructing this record, `create` supplies `-1` for this member. Used by `UI_DrawConnectScreen` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L433)

<a id="field-field-mq3-client-ui-main-missionpack-state-lastloadingtext-lastloadingtext-src-mq3-client-ui-main-missionpack-ml-719815230"></a>
### lastLoadingText

```ml
lastLoadingText
```

When constructing this record, `create` supplies an empty string for this member. Used by `UI_DrawConnectScreen` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L436)

<a id="field-field-mq3-client-ui-main-missionpack-state-maps-maps-src-mq3-client-ui-main-missionpack-ml-772925436"></a>
### maps

```ml
maps
```

When constructing this record, `create` supplies an empty list for this member. Used by `currentMap` and `UI_DrawTierMap` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L299)

<a id="field-field-mq3-client-ui-main-missionpack-state-menus-menus-src-mq3-client-ui-main-missionpack-ml-1855788554"></a>
### menus

```ml
menus
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_Report` and `UI_ParseMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L296)

<a id="field-field-mq3-client-ui-main-missionpack-state-mods-mods-src-mq3-client-ui-main-missionpack-ml-791580808"></a>
### mods

```ml
mods
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_FeederCount` and `UI_FeederItemText` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L338)

<a id="field-field-mq3-client-ui-main-missionpack-state-movies-movies-src-mq3-client-ui-main-missionpack-ml-1203605380"></a>
### movies

```ml
movies
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_FeederCount` and `UI_FeederItemText` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L341)

<a id="field-field-mq3-client-ui-main-missionpack-state-newbesttime-newbesttime-src-mq3-client-ui-main-missionpack-ml-89745754"></a>
### newBestTime

```ml
newBestTime
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_OwnerDrawVisible` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L409)

<a id="field-field-mq3-client-ui-main-missionpack-state-newhighscoretime-newhighscoretime-src-mq3-client-ui-main-missionpack-ml-1361988096"></a>
### newHighScoreTime

```ml
newHighScoreTime
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_OwnerDrawVisible` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L406)

<a id="field-field-mq3-client-ui-main-missionpack-state-nextdisplayrefresh-nextdisplayrefresh-src-mq3-client-ui-main-missionpack-ml-2070689030"></a>
### nextDisplayRefresh

```ml
nextDisplayRefresh
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_BuildFindPlayerList` and `UI_RunMenuScript` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L400)

<a id="field-field-mq3-client-ui-main-missionpack-state-numplayersonservers-numplayersonservers-src-mq3-client-ui-main-missionpack-ml-2128147506"></a>
### numPlayersOnServers

```ml
numPlayersOnServers
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_BuildServerDisplayList` and `UI_StopServerRefresh` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L415)

<a id="field-field-mq3-client-ui-main-missionpack-state-paused-paused-src-mq3-client-ui-main-missionpack-ml-1492581034"></a>
### paused

```ml
paused
```

When constructing this record, `create` supplies `false` for this member. Used by `UI_Pause` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L289)

<a id="field-field-mq3-client-ui-main-missionpack-state-playernames-playernames-src-mq3-client-ui-main-missionpack-ml-840627386"></a>
### playerNames

```ml
playerNames
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_BuildPlayerList` and `UI_FeederCount` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L332)

<a id="field-field-mq3-client-ui-main-missionpack-state-playerrefresh-playerrefresh-src-mq3-client-ui-main-missionpack-ml-462589278"></a>
### playerRefresh

```ml
playerRefresh
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_BuildPlayerList` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L403)

<a id="field-field-mq3-client-ui-main-missionpack-state-q3headicons-q3headicons-src-mq3-client-ui-main-missionpack-ml-270973782"></a>
### q3HeadIcons

```ml
q3HeadIcons
```

Image or shader resources used to draw the q3 head icon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L349)

<a id="field-field-mq3-client-ui-main-missionpack-state-q3headnames-q3headnames-src-mq3-client-ui-main-missionpack-ml-1311598898"></a>
### q3HeadNames

```ml
q3HeadNames
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_FeederCount` and `UI_FeederItemText` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L347)

<a id="field-field-mq3-client-ui-main-missionpack-state-realtime-realtime-src-mq3-client-ui-main-missionpack-ml-71475884"></a>
### realtime

```ml
realtime
```

Current mission-pack UI refresh time in milliseconds used for browser and menu updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L272)

<a id="field-field-mq3-client-ui-main-missionpack-state-refreshactive-refreshactive-src-mq3-client-ui-main-missionpack-ml-2120092606"></a>
### refreshActive

```ml
refreshActive
```

When constructing this record, `create` supplies `false` for this member. Used by `UI_UpdatePendingPings` and `UI_RunMenuScript` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L394)

<a id="field-field-mq3-client-ui-main-missionpack-state-refreshtime-refreshtime-src-mq3-client-ui-main-missionpack-ml-721133546"></a>
### refreshTime

```ml
refreshTime
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_UpdatePendingPings` and `UI_DoServerRefresh` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L397)

<a id="field-field-mq3-client-ui-main-missionpack-state-retailactive-retailactive-src-mq3-client-ui-main-missionpack-ml-1740573872"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns Missionpack menus and server browsing, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L259)

<a id="field-field-mq3-client-ui-main-missionpack-state-selectedplayer-selectedplayer-src-mq3-client-ui-main-missionpack-ml-316475482"></a>
### selectedPlayer

```ml
selectedPlayer
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_DrawSelectedPlayer` and `UI_SelectedPlayer_HandleKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L385)

<a id="field-field-mq3-client-ui-main-missionpack-state-servermotd-servermotd-src-mq3-client-ui-main-missionpack-ml-529634868"></a>
### serverMOTD

```ml
serverMOTD
```

When constructing this record, `create` supplies an empty string for this member. Used by `UI_DrawServerMOTD` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L418)

<a id="field-field-mq3-client-ui-main-missionpack-state-serverrefreshdate-serverrefreshdate-src-mq3-client-ui-main-missionpack-ml-1538408258"></a>
### serverRefreshDate

```ml
serverRefreshDate
```

When constructing this record, `create` supplies an empty string for this member. Used by `UI_DrawServerRefreshDate` and `UI_OwnerDrawWidth` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L421)

<a id="field-field-mq3-client-ui-main-missionpack-state-servers-servers-src-mq3-client-ui-main-missionpack-ml-1549192510"></a>
### servers

```ml
servers
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_ServersQsortCompare` and `UI_BuildServerDisplayList` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L317)

<a id="field-field-mq3-client-ui-main-missionpack-state-serverstatuslines-serverstatuslines-src-mq3-client-ui-main-missionpack-ml-1436067418"></a>
### serverStatusLines

```ml
serverStatusLines
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_SortServerStatusInfo` and `UI_BuildServerStatus` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L323)

<a id="field-field-mq3-client-ui-main-missionpack-state-shutdown-shutdown-src-mq3-client-ui-main-missionpack-ml-217089986"></a>
### shutdown

```ml
shutdown
```

When constructing this record, `create` supplies `false` for this member. Used by `_UI_Init` and `_UI_Shutdown` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L267)

<a id="field-field-mq3-client-ui-main-missionpack-state-sortdir-sortdir-src-mq3-client-ui-main-missionpack-ml-2045818554"></a>
### sortDir

```ml
sortDir
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_ServersQsortCompare` and `UI_RunMenuScript` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L391)

<a id="field-field-mq3-client-ui-main-missionpack-state-sortkey-sortkey-src-mq3-client-ui-main-missionpack-ml-1774559906"></a>
### sortKey

```ml
sortKey
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_ServersQsortCompare` and `UI_ServersSort` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L388)

<a id="field-field-mq3-client-ui-main-missionpack-state-teamnames-teamnames-src-mq3-client-ui-main-missionpack-ml-1246457582"></a>
### teamNames

```ml
teamNames
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_BuildPlayerList` and `UI_DrawSelectedPlayer` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L335)

<a id="field-field-mq3-client-ui-main-missionpack-state-teams-teams-src-mq3-client-ui-main-missionpack-ml-2074694706"></a>
### teams

```ml
teams
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_TeamIndexFromName` and `teamAt` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L302)
