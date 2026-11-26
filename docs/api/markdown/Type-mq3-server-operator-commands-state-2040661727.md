# `mq3.server.operator_commands.State`

[Home](README.md) · [Source file](File-src-mq3-server-operator-commands-ml-2061061336.md)

<a id="struct-struct-mq3-server-operator-commands-state-struct-state-src-mq3-server-operator-commands-ml-1395996611"></a>
## State

```ml
struct State
```

State record for server.operator_commands, containing `running`, `dedicated`, `args`, `rawArgs`, `clients`, `maxclients`, and 23 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L91)

## Members

<a id="field-field-mq3-server-operator-commands-state-actions-actions-src-mq3-server-operator-commands-ml-2126577428"></a>
### actions

```ml
actions
```

Recorded administrative requests such as player management, map changes, and console output.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L142)

<a id="field-field-mq3-server-operator-commands-state-args-args-src-mq3-server-operator-commands-ml-1967398598"></a>
### args

```ml
args
```

Parsed command arguments supplied to the operator-command handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L97)

<a id="field-field-mq3-server-operator-commands-state-authorizeip-authorizeip-src-mq3-server-operator-commands-ml-716452200"></a>
### authorizeIp

```ml
authorizeIp
```

Resolved address bytes of the authorization service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L136)

<a id="field-field-mq3-server-operator-commands-state-authorizetype-authorizetype-src-mq3-server-operator-commands-ml-133698724"></a>
### authorizeType

```ml
authorizeType
```

Resolved network-address kind of the authorization service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L134)

<a id="field-field-mq3-server-operator-commands-state-clients-clients-src-mq3-server-operator-commands-ml-964550228"></a>
### clients

```ml
clients
```

Player slots searched by operator lookup, status, kick, and administrative commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L101)

<a id="field-field-mq3-server-operator-commands-state-commandnames-commandnames-src-mq3-server-operator-commands-ml-461866514"></a>
### commandNames

```ml
commandNames
```

Names of the registered server operator commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L140)

<a id="field-field-mq3-server-operator-commands-state-commandsinitialized-commandsinitialized-src-mq3-server-operator-commands-ml-1370131456"></a>
### commandsInitialized

```ml
commandsInitialized
```

True after server operator commands have been registered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L138)

<a id="field-field-mq3-server-operator-commands-state-configstrings-configstrings-src-mq3-server-operator-commands-ml-169106040"></a>
### configstrings

```ml
configstrings
```

Server configuration strings indexed by their protocol slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L146)

<a id="field-field-mq3-server-operator-commands-state-cvars-cvars-src-mq3-server-operator-commands-ml-1928469196"></a>
### cvars

```ml
cvars
```

Configuration-variable registry consulted by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L109)

<a id="field-field-mq3-server-operator-commands-state-dedicated-dedicated-src-mq3-server-operator-commands-ml-859303404"></a>
### dedicated

```ml
dedicated
```

True when the server runs without a local graphical client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L95)

<a id="field-field-mq3-server-operator-commands-state-frametime-frametime-src-mq3-server-operator-commands-ml-1746050872"></a>
### frameTime

```ml
frameTime
```

Host frame timestamp used when scheduling a map restart.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L117)

<a id="field-field-mq3-server-operator-commands-state-gametype-gametype-src-mq3-server-operator-commands-ml-571798208"></a>
### gametype

```ml
gametype
```

Game-mode identifier used when applying mode-specific rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L105)

<a id="field-field-mq3-server-operator-commands-state-gametypemodified-gametypemodified-src-mq3-server-operator-commands-ml-2005656858"></a>
### gametypeModified

```ml
gametypeModified
```

True when a changed game mode requires server reinitialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L113)

<a id="field-field-mq3-server-operator-commands-state-hostcontext-hostcontext-src-mq3-server-operator-commands-ml-1674747044"></a>
### hostContext

```ml
hostContext
```

Opaque host data passed to the operator-action callback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L150)

<a id="field-field-mq3-server-operator-commands-state-hostfn-hostfn-src-mq3-server-operator-commands-ml-1701892956"></a>
### hostFn

```ml
hostFn
```

Host callback that dispatches a subsystem action to the embedding host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L148)

<a id="field-field-mq3-server-operator-commands-state-mapfiles-mapfiles-src-mq3-server-operator-commands-ml-1644660174"></a>
### mapFiles

```ml
mapFiles
```

Available BSP map files used to validate map commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L115)

<a id="field-field-mq3-server-operator-commands-state-mapname-mapname-src-mq3-server-operator-commands-ml-1265393336"></a>
### mapname

```ml
mapname
```

Name of the current game map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L107)

<a id="field-field-mq3-server-operator-commands-state-maxclients-maxclients-src-mq3-server-operator-commands-ml-668110872"></a>
### maxclients

```ml
maxclients
```

Client-slot bound used by operator player lookup and status iteration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L103)

<a id="field-field-mq3-server-operator-commands-state-maxclientsmodified-maxclientsmodified-src-mq3-server-operator-commands-ml-207430454"></a>
### maxclientsModified

```ml
maxclientsModified
```

True when a changed client-slot limit requires server reinitialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L111)

<a id="field-field-mq3-server-operator-commands-state-nextheartbeat-nextheartbeat-src-mq3-server-operator-commands-ml-559214060"></a>
### nextHeartbeat

```ml
nextHeartbeat
```

Server time at which the next master heartbeat should be sent.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L132)

<a id="field-field-mq3-server-operator-commands-state-prints-prints-src-mq3-server-operator-commands-ml-111841584"></a>
### prints

```ml
prints
```

Console output recorded while executing operator commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L144)

<a id="field-field-mq3-server-operator-commands-state-rawargs-rawargs-src-mq3-server-operator-commands-ml-219925976"></a>
### rawArgs

```ml
rawArgs
```

Unmodified command argument text supplied by the operator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L99)

<a id="field-field-mq3-server-operator-commands-state-restarting-restarting-src-mq3-server-operator-commands-ml-1791417630"></a>
### restarting

```ml
restarting
```

True while the server performs an in-place map restart.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L130)

<a id="field-field-mq3-server-operator-commands-state-restarttime-restarttime-src-mq3-server-operator-commands-ml-1885604864"></a>
### restartTime

```ml
restartTime
```

Scheduled time for restarting the current map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L121)

<a id="field-field-mq3-server-operator-commands-state-running-running-src-mq3-server-operator-commands-ml-614258020"></a>
### running

```ml
running
```

True while the server or represented subsystem is running.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L93)

<a id="field-field-mq3-server-operator-commands-state-serverid-serverid-src-mq3-server-operator-commands-ml-1807443916"></a>
### serverId

```ml
serverId
```

Identifier distinguishing the current server or map session.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L119)

<a id="field-field-mq3-server-operator-commands-state-serverstate-serverstate-src-mq3-server-operator-commands-ml-232658580"></a>
### serverState

```ml
serverState
```

Current server lifecycle state, including loading and active gameplay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L128)

<a id="field-field-mq3-server-operator-commands-state-snapflag-snapflag-src-mq3-server-operator-commands-ml-756809196"></a>
### snapFlag

```ml
snapFlag
```

Snapshot toggle bit changed when the server restarts a map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L126)

<a id="field-field-mq3-server-operator-commands-state-time-time-src-mq3-server-operator-commands-ml-160086238"></a>
### time

```ml
time
```

Current server time used for operator-visible player status and administrative actions, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L124)
