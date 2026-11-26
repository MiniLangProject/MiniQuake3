# `mq3.client.ui_lan_udp.Context`

[Home](README.md) · [Source file](File-src-mq3-client-ui-lan-udp-ml-1196583039.md)

<a id="struct-struct-mq3-client-ui-lan-udp-context-struct-context-src-mq3-client-ui-lan-udp-ml-2139982975"></a>
## Context

```ml
struct Context
```

Stores UI LAN udp context record, including `clientSocket`, `serverSocket`, `ingressServices`, `clientState`, `active`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L17)

## Members

<a id="field-field-mq3-client-ui-lan-udp-context-active-active-src-mq3-client-ui-lan-udp-ml-2070859876"></a>
### active

```ml
active
```

When constructing this record, `open` supplies `true` for this member. Used by `selectedSocket` and `resolveAddress` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L32)

<a id="field-field-mq3-client-ui-lan-udp-context-clientsocket-clientsocket-src-mq3-client-ui-lan-udp-ml-953203292"></a>
### clientSocket

```ml
clientSocket
```

When constructing this record, `open` supplies `clientSocket` for this member. Used by `selectedSocket` and `pump` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L20)

<a id="field-field-mq3-client-ui-lan-udp-context-clientstate-clientstate-src-mq3-client-ui-lan-udp-ml-719929944"></a>
### clientState

```ml
clientState
```

When constructing this record, `open` supplies `connectionless.create(nowhere)` for this member. Used by `dispatch` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L29)

<a id="field-field-mq3-client-ui-lan-udp-context-ingressservices-ingressservices-src-mq3-client-ui-lan-udp-ml-1732741636"></a>
### ingressServices

```ml
ingressServices
```

When constructing this record, `open` supplies `ingress.services(ingressState)` for this member. Used by `dispatch` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L26)

<a id="field-field-mq3-client-ui-lan-udp-context-serversocket-serversocket-src-mq3-client-ui-lan-udp-ml-524943668"></a>
### serverSocket

```ml
serverSocket
```

When constructing this record, `open` supplies `serverSocket` for this member. Used by `selectedSocket` and `pump` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L23)
