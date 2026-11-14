# `mq3.server.network_ingress.Services`

[Home](README.md) · [Source file](File-src-mq3-server-network-ingress-ml-1810419035.md)

<a id="struct-struct-mq3-server-network-ingress-services-struct-services-src-mq3-server-network-ingress-ml-524524195"></a>
## Services

```ml
struct Services
```

The game-facing command and movement callbacks remain explicit host services. This lets the ingress path run before the concrete game module is installed and avoids coupling the protocol parser to game state.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L15)

## Members

<a id="field-field-mq3-server-network-ingress-services-clientcommandfn-clientcommandfn-src-mq3-server-network-ingress-ml-1992597201"></a>
### clientCommandFn

```ml
clientCommandFn
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L17)

<a id="field-field-mq3-server-network-ingress-services-clientdiagnosticfn-clientdiagnosticfn-src-mq3-server-network-ingress-ml-1306147061"></a>
### clientDiagnosticFn

```ml
clientDiagnosticFn
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L18)

<a id="field-field-mq3-server-network-ingress-services-clientpacketfn-clientpacketfn-src-mq3-server-network-ingress-ml-1688485187"></a>
### clientPacketFn

```ml
clientPacketFn
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L17)

<a id="field-field-mq3-server-network-ingress-services-connectionlesshost-connectionlesshost-src-mq3-server-network-ingress-ml-2091822463"></a>
### connectionlessHost

```ml
connectionlessHost
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L16)

<a id="field-field-mq3-server-network-ingress-services-connectionlessruntime-connectionlessruntime-src-mq3-server-network-ingress-ml-235931125"></a>
### connectionlessRuntime

```ml
connectionlessRuntime
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L16)

<a id="field-field-mq3-server-network-ingress-services-context-context-src-mq3-server-network-ingress-ml-1203797549"></a>
### context

```ml
context
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L19)

<a id="field-field-mq3-server-network-ingress-services-disconnectfn-disconnectfn-src-mq3-server-network-ingress-ml-1824220225"></a>
### disconnectFn

```ml
disconnectFn
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L19)

<a id="field-field-mq3-server-network-ingress-services-dropfn-dropfn-src-mq3-server-network-ingress-ml-286292755"></a>
### dropFn

```ml
dropFn
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L18)

<a id="field-field-mq3-server-network-ingress-services-packetdiagnosticfn-packetdiagnosticfn-src-mq3-server-network-ingress-ml-1990848331"></a>
### packetDiagnosticFn

```ml
packetDiagnosticFn
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L19)

<a id="field-field-mq3-server-network-ingress-services-sendgamestatefn-sendgamestatefn-src-mq3-server-network-ingress-ml-1997216153"></a>
### sendGamestateFn

```ml
sendGamestateFn
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L18)

<a id="field-field-mq3-server-network-ingress-services-usermovefn-usermovefn-src-mq3-server-network-ingress-ml-1280892273"></a>
### userMoveFn

```ml
userMoveFn
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L17)
