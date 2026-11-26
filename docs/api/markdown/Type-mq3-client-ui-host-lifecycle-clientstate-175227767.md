# `mq3.client.ui_host_lifecycle.ClientState`

[Home](README.md) · [Source file](File-src-mq3-client-ui-host-lifecycle-ml-451482783.md)

<a id="struct-struct-mq3-client-ui-host-lifecycle-clientstate-struct-clientstate-src-mq3-client-ui-host-lifecycle-ml-1819688529"></a>
## ClientState

```ml
struct ClientState
```

Stores UI host lifecycle client state record, including `connState`, `connectPacketCount`, `clientNum`, `servername`, `updateInfoString`, `messageString`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L40)

## Members

<a id="field-field-mq3-client-ui-host-lifecycle-clientstate-clientnum-clientnum-src-mq3-client-ui-host-lifecycle-ml-1121939851"></a>
### clientNum

```ml
clientNum
```

Local client slot serialized into the UI client-state ABI record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L46)

<a id="field-field-mq3-client-ui-host-lifecycle-clientstate-connectpacketcount-connectpacketcount-src-mq3-client-ui-host-lifecycle-ml-422026777"></a>
### connectPacketCount

```ml
connectPacketCount
```

Number of connection-handshake packets sent, also used by progress displays.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L44)

<a id="field-field-mq3-client-ui-host-lifecycle-clientstate-connstate-connstate-src-mq3-client-ui-host-lifecycle-ml-1487978403"></a>
### connState

```ml
connState
```

When constructing this record, `createClientState` supplies `connState` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L42)

<a id="field-field-mq3-client-ui-host-lifecycle-clientstate-messagestring-messagestring-src-mq3-client-ui-host-lifecycle-ml-1873605999"></a>
### messageString

```ml
messageString
```

When constructing this record, `createClientState` supplies `messageString` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L52)

<a id="field-field-mq3-client-ui-host-lifecycle-clientstate-servername-servername-src-mq3-client-ui-host-lifecycle-ml-1672216703"></a>
### servername

```ml
servername
```

When constructing this record, `createClientState` supplies `servername` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L48)

<a id="field-field-mq3-client-ui-host-lifecycle-clientstate-updateinfostring-updateinfostring-src-mq3-client-ui-host-lifecycle-ml-1673501487"></a>
### updateInfoString

```ml
updateInfoString
```

When constructing this record, `createClientState` supplies `updateInfoString` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L50)
