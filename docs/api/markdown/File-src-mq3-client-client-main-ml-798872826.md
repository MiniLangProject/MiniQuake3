# `src/mq3/client/client_main.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.client_main`](Package-mq3-client-client-main-1514442778.md)

Reachable from entry: **no**

## Imports

- `mq3/client/client_abi.ml` as `clientAbi` → [src/mq3/client/client_abi.ml](File-src-mq3-client-client-abi-ml-362324391.md)
- `mq3/client/connectionless.ml` as `connectionless` → [src/mq3/client/connectionless.ml](File-src-mq3-client-connectionless-ml-1561502254.md)
- `mq3/client/demo.ml` as `demo` → [src/mq3/client/demo.ml](File-src-mq3-client-demo-ml-1236155596.md)
- `mq3/client/frame.ml` as `clientFrame` → [src/mq3/client/frame.ml](File-src-mq3-client-frame-ml-2110176474.md)
- `mq3/client/network_ingress.ml` as `networkIngress` → [src/mq3/client/network_ingress.ml](File-src-mq3-client-network-ingress-ml-1289633455.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.client_main.Action](Type-mq3-client-client-main-action-1056446126.md) — struct
<a id="function-function-mq3-client-client-main-addressequal-function-addressequal-a-b-src-mq3-client-client-main-ml-1705388363"></a>
### addressEqual

```ml
function addressEqual(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L65)

<a id="function-function-mq3-client-client-main-attachconnection-function-attachconnection-state-runtime-services-src-mq3-client-client-main-ml-1087240067"></a>
### attachConnection

```ml
function attachConnection(state, runtime, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `runtime` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L75)

<a id="function-function-mq3-client-client-main-attachframe-function-attachframe-state-runtime-services-src-mq3-client-client-main-ml-1272879295"></a>
### attachFrame

```ml
function attachFrame(state, runtime, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `runtime` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L74)

<a id="function-function-mq3-client-client-main-attachnetworkingress-function-attachnetworkingress-state-runtime-src-mq3-client-client-main-ml-2041311779"></a>
### attachNetworkIngress

```ml
function attachNetworkIngress(state, runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L76)

<a id="constant-constant-mq3-client-client-main-ca-active-const-ca-active-8-src-mq3-client-client-main-ml-1735863069"></a>
### CA_ACTIVE

```ml
const CA_ACTIVE = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L21)

<a id="constant-constant-mq3-client-client-main-ca-authorizing-const-ca-authorizing-2-src-mq3-client-client-main-ml-1368074963"></a>
### CA_AUTHORIZING

```ml
const CA_AUTHORIZING = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L15)

<a id="constant-constant-mq3-client-client-main-ca-challenging-const-ca-challenging-4-src-mq3-client-client-main-ml-360103993"></a>
### CA_CHALLENGING

```ml
const CA_CHALLENGING = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L17)

<a id="constant-constant-mq3-client-client-main-ca-connected-const-ca-connected-5-src-mq3-client-client-main-ml-2012470916"></a>
### CA_CONNECTED

```ml
const CA_CONNECTED = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L18)

<a id="constant-constant-mq3-client-client-main-ca-connecting-const-ca-connecting-3-src-mq3-client-client-main-ml-997997096"></a>
### CA_CONNECTING

```ml
const CA_CONNECTING = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L16)

<a id="constant-constant-mq3-client-client-main-ca-disconnected-const-ca-disconnected-1-src-mq3-client-client-main-ml-272570302"></a>
### CA_DISCONNECTED

```ml
const CA_DISCONNECTED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L14)

<a id="constant-constant-mq3-client-client-main-ca-loading-const-ca-loading-6-src-mq3-client-client-main-ml-729956663"></a>
### CA_LOADING

```ml
const CA_LOADING = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L19)

<a id="constant-constant-mq3-client-client-main-ca-primed-const-ca-primed-7-src-mq3-client-client-main-ml-1899176428"></a>
### CA_PRIMED

```ml
const CA_PRIMED = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L20)

<a id="constant-constant-mq3-client-client-main-ca-uninitialized-const-ca-uninitialized-0-src-mq3-client-client-main-ml-1003697603"></a>
### CA_UNINITIALIZED

```ml
const CA_UNINITIALIZED = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L13)

<a id="constant-constant-mq3-client-client-main-cdchksum-len-const-cdchksum-len-2-src-mq3-client-client-main-ml-1814007513"></a>
### CDCHKSUM_LEN

```ml
const CDCHKSUM_LEN = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L29)

<a id="constant-constant-mq3-client-client-main-cdkey-len-const-cdkey-len-16-src-mq3-client-client-main-ml-1396060174"></a>
### CDKEY_LEN

```ml
const CDKEY_LEN = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L28)

<a id="function-function-mq3-client-client-main-cl-addreliablecommand-function-cl-addreliablecommand-state-cmd-src-mq3-client-client-main-ml-1323089335"></a>
### CL_AddReliableCommand

```ml
function CL_AddReliableCommand(state, cmd)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cmd` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L82)

<a id="function-function-mq3-client-client-main-cl-begindownload-function-cl-begindownload-state-services-localname-remotename-src-mq3-client-client-main-ml-879101100"></a>
### CL_BeginDownload

```ml
function CL_BeginDownload(state, services, localName, remoteName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `localName` | `dynamic` | — |  |
| `remoteName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L215)

<a id="function-function-mq3-client-client-main-cl-cddialog-function-cl-cddialog-state-src-mq3-client-client-main-ml-441315603"></a>
### CL_CDDialog

```ml
function CL_CDDialog(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L198)

<a id="function-function-mq3-client-client-main-cl-cdkeyvalidate-function-cl-cdkeyvalidate-key-checksum-src-mq3-client-client-main-ml-1755692930"></a>
### CL_CDKeyValidate

```ml
function CL_CDKeyValidate(key, checksum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — |  |
| `checksum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L291)

<a id="function-function-mq3-client-client-main-cl-changereliablecommand-function-cl-changereliablecommand-state-src-mq3-client-client-main-ml-1522791289"></a>
### CL_ChangeReliableCommand

```ml
function CL_ChangeReliableCommand(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L86)

<a id="function-function-mq3-client-client-main-cl-checkforresend-function-cl-checkforresend-state-services-src-mq3-client-client-main-ml-2101713257"></a>
### CL_CheckForResend

```ml
function CL_CheckForResend(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L124)

<a id="function-function-mq3-client-client-main-cl-checktimeout-function-cl-checktimeout-state-services-src-mq3-client-client-main-ml-2094990563"></a>
### CL_CheckTimeout

```ml
function CL_CheckTimeout(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L204)

<a id="function-function-mq3-client-client-main-cl-checkuserinfo-function-cl-checkuserinfo-state-services-modified-src-mq3-client-client-main-ml-60277956"></a>
### CL_CheckUserinfo

```ml
function CL_CheckUserinfo(state, services, modified)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `modified` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L200)

<a id="function-function-mq3-client-client-main-cl-clearping-function-cl-clearping-state-n-src-mq3-client-client-main-ml-2095384965"></a>
### CL_ClearPing

```ml
function CL_ClearPing(state, n)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `n` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L251)

<a id="function-function-mq3-client-client-main-cl-clearstate-function-cl-clearstate-state-src-mq3-client-client-main-ml-697762909"></a>
### CL_ClearState

```ml
function CL_ClearState(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L149)

<a id="function-function-mq3-client-client-main-cl-clientinfo-f-function-cl-clientinfo-f-state-services-src-mq3-client-client-main-ml-468542101"></a>
### CL_Clientinfo_f

```ml
function CL_Clientinfo_f(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L282)

<a id="function-function-mq3-client-client-main-cl-configstrings-f-function-cl-configstrings-f-state-services-src-mq3-client-client-main-ml-1302073597"></a>
### CL_Configstrings_f

```ml
function CL_Configstrings_f(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L285)

<a id="function-function-mq3-client-client-main-cl-connect-f-function-cl-connect-f-state-services-address-src-mq3-client-client-main-ml-1722907395"></a>
### CL_Connect_f

```ml
function CL_Connect_f(state, services, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L170)

<a id="function-function-mq3-client-client-main-cl-connectionlesspacket-function-cl-connectionlesspacket-state-services-address-command-payload-src-mq3-client-client-main-ml-1649830890"></a>
### CL_ConnectionlessPacket

```ml
function CL_ConnectionlessPacket(state, services, address, command, payload)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `payload` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L133)

<a id="function-function-mq3-client-client-main-cl-democompleted-function-cl-democompleted-state-services-src-mq3-client-client-main-ml-154316429"></a>
### CL_DemoCompleted

```ml
function CL_DemoCompleted(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L105)

<a id="function-function-mq3-client-client-main-cl-demofilename-function-cl-demofilename-number-src-mq3-client-client-main-ml-2046797421"></a>
### CL_DemoFilename

```ml
function CL_DemoFilename(number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L99)

<a id="function-function-mq3-client-client-main-cl-disconnect-function-cl-disconnect-state-services-showmainmenu-src-mq3-client-client-main-ml-1210785704"></a>
### CL_Disconnect

```ml
function CL_Disconnect(state, services, showMainMenu)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `showMainMenu` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L152)

<a id="function-function-mq3-client-client-main-cl-disconnect-f-function-cl-disconnect-f-state-services-src-mq3-client-client-main-ml-1934675415"></a>
### CL_Disconnect_f

```ml
function CL_Disconnect_f(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L166)

<a id="function-function-mq3-client-client-main-cl-disconnectpacket-function-cl-disconnectpacket-state-services-address-src-mq3-client-client-main-ml-1919189735"></a>
### CL_DisconnectPacket

```ml
function CL_DisconnectPacket(state, services, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L120)

<a id="function-function-mq3-client-client-main-cl-downloadscomplete-function-cl-downloadscomplete-state-services-src-mq3-client-client-main-ml-368886621"></a>
### CL_DownloadsComplete

```ml
function CL_DownloadsComplete(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L225)

<a id="function-function-mq3-client-client-main-cl-flushmemory-function-cl-flushmemory-state-services-src-mq3-client-client-main-ml-1640736385"></a>
### CL_FlushMemory

```ml
function CL_FlushMemory(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L191)

<a id="function-function-mq3-client-client-main-cl-forwardcommandtoserver-function-cl-forwardcommandtoserver-state-services-command-src-mq3-client-client-main-ml-166464796"></a>
### CL_ForwardCommandToServer

```ml
function CL_ForwardCommandToServer(state, services, command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L161)

<a id="function-function-mq3-client-client-main-cl-forwardtoserver-f-function-cl-forwardtoserver-f-state-services-args-src-mq3-client-client-main-ml-613026534"></a>
### CL_ForwardToServer_f

```ml
function CL_ForwardToServer_f(state, services, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L164)

<a id="function-function-mq3-client-client-main-cl-frame-function-cl-frame-state-services-msec-src-mq3-client-client-main-ml-889513977"></a>
### CL_Frame

```ml
function CL_Frame(state, services, msec)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `msec` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L209)

<a id="function-function-mq3-client-client-main-cl-getfreeping-function-cl-getfreeping-state-src-mq3-client-client-main-ml-2035700901"></a>
### CL_GetFreePing

```ml
function CL_GetFreePing(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L247)

<a id="function-function-mq3-client-client-main-cl-getping-function-cl-getping-state-n-maxping-src-mq3-client-client-main-ml-345079069"></a>
### CL_GetPing

```ml
function CL_GetPing(state, n, maxPing)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `n` | `dynamic` | — |  |
| `maxPing` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L252)

<a id="function-function-mq3-client-client-main-cl-getpinginfo-function-cl-getpinginfo-state-n-src-mq3-client-client-main-ml-1482081153"></a>
### CL_GetPingInfo

```ml
function CL_GetPingInfo(state, n)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `n` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L255)

<a id="function-function-mq3-client-client-main-cl-getpingqueuecount-function-cl-getpingqueuecount-state-src-mq3-client-client-main-ml-1329900229"></a>
### CL_GetPingQueueCount

```ml
function CL_GetPingQueueCount(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L246)

<a id="function-function-mq3-client-client-main-cl-getserverstatus-function-cl-getserverstatus-state-address-src-mq3-client-client-main-ml-876605155"></a>
### CL_GetServerStatus

```ml
function CL_GetServerStatus(state, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L267)

<a id="function-function-mq3-client-client-main-cl-globalservers-f-function-cl-globalservers-f-state-services-master-protocol-keywords-src-mq3-client-client-main-ml-1618259675"></a>
### CL_GlobalServers_f

```ml
function CL_GlobalServers_f(state, services, master, protocol, keywords)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `master` | `dynamic` | — |  |
| `protocol` | `dynamic` | — |  |
| `keywords` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L244)

<a id="function-function-mq3-client-client-main-cl-init-function-cl-init-state-services-src-mq3-client-client-main-ml-1991654077"></a>
### CL_Init

```ml
function CL_Init(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L192)

<a id="function-function-mq3-client-client-main-cl-initdownloads-function-cl-initdownloads-state-services-downloads-src-mq3-client-client-main-ml-1511575912"></a>
### CL_InitDownloads

```ml
function CL_InitDownloads(state, services, downloads)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `downloads` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L222)

<a id="function-function-mq3-client-client-main-cl-initref-function-cl-initref-state-services-src-mq3-client-client-main-ml-53698429"></a>
### CL_InitRef

```ml
function CL_InitRef(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L180)

<a id="function-function-mq3-client-client-main-cl-initrenderer-function-cl-initrenderer-state-services-src-mq3-client-client-main-ml-332511151"></a>
### CL_InitRenderer

```ml
function CL_InitRenderer(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L182)

<a id="function-function-mq3-client-client-main-cl-initserverinfo-function-cl-initserverinfo-address-src-mq3-client-client-main-ml-283403876"></a>
### CL_InitServerInfo

```ml
function CL_InitServerInfo(address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L229)

<a id="function-function-mq3-client-client-main-cl-localservers-f-function-cl-localservers-f-state-services-src-mq3-client-client-main-ml-1730676257"></a>
### CL_LocalServers_f

```ml
function CL_LocalServers_f(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L243)

<a id="function-function-mq3-client-client-main-cl-maploading-function-cl-maploading-state-services-mapname-src-mq3-client-client-main-ml-2029028936"></a>
### CL_MapLoading

```ml
function CL_MapLoading(state, services, mapName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L157)

<a id="function-function-mq3-client-client-main-cl-motdpacket-function-cl-motdpacket-state-services-address-text-src-mq3-client-client-main-ml-1569690210"></a>
### CL_MotdPacket

```ml
function CL_MotdPacket(state, services, address, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L272)

<a id="function-function-mq3-client-client-main-cl-nextdemo-function-cl-nextdemo-state-services-src-mq3-client-client-main-ml-1195344701"></a>
### CL_NextDemo

```ml
function CL_NextDemo(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L118)

<a id="function-function-mq3-client-client-main-cl-nextdownload-function-cl-nextdownload-state-services-src-mq3-client-client-main-ml-1205251375"></a>
### CL_NextDownload

```ml
function CL_NextDownload(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L218)

<a id="function-function-mq3-client-client-main-cl-openedpk3list-f-function-cl-openedpk3list-f-state-services-src-mq3-client-client-main-ml-619827061"></a>
### CL_OpenedPK3List_f

```ml
function CL_OpenedPK3List_f(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L276)

<a id="function-function-mq3-client-client-main-cl-packetevent-function-cl-packetevent-state-services-address-command-payload-src-mq3-client-client-main-ml-1435922928"></a>
### CL_PacketEvent

```ml
function CL_PacketEvent(state, services, address, command, payload)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `payload` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L145)

<a id="function-function-mq3-client-client-main-cl-packeteventlive-function-cl-packeteventlive-state-address-data-src-mq3-client-client-main-ml-123910275"></a>
### CL_PacketEventLive

```ml
function CL_PacketEventLive(state, address, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L77)

<a id="function-function-mq3-client-client-main-cl-ping-f-function-cl-ping-f-state-services-address-src-mq3-client-client-main-ml-1085036817"></a>
### CL_Ping_f

```ml
function CL_Ping_f(state, services, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L256)

<a id="function-function-mq3-client-client-main-cl-playdemo-f-function-cl-playdemo-f-state-services-name-data-src-mq3-client-client-main-ml-1062568784"></a>
### CL_PlayDemo_f

```ml
function CL_PlayDemo_f(state, services, name, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L111)

<a id="function-function-mq3-client-client-main-cl-rcon-f-function-cl-rcon-f-state-services-password-command-address-src-mq3-client-client-main-ml-1796385621"></a>
### CL_Rcon_f

```ml
function CL_Rcon_f(state, services, password, command, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `password` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L173)

<a id="function-function-mq3-client-client-main-cl-readdemomessage-function-cl-readdemomessage-state-data-src-mq3-client-client-main-ml-2074435481"></a>
### CL_ReadDemoMessage

```ml
function CL_ReadDemoMessage(state, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L114)

<a id="function-function-mq3-client-client-main-cl-reconnect-f-function-cl-reconnect-f-state-services-src-mq3-client-client-main-ml-459938705"></a>
### CL_Reconnect_f

```ml
function CL_Reconnect_f(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L167)

<a id="function-function-mq3-client-client-main-cl-record-f-function-cl-record-f-state-services-name-file-src-mq3-client-client-main-ml-1208083194"></a>
### CL_Record_f

```ml
function CL_Record_f(state, services, name, file)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `file` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L100)

<a id="function-function-mq3-client-client-main-cl-referencedpk3list-f-function-cl-referencedpk3list-f-state-services-src-mq3-client-client-main-ml-1242891901"></a>
### CL_ReferencedPK3List_f

```ml
function CL_ReferencedPK3List_f(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L277)

<a id="function-function-mq3-client-client-main-cl-refmalloc-function-cl-refmalloc-state-services-size-src-mq3-client-client-main-ml-1423382010"></a>
### CL_RefMalloc

```ml
function CL_RefMalloc(state, services, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L179)

<a id="function-function-mq3-client-client-main-cl-refprintf-function-cl-refprintf-state-services-level-text-src-mq3-client-client-main-ml-1986695080"></a>
### CL_RefPrintf

```ml
function CL_RefPrintf(state, services, level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L178)

<a id="function-function-mq3-client-client-main-cl-requestmotd-function-cl-requestmotd-state-services-address-challenge-src-mq3-client-client-main-ml-2073565602"></a>
### CL_RequestMotd

```ml
function CL_RequestMotd(state, services, address, challenge)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `challenge` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L278)

<a id="function-function-mq3-client-client-main-cl-resetpureclientatserver-function-cl-resetpureclientatserver-state-services-src-mq3-client-client-main-ml-1583878717"></a>
### CL_ResetPureClientAtServer

```ml
function CL_ResetPureClientAtServer(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L275)

<a id="function-function-mq3-client-client-main-cl-scaledmilliseconds-function-cl-scaledmilliseconds-state-services-timescale-src-mq3-client-client-main-ml-1990245820"></a>
### CL_ScaledMilliseconds

```ml
function CL_ScaledMilliseconds(state, services, timeScale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `timeScale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L199)

<a id="function-function-mq3-client-client-main-cl-sendpurechecksums-function-cl-sendpurechecksums-state-services-src-mq3-client-client-main-ml-76455745"></a>
### CL_SendPureChecksums

```ml
function CL_SendPureChecksums(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L274)

<a id="function-function-mq3-client-client-main-cl-serverinfopacket-function-cl-serverinfopacket-state-services-address-infotext-src-mq3-client-client-main-ml-774600316"></a>
### CL_ServerInfoPacket

```ml
function CL_ServerInfoPacket(state, services, address, infoText)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `infoText` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L239)

<a id="function-function-mq3-client-client-main-cl-serversresponsepacket-function-cl-serversresponsepacket-state-services-addresses-src-mq3-client-client-main-ml-1376172859"></a>
### CL_ServersResponsePacket

```ml
function CL_ServersResponsePacket(state, services, addresses)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `addresses` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L240)

<a id="function-function-mq3-client-client-main-cl-serverstatus-function-cl-serverstatus-state-services-address-resendtime-src-mq3-client-client-main-ml-1268749439"></a>
### CL_ServerStatus

```ml
function CL_ServerStatus(state, services, address, resendTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `resendTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L264)

<a id="function-function-mq3-client-client-main-cl-serverstatus-f-function-cl-serverstatus-f-state-services-address-src-mq3-client-client-main-ml-1093899095"></a>
### CL_ServerStatus_f

```ml
function CL_ServerStatus_f(state, services, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L271)

<a id="function-function-mq3-client-client-main-cl-serverstatusresponse-function-cl-serverstatusresponse-state-services-address-text-src-mq3-client-client-main-ml-635812182"></a>
### CL_ServerStatusResponse

```ml
function CL_ServerStatusResponse(state, services, address, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L268)

<a id="function-function-mq3-client-client-main-cl-setenv-f-function-cl-setenv-f-state-services-name-value-src-mq3-client-client-main-ml-2076052419"></a>
### CL_Setenv_f

```ml
function CL_Setenv_f(state, services, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L165)

<a id="function-function-mq3-client-client-main-cl-setmodel-f-function-cl-setmodel-f-state-services-model-headmodel-src-mq3-client-client-main-ml-25479209"></a>
### CL_SetModel_f

```ml
function CL_SetModel_f(state, services, model, headmodel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `headmodel` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L176)

<a id="function-function-mq3-client-client-main-cl-setserverinfo-function-cl-setserverinfo-server-infotext-ping-src-mq3-client-client-main-ml-1162160958"></a>
### CL_SetServerInfo

```ml
function CL_SetServerInfo(server, infoText, ping)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — |  |
| `infoText` | `dynamic` | — |  |
| `ping` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L230)

<a id="function-function-mq3-client-client-main-cl-setserverinfobyaddress-function-cl-setserverinfobyaddress-state-address-infotext-ping-src-mq3-client-client-main-ml-1943431874"></a>
### CL_SetServerInfoByAddress

```ml
function CL_SetServerInfoByAddress(state, address, infoText, ping)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `infoText` | `dynamic` | — |  |
| `ping` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L235)

<a id="function-function-mq3-client-client-main-cl-showip-f-function-cl-showip-f-state-services-addresses-src-mq3-client-client-main-ml-341924869"></a>
### CL_ShowIP_f

```ml
function CL_ShowIP_f(state, services, addresses)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `addresses` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L279)

<a id="function-function-mq3-client-client-main-cl-shutdown-function-cl-shutdown-state-services-src-mq3-client-client-main-ml-1265833117"></a>
### CL_Shutdown

```ml
function CL_Shutdown(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L195)

<a id="function-function-mq3-client-client-main-cl-shutdownall-function-cl-shutdownall-state-services-src-mq3-client-client-main-ml-276441385"></a>
### CL_ShutdownAll

```ml
function CL_ShutdownAll(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L190)

<a id="function-function-mq3-client-client-main-cl-shutdownref-function-cl-shutdownref-state-services-src-mq3-client-client-main-ml-1397677145"></a>
### CL_ShutdownRef

```ml
function CL_ShutdownRef(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L181)

<a id="function-function-mq3-client-client-main-cl-snd-restart-f-function-cl-snd-restart-f-state-services-src-mq3-client-client-main-ml-1689623773"></a>
### CL_Snd_Restart_f

```ml
function CL_Snd_Restart_f(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L189)

<a id="function-function-mq3-client-client-main-cl-startdemoloop-function-cl-startdemoloop-state-services-src-mq3-client-client-main-ml-1079415429"></a>
### CL_StartDemoLoop

```ml
function CL_StartDemoLoop(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L117)

<a id="function-function-mq3-client-client-main-cl-starthunkusers-function-cl-starthunkusers-state-services-src-mq3-client-client-main-ml-763531313"></a>
### CL_StartHunkUsers

```ml
function CL_StartHunkUsers(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L183)

<a id="function-function-mq3-client-client-main-cl-stoprecord-f-function-cl-stoprecord-f-state-services-src-mq3-client-client-main-ml-834923341"></a>
### CL_StopRecord_f

```ml
function CL_StopRecord_f(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L93)

<a id="function-function-mq3-client-client-main-cl-updateserverinfo-function-cl-updateserverinfo-state-n-src-mq3-client-client-main-ml-206665053"></a>
### CL_UpdateServerInfo

```ml
function CL_UpdateServerInfo(state, n)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `n` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L238)

<a id="function-function-mq3-client-client-main-cl-updatevisiblepings-f-function-cl-updatevisiblepings-f-state-services-maxping-src-mq3-client-client-main-ml-19210755"></a>
### CL_UpdateVisiblePings_f

```ml
function CL_UpdateVisiblePings_f(state, services, maxPing)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `maxPing` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L259)

<a id="function-function-mq3-client-client-main-cl-vid-restart-f-function-cl-vid-restart-f-state-services-src-mq3-client-client-main-ml-821848405"></a>
### CL_Vid_Restart_f

```ml
function CL_Vid_Restart_f(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L186)

<a id="function-function-mq3-client-client-main-cl-walkdemoext-function-cl-walkdemoext-state-services-base-protocols-src-mq3-client-client-main-ml-1994755209"></a>
### CL_WalkDemoExt

```ml
function CL_WalkDemoExt(state, services, base, protocols)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `protocols` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L108)

<a id="function-function-mq3-client-client-main-cl-writedemomessage-function-cl-writedemomessage-state-messagedata-headerbytes-src-mq3-client-client-main-ml-1264843388"></a>
### CL_WriteDemoMessage

```ml
function CL_WriteDemoMessage(state, messageData, headerBytes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `messageData` | `dynamic` | — |  |
| `headerBytes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L90)

<a id="function-function-mq3-client-client-main-clamptext-function-clamptext-text-limit-src-mq3-client-client-main-ml-754446648"></a>
### clampText

```ml
function clampText(text, limit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L61)

<a id="function-function-mq3-client-client-main-create-function-create-src-mq3-client-client-main-ml-802972014"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L47)

- [mq3.client.client_main.DemoState](Type-mq3-client-client-main-demostate-1110775460.md) — struct
- [mq3.client.client_main.Downloads](Type-mq3-client-client-main-downloads-460635637.md) — struct
<a id="function-function-mq3-client-client-main-emit-function-emit-state-services-kind-text-address-src-mq3-client-client-main-ml-49344350"></a>
### emit

```ml
function emit(state, services, kind, text, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L55)

<a id="function-function-mq3-client-client-main-findserver-function-findserver-state-address-src-mq3-client-client-main-ml-1755808675"></a>
### findServer

```ml
function findServer(state, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L234)

<a id="function-function-mq3-client-client-main-findstatus-function-findstatus-state-address-src-mq3-client-client-main-ml-924128743"></a>
### findStatus

```ml
function findStatus(state, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L263)

<a id="function-function-mq3-client-client-main-hexdigit-function-hexdigit-value-src-mq3-client-client-main-ml-1552914225"></a>
### hexDigit

```ml
function hexDigit(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L72)

<a id="function-function-mq3-client-client-main-host-function-host-src-mq3-client-client-main-ml-1056585570"></a>
### host

```ml
function host()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L43)

- [mq3.client.client_main.Host](Type-mq3-client-client-main-host-676246126.md) — struct
<a id="function-function-mq3-client-client-main-infovalue-function-infovalue-text-key-src-mq3-client-client-main-ml-1478237770"></a>
### infoValue

```ml
function infoValue(text, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L66)

- [mq3.client.client_main.Lifecycle](Type-mq3-client-client-main-lifecycle-1626418376.md) — struct
<a id="function-function-mq3-client-client-main-lower-function-lower-text-src-mq3-client-client-main-ml-1890382953"></a>
### lower

```ml
function lower(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L64)

<a id="constant-constant-mq3-client-client-main-max-pingrequests-const-max-pingrequests-32-src-mq3-client-client-main-ml-522824764"></a>
### MAX_PINGREQUESTS

```ml
const MAX_PINGREQUESTS = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L23)

<a id="constant-constant-mq3-client-client-main-max-reliable-commands-const-max-reliable-commands-64-src-mq3-client-client-main-ml-1480536715"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L22)

<a id="constant-constant-mq3-client-client-main-max-serverstatusrequests-const-max-serverstatusrequests-16-src-mq3-client-client-main-ml-1929387052"></a>
### MAX_SERVERSTATUSREQUESTS

```ml
const MAX_SERVERSTATUSREQUESTS = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L24)

<a id="constant-constant-mq3-client-client-main-max-string-chars-const-max-string-chars-1024-src-mq3-client-client-main-ml-1270407420"></a>
### MAX_STRING_CHARS

```ml
const MAX_STRING_CHARS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L25)

<a id="function-function-mq3-client-client-main-now-function-now-state-services-src-mq3-client-client-main-ml-1813582377"></a>
### now

```ml
function now(state, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L60)

<a id="function-function-mq3-client-client-main-packets-function-packets-state-src-mq3-client-client-main-ml-1684672447"></a>
### packets

```ml
function packets(state)
```

Static storage marker from the C file. Kept explicit for source/ledger parity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L310)

- [mq3.client.client_main.Ping](Type-mq3-client-client-main-ping-234912884.md) — struct
<a id="constant-constant-mq3-client-client-main-port-server-const-port-server-27960-src-mq3-client-client-main-ml-299171429"></a>
### PORT_SERVER

```ml
const PORT_SERVER = 27960
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L26)

- [mq3.client.client_main.Reliable](Type-mq3-client-client-main-reliable-1941908786.md) — struct
<a id="constant-constant-mq3-client-client-main-retransmit-timeout-const-retransmit-timeout-clientabi-retransmit-timeout-src-mq3-client-client-main-ml-1950487519"></a>
### RETRANSMIT_TIMEOUT

```ml
const RETRANSMIT_TIMEOUT = clientAbi.RETRANSMIT_TIMEOUT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L27)

- [mq3.client.client_main.ServerInfo](Type-mq3-client-client-main-serverinfo-496674891.md) — struct
- [mq3.client.client_main.ServerStatus](Type-mq3-client-client-main-serverstatus-1222122377.md) — struct
- [mq3.client.client_main.State](Type-mq3-client-client-main-state-468161889.md) — struct
<a id="function-function-mq3-client-client-main-toint-function-toint-text-src-mq3-client-client-main-ml-1861746679"></a>
### toInt

```ml
function toInt(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L71)
