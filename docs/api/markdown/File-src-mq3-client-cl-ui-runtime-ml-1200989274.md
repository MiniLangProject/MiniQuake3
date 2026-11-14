# `src/mq3/client/cl_ui_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cl_ui_runtime`](Package-mq3-client-cl-ui-runtime-1094135294.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_host_lifecycle.ml` as `hostState` → [src/mq3/client/ui_host_lifecycle.ml](File-src-mq3-client-ui-host-lifecycle-ml-451482783.md)
- `mq3/client/ui_lan_browser.ml` as `lan` → [src/mq3/client/ui_lan_browser.ml](File-src-mq3-client-ui-lan-browser-ml-1771171938.md)
- `mq3/client/ui_lan_cache.ml` as `cache` → [src/mq3/client/ui_lan_cache.ml](File-src-mq3-client-ui-lan-cache-ml-483900424.md)
- `mq3/client/ui_lan_queries.ml` as `queries` → [src/mq3/client/ui_lan_queries.ml](File-src-mq3-client-ui-lan-queries-ml-738625990.md)
- `mq3/client/ui_vm.ml` as `uiVm` → [src/mq3/client/ui_vm.ml](File-src-mq3-client-ui-vm-ml-1076773103.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_ui.ml` as `syscalls` → [src/mq3/vm/syscall_ui.ml](File-src-mq3-vm-syscall-ui-ml-839264043.md)

## Declarations

<a id="function-function-mq3-client-cl-ui-runtime-bounded-function-bounded-text-capacity-src-mq3-client-cl-ui-runtime-ml-587700893"></a>
### bounded

```ml
function bounded(text, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L22)

<a id="function-function-mq3-client-cl-ui-runtime-cl-getglconfig-function-cl-getglconfig-state-src-mq3-client-cl-ui-runtime-ml-323161673"></a>
### CL_GetGlconfig

```ml
function CL_GetGlconfig(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L49)

<a id="function-function-mq3-client-cl-ui-runtime-cl-initui-function-cl-initui-state-connectionstate-connectedtopureserver-vmui-src-mq3-client-cl-ui-runtime-ml-2130133588"></a>
### CL_InitUI

```ml
function CL_InitUI(state, connectionState, connectedToPureServer, vmUi)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `connectionState` | `dynamic` | — |  |
| `connectedToPureServer` | `dynamic` | — |  |
| `vmUi` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L75)

<a id="function-function-mq3-client-cl-ui-runtime-cl-shutdownui-function-cl-shutdownui-state-src-mq3-client-cl-ui-runtime-ml-442658501"></a>
### CL_ShutdownUI

```ml
function CL_ShutdownUI(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L67)

<a id="function-function-mq3-client-cl-ui-runtime-cl-uisystemcalls-function-cl-uisystemcalls-state-vm-base-src-mq3-client-cl-ui-runtime-ml-1951910289"></a>
### CL_UISystemCalls

```ml
function CL_UISystemCalls(state, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L66)

<a id="function-function-mq3-client-cl-ui-runtime-clui-getcdkey-function-clui-getcdkey-state-capacity-src-mq3-client-cl-ui-runtime-ml-243281553"></a>
### CLUI_GetCDKey

```ml
function CLUI_GetCDKey(state, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L58)

<a id="function-function-mq3-client-cl-ui-runtime-clui-setcdkey-function-clui-setcdkey-state-value-src-mq3-client-cl-ui-runtime-ml-814809908"></a>
### CLUI_SetCDKey

```ml
function CLUI_SetCDKey(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L61)

<a id="function-function-mq3-client-cl-ui-runtime-create-function-create-browser-cachehost-querystate-syscallhost-ui-clientstate-glconfig-configstrings-src-mq3-client-cl-ui-runtime-ml-494264797"></a>
### create

```ml
function create(browser, cacheHost, queryState, syscallHost, ui, clientState, glconfig, configStrings)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `browser` | `dynamic` | — |  |
| `cacheHost` | `dynamic` | — |  |
| `queryState` | `dynamic` | — |  |
| `syscallHost` | `dynamic` | — |  |
| `ui` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `glconfig` | `dynamic` | — |  |
| `configStrings` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L18)

<a id="constant-constant-mq3-client-cl-ui-runtime-cvar-archive-const-cvar-archive-1-src-mq3-client-cl-ui-runtime-ml-1835573130"></a>
### CVAR_ARCHIVE

```ml
const CVAR_ARCHIVE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L14)

<a id="function-function-mq3-client-cl-ui-runtime-fail-function-fail-message-src-mq3-client-cl-ui-runtime-ml-2019267771"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L17)

<a id="function-function-mq3-client-cl-ui-runtime-floatasint-function-floatasint-value-src-mq3-client-cl-ui-runtime-ml-471018229"></a>
### FloatAsInt

```ml
function FloatAsInt(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L65)

<a id="function-function-mq3-client-cl-ui-runtime-getclientstate-function-getclientstate-state-src-mq3-client-cl-ui-runtime-ml-17150313"></a>
### GetClientState

```ml
function GetClientState(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L24)

<a id="function-function-mq3-client-cl-ui-runtime-getclipboarddata-function-getclipboarddata-state-capacity-src-mq3-client-cl-ui-runtime-ml-1016045181"></a>
### GetClipboardData

```ml
function GetClipboardData(state, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L50)

<a id="function-function-mq3-client-cl-ui-runtime-getconfigstring-function-getconfigstring-state-index-capacity-src-mq3-client-cl-ui-runtime-ml-456416925"></a>
### GetConfigString

```ml
function GetConfigString(state, index, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L64)

<a id="function-function-mq3-client-cl-ui-runtime-key-getbindingbuf-function-key-getbindingbuf-state-keynum-capacity-src-mq3-client-cl-ui-runtime-ml-1125324806"></a>
### Key_GetBindingBuf

```ml
function Key_GetBindingBuf(state, keynum, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `keynum` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L52)

<a id="function-function-mq3-client-cl-ui-runtime-key-getcatcher-function-key-getcatcher-state-src-mq3-client-cl-ui-runtime-ml-1909306641"></a>
### Key_GetCatcher

```ml
function Key_GetCatcher(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L53)

<a id="function-function-mq3-client-cl-ui-runtime-key-keynumtostringbuf-function-key-keynumtostringbuf-state-keynum-capacity-src-mq3-client-cl-ui-runtime-ml-1332082230"></a>
### Key_KeynumToStringBuf

```ml
function Key_KeynumToStringBuf(state, keynum, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `keynum` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L51)

<a id="function-function-mq3-client-cl-ui-runtime-key-setcatcher-function-key-setcatcher-state-catcher-src-mq3-client-cl-ui-runtime-ml-376007863"></a>
### Key_SetCatcher

```ml
function Key_SetCatcher(state, catcher)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `catcher` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L54)

<a id="function-function-mq3-client-cl-ui-runtime-keysegment-function-keysegment-value-offset-src-mq3-client-cl-ui-runtime-ml-56971720"></a>
### keySegment

```ml
function keySegment(value, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L56)

<a id="function-function-mq3-client-cl-ui-runtime-lan-addserver-function-lan-addserver-state-source-name-address-src-mq3-client-cl-ui-runtime-ml-1691438937"></a>
### LAN_AddServer

```ml
function LAN_AddServer(state, source, name, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L28)

<a id="function-function-mq3-client-cl-ui-runtime-lan-clearping-function-lan-clearping-state-index-src-mq3-client-cl-ui-runtime-ml-353070941"></a>
### LAN_ClearPing

```ml
function LAN_ClearPing(state, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L37)

<a id="function-function-mq3-client-cl-ui-runtime-lan-compareservers-function-lan-compareservers-state-source-sortkey-sortdir-first-second-src-mq3-client-cl-ui-runtime-ml-1824543298"></a>
### LAN_CompareServers

```ml
function LAN_CompareServers(state, source, sortKey, sortDir, first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `sortKey` | `dynamic` | — |  |
| `sortDir` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L35)

<a id="function-function-mq3-client-cl-ui-runtime-lan-getping-function-lan-getping-state-index-capacity-src-mq3-client-cl-ui-runtime-ml-1023624239"></a>
### LAN_GetPing

```ml
function LAN_GetPing(state, index, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L38)

<a id="function-function-mq3-client-cl-ui-runtime-lan-getpinginfo-function-lan-getpinginfo-state-index-capacity-src-mq3-client-cl-ui-runtime-ml-992322595"></a>
### LAN_GetPingInfo

```ml
function LAN_GetPingInfo(state, index, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L39)

<a id="function-function-mq3-client-cl-ui-runtime-lan-getpingqueuecount-function-lan-getpingqueuecount-state-src-mq3-client-cl-ui-runtime-ml-1525595693"></a>
### LAN_GetPingQueueCount

```ml
function LAN_GetPingQueueCount(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L36)

<a id="function-function-mq3-client-cl-ui-runtime-lan-getserveraddressstring-function-lan-getserveraddressstring-state-source-index-capacity-src-mq3-client-cl-ui-runtime-ml-154284238"></a>
### LAN_GetServerAddressString

```ml
function LAN_GetServerAddressString(state, source, index, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L31)

<a id="function-function-mq3-client-cl-ui-runtime-lan-getservercount-function-lan-getservercount-state-source-src-mq3-client-cl-ui-runtime-ml-1093966354"></a>
### LAN_GetServerCount

```ml
function LAN_GetServerCount(state, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L30)

<a id="function-function-mq3-client-cl-ui-runtime-lan-getserverinfo-function-lan-getserverinfo-state-source-index-capacity-src-mq3-client-cl-ui-runtime-ml-1364339984"></a>
### LAN_GetServerInfo

```ml
function LAN_GetServerInfo(state, source, index, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L32)

<a id="function-function-mq3-client-cl-ui-runtime-lan-getserverping-function-lan-getserverping-state-source-index-src-mq3-client-cl-ui-runtime-ml-1949283796"></a>
### LAN_GetServerPing

```ml
function LAN_GetServerPing(state, source, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L33)

<a id="function-function-mq3-client-cl-ui-runtime-lan-getserverptr-function-lan-getserverptr-state-source-index-src-mq3-client-cl-ui-runtime-ml-1737610414"></a>
### LAN_GetServerPtr

```ml
function LAN_GetServerPtr(state, source, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L34)

<a id="function-function-mq3-client-cl-ui-runtime-lan-getserverstatus-function-lan-getserverstatus-state-address-capacity-src-mq3-client-cl-ui-runtime-ml-1199071957"></a>
### LAN_GetServerStatus

```ml
function LAN_GetServerStatus(state, address, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L45)

<a id="function-function-mq3-client-cl-ui-runtime-lan-loadcachedservers-function-lan-loadcachedservers-state-src-mq3-client-cl-ui-runtime-ml-312673357"></a>
### LAN_LoadCachedServers

```ml
function LAN_LoadCachedServers(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L25)

<a id="function-function-mq3-client-cl-ui-runtime-lan-markservervisible-function-lan-markservervisible-state-source-index-visible-src-mq3-client-cl-ui-runtime-ml-654537408"></a>
### LAN_MarkServerVisible

```ml
function LAN_MarkServerVisible(state, source, index, visible)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `visible` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L40)

<a id="function-function-mq3-client-cl-ui-runtime-lan-removeserver-function-lan-removeserver-state-source-address-src-mq3-client-cl-ui-runtime-ml-1865071606"></a>
### LAN_RemoveServer

```ml
function LAN_RemoveServer(state, source, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L29)

<a id="function-function-mq3-client-cl-ui-runtime-lan-resetpings-function-lan-resetpings-state-source-src-mq3-client-cl-ui-runtime-ml-221353402"></a>
### LAN_ResetPings

```ml
function LAN_ResetPings(state, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L27)

<a id="function-function-mq3-client-cl-ui-runtime-lan-saveserverstocache-function-lan-saveserverstocache-state-src-mq3-client-cl-ui-runtime-ml-1981849905"></a>
### LAN_SaveServersToCache

```ml
function LAN_SaveServersToCache(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L26)

<a id="function-function-mq3-client-cl-ui-runtime-lan-serverisvisible-function-lan-serverisvisible-state-source-index-src-mq3-client-cl-ui-runtime-ml-522125632"></a>
### LAN_ServerIsVisible

```ml
function LAN_ServerIsVisible(state, source, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L41)

<a id="function-function-mq3-client-cl-ui-runtime-lan-updatevisiblepings-function-lan-updatevisiblepings-state-source-src-mq3-client-cl-ui-runtime-ml-1780680210"></a>
### LAN_UpdateVisiblePings

```ml
function LAN_UpdateVisiblePings(state, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L42)

<a id="constant-constant-mq3-client-cl-ui-runtime-max-configstrings-const-max-configstrings-1024-src-mq3-client-cl-ui-runtime-ml-1507604798"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L13)

<a id="function-function-mq3-client-cl-ui-runtime-normalizedkey-function-normalizedkey-value-src-mq3-client-cl-ui-runtime-ml-188573045"></a>
### normalizedKey

```ml
function normalizedKey(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L57)

- [mq3.client.cl_ui_runtime.State](Type-mq3-client-cl-ui-runtime-state-614647333.md) — struct
<a id="function-function-mq3-client-cl-ui-runtime-ui-gamecommand-function-ui-gamecommand-state-src-mq3-client-cl-ui-runtime-ml-1677308989"></a>
### UI_GameCommand

```ml
function UI_GameCommand(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L77)

<a id="function-function-mq3-client-cl-ui-runtime-ui-usesuniquecdkey-function-ui-usesuniquecdkey-state-src-mq3-client-cl-ui-runtime-ml-1197989773"></a>
### UI_usesUniqueCDKey

```ml
function UI_usesUniqueCDKey(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L76)
