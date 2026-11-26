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

Calls `decode`, `slice` from engine client UI runtime `bounded`. The final path returns `decode(slice(raw,0,count))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `bounded` in the engine client UI runtime path. |
| `capacity` | `dynamic` | — | Maximum number of entries or bytes accepted by this container. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L79)

<a id="function-function-mq3-client-cl-ui-runtime-cl-getglconfig-function-cl-getglconfig-state-src-mq3-client-cl-ui-runtime-ml-323161673"></a>
### CL_GetGlconfig

```ml
function CL_GetGlconfig(state)
```

Calls `slice` from engine client UI runtime `CL_GetGlconfig`. The final path returns `slice(state.glconfig,0,len(state.glconfig))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.glconfig`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L183)

<a id="function-function-mq3-client-cl-ui-runtime-cl-initui-function-cl-initui-state-connectionstate-connectedtopureserver-vmui-src-mq3-client-cl-ui-runtime-ml-2130133588"></a>
### CL_InitUI

```ml
function CL_InitUI(state, connectionState, connectedToPureServer, vmUi)
```

Calls `mq3.client.ui_vm.initialize` from engine client UI runtime `CL_InitUI`. The final path returns `uiVm.initialize(state.ui,connectionState,connectedToPureServer,vmUi)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.ui`. |
| `connectionState` | `dynamic` | — | Value used by `return uiVm.initialize(state.ui,connectionState,connectedToPureServer,vmUi)`. |
| `connectedToPureServer` | `dynamic` | — | Value used by `return uiVm.initialize(state.ui,connectionState,connectedToPureServer,vmUi)`. |
| `vmUi` | `dynamic` | — | Value used by `return uiVm.initialize(state.ui,connectionState,connectedToPureServer,vmUi)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L253)

<a id="function-function-mq3-client-cl-ui-runtime-cl-shutdownui-function-cl-shutdownui-state-src-mq3-client-cl-ui-runtime-ml-442658501"></a>
### CL_ShutdownUI

```ml
function CL_ShutdownUI(state)
```

Calls `mq3.client.cl_ui_runtime.Key_SetCatcher`, `mq3.client.cl_ui_runtime.Key_GetCatcher`, `mq3.client.ui_vm.shutdown` from engine client UI runtime `CL_ShutdownUI`. The final path returns `uiVm.shutdown(state.ui)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.ui`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L240)

<a id="function-function-mq3-client-cl-ui-runtime-cl-uisystemcalls-function-cl-uisystemcalls-state-vm-base-src-mq3-client-cl-ui-runtime-ml-1951910289"></a>
### CL_UISystemCalls

```ml
function CL_UISystemCalls(state, vm, base)
```

Calls `mq3.vm.syscall_ui.dispatch` from engine client UI runtime `CL_UISystemCalls`. The final path returns `syscalls.dispatch(state.syscallHost,vm,base)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscallHost`. |
| `vm` | `dynamic` | — | Value used by `return syscalls.dispatch(state.syscallHost,vm,base)`. |
| `base` | `dynamic` | — | Value used by `return syscalls.dispatch(state.syscallHost,vm,base)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L237)

<a id="function-function-mq3-client-cl-ui-runtime-clui-getcdkey-function-clui-getcdkey-state-capacity-src-mq3-client-cl-ui-runtime-ml-243281553"></a>
### CLUI_GetCDKey

```ml
function CLUI_GetCDKey(state, capacity)
```

Calls `mq3.client.cl_ui_runtime.UI_usesUniqueCDKey`, `mq3.client.cl_ui_runtime.bounded`, `mq3.client.cl_ui_runtime.keySegment` from engine client UI runtime `CLUI_GetCDKey`. The final path returns `bounded(keySegment(state.cdKey,offset),capacity)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.fsGame`, `state.cdKey`. |
| `capacity` | `dynamic` | — | Maximum number of entries or bytes accepted by this container. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L216)

<a id="function-function-mq3-client-cl-ui-runtime-clui-setcdkey-function-clui-setcdkey-state-value-src-mq3-client-cl-ui-runtime-ml-814809908"></a>
### CLUI_SetCDKey

```ml
function CLUI_SetCDKey(state, value)
```

Updates `state.cdKey`, `state.modifiedFlags` during engine client UI runtime `CLUI_SetCDKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client UI runtime record/storage; this routine assigns `state.cdKey`, `state.modifiedFlags`. |
| `value` | `dynamic` | — | Value used by `part=normalizedKey(value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L222)

<a id="function-function-mq3-client-cl-ui-runtime-create-function-create-browser-cachehost-querystate-syscallhost-ui-clientstate-glconfig-configstrings-src-mq3-client-cl-ui-runtime-ml-494264797"></a>
### create

```ml
function create(browser, cacheHost, queryState, syscallHost, ui, clientState, glconfig, configStrings)
```

Calls `mq3.client.ui_lan_browser.create`, `mq3.client.cl_ui_runtime.State` from engine client UI runtime `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `browser` | `dynamic` | — | Value used by `if browser==void then browser=lan.create() end if`. |
| `cacheHost` | `dynamic` | — | Value used by `return State(browser,cacheHost,queryState,syscallHost,ui,clientState,glconfig,configStrings,"","", "",0,0,0)`. |
| `queryState` | `dynamic` | — | Value used by `return State(browser,cacheHost,queryState,syscallHost,ui,clientState,glconfig,configStrings,"","", "",0,0,0)`. |
| `syscallHost` | `dynamic` | — | Value used by `return State(browser,cacheHost,queryState,syscallHost,ui,clientState,glconfig,configStrings,"","", "",0,0,0)`. |
| `ui` | `dynamic` | — | Value used by `return State(browser,cacheHost,queryState,syscallHost,ui,clientState,glconfig,configStrings,"","", "",0,0,0)`. |
| `clientState` | `dynamic` | — | Value used by `return State(browser,cacheHost,queryState,syscallHost,ui,clientState,glconfig,configStrings,"","", "",0,0,0)`. |
| `glconfig` | `dynamic` | — | Value used by `return State(browser,cacheHost,queryState,syscallHost,ui,clientState,glconfig,configStrings,"","", "",0,0,0)`. |
| `configStrings` | `dynamic` | — | Value used by `if configStrings==void then configStrings=array(MAX_CONFIGSTRINGS,"") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L72)

<a id="constant-constant-mq3-client-cl-ui-runtime-cvar-archive-const-cvar-archive-1-src-mq3-client-cl-ui-runtime-ml-1835573130"></a>
### CVAR_ARCHIVE

```ml
const CVAR_ARCHIVE = 1
```

Configuration-variable attribute that persists the value in the user's saved configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L16)

<a id="function-function-mq3-client-cl-ui-runtime-fail-function-fail-message-src-mq3-client-cl-ui-runtime-ml-2019267771"></a>
### fail

```ml
function fail(message)
```

Creates the engine client UI runtime error `7801` with diagnostic text `"cl_ui: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"cl_ui: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L62)

<a id="function-function-mq3-client-cl-ui-runtime-floatasint-function-floatasint-value-src-mq3-client-cl-ui-runtime-ml-471018229"></a>
### FloatAsInt

```ml
function FloatAsInt(value)
```

Adapts `mq3.compat.numeric.i32` to engine client UI runtime `FloatAsInt`, returning its result for `n.floatBits(value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.compat.numeric.i32`; passed as `n.floatBits(value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L232)

<a id="function-function-mq3-client-cl-ui-runtime-getclientstate-function-getclientstate-state-src-mq3-client-cl-ui-runtime-ml-17150313"></a>
### GetClientState

```ml
function GetClientState(state)
```

Calls `mq3.client.ui_host_lifecycle.encodeClientState` from engine client UI runtime `GetClientState`. The final path returns `hostState.encodeClientState(state.clientState)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.clientState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L83)

<a id="function-function-mq3-client-cl-ui-runtime-getclipboarddata-function-getclipboarddata-state-capacity-src-mq3-client-cl-ui-runtime-ml-1016045181"></a>
### GetClipboardData

```ml
function GetClipboardData(state, capacity)
```

Adapts `mq3.client.cl_ui_runtime.bounded` to engine client UI runtime `GetClipboardData`, returning its result for `state.clipboard, capacity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.clipboard`. |
| `capacity` | `dynamic` | — | Maximum number of entries or bytes accepted by this container. Forwarded to `mq3.client.cl_ui_runtime.bounded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L187)

<a id="function-function-mq3-client-cl-ui-runtime-getconfigstring-function-getconfigstring-state-index-capacity-src-mq3-client-cl-ui-runtime-ml-456416925"></a>
### GetConfigString

```ml
function GetConfigString(state, index, capacity)
```

Calls `mq3.client.cl_ui_runtime.bounded` from engine client UI runtime `GetConfigString`. The final path returns `bounded(state.configStrings[index],capacity)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.configStrings`. |
| `index` | `dynamic` | — | Value tested by `index<0 or index>=MAX_CONFIGSTRINGS or index>=len(state.configStrings) or state.configStrings[index]==""` before the calculation continues. |
| `capacity` | `dynamic` | — | Maximum number of entries or bytes accepted by this container. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L229)

<a id="function-function-mq3-client-cl-ui-runtime-key-getbindingbuf-function-key-getbindingbuf-state-keynum-capacity-src-mq3-client-cl-ui-runtime-ml-1125324806"></a>
### Key_GetBindingBuf

```ml
function Key_GetBindingBuf(state, keynum, capacity)
```

Calls `mq3.client.cl_ui_runtime.bounded`, `state.syscallHost.keys.bindingFn` from engine client UI runtime `Key_GetBindingBuf`. The final path returns `bounded(state.syscallHost.keys.bindingFn(state.syscallHost.context,keynum),capacity)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscallHost`, `state.syscallHost.keys.bindingFn`, `state.syscallHost.context`. |
| `keynum` | `dynamic` | — | Quake III key number identifying the keyboard or mouse input. |
| `capacity` | `dynamic` | — | Maximum number of entries or bytes accepted by this container. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L197)

<a id="function-function-mq3-client-cl-ui-runtime-key-getcatcher-function-key-getcatcher-state-src-mq3-client-cl-ui-runtime-ml-1909306641"></a>
### Key_GetCatcher

```ml
function Key_GetCatcher(state)
```

Calls `state.syscallHost.keys.getCatcherFn` from engine client UI runtime `Key_GetCatcher`. The final path returns `state.keyCatchers`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscallHost`, `state.syscallHost.keys.getCatcherFn`, `state.syscallHost.context`, `state.keyCatchers`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L200)

<a id="function-function-mq3-client-cl-ui-runtime-key-keynumtostringbuf-function-key-keynumtostringbuf-state-keynum-capacity-src-mq3-client-cl-ui-runtime-ml-1332082230"></a>
### Key_KeynumToStringBuf

```ml
function Key_KeynumToStringBuf(state, keynum, capacity)
```

Calls `mq3.client.cl_ui_runtime.bounded`, `state.syscallHost.keys.keyNameFn` from engine client UI runtime `Key_KeynumToStringBuf`. The final path returns `bounded(state.syscallHost.keys.keyNameFn(state.syscallHost.context,keynum),capacity)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscallHost`, `state.syscallHost.keys.keyNameFn`, `state.syscallHost.context`. |
| `keynum` | `dynamic` | — | Quake III key number identifying the keyboard or mouse input. |
| `capacity` | `dynamic` | — | Maximum number of entries or bytes accepted by this container. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L192)

<a id="function-function-mq3-client-cl-ui-runtime-key-setcatcher-function-key-setcatcher-state-catcher-src-mq3-client-cl-ui-runtime-ml-376007863"></a>
### Key_SetCatcher

```ml
function Key_SetCatcher(state, catcher)
```

Updates `state.keyCatchers` during engine client UI runtime `Key_SetCatcher`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client UI runtime record/storage; this routine assigns `state.keyCatchers`. |
| `catcher` | `dynamic` | — | Value assigned to `state.keyCatchers`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L204)

<a id="function-function-mq3-client-cl-ui-runtime-keysegment-function-keysegment-value-offset-src-mq3-client-cl-ui-runtime-ml-56971720"></a>
### keySegment

```ml
function keySegment(value, offset)
```

Calls `copyBytes`, `decode` from engine client UI runtime `keySegment`. The final path returns `decode(result)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `raw=bytes(value)`. |
| `offset` | `dynamic` | — | Value tested by `offset<len(raw)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L209)

<a id="function-function-mq3-client-cl-ui-runtime-lan-addserver-function-lan-addserver-state-source-name-address-src-mq3-client-cl-ui-runtime-ml-1691438937"></a>
### LAN_AddServer

```ml
function LAN_AddServer(state, source, name, address)
```

Adapts `mq3.client.ui_lan_browser.add` to engine client UI runtime `LAN_AddServer`, returning its result for `state.browser, source, name, address`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.browser`. |
| `source` | `dynamic` | — | Argument 2 of `mq3.client.ui_lan_browser.add`. |
| `name` | `dynamic` | — | Argument 3 of `mq3.client.ui_lan_browser.add`. |
| `address` | `dynamic` | — | Argument 4 of `mq3.client.ui_lan_browser.add`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L99)

<a id="function-function-mq3-client-cl-ui-runtime-lan-clearping-function-lan-clearping-state-index-src-mq3-client-cl-ui-runtime-ml-353070941"></a>
### LAN_ClearPing

```ml
function LAN_ClearPing(state, index)
```

Adapts `mq3.client.ui_lan_browser.clearPing` to engine client UI runtime `LAN_ClearPing`, returning its result for `state.browser, index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.browser`. |
| `index` | `dynamic` | — | Argument 2 of `mq3.client.ui_lan_browser.clearPing`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L145)

<a id="function-function-mq3-client-cl-ui-runtime-lan-compareservers-function-lan-compareservers-state-source-sortkey-sortdir-first-second-src-mq3-client-cl-ui-runtime-ml-1824543298"></a>
### LAN_CompareServers

```ml
function LAN_CompareServers(state, source, sortKey, sortDir, first, second)
```

Adapts `mq3.client.ui_lan_browser.compare` to engine client UI runtime `LAN_CompareServers`, returning its result for `state.browser, source, sortKey, sortDir, first, second`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.browser`. |
| `source` | `dynamic` | — | Argument 2 of `mq3.client.ui_lan_browser.compare`. |
| `sortKey` | `dynamic` | — | Argument 3 of `mq3.client.ui_lan_browser.compare`. |
| `sortDir` | `dynamic` | — | Argument 4 of `mq3.client.ui_lan_browser.compare`. |
| `first` | `dynamic` | — | Argument 5 of `mq3.client.ui_lan_browser.compare`. |
| `second` | `dynamic` | — | Argument 6 of `mq3.client.ui_lan_browser.compare`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L138)

<a id="function-function-mq3-client-cl-ui-runtime-lan-getping-function-lan-getping-state-index-capacity-src-mq3-client-cl-ui-runtime-ml-1023624239"></a>
### LAN_GetPing

```ml
function LAN_GetPing(state, index, capacity)
```

Calls `mq3.client.ui_lan_browser.getPing`, `mq3.client.cl_ui_runtime.bounded` from engine client UI runtime `LAN_GetPing`. The final path returns `[bounded(value[0],capacity),value[1]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.browser`. |
| `index` | `dynamic` | — | Value used by `value=lan.getPing(state.browser,index)`. |
| `capacity` | `dynamic` | — | Maximum number of entries or bytes accepted by this container. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L150)

<a id="function-function-mq3-client-cl-ui-runtime-lan-getpinginfo-function-lan-getpinginfo-state-index-capacity-src-mq3-client-cl-ui-runtime-ml-992322595"></a>
### LAN_GetPingInfo

```ml
function LAN_GetPingInfo(state, index, capacity)
```

Adapts `mq3.client.cl_ui_runtime.bounded` to engine client UI runtime `LAN_GetPingInfo`, returning its result for `lan.getPingInfo(state.browser,index), capacity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.browser`. |
| `index` | `dynamic` | — | Argument 1 of `mq3.client.cl_ui_runtime.bounded`; passed as `lan.getPingInfo(state.browser,index)`. |
| `capacity` | `dynamic` | — | Maximum number of entries or bytes accepted by this container. Forwarded to `mq3.client.cl_ui_runtime.bounded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L155)

<a id="function-function-mq3-client-cl-ui-runtime-lan-getpingqueuecount-function-lan-getpingqueuecount-state-src-mq3-client-cl-ui-runtime-ml-1525595693"></a>
### LAN_GetPingQueueCount

```ml
function LAN_GetPingQueueCount(state)
```

Adapts `mq3.client.ui_lan_browser.pingCount` to engine client UI runtime `LAN_GetPingQueueCount`, returning its result for `state.browser`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.browser`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L141)

<a id="function-function-mq3-client-cl-ui-runtime-lan-getserveraddressstring-function-lan-getserveraddressstring-state-source-index-capacity-src-mq3-client-cl-ui-runtime-ml-154284238"></a>
### LAN_GetServerAddressString

```ml
function LAN_GetServerAddressString(state, source, index, capacity)
```

Adapts `mq3.client.cl_ui_runtime.bounded` to engine client UI runtime `LAN_GetServerAddressString`, returning its result for `lan.address(state.browser,source,index), capacity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.browser`. |
| `source` | `dynamic` | — | Argument 1 of `mq3.client.cl_ui_runtime.bounded`; passed as `lan.address(state.browser,source,index)`. |
| `index` | `dynamic` | — | Argument 1 of `mq3.client.cl_ui_runtime.bounded`; passed as `lan.address(state.browser,source,index)`. |
| `capacity` | `dynamic` | — | Maximum number of entries or bytes accepted by this container. Forwarded to `mq3.client.cl_ui_runtime.bounded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L114)

<a id="function-function-mq3-client-cl-ui-runtime-lan-getservercount-function-lan-getservercount-state-source-src-mq3-client-cl-ui-runtime-ml-1093966354"></a>
### LAN_GetServerCount

```ml
function LAN_GetServerCount(state, source)
```

Adapts `mq3.client.ui_lan_browser.count` to engine client UI runtime `LAN_GetServerCount`, returning its result for `state.browser, source`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.browser`. |
| `source` | `dynamic` | — | Argument 2 of `mq3.client.ui_lan_browser.count`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L108)

<a id="function-function-mq3-client-cl-ui-runtime-lan-getserverinfo-function-lan-getserverinfo-state-source-index-capacity-src-mq3-client-cl-ui-runtime-ml-1364339984"></a>
### LAN_GetServerInfo

```ml
function LAN_GetServerInfo(state, source, index, capacity)
```

Adapts `mq3.client.cl_ui_runtime.bounded` to engine client UI runtime `LAN_GetServerInfo`, returning its result for `lan.serverInfo(state.browser,source,index), capacity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.browser`. |
| `source` | `dynamic` | — | Argument 1 of `mq3.client.cl_ui_runtime.bounded`; passed as `lan.serverInfo(state.browser,source,index)`. |
| `index` | `dynamic` | — | Argument 1 of `mq3.client.cl_ui_runtime.bounded`; passed as `lan.serverInfo(state.browser,source,index)`. |
| `capacity` | `dynamic` | — | Maximum number of entries or bytes accepted by this container. Forwarded to `mq3.client.cl_ui_runtime.bounded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L120)

<a id="function-function-mq3-client-cl-ui-runtime-lan-getserverping-function-lan-getserverping-state-source-index-src-mq3-client-cl-ui-runtime-ml-1949283796"></a>
### LAN_GetServerPing

```ml
function LAN_GetServerPing(state, source, index)
```

Adapts `mq3.client.ui_lan_browser.serverPing` to engine client UI runtime `LAN_GetServerPing`, returning its result for `state.browser, source, index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.browser`. |
| `source` | `dynamic` | — | Argument 2 of `mq3.client.ui_lan_browser.serverPing`. |
| `index` | `dynamic` | — | Argument 3 of `mq3.client.ui_lan_browser.serverPing`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L125)

<a id="function-function-mq3-client-cl-ui-runtime-lan-getserverptr-function-lan-getserverptr-state-source-index-src-mq3-client-cl-ui-runtime-ml-1737610414"></a>
### LAN_GetServerPtr

```ml
function LAN_GetServerPtr(state, source, index)
```

Adapts `mq3.client.ui_lan_browser.at` to engine client UI runtime `LAN_GetServerPtr`, returning its result for `state.browser, source, index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.browser`. |
| `source` | `dynamic` | — | Argument 2 of `mq3.client.ui_lan_browser.at`. |
| `index` | `dynamic` | — | Argument 3 of `mq3.client.ui_lan_browser.at`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L130)

<a id="function-function-mq3-client-cl-ui-runtime-lan-getserverstatus-function-lan-getserverstatus-state-address-capacity-src-mq3-client-cl-ui-runtime-ml-1199071957"></a>
### LAN_GetServerStatus

```ml
function LAN_GetServerStatus(state, address, capacity)
```

Calls `mq3.client.ui_lan_queries.setRealtime`, `mq3.client.ui_lan_queries.serverStatus`, `mq3.client.ui_lan_browser.serverStatus` and additional helpers from engine client UI runtime `LAN_GetServerStatus`. The final path returns `[true,bounded(value,capacity)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.queryState`, `state.realtime`, `state.browser`. |
| `address` | `dynamic` | — | Value used by `value=queries.serverStatus(state.queryState,address) else value=lan.serverStatus(state.browser,address) end if`. |
| `capacity` | `dynamic` | — | Maximum number of entries or bytes accepted by this container. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L177)

<a id="function-function-mq3-client-cl-ui-runtime-lan-loadcachedservers-function-lan-loadcachedservers-state-src-mq3-client-cl-ui-runtime-ml-312673357"></a>
### LAN_LoadCachedServers

```ml
function LAN_LoadCachedServers(state)
```

Calls `mq3.client.ui_lan_cache.load` from engine client UI runtime `LAN_LoadCachedServers`. The final path returns `cache.load(state.browser,state.cacheHost)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.browser`, `state.cacheHost`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L86)

<a id="function-function-mq3-client-cl-ui-runtime-lan-markservervisible-function-lan-markservervisible-state-source-index-visible-src-mq3-client-cl-ui-runtime-ml-654537408"></a>
### LAN_MarkServerVisible

```ml
function LAN_MarkServerVisible(state, source, index, visible)
```

Adapts `mq3.client.ui_lan_browser.markVisible` to engine client UI runtime `LAN_MarkServerVisible`, returning its result for `state.browser, source, index, visible`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.browser`. |
| `source` | `dynamic` | — | Argument 2 of `mq3.client.ui_lan_browser.markVisible`. |
| `index` | `dynamic` | — | Argument 3 of `mq3.client.ui_lan_browser.markVisible`. |
| `visible` | `dynamic` | — | Argument 4 of `mq3.client.ui_lan_browser.markVisible`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L161)

<a id="function-function-mq3-client-cl-ui-runtime-lan-removeserver-function-lan-removeserver-state-source-address-src-mq3-client-cl-ui-runtime-ml-1865071606"></a>
### LAN_RemoveServer

```ml
function LAN_RemoveServer(state, source, address)
```

Adapts `mq3.client.ui_lan_browser.remove` to engine client UI runtime `LAN_RemoveServer`, returning its result for `state.browser, source, address`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.browser`. |
| `source` | `dynamic` | — | Argument 2 of `mq3.client.ui_lan_browser.remove`. |
| `address` | `dynamic` | — | Argument 3 of `mq3.client.ui_lan_browser.remove`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L104)

<a id="function-function-mq3-client-cl-ui-runtime-lan-resetpings-function-lan-resetpings-state-source-src-mq3-client-cl-ui-runtime-ml-221353402"></a>
### LAN_ResetPings

```ml
function LAN_ResetPings(state, source)
```

Adapts `mq3.client.ui_lan_browser.resetPings` to engine client UI runtime `LAN_ResetPings`, returning its result for `state.browser, source`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.browser`. |
| `source` | `dynamic` | — | Argument 2 of `mq3.client.ui_lan_browser.resetPings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L93)

<a id="function-function-mq3-client-cl-ui-runtime-lan-saveserverstocache-function-lan-saveserverstocache-state-src-mq3-client-cl-ui-runtime-ml-1981849905"></a>
### LAN_SaveServersToCache

```ml
function LAN_SaveServersToCache(state)
```

Calls `mq3.client.ui_lan_cache.save` from engine client UI runtime `LAN_SaveServersToCache`. The final path returns `cache.save(state.browser,state.cacheHost)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.browser`, `state.cacheHost`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L89)

<a id="function-function-mq3-client-cl-ui-runtime-lan-serverisvisible-function-lan-serverisvisible-state-source-index-src-mq3-client-cl-ui-runtime-ml-522125632"></a>
### LAN_ServerIsVisible

```ml
function LAN_ServerIsVisible(state, source, index)
```

Adapts `mq3.client.ui_lan_browser.isVisible` to engine client UI runtime `LAN_ServerIsVisible`, returning its result for `state.browser, source, index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.browser`. |
| `source` | `dynamic` | — | Argument 2 of `mq3.client.ui_lan_browser.isVisible`. |
| `index` | `dynamic` | — | Argument 3 of `mq3.client.ui_lan_browser.isVisible`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L166)

<a id="function-function-mq3-client-cl-ui-runtime-lan-updatevisiblepings-function-lan-updatevisiblepings-state-source-src-mq3-client-cl-ui-runtime-ml-1780680210"></a>
### LAN_UpdateVisiblePings

```ml
function LAN_UpdateVisiblePings(state, source)
```

Calls `mq3.client.ui_lan_queries.setRealtime`, `mq3.client.ui_lan_queries.updateVisiblePings`, `mq3.client.ui_lan_browser.updateVisiblePings` from engine client UI runtime `LAN_UpdateVisiblePings`. The final path returns `lan.updateVisiblePings(state.browser,source)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.queryState`, `state.realtime`, `state.browser`. |
| `source` | `dynamic` | — | Value used by `return queries.updateVisiblePings(state.queryState,source) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L170)

<a id="constant-constant-mq3-client-cl-ui-runtime-max-configstrings-const-max-configstrings-1024-src-mq3-client-cl-ui-runtime-ml-1507604798"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```

Capacity limit for the configstrings collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L14)

<a id="function-function-mq3-client-cl-ui-runtime-normalizedkey-function-normalizedkey-value-src-mq3-client-cl-ui-runtime-ml-188573045"></a>
### normalizedKey

```ml
function normalizedKey(value)
```

Calls `copyBytes` from engine client UI runtime `normalizedKey`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `raw=bytes(value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L212)

- [mq3.client.cl_ui_runtime.State](Type-mq3-client-cl-ui-runtime-state-614647333.md) — struct
<a id="function-function-mq3-client-cl-ui-runtime-ui-gamecommand-function-ui-gamecommand-state-src-mq3-client-cl-ui-runtime-ml-1677308989"></a>
### UI_GameCommand

```ml
function UI_GameCommand(state)
```

Calls `mq3.client.ui_vm.consoleCommand` from engine client UI runtime `UI_GameCommand`. The final path returns `uiVm.consoleCommand(state.ui,state.realtime)!=0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.ui`, `state.realtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L259)

<a id="function-function-mq3-client-cl-ui-runtime-ui-usesuniquecdkey-function-ui-usesuniquecdkey-state-src-mq3-client-cl-ui-runtime-ml-1197989773"></a>
### UI_usesUniqueCDKey

```ml
function UI_usesUniqueCDKey(state)
```

Calls `mq3.client.ui_vm.usesUniqueCdKey` from engine client UI runtime `UI_usesUniqueCDKey`. The final path returns `uiVm.usesUniqueCdKey(state.ui)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.ui`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_ui_runtime.ml#L256)
