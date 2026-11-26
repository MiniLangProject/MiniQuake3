# `mq3.client.cg_local.CgState`

[Home](README.md) · [Source file](File-src-mq3-client-cg-local-ml-909335699.md)

<a id="struct-struct-mq3-client-cg-local-cgstate-struct-cgstate-src-mq3-client-cg-local-ml-1469490303"></a>
## CgState

```ml
struct CgState
```

Stores client game local cg state record, including `clientFrame`, `clientNum`, `demoPlayback`, `levelShot`, `deferredPlayerLoading`, `loading` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L551)

## Members

<a id="field-field-mq3-client-cg-local-cgstate-activesnapshots-activesnapshots-src-mq3-client-cg-local-ml-1832396348"></a>
### activeSnapshots

```ml
activeSnapshots
```

Storage for the snapshots that currently bracket the client interpolation time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L575)

<a id="field-field-mq3-client-cg-local-cgstate-attackertime-attackertime-src-mq3-client-cg-local-ml-1580593976"></a>
### attackerTime

```ml
attackerTime
```

Timestamp used to time the latest attacker's HUD indication.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L707)

<a id="field-field-mq3-client-cg-local-cgstate-autoangles-autoangles-src-mq3-client-cg-local-ml-1275872398"></a>
### autoAngles

```ml
autoAngles
```

Automatic rotation angles used to animate pickups and similar world items.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L629)

<a id="field-field-mq3-client-cg-local-cgstate-autoanglesfast-autoanglesfast-src-mq3-client-cg-local-ml-2001295446"></a>
### autoAnglesFast

```ml
autoAnglesFast
```

Automatic rotation angles for effects that rotate faster than ordinary items.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L633)

<a id="field-field-mq3-client-cg-local-cgstate-autoaxis-autoaxis-src-mq3-client-cg-local-ml-1248457592"></a>
### autoAxis

```ml
autoAxis
```

Orientation basis derived from the normal-speed automatic item rotation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L631)

<a id="field-field-mq3-client-cg-local-cgstate-autoaxisfast-autoaxisfast-src-mq3-client-cg-local-ml-1629979404"></a>
### autoAxisFast

```ml
autoAxisFast
```

Orientation basis derived from the faster automatic item rotation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L635)

<a id="field-field-mq3-client-cg-local-cgstate-bobcycle-bobcycle-src-mq3-client-cg-local-ml-1911700206"></a>
### bobcycle

```ml
bobcycle
```

Movement-bob cycle index carried by the predicted player state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L785)

<a id="field-field-mq3-client-cg-local-cgstate-bobfracsin-bobfracsin-src-mq3-client-cg-local-ml-230974418"></a>
### bobfracsin

```ml
bobfracsin
```

Sinusoidal phase value used for movement-driven camera or weapon bob.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L783)

<a id="field-field-mq3-client-cg-local-cgstate-centerprint-centerprint-src-mq3-client-cg-local-ml-1043935036"></a>
### centerPrint

```ml
centerPrint
```

Text of the current centered announcement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L691)

<a id="field-field-mq3-client-cg-local-cgstate-centerprintcharwidth-centerprintcharwidth-src-mq3-client-cg-local-ml-79428052"></a>
### centerPrintCharWidth

```ml
centerPrintCharWidth
```

Character width selected for the centered announcement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L687)

<a id="field-field-mq3-client-cg-local-cgstate-centerprintlines-centerprintlines-src-mq3-client-cg-local-ml-494600094"></a>
### centerPrintLines

```ml
centerPrintLines
```

Number of lines in the centered announcement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L693)

<a id="field-field-mq3-client-cg-local-cgstate-centerprinttime-centerprinttime-src-mq3-client-cg-local-ml-1444937640"></a>
### centerPrintTime

```ml
centerPrintTime
```

Client timestamp at which the current centered announcement began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L685)

<a id="field-field-mq3-client-cg-local-cgstate-centerprinty-centerprinty-src-mq3-client-cg-local-ml-1396971358"></a>
### centerPrintY

```ml
centerPrintY
```

Vertical display position of the centered announcement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L689)

<a id="field-field-mq3-client-cg-local-cgstate-clientframe-clientframe-src-mq3-client-cg-local-ml-1333275352"></a>
### clientFrame

```ml
clientFrame
```

Client-frame counter incremented for each CGame frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L553)

<a id="field-field-mq3-client-cg-local-cgstate-clientnum-clientnum-src-mq3-client-cg-local-ml-697446884"></a>
### clientNum

```ml
clientNum
```

Local client slot retained by the shared client-game runtime record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L555)

<a id="field-field-mq3-client-cg-local-cgstate-crosshairclientnum-crosshairclientnum-src-mq3-client-cg-local-ml-1510759786"></a>
### crosshairClientNum

```ml
crosshairClientNum
```

Client slot most recently identified under the crosshair.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L699)

<a id="field-field-mq3-client-cg-local-cgstate-crosshairclienttime-crosshairclienttime-src-mq3-client-cg-local-ml-647476784"></a>
### crosshairClientTime

```ml
crosshairClientTime
```

Timestamp of the last valid crosshair-player identification.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L701)

<a id="field-field-mq3-client-cg-local-cgstate-damagetime-damagetime-src-mq3-client-cg-local-ml-363366040"></a>
### damageTime

```ml
damageTime
```

Timestamp used to fade the latest damage overlay or view-kick effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L751)

<a id="field-field-mq3-client-cg-local-cgstate-damagevalue-damagevalue-src-mq3-client-cg-local-ml-1129657592"></a>
### damageValue

```ml
damageValue
```

Magnitude of the latest damage event used to scale view kick and indicators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L757)

<a id="field-field-mq3-client-cg-local-cgstate-damagex-damagex-src-mq3-client-cg-local-ml-875343364"></a>
### damageX

```ml
damageX
```

Horizontal direction component of the latest damage indicator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L753)

<a id="field-field-mq3-client-cg-local-cgstate-damagey-damagey-src-mq3-client-cg-local-ml-1040965732"></a>
### damageY

```ml
damageY
```

Vertical direction component of the latest damage indicator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L755)

<a id="field-field-mq3-client-cg-local-cgstate-deferredplayerloading-deferredplayerloading-src-mq3-client-cg-local-ml-2030420808"></a>
### deferredPlayerLoading

```ml
deferredPlayerLoading
```

True while player media is scheduled for deferred registration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L561)

<a id="field-field-mq3-client-cg-local-cgstate-demoplayback-demoplayback-src-mq3-client-cg-local-ml-1304452376"></a>
### demoPlayback

```ml
demoPlayback
```

True when snapshots and commands are being read from a recorded demo.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L557)

<a id="field-field-mq3-client-cg-local-cgstate-duckchange-duckchange-src-mq3-client-cg-local-ml-1372274270"></a>
### duckChange

```ml
duckChange
```

Eye-height displacement being smoothed after a crouch transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L619)

<a id="field-field-mq3-client-cg-local-cgstate-ducktime-ducktime-src-mq3-client-cg-local-ml-1271760684"></a>
### duckTime

```ml
duckTime
```

Client timestamp at which crouch-height smoothing began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L621)

<a id="field-field-mq3-client-cg-local-cgstate-eventsequence-eventsequence-src-mq3-client-cg-local-ml-251235252"></a>
### eventSequence

```ml
eventSequence
```

Next sequence number in the predicted or entity event stream.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L611)

<a id="field-field-mq3-client-cg-local-cgstate-fraglimitwarnings-fraglimitwarnings-src-mq3-client-cg-local-ml-1390813448"></a>
### fraglimitWarnings

```ml
fraglimitWarnings
```

Bitset recording which frag-limit warning thresholds have already been announced.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L593)

<a id="field-field-mq3-client-cg-local-cgstate-frameinterpolation-frameinterpolation-src-mq3-client-cg-local-ml-1979922158"></a>
### frameInterpolation

```ml
frameInterpolation
```

Fraction between the current and following snapshot times used for interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L577)

<a id="field-field-mq3-client-cg-local-cgstate-frametime-frametime-src-mq3-client-cg-local-ml-2062995080"></a>
### frametime

```ml
frametime
```

Elapsed client time in milliseconds since the preceding frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L583)

<a id="field-field-mq3-client-cg-local-cgstate-headendpitch-headendpitch-src-mq3-client-cg-local-ml-12921374"></a>
### headEndPitch

```ml
headEndPitch
```

Target pitch angle at the end of the status-head animation segment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L761)

<a id="field-field-mq3-client-cg-local-cgstate-headendtime-headendtime-src-mq3-client-cg-local-ml-1931480160"></a>
### headEndTime

```ml
headEndTime
```

Ending timestamp of the current status-head animation segment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L765)

<a id="field-field-mq3-client-cg-local-cgstate-headendyaw-headendyaw-src-mq3-client-cg-local-ml-750829208"></a>
### headEndYaw

```ml
headEndYaw
```

Target yaw angle at the end of the status-head animation segment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L763)

<a id="field-field-mq3-client-cg-local-cgstate-headstartpitch-headstartpitch-src-mq3-client-cg-local-ml-2100412912"></a>
### headStartPitch

```ml
headStartPitch
```

Starting pitch angle of the status-head animation segment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L767)

<a id="field-field-mq3-client-cg-local-cgstate-headstarttime-headstarttime-src-mq3-client-cg-local-ml-1436377960"></a>
### headStartTime

```ml
headStartTime
```

Starting timestamp of the current status-head animation segment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L771)

<a id="field-field-mq3-client-cg-local-cgstate-headstartyaw-headstartyaw-src-mq3-client-cg-local-ml-1217036350"></a>
### headStartYaw

```ml
headStartYaw
```

Starting yaw angle of the status-head animation segment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L769)

<a id="field-field-mq3-client-cg-local-cgstate-headyaw-headyaw-src-mq3-client-cg-local-ml-1867381268"></a>
### headYaw

```ml
headYaw
```

Yaw angle used to animate the status-bar head model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L759)

<a id="field-field-mq3-client-cg-local-cgstate-hyperspace-hyperspace-src-mq3-client-cg-local-ml-1071557448"></a>
### hyperspace

```ml
hyperspace
```

True when prediction has entered a teleport trigger requiring the hyperspace view effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L599)

<a id="field-field-mq3-client-cg-local-cgstate-infoscreentext-infoscreentext-src-mq3-client-cg-local-ml-285493418"></a>
### infoScreenText

```ml
infoScreenText
```

Status text displayed while connecting, loading, or waiting for a game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L647)

<a id="field-field-mq3-client-cg-local-cgstate-intermissionstarted-intermissionstarted-src-mq3-client-cg-local-ml-585628104"></a>
### intermissionStarted

```ml
intermissionStarted
```

True after intermission begins, suppressing gameplay-only presentation such as voice rewards.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L565)

<a id="field-field-mq3-client-cg-local-cgstate-itempickup-itempickup-src-mq3-client-cg-local-ml-451849910"></a>
### itemPickup

```ml
itemPickup
```

Item identifier shown by the most recent pickup notification.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L739)

<a id="field-field-mq3-client-cg-local-cgstate-itempickupblendtime-itempickupblendtime-src-mq3-client-cg-local-ml-108506388"></a>
### itemPickupBlendTime

```ml
itemPickupBlendTime
```

Independent timestamp for the pickup pulse around the crosshair.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L743)

<a id="field-field-mq3-client-cg-local-cgstate-itempickuptime-itempickuptime-src-mq3-client-cg-local-ml-464682672"></a>
### itemPickupTime

```ml
itemPickupTime
```

Timestamp at which the most recent item-pickup notification began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L741)

<a id="field-field-mq3-client-cg-local-cgstate-kick-angles-kick-angles-src-mq3-client-cg-local-ml-869259148"></a>
### kick_angles

```ml
kick_angles
```

Angular displacement contributed by weapon recoil or view kick.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L779)

<a id="field-field-mq3-client-cg-local-cgstate-kick-origin-kick-origin-src-mq3-client-cg-local-ml-1484572952"></a>
### kick_origin

```ml
kick_origin
```

Positional displacement contributed by weapon recoil or view kick.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L781)

<a id="field-field-mq3-client-cg-local-cgstate-killername-killername-src-mq3-client-cg-local-ml-427207200"></a>
### killerName

```ml
killerName
```

Display name of the player responsible for the local player's latest death.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L665)

<a id="field-field-mq3-client-cg-local-cgstate-landchange-landchange-src-mq3-client-cg-local-ml-1744182062"></a>
### landChange

```ml
landChange
```

Eye-height displacement used for the landing camera kick.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L623)

<a id="field-field-mq3-client-cg-local-cgstate-landtime-landtime-src-mq3-client-cg-local-ml-1032340472"></a>
### landTime

```ml
landTime
```

Client timestamp at which the landing camera kick began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L625)

<a id="field-field-mq3-client-cg-local-cgstate-lastkilltime-lastkilltime-src-mq3-client-cg-local-ml-251888426"></a>
### lastKillTime

```ml
lastKillTime
```

Timestamp of the latest kill, used to detect closely spaced award events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L697)

<a id="field-field-mq3-client-cg-local-cgstate-latestsnapshotnum-latestsnapshotnum-src-mq3-client-cg-local-ml-226835684"></a>
### latestSnapshotNum

```ml
latestSnapshotNum
```

Sequence number of the latest snapshot received from the engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L567)

<a id="field-field-mq3-client-cg-local-cgstate-latestsnapshottime-latestsnapshottime-src-mq3-client-cg-local-ml-2112760616"></a>
### latestSnapshotTime

```ml
latestSnapshotTime
```

Server timestamp associated with the latest received snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L569)

<a id="field-field-mq3-client-cg-local-cgstate-levelshot-levelshot-src-mq3-client-cg-local-ml-87117384"></a>
### levelShot

```ml
levelShot
```

True while producing the menu screenshot for the current level.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L559)

<a id="field-field-mq3-client-cg-local-cgstate-loading-loading-src-mq3-client-cg-local-ml-1171158084"></a>
### loading

```ml
loading
```

True while initial game media and client information are being loaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L563)

<a id="field-field-mq3-client-cg-local-cgstate-lowammowarning-lowammowarning-src-mq3-client-cg-local-ml-255335564"></a>
### lowAmmoWarning

```ml
lowAmmoWarning
```

Ammunition-warning state: one means low ammunition and two means empty.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L695)

<a id="field-field-mq3-client-cg-local-cgstate-maprestart-maprestart-src-mq3-client-cg-local-ml-585473270"></a>
### mapRestart

```ml
mapRestart
```

True after a map restart, causing presentation and prediction state to be reinitialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L595)

<a id="field-field-mq3-client-cg-local-cgstate-nextframeteleport-nextframeteleport-src-mq3-client-cg-local-ml-15695900"></a>
### nextFrameTeleport

```ml
nextFrameTeleport
```

True when the following snapshot transition must bypass interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L581)

<a id="field-field-mq3-client-cg-local-cgstate-nextorbittime-nextorbittime-src-mq3-client-cg-local-ml-1674372208"></a>
### nextOrbitTime

```ml
nextOrbitTime
```

Next timestamp at which the automatic camera orbit advances.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L789)

<a id="field-field-mq3-client-cg-local-cgstate-nextsnap-nextsnap-src-mq3-client-cg-local-ml-766531218"></a>
### nextSnap

```ml
nextSnap
```

Following snapshot used as the upper endpoint of client interpolation, when available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L573)

<a id="field-field-mq3-client-cg-local-cgstate-numscores-numscores-src-mq3-client-cg-local-ml-1425396252"></a>
### numScores

```ml
numScores
```

Number of valid scoreboard entries received from the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L651)

<a id="field-field-mq3-client-cg-local-cgstate-oldtime-oldtime-src-mq3-client-cg-local-ml-1104926444"></a>
### oldTime

```ml
oldTime
```

Client time of the preceding frame, retained for integration and effect updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L587)

<a id="field-field-mq3-client-cg-local-cgstate-physicstime-physicstime-src-mq3-client-cg-local-ml-1412567820"></a>
### physicsTime

```ml
physicsTime
```

Snapshot time selected as the basis for player-state prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L589)

<a id="field-field-mq3-client-cg-local-cgstate-powerupactive-powerupactive-src-mq3-client-cg-local-ml-373778648"></a>
### powerupActive

```ml
powerupActive
```

Powerup identifier currently emphasized by the HUD flash animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L703)

<a id="field-field-mq3-client-cg-local-cgstate-poweruptime-poweruptime-src-mq3-client-cg-local-ml-1347191048"></a>
### powerupTime

```ml
powerupTime
```

Timestamp at which the active powerup's HUD emphasis began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L705)

<a id="field-field-mq3-client-cg-local-cgstate-predictableevents-predictableevents-src-mq3-client-cg-local-ml-2075589424"></a>
### predictableEvents

```ml
predictableEvents
```

Ring of events generated by local player prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L613)

<a id="field-field-mq3-client-cg-local-cgstate-predictederror-predictederror-src-mq3-client-cg-local-ml-734511064"></a>
### predictedError

```ml
predictedError
```

Positional discrepancy between predicted and authoritative player state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L609)

<a id="field-field-mq3-client-cg-local-cgstate-predictederrortime-predictederrortime-src-mq3-client-cg-local-ml-690431354"></a>
### predictedErrorTime

```ml
predictedErrorTime
```

Timestamp from which the stored player-prediction error is smoothed away.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L607)

<a id="field-field-mq3-client-cg-local-cgstate-predictedplayerentity-predictedplayerentity-src-mq3-client-cg-local-ml-1748071064"></a>
### predictedPlayerEntity

```ml
predictedPlayerEntity
```

Client entity populated from the locally predicted player state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L603)

<a id="field-field-mq3-client-cg-local-cgstate-predictedplayerstate-predictedplayerstate-src-mq3-client-cg-local-ml-1346599768"></a>
### predictedPlayerState

```ml
predictedPlayerState
```

Player state produced locally by command prediction between server snapshots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L601)

<a id="field-field-mq3-client-cg-local-cgstate-refdef-refdef-src-mq3-client-cg-local-ml-266396048"></a>
### refdef

```ml
refdef
```

Renderer view definition for the current frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L637)

<a id="field-field-mq3-client-cg-local-cgstate-refdefviewangles-refdefviewangles-src-mq3-client-cg-local-ml-1651063282"></a>
### refdefViewAngles

```ml
refdefViewAngles
```

Euler camera orientation associated with the current view definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L639)

<a id="field-field-mq3-client-cg-local-cgstate-renderingthirdperson-renderingthirdperson-src-mq3-client-cg-local-ml-443327940"></a>
### renderingThirdPerson

```ml
renderingThirdPerson
```

True while the camera uses a third-person, chase, or death view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L597)

<a id="field-field-mq3-client-cg-local-cgstate-rewardcount-rewardcount-src-mq3-client-cg-local-ml-2096051800"></a>
### rewardCount

```ml
rewardCount
```

Award count associated with each queued reward announcement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L715)

<a id="field-field-mq3-client-cg-local-cgstate-rewardshader-rewardshader-src-mq3-client-cg-local-ml-1725802960"></a>
### rewardShader

```ml
rewardShader
```

HUD shader associated with each queued reward announcement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L717)

<a id="field-field-mq3-client-cg-local-cgstate-rewardsound-rewardsound-src-mq3-client-cg-local-ml-2104953752"></a>
### rewardSound

```ml
rewardSound
```

Sound resource associated with each queued reward announcement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L719)

<a id="field-field-mq3-client-cg-local-cgstate-rewardstack-rewardstack-src-mq3-client-cg-local-ml-2097603500"></a>
### rewardStack

```ml
rewardStack
```

Number or top position of queued reward announcements awaiting presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L711)

<a id="field-field-mq3-client-cg-local-cgstate-rewardtime-rewardtime-src-mq3-client-cg-local-ml-117840376"></a>
### rewardTime

```ml
rewardTime
```

Timestamp used to schedule the current reward announcement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L713)

<a id="field-field-mq3-client-cg-local-cgstate-scoreboardshowing-scoreboardshowing-src-mq3-client-cg-local-ml-195694220"></a>
### scoreBoardShowing

```ml
scoreBoardShowing
```

True while the scoreboard is actually being rendered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L661)

<a id="field-field-mq3-client-cg-local-cgstate-scorefadetime-scorefadetime-src-mq3-client-cg-local-ml-1287037088"></a>
### scoreFadeTime

```ml
scoreFadeTime
```

Timestamp used to fade the scoreboard after its display request ends.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L663)

<a id="field-field-mq3-client-cg-local-cgstate-scores-scores-src-mq3-client-cg-local-ml-1143418566"></a>
### scores

```ml
scores
```

Scoreboard entries received from the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L657)

<a id="field-field-mq3-client-cg-local-cgstate-scoresrequesttime-scoresrequesttime-src-mq3-client-cg-local-ml-1279858012"></a>
### scoresRequestTime

```ml
scoresRequestTime
```

Timestamp of the most recent request for updated server scores.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L649)

<a id="field-field-mq3-client-cg-local-cgstate-selectedscore-selectedscore-src-mq3-client-cg-local-ml-1374517152"></a>
### selectedScore

```ml
selectedScore
```

Index of the scoreboard entry currently selected in the UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L653)

<a id="field-field-mq3-client-cg-local-cgstate-showscores-showscores-src-mq3-client-cg-local-ml-34558200"></a>
### showScores

```ml
showScores
```

True while the player explicitly requests the scoreboard overlay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L659)

<a id="field-field-mq3-client-cg-local-cgstate-skulltrails-skulltrails-src-mq3-client-cg-local-ml-1973868408"></a>
### skulltrails

```ml
skulltrails
```

Per-client history of carried Harvester skull positions used to render trails.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L683)

<a id="field-field-mq3-client-cg-local-cgstate-snap-snap-src-mq3-client-cg-local-ml-440275556"></a>
### snap

```ml
snap
```

Current snapshot used as the lower endpoint of client interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L571)

<a id="field-field-mq3-client-cg-local-cgstate-soundbuffer-soundbuffer-src-mq3-client-cg-local-ml-197599588"></a>
### soundBuffer

```ml
soundBuffer
```

Ring buffer of announcement sounds waiting to be played.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L727)

<a id="field-field-mq3-client-cg-local-cgstate-soundbufferin-soundbufferin-src-mq3-client-cg-local-ml-1001584344"></a>
### soundBufferIn

```ml
soundBufferIn
```

Write position in the queued-announcement sound ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L721)

<a id="field-field-mq3-client-cg-local-cgstate-soundbufferout-soundbufferout-src-mq3-client-cg-local-ml-105334894"></a>
### soundBufferOut

```ml
soundBufferOut
```

Read position in the queued-announcement sound ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L723)

<a id="field-field-mq3-client-cg-local-cgstate-soundtime-soundtime-src-mq3-client-cg-local-ml-869297176"></a>
### soundTime

```ml
soundTime
```

Next time at which a queued announcement sound may be played.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L725)

<a id="field-field-mq3-client-cg-local-cgstate-spectatorlen-spectatorlen-src-mq3-client-cg-local-ml-1562407920"></a>
### spectatorLen

```ml
spectatorLen
```

Number of characters in the concatenated spectator-name banner.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L669)

<a id="field-field-mq3-client-cg-local-cgstate-spectatorlist-spectatorlist-src-mq3-client-cg-local-ml-1246941888"></a>
### spectatorList

```ml
spectatorList
```

Concatenated spectator display names used by the scrolling scoreboard banner.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L667)

<a id="field-field-mq3-client-cg-local-cgstate-spectatoroffset-spectatoroffset-src-mq3-client-cg-local-ml-1351099704"></a>
### spectatorOffset

```ml
spectatorOffset
```

Character offset into the scrolling spectator-name text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L679)

<a id="field-field-mq3-client-cg-local-cgstate-spectatorpaintlen-spectatorpaintlen-src-mq3-client-cg-local-ml-2060768536"></a>
### spectatorPaintLen

```ml
spectatorPaintLen
```

Character count or offset used while painting the spectator-name banner.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L681)

<a id="field-field-mq3-client-cg-local-cgstate-spectatorpaintx-spectatorpaintx-src-mq3-client-cg-local-ml-1886572100"></a>
### spectatorPaintX

```ml
spectatorPaintX
```

Horizontal draw position of the first copy of the scrolling spectator banner.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L675)

<a id="field-field-mq3-client-cg-local-cgstate-spectatorpaintx2-spectatorpaintx2-src-mq3-client-cg-local-ml-684448334"></a>
### spectatorPaintX2

```ml
spectatorPaintX2
```

Horizontal draw position of the second copy used to wrap the spectator banner.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L677)

<a id="field-field-mq3-client-cg-local-cgstate-spectatortime-spectatortime-src-mq3-client-cg-local-ml-633805744"></a>
### spectatorTime

```ml
spectatorTime
```

Next client timestamp at which the spectator banner should scroll.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L673)

<a id="field-field-mq3-client-cg-local-cgstate-spectatorwidth-spectatorwidth-src-mq3-client-cg-local-ml-159546782"></a>
### spectatorWidth

```ml
spectatorWidth
```

Rendered width of the spectator-name banner in display coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L671)

<a id="field-field-mq3-client-cg-local-cgstate-stepchange-stepchange-src-mq3-client-cg-local-ml-2002679440"></a>
### stepChange

```ml
stepChange
```

Vertical step displacement being smoothed by the first-person camera.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L615)

<a id="field-field-mq3-client-cg-local-cgstate-steptime-steptime-src-mq3-client-cg-local-ml-290124538"></a>
### stepTime

```ml
stepTime
```

Client timestamp at which stair-step smoothing began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L617)

<a id="field-field-mq3-client-cg-local-cgstate-teamscores-teamscores-src-mq3-client-cg-local-ml-1235013672"></a>
### teamScores

```ml
teamScores
```

Current score totals indexed by the two competing teams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L655)

<a id="field-field-mq3-client-cg-local-cgstate-testgun-testgun-src-mq3-client-cg-local-ml-655774912"></a>
### testGun

```ml
testGun
```

True when the developer test model is positioned as a first-person weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L795)

<a id="field-field-mq3-client-cg-local-cgstate-testmodelentity-testmodelentity-src-mq3-client-cg-local-ml-124991552"></a>
### testModelEntity

```ml
testModelEntity
```

Renderer entity used to preview the developer's test model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L791)

<a id="field-field-mq3-client-cg-local-cgstate-testmodelname-testmodelname-src-mq3-client-cg-local-ml-1748927064"></a>
### testModelName

```ml
testModelName
```

Virtual asset name of the model selected by the test-model console commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L793)

<a id="field-field-mq3-client-cg-local-cgstate-thisframeteleport-thisframeteleport-src-mq3-client-cg-local-ml-481233240"></a>
### thisFrameTeleport

```ml
thisFrameTeleport
```

True when the current snapshot transition represents a teleport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L579)

<a id="field-field-mq3-client-cg-local-cgstate-time-time-src-mq3-client-cg-local-ml-984277458"></a>
### time

```ml
time
```

Current client-game presentation timestamp in milliseconds in the shared runtime record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L585)

<a id="field-field-mq3-client-cg-local-cgstate-timelimitwarnings-timelimitwarnings-src-mq3-client-cg-local-ml-37682356"></a>
### timelimitWarnings

```ml
timelimitWarnings
```

Bitset recording which time-limit warning thresholds have already been announced.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L591)

<a id="field-field-mq3-client-cg-local-cgstate-v-dmg-pitch-v-dmg-pitch-src-mq3-client-cg-local-ml-1110164324"></a>
### v_dmg_pitch

```ml
v_dmg_pitch
```

Pitch displacement contributed by the damage-induced view kick.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L775)

<a id="field-field-mq3-client-cg-local-cgstate-v-dmg-roll-v-dmg-roll-src-mq3-client-cg-local-ml-1404577078"></a>
### v_dmg_roll

```ml
v_dmg_roll
```

Roll displacement contributed by the damage-induced view kick.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L777)

<a id="field-field-mq3-client-cg-local-cgstate-v-dmg-time-v-dmg-time-src-mq3-client-cg-local-ml-971106778"></a>
### v_dmg_time

```ml
v_dmg_time
```

Expiration or reference timestamp used by damage-induced view movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L773)

<a id="field-field-mq3-client-cg-local-cgstate-validpps-validpps-src-mq3-client-cg-local-ml-915419022"></a>
### validPPS

```ml
validPPS
```

True after a valid predicted player state has been produced.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L605)

<a id="field-field-mq3-client-cg-local-cgstate-voicechatbufferin-voicechatbufferin-src-mq3-client-cg-local-ml-1658009224"></a>
### voiceChatBufferIn

```ml
voiceChatBufferIn
```

Write position in the buffered voice-chat announcement ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L731)

<a id="field-field-mq3-client-cg-local-cgstate-voicechatbufferout-voicechatbufferout-src-mq3-client-cg-local-ml-915140752"></a>
### voiceChatBufferOut

```ml
voiceChatBufferOut
```

Read position in the buffered voice-chat announcement ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L733)

<a id="field-field-mq3-client-cg-local-cgstate-voicechattime-voicechattime-src-mq3-client-cg-local-ml-2070594444"></a>
### voiceChatTime

```ml
voiceChatTime
```

Next time at which a buffered voice-chat announcement may be played.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L729)

<a id="field-field-mq3-client-cg-local-cgstate-voicetime-voicetime-src-mq3-client-cg-local-ml-1409265804"></a>
### voiceTime

```ml
voiceTime
```

Timestamp used to schedule the current voice announcement or portrait.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L709)

<a id="field-field-mq3-client-cg-local-cgstate-warmup-warmup-src-mq3-client-cg-local-ml-1604232100"></a>
### warmup

```ml
warmup
```

Warmup deadline or state supplied by the server's warmup configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L735)

<a id="field-field-mq3-client-cg-local-cgstate-warmupcount-warmupcount-src-mq3-client-cg-local-ml-556860532"></a>
### warmupCount

```ml
warmupCount
```

Last warmup countdown value announced to the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L737)

<a id="field-field-mq3-client-cg-local-cgstate-weaponanimation-weaponanimation-src-mq3-client-cg-local-ml-1515779720"></a>
### weaponAnimation

```ml
weaponAnimation
```

First-person weapon animation identifier currently being displayed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L747)

<a id="field-field-mq3-client-cg-local-cgstate-weaponanimationtime-weaponanimationtime-src-mq3-client-cg-local-ml-645595624"></a>
### weaponAnimationTime

```ml
weaponAnimationTime
```

Timestamp at which the current first-person weapon animation began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L749)

<a id="field-field-mq3-client-cg-local-cgstate-weaponselect-weaponselect-src-mq3-client-cg-local-ml-433915384"></a>
### weaponSelect

```ml
weaponSelect
```

Weapon identifier currently selected by the local player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L627)

<a id="field-field-mq3-client-cg-local-cgstate-weaponselecttime-weaponselecttime-src-mq3-client-cg-local-ml-1939259466"></a>
### weaponSelectTime

```ml
weaponSelectTime
```

Timestamp at which the weapon-selection display was last refreshed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L745)

<a id="field-field-mq3-client-cg-local-cgstate-xyspeed-xyspeed-src-mq3-client-cg-local-ml-266592984"></a>
### xyspeed

```ml
xyspeed
```

Horizontal player speed used to scale movement bob and related view effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L787)

<a id="field-field-mq3-client-cg-local-cgstate-zoomed-zoomed-src-mq3-client-cg-local-ml-472968416"></a>
### zoomed

```ml
zoomed
```

True while the local player requests the zoomed view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L641)

<a id="field-field-mq3-client-cg-local-cgstate-zoomsensitivity-zoomsensitivity-src-mq3-client-cg-local-ml-417064944"></a>
### zoomSensitivity

```ml
zoomSensitivity
```

Mouse-sensitivity multiplier derived from the current zoom field of view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L645)

<a id="field-field-mq3-client-cg-local-cgstate-zoomtime-zoomtime-src-mq3-client-cg-local-ml-1338455608"></a>
### zoomTime

```ml
zoomTime
```

Timestamp used to interpolate the transition into or out of zoom.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L643)
