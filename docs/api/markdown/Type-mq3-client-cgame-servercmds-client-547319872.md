# `mq3.client.cgame_servercmds.Client`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-servercmds-ml-56240583.md)

<a id="struct-struct-mq3-client-cgame-servercmds-client-struct-client-src-mq3-client-cgame-servercmds-ml-367706919"></a>
## Client

```ml
struct Client
```

Stores client game servercmds client record, including `name`, `team`, `score`, `powerups`, `location`, `health` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L141)

## Members

<a id="field-field-mq3-client-cgame-servercmds-client-armor-armor-src-mq3-client-cgame-servercmds-ml-464876558"></a>
### armor

```ml
armor
```

Teammate armor decoded from the server team-information payload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L156)

<a id="field-field-mq3-client-cgame-servercmds-client-curweapon-curweapon-src-mq3-client-cgame-servercmds-ml-223197218"></a>
### curWeapon

```ml
curWeapon
```

Currently selected weapon identifier for the client-information entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L158)

<a id="field-field-mq3-client-cgame-servercmds-client-gender-gender-src-mq3-client-cgame-servercmds-ml-1380916588"></a>
### gender

```ml
gender
```

Model gender used when selecting gender-specific player sounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L160)

<a id="field-field-mq3-client-cgame-servercmds-client-headmodelname-headmodelname-src-mq3-client-cgame-servercmds-ml-1878720506"></a>
### headModelName

```ml
headModelName
```

Virtual model name selected for the player's head.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L162)

<a id="field-field-mq3-client-cgame-servercmds-client-headskinname-headskinname-src-mq3-client-cgame-servercmds-ml-772543414"></a>
### headSkinName

```ml
headSkinName
```

Skin name selected for the player's head model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L164)

<a id="field-field-mq3-client-cgame-servercmds-client-health-health-src-mq3-client-cgame-servercmds-ml-917023226"></a>
### health

```ml
health
```

Teammate health decoded from a server team-information command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L154)

<a id="field-field-mq3-client-cgame-servercmds-client-location-location-src-mq3-client-cgame-servercmds-ml-1481732572"></a>
### location

```ml
location
```

When constructing this record, `client` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L152)

<a id="field-field-mq3-client-cgame-servercmds-client-name-name-src-mq3-client-cgame-servercmds-ml-427875052"></a>
### name

```ml
name
```

Player name retained from server configuration strings for client-game server-command presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L144)

<a id="field-field-mq3-client-cgame-servercmds-client-powerups-powerups-src-mq3-client-cgame-servercmds-ml-498806260"></a>
### powerups

```ml
powerups
```

Latest player powerup bitmask copied from score or team-overlay server commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L150)

<a id="field-field-mq3-client-cgame-servercmds-client-score-score-src-mq3-client-cgame-servercmds-ml-562007986"></a>
### score

```ml
score
```

Latest reported player score copied into client information by score-command processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L148)

<a id="field-field-mq3-client-cgame-servercmds-client-team-team-src-mq3-client-cgame-servercmds-ml-1705929924"></a>
### team

```ml
team
```

Client team membership retained while interpreting scoreboard and team-information commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L146)
