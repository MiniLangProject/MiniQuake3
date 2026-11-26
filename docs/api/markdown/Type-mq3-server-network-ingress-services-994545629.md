# `mq3.server.network_ingress.Services`

[Home](README.md) · [Source file](File-src-mq3-server-network-ingress-ml-1810419035.md)

<a id="struct-struct-mq3-server-network-ingress-services-struct-services-src-mq3-server-network-ingress-ml-524524195"></a>
## Services

```ml
struct Services
```

The game-facing command and movement callbacks remain explicit host services. This lets the ingress path run before the concrete game module is installed and avoids coupling the protocol parser to game state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L22)

## Members

<a id="field-field-mq3-server-network-ingress-services-clientcommandfn-clientcommandfn-src-mq3-server-network-ingress-ml-1992597201"></a>
### clientCommandFn

```ml
clientCommandFn
```

Host callback that delivers a command to the game client interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L30)

<a id="field-field-mq3-server-network-ingress-services-clientdiagnosticfn-clientdiagnosticfn-src-mq3-server-network-ingress-ml-1306147061"></a>
### clientDiagnosticFn

```ml
clientDiagnosticFn
```

Host callback that reports diagnostics associated with one client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L38)

<a id="field-field-mq3-server-network-ingress-services-clientpacketfn-clientpacketfn-src-mq3-server-network-ingress-ml-1688485187"></a>
### clientPacketFn

```ml
clientPacketFn
```

Host callback that delivers an incoming packet to the client network handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L28)

<a id="field-field-mq3-server-network-ingress-services-connectionlesshost-connectionlesshost-src-mq3-server-network-ingress-ml-2091822463"></a>
### connectionlessHost

```ml
connectionlessHost
```

Host services used by the connectionless packet dispatcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L26)

<a id="field-field-mq3-server-network-ingress-services-connectionlessruntime-connectionlessruntime-src-mq3-server-network-ingress-ml-235931125"></a>
### connectionlessRuntime

```ml
connectionlessRuntime
```

Runtime used to dispatch out-of-band packets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L24)

<a id="field-field-mq3-server-network-ingress-services-context-context-src-mq3-server-network-ingress-ml-1203797549"></a>
### context

```ml
context
```

Caller-supplied data associated with routing received server packets into connection and message handlers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L45)

<a id="field-field-mq3-server-network-ingress-services-disconnectfn-disconnectfn-src-mq3-server-network-ingress-ml-1824220225"></a>
### disconnectFn

```ml
disconnectFn
```

Host callback that processes a client disconnection through the host network lifecycle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L40)

<a id="field-field-mq3-server-network-ingress-services-dropfn-dropfn-src-mq3-server-network-ingress-ml-286292755"></a>
### dropFn

```ml
dropFn
```

Host callback that disconnects a client and reports the supplied reason.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L36)

<a id="field-field-mq3-server-network-ingress-services-packetdiagnosticfn-packetdiagnosticfn-src-mq3-server-network-ingress-ml-1990848331"></a>
### packetDiagnosticFn

```ml
packetDiagnosticFn
```

Host callback that reports packet-validation diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L42)

<a id="field-field-mq3-server-network-ingress-services-sendgamestatefn-sendgamestatefn-src-mq3-server-network-ingress-ml-1997216153"></a>
### sendGamestateFn

```ml
sendGamestateFn
```

Host callback that transmits the current gamestate to a client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L34)

<a id="field-field-mq3-server-network-ingress-services-usermovefn-usermovefn-src-mq3-server-network-ingress-ml-1280892273"></a>
### userMoveFn

```ml
userMoveFn
```

Host callback that decodes and processes client movement commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L32)
