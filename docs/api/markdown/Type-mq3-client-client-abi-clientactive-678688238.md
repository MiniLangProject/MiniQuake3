# `mq3.client.client_abi.ClientActive`

[Home](README.md) · [Source file](File-src-mq3-client-client-abi-ml-362324391.md)

<a id="struct-struct-mq3-client-client-abi-clientactive-struct-clientactive-src-mq3-client-client-abi-ml-43582055"></a>
## ClientActive

```ml
struct ClientActive
```

Stores client ABI client active record, including `timeoutcount`, `snap`, `serverTime`, `oldServerTime`, `oldFrameServerTime`, `serverTimeDelta` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L46)

## Members

<a id="field-field-mq3-client-client-abi-clientactive-cgamesensitivity-cgamesensitivity-src-mq3-client-client-abi-ml-1565845408"></a>
### cgameSensitivity

```ml
cgameSensitivity
```

Compatibility member corresponding to native `clientActive_t.cgameSensitivity`; the original declaration is `float cgameSensitivity`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L82)

<a id="field-field-mq3-client-client-abi-clientactive-cgameusercmdvalue-cgameusercmdvalue-src-mq3-client-client-abi-ml-1885692728"></a>
### cgameUserCmdValue

```ml
cgameUserCmdValue
```

Weapon-selection value supplied by CGame for inclusion in outgoing user commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L79)

<a id="field-field-mq3-client-client-abi-clientactive-cmdnumber-cmdnumber-src-mq3-client-client-abi-ml-1995040284"></a>
### cmdNumber

```ml
cmdNumber
```

Monotonically advancing user-command sequence number for the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L86)

<a id="field-field-mq3-client-client-abi-clientactive-cmds-cmds-src-mq3-client-client-abi-ml-762609082"></a>
### cmds

```ml
cmds
```

Ring of recent user commands retained so outgoing packets can resend earlier input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L84)

<a id="field-field-mq3-client-client-abi-clientactive-entitybaselines-entitybaselines-src-mq3-client-client-abi-ml-970727376"></a>
### entityBaselines

```ml
entityBaselines
```

Baseline entity states used when delta decoding has no previous snapshot state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L96)

<a id="field-field-mq3-client-client-abi-clientactive-extrapolatedsnapshot-extrapolatedsnapshot-src-mq3-client-client-abi-ml-885728774"></a>
### extrapolatedSnapshot

```ml
extrapolatedSnapshot
```

True when a CGame frame had to extrapolate beyond the newest available snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L60)

<a id="field-field-mq3-client-client-abi-clientactive-gamestate-gamestate-src-mq3-client-client-abi-ml-466482780"></a>
### gameState

```ml
gameState
```

Server configuration strings and associated game-state storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L64)

<a id="field-field-mq3-client-client-abi-clientactive-joystickaxis-joystickaxis-src-mq3-client-client-abi-ml-441179974"></a>
### joystickAxis

```ml
joystickAxis
```

Latest sampled joystick-axis values used by user-command generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L77)

<a id="field-field-mq3-client-client-abi-clientactive-mapname-mapname-src-mq3-client-client-abi-ml-1780850344"></a>
### mapname

```ml
mapname
```

Map name parsed from server information or selected by the client UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L66)

<a id="field-field-mq3-client-client-abi-clientactive-mousedx-mousedx-src-mq3-client-client-abi-ml-1157978556"></a>
### mouseDx

```ml
mouseDx
```

Buffered horizontal mouse movement awaiting user-command generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L70)

<a id="field-field-mq3-client-client-abi-clientactive-mousedy-mousedy-src-mq3-client-client-abi-ml-406087448"></a>
### mouseDy

```ml
mouseDy
```

Buffered vertical mouse movement awaiting user-command generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L72)

<a id="field-field-mq3-client-client-abi-clientactive-mouseindex-mouseindex-src-mq3-client-client-abi-ml-1801929522"></a>
### mouseIndex

```ml
mouseIndex
```

Compatibility member corresponding to native `clientActive_t.mouseIndex`; the original declaration is `int mouseIndex`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L75)

<a id="field-field-mq3-client-client-abi-clientactive-newsnapshots-newsnapshots-src-mq3-client-client-abi-ml-1765492182"></a>
### newSnapshots

```ml
newSnapshots
```

True after parsing a new valid snapshot that has not yet been consumed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L62)

<a id="field-field-mq3-client-client-abi-clientactive-oldframeservertime-oldframeservertime-src-mq3-client-client-abi-ml-1049338512"></a>
### oldFrameServerTime

```ml
oldFrameServerTime
```

Server time from the preceding rendered frame, used to recognize restart discontinuities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L56)

<a id="field-field-mq3-client-client-abi-clientactive-oldservertime-oldservertime-src-mq3-client-client-abi-ml-1133406876"></a>
### oldServerTime

```ml
oldServerTime
```

Previous client estimate of server time, retained to prevent time from moving backward.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L54)

<a id="field-field-mq3-client-client-abi-clientactive-outpackets-outpackets-src-mq3-client-client-abi-ml-454686630"></a>
### outPackets

```ml
outPackets
```

History of outgoing packet metadata used to estimate acknowledgement timing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L88)

<a id="field-field-mq3-client-client-abi-clientactive-parseentities-parseentities-src-mq3-client-client-abi-ml-35205136"></a>
### parseEntities

```ml
parseEntities
```

Parsed entity-state ring used to reconstruct snapshots from their absolute entity positions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L98)

<a id="field-field-mq3-client-client-abi-clientactive-parseentitiesnum-parseentitiesnum-src-mq3-client-client-abi-ml-1474251656"></a>
### parseEntitiesNum

```ml
parseEntitiesNum
```

Absolute position in the parsed-entity ring at which this snapshot's entities begin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L68)

<a id="field-field-mq3-client-client-abi-clientactive-serverid-serverid-src-mq3-client-client-abi-ml-1725194288"></a>
### serverId

```ml
serverId
```

Server-instance identifier included in client messages to reject stale connections.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L92)

<a id="field-field-mq3-client-client-abi-clientactive-servertime-servertime-src-mq3-client-client-abi-ml-71400496"></a>
### serverTime

```ml
serverTime
```

Current synchronized presentation time in milliseconds retained for the active client game.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L52)

<a id="field-field-mq3-client-client-abi-clientactive-servertimedelta-servertimedelta-src-mq3-client-client-abi-ml-1001838576"></a>
### serverTimeDelta

```ml
serverTimeDelta
```

Offset added to client realtime to estimate current server time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L58)

<a id="field-field-mq3-client-client-abi-clientactive-snap-snap-src-mq3-client-client-abi-ml-393834460"></a>
### snap

```ml
snap
```

Current snapshot used as the lower endpoint of client interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L50)

<a id="field-field-mq3-client-client-abi-clientactive-snapshots-snapshots-src-mq3-client-client-abi-ml-739045992"></a>
### snapshots

```ml
snapshots
```

Snapshot history indexed by sequence number for interpolation and delta decoding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L94)

<a id="field-field-mq3-client-client-abi-clientactive-timeoutcount-timeoutcount-src-mq3-client-client-abi-ml-1677568128"></a>
### timeoutcount

```ml
timeoutcount
```

Consecutive frames that have met the timeout condition before a disconnect is accepted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L48)

<a id="field-field-mq3-client-client-abi-clientactive-viewangles-viewangles-src-mq3-client-client-abi-ml-1413162318"></a>
### viewangles

```ml
viewangles
```

Locally accumulated view angles used when constructing outgoing user commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L90)
