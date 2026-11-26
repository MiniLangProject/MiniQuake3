# `mq3.client.cgame_draw.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-draw-ml-658265827.md)

<a id="struct-struct-mq3-client-cgame-draw-state-struct-state-src-mq3-client-cgame-draw-ml-1470663379"></a>
## State

```ml
struct State
```

Stores client game draw state, including `time`, `levelStartTime`, `serverTime`, `latestSnapshotNum`, `serverCommandSequence`, `team` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L177)

## Members

<a id="field-field-mq3-client-cgame-draw-state-actions-actions-src-mq3-client-cgame-draw-ml-2069972678"></a>
### actions

```ml
actions
```

Host requests queued while drawing status indicators, crosshairs, votes, and timed HUD feedback, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L319)

<a id="field-field-mq3-client-cgame-draw-state-ammo-ammo-src-mq3-client-cgame-draw-ml-695513650"></a>
### ammo

```ml
ammo
```

Ammunition quantity or ammunition state associated with the selected weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L199)

<a id="field-field-mq3-client-cgame-draw-state-armor-armor-src-mq3-client-cgame-draw-ml-759960782"></a>
### armor

```ml
armor
```

Local-player armor used by the main HUD status bar and health-color calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L197)

<a id="field-field-mq3-client-cgame-draw-state-attackernum-attackernum-src-mq3-client-cgame-draw-ml-458638882"></a>
### attackerNum

```ml
attackerNum
```

Client slot of the last attacker whose portrait and name can appear in the HUD.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L242)

<a id="field-field-mq3-client-cgame-draw-state-attackertime-attackertime-src-mq3-client-cgame-draw-ml-1470045018"></a>
### attackerTime

```ml
attackerTime
```

Timestamp used to time the latest attacker's HUD indication.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L240)

<a id="field-field-mq3-client-cgame-draw-state-centerprint-centerprint-src-mq3-client-cgame-draw-ml-1055152550"></a>
### centerPrint

```ml
centerPrint
```

Text of the current centered announcement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L290)

<a id="field-field-mq3-client-cgame-draw-state-centerprintcharwidth-centerprintcharwidth-src-mq3-client-cgame-draw-ml-590657390"></a>
### centerPrintCharWidth

```ml
centerPrintCharWidth
```

Character width selected for the centered announcement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L296)

<a id="field-field-mq3-client-cgame-draw-state-centerprintlines-centerprintlines-src-mq3-client-cgame-draw-ml-804316320"></a>
### centerPrintLines

```ml
centerPrintLines
```

Number of lines in the centered announcement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L298)

<a id="field-field-mq3-client-cgame-draw-state-centerprinttime-centerprinttime-src-mq3-client-cgame-draw-ml-1001981282"></a>
### centerPrintTime

```ml
centerPrintTime
```

Client timestamp at which the current centered announcement began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L292)

<a id="field-field-mq3-client-cgame-draw-state-centerprinty-centerprinty-src-mq3-client-cgame-draw-ml-967143136"></a>
### centerPrintY

```ml
centerPrintY
```

Vertical display position of the centered announcement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L294)

<a id="field-field-mq3-client-cgame-draw-state-clientnum-clientnum-src-mq3-client-cgame-draw-ml-164830790"></a>
### clientNum

```ml
clientNum
```

Client slot of the player whose HUD and head are displayed, including a followed player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L193)

<a id="field-field-mq3-client-cgame-draw-state-clients-clients-src-mq3-client-cgame-draw-ml-1968447694"></a>
### clients

```ml
clients
```

Client information indexed by player slot for HUD heads, names, and team-overlay entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L308)

<a id="field-field-mq3-client-cgame-draw-state-crosshairclientnum-crosshairclientnum-src-mq3-client-cgame-draw-ml-1571530692"></a>
### crosshairClientNum

```ml
crosshairClientNum
```

Client slot most recently identified under the crosshair.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L236)

<a id="field-field-mq3-client-cgame-draw-state-crosshairclienttime-crosshairclienttime-src-mq3-client-cgame-draw-ml-526921594"></a>
### crosshairClientTime

```ml
crosshairClientTime
```

Timestamp of the last valid crosshair-player identification.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L238)

<a id="field-field-mq3-client-cgame-draw-state-crosshairhealth-crosshairhealth-src-mq3-client-cgame-draw-ml-1243189882"></a>
### crosshairHealth

```ml
crosshairHealth
```

When constructing this record, `state` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L224)

<a id="field-field-mq3-client-cgame-draw-state-crosshairsize-crosshairsize-src-mq3-client-cgame-draw-ml-1743500978"></a>
### crosshairSize

```ml
crosshairSize
```

When constructing this record, `state` supplies `32.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L228)

<a id="field-field-mq3-client-cgame-draw-state-crosshairx-crosshairx-src-mq3-client-cgame-draw-ml-1410617022"></a>
### crosshairX

```ml
crosshairX
```

Horizontal crosshair offset from the center of the active view rectangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L230)

<a id="field-field-mq3-client-cgame-draw-state-crosshairy-crosshairy-src-mq3-client-cgame-draw-ml-372168484"></a>
### crosshairY

```ml
crosshairY
```

Vertical crosshair offset from the center of the active view rectangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L232)

<a id="field-field-mq3-client-cgame-draw-state-draw2d-draw2d-src-mq3-client-cgame-draw-ml-1280642986"></a>
### draw2D

```ml
draw2D
```

When constructing this record, `state` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L212)

<a id="field-field-mq3-client-cgame-draw-state-draw3dicons-draw3dicons-src-mq3-client-cgame-draw-ml-1395384510"></a>
### draw3dIcons

```ml
draw3dIcons
```

Image or shader resources used to draw the draw3d icon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L218)

<a id="field-field-mq3-client-cgame-draw-state-drawcrosshair-drawcrosshair-src-mq3-client-cgame-draw-ml-1508400186"></a>
### drawCrosshair

```ml
drawCrosshair
```

When constructing this record, `state` supplies `1` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L220)

<a id="field-field-mq3-client-cgame-draw-state-drawcrosshairnames-drawcrosshairnames-src-mq3-client-cgame-draw-ml-2146870538"></a>
### drawCrosshairNames

```ml
drawCrosshairNames
```

When constructing this record, `state` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L222)

<a id="field-field-mq3-client-cgame-draw-state-drawicons-drawicons-src-mq3-client-cgame-draw-ml-452855186"></a>
### drawIcons

```ml
drawIcons
```

Image or shader resources used to draw the draw icon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L216)

<a id="field-field-mq3-client-cgame-draw-state-drawstatus-drawstatus-src-mq3-client-cgame-draw-ml-313927478"></a>
### drawStatus

```ml
drawStatus
```

When constructing this record, `state` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L214)

<a id="field-field-mq3-client-cgame-draw-state-emitted-emitted-src-mq3-client-cgame-draw-ml-11950362"></a>
### emitted

```ml
emitted
```

When constructing this record, `state` supplies `0` for this member. Used by `publish` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L322)

<a id="field-field-mq3-client-cgame-draw-state-fpsindex-fpsindex-src-mq3-client-cgame-draw-ml-135603136"></a>
### fpsIndex

```ml
fpsIndex
```

Total FPS samples collected; modulo four selects the next frame-duration history slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L306)

<a id="field-field-mq3-client-cgame-draw-state-frametime-frametime-src-mq3-client-cgame-draw-ml-706723018"></a>
### frameTime

```ml
frameTime
```

Previous FPS sampling timestamp in milliseconds, retained to measure the next HUD frame interval.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L302)

<a id="field-field-mq3-client-cgame-draw-state-gametype-gametype-src-mq3-client-cgame-draw-ml-309849898"></a>
### gametype

```ml
gametype
```

Game-rule identifier selecting team overlays, score layout, and spectator HUD instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L191)

<a id="field-field-mq3-client-cgame-draw-state-health-health-src-mq3-client-cgame-draw-ml-615887458"></a>
### health

```ml
health
```

Local-player health used by the main HUD status, crosshair, and spectator decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L195)

<a id="field-field-mq3-client-cgame-draw-state-itempickupblendtime-itempickupblendtime-src-mq3-client-cgame-draw-ml-1471229814"></a>
### itemPickupBlendTime

```ml
itemPickupBlendTime
```

Independent timestamp for the pickup pulse around the crosshair.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L234)

<a id="field-field-mq3-client-cgame-draw-state-lag-lag-src-mq3-client-cgame-draw-ml-210234414"></a>
### lag

```ml
lag
```

When constructing this record, `state` supplies `lagometer()` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L316)

<a id="field-field-mq3-client-cgame-draw-state-latestsnapshotnum-latestsnapshotnum-src-mq3-client-cgame-draw-ml-1095735374"></a>
### latestSnapshotNum

```ml
latestSnapshotNum
```

Sequence number of the latest snapshot received from the engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L185)

<a id="field-field-mq3-client-cgame-draw-state-levelshot-levelshot-src-mq3-client-cgame-draw-ml-1241747066"></a>
### levelShot

```ml
levelShot
```

True while producing the menu screenshot for the current level.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L210)

<a id="field-field-mq3-client-cgame-draw-state-levelstarttime-levelstarttime-src-mq3-client-cgame-draw-ml-1766719848"></a>
### levelStartTime

```ml
levelStartTime
```

Server timestamp at which the level began, used by elapsed-match-time displays.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L181)

<a id="field-field-mq3-client-cgame-draw-state-locations-locations-src-mq3-client-cgame-draw-ml-136246950"></a>
### locations

```ml
locations
```

When constructing this record, `state` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L310)

<a id="field-field-mq3-client-cgame-draw-state-lowammowarning-lowammowarning-src-mq3-client-cgame-draw-ml-1553880878"></a>
### lowAmmoWarning

```ml
lowAmmoWarning
```

Ammunition-warning state: one means low ammunition and two means empty.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L248)

<a id="field-field-mq3-client-cgame-draw-state-nopredict-nopredict-src-mq3-client-cgame-draw-ml-1906879002"></a>
### noPredict

```ml
noPredict
```

When constructing this record, `state` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L276)

<a id="field-field-mq3-client-cgame-draw-state-pmflags-pmflags-src-mq3-client-cgame-draw-ml-1657312018"></a>
### pmFlags

```ml
pmFlags
```

Player movement flags used for follow-mode text and spectator or scoreboard presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L274)

<a id="field-field-mq3-client-cgame-draw-state-pmtype-pmtype-src-mq3-client-cgame-draw-ml-1639733452"></a>
### pmType

```ml
pmType
```

Player movement mode used to select death, intermission, and ordinary HUD presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L272)

<a id="field-field-mq3-client-cgame-draw-state-powerups-powerups-src-mq3-client-cgame-draw-ml-2073687308"></a>
### powerups

```ml
powerups
```

Powerup display entries carrying expiry times and icons for the local HUD countdown list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L314)

<a id="field-field-mq3-client-cgame-draw-state-previousframetimes-previousframetimes-src-mq3-client-cgame-draw-ml-1922408658"></a>
### previousFrameTimes

```ml
previousFrameTimes
```

When constructing this record, `state` supplies `[0,0,0,0]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L304)

<a id="field-field-mq3-client-cgame-draw-state-refheight-refheight-src-mq3-client-cgame-draw-ml-2042935674"></a>
### refHeight

```ml
refHeight
```

When constructing this record, `state` supplies `480` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L288)

<a id="field-field-mq3-client-cgame-draw-state-refwidth-refwidth-src-mq3-client-cgame-draw-ml-896108728"></a>
### refWidth

```ml
refWidth
```

When constructing this record, `state` supplies `640` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L286)

<a id="field-field-mq3-client-cgame-draw-state-refx-refx-src-mq3-client-cgame-draw-ml-1389333516"></a>
### refX

```ml
refX
```

Left coordinate of the active view rectangle used to position the crosshair and tiled border.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L282)

<a id="field-field-mq3-client-cgame-draw-state-refy-refy-src-mq3-client-cgame-draw-ml-840973782"></a>
### refY

```ml
refY
```

Top coordinate of the active view rectangle used to position the crosshair and tiled border.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L284)

<a id="field-field-mq3-client-cgame-draw-state-renderingthirdperson-renderingthirdperson-src-mq3-client-cgame-draw-ml-1104995582"></a>
### renderingThirdPerson

```ml
renderingThirdPerson
```

True while the camera uses a third-person, chase, or death view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L226)

<a id="field-field-mq3-client-cgame-draw-state-scoreboardshowing-scoreboardshowing-src-mq3-client-cgame-draw-ml-1197320006"></a>
### scoreBoardShowing

```ml
scoreBoardShowing
```

True while the scoreboard is actually being rendered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L250)

<a id="field-field-mq3-client-cgame-draw-state-servercommandsequence-servercommandsequence-src-mq3-client-cgame-draw-ml-1753800602"></a>
### serverCommandSequence

```ml
serverCommandSequence
```

Reliable server-command sequence shown by the HUD snapshot diagnostic display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L187)

<a id="field-field-mq3-client-cgame-draw-state-servertime-servertime-src-mq3-client-cgame-draw-ml-1474617002"></a>
### serverTime

```ml
serverTime
```

Server snapshot time in milliseconds displayed in the HUD snapshot diagnostic line.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L183)

<a id="field-field-mq3-client-cgame-draw-state-showscores-showscores-src-mq3-client-cgame-draw-ml-683244250"></a>
### showScores

```ml
showScores
```

True while the player explicitly requests the scoreboard overlay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L208)

<a id="field-field-mq3-client-cgame-draw-state-sortedteamplayers-sortedteamplayers-src-mq3-client-cgame-draw-ml-1988958410"></a>
### sortedTeamPlayers

```ml
sortedTeamPlayers
```

When constructing this record, `state` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L312)

<a id="field-field-mq3-client-cgame-draw-state-stereoseparation-stereoseparation-src-mq3-client-cgame-draw-ml-1955184218"></a>
### stereoSeparation

```ml
stereoSeparation
```

When constructing this record, `state` supplies `0.4` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L280)

<a id="field-field-mq3-client-cgame-draw-state-suppressed-suppressed-src-mq3-client-cgame-draw-ml-673410634"></a>
### suppressed

```ml
suppressed
```

Number of requests withheld from native dispatch while drawing status indicators, crosshairs, votes, and timed HUD feedback because the retail QVM owns their effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L325)

<a id="field-field-mq3-client-cgame-draw-state-synchronous-synchronous-src-mq3-client-cgame-draw-ml-1488739230"></a>
### synchronous

```ml
synchronous
```

When constructing this record, `state` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L278)

<a id="field-field-mq3-client-cgame-draw-state-team-team-src-mq3-client-cgame-draw-ml-1045680924"></a>
### team

```ml
team
```

Local-player team membership used to select HUD colors, teammate rows, and spectator presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L189)

<a id="field-field-mq3-client-cgame-draw-state-teamvotemodified-teamvotemodified-src-mq3-client-cgame-draw-ml-1088684050"></a>
### teamVoteModified

```ml
teamVoteModified
```

Per-team indicators that team-vote information changed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L264)

<a id="field-field-mq3-client-cgame-draw-state-teamvoteno-teamvoteno-src-mq3-client-cgame-draw-ml-1803262786"></a>
### teamVoteNo

```ml
teamVoteNo
```

When constructing this record, `state` supplies `[0,0]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L270)

<a id="field-field-mq3-client-cgame-draw-state-teamvotestring-teamvotestring-src-mq3-client-cgame-draw-ml-1388266678"></a>
### teamVoteString

```ml
teamVoteString
```

When constructing this record, `state` supplies `["",""]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L266)

<a id="field-field-mq3-client-cgame-draw-state-teamvotetime-teamvotetime-src-mq3-client-cgame-draw-ml-2006684526"></a>
### teamVoteTime

```ml
teamVoteTime
```

When constructing this record, `state` supplies `[0,0]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L262)

<a id="field-field-mq3-client-cgame-draw-state-teamvoteyes-teamvoteyes-src-mq3-client-cgame-draw-ml-139346950"></a>
### teamVoteYes

```ml
teamVoteYes
```

When constructing this record, `state` supplies `[0,0]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L268)

<a id="field-field-mq3-client-cgame-draw-state-time-time-src-mq3-client-cgame-draw-ml-1778796612"></a>
### time

```ml
time
```

Client-game timestamp in milliseconds used to animate and expire HUD indicators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L179)

<a id="field-field-mq3-client-cgame-draw-state-voicetime-voicetime-src-mq3-client-cgame-draw-ml-1282414598"></a>
### voiceTime

```ml
voiceTime
```

Timestamp used to schedule the current voice announcement or portrait.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L300)

<a id="field-field-mq3-client-cgame-draw-state-votemodified-votemodified-src-mq3-client-cgame-draw-ml-743848756"></a>
### voteModified

```ml
voteModified
```

True when vote information changed and the UI should refresh or play feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L254)

<a id="field-field-mq3-client-cgame-draw-state-voteno-voteno-src-mq3-client-cgame-draw-ml-2103411244"></a>
### voteNo

```ml
voteNo
```

Number of negative votes displayed for the current server vote.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L260)

<a id="field-field-mq3-client-cgame-draw-state-votestring-votestring-src-mq3-client-cgame-draw-ml-1971114372"></a>
### voteString

```ml
voteString
```

When constructing this record, `state` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L256)

<a id="field-field-mq3-client-cgame-draw-state-votetime-votetime-src-mq3-client-cgame-draw-ml-1852705520"></a>
### voteTime

```ml
voteTime
```

Start time of the active vote in milliseconds; zero suppresses the vote display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L252)

<a id="field-field-mq3-client-cgame-draw-state-voteyes-voteyes-src-mq3-client-cgame-draw-ml-1359947242"></a>
### voteYes

```ml
voteYes
```

Number of affirmative votes displayed for the current server vote.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L258)

<a id="field-field-mq3-client-cgame-draw-state-warmup-warmup-src-mq3-client-cgame-draw-ml-40177742"></a>
### warmup

```ml
warmup
```

Warmup deadline or state supplied by the server's warmup configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L244)

<a id="field-field-mq3-client-cgame-draw-state-warmupcount-warmupcount-src-mq3-client-cgame-draw-ml-1756500774"></a>
### warmupCount

```ml
warmupCount
```

Last warmup countdown value announced to the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L246)

<a id="field-field-mq3-client-cgame-draw-state-weapon-weapon-src-mq3-client-cgame-draw-ml-1710910954"></a>
### weapon

```ml
weapon
```

Native identifier of the local-player weapon shown by the main HUD ammo and weapon indicators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L201)

<a id="field-field-mq3-client-cgame-draw-state-weaponfiring-weaponfiring-src-mq3-client-cgame-draw-ml-1194244436"></a>
### weaponFiring

```ml
weaponFiring
```

When constructing this record, `state` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L206)

<a id="field-field-mq3-client-cgame-draw-state-weapontime-weapontime-src-mq3-client-cgame-draw-ml-359569220"></a>
### weaponTime

```ml
weaponTime
```

Compatibility weapon-timing slot initialized to zero; the current HUD drawing paths do not consult it.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L204)
