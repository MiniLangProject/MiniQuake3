# `mq3.game.ai_team.Bot`

[Home](README.md) · [Source file](File-src-mq3-game-ai-team-ml-162745936.md)

<a id="struct-struct-mq3-game-ai-team-bot-struct-bot-src-mq3-game-ai-team-ml-967163135"></a>
## Bot

```ml
struct Bot
```

`Bot` record for ai team, containing `client`, `cs`, `teamleader`, `entergameTime` and `askteamleaderTime` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L85)

## Members

<a id="field-field-mq3-game-ai-team-bot-askteamleadertime-askteamleadertime-src-mq3-game-ai-team-ml-2049182140"></a>
### askteamleaderTime

```ml
askteamleaderTime
```

Deadline for the bot next request for a team leader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L95)

<a id="field-field-mq3-game-ai-team-bot-becometeamleadertime-becometeamleadertime-src-mq3-game-ai-team-ml-1863511664"></a>
### becometeamleaderTime

```ml
becometeamleaderTime
```

Time controlling when the bot may volunteer as team leader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L97)

<a id="field-field-mq3-game-ai-team-bot-blueflagstatus-blueflagstatus-src-mq3-game-ai-team-ml-1626526632"></a>
### blueflagstatus

```ml
blueflagstatus
```

Bot-tracked status of the blue flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L109)

<a id="field-field-mq3-game-ai-team-bot-client-client-src-mq3-game-ai-team-ml-1131957362"></a>
### client

```ml
client
```

Client slot of the bot participating in team-strategy decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L87)

<a id="field-field-mq3-game-ai-team-bot-cs-cs-src-mq3-game-ai-team-ml-1046252100"></a>
### cs

```ml
cs
```

Botlib chat-state handle owned by this bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L89)

<a id="field-field-mq3-game-ai-team-bot-ctfstrategy-ctfstrategy-src-mq3-game-ai-team-ml-1337352136"></a>
### ctfstrategy

```ml
ctfstrategy
```

Selected capture-the-flag team strategy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L103)

<a id="field-field-mq3-game-ai-team-bot-entergametime-entergametime-src-mq3-game-ai-team-ml-1838021124"></a>
### entergameTime

```ml
entergameTime
```

Timestamp at which this bot entered the game.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L93)

<a id="field-field-mq3-game-ai-team-bot-flagcarrier-flagcarrier-src-mq3-game-ai-team-ml-317384272"></a>
### flagcarrier

```ml
flagcarrier
```

Client/entity currently carrying the flag of interest.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L101)

<a id="field-field-mq3-game-ai-team-bot-flagstatuschanged-flagstatuschanged-src-mq3-game-ai-team-ml-699994636"></a>
### flagstatuschanged

```ml
flagstatuschanged
```

Nonzero after a tracked flag status changes and needs processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L111)

<a id="field-field-mq3-game-ai-team-bot-forceorders-forceorders-src-mq3-game-ai-team-ml-1117407568"></a>
### forceorders

```ml
forceorders
```

Nonzero when the team leader must issue new orders.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L113)

<a id="field-field-mq3-game-ai-team-bot-lastflagcapturetime-lastflagcapturetime-src-mq3-game-ai-team-ml-1699093956"></a>
### lastflagcaptureTime

```ml
lastflagcaptureTime
```

Timestamp of the last flag capture observed by the bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L117)

<a id="field-field-mq3-game-ai-team-bot-neutralflagstatus-neutralflagstatus-src-mq3-game-ai-team-ml-1504409380"></a>
### neutralflagstatus

```ml
neutralflagstatus
```

Bot-tracked status of the neutral flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L105)

<a id="field-field-mq3-game-ai-team-bot-numteammates-numteammates-src-mq3-game-ai-team-ml-1137524966"></a>
### numteammates

```ml
numteammates
```

Number of teammates considered by the team decision logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L99)

<a id="field-field-mq3-game-ai-team-bot-redflagstatus-redflagstatus-src-mq3-game-ai-team-ml-743539932"></a>
### redflagstatus

```ml
redflagstatus
```

Bot-tracked status of the red flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L107)

<a id="field-field-mq3-game-ai-team-bot-teamgiveorderstime-teamgiveorderstime-src-mq3-game-ai-team-ml-1943163440"></a>
### teamgiveordersTime

```ml
teamgiveordersTime
```

Next time at which the bot team leader should issue orders.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L115)

<a id="field-field-mq3-game-ai-team-bot-teamleader-teamleader-src-mq3-game-ai-team-ml-698320816"></a>
### teamleader

```ml
teamleader
```

Name or identifier of the current bot-team leader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L91)
