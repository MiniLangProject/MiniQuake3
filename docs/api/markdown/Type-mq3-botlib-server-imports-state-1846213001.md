# `mq3.botlib.server_imports.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-server-imports-ml-1126004744.md)

<a id="struct-struct-mq3-botlib-server-imports-state-struct-state-src-mq3-botlib-server-imports-ml-94978697"></a>
## State

```ml
struct State
```

`State` record for server imports, containing `clients`, `now`, `botEnable`, `gameVmActive` and `botlibReady` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L69)

## Members

<a id="field-field-mq3-botlib-server-imports-state-botenable-botenable-src-mq3-botlib-server-imports-ml-1769642754"></a>
### botEnable

```ml
botEnable
```

True when server-side bot processing is enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L75)

<a id="field-field-mq3-botlib-server-imports-state-botlibready-botlibready-src-mq3-botlib-server-imports-ml-487744670"></a>
### botlibReady

```ml
botlibReady
```

True after the bot library has been initialized successfully.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L79)

<a id="field-field-mq3-botlib-server-imports-state-clients-clients-src-mq3-botlib-server-imports-ml-1790662094"></a>
### clients

```ml
clients
```

Server client records exposed through bot allocation and bot command imports.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L71)

<a id="field-field-mq3-botlib-server-imports-state-debugpolygons-debugpolygons-src-mq3-botlib-server-imports-ml-742764134"></a>
### debugPolygons

```ml
debugPolygons
```

Allocated navigation debug polygons exposed to the host renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L81)

<a id="field-field-mq3-botlib-server-imports-state-gamevmactive-gamevmactive-src-mq3-botlib-server-imports-ml-1275761184"></a>
### gameVmActive

```ml
gameVmActive
```

True when a game VM is available to service bot calls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L77)

<a id="field-field-mq3-botlib-server-imports-state-maxdebugpolys-maxdebugpolys-src-mq3-botlib-server-imports-ml-1972398554"></a>
### maxDebugPolys

```ml
maxDebugPolys
```

Maximum number of host navigation debug polygons retained.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L83)

<a id="field-field-mq3-botlib-server-imports-state-now-now-src-mq3-botlib-server-imports-ml-1561096278"></a>
### now

```ml
now
```

Current time supplied to server-side bot-library services.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L73)
