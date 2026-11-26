# `mq3.game.g_local.ClientPersistant`

[Home](README.md) · [Source file](File-src-mq3-game-g-local-ml-1293969097.md)

<a id="struct-struct-mq3-game-g-local-clientpersistant-struct-clientpersistant-src-mq3-game-g-local-ml-1286048419"></a>
## ClientPersistant

```ml
struct ClientPersistant
```

`ClientPersistant` record for g local, containing `connected`, `cmd`, `localClient`, `initialSpawn` and `predictItemPickup` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L146)

## Members

<a id="field-field-mq3-game-g-local-clientpersistant-cmd-cmd-src-mq3-game-g-local-ml-998661287"></a>
### cmd

```ml
cmd
```

Current user-command input supplied to movement or client processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L150)

<a id="field-field-mq3-game-g-local-clientpersistant-connected-connected-src-mq3-game-g-local-ml-1047317379"></a>
### connected

```ml
connected
```

Client connection state used to distinguish disconnected, connecting, and active clients.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L148)

<a id="field-field-mq3-game-g-local-clientpersistant-entertime-entertime-src-mq3-game-g-local-ml-848746139"></a>
### enterTime

```ml
enterTime
```

Game timestamp at which the client entered play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L164)

<a id="field-field-mq3-game-g-local-clientpersistant-initialspawn-initialspawn-src-mq3-game-g-local-ml-494966917"></a>
### initialSpawn

```ml
initialSpawn
```

Nonzero while selecting or performing the client first spawn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L154)

<a id="field-field-mq3-game-g-local-clientpersistant-localclient-localclient-src-mq3-game-g-local-ml-1214034523"></a>
### localClient

```ml
localClient
```

Nonzero when this client is the local listen-server client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L152)

<a id="field-field-mq3-game-g-local-clientpersistant-maxhealth-maxhealth-src-mq3-game-g-local-ml-473811219"></a>
### maxHealth

```ml
maxHealth
```

Maximum normal health used when spawning or replenishing the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L162)

<a id="field-field-mq3-game-g-local-clientpersistant-netname-netname-src-mq3-game-g-local-ml-274834555"></a>
### netname

```ml
netname
```

Player name advertised in user information and score/chat messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L160)

<a id="field-field-mq3-game-g-local-clientpersistant-pmovefixed-pmovefixed-src-mq3-game-g-local-ml-1694361145"></a>
### pmoveFixed

```ml
pmoveFixed
```

Nonzero when player movement uses a fixed simulation step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L158)

<a id="field-field-mq3-game-g-local-clientpersistant-predictitempickup-predictitempickup-src-mq3-game-g-local-ml-2104508563"></a>
### predictItemPickup

```ml
predictItemPickup
```

Nonzero when the client is allowed to predict item pickups.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L156)

<a id="field-field-mq3-game-g-local-clientpersistant-teaminfo-teaminfo-src-mq3-game-g-local-ml-529574921"></a>
### teamInfo

```ml
teamInfo
```

Nonzero when this client requests team-overlay information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L172)

<a id="field-field-mq3-game-g-local-clientpersistant-teamstate-teamstate-src-mq3-game-g-local-ml-1327929643"></a>
### teamState

```ml
teamState
```

Shared bot team-decision state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L166)

<a id="field-field-mq3-game-g-local-clientpersistant-teamvotecount-teamvotecount-src-mq3-game-g-local-ml-1044865791"></a>
### teamVoteCount

```ml
teamVoteCount
```

Number of team votes initiated by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L170)

<a id="field-field-mq3-game-g-local-clientpersistant-votecount-votecount-src-mq3-game-g-local-ml-150707235"></a>
### voteCount

```ml
voteCount
```

Number of global votes initiated by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_local.ml#L168)
