# `mq3.server.game_interface.State`

[Home](README.md) · [Source file](File-src-mq3-server-game-interface-ml-1640517219.md)

<a id="struct-struct-mq3-server-game-interface-state-struct-state-src-mq3-server-game-interface-ml-1039536551"></a>
## State

```ml
struct State
```

State record for server.game_interface, containing `gentities`, `gentitySize`, `numEntities`, `gameClients`, `gameClientSize`, `maxClients`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L31)

## Members

<a id="field-field-mq3-server-game-interface-state-clients-clients-src-mq3-server-game-interface-ml-1202314730"></a>
### clients

```ml
clients
```

Client records accessible to game VM player-state and server-command operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L49)

<a id="field-field-mq3-server-game-interface-state-gameclients-gameclients-src-mq3-server-game-interface-ml-1324479126"></a>
### gameClients

```ml
gameClients
```

Game-VM client records associated with the server client slots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L39)

<a id="field-field-mq3-server-game-interface-state-gameclientsize-gameclientsize-src-mq3-server-game-interface-ml-174553422"></a>
### gameClientSize

```ml
gameClientSize
```

Will be > sizeof(playerState_t) due to game private data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L41)

<a id="field-field-mq3-server-game-interface-state-gentities-gentities-src-mq3-server-game-interface-ml-1294067078"></a>
### gentities

```ml
gentities
```

Game-VM entity array exposed to server-side collision and snapshot code.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L33)

<a id="field-field-mq3-server-game-interface-state-gentitysize-gentitysize-src-mq3-server-game-interface-ml-846778770"></a>
### gentitySize

```ml
gentitySize
```

Byte stride between game-VM entity records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L35)

<a id="field-field-mq3-server-game-interface-state-maxclients-maxclients-src-mq3-server-game-interface-ml-1419575334"></a>
### maxClients

```ml
maxClients
```

Upper client-slot bound applied by game VM server-interface operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L43)

<a id="field-field-mq3-server-game-interface-state-numentities-numentities-src-mq3-server-game-interface-ml-1111329770"></a>
### numEntities

```ml
numEntities
```

Number of entity records currently represented by this state or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L37)

<a id="field-field-mq3-server-game-interface-state-serverinfo-serverinfo-src-mq3-server-game-interface-ml-1094254548"></a>
### serverInfo

```ml
serverInfo
```

Backslash-delimited information string advertised by the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L47)

<a id="field-field-mq3-server-game-interface-state-serverstate-serverstate-src-mq3-server-game-interface-ml-2066131602"></a>
### serverState

```ml
serverState
```

Current server lifecycle state, including loading and active gameplay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L45)

<a id="field-field-mq3-server-game-interface-state-sventities-sventities-src-mq3-server-game-interface-ml-1302885734"></a>
### svEntities

```ml
svEntities
```

Server-owned visibility and collision bookkeeping for game entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L51)
