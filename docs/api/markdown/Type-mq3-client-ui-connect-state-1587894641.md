# `mq3.client.ui_connect.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-connect-ml-1918938180.md)

<a id="struct-struct-mq3-client-ui-connect-state-struct-state-src-mq3-client-ui-connect-ml-2056767065"></a>
## State

```ml
struct State
```

Stores UI connect state, including `client`, `realtime`, `downloadName`, `downloadSize`, `downloadCount`, `downloadTime` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L109)

## Members

<a id="field-field-mq3-client-ui-connect-state-actions-actions-src-mq3-client-ui-connect-ml-1195022898"></a>
### actions

```ml
actions
```

Host requests queued while drawing connection status and download progress, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L132)

<a id="field-field-mq3-client-ui-connect-state-cachecalls-cachecalls-src-mq3-client-ui-connect-ml-1557003988"></a>
### cacheCalls

```ml
cacheCalls
```

When constructing this record, `create` supplies `0` for this member. Used by `drawConnectScreen` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L138)

<a id="field-field-mq3-client-ui-connect-state-client-client-src-mq3-client-ui-connect-ml-253154324"></a>
### client

```ml
client
```

Player slot associated with this score or client-side record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L111)

<a id="field-field-mq3-client-ui-connect-state-downloadcount-downloadcount-src-mq3-client-ui-connect-ml-1745805430"></a>
### downloadCount

```ml
downloadCount
```

Number of bytes accumulated for the active download.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L120)

<a id="field-field-mq3-client-ui-connect-state-downloadname-downloadname-src-mq3-client-ui-connect-ml-512218252"></a>
### downloadName

```ml
downloadName
```

When constructing this record, `create` supplies an empty string for this member. Used by `configure` and `drawConnectScreen` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L116)

<a id="field-field-mq3-client-ui-connect-state-downloadsize-downloadsize-src-mq3-client-ui-connect-ml-1551163600"></a>
### downloadSize

```ml
downloadSize
```

Expected total size in bytes of the active download.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L118)

<a id="field-field-mq3-client-ui-connect-state-downloadtime-downloadtime-src-mq3-client-ui-connect-ml-601644368"></a>
### downloadTime

```ml
downloadTime
```

When constructing this record, `create` supplies `0` for this member. Used by `displayDownloadInfo` and `configure` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L123)

<a id="field-field-mq3-client-ui-connect-state-lastconnstate-lastconnstate-src-mq3-client-ui-connect-ml-415694946"></a>
### lastConnState

```ml
lastConnState
```

When constructing this record, `create` supplies `CA_UNINITIALIZED` for this member. Used by `drawConnectScreen` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L126)

<a id="field-field-mq3-client-ui-connect-state-lastloadingtext-lastloadingtext-src-mq3-client-ui-connect-ml-1813914738"></a>
### lastLoadingText

```ml
lastLoadingText
```

When constructing this record, `create` supplies an empty string for this member. Used by `drawConnectScreen` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L129)

<a id="field-field-mq3-client-ui-connect-state-realtime-realtime-src-mq3-client-ui-connect-ml-244763532"></a>
### realtime

```ml
realtime
```

Current UI clock in milliseconds used to derive download rate and remaining-time estimates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L113)

<a id="field-field-mq3-client-ui-connect-state-retailactive-retailactive-src-mq3-client-ui-connect-ml-1915171760"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the connection and download-progress screen, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L135)
