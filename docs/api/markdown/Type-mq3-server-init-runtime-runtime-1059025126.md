# `mq3.server.init_runtime.Runtime`

[Home](README.md) · [Source file](File-src-mq3-server-init-runtime-ml-863108862.md)

<a id="struct-struct-mq3-server-init-runtime-runtime-struct-runtime-src-mq3-server-init-runtime-ml-2096855339"></a>
## Runtime

```ml
struct Runtime
```

Runtime record for server.init_runtime, containing `sv`, `svs`, `registry`, `maxClients`, `dedicated`, `pure`, and 8 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L147)

## Members

<a id="field-field-mq3-server-init-runtime-runtime-botinitialized-botinitialized-src-mq3-server-init-runtime-ml-248187847"></a>
### botInitialized

```ml
botInitialized
```

True after bot-library initialization has completed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L173)

<a id="field-field-mq3-server-init-runtime-runtime-dedicated-dedicated-src-mq3-server-init-runtime-ml-336872325"></a>
### dedicated

```ml
dedicated
```

True when the server runs without a local graphical client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L157)

<a id="field-field-mq3-server-init-runtime-runtime-errorentered-errorentered-src-mq3-server-init-runtime-ml-266995515"></a>
### errorEntered

```ml
errorEntered
```

True while an error is being handled, preventing recursive error handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L163)

<a id="field-field-mq3-server-init-runtime-runtime-frametime-frametime-src-mq3-server-init-runtime-ml-274097001"></a>
### frameTime

```ml
frameTime
```

Host frame timestamp used while initializing or restarting the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L165)

<a id="field-field-mq3-server-init-runtime-runtime-gametypemodified-gametypemodified-src-mq3-server-init-runtime-ml-803660991"></a>
### gametypeModified

```ml
gametypeModified
```

True when a changed game mode requires server reinitialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L167)

<a id="field-field-mq3-server-init-runtime-runtime-maxclients-maxclients-src-mq3-server-init-runtime-ml-1388702113"></a>
### maxClients

```ml
maxClients
```

Requested client capacity bounded and allocated during server startup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L155)

<a id="field-field-mq3-server-init-runtime-runtime-modifiedflags-modifiedflags-src-mq3-server-init-runtime-ml-1485087753"></a>
### modifiedFlags

```ml
modifiedFlags
```

Bit mask of configuration-variable categories modified since the last clear.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L169)

<a id="field-field-mq3-server-init-runtime-runtime-operatorcommands-operatorcommands-src-mq3-server-init-runtime-ml-989374177"></a>
### operatorCommands

```ml
operatorCommands
```

Registry of server operator-console commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L171)

<a id="field-field-mq3-server-init-runtime-runtime-pure-pure-src-mq3-server-init-runtime-ml-44199017"></a>
### pure

```ml
pure
```

True when clients must use the server-approved package checksums.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L159)

<a id="field-field-mq3-server-init-runtime-runtime-registry-registry-src-mq3-server-init-runtime-ml-837572103"></a>
### registry

```ml
registry
```

Registry used to resolve registered names, handles, or runtime definitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L153)

<a id="field-field-mq3-server-init-runtime-runtime-running-running-src-mq3-server-init-runtime-ml-1355285645"></a>
### running

```ml
running
```

True while the server or represented subsystem is running.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L161)

<a id="field-field-mq3-server-init-runtime-runtime-shutdown-shutdown-src-mq3-server-init-runtime-ml-9050297"></a>
### shutdown

```ml
shutdown
```

True after shutdown has been requested or completed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L175)

<a id="field-field-mq3-server-init-runtime-runtime-sv-sv-src-mq3-server-init-runtime-ml-941950987"></a>
### sv

```ml
sv
```

Current map-level server state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L149)

<a id="field-field-mq3-server-init-runtime-runtime-svs-svs-src-mq3-server-init-runtime-ml-406611193"></a>
### svs

```ml
svs
```

Persistent server state retained across map changes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/init_runtime.ml#L151)
