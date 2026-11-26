# `mq3.client.cgame_main.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-main-ml-1652783738.md)

<a id="struct-struct-mq3-client-cgame-main-state-struct-state-src-mq3-client-cgame-main-ml-2130908677"></a>
## State

```ml
struct State
```

Stores client game main state, including `initialized`, `loading`, `clientNum`, `processedSnapshotNum`, `serverCommandSequence`, `weaponSelect` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L214)

## Members

<a id="field-field-mq3-client-cgame-main-state-attackernum-attackernum-src-mq3-client-cgame-main-ml-84891618"></a>
### attackerNum

```ml
attackerNum
```

When constructing this record, `create` supplies `-1` for this member. Used by `lastAttacker` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L254)

<a id="field-field-mq3-client-cgame-main-state-attackertime-attackertime-src-mq3-client-cgame-main-ml-292426882"></a>
### attackerTime

```ml
attackerTime
```

Timestamp used to time the latest attacker's HUD indication.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L251)

<a id="field-field-mq3-client-cgame-main-state-blueflag-blueflag-src-mq3-client-cgame-main-ml-1477971250"></a>
### blueflag

```ml
blueflag
```

Blue-flag status received through server configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L231)

<a id="field-field-mq3-client-cgame-main-state-clientnum-clientnum-src-mq3-client-cgame-main-ml-1357645326"></a>
### clientNum

```ml
clientNum
```

Local client slot supplied when initializing the client-game state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L221)

<a id="field-field-mq3-client-cgame-main-state-clients-clients-src-mq3-client-cgame-main-ml-608829694"></a>
### clients

```ml
clients
```

Client-information records retained by the client-game state, indexed by player slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L266)

<a id="field-field-mq3-client-cgame-main-state-configstrings-configstrings-src-mq3-client-cgame-main-ml-1637660994"></a>
### configstrings

```ml
configstrings
```

Server configuration strings indexed by the native protocol's configuration-string identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L264)

<a id="field-field-mq3-client-cgame-main-state-crosshairclientnum-crosshairclientnum-src-mq3-client-cgame-main-ml-1001273180"></a>
### crosshairClientNum

```ml
crosshairClientNum
```

Client slot most recently identified under the crosshair.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L249)

<a id="field-field-mq3-client-cgame-main-state-crosshairclienttime-crosshairclienttime-src-mq3-client-cgame-main-ml-766893066"></a>
### crosshairClientTime

```ml
crosshairClientTime
```

Timestamp of the last valid crosshair-player identification.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L247)

<a id="field-field-mq3-client-cgame-main-state-cursorx-cursorx-src-mq3-client-cgame-main-ml-114158858"></a>
### cursorX

```ml
cursorX
```

Horizontal position of the pointer in the local display coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L297)

<a id="field-field-mq3-client-cgame-main-state-cursory-cursory-src-mq3-client-cgame-main-ml-822002582"></a>
### cursorY

```ml
cursorY
```

Vertical position of the pointer in the local display coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L299)

<a id="field-field-mq3-client-cgame-main-state-cvars-cvars-src-mq3-client-cgame-main-ml-779397622"></a>
### cvars

```ml
cvars
```

Configuration-variable values exposed to the native UI implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L262)

<a id="field-field-mq3-client-cgame-main-state-drawteamoverlaymodificationcount-drawteamoverlaymodificationcount-src-mq3-client-cgame-main-ml-1404546042"></a>
### drawTeamOverlayModificationCount

```ml
drawTeamOverlayModificationCount
```

When constructing this record, `create` supplies `-1` for this member. Used by `updateCvars` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L260)

<a id="field-field-mq3-client-cgame-main-state-eventtype-eventtype-src-mq3-client-cgame-main-ml-12608058"></a>
### eventType

```ml
eventType
```

When constructing this record, `create` supplies `0` for this member. Used by `eventHandling` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L295)

<a id="field-field-mq3-client-cgame-main-state-flagstatus-flagstatus-src-mq3-client-cgame-main-ml-134507098"></a>
### flagStatus

```ml
flagStatus
```

Current flag-objective state used by capture-the-flag presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L233)

<a id="field-field-mq3-client-cgame-main-state-forcemodelmodificationcount-forcemodelmodificationcount-src-mq3-client-cgame-main-ml-642659966"></a>
### forceModelModificationCount

```ml
forceModelModificationCount
```

When constructing this record, `create` supplies `-1` for this member. Used by `registerCvars` and `updateCvars` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L257)

<a id="field-field-mq3-client-cgame-main-state-gametype-gametype-src-mq3-client-cgame-main-ml-204738794"></a>
### gametype

```ml
gametype
```

Game-rule identifier used to organize scoreboard feeders and interpret player score rows.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L237)

<a id="field-field-mq3-client-cgame-main-state-gameversion-gameversion-src-mq3-client-cgame-main-ml-1226418634"></a>
### gameVersion

```ml
gameVersion
```

When constructing this record, `create` supplies `"baseq3-1"` for this member. Used by `init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L283)

<a id="field-field-mq3-client-cgame-main-state-hudassets-hudassets-src-mq3-client-cgame-main-ml-2018169686"></a>
### hudAssets

```ml
hudAssets
```

When constructing this record, `create` supplies `hudAssets()` for this member. Used by `assetParse` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L289)

<a id="field-field-mq3-client-cgame-main-state-hudfile-hudfile-src-mq3-client-cgame-main-ml-627274266"></a>
### hudFile

```ml
hudFile
```

When constructing this record, `create` supplies `"ui/hud.txt"` for this member. Used by `loadHudMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L286)

<a id="field-field-mq3-client-cgame-main-state-infoscreentext-infoscreentext-src-mq3-client-cgame-main-ml-1978349300"></a>
### infoScreenText

```ml
infoScreenText
```

Status text displayed while connecting, loading, or waiting for a game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L280)

<a id="field-field-mq3-client-cgame-main-state-initialized-initialized-src-mq3-client-cgame-main-ml-656721194"></a>
### initialized

```ml
initialized
```

True between CGame initialization and shutdown, while the game module owns its loaded client state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L217)

<a id="field-field-mq3-client-cgame-main-state-levelstarttime-levelstarttime-src-mq3-client-cgame-main-ml-1279205232"></a>
### levelStartTime

```ml
levelStartTime
```

Server timestamp at which the level began, used by elapsed-match-time displays.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L235)

<a id="field-field-mq3-client-cgame-main-state-loading-loading-src-mq3-client-cgame-main-ml-1756253126"></a>
### loading

```ml
loading
```

True while initial game media and client information are being loaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L219)

<a id="field-field-mq3-client-cgame-main-state-mapname-mapname-src-mq3-client-cgame-main-ml-364227042"></a>
### mapname

```ml
mapname
```

Map name parsed from server information or selected by the client UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L239)

<a id="field-field-mq3-client-cgame-main-state-menufiles-menufiles-src-mq3-client-cgame-main-ml-195915242"></a>
### menuFiles

```ml
menuFiles
```

When constructing this record, `create` supplies an empty list for this member. Used by `parseMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L292)

<a id="field-field-mq3-client-cgame-main-state-nextcinematichandle-nextcinematichandle-src-mq3-client-cgame-main-ml-962450254"></a>
### nextCinematicHandle

```ml
nextCinematicHandle
```

When constructing this record, `create` supplies `1` for this member. Used by `playCinematic` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L302)

<a id="field-field-mq3-client-cgame-main-state-numscores-numscores-src-mq3-client-cgame-main-ml-192536558"></a>
### numScores

```ml
numScores
```

Number of valid scoreboard entries received from the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L270)

<a id="field-field-mq3-client-cgame-main-state-processedsnapshotnum-processedsnapshotnum-src-mq3-client-cgame-main-ml-984287690"></a>
### processedSnapshotNum

```ml
processedSnapshotNum
```

Highest snapshot sequence already requested or processed by CGame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L223)

<a id="field-field-mq3-client-cgame-main-state-redflag-redflag-src-mq3-client-cgame-main-ml-883780474"></a>
### redflag

```ml
redflag
```

Red-flag status received through server configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L229)

<a id="field-field-mq3-client-cgame-main-state-scores-scores-src-mq3-client-cgame-main-ml-588100056"></a>
### scores

```ml
scores
```

Scoreboard entries received from the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L268)

<a id="field-field-mq3-client-cgame-main-state-screenxscale-screenxscale-src-mq3-client-cgame-main-ml-688170902"></a>
### screenXScale

```ml
screenXScale
```

Horizontal virtual-screen scaling factor derived from the renderer configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L241)

<a id="field-field-mq3-client-cgame-main-state-screenyscale-screenyscale-src-mq3-client-cgame-main-ml-1803164580"></a>
### screenYScale

```ml
screenYScale
```

Vertical virtual-screen scaling factor derived from the renderer configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L243)

<a id="field-field-mq3-client-cgame-main-state-selectedscore-selectedscore-src-mq3-client-cgame-main-ml-99563474"></a>
### selectedScore

```ml
selectedScore
```

Index of the scoreboard entry currently selected in the UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L272)

<a id="field-field-mq3-client-cgame-main-state-servercommandsequence-servercommandsequence-src-mq3-client-cgame-main-ml-1785766794"></a>
### serverCommandSequence

```ml
serverCommandSequence
```

Initial reliable server-command sequence supplied when the client-game module is initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L225)

<a id="field-field-mq3-client-cgame-main-state-spectatorlen-spectatorlen-src-mq3-client-cgame-main-ml-916359218"></a>
### spectatorLen

```ml
spectatorLen
```

Number of characters in the concatenated spectator-name banner.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L276)

<a id="field-field-mq3-client-cgame-main-state-spectatorlist-spectatorlist-src-mq3-client-cgame-main-ml-1808981026"></a>
### spectatorList

```ml
spectatorList
```

Concatenated spectator display names used by the scrolling scoreboard banner.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L274)

<a id="field-field-mq3-client-cgame-main-state-spectatorwidth-spectatorwidth-src-mq3-client-cgame-main-ml-280676976"></a>
### spectatorWidth

```ml
spectatorWidth
```

Rendered width of the spectator-name banner in display coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L278)

<a id="field-field-mq3-client-cgame-main-state-time-time-src-mq3-client-cgame-main-ml-445084984"></a>
### time

```ml
time
```

Current client-game frame time in milliseconds retained by the main runtime state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L245)

<a id="field-field-mq3-client-cgame-main-state-weaponselect-weaponselect-src-mq3-client-cgame-main-ml-289874922"></a>
### weaponSelect

```ml
weaponSelect
```

Weapon identifier currently selected by the local player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L227)
