# `mq3.client.cl_ui_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-client-cl-ui-runtime-ml-1200989274.md)

<a id="struct-struct-mq3-client-cl-ui-runtime-state-struct-state-src-mq3-client-cl-ui-runtime-ml-2115334451"></a>
## State

```ml
struct State
```

Stores engine client UI runtime state, including `browser`, `cacheHost`, `queryState`, `syscallHost`, `ui`, `clientState` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L18)

## Members

<a id="field-field-mq3-client-cl-ui-runtime-state-browser-browser-src-mq3-client-cl-ui-runtime-ml-1043892312"></a>
### browser

```ml
browser
```

When constructing this record, `create` supplies `browser` for this member. Used by `LAN_LoadCachedServers` and `LAN_SaveServersToCache` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L21)

<a id="field-field-mq3-client-cl-ui-runtime-state-cachehost-cachehost-src-mq3-client-cl-ui-runtime-ml-845624960"></a>
### cacheHost

```ml
cacheHost
```

When constructing this record, `create` supplies `cacheHost` for this member. Used by `LAN_LoadCachedServers` and `LAN_SaveServersToCache` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L24)

<a id="field-field-mq3-client-cl-ui-runtime-state-cdkey-cdkey-src-mq3-client-cl-ui-runtime-ml-97274656"></a>
### cdKey

```ml
cdKey
```

When constructing this record, `create` supplies an empty string for this member. Used by `CLUI_GetCDKey` and `CLUI_SetCDKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L47)

<a id="field-field-mq3-client-cl-ui-runtime-state-clientstate-clientstate-src-mq3-client-cl-ui-runtime-ml-662840732"></a>
### clientState

```ml
clientState
```

When constructing this record, `create` supplies `clientState` for this member. Used by `GetClientState` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L36)

<a id="field-field-mq3-client-cl-ui-runtime-state-clipboard-clipboard-src-mq3-client-cl-ui-runtime-ml-95825024"></a>
### clipboard

```ml
clipboard
```

When constructing this record, `create` supplies an empty string for this member. Used by `GetClipboardData` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L44)

<a id="field-field-mq3-client-cl-ui-runtime-state-configstrings-configstrings-src-mq3-client-cl-ui-runtime-ml-1656561480"></a>
### configStrings

```ml
configStrings
```

When constructing this record, `create` supplies `configStrings` for this member. Used by `GetConfigString` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L41)

<a id="field-field-mq3-client-cl-ui-runtime-state-fsgame-fsgame-src-mq3-client-cl-ui-runtime-ml-2007269050"></a>
### fsGame

```ml
fsGame
```

When constructing this record, `create` supplies an empty string for this member. Used by `CLUI_GetCDKey` and `CLUI_SetCDKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L50)

<a id="field-field-mq3-client-cl-ui-runtime-state-glconfig-glconfig-src-mq3-client-cl-ui-runtime-ml-154268610"></a>
### glconfig

```ml
glconfig
```

Renderer configuration reported by the engine for the current display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L38)

<a id="field-field-mq3-client-cl-ui-runtime-state-keycatchers-keycatchers-src-mq3-client-cl-ui-runtime-ml-2002527872"></a>
### keyCatchers

```ml
keyCatchers
```

Bitmask selecting which subsystems currently intercept keyboard input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L55)

<a id="field-field-mq3-client-cl-ui-runtime-state-modifiedflags-modifiedflags-src-mq3-client-cl-ui-runtime-ml-1034742064"></a>
### modifiedFlags

```ml
modifiedFlags
```

When constructing this record, `create` supplies `0` for this member. Used by `CLUI_SetCDKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L53)

<a id="field-field-mq3-client-cl-ui-runtime-state-querystate-querystate-src-mq3-client-cl-ui-runtime-ml-1267807806"></a>
### queryState

```ml
queryState
```

When constructing this record, `create` supplies `queryState` for this member. Used by `LAN_UpdateVisiblePings` and `LAN_GetServerStatus` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L27)

<a id="field-field-mq3-client-cl-ui-runtime-state-realtime-realtime-src-mq3-client-cl-ui-runtime-ml-1094312846"></a>
### realtime

```ml
realtime
```

Local client timestamp in milliseconds supplied to the UI runtime refresh path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L57)

<a id="field-field-mq3-client-cl-ui-runtime-state-syscallhost-syscallhost-src-mq3-client-cl-ui-runtime-ml-1576697468"></a>
### syscallHost

```ml
syscallHost
```

When constructing this record, `create` supplies `syscallHost` for this member. Used by `Key_KeynumToStringBuf` and `Key_GetBindingBuf` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L30)

<a id="field-field-mq3-client-cl-ui-runtime-state-ui-ui-src-mq3-client-cl-ui-runtime-ml-1064088724"></a>
### ui

```ml
ui
```

When constructing this record, `create` supplies `ui` for this member. Used by `CL_ShutdownUI` and `CL_InitUI` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L33)
