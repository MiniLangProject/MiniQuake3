# `mq3.client.cgame_servercmds.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-servercmds-ml-56240583.md)

<a id="struct-struct-mq3-client-cgame-servercmds-state-struct-state-src-mq3-client-cgame-servercmds-ml-2055478355"></a>
## State

```ml
struct State
```

Stores client game servercmds state, including `configstrings`, `clients`, `scores`, `numScores`, `teamScores`, `sortedTeamPlayers` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L238)

## Members

<a id="field-field-mq3-client-cgame-servercmds-state-acceptleader-acceptleader-src-mq3-client-cgame-servercmds-ml-352351064"></a>
### acceptLeader

```ml
acceptLeader
```

When constructing this record, `create` supplies `0` for this member. Used by `playVoiceChat` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L382)

<a id="field-field-mq3-client-cgame-servercmds-state-acceptordertime-acceptordertime-src-mq3-client-cgame-servercmds-ml-1732141430"></a>
### acceptOrderTime

```ml
acceptOrderTime
```

When constructing this record, `create` supplies `0` for this member. Used by `playVoiceChat` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L373)

<a id="field-field-mq3-client-cgame-servercmds-state-accepttask-accepttask-src-mq3-client-cgame-servercmds-ml-1045732812"></a>
### acceptTask

```ml
acceptTask
```

When constructing this record, `create` supplies `0` for this member. Used by `playVoiceChat` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L379)

<a id="field-field-mq3-client-cgame-servercmds-state-acceptvoice-acceptvoice-src-mq3-client-cgame-servercmds-ml-2004967050"></a>
### acceptVoice

```ml
acceptVoice
```

When constructing this record, `create` supplies an empty string for this member. Used by `playVoiceChat` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L376)

<a id="field-field-mq3-client-cgame-servercmds-state-blueflag-blueflag-src-mq3-client-cgame-servercmds-ml-288091658"></a>
### blueflag

```ml
blueflag
```

Blue-flag status received through server configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L288)

<a id="field-field-mq3-client-cgame-servercmds-state-blueteam-blueteam-src-mq3-client-cgame-servercmds-ml-12403904"></a>
### blueTeam

```ml
blueTeam
```

When constructing this record, `create` supplies an empty string for this member. Used by `parseServerinfo` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L278)

<a id="field-field-mq3-client-cgame-servercmds-state-capturelimit-capturelimit-src-mq3-client-cgame-servercmds-ml-891464536"></a>
### capturelimit

```ml
capturelimit
```

Capture or objective-score limit parsed from the server's game information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L264)

<a id="field-field-mq3-client-cgame-servercmds-state-clients-clients-src-mq3-client-cgame-servercmds-ml-793883958"></a>
### clients

```ml
clients
```

Client records updated by player configstrings, score commands, and team-overlay commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L242)

<a id="field-field-mq3-client-cgame-servercmds-state-configstrings-configstrings-src-mq3-client-cgame-servercmds-ml-529660306"></a>
### configstrings

```ml
configstrings
```

Server configuration strings indexed by the native protocol's configuration-string identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L240)

<a id="field-field-mq3-client-cgame-servercmds-state-currentvoiceclient-currentvoiceclient-src-mq3-client-cgame-servercmds-ml-2138028666"></a>
### currentVoiceClient

```ml
currentVoiceClient
```

When constructing this record, `create` supplies `0` for this member. Used by `voiceChatLocal` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L370)

<a id="field-field-mq3-client-cgame-servercmds-state-dmflags-dmflags-src-mq3-client-cgame-servercmds-ml-1538981706"></a>
### dmflags

```ml
dmflags
```

When constructing this record, `create` supplies `0` for this member. Used by `parseServerinfo` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L256)

<a id="field-field-mq3-client-cgame-servercmds-state-flagstatus-flagstatus-src-mq3-client-cgame-servercmds-ml-638067630"></a>
### flagStatus

```ml
flagStatus
```

Current flag-objective state used by capture-the-flag presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L290)

<a id="field-field-mq3-client-cgame-servercmds-state-fraglimit-fraglimit-src-mq3-client-cgame-servercmds-ml-385119614"></a>
### fraglimit

```ml
fraglimit
```

When constructing this record, `create` supplies `0` for this member. Used by `parseServerinfo` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L262)

<a id="field-field-mq3-client-cgame-servercmds-state-fraglimitwarnings-fraglimitwarnings-src-mq3-client-cgame-servercmds-ml-1369181402"></a>
### fraglimitWarnings

```ml
fraglimitWarnings
```

Bitset recording which frag-limit warning thresholds have already been announced.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L343)

<a id="field-field-mq3-client-cgame-servercmds-state-gametype-gametype-src-mq3-client-cgame-servercmds-ml-538686458"></a>
### gametype

```ml
gametype
```

Game-rule identifier parsed from the current server-information configuration string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L253)

<a id="field-field-mq3-client-cgame-servercmds-state-headvoices-headvoices-src-mq3-client-cgame-servercmds-ml-1966996448"></a>
### headVoices

```ml
headVoices
```

When constructing this record, `create` supplies an empty list for this member. Used by `cacheHead` and `voiceChatListForClient` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L358)

<a id="field-field-mq3-client-cgame-servercmds-state-intermissionstarted-intermissionstarted-src-mq3-client-cgame-servercmds-ml-2098308090"></a>
### intermissionStarted

```ml
intermissionStarted
```

True after intermission begins, suppressing gameplay-only presentation such as voice rewards.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L324)

<a id="field-field-mq3-client-cgame-servercmds-state-levelshot-levelshot-src-mq3-client-cgame-servercmds-ml-570080170"></a>
### levelShot

```ml
levelShot
```

True while producing the menu screenshot for the current level.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L349)

<a id="field-field-mq3-client-cgame-servercmds-state-levelstarttime-levelstarttime-src-mq3-client-cgame-servercmds-ml-310659008"></a>
### levelStartTime

```ml
levelStartTime
```

Server timestamp at which the level began, used by elapsed-match-time displays.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L284)

<a id="field-field-mq3-client-cgame-servercmds-state-localclientnum-localclientnum-src-mq3-client-cgame-servercmds-ml-765502458"></a>
### localClientNum

```ml
localClientNum
```

When constructing this record, `create` supplies `0` for this member. Used by `playVoiceChat` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L397)

<a id="field-field-mq3-client-cgame-servercmds-state-mapname-mapname-src-mq3-client-cgame-servercmds-ml-520528930"></a>
### mapname

```ml
mapname
```

Map name parsed from server information or selected by the client UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L272)

<a id="field-field-mq3-client-cgame-servercmds-state-maprestart-maprestart-src-mq3-client-cgame-servercmds-ml-449409512"></a>
### mapRestart

```ml
mapRestart
```

True after a map restart, causing presentation and prediction state to be reinitialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L347)

<a id="field-field-mq3-client-cgame-servercmds-state-maxclients-maxclients-src-mq3-client-cgame-servercmds-ml-630785450"></a>
### maxclients

```ml
maxclients
```

When constructing this record, `create` supplies `0` for this member. Used by `parseServerinfo` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L270)

<a id="field-field-mq3-client-cgame-servercmds-state-notaunt-notaunt-src-mq3-client-cgame-servercmds-ml-949057206"></a>
### noTaunt

```ml
noTaunt
```

When constructing this record, `create` supplies `false` for this member. Used by `voiceChat` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L388)

<a id="field-field-mq3-client-cgame-servercmds-state-novoicechats-novoicechats-src-mq3-client-cgame-servercmds-ml-923871018"></a>
### noVoiceChats

```ml
noVoiceChats
```

When constructing this record, `create` supplies `false` for this member. Used by `playVoiceChat` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L391)

<a id="field-field-mq3-client-cgame-servercmds-state-novoicetext-novoicetext-src-mq3-client-cgame-servercmds-ml-1182094798"></a>
### noVoiceText

```ml
noVoiceText
```

When constructing this record, `create` supplies `false` for this member. Used by `playVoiceChat` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L394)

<a id="field-field-mq3-client-cgame-servercmds-state-numscores-numscores-src-mq3-client-cgame-servercmds-ml-462189758"></a>
### numScores

```ml
numScores
```

Number of valid scoreboard entries received from the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L246)

<a id="field-field-mq3-client-cgame-servercmds-state-randomcursor-randomcursor-src-mq3-client-cgame-servercmds-ml-449776924"></a>
### randomCursor

```ml
randomCursor
```

When constructing this record, `create` supplies `0.0` for this member. Used by `voiceChatLocal` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L400)

<a id="field-field-mq3-client-cgame-servercmds-state-redflag-redflag-src-mq3-client-cgame-servercmds-ml-1506595946"></a>
### redflag

```ml
redflag
```

Red-flag status received through server configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L286)

<a id="field-field-mq3-client-cgame-servercmds-state-redteam-redteam-src-mq3-client-cgame-servercmds-ml-458929018"></a>
### redTeam

```ml
redTeam
```

When constructing this record, `create` supplies an empty string for this member. Used by `parseServerinfo` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L275)

<a id="field-field-mq3-client-cgame-servercmds-state-scores-scores-src-mq3-client-cgame-servercmds-ml-329812120"></a>
### scores

```ml
scores
```

Scoreboard entries received from the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L244)

<a id="field-field-mq3-client-cgame-servercmds-state-scores1-scores1-src-mq3-client-cgame-servercmds-ml-309311410"></a>
### scores1

```ml
scores1
```

First team or leading player's score received through server configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L280)

<a id="field-field-mq3-client-cgame-servercmds-state-scores2-scores2-src-mq3-client-cgame-servercmds-ml-1258185690"></a>
### scores2

```ml
scores2
```

Second team or trailing player's score received through server configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L282)

<a id="field-field-mq3-client-cgame-servercmds-state-servercommandsequence-servercommandsequence-src-mq3-client-cgame-servercmds-ml-1693739786"></a>
### serverCommandSequence

```ml
serverCommandSequence
```

Last processed reliable server-command sequence, advanced while executing commands through the requested sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L352)

<a id="field-field-mq3-client-cgame-servercmds-state-sortedteamplayers-sortedteamplayers-src-mq3-client-cgame-servercmds-ml-1972385370"></a>
### sortedTeamPlayers

```ml
sortedTeamPlayers
```

When constructing this record, `create` supplies an empty list for this member. Used by `parseTeamInfo` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L251)

<a id="field-field-mq3-client-cgame-servercmds-state-teamchatheight-teamchatheight-src-mq3-client-cgame-servercmds-ml-658258670"></a>
### teamChatHeight

```ml
teamChatHeight
```

When constructing this record, `create` supplies `TEAMCHAT_HEIGHT` for this member. Used by `addToTeamChat` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L327)

<a id="field-field-mq3-client-cgame-servercmds-state-teamchatmsgs-teamchatmsgs-src-mq3-client-cgame-servercmds-ml-1847870492"></a>
### teamChatMsgs

```ml
teamChatMsgs
```

Color-coded team-chat lines retained in the bounded team-chat history.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L332)

<a id="field-field-mq3-client-cgame-servercmds-state-teamchatmsgtimes-teamchatmsgtimes-src-mq3-client-cgame-servercmds-ml-925134354"></a>
### teamChatMsgTimes

```ml
teamChatMsgTimes
```

Arrival timestamps corresponding to the stored team-chat lines.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L334)

<a id="field-field-mq3-client-cgame-servercmds-state-teamchatpos-teamchatpos-src-mq3-client-cgame-servercmds-ml-1942643618"></a>
### teamChatPos

```ml
teamChatPos
```

Next write position in the team-chat history ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L336)

<a id="field-field-mq3-client-cgame-servercmds-state-teamchatsonly-teamchatsonly-src-mq3-client-cgame-servercmds-ml-112236042"></a>
### teamChatsOnly

```ml
teamChatsOnly
```

When constructing this record, `create` supplies `false` for this member. Used by `voiceChatLocal` and `serverCommand` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L385)

<a id="field-field-mq3-client-cgame-servercmds-state-teamchattime-teamchattime-src-mq3-client-cgame-servercmds-ml-1642100610"></a>
### teamChatTime

```ml
teamChatTime
```

When constructing this record, `create` supplies `3000` for this member. Used by `addToTeamChat` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L330)

<a id="field-field-mq3-client-cgame-servercmds-state-teamflags-teamflags-src-mq3-client-cgame-servercmds-ml-805678102"></a>
### teamflags

```ml
teamflags
```

When constructing this record, `create` supplies `0` for this member. Used by `parseServerinfo` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L259)

<a id="field-field-mq3-client-cgame-servercmds-state-teamlastchatpos-teamlastchatpos-src-mq3-client-cgame-servercmds-ml-1089559410"></a>
### teamLastChatPos

```ml
teamLastChatPos
```

Oldest team-chat history position still eligible for display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L338)

<a id="field-field-mq3-client-cgame-servercmds-state-teamscores-teamscores-src-mq3-client-cgame-servercmds-ml-721499794"></a>
### teamScores

```ml
teamScores
```

Current score totals indexed by the two competing teams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L248)

<a id="field-field-mq3-client-cgame-servercmds-state-teamvotemodified-teamvotemodified-src-mq3-client-cgame-servercmds-ml-846517042"></a>
### teamVoteModified

```ml
teamVoteModified
```

Per-team indicators that team-vote information changed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L322)

<a id="field-field-mq3-client-cgame-servercmds-state-teamvoteno-teamvoteno-src-mq3-client-cgame-servercmds-ml-2019910274"></a>
### teamVoteNo

```ml
teamVoteNo
```

When constructing this record, `create` supplies `[0,0]` for this member. Used by `configStringModified` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L317)

<a id="field-field-mq3-client-cgame-servercmds-state-teamvotestring-teamvotestring-src-mq3-client-cgame-servercmds-ml-201726030"></a>
### teamVoteString

```ml
teamVoteString
```

When constructing this record, `create` supplies `["",""]` for this member. Used by `configStringModified` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L320)

<a id="field-field-mq3-client-cgame-servercmds-state-teamvotetime-teamvotetime-src-mq3-client-cgame-servercmds-ml-261612566"></a>
### teamVoteTime

```ml
teamVoteTime
```

When constructing this record, `create` supplies `[0,0]` for this member. Used by `configStringModified` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L311)

<a id="field-field-mq3-client-cgame-servercmds-state-teamvoteyes-teamvoteyes-src-mq3-client-cgame-servercmds-ml-1430053374"></a>
### teamVoteYes

```ml
teamVoteYes
```

When constructing this record, `create` supplies `[0,0]` for this member. Used by `configStringModified` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L314)

<a id="field-field-mq3-client-cgame-servercmds-state-time-time-src-mq3-client-cgame-servercmds-ml-1313566788"></a>
### time

```ml
time
```

Client-game timestamp in milliseconds used to schedule voice playback, orders, and server-command feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L341)

<a id="field-field-mq3-client-cgame-servercmds-state-timelimit-timelimit-src-mq3-client-cgame-servercmds-ml-2109154154"></a>
### timelimit

```ml
timelimit
```

When constructing this record, `create` supplies `0` for this member. Used by `parseServerinfo` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L267)

<a id="field-field-mq3-client-cgame-servercmds-state-timelimitwarnings-timelimitwarnings-src-mq3-client-cgame-servercmds-ml-367148022"></a>
### timelimitWarnings

```ml
timelimitWarnings
```

Bitset recording which time-limit warning thresholds have already been announced.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L345)

<a id="field-field-mq3-client-cgame-servercmds-state-voicebuffer-voicebuffer-src-mq3-client-cgame-servercmds-ml-1084364878"></a>
### voiceBuffer

```ml
voiceBuffer
```

When constructing this record, `create` supplies `array(MAX_VOICECHATBUFFER,void)` for this member. Used by `playBufferedVoiceChats` and `addBufferedVoiceChat` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L361)

<a id="field-field-mq3-client-cgame-servercmds-state-voicechatbufferin-voicechatbufferin-src-mq3-client-cgame-servercmds-ml-464408978"></a>
### voiceChatBufferIn

```ml
voiceChatBufferIn
```

Write position in the buffered voice-chat announcement ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L363)

<a id="field-field-mq3-client-cgame-servercmds-state-voicechatbufferout-voicechatbufferout-src-mq3-client-cgame-servercmds-ml-1551082810"></a>
### voiceChatBufferOut

```ml
voiceChatBufferOut
```

Read position in the buffered voice-chat announcement ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L365)

<a id="field-field-mq3-client-cgame-servercmds-state-voicechattime-voicechattime-src-mq3-client-cgame-servercmds-ml-802249190"></a>
### voiceChatTime

```ml
voiceChatTime
```

Next time at which a buffered voice-chat announcement may be played.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L367)

<a id="field-field-mq3-client-cgame-servercmds-state-voicelists-voicelists-src-mq3-client-cgame-servercmds-ml-822297868"></a>
### voiceLists

```ml
voiceLists
```

When constructing this record, `create` supplies an empty list for this member. Used by `loadVoiceChats` and `headModelVoiceChats` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L355)

<a id="field-field-mq3-client-cgame-servercmds-state-votemodified-votemodified-src-mq3-client-cgame-servercmds-ml-1323647892"></a>
### voteModified

```ml
voteModified
```

True when vote information changed and the UI should refresh or play feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L308)

<a id="field-field-mq3-client-cgame-servercmds-state-voteno-voteno-src-mq3-client-cgame-servercmds-ml-648734748"></a>
### voteNo

```ml
voteNo
```

When constructing this record, `create` supplies `0` for this member. Used by `configStringModified` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L303)

<a id="field-field-mq3-client-cgame-servercmds-state-votestring-votestring-src-mq3-client-cgame-servercmds-ml-434770500"></a>
### voteString

```ml
voteString
```

When constructing this record, `create` supplies an empty string for this member. Used by `configStringModified` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L306)

<a id="field-field-mq3-client-cgame-servercmds-state-votetime-votetime-src-mq3-client-cgame-servercmds-ml-171494136"></a>
### voteTime

```ml
voteTime
```

When constructing this record, `create` supplies `0` for this member. Used by `configStringModified` and `mapRestart` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L297)

<a id="field-field-mq3-client-cgame-servercmds-state-voteyes-voteyes-src-mq3-client-cgame-servercmds-ml-433924090"></a>
### voteYes

```ml
voteYes
```

When constructing this record, `create` supplies `0` for this member. Used by `configStringModified` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L300)

<a id="field-field-mq3-client-cgame-servercmds-state-warmup-warmup-src-mq3-client-cgame-servercmds-ml-1287696822"></a>
### warmup

```ml
warmup
```

Warmup deadline or state supplied by the server's warmup configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L292)

<a id="field-field-mq3-client-cgame-servercmds-state-warmupcount-warmupcount-src-mq3-client-cgame-servercmds-ml-1757051550"></a>
### warmupCount

```ml
warmupCount
```

Last warmup countdown value announced to the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L294)
