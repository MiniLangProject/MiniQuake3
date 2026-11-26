# `mq3.game.spawn.State`

[Home](README.md) · [Source file](File-src-mq3-game-spawn-ml-944765303.md)

<a id="struct-struct-mq3-game-spawn-state-struct-state-src-mq3-game-spawn-ml-1306088943"></a>
## State

```ml
struct State
```

`State` record for spawn, containing `level`, `parser`, `vars`, `chars` and `spawning` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L20)

## Members

<a id="field-field-mq3-game-spawn-state-chars-chars-src-mq3-game-spawn-ml-734811854"></a>
### chars

```ml
chars
```

Character storage for parsed map spawn variables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L28)

<a id="field-field-mq3-game-spawn-state-configstrings-configstrings-src-mq3-game-spawn-ml-924136966"></a>
### configstrings

```ml
configstrings
```

Indexed game configuration strings advertised to connected clients.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L45)

<a id="field-field-mq3-game-spawn-state-context-context-src-mq3-game-spawn-ml-1052179182"></a>
### context

```ml
context
```

Opaque caller-supplied context available to map-spawn effects and unported-entity notification callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L54)

<a id="field-field-mq3-game-spawn-state-cvars-cvars-src-mq3-game-spawn-ml-1460890690"></a>
### cvars

```ml
cvars
```

Console-variable registry or pending console-variable updates used by the module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L47)

<a id="field-field-mq3-game-spawn-state-dowarmup-dowarmup-src-mq3-game-spawn-ml-670989984"></a>
### doWarmup

```ml
doWarmup
```

Setting controlling whether matches use the warmup stage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L39)

<a id="field-field-mq3-game-spawn-state-effectfn-effectfn-src-mq3-game-spawn-ml-1560426596"></a>
### effectFn

```ml
effectFn
```

Injected callback for effect; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L51)

<a id="field-field-mq3-game-spawn-state-gametype-gametype-src-mq3-game-spawn-ml-1520557542"></a>
### gametype

```ml
gametype
```

GT_* game-mode identifier used for filtering and initializing map entities for the selected game mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L33)

<a id="field-field-mq3-game-spawn-state-gravity-gravity-src-mq3-game-spawn-ml-1821007022"></a>
### gravity

```ml
gravity
```

Downward acceleration used by the player or entity movement simulation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L43)

<a id="field-field-mq3-game-spawn-state-level-level-src-mq3-game-spawn-ml-561133950"></a>
### level

```ml
level
```

Game-level state shared with the operation or runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L22)

<a id="field-field-mq3-game-spawn-state-missionpack-missionpack-src-mq3-game-spawn-ml-67507054"></a>
### missionpack

```ml
missionpack
```

Nonzero when mission-pack rules and content are enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L56)

<a id="field-field-mq3-game-spawn-state-motd-motd-src-mq3-game-spawn-ml-568724278"></a>
### motd

```ml
motd
```

Message-of-the-day text advertised by the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L35)

<a id="field-field-mq3-game-spawn-state-parser-parser-src-mq3-game-spawn-ml-658388312"></a>
### parser

```ml
parser
```

Parser state retained for subsequent token-reading operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L24)

<a id="field-field-mq3-game-spawn-state-portalsequence-portalsequence-src-mq3-game-spawn-ml-1771310088"></a>
### portalSequence

```ml
portalSequence
```

Sequence number pairing successive client portal endpoints.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L60)

<a id="field-field-mq3-game-spawn-state-restarted-restarted-src-mq3-game-spawn-ml-1666469422"></a>
### restarted

```ml
restarted
```

Nonzero while waiting for a requested map restart to take effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L37)

<a id="field-field-mq3-game-spawn-state-singleplayer-singleplayer-src-mq3-game-spawn-ml-815665272"></a>
### singlePlayer

```ml
singlePlayer
```

Nonzero when the game runs single-player arena rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L58)

<a id="field-field-mq3-game-spawn-state-spawning-spawning-src-mq3-game-spawn-ml-1023825780"></a>
### spawning

```ml
spawning
```

Nonzero while map entities are being created during level initialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L30)

<a id="field-field-mq3-game-spawn-state-unportedfn-unportedfn-src-mq3-game-spawn-ml-1429421584"></a>
### unportedFn

```ml
unportedFn
```

Injected callback for unported; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L49)

<a id="field-field-mq3-game-spawn-state-vars-vars-src-mq3-game-spawn-ml-618426110"></a>
### vars

```ml
vars
```

Map spawn variables for the entity currently being created.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L26)

<a id="field-field-mq3-game-spawn-state-warmuptime-warmuptime-src-mq3-game-spawn-ml-798730888"></a>
### warmupTime

```ml
warmupTime
```

Warmup timing value supplied to ranking/match state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L41)
