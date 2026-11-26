# `mq3.client.client_main.State`

[Home](README.md) · [Source file](File-src-mq3-client-client-main-ml-798872826.md)

<a id="struct-struct-mq3-client-client-main-state-struct-state-src-mq3-client-client-main-ml-426300943"></a>
## State

```ml
struct State
```

Stores client main state, including `lifecycle`, `reliable`, `pings`, `servers`, `statuses`, `downloads` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L238)

## Members

<a id="field-field-mq3-client-client-main-state-actions-actions-src-mq3-client-client-main-ml-184208552"></a>
### actions

```ml
actions
```

Host requests queued while processing client lifecycle, connection, demo, and console commands, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L266)

<a id="field-field-mq3-client-client-main-state-configstrings-configstrings-src-mq3-client-client-main-ml-1028157692"></a>
### configstrings

```ml
configstrings
```

Server configuration strings indexed by the native protocol's configuration-string identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L263)

<a id="field-field-mq3-client-client-main-state-connectionhost-connectionhost-src-mq3-client-client-main-ml-90153180"></a>
### connectionHost

```ml
connectionHost
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `attachConnection` and `CL_CheckForResend` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L298)

<a id="field-field-mq3-client-client-main-state-connectionruntime-connectionruntime-src-mq3-client-client-main-ml-1126126496"></a>
### connectionRuntime

```ml
connectionRuntime
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `attachConnection` and `CL_CheckForResend` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L295)

<a id="field-field-mq3-client-client-main-state-cvars-cvars-src-mq3-client-client-main-ml-2089216720"></a>
### cvars

```ml
cvars
```

Configuration-variable values exposed to the native UI implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L261)

<a id="field-field-mq3-client-client-main-state-demo-demo-src-mq3-client-client-main-ml-1186775334"></a>
### demo

```ml
demo
```

When constructing this record, `create` supplies `demos` for this member. Used by `CL_WriteDemoMessage` and `CL_StopRecord_f` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L259)

<a id="field-field-mq3-client-client-main-state-downloads-downloads-src-mq3-client-client-main-ml-1043177980"></a>
### downloads

```ml
downloads
```

When constructing this record, `create` supplies `downloads` for this member. Used by `CL_BeginDownload` and `CL_NextDownload` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L256)

<a id="field-field-mq3-client-client-main-state-framehost-framehost-src-mq3-client-client-main-ml-1046420928"></a>
### frameHost

```ml
frameHost
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `attachFrame` and `CL_CheckUserinfo` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L292)

<a id="field-field-mq3-client-client-main-state-frameruntime-frameruntime-src-mq3-client-client-main-ml-1115732434"></a>
### frameRuntime

```ml
frameRuntime
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `attachFrame` and `CL_CheckUserinfo` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L289)

<a id="field-field-mq3-client-client-main-state-lanruntime-lanruntime-src-mq3-client-client-main-ml-17976750"></a>
### lanRuntime

```ml
lanRuntime
```

Optional LAN-browser runtime attachment retained by the client state; the client factory leaves it absent.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L306)

<a id="field-field-mq3-client-client-main-state-lifecycle-lifecycle-src-mq3-client-client-main-ml-136718448"></a>
### lifecycle

```ml
lifecycle
```

When constructing this record, `create` supplies `life` for this member. Used by `now` and `CL_PacketEventLive` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L241)

<a id="field-field-mq3-client-client-main-state-openedpaks-openedpaks-src-mq3-client-client-main-ml-2036273020"></a>
### openedPaks

```ml
openedPaks
```

When constructing this record, `create` supplies an empty string for this member. Used by `CL_OpenedPK3List_f` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L280)

<a id="field-field-mq3-client-client-main-state-packethost-packethost-src-mq3-client-client-main-ml-1052035160"></a>
### packetHost

```ml
packetHost
```

Optional host attachment reserved for client packet handling; the client factory leaves it absent.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L303)

<a id="field-field-mq3-client-client-main-state-packetruntime-packetruntime-src-mq3-client-client-main-ml-304804972"></a>
### packetRuntime

```ml
packetRuntime
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `attachNetworkIngress` and `CL_PacketEventLive` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L301)

<a id="field-field-mq3-client-client-main-state-pings-pings-src-mq3-client-client-main-ml-806381364"></a>
### pings

```ml
pings
```

When constructing this record, `create` supplies an empty list for this member. Used by `CL_UpdateServerInfo` and `CL_GetPingQueueCount` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L247)

<a id="field-field-mq3-client-client-main-state-purechecksums-purechecksums-src-mq3-client-client-main-ml-799922788"></a>
### pureChecksums

```ml
pureChecksums
```

When constructing this record, `create` supplies an empty string for this member. Used by `CL_SendPureChecksums` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L277)

<a id="field-field-mq3-client-client-main-state-reconnectname-reconnectname-src-mq3-client-client-main-ml-1358665092"></a>
### reconnectName

```ml
reconnectName
```

When constructing this record, `create` supplies an empty string for this member. Used by `CL_Reconnect_f` and `CL_Connect_f` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L271)

<a id="field-field-mq3-client-client-main-state-referencedpaks-referencedpaks-src-mq3-client-client-main-ml-481624372"></a>
### referencedPaks

```ml
referencedPaks
```

When constructing this record, `create` supplies an empty string for this member. Used by `CL_ReferencedPK3List_f` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L283)

<a id="field-field-mq3-client-client-main-state-reliable-reliable-src-mq3-client-client-main-ml-898221232"></a>
### reliable

```ml
reliable
```

When constructing this record, `create` supplies `reliable` for this member. Used by `CL_AddReliableCommand` and `CL_ChangeReliableCommand` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L244)

<a id="field-field-mq3-client-client-main-state-retailactive-retailactive-src-mq3-client-client-main-ml-2048246346"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns client connection and lifecycle commands, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L286)

<a id="field-field-mq3-client-client-main-state-servername-servername-src-mq3-client-client-main-ml-734297412"></a>
### serverName

```ml
serverName
```

Display or connection name of the selected game server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L268)

<a id="field-field-mq3-client-client-main-state-servers-servers-src-mq3-client-client-main-ml-1045642192"></a>
### servers

```ml
servers
```

When constructing this record, `create` supplies an empty list for this member. Used by `findServer` and `CL_SetServerInfoByAddress` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L250)

<a id="field-field-mq3-client-client-main-state-statuses-statuses-src-mq3-client-client-main-ml-2049000052"></a>
### statuses

```ml
statuses
```

When constructing this record, `create` supplies an empty list for this member. Used by `findStatus` and `CL_ServerStatus` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L253)

<a id="field-field-mq3-client-client-main-state-userinfo-userinfo-src-mq3-client-client-main-ml-297908418"></a>
### userinfo

```ml
userinfo
```

When constructing this record, `create` supplies an empty string for this member. Used by `CL_CheckForResend` and `CL_MapLoading` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L274)
