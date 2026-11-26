# `mq3.client.ui_main_missionpack.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-main-missionpack-ml-2627719.md)

<a id="struct-struct-mq3-client-ui-main-missionpack-state-struct-state-src-mq3-client-ui-main-missionpack-ml-250587207"></a>
## State

```ml
struct State
```

Stores UI main missionpack state, including `actions`, `retailActive`, `hostFn`, `initialized`, `shutdown`, `ingameLoad` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L84)

## Members

<a id="field-field-mq3-client-ui-main-missionpack-state-actions-actions-src-mq3-client-ui-main-missionpack-ml-1314214406"></a>
### actions

```ml
actions
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L85)

<a id="field-field-mq3-client-ui-main-missionpack-state-activemenu-activemenu-src-mq3-client-ui-main-missionpack-ml-1229656320"></a>
### activeMenu

```ml
activeMenu
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L85)

<a id="field-field-mq3-client-ui-main-missionpack-state-aliases-aliases-src-mq3-client-ui-main-missionpack-ml-707656538"></a>
### aliases

```ml
aliases
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L86)

<a id="field-field-mq3-client-ui-main-missionpack-state-assets-assets-src-mq3-client-ui-main-missionpack-ml-975201860"></a>
### assets

```ml
assets
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L86)

<a id="field-field-mq3-client-ui-main-missionpack-state-characters-characters-src-mq3-client-ui-main-missionpack-ml-870923458"></a>
### characters

```ml
characters
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L86)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentbot-currentbot-src-mq3-client-ui-main-missionpack-ml-183495906"></a>
### currentBot

```ml
currentBot
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L88)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentbotskill-currentbotskill-src-mq3-client-ui-main-missionpack-ml-1800779166"></a>
### currentBotSkill

```ml
currentBotSkill
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L88)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentcrosshair-currentcrosshair-src-mq3-client-ui-main-missionpack-ml-1710546424"></a>
### currentCrosshair

```ml
currentCrosshair
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L88)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentgametype-currentgametype-src-mq3-client-ui-main-missionpack-ml-1380859498"></a>
### currentGameType

```ml
currentGameType
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L88)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentjoingametype-currentjoingametype-src-mq3-client-ui-main-missionpack-ml-1534431126"></a>
### currentJoinGameType

```ml
currentJoinGameType
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L88)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentmap-currentmap-src-mq3-client-ui-main-missionpack-ml-268033976"></a>
### currentMap

```ml
currentMap
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L88)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentnetfilter-currentnetfilter-src-mq3-client-ui-main-missionpack-ml-752764346"></a>
### currentNetFilter

```ml
currentNetFilter
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L88)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentnetgametype-currentnetgametype-src-mq3-client-ui-main-missionpack-ml-400384642"></a>
### currentNetGameType

```ml
currentNetGameType
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L88)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentnetsource-currentnetsource-src-mq3-client-ui-main-missionpack-ml-483448304"></a>
### currentNetSource

```ml
currentNetSource
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L88)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentopponent-currentopponent-src-mq3-client-ui-main-missionpack-ml-779817170"></a>
### currentOpponent

```ml
currentOpponent
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L88)

<a id="field-field-mq3-client-ui-main-missionpack-state-currentteam-currentteam-src-mq3-client-ui-main-missionpack-ml-571750210"></a>
### currentTeam

```ml
currentTeam
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L88)

<a id="field-field-mq3-client-ui-main-missionpack-state-cursorx-cursorx-src-mq3-client-ui-main-missionpack-ml-2132088522"></a>
### cursorx

```ml
cursorx
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L85)

<a id="field-field-mq3-client-ui-main-missionpack-state-cursory-cursory-src-mq3-client-ui-main-missionpack-ml-1833481062"></a>
### cursory

```ml
cursory
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L85)

<a id="field-field-mq3-client-ui-main-missionpack-state-cvars-cvars-src-mq3-client-ui-main-missionpack-ml-459732334"></a>
### cvars

```ml
cvars
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L86)

<a id="field-field-mq3-client-ui-main-missionpack-state-demoavailable-demoavailable-src-mq3-client-ui-main-missionpack-ml-811265690"></a>
### demoAvailable

```ml
demoAvailable
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L89)

<a id="field-field-mq3-client-ui-main-missionpack-state-demos-demos-src-mq3-client-ui-main-missionpack-ml-2132729914"></a>
### demos

```ml
demos
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L87)

<a id="field-field-mq3-client-ui-main-missionpack-state-displayservers-displayservers-src-mq3-client-ui-main-missionpack-ml-2035157466"></a>
### displayServers

```ml
displayServers
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L86)

<a id="field-field-mq3-client-ui-main-missionpack-state-fontheight-fontheight-src-mq3-client-ui-main-missionpack-ml-1734351298"></a>
### fontHeight

```ml
fontHeight
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L90)

<a id="field-field-mq3-client-ui-main-missionpack-state-fontwidths-fontwidths-src-mq3-client-ui-main-missionpack-ml-1814773834"></a>
### fontWidths

```ml
fontWidths
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L90)

<a id="field-field-mq3-client-ui-main-missionpack-state-foundplayeraddresses-foundplayeraddresses-src-mq3-client-ui-main-missionpack-ml-907955064"></a>
### foundPlayerAddresses

```ml
foundPlayerAddresses
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L86)

<a id="field-field-mq3-client-ui-main-missionpack-state-foundplayernames-foundplayernames-src-mq3-client-ui-main-missionpack-ml-1555790032"></a>
### foundPlayerNames

```ml
foundPlayerNames
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L86)

<a id="field-field-mq3-client-ui-main-missionpack-state-frametime-frametime-src-mq3-client-ui-main-missionpack-ml-2132239826"></a>
### frametime

```ml
frametime
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L85)

<a id="field-field-mq3-client-ui-main-missionpack-state-fullscreen-fullscreen-src-mq3-client-ui-main-missionpack-ml-1308533140"></a>
### fullscreen

```ml
fullscreen
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L85)

<a id="field-field-mq3-client-ui-main-missionpack-state-gametypes-gametypes-src-mq3-client-ui-main-missionpack-ml-2030819822"></a>
### gameTypes

```ml
gameTypes
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L86)

<a id="field-field-mq3-client-ui-main-missionpack-state-glinfo-glinfo-src-mq3-client-ui-main-missionpack-ml-717232032"></a>
### glInfo

```ml
glInfo
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L90)

<a id="field-field-mq3-client-ui-main-missionpack-state-hostfn-hostfn-src-mq3-client-ui-main-missionpack-ml-1519348514"></a>
### hostFn

```ml
hostFn
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L85)

<a id="field-field-mq3-client-ui-main-missionpack-state-ingameload-ingameload-src-mq3-client-ui-main-missionpack-ml-1580408812"></a>
### ingameLoad

```ml
ingameLoad
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L85)

<a id="field-field-mq3-client-ui-main-missionpack-state-initialized-initialized-src-mq3-client-ui-main-missionpack-ml-1552911586"></a>
### initialized

```ml
initialized
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L85)

<a id="field-field-mq3-client-ui-main-missionpack-state-joingametypes-joingametypes-src-mq3-client-ui-main-missionpack-ml-1364926486"></a>
### joinGameTypes

```ml
joinGameTypes
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L86)

<a id="field-field-mq3-client-ui-main-missionpack-state-keycatcher-keycatcher-src-mq3-client-ui-main-missionpack-ml-1169027336"></a>
### keyCatcher

```ml
keyCatcher
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L85)

<a id="field-field-mq3-client-ui-main-missionpack-state-lastconnstate-lastconnstate-src-mq3-client-ui-main-missionpack-ml-82739310"></a>
### lastConnState

```ml
lastConnState
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L90)

<a id="field-field-mq3-client-ui-main-missionpack-state-lastloadingtext-lastloadingtext-src-mq3-client-ui-main-missionpack-ml-719815230"></a>
### lastLoadingText

```ml
lastLoadingText
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L90)

<a id="field-field-mq3-client-ui-main-missionpack-state-maps-maps-src-mq3-client-ui-main-missionpack-ml-772925436"></a>
### maps

```ml
maps
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L86)

<a id="field-field-mq3-client-ui-main-missionpack-state-menus-menus-src-mq3-client-ui-main-missionpack-ml-1855788554"></a>
### menus

```ml
menus
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L86)

<a id="field-field-mq3-client-ui-main-missionpack-state-mods-mods-src-mq3-client-ui-main-missionpack-ml-791580808"></a>
### mods

```ml
mods
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L87)

<a id="field-field-mq3-client-ui-main-missionpack-state-movies-movies-src-mq3-client-ui-main-missionpack-ml-1203605380"></a>
### movies

```ml
movies
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L87)

<a id="field-field-mq3-client-ui-main-missionpack-state-newbesttime-newbesttime-src-mq3-client-ui-main-missionpack-ml-89745754"></a>
### newBestTime

```ml
newBestTime
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L89)

<a id="field-field-mq3-client-ui-main-missionpack-state-newhighscoretime-newhighscoretime-src-mq3-client-ui-main-missionpack-ml-1361988096"></a>
### newHighScoreTime

```ml
newHighScoreTime
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L89)

<a id="field-field-mq3-client-ui-main-missionpack-state-nextdisplayrefresh-nextdisplayrefresh-src-mq3-client-ui-main-missionpack-ml-2070689030"></a>
### nextDisplayRefresh

```ml
nextDisplayRefresh
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L89)

<a id="field-field-mq3-client-ui-main-missionpack-state-numplayersonservers-numplayersonservers-src-mq3-client-ui-main-missionpack-ml-2128147506"></a>
### numPlayersOnServers

```ml
numPlayersOnServers
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L89)

<a id="field-field-mq3-client-ui-main-missionpack-state-paused-paused-src-mq3-client-ui-main-missionpack-ml-1492581034"></a>
### paused

```ml
paused
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L85)

<a id="field-field-mq3-client-ui-main-missionpack-state-playernames-playernames-src-mq3-client-ui-main-missionpack-ml-840627386"></a>
### playerNames

```ml
playerNames
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L87)

<a id="field-field-mq3-client-ui-main-missionpack-state-playerrefresh-playerrefresh-src-mq3-client-ui-main-missionpack-ml-462589278"></a>
### playerRefresh

```ml
playerRefresh
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L89)

<a id="field-field-mq3-client-ui-main-missionpack-state-q3headicons-q3headicons-src-mq3-client-ui-main-missionpack-ml-270973782"></a>
### q3HeadIcons

```ml
q3HeadIcons
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L87)

<a id="field-field-mq3-client-ui-main-missionpack-state-q3headnames-q3headnames-src-mq3-client-ui-main-missionpack-ml-1311598898"></a>
### q3HeadNames

```ml
q3HeadNames
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L87)

<a id="field-field-mq3-client-ui-main-missionpack-state-realtime-realtime-src-mq3-client-ui-main-missionpack-ml-71475884"></a>
### realtime

```ml
realtime
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L85)

<a id="field-field-mq3-client-ui-main-missionpack-state-refreshactive-refreshactive-src-mq3-client-ui-main-missionpack-ml-2120092606"></a>
### refreshActive

```ml
refreshActive
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L89)

<a id="field-field-mq3-client-ui-main-missionpack-state-refreshtime-refreshtime-src-mq3-client-ui-main-missionpack-ml-721133546"></a>
### refreshTime

```ml
refreshTime
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L89)

<a id="field-field-mq3-client-ui-main-missionpack-state-retailactive-retailactive-src-mq3-client-ui-main-missionpack-ml-1740573872"></a>
### retailActive

```ml
retailActive
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L85)

<a id="field-field-mq3-client-ui-main-missionpack-state-selectedplayer-selectedplayer-src-mq3-client-ui-main-missionpack-ml-316475482"></a>
### selectedPlayer

```ml
selectedPlayer
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L88)

<a id="field-field-mq3-client-ui-main-missionpack-state-servermotd-servermotd-src-mq3-client-ui-main-missionpack-ml-529634868"></a>
### serverMOTD

```ml
serverMOTD
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L90)

<a id="field-field-mq3-client-ui-main-missionpack-state-serverrefreshdate-serverrefreshdate-src-mq3-client-ui-main-missionpack-ml-1538408258"></a>
### serverRefreshDate

```ml
serverRefreshDate
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L90)

<a id="field-field-mq3-client-ui-main-missionpack-state-servers-servers-src-mq3-client-ui-main-missionpack-ml-1549192510"></a>
### servers

```ml
servers
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L86)

<a id="field-field-mq3-client-ui-main-missionpack-state-serverstatuslines-serverstatuslines-src-mq3-client-ui-main-missionpack-ml-1436067418"></a>
### serverStatusLines

```ml
serverStatusLines
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L86)

<a id="field-field-mq3-client-ui-main-missionpack-state-shutdown-shutdown-src-mq3-client-ui-main-missionpack-ml-217089986"></a>
### shutdown

```ml
shutdown
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L85)

<a id="field-field-mq3-client-ui-main-missionpack-state-sortdir-sortdir-src-mq3-client-ui-main-missionpack-ml-2045818554"></a>
### sortDir

```ml
sortDir
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L89)

<a id="field-field-mq3-client-ui-main-missionpack-state-sortkey-sortkey-src-mq3-client-ui-main-missionpack-ml-1774559906"></a>
### sortKey

```ml
sortKey
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L89)

<a id="field-field-mq3-client-ui-main-missionpack-state-teamnames-teamnames-src-mq3-client-ui-main-missionpack-ml-1246457582"></a>
### teamNames

```ml
teamNames
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L87)

<a id="field-field-mq3-client-ui-main-missionpack-state-teams-teams-src-mq3-client-ui-main-missionpack-ml-2074694706"></a>
### teams

```ml
teams
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L86)
