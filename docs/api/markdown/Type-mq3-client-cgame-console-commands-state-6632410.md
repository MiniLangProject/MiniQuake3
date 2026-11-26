# `mq3.client.cgame_console_commands.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-console-commands-ml-1236537113.md)

<a id="struct-struct-mq3-client-cgame-console-commands-state-struct-state-src-mq3-client-cgame-console-commands-ml-1508424595"></a>
## State

```ml
struct State
```

Stores client game console commands state, including `scoresRequestTime`, `showScores`, `numScores`, `scoreFadeTime`, `currentOrder`, `orderPending` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L37)

## Members

<a id="field-field-mq3-client-cgame-console-commands-state-acceptleader-acceptleader-src-mq3-client-cgame-console-commands-ml-826769344"></a>
### acceptLeader

```ml
acceptLeader
```

When constructing this record, `create` supplies `0` for this member. Used by `confirmOrder` and `denyOrder` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L56)

<a id="field-field-mq3-client-cgame-console-commands-state-acceptordertime-acceptordertime-src-mq3-client-cgame-console-commands-ml-750517862"></a>
### acceptOrderTime

```ml
acceptOrderTime
```

When constructing this record, `create` supplies `0` for this member. Used by `confirmOrder` and `denyOrder` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L62)

<a id="field-field-mq3-client-cgame-console-commands-state-accepttask-accepttask-src-mq3-client-cgame-console-commands-ml-1946845300"></a>
### acceptTask

```ml
acceptTask
```

When constructing this record, `create` supplies `0` for this member. Used by `confirmOrder` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L59)

<a id="field-field-mq3-client-cgame-console-commands-state-cameraorbit-cameraorbit-src-mq3-client-cgame-console-commands-ml-615399722"></a>
### cameraOrbit

```ml
cameraOrbit
```

When constructing this record, `create` supplies `0.0` for this member. Used by `startOrbitState` and `syncVmCvars` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L93)

<a id="field-field-mq3-client-cgame-console-commands-state-currentorder-currentorder-src-mq3-client-cgame-console-commands-ml-1312294300"></a>
### currentOrder

```ml
currentOrder
```

Team-order identifier currently selected for issuing to a teammate.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L47)

<a id="field-field-mq3-client-cgame-console-commands-state-gametype-gametype-src-mq3-client-cgame-console-commands-ml-31642514"></a>
### gametype

```ml
gametype
```

Active game-rule identifier used to choose the meaning of team offense commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L75)

<a id="field-field-mq3-client-cgame-console-commands-state-hudfile-hudfile-src-mq3-client-cgame-console-commands-ml-2101328058"></a>
### hudFile

```ml
hudFile
```

When constructing this record, `create` supplies `"ui/hud.txt"` for this member. Used by `loadHud` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L87)

<a id="field-field-mq3-client-cgame-console-commands-state-numscores-numscores-src-mq3-client-cgame-console-commands-ml-652712174"></a>
### numScores

```ml
numScores
```

Number of valid scoreboard entries received from the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L43)

<a id="field-field-mq3-client-cgame-console-commands-state-orderpending-orderpending-src-mq3-client-cgame-console-commands-ml-1516673056"></a>
### orderPending

```ml
orderPending
```

When constructing this record, `create` supplies `false` for this member. Used by `nextOrder` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L50)

<a id="field-field-mq3-client-cgame-console-commands-state-ordertime-ordertime-src-mq3-client-cgame-console-commands-ml-1721304034"></a>
### orderTime

```ml
orderTime
```

When constructing this record, `create` supplies `0` for this member. Used by `nextOrder` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L53)

<a id="field-field-mq3-client-cgame-console-commands-state-otherteamhasflag-otherteamhasflag-src-mq3-client-cgame-console-commands-ml-348689772"></a>
### otherTeamHasFlag

```ml
otherTeamHasFlag
```

When constructing this record, `create` supplies `false` for this member. Used by `nextOrder` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L78)

<a id="field-field-mq3-client-cgame-console-commands-state-scoreboardshowing-scoreboardshowing-src-mq3-client-cgame-console-commands-ml-274617022"></a>
### scoreboardShowing

```ml
scoreboardShowing
```

When constructing this record, `create` supplies `false` for this member. Used by `scrollScores` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L84)

<a id="field-field-mq3-client-cgame-console-commands-state-scorefadetime-scorefadetime-src-mq3-client-cgame-console-commands-ml-4305922"></a>
### scoreFadeTime

```ml
scoreFadeTime
```

Timestamp used to fade the scoreboard after its display request ends.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L45)

<a id="field-field-mq3-client-cgame-console-commands-state-scoresrequesttime-scoresrequesttime-src-mq3-client-cgame-console-commands-ml-1898667854"></a>
### scoresRequestTime

```ml
scoresRequestTime
```

Timestamp of the most recent request for updated server scores.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L39)

<a id="field-field-mq3-client-cgame-console-commands-state-selectedisself-selectedisself-src-mq3-client-cgame-console-commands-ml-151114036"></a>
### selectedIsSelf

```ml
selectedIsSelf
```

When constructing this record, `create` supplies `true` for this member. Used by `nextOrder` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L73)

<a id="field-field-mq3-client-cgame-console-commands-state-selectedplayer-selectedplayer-src-mq3-client-cgame-console-commands-ml-1733369250"></a>
### selectedPlayer

```ml
selectedPlayer
```

When constructing this record, `create` supplies `0` for this member. Used by `nextTeamMember` and `prevTeamMember` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L65)

<a id="field-field-mq3-client-cgame-console-commands-state-showscores-showscores-src-mq3-client-cgame-console-commands-ml-1220568746"></a>
### showScores

```ml
showScores
```

True while the player explicitly requests the scoreboard overlay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L41)

<a id="field-field-mq3-client-cgame-console-commands-state-teamleader-teamleader-src-mq3-client-cgame-console-commands-ml-1172555914"></a>
### teamLeader

```ml
teamLeader
```

True when this client is the designated leader of its team.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L70)

<a id="field-field-mq3-client-cgame-console-commands-state-teamplayercount-teamplayercount-src-mq3-client-cgame-console-commands-ml-758562378"></a>
### teamPlayerCount

```ml
teamPlayerCount
```

When constructing this record, `create` supplies `0` for this member. Used by `nextTeamMember` and `prevTeamMember` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L68)

<a id="field-field-mq3-client-cgame-console-commands-state-viewsize-viewsize-src-mq3-client-cgame-console-commands-ml-1585397094"></a>
### viewsize

```ml
viewsize
```

When constructing this record, `create` supplies `100` for this member. Used by `sizeUpState` and `sizeDownState` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L90)

<a id="field-field-mq3-client-cgame-console-commands-state-yourteamhasflag-yourteamhasflag-src-mq3-client-cgame-console-commands-ml-822019358"></a>
### yourTeamHasFlag

```ml
yourTeamHasFlag
```

When constructing this record, `create` supplies `false` for this member. Used by `nextOrder` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_console_commands.ml#L81)
