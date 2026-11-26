# `mq3.server.abi.Globals`

[Home](README.md) · [Source file](File-src-mq3-server-abi-ml-141226179.md)

<a id="struct-struct-mq3-server-abi-globals-struct-globals-src-mq3-server-abi-ml-266633857"></a>
## Globals

```ml
struct Globals
```

Globals record for server.abi, containing `svs`, `sv`, `gvm`, `cvars`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L456)

## Members

<a id="field-field-mq3-server-abi-globals-cvars-cvars-src-mq3-server-abi-ml-1255270007"></a>
### cvars

```ml
cvars
```

Configuration-variable registry consulted by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L464)

<a id="field-field-mq3-server-abi-globals-gvm-gvm-src-mq3-server-abi-ml-1011696875"></a>
### gvm

```ml
gvm
```

Loaded game-VM instance providing server game logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L462)

<a id="field-field-mq3-server-abi-globals-sv-sv-src-mq3-server-abi-ml-1564105893"></a>
### sv

```ml
sv
```

Map-level server state for the current world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L460)

<a id="field-field-mq3-server-abi-globals-svs-svs-src-mq3-server-abi-ml-690951723"></a>
### svs

```ml
svs
```

Persistent server state shared across map loads.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L458)
