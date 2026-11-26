# `mq3.client.ui_sppostgame.Postgame`

[Home](README.md) · [Source file](File-src-mq3-client-ui-sppostgame-ml-447198085.md)

<a id="struct-struct-mq3-client-ui-sppostgame-postgame-struct-postgame-src-mq3-client-ui-sppostgame-ml-669472631"></a>
## Postgame

```ml
struct Postgame
```

Stores UI sppostgame postgame record, including `game`, `menu`, `itemAgain`, `itemNext`, `itemMenu`, `phase` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L39)

## Members

<a id="field-field-mq3-client-ui-sppostgame-postgame-assets-assets-src-mq3-client-ui-sppostgame-ml-497732315"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the single-player postgame presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L109)

<a id="field-field-mq3-client-ui-sppostgame-postgame-awardsearned-awardsearned-src-mq3-client-ui-sppostgame-ml-1578420611"></a>
### awardsEarned

```ml
awardsEarned
```

When constructing this record, `create` supplies `array(6,0)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L79)

<a id="field-field-mq3-client-ui-sppostgame-postgame-awardslevels-awardslevels-src-mq3-client-ui-sppostgame-ml-2020425907"></a>
### awardsLevels

```ml
awardsLevels
```

When constructing this record, `create` supplies `array(6,0)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L81)

<a id="field-field-mq3-client-ui-sppostgame-postgame-clientnums-clientnums-src-mq3-client-ui-sppostgame-ml-1807693473"></a>
### clientNums

```ml
clientNums
```

When constructing this record, `create` supplies `array(8,0)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L61)

<a id="field-field-mq3-client-ui-sppostgame-postgame-commands-commands-src-mq3-client-ui-sppostgame-ml-412259513"></a>
### commands

```ml
commands
```

Console commands queued by the postgame sequence, including podium, music, and cinematic transitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L98)

<a id="field-field-mq3-client-ui-sppostgame-postgame-cvarwrites-cvarwrites-src-mq3-client-ui-sppostgame-ml-279152033"></a>
### cvarWrites

```ml
cvarWrites
```

Cvar name/value changes queued by the single-player postgame presentation for the host to apply.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L100)

<a id="field-field-mq3-client-ui-sppostgame-postgame-demoversion-demoversion-src-mq3-client-ui-sppostgame-ml-1897116305"></a>
### demoVersion

```ml
demoVersion
```

True when postgame progression must follow the demo edition's restricted arena and cinematic paths.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L91)

<a id="field-field-mq3-client-ui-sppostgame-postgame-drawrows-drawrows-src-mq3-client-ui-sppostgame-ml-1455998763"></a>
### drawRows

```ml
drawRows
```

Drawing records generated for the current podium, awards, or final postgame display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L106)

<a id="field-field-mq3-client-ui-sppostgame-postgame-game-game-src-mq3-client-ui-sppostgame-ml-280786757"></a>
### game

```ml
game
```

When constructing this record, `create` supplies `game` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L41)

<a id="field-field-mq3-client-ui-sppostgame-postgame-ignorekeystime-ignorekeystime-src-mq3-client-ui-sppostgame-ml-1664961527"></a>
### ignoreKeysTime

```ml
ignoreKeysTime
```

UI timestamp before which key presses are ignored after opening or advancing a postgame stage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L53)

<a id="field-field-mq3-client-ui-sppostgame-postgame-itemagain-itemagain-src-mq3-client-ui-sppostgame-ml-712810785"></a>
### itemAgain

```ml
itemAgain
```

Replay-button widget for launching the just-completed single-player arena again.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L45)

<a id="field-field-mq3-client-ui-sppostgame-postgame-itemmenu-itemmenu-src-mq3-client-ui-sppostgame-ml-1663008029"></a>
### itemMenu

```ml
itemMenu
```

Menu-button widget that leaves the postgame presentation for arena selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L49)

<a id="field-field-mq3-client-ui-sppostgame-postgame-itemnext-itemnext-src-mq3-client-ui-sppostgame-ml-975561349"></a>
### itemNext

```ml
itemNext
```

Next-arena button widget, enabled when progression allows the player to continue.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L47)

<a id="field-field-mq3-client-ui-sppostgame-postgame-keycatcher-keycatcher-src-mq3-client-ui-sppostgame-ml-2030429955"></a>
### keyCatcher

```ml
keyCatcher
```

Input-capture bitmask selecting which client subsystem currently receives key events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L113)

<a id="field-field-mq3-client-ui-sppostgame-postgame-lasttier-lasttier-src-mq3-client-ui-sppostgame-ml-1333149077"></a>
### lastTier

```ml
lastTier
```

Final available single-player tier, used to detect campaign completion and select the ending cinematic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L86)

<a id="field-field-mq3-client-ui-sppostgame-postgame-level-level-src-mq3-client-ui-sppostgame-ml-108670517"></a>
### level

```ml
level
```

Single-player arena number whose completion result and best score are being recorded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L71)

<a id="field-field-mq3-client-ui-sppostgame-postgame-menu-menu-src-mq3-client-ui-sppostgame-ml-1347018591"></a>
### menu

```ml
menu
```

When constructing this record, `create` supplies `qmenu.menu(true,false)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L43)

<a id="field-field-mq3-client-ui-sppostgame-postgame-menudepthreset-menudepthreset-src-mq3-client-ui-sppostgame-ml-1130846143"></a>
### menuDepthReset

```ml
menuDepthReset
```

True after postgame initialization requests clearing the previous menu stack before presenting its own menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L116)

<a id="field-field-mq3-client-ui-sppostgame-postgame-numawards-numawards-src-mq3-client-ui-sppostgame-ml-1891749717"></a>
### numAwards

```ml
numAwards
```

Number of populated entries in the earned-award and award-level arrays.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L77)

<a id="field-field-mq3-client-ui-sppostgame-postgame-numclients-numclients-src-mq3-client-ui-sppostgame-ml-613790261"></a>
### numClients

```ml
numClients
```

Number of valid client entries represented by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L73)

<a id="field-field-mq3-client-ui-sppostgame-postgame-phase-phase-src-mq3-client-ui-sppostgame-ml-2055754053"></a>
### phase

```ml
phase
```

Postgame presentation stage controlling the podium sequence, award presentation, and final menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L51)

<a id="field-field-mq3-client-ui-sppostgame-postgame-placenames-placenames-src-mq3-client-ui-sppostgame-ml-1657903359"></a>
### placeNames

```ml
placeNames
```

When constructing this record, `create` supplies `["","",""]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L67)

<a id="field-field-mq3-client-ui-sppostgame-postgame-playedsound-playedsound-src-mq3-client-ui-sppostgame-ml-993430133"></a>
### playedSound

```ml
playedSound
```

Sound resource selected for the played event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L83)

<a id="field-field-mq3-client-ui-sppostgame-postgame-playerconfigs-playerconfigs-src-mq3-client-ui-sppostgame-ml-962539473"></a>
### playerConfigs

```ml
playerConfigs
```

Player config strings indexed by client slot and used to resolve postgame names and models.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L69)

<a id="field-field-mq3-client-ui-sppostgame-postgame-popped-popped-src-mq3-client-ui-sppostgame-ml-1696272157"></a>
### popped

```ml
popped
```

Records a request to remove the single-player postgame presentation from the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L95)

<a id="field-field-mq3-client-ui-sppostgame-postgame-pushed-pushed-src-mq3-client-ui-sppostgame-ml-614577491"></a>
### pushed

```ml
pushed
```

Records that the single-player postgame presentation has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L111)

<a id="field-field-mq3-client-ui-sppostgame-postgame-ranks-ranks-src-mq3-client-ui-sppostgame-ml-1712745853"></a>
### ranks

```ml
ranks
```

When constructing this record, `create` supplies `array(8,0)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L63)

<a id="field-field-mq3-client-ui-sppostgame-postgame-scoreboardenabled-scoreboardenabled-src-mq3-client-ui-sppostgame-ml-268373549"></a>
### scoreboardEnabled

```ml
scoreboardEnabled
```

When constructing this record, `create` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L93)

<a id="field-field-mq3-client-ui-sppostgame-postgame-scoreboardtime-scoreboardtime-src-mq3-client-ui-sppostgame-ml-1175352899"></a>
### scoreboardtime

```ml
scoreboardtime
```

UI timestamp anchoring the periodic rotation of visible postgame scoreboard entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L57)

<a id="field-field-mq3-client-ui-sppostgame-postgame-scores-scores-src-mq3-client-ui-sppostgame-ml-2094114099"></a>
### scores

```ml
scores
```

Scoreboard entries received from the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L65)

<a id="field-field-mq3-client-ui-sppostgame-postgame-serverid-serverid-src-mq3-client-ui-sppostgame-ml-867689153"></a>
### serverId

```ml
serverId
```

Server-instance identifier included in client messages to reject stale connections.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L59)

<a id="field-field-mq3-client-ui-sppostgame-postgame-sounds-sounds-src-mq3-client-ui-sppostgame-ml-1076788645"></a>
### sounds

```ml
sounds
```

Registered sound resources associated with the player model or media group.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L102)

<a id="field-field-mq3-client-ui-sppostgame-postgame-starts-starts-src-mq3-client-ui-sppostgame-ml-816358955"></a>
### starts

```ml
starts
```

Arena-launch requests queued by replay and next-arena choices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L104)

<a id="field-field-mq3-client-ui-sppostgame-postgame-starttime-starttime-src-mq3-client-ui-sppostgame-ml-641083665"></a>
### starttime

```ml
starttime
```

UI timestamp at which the current postgame presentation stage began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L55)

<a id="field-field-mq3-client-ui-sppostgame-postgame-winnersound-winnersound-src-mq3-client-ui-sppostgame-ml-675772357"></a>
### winnerSound

```ml
winnerSound
```

Sound resource selected for the winner event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L88)

<a id="field-field-mq3-client-ui-sppostgame-postgame-won-won-src-mq3-client-ui-sppostgame-ml-847630569"></a>
### won

```ml
won
```

When constructing this record, `create` supplies `-1` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sppostgame.ml#L75)
