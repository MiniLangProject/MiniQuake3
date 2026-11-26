# `mq3.client.cgame_newdraw.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-newdraw-ml-909882749.md)

<a id="struct-struct-mq3-client-cgame-newdraw-state-struct-state-src-mq3-client-cgame-newdraw-ml-842275435"></a>
## State

```ml
struct State
```

Stores client game newdraw state, including `time`, `gametype`, `team`, `health`, `armor`, `ammo` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L345)

## Members

<a id="field-field-mq3-client-cgame-newdraw-state-actions-actions-src-mq3-client-cgame-newdraw-ml-848404594"></a>
### actions

```ml
actions
```

Host requests queued while drawing Missionpack owner-draw widgets and their associated media, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L494)

<a id="field-field-mq3-client-cgame-newdraw-state-activecursor-activecursor-src-mq3-client-cgame-newdraw-ml-143573726"></a>
### activeCursor

```ml
activeCursor
```

When constructing this record, `create` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L458)

<a id="field-field-mq3-client-cgame-newdraw-state-ammo-ammo-src-mq3-client-cgame-newdraw-ml-1784743614"></a>
### ammo

```ml
ammo
```

Ammunition quantity or ammunition state associated with the selected weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L357)

<a id="field-field-mq3-client-cgame-newdraw-state-armor-armor-src-mq3-client-cgame-newdraw-ml-1863147290"></a>
### armor

```ml
armor
```

Local-player armor shown by owner-drawn armor icons and numeric indicators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L355)

<a id="field-field-mq3-client-cgame-newdraw-state-blueflag-blueflag-src-mq3-client-cgame-newdraw-ml-799693094"></a>
### blueflag

```ml
blueflag
```

Blue-flag status received through server configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L421)

<a id="field-field-mq3-client-cgame-newdraw-state-blueteamname-blueteamname-src-mq3-client-cgame-newdraw-ml-2112661358"></a>
### blueTeamName

```ml
blueTeamName
```

When constructing this record, `create` supplies `"Blue"` for this member. Used by `drawBlueName` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L429)

<a id="field-field-mq3-client-cgame-newdraw-state-captureditem-captureditem-src-mq3-client-cgame-newdraw-ml-357699784"></a>
### capturedItem

```ml
capturedItem
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `keyEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L461)

<a id="field-field-mq3-client-cgame-newdraw-state-capturelimit-capturelimit-src-mq3-client-cgame-newdraw-ml-42002464"></a>
### capturelimit

```ml
capturelimit
```

Capture or objective-score limit parsed from the server's game information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L384)

<a id="field-field-mq3-client-cgame-newdraw-state-clients-clients-src-mq3-client-cgame-newdraw-ml-620083418"></a>
### clients

```ml
clients
```

Client records used by owner-drawn player indicators, team selection, and flag-carrier lookup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L391)

<a id="field-field-mq3-client-cgame-newdraw-state-commands-commands-src-mq3-client-cgame-newdraw-ml-944066558"></a>
### commands

```ml
commands
```

When constructing this record, `create` supplies an empty list for this member. Used by `checkOrderPending` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L486)

<a id="field-field-mq3-client-cgame-newdraw-state-currentorder-currentorder-src-mq3-client-cgame-newdraw-ml-160051732"></a>
### currentOrder

```ml
currentOrder
```

Team-order identifier currently selected for issuing to a teammate.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L406)

<a id="field-field-mq3-client-cgame-newdraw-state-cursorx-cursorx-src-mq3-client-cgame-newdraw-ml-1852846494"></a>
### cursorX

```ml
cursorX
```

Horizontal position of the pointer in the local display coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L454)

<a id="field-field-mq3-client-cgame-newdraw-state-cursory-cursory-src-mq3-client-cgame-newdraw-ml-45000962"></a>
### cursorY

```ml
cursorY
```

Vertical position of the pointer in the local display coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L456)

<a id="field-field-mq3-client-cgame-newdraw-state-cvars-cvars-src-mq3-client-cgame-newdraw-ml-1241295242"></a>
### cvars

```ml
cvars
```

Configuration-variable values exposed to the native UI implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L488)

<a id="field-field-mq3-client-cgame-newdraw-state-draw3dicons-draw3dicons-src-mq3-client-cgame-newdraw-ml-1621247626"></a>
### draw3dIcons

```ml
draw3dIcons
```

Image or shader resources used to draw the draw3d icon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L447)

<a id="field-field-mq3-client-cgame-newdraw-state-drawicons-drawicons-src-mq3-client-cgame-newdraw-ml-1051594654"></a>
### drawIcons

```ml
drawIcons
```

Image or shader resources used to draw the draw icon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L445)

<a id="field-field-mq3-client-cgame-newdraw-state-drawstatus-drawstatus-src-mq3-client-cgame-newdraw-ml-1181506850"></a>
### drawStatus

```ml
drawStatus
```

When constructing this record, `create` supplies `true` for this member. Used by `drawPlayerArmorIcon` and `ownerDraw` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L443)

<a id="field-field-mq3-client-cgame-newdraw-state-emitted-emitted-src-mq3-client-cgame-newdraw-ml-1881730918"></a>
### emitted

```ml
emitted
```

When constructing this record, `create` supplies `0` for this member. Used by `emit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L500)

<a id="field-field-mq3-client-cgame-newdraw-state-eventhandling-eventhandling-src-mq3-client-cgame-newdraw-ml-482208010"></a>
### eventHandling

```ml
eventHandling
```

When constructing this record, `create` supplies `CGAME_EVENT_NONE` for this member. Used by `eventHandling` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L464)

<a id="field-field-mq3-client-cgame-newdraw-state-flagstatus-flagstatus-src-mq3-client-cgame-newdraw-ml-640412930"></a>
### flagStatus

```ml
flagStatus
```

Current flag-objective state used by capture-the-flag presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L423)

<a id="field-field-mq3-client-cgame-newdraw-state-fraglimit-fraglimit-src-mq3-client-cgame-newdraw-ml-1665696754"></a>
### fraglimit

```ml
fraglimit
```

When constructing this record, `create` supplies `0` for this member. Used by `drawCapFragLimit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L387)

<a id="field-field-mq3-client-cgame-newdraw-state-gametype-gametype-src-mq3-client-cgame-newdraw-ml-969725046"></a>
### gametype

```ml
gametype
```

Game-rule identifier selecting objective icons, team orders, and owner-drawn HUD variants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L349)

<a id="field-field-mq3-client-cgame-newdraw-state-generic1-generic1-src-mq3-client-cgame-newdraw-ml-362520658"></a>
### generic1

```ml
generic1
```

When constructing this record, `create` supplies `0` for this member. Used by `harvesterSkulls` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L373)

<a id="field-field-mq3-client-cgame-newdraw-state-glyphwidth-glyphwidth-src-mq3-client-cgame-newdraw-ml-1297316646"></a>
### glyphWidth

```ml
glyphWidth
```

When constructing this record, `create` supplies `8.0` for this member. Used by `textPaintLimit` and `drawTeamSpectators` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L506)

<a id="field-field-mq3-client-cgame-newdraw-state-health-health-src-mq3-client-cgame-newdraw-ml-1245112430"></a>
### health

```ml
health
```

Local-player health used by owner-drawn health indicators and visibility conditions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L353)

<a id="field-field-mq3-client-cgame-newdraw-state-holdable-holdable-src-mq3-client-cgame-newdraw-ml-444568724"></a>
### holdable

```ml
holdable
```

When constructing this record, `create` supplies `0` for this member. Used by `drawPlayerItem` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L367)

<a id="field-field-mq3-client-cgame-newdraw-state-killername-killername-src-mq3-client-cgame-newdraw-ml-793329582"></a>
### killerName

```ml
killerName
```

Display name of the player responsible for the local player's latest death.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L431)

<a id="field-field-mq3-client-cgame-newdraw-state-locations-locations-src-mq3-client-cgame-newdraw-ml-1937045522"></a>
### locations

```ml
locations
```

When constructing this record, `create` supplies an empty list for this member. Used by `location` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L397)

<a id="field-field-mq3-client-cgame-newdraw-state-medals-medals-src-mq3-client-cgame-newdraw-ml-96867054"></a>
### medals

```ml
medals
```

When constructing this record, `create` supplies an empty list for this member. Used by `drawMedal` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L481)

<a id="field-field-mq3-client-cgame-newdraw-state-menus-menus-src-mq3-client-cgame-newdraw-ml-166127454"></a>
### menus

```ml
menus
```

When constructing this record, `create` supplies an empty list for this member. Used by `hideTeamMenu` and `showTeamMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L491)

<a id="field-field-mq3-client-cgame-newdraw-state-orderpending-orderpending-src-mq3-client-cgame-newdraw-ml-1374951576"></a>
### orderPending

```ml
orderPending
```

When constructing this record, `create` supplies `false` for this member. Used by `checkOrderPending` and `drawSelectedPlayerStatus` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L409)

<a id="field-field-mq3-client-cgame-newdraw-state-ordertime-ordertime-src-mq3-client-cgame-newdraw-ml-50680614"></a>
### orderTime

```ml
orderTime
```

When constructing this record, `create` supplies `0` for this member. Used by `drawSelectedPlayerStatus` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L412)

<a id="field-field-mq3-client-cgame-newdraw-state-persistentpowerup-persistentpowerup-src-mq3-client-cgame-newdraw-ml-1916467382"></a>
### persistentPowerup

```ml
persistentPowerup
```

When constructing this record, `create` supplies `0` for this member. Used by `drawCTFPowerUp` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L370)

<a id="field-field-mq3-client-cgame-newdraw-state-playerpowerups-playerpowerups-src-mq3-client-cgame-newdraw-ml-1277194902"></a>
### playerPowerups

```ml
playerPowerups
```

When constructing this record, `create` supplies an empty list for this member. Used by `hasPlayerFlag` and `drawPlayerHasFlag` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L376)

<a id="field-field-mq3-client-cgame-newdraw-state-pmtype-pmtype-src-mq3-client-cgame-newdraw-ml-1436621516"></a>
### pmType

```ml
pmType
```

When constructing this record, `create` supplies `PM_NORMAL` for this member. Used by `mouseEvent` and `keyEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L450)

<a id="field-field-mq3-client-cgame-newdraw-state-powerups-powerups-src-mq3-client-cgame-newdraw-ml-1512722380"></a>
### powerups

```ml
powerups
```

Timed powerup display entries sorted by remaining lifetime for owner-drawn HUD indicators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L378)

<a id="field-field-mq3-client-cgame-newdraw-state-rank-rank-src-mq3-client-cgame-newdraw-ml-1259497966"></a>
### rank

```ml
rank
```

When constructing this record, `create` supplies `0` for this member. Used by `getGameStatusText` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L364)

<a id="field-field-mq3-client-cgame-newdraw-state-redflag-redflag-src-mq3-client-cgame-newdraw-ml-865440902"></a>
### redflag

```ml
redflag
```

Red-flag status received through server configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L419)

<a id="field-field-mq3-client-cgame-newdraw-state-redteamname-redteamname-src-mq3-client-cgame-newdraw-ml-1669156930"></a>
### redTeamName

```ml
redTeamName
```

When constructing this record, `create` supplies `"Red"` for this member. Used by `drawRedName` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L426)

<a id="field-field-mq3-client-cgame-newdraw-state-retailactive-retailactive-src-mq3-client-cgame-newdraw-ml-1936447820"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns Missionpack HUD owner-draw widgets, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L497)

<a id="field-field-mq3-client-cgame-newdraw-state-score-score-src-mq3-client-cgame-newdraw-ml-364570934"></a>
### score

```ml
score
```

Current player score supplied to owner-drawn HUD score displays.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L361)

<a id="field-field-mq3-client-cgame-newdraw-state-scores1-scores1-src-mq3-client-cgame-newdraw-ml-1735865118"></a>
### scores1

```ml
scores1
```

First team or leading player's score received through server configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L380)

<a id="field-field-mq3-client-cgame-newdraw-state-scores2-scores2-src-mq3-client-cgame-newdraw-ml-277403862"></a>
### scores2

```ml
scores2
```

Second team or trailing player's score received through server configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L382)

<a id="field-field-mq3-client-cgame-newdraw-state-selected-selected-src-mq3-client-cgame-newdraw-ml-286614364"></a>
### selected

```ml
selected
```

Current selection state or selected entry retained by the owning UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L399)

<a id="field-field-mq3-client-cgame-newdraw-state-selectedclient-selectedclient-src-mq3-client-cgame-newdraw-ml-1110643094"></a>
### selectedClient

```ml
selectedClient
```

Client slot currently selected for teammate or selected-player HUD presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L404)

<a id="field-field-mq3-client-cgame-newdraw-state-selectedname-selectedname-src-mq3-client-cgame-newdraw-ml-551616934"></a>
### selectedName

```ml
selectedName
```

When constructing this record, `create` supplies `"Everyone"` for this member. Used by `setSelectedPlayerName` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L402)

<a id="field-field-mq3-client-cgame-newdraw-state-selectedscore-selectedscore-src-mq3-client-cgame-newdraw-ml-317581598"></a>
### selectedScore

```ml
selectedScore
```

Index of the scoreboard entry currently selected in the UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L483)

<a id="field-field-mq3-client-cgame-newdraw-state-showscores-showscores-src-mq3-client-cgame-newdraw-ml-740483878"></a>
### showScores

```ml
showScores
```

True while the player explicitly requests the scoreboard overlay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L452)

<a id="field-field-mq3-client-cgame-newdraw-state-sorted-sorted-src-mq3-client-cgame-newdraw-ml-731754924"></a>
### sorted

```ml
sorted
```

When constructing this record, `create` supplies an empty list for this member. Used by `currentClient` and `checkOrderPending` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L394)

<a id="field-field-mq3-client-cgame-newdraw-state-spectatorlen-spectatorlen-src-mq3-client-cgame-newdraw-ml-209501198"></a>
### spectatorLen

```ml
spectatorLen
```

Number of characters in the concatenated spectator-name banner.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L468)

<a id="field-field-mq3-client-cgame-newdraw-state-spectatorlist-spectatorlist-src-mq3-client-cgame-newdraw-ml-549558270"></a>
### spectatorList

```ml
spectatorList
```

Concatenated spectator display names used by the scrolling scoreboard banner.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L466)

<a id="field-field-mq3-client-cgame-newdraw-state-spectatoroffset-spectatoroffset-src-mq3-client-cgame-newdraw-ml-1152714758"></a>
### spectatorOffset

```ml
spectatorOffset
```

Character offset into the scrolling spectator-name text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L472)

<a id="field-field-mq3-client-cgame-newdraw-state-spectatorpaintx-spectatorpaintx-src-mq3-client-cgame-newdraw-ml-1971198530"></a>
### spectatorPaintX

```ml
spectatorPaintX
```

Horizontal draw position of the first copy of the scrolling spectator banner.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L474)

<a id="field-field-mq3-client-cgame-newdraw-state-spectatorpaintx2-spectatorpaintx2-src-mq3-client-cgame-newdraw-ml-1022561288"></a>
### spectatorPaintX2

```ml
spectatorPaintX2
```

Horizontal draw position of the second copy used to wrap the spectator banner.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L476)

<a id="field-field-mq3-client-cgame-newdraw-state-spectatortime-spectatortime-src-mq3-client-cgame-newdraw-ml-741811774"></a>
### spectatorTime

```ml
spectatorTime
```

Next client timestamp at which the spectator banner should scroll.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L478)

<a id="field-field-mq3-client-cgame-newdraw-state-spectatorwidth-spectatorwidth-src-mq3-client-cgame-newdraw-ml-1202794080"></a>
### spectatorWidth

```ml
spectatorWidth
```

Rendered width of the spectator-name banner in display coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L470)

<a id="field-field-mq3-client-cgame-newdraw-state-suppressed-suppressed-src-mq3-client-cgame-newdraw-ml-1064059094"></a>
### suppressed

```ml
suppressed
```

Number of requests withheld from native dispatch while drawing Missionpack owner-draw widgets and their associated media because the retail QVM owns their effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L503)

<a id="field-field-mq3-client-cgame-newdraw-state-systemchat-systemchat-src-mq3-client-cgame-newdraw-ml-1442678100"></a>
### systemChat

```ml
systemChat
```

When constructing this record, `create` supplies an empty string for this member. Used by `initTeamChat` and `setPrintString` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L434)

<a id="field-field-mq3-client-cgame-newdraw-state-team-team-src-mq3-client-cgame-newdraw-ml-1721849116"></a>
### team

```ml
team
```

Local-player team used by objective displays, team orders, and owner-drawn visibility rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L351)

<a id="field-field-mq3-client-cgame-newdraw-state-teamchat1-teamchat1-src-mq3-client-cgame-newdraw-ml-1623121766"></a>
### teamChat1

```ml
teamChat1
```

When constructing this record, `create` supplies an empty string for this member. Used by `initTeamChat` and `setPrintString` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L437)

<a id="field-field-mq3-client-cgame-newdraw-state-teamchat2-teamchat2-src-mq3-client-cgame-newdraw-ml-349906130"></a>
### teamChat2

```ml
teamChat2
```

When constructing this record, `create` supplies an empty string for this member. Used by `initTeamChat` and `setPrintString` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L440)

<a id="field-field-mq3-client-cgame-newdraw-state-teamscores-teamscores-src-mq3-client-cgame-newdraw-ml-1610938494"></a>
### teamScores

```ml
teamScores
```

Current score totals indexed by the two competing teams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L389)

<a id="field-field-mq3-client-cgame-newdraw-state-time-time-src-mq3-client-cgame-newdraw-ml-1091343748"></a>
### time

```ml
time
```

Client-game time in milliseconds used by owner-drawn HUD animations and powerup countdowns.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L347)

<a id="field-field-mq3-client-cgame-newdraw-state-voiceclient-voiceclient-src-mq3-client-cgame-newdraw-ml-383624178"></a>
### voiceClient

```ml
voiceClient
```

When constructing this record, `create` supplies `0` for this member. Used by `voiceClient` and `drawSelectedPlayerHead` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L415)

<a id="field-field-mq3-client-cgame-newdraw-state-voicetime-voicetime-src-mq3-client-cgame-newdraw-ml-898281842"></a>
### voiceTime

```ml
voiceTime
```

Timestamp used to schedule the current voice announcement or portrait.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L417)

<a id="field-field-mq3-client-cgame-newdraw-state-weapon-weapon-src-mq3-client-cgame-newdraw-ml-1549656246"></a>
### weapon

```ml
weapon
```

Native local-player weapon identifier used by owner-drawn ammo and weapon displays.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L359)
