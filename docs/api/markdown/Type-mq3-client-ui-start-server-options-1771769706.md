# `mq3.client.ui_start_server.Options`

[Home](README.md) · [Source file](File-src-mq3-client-ui-start-server-ml-1691378486.md)

<a id="struct-struct-mq3-client-ui-start-server-options-struct-options-src-mq3-client-ui-start-server-ml-658886805"></a>
## Options

```ml
struct Options
```

Stores UI start server options record, including `multiplayer`, `gametype`, `mapName`, `playerTypes`, `playerNames`, `playerTeams` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L88)

## Members

<a id="field-field-mq3-client-ui-start-server-options-actions-actions-src-mq3-client-ui-start-server-ml-1276978671"></a>
### actions

```ml
actions
```

Host requests queued while choosing a map and game rules, configuring bot slots, and launching a server, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L131)

<a id="field-field-mq3-client-ui-start-server-options-botskill-botskill-src-mq3-client-ui-start-server-ml-942755723"></a>
### botSkill

```ml
botSkill
```

Bot difficulty level; zero denotes a human player and native bot levels range from one to five.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L116)

<a id="field-field-mq3-client-ui-start-server-options-dedicated-dedicated-src-mq3-client-ui-start-server-ml-991901863"></a>
### dedicated

```ml
dedicated
```

When constructing this record, `options` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L102)

<a id="field-field-mq3-client-ui-start-server-options-flaglimit-flaglimit-src-mq3-client-ui-start-server-ml-734081143"></a>
### flagLimit

```ml
flagLimit
```

When constructing this record, `options` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L108)

<a id="field-field-mq3-client-ui-start-server-options-fraglimit-fraglimit-src-mq3-client-ui-start-server-ml-471523047"></a>
### fragLimit

```ml
fragLimit
```

When constructing this record, `options` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L106)

<a id="field-field-mq3-client-ui-start-server-options-friendlyfire-friendlyfire-src-mq3-client-ui-start-server-ml-2127006353"></a>
### friendlyFire

```ml
friendlyFire
```

When constructing this record, `options` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L110)

<a id="field-field-mq3-client-ui-start-server-options-gametype-gametype-src-mq3-client-ui-start-server-ml-474573155"></a>
### gametype

```ml
gametype
```

Actual GT game-rule value used to configure limits, player teams, and the server launch command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L92)

<a id="field-field-mq3-client-ui-start-server-options-hostname-hostname-src-mq3-client-ui-start-server-ml-537343549"></a>
### hostname

```ml
hostname
```

When constructing this record, `options` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L112)

<a id="field-field-mq3-client-ui-start-server-options-mapname-mapname-src-mq3-client-ui-start-server-ml-998163875"></a>
### mapName

```ml
mapName
```

Map identifier selected for the server-start command and its levelshot preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L94)

<a id="field-field-mq3-client-ui-start-server-options-multiplayer-multiplayer-src-mq3-client-ui-start-server-ml-1276360943"></a>
### multiplayer

```ml
multiplayer
```

When constructing this record, `options` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L90)

<a id="field-field-mq3-client-ui-start-server-options-newbot-newbot-src-mq3-client-ui-start-server-ml-182495313"></a>
### newBot

```ml
newBot
```

When constructing this record, `options` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L120)

<a id="field-field-mq3-client-ui-start-server-options-newbotindex-newbotindex-src-mq3-client-ui-start-server-ml-15508223"></a>
### newBotIndex

```ml
newBotIndex
```

When constructing this record, `options` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L122)

<a id="field-field-mq3-client-ui-start-server-options-newbotname-newbotname-src-mq3-client-ui-start-server-ml-2006774219"></a>
### newBotName

```ml
newBotName
```

When constructing this record, `options` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L124)

<a id="field-field-mq3-client-ui-start-server-options-playernames-playernames-src-mq3-client-ui-start-server-ml-1246260915"></a>
### playerNames

```ml
playerNames
```

When constructing this record, `options` supplies `array(PLAYER_SLOTS,"")` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L98)

<a id="field-field-mq3-client-ui-start-server-options-playerteams-playerteams-src-mq3-client-ui-start-server-ml-1974273455"></a>
### playerTeams

```ml
playerTeams
```

When constructing this record, `options` supplies `array(PLAYER_SLOTS,0)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L100)

<a id="field-field-mq3-client-ui-start-server-options-playertypes-playertypes-src-mq3-client-ui-start-server-ml-710396739"></a>
### playerTypes

```ml
playerTypes
```

When constructing this record, `options` supplies `array(PLAYER_SLOTS,0)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L96)

<a id="field-field-mq3-client-ui-start-server-options-punkbuster-punkbuster-src-mq3-client-ui-start-server-ml-1492288681"></a>
### punkbuster

```ml
punkbuster
```

Legacy server anti-cheat status advertised to the native server browser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L118)

<a id="field-field-mq3-client-ui-start-server-options-pure-pure-src-mq3-client-ui-start-server-ml-2080198171"></a>
### pure

```ml
pure
```

When constructing this record, `options` supplies `1` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L114)

<a id="field-field-mq3-client-ui-start-server-options-timelimit-timelimit-src-mq3-client-ui-start-server-ml-1011491787"></a>
### timeLimit

```ml
timeLimit
```

When constructing this record, `options` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L104)

<a id="field-field-mq3-client-ui-start-server-options-visiblenames-visiblenames-src-mq3-client-ui-start-server-ml-945685067"></a>
### visibleNames

```ml
visibleNames
```

When constructing this record, `options` supplies `array(PLAYER_SLOTS,false)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L126)

<a id="field-field-mq3-client-ui-start-server-options-visibleteams-visibleteams-src-mq3-client-ui-start-server-ml-1586198991"></a>
### visibleTeams

```ml
visibleTeams
```

When constructing this record, `options` supplies `array(PLAYER_SLOTS,false)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L128)
