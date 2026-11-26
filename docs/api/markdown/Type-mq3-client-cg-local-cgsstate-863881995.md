# `mq3.client.cg_local.CgsState`

[Home](README.md) · [Source file](File-src-mq3-client-cg-local-ml-909335699.md)

<a id="struct-struct-mq3-client-cg-local-cgsstate-struct-cgsstate-src-mq3-client-cg-local-ml-638585231"></a>
## CgsState

```ml
struct CgsState
```

Stores client game local cgs state record, including `gameState`, `glconfig`, `screenXScale`, `screenYScale`, `screenXBias`, `serverCommandSequence` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1323)

## Members

<a id="field-field-mq3-client-cg-local-cgsstate-acceptleader-acceptleader-src-mq3-client-cg-local-ml-1573481997"></a>
### acceptLeader

```ml
acceptLeader
```

Compatibility member corresponding to native `cgs_t.acceptLeader`; the original declaration is `int acceptLeader`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1468)

<a id="field-field-mq3-client-cg-local-cgsstate-acceptordertime-acceptordertime-src-mq3-client-cg-local-ml-40048207"></a>
### acceptOrderTime

```ml
acceptOrderTime
```

Compatibility member corresponding to native `cgs_t.acceptOrderTime`; the original declaration is `int acceptOrderTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1462)

<a id="field-field-mq3-client-cg-local-cgsstate-accepttask-accepttask-src-mq3-client-cg-local-ml-490193245"></a>
### acceptTask

```ml
acceptTask
```

Compatibility member corresponding to native `cgs_t.acceptTask`; the original declaration is `int acceptTask`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1465)

<a id="field-field-mq3-client-cg-local-cgsstate-acceptvoice-acceptvoice-src-mq3-client-cg-local-ml-2041588739"></a>
### acceptVoice

```ml
acceptVoice
```

Compatibility member corresponding to native `cgs_t.acceptVoice`; the original declaration is `char acceptVoice[MAX_NAME_LENGTH]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1471)

<a id="field-field-mq3-client-cg-local-cgsstate-activecursor-activecursor-src-mq3-client-cg-local-ml-513786243"></a>
### activeCursor

```ml
activeCursor
```

Renderer resource handle used for active cursor; mirrors native `cgs_t.activeCursor`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1448)

<a id="field-field-mq3-client-cg-local-cgsstate-blueflag-blueflag-src-mq3-client-cg-local-ml-2106344411"></a>
### blueflag

```ml
blueflag
```

Blue-flag status received through server configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1404)

<a id="field-field-mq3-client-cg-local-cgsstate-blueteam-blueteam-src-mq3-client-cg-local-ml-1381333181"></a>
### blueTeam

```ml
blueTeam
```

Compatibility member corresponding to native `cgs_t.blueTeam`; the original declaration is `char blueTeam[MAX_QPATH]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1366)

<a id="field-field-mq3-client-cg-local-cgsstate-captureditem-captureditem-src-mq3-client-cg-local-ml-324629657"></a>
### capturedItem

```ml
capturedItem
```

Compatibility member corresponding to native `cgs_t.capturedItem`; the original declaration is `void *capturedItem`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1446)

<a id="field-field-mq3-client-cg-local-cgsstate-capturelimit-capturelimit-src-mq3-client-cg-local-ml-584374857"></a>
### capturelimit

```ml
capturelimit
```

Capture or objective-score limit parsed from the server's game information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1352)

<a id="field-field-mq3-client-cg-local-cgsstate-clientinfo-clientinfo-src-mq3-client-cg-local-ml-121057257"></a>
### clientinfo

```ml
clientinfo
```

Compatibility member corresponding to native `cgs_t.clientinfo`; the original declaration is `clientInfo_t clientinfo[MAX_CLIENTS]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1423)

<a id="field-field-mq3-client-cg-local-cgsstate-currentorder-currentorder-src-mq3-client-cg-local-ml-1033135945"></a>
### currentOrder

```ml
currentOrder
```

Team-order identifier currently selected for issuing to a teammate.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1450)

<a id="field-field-mq3-client-cg-local-cgsstate-currentvoiceclient-currentvoiceclient-src-mq3-client-cg-local-ml-537289147"></a>
### currentVoiceClient

```ml
currentVoiceClient
```

Compatibility member corresponding to native `cgs_t.currentVoiceClient`; the original declaration is `int currentVoiceClient`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1459)

<a id="field-field-mq3-client-cg-local-cgsstate-cursorx-cursorx-src-mq3-client-cg-local-ml-1757998851"></a>
### cursorX

```ml
cursorX
```

Horizontal position of the pointer in the local display coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1433)

<a id="field-field-mq3-client-cg-local-cgsstate-cursory-cursory-src-mq3-client-cg-local-ml-550129287"></a>
### cursorY

```ml
cursorY
```

Vertical position of the pointer in the local display coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1435)

<a id="field-field-mq3-client-cg-local-cgsstate-dmflags-dmflags-src-mq3-client-cg-local-ml-471285603"></a>
### dmflags

```ml
dmflags
```

Compatibility member corresponding to native `cgs_t.dmflags`; the original declaration is `int dmflags`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1344)

<a id="field-field-mq3-client-cg-local-cgsstate-eventhandling-eventhandling-src-mq3-client-cg-local-ml-1643906127"></a>
### eventHandling

```ml
eventHandling
```

Compatibility member corresponding to native `cgs_t.eventHandling`; the original declaration is `qboolean eventHandling`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1438)

<a id="field-field-mq3-client-cg-local-cgsstate-flagstatus-flagstatus-src-mq3-client-cg-local-ml-515418515"></a>
### flagStatus

```ml
flagStatus
```

Current flag-objective state used by capture-the-flag presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1406)

<a id="field-field-mq3-client-cg-local-cgsstate-fraglimit-fraglimit-src-mq3-client-cg-local-ml-1275906503"></a>
### fraglimit

```ml
fraglimit
```

Compatibility member corresponding to native `cgs_t.fraglimit`; the original declaration is `int fraglimit`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1350)

<a id="field-field-mq3-client-cg-local-cgsstate-gamemodels-gamemodels-src-mq3-client-cg-local-ml-1553735539"></a>
### gameModels

```ml
gameModels
```

Model resources derived from the server's model configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1411)

<a id="field-field-mq3-client-cg-local-cgsstate-gamesounds-gamesounds-src-mq3-client-cg-local-ml-1831487651"></a>
### gameSounds

```ml
gameSounds
```

Sound resources derived from the server's sound configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1413)

<a id="field-field-mq3-client-cg-local-cgsstate-gamestate-gamestate-src-mq3-client-cg-local-ml-121751727"></a>
### gameState

```ml
gameState
```

Server configuration strings and associated game-state storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1325)

<a id="field-field-mq3-client-cg-local-cgsstate-gametype-gametype-src-mq3-client-cg-local-ml-1320231267"></a>
### gametype

```ml
gametype
```

Server game-rule identifier mirrored in the native-compatible global client-game state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1341)

<a id="field-field-mq3-client-cg-local-cgsstate-glconfig-glconfig-src-mq3-client-cg-local-ml-48655657"></a>
### glconfig

```ml
glconfig
```

Renderer configuration reported by the engine for the current display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1327)

<a id="field-field-mq3-client-cg-local-cgsstate-inlinedrawmodel-inlinedrawmodel-src-mq3-client-cg-local-ml-1336618295"></a>
### inlineDrawModel

```ml
inlineDrawModel
```

Model resource selected for the inline draw presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1417)

<a id="field-field-mq3-client-cg-local-cgsstate-inlinemodelmidpoints-inlinemodelmidpoints-src-mq3-client-cg-local-ml-1784650457"></a>
### inlineModelMidpoints

```ml
inlineModelMidpoints
```

Compatibility member corresponding to native `cgs_t.inlineModelMidpoints`; the original declaration is `vec3_t inlineModelMidpoints[MAX_MODELS]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1420)

<a id="field-field-mq3-client-cg-local-cgsstate-levelstarttime-levelstarttime-src-mq3-client-cg-local-ml-1321789765"></a>
### levelStartTime

```ml
levelStartTime
```

Server timestamp at which the level began, used by elapsed-match-time displays.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1396)

<a id="field-field-mq3-client-cg-local-cgsstate-localserver-localserver-src-mq3-client-cg-local-ml-12938451"></a>
### localServer

```ml
localServer
```

True when CGame detected a local server at startup through the engine configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1339)

<a id="field-field-mq3-client-cg-local-cgsstate-mapname-mapname-src-mq3-client-cg-local-ml-219062859"></a>
### mapname

```ml
mapname
```

Map name parsed from server information or selected by the client UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1360)

<a id="field-field-mq3-client-cg-local-cgsstate-maxclients-maxclients-src-mq3-client-cg-local-ml-553698475"></a>
### maxclients

```ml
maxclients
```

Compatibility member corresponding to native `cgs_t.maxclients`; the original declaration is `int maxclients`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1358)

<a id="field-field-mq3-client-cg-local-cgsstate-media-media-src-mq3-client-cg-local-ml-1759295875"></a>
### media

```ml
media
```

Registered renderer and sound resources shared by the client-game presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1473)

<a id="field-field-mq3-client-cg-local-cgsstate-mousecaptured-mousecaptured-src-mq3-client-cg-local-ml-1448316559"></a>
### mouseCaptured

```ml
mouseCaptured
```

True while CGame captures pointer input for its interactive HUD or menu operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1440)

<a id="field-field-mq3-client-cg-local-cgsstate-newhud-newhud-src-mq3-client-cg-local-ml-137814165"></a>
### newHud

```ml
newHud
```

Compatibility member corresponding to native `cgs_t.newHud`; the original declaration is `qboolean newHud`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1409)

<a id="field-field-mq3-client-cg-local-cgsstate-numinlinemodels-numinlinemodels-src-mq3-client-cg-local-ml-1309567531"></a>
### numInlineModels

```ml
numInlineModels
```

Model resources selected for the num inline presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1415)

<a id="field-field-mq3-client-cg-local-cgsstate-orderpending-orderpending-src-mq3-client-cg-local-ml-1808980769"></a>
### orderPending

```ml
orderPending
```

Compatibility member corresponding to native `cgs_t.orderPending`; the original declaration is `qboolean orderPending`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1453)

<a id="field-field-mq3-client-cg-local-cgsstate-ordertime-ordertime-src-mq3-client-cg-local-ml-1439655315"></a>
### orderTime

```ml
orderTime
```

Compatibility member corresponding to native `cgs_t.orderTime`; the original declaration is `int orderTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1456)

<a id="field-field-mq3-client-cg-local-cgsstate-processedsnapshotnum-processedsnapshotnum-src-mq3-client-cg-local-ml-1835654595"></a>
### processedSnapshotNum

```ml
processedSnapshotNum
```

Highest snapshot sequence already requested or processed by CGame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1337)

<a id="field-field-mq3-client-cg-local-cgsstate-redflag-redflag-src-mq3-client-cg-local-ml-2042311603"></a>
### redflag

```ml
redflag
```

Red-flag status received through server configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1402)

<a id="field-field-mq3-client-cg-local-cgsstate-redteam-redteam-src-mq3-client-cg-local-ml-1201288227"></a>
### redTeam

```ml
redTeam
```

Compatibility member corresponding to native `cgs_t.redTeam`; the original declaration is `char redTeam[MAX_QPATH]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1363)

<a id="field-field-mq3-client-cg-local-cgsstate-scores1-scores1-src-mq3-client-cg-local-ml-943604299"></a>
### scores1

```ml
scores1
```

First team or leading player's score received through server configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1398)

<a id="field-field-mq3-client-cg-local-cgsstate-scores2-scores2-src-mq3-client-cg-local-ml-111551459"></a>
### scores2

```ml
scores2
```

Second team or trailing player's score received through server configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1400)

<a id="field-field-mq3-client-cg-local-cgsstate-screenxbias-screenxbias-src-mq3-client-cg-local-ml-1918924559"></a>
### screenXBias

```ml
screenXBias
```

Horizontal centering offset used when the actual display is wider than the virtual UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1333)

<a id="field-field-mq3-client-cg-local-cgsstate-screenxscale-screenxscale-src-mq3-client-cg-local-ml-867072007"></a>
### screenXScale

```ml
screenXScale
```

Horizontal virtual-screen scaling factor derived from the renderer configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1329)

<a id="field-field-mq3-client-cg-local-cgsstate-screenyscale-screenyscale-src-mq3-client-cg-local-ml-711912321"></a>
### screenYScale

```ml
screenYScale
```

Vertical virtual-screen scaling factor derived from the renderer configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1331)

<a id="field-field-mq3-client-cg-local-cgsstate-servercommandsequence-servercommandsequence-src-mq3-client-cg-local-ml-34330883"></a>
### serverCommandSequence

```ml
serverCommandSequence
```

Last reliable server-command sequence tracked by the shared client-game static state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1335)

<a id="field-field-mq3-client-cg-local-cgsstate-sizinghud-sizinghud-src-mq3-client-cg-local-ml-640712995"></a>
### sizingHud

```ml
sizingHud
```

Compatibility member corresponding to native `cgs_t.sizingHud`; the original declaration is `qboolean sizingHud`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1443)

<a id="field-field-mq3-client-cg-local-cgsstate-teamchatmsgs-teamchatmsgs-src-mq3-client-cg-local-ml-1392017429"></a>
### teamChatMsgs

```ml
teamChatMsgs
```

Color-coded team-chat lines retained in the bounded team-chat history.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1425)

<a id="field-field-mq3-client-cg-local-cgsstate-teamchatmsgtimes-teamchatmsgtimes-src-mq3-client-cg-local-ml-1932150327"></a>
### teamChatMsgTimes

```ml
teamChatMsgTimes
```

Arrival timestamps corresponding to the stored team-chat lines.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1427)

<a id="field-field-mq3-client-cg-local-cgsstate-teamchatpos-teamchatpos-src-mq3-client-cg-local-ml-920970499"></a>
### teamChatPos

```ml
teamChatPos
```

Next write position in the team-chat history ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1429)

<a id="field-field-mq3-client-cg-local-cgsstate-teamflags-teamflags-src-mq3-client-cg-local-ml-1831628775"></a>
### teamflags

```ml
teamflags
```

Compatibility member corresponding to native `cgs_t.teamflags`; the original declaration is `int teamflags`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1347)

<a id="field-field-mq3-client-cg-local-cgsstate-teamlastchatpos-teamlastchatpos-src-mq3-client-cg-local-ml-1037605059"></a>
### teamLastChatPos

```ml
teamLastChatPos
```

Oldest team-chat history position still eligible for display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1431)

<a id="field-field-mq3-client-cg-local-cgsstate-teamvotemodified-teamvotemodified-src-mq3-client-cg-local-ml-1352753559"></a>
### teamVoteModified

```ml
teamVoteModified
```

Per-team indicators that team-vote information changed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1391)

<a id="field-field-mq3-client-cg-local-cgsstate-teamvoteno-teamvoteno-src-mq3-client-cg-local-ml-735481887"></a>
### teamVoteNo

```ml
teamVoteNo
```

Compatibility member corresponding to native `cgs_t.teamVoteNo`; the original declaration is `int teamVoteNo[2]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1389)

<a id="field-field-mq3-client-cg-local-cgsstate-teamvotestring-teamvotestring-src-mq3-client-cg-local-ml-913904611"></a>
### teamVoteString

```ml
teamVoteString
```

Compatibility member corresponding to native `cgs_t.teamVoteString`; the original declaration is `char teamVoteString[2][MAX_STRING_TOKENS]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1394)

<a id="field-field-mq3-client-cg-local-cgsstate-teamvotetime-teamvotetime-src-mq3-client-cg-local-ml-1661454387"></a>
### teamVoteTime

```ml
teamVoteTime
```

Compatibility member corresponding to native `cgs_t.teamVoteTime`; the original declaration is `int teamVoteTime[2]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1383)

<a id="field-field-mq3-client-cg-local-cgsstate-teamvoteyes-teamvoteyes-src-mq3-client-cg-local-ml-1368692855"></a>
### teamVoteYes

```ml
teamVoteYes
```

Compatibility member corresponding to native `cgs_t.teamVoteYes`; the original declaration is `int teamVoteYes[2]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1386)

<a id="field-field-mq3-client-cg-local-cgsstate-timelimit-timelimit-src-mq3-client-cg-local-ml-1941187947"></a>
### timelimit

```ml
timelimit
```

Compatibility member corresponding to native `cgs_t.timelimit`; the original declaration is `int timelimit`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1355)

<a id="field-field-mq3-client-cg-local-cgsstate-votemodified-votemodified-src-mq3-client-cg-local-ml-908830397"></a>
### voteModified

```ml
voteModified
```

True when vote information changed and the UI should refresh or play feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1377)

<a id="field-field-mq3-client-cg-local-cgsstate-voteno-voteno-src-mq3-client-cg-local-ml-173178469"></a>
### voteNo

```ml
voteNo
```

Compatibility member corresponding to native `cgs_t.voteNo`; the original declaration is `int voteNo`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1375)

<a id="field-field-mq3-client-cg-local-cgsstate-votestring-votestring-src-mq3-client-cg-local-ml-2054603717"></a>
### voteString

```ml
voteString
```

Compatibility member corresponding to native `cgs_t.voteString`; the original declaration is `char voteString[MAX_STRING_TOKENS]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1380)

<a id="field-field-mq3-client-cg-local-cgsstate-votetime-votetime-src-mq3-client-cg-local-ml-1947372017"></a>
### voteTime

```ml
voteTime
```

Compatibility member corresponding to native `cgs_t.voteTime`; the original declaration is `int voteTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1369)

<a id="field-field-mq3-client-cg-local-cgsstate-voteyes-voteyes-src-mq3-client-cg-local-ml-720151459"></a>
### voteYes

```ml
voteYes
```

Compatibility member corresponding to native `cgs_t.voteYes`; the original declaration is `int voteYes`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L1372)
