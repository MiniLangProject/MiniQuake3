# `mq3.game.bot_command_matches.Bot`

[Home](README.md) · [Source file](File-src-mq3-game-bot-command-matches-ml-960564493.md)

<a id="struct-struct-mq3-game-bot-command-matches-bot-struct-bot-src-mq3-game-bot-command-matches-ml-361127575"></a>
## Bot

```ml
struct Bot
```

`Bot` record for bot command matches, containing `client`, `entitynum`, `cs`, `team` and `origin` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L279)

## Members

<a id="field-field-mq3-game-bot-command-matches-bot-areanum-areanum-src-mq3-game-bot-command-matches-ml-605643814"></a>
### areanum

```ml
areanum
```

AAS area containing the bot or spatial goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L293)

<a id="field-field-mq3-game-bot-command-matches-bot-arrivetime-arrivetime-src-mq3-game-bot-command-matches-ml-365621894"></a>
### arriveTime

```ml
arriveTime
```

Timestamp at which the bot arrived at the current team goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L329)

<a id="field-field-mq3-game-bot-command-matches-bot-attackawaytime-attackawaytime-src-mq3-game-bot-command-matches-ml-1365328104"></a>
### attackawayTime

```ml
attackawayTime
```

Time controlling temporary excursions from an attack-base goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L333)

<a id="field-field-mq3-game-bot-command-matches-bot-blueflagstatus-blueflagstatus-src-mq3-game-bot-command-matches-ml-1914378262"></a>
### blueflagstatus

```ml
blueflagstatus
```

Bot-tracked status of the blue flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L353)

<a id="field-field-mq3-game-bot-command-matches-bot-checkpoints-checkpoints-src-mq3-game-bot-command-matches-ml-274939286"></a>
### checkpoints

```ml
checkpoints
```

Linked or indexed checkpoint goals available to the bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L347)

<a id="field-field-mq3-game-bot-command-matches-bot-client-client-src-mq3-game-bot-command-matches-ml-588185296"></a>
### client

```ml
client
```

Client slot of the bot receiving and interpreting text commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L281)

<a id="field-field-mq3-game-bot-command-matches-bot-cs-cs-src-mq3-game-bot-command-matches-ml-1608650078"></a>
### cs

```ml
cs
```

Botlib chat-state handle owned by this bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L285)

<a id="field-field-mq3-game-bot-command-matches-bot-curpatrolpoint-curpatrolpoint-src-mq3-game-bot-command-matches-ml-2005963206"></a>
### curpatrolpoint

```ml
curpatrolpoint
```

Patrol goal currently being approached.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L343)

<a id="field-field-mq3-game-bot-command-matches-bot-decisionmaker-decisionmaker-src-mq3-game-bot-command-matches-ml-1479607054"></a>
### decisionmaker

```ml
decisionmaker
```

Client/entity currently responsible for the bot team decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L299)

<a id="field-field-mq3-game-bot-command-matches-bot-defendawaytime-defendawaytime-src-mq3-game-bot-command-matches-ml-1312622980"></a>
### defendawayTime

```ml
defendawayTime
```

Time controlling how long the bot may leave its defense goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L331)

<a id="field-field-mq3-game-bot-command-matches-bot-entitynum-entitynum-src-mq3-game-bot-command-matches-ml-1079871898"></a>
### entitynum

```ml
entitynum
```

Entity number of the bot interpreting a matched text order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L283)

<a id="field-field-mq3-game-bot-command-matches-bot-eye-eye-src-mq3-game-bot-command-matches-ml-1381021846"></a>
### eye

```ml
eye
```

Eye position used as the origin of visibility and aiming queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L291)

<a id="field-field-mq3-game-bot-command-matches-bot-flagcarrier-flagcarrier-src-mq3-game-bot-command-matches-ml-2023142222"></a>
### flagcarrier

```ml
flagcarrier
```

Client/entity currently carrying the flag of interest.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L355)

<a id="field-field-mq3-game-bot-command-matches-bot-flagstatuschanged-flagstatuschanged-src-mq3-game-bot-command-matches-ml-1524563410"></a>
### flagstatuschanged

```ml
flagstatuschanged
```

Nonzero after a tracked flag status changes and needs processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L357)

<a id="field-field-mq3-game-bot-command-matches-bot-forceorders-forceorders-src-mq3-game-bot-command-matches-ml-197747214"></a>
### forceorders

```ml
forceorders
```

Nonzero when the team leader must issue new orders.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L349)

<a id="field-field-mq3-game-bot-command-matches-bot-formationdist-formationdist-src-mq3-game-bot-command-matches-ml-1720156398"></a>
### formationDist

```ml
formationDist
```

Desired separation from the teammate or formation leader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L327)

<a id="field-field-mq3-game-bot-command-matches-bot-harvestawaytime-harvestawaytime-src-mq3-game-bot-command-matches-ml-1842015326"></a>
### harvestawayTime

```ml
harvestawayTime
```

Time controlling temporary excursions from a harvesting goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L335)

<a id="field-field-mq3-game-bot-command-matches-bot-lastflagcapturetime-lastflagcapturetime-src-mq3-game-bot-command-matches-ml-366577562"></a>
### lastflagcaptureTime

```ml
lastflagcaptureTime
```

Timestamp of the last flag capture observed by the bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L359)

<a id="field-field-mq3-game-bot-command-matches-bot-lastgoalltgtype-lastgoalltgtype-src-mq3-game-bot-command-matches-ml-173839638"></a>
### lastgoalLtgtype

```ml
lastgoalLtgtype
```

Long-term goal type retained from the preceding team task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L311)

<a id="field-field-mq3-game-bot-command-matches-bot-leadmessagetime-leadmessagetime-src-mq3-game-bot-command-matches-ml-574429218"></a>
### leadmessageTime

```ml
leadmessageTime
```

Time controlling the next message to the teammate being led.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L321)

<a id="field-field-mq3-game-bot-command-matches-bot-leadteamgoal-leadteamgoal-src-mq3-game-bot-command-matches-ml-1851314650"></a>
### leadTeamgoal

```ml
leadTeamgoal
```

Navigation goal toward which the bot is leading a teammate.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L317)

<a id="field-field-mq3-game-bot-command-matches-bot-leadteammate-leadteammate-src-mq3-game-bot-command-matches-ml-2123896078"></a>
### leadTeammate

```ml
leadTeammate
```

Client/entity identifier of the teammate being led.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L315)

<a id="field-field-mq3-game-bot-command-matches-bot-leadtime-leadtime-src-mq3-game-bot-command-matches-ml-686858248"></a>
### leadTime

```ml
leadTime
```

Deadline associated with leading a teammate toward a goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L313)

<a id="field-field-mq3-game-bot-command-matches-bot-leadvisibletime-leadvisibletime-src-mq3-game-bot-command-matches-ml-530144362"></a>
### leadvisibleTime

```ml
leadvisibleTime
```

Last time the teammate being led was visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L319)

<a id="field-field-mq3-game-bot-command-matches-bot-ltgtype-ltgtype-src-mq3-game-bot-command-matches-ml-1447502674"></a>
### ltgtype

```ml
ltgtype
```

Current long-term goal category selected from the LTG_* constants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L309)

<a id="field-field-mq3-game-bot-command-matches-bot-ordered-ordered-src-mq3-game-bot-command-matches-ml-145822558"></a>
### ordered

```ml
ordered
```

Nonzero when a teammate explicitly ordered the current team task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L301)

<a id="field-field-mq3-game-bot-command-matches-bot-ordertime-ordertime-src-mq3-game-bot-command-matches-ml-1088087518"></a>
### orderTime

```ml
orderTime
```

Timestamp at which the bot order was received.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L303)

<a id="field-field-mq3-game-bot-command-matches-bot-origin-origin-src-mq3-game-bot-command-matches-ml-1154635806"></a>
### origin

```ml
origin
```

Current bot position used to resolve locations and goals in text commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L289)

<a id="field-field-mq3-game-bot-command-matches-bot-patrolflags-patrolflags-src-mq3-game-bot-command-matches-ml-1829226666"></a>
### patrolflags

```ml
patrolflags
```

PATROL_* behavior flags associated with the current patrol route.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L345)

<a id="field-field-mq3-game-bot-command-matches-bot-patrolpoints-patrolpoints-src-mq3-game-bot-command-matches-ml-2110600076"></a>
### patrolpoints

```ml
patrolpoints
```

Patrol goals traversed by the bot patrol behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L341)

<a id="field-field-mq3-game-bot-command-matches-bot-redflagstatus-redflagstatus-src-mq3-game-bot-command-matches-ml-1964326122"></a>
### redflagstatus

```ml
redflagstatus
```

Bot-tracked status of the red flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L351)

<a id="field-field-mq3-game-bot-command-matches-bot-rushbaseawaytime-rushbaseawaytime-src-mq3-game-bot-command-matches-ml-1748847910"></a>
### rushbaseawayTime

```ml
rushbaseawayTime
```

Time controlling temporary excursions from a rush-base goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L337)

<a id="field-field-mq3-game-bot-command-matches-bot-subteam-subteam-src-mq3-game-bot-command-matches-ml-413189426"></a>
### subteam

```ml
subteam
```

Name of the bot current cooperative subteam.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L295)

<a id="field-field-mq3-game-bot-command-matches-bot-team-team-src-mq3-game-bot-command-matches-ml-1232930760"></a>
### team

```ml
team
```

Team assignment associated with the client, bot, or action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L287)

<a id="field-field-mq3-game-bot-command-matches-bot-teamgoal-teamgoal-src-mq3-game-bot-command-matches-ml-2055838862"></a>
### teamgoal

```ml
teamgoal
```

Navigation goal associated with the bot current team task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L339)

<a id="field-field-mq3-game-bot-command-matches-bot-teamgoaltime-teamgoaltime-src-mq3-game-bot-command-matches-ml-851042924"></a>
### teamgoalTime

```ml
teamgoalTime
```

Deadline associated with the current cooperative team goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L307)

<a id="field-field-mq3-game-bot-command-matches-bot-teamleader-teamleader-src-mq3-game-bot-command-matches-ml-692449230"></a>
### teamleader

```ml
teamleader
```

Name or identifier of the current bot-team leader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L297)

<a id="field-field-mq3-game-bot-command-matches-bot-teammate-teammate-src-mq3-game-bot-command-matches-ml-684100234"></a>
### teammate

```ml
teammate
```

Teammate entity/client selected for the current cooperative task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L323)

<a id="field-field-mq3-game-bot-command-matches-bot-teammatevisibletime-teammatevisibletime-src-mq3-game-bot-command-matches-ml-1261795770"></a>
### teammatevisibleTime

```ml
teammatevisibleTime
```

Last time the teammate associated with the task was visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L325)

<a id="field-field-mq3-game-bot-command-matches-bot-teammessagetime-teammessagetime-src-mq3-game-bot-command-matches-ml-1232239970"></a>
### teammessageTime

```ml
teammessageTime
```

Time controlling the next bot team message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L305)
