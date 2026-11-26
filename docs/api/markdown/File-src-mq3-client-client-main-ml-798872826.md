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

Compares endpoint strings after ASCII case folding.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Value used by `return lower(a)==lower(b)`. |
| `b` | `dynamic` | — | Value used by `return lower(a)==lower(b)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L345)

<a id="function-function-mq3-client-client-main-attachconnection-function-attachconnection-state-runtime-services-src-mq3-client-client-main-ml-1087240067"></a>
### attachConnection

```ml
function attachConnection(state, runtime, services)
```

Installs the connectionless handshake state and host services used for retries and incoming handshakes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.connectionRuntime`, `state.connectionHost`. |
| `runtime` | `dynamic` | — | Value assigned to `state.connectionRuntime`. |
| `services` | `dynamic` | — | Value assigned to `state.connectionHost`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L370)

<a id="function-function-mq3-client-client-main-attachframe-function-attachframe-state-runtime-services-src-mq3-client-client-main-ml-1272879295"></a>
### attachFrame

```ml
function attachFrame(state, runtime, services)
```

Connects the outer client lifecycle to the client-frame runtime and its host callbacks.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.frameRuntime`, `state.frameHost`. |
| `runtime` | `dynamic` | — | Value assigned to `state.frameRuntime`. |
| `services` | `dynamic` | — | Value assigned to `state.frameHost`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L365)

<a id="function-function-mq3-client-client-main-attachnetworkingress-function-attachnetworkingress-state-runtime-src-mq3-client-client-main-ml-2041311779"></a>
### attachNetworkIngress

```ml
function attachNetworkIngress(state, runtime)
```

Installs the UDP packet-ingress runtime used by the live client packet entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.packetRuntime`. |
| `runtime` | `dynamic` | — | Value assigned to `state.packetRuntime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L374)

<a id="constant-constant-mq3-client-client-main-ca-active-const-ca-active-8-src-mq3-client-client-main-ml-1735863069"></a>
### CA_ACTIVE

```ml
const CA_ACTIVE = 8
```

Connection-state value for normal gameplay after game-state loading, defined for coordinating connection, demo, and client lifecycle transitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L32)

<a id="constant-constant-mq3-client-client-main-ca-authorizing-const-ca-authorizing-2-src-mq3-client-client-main-ml-1368074963"></a>
### CA_AUTHORIZING

```ml
const CA_AUTHORIZING = 2
```

Client connection state while waiting for authorization to contact the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L18)

<a id="constant-constant-mq3-client-client-main-ca-challenging-const-ca-challenging-4-src-mq3-client-client-main-ml-360103993"></a>
### CA_CHALLENGING

```ml
const CA_CHALLENGING = 4
```

Client connection state while replying to the server challenge and requesting connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L22)

<a id="constant-constant-mq3-client-client-main-ca-connected-const-ca-connected-5-src-mq3-client-client-main-ml-2012470916"></a>
### CA_CONNECTED

```ml
const CA_CONNECTED = 5
```

Connection-state value for a completed handshake before game-state loading, defined for coordinating connection, demo, and client lifecycle transitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L25)

<a id="constant-constant-mq3-client-client-main-ca-connecting-const-ca-connecting-3-src-mq3-client-client-main-ml-997997096"></a>
### CA_CONNECTING

```ml
const CA_CONNECTING = 3
```

Client connection state while requesting a challenge from the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L20)

<a id="constant-constant-mq3-client-client-main-ca-disconnected-const-ca-disconnected-1-src-mq3-client-client-main-ml-272570302"></a>
### CA_DISCONNECTED

```ml
const CA_DISCONNECTED = 1
```

Client connection state with no active server connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L16)

<a id="constant-constant-mq3-client-client-main-ca-loading-const-ca-loading-6-src-mq3-client-client-main-ml-729956663"></a>
### CA_LOADING

```ml
const CA_LOADING = 6
```

Client connection state while level media and game state are being loaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L27)

<a id="constant-constant-mq3-client-client-main-ca-primed-const-ca-primed-7-src-mq3-client-client-main-ml-1899176428"></a>
### CA_PRIMED

```ml
const CA_PRIMED = 7
```

Client connection state with game state loaded, awaiting a playable snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L29)

<a id="constant-constant-mq3-client-client-main-ca-uninitialized-const-ca-uninitialized-0-src-mq3-client-client-main-ml-1003697603"></a>
### CA_UNINITIALIZED

```ml
const CA_UNINITIALIZED = 0
```

Client connection state before the client subsystem has been initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L14)

<a id="constant-constant-mq3-client-client-main-cdchksum-len-const-cdchksum-len-2-src-mq3-client-client-main-ml-1814007513"></a>
### CDCHKSUM_LEN

```ml
const CDCHKSUM_LEN = 2
```

Number of characters in the product-key checksum suffix.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L49)

<a id="constant-constant-mq3-client-client-main-cdkey-len-const-cdkey-len-16-src-mq3-client-client-main-ml-1396060174"></a>
### CDKEY_LEN

```ml
const CDKEY_LEN = 16
```

Required number of characters in the native product key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L47)

<a id="function-function-mq3-client-client-main-cl-addreliablecommand-function-cl-addreliablecommand-state-cmd-src-mq3-client-client-main-ml-1323089335"></a>
### CL_AddReliableCommand

```ml
function CL_AddReliableCommand(state, cmd)
```

Advances the reliable-command sequence and stores a bounded command in the 64-entry ring, rejecting an overflowed acknowledgement window.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.reliable.sequence`, `state.reliable.commands[index]`. |
| `cmd` | `dynamic` | — | Command text placed in the reliable ring; it is limited to MAX_STRING_CHARS minus one bytes. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L387)

<a id="function-function-mq3-client-client-main-cl-begindownload-function-cl-begindownload-state-services-localname-remotename-src-mq3-client-client-main-ml-879101100"></a>
### CL_BeginDownload

```ml
function CL_BeginDownload(state, services, localName, remoteName)
```

Sets local and temporary download names, clears completion and emits a remote download command.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.downloads.name`, `state.downloads.tempName`, `state.downloads.completed`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `localName` | `dynamic` | — | Value assigned to `state.downloads.name`, `state.downloads.tempName`. |
| `remoteName` | `dynamic` | — | Value used by `emit(state,services,"download","download "+remoteName,state.serverName)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L682)

<a id="function-function-mq3-client-client-main-cl-cddialog-function-cl-cddialog-state-src-mq3-client-client-main-ml-441315603"></a>
### CL_CDDialog

```ml
function CL_CDDialog(state)
```

Reports whether the outer client is in the disconnected state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.lifecycle.state`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L645)

<a id="function-function-mq3-client-client-main-cl-cdkeyvalidate-function-cl-cdkeyvalidate-key-checksum-src-mq3-client-client-main-ml-1755692930"></a>
### CL_CDKeyValidate

```ml
function CL_CDKeyValidate(key, checksum)
```

Validates the 16-character CD-key alphabet and, when supplied, its two-character lowercase-compatible checksum.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Candidate CD key, exactly 16 characters from the supported case-insensitive alphabet. |
| `checksum` | `dynamic` | — | Optional two-character hexadecimal checksum; void skips checksum verification. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L880)

<a id="function-function-mq3-client-client-main-cl-changereliablecommand-function-cl-changereliablecommand-state-src-mq3-client-client-main-ml-1522791289"></a>
### CL_ChangeReliableCommand

```ml
function CL_ChangeReliableCommand(state)
```

Appends a newline to the most recent reliable command, shortening its text if necessary to retain the size bound.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.reliable.commands[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L393)

<a id="function-function-mq3-client-client-main-cl-checkforresend-function-cl-checkforresend-state-services-src-mq3-client-client-main-ml-2101713257"></a>
### CL_CheckForResend

```ml
function CL_CheckForResend(state, services)
```

Runs the configured connectionless retry state machine or sends a timed getchallenge/connect retry from outer-client state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.connectionRuntime.realtime`, `state.lifecycle.state`, `state.lifecycle.connectTime`, `state.lifecycle.connectPacketCount`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L474)

<a id="function-function-mq3-client-client-main-cl-checktimeout-function-cl-checktimeout-state-services-src-mq3-client-client-main-ml-2094990563"></a>
### CL_CheckTimeout

```ml
function CL_CheckTimeout(state, services)
```

Checks the attached frame runtime or counts consecutive server timeouts, disconnecting after more than five overdue checks.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.frameRuntime.state`, `state.frameRuntime.realtime`, `state.frameRuntime.lastPacketTime`, `state.lifecycle.timeoutCount`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L662)

<a id="function-function-mq3-client-client-main-cl-checkuserinfo-function-cl-checkuserinfo-state-services-modified-src-mq3-client-client-main-ml-60277956"></a>
### CL_CheckUserinfo

```ml
function CL_CheckUserinfo(state, services, modified)
```

Delegates to the attached frame runtime or forwards modified userinfo once the handshake has reached challenging state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.frameRuntime.state`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `modified` | `dynamic` | — | Value used by `if not modified or state.lifecycle.state<CA_CHALLENGING then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L655)

<a id="function-function-mq3-client-client-main-cl-clearping-function-cl-clearping-state-n-src-mq3-client-client-main-ml-2095384965"></a>
### CL_ClearPing

```ml
function CL_ClearPing(state, n)
```

Clears the address of a valid ping slot and returns whether that slot existed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.pings[n].address`. |
| `n` | `dynamic` | — | Value tested by `n>=0 and n<len(state.pings)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L770)

<a id="function-function-mq3-client-client-main-cl-clearstate-function-cl-clearstate-state-src-mq3-client-client-main-ml-697762909"></a>
### CL_ClearState

```ml
function CL_ClearState(state)
```

Clears configstrings, reliable commands, timeout history and the demo server-message sequence.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.configstrings`, `state.reliable`, `state.lifecycle.timeoutCount`, `state.demo.serverMessageSequence`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L513)

<a id="function-function-mq3-client-client-main-cl-clientinfo-f-function-cl-clientinfo-f-state-services-src-mq3-client-client-main-ml-468542101"></a>
### CL_Clientinfo_f

```ml
function CL_Clientinfo_f(state, services)
```

Returns the current server name from client lifecycle state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.serverName`. |
| `services` | `dynamic` | — | Accepted for compatibility with `CL_Clientinfo_f`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L865)

<a id="function-function-mq3-client-client-main-cl-configstrings-f-function-cl-configstrings-f-state-services-src-mq3-client-client-main-ml-1302073597"></a>
### CL_Configstrings_f

```ml
function CL_Configstrings_f(state, services)
```

Counts nonempty client configstrings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.configstrings`. |
| `services` | `dynamic` | — | Accepted for compatibility with `CL_Configstrings_f`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L871)

<a id="function-function-mq3-client-client-main-cl-connect-f-function-cl-connect-f-state-services-address-src-mq3-client-client-main-ml-1722907395"></a>
### CL_Connect_f

```ml
function CL_Connect_f(state, services, address)
```

Disconnects the current session and initializes an immediate challenge retry for the new nonempty server address.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.serverName`, `state.reconnectName`, `state.lifecycle.state`, `state.lifecycle.connectTime` and additional values. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `address` | `dynamic` | — | Server endpoint saved as both the current target and the future reconnect address. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L565)

<a id="function-function-mq3-client-client-main-cl-connectionlesspacket-function-cl-connectionlesspacket-state-services-address-command-payload-src-mq3-client-client-main-ml-1649830890"></a>
### CL_ConnectionlessPacket

```ml
function CL_ConnectionlessPacket(state, services, address, command, payload)
```

Dispatches connectionless handshake, server-browser, status, MOTD, print and disconnect commands and reports the recognized command name.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.lifecycle.state`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `address` | `dynamic` | — | Value used by `if name=="disconnect" then CL_DisconnectPacket(state,services,address)`. |
| `command` | `dynamic` | — | Value used by `name=lower(command)`. |
| `payload` | `dynamic` | — | Value used by `if name=="inforesponse" then CL_ServerInfoPacket(state,services,address,payload)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L489)

<a id="function-function-mq3-client-client-main-cl-democompleted-function-cl-democompleted-state-services-src-mq3-client-client-main-ml-154316429"></a>
### CL_DemoCompleted

```ml
function CL_DemoCompleted(state, services)
```

Ends demo playback, resets the read offset and dispatches the queued next-demo command when present.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.demo.playing`, `state.demo.offset`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L429)

<a id="function-function-mq3-client-client-main-cl-demofilename-function-cl-demofilename-number-src-mq3-client-client-main-ml-2046797421"></a>
### CL_DemoFilename

```ml
function CL_DemoFilename(number)
```

Adapts `mq3.client.demo.demoFilename` to client main `CL_DemoFilename`, returning its result for `number`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — | Argument 1 of `mq3.client.demo.demoFilename`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L415)

<a id="function-function-mq3-client-client-main-cl-disconnect-function-cl-disconnect-state-services-showmainmenu-src-mq3-client-client-main-ml-1210785704"></a>
### CL_Disconnect

```ml
function CL_Disconnect(state, services, showMainMenu)
```

Stops recording, queues a disconnect for a connected server, clears transient state and optionally opens the main menu.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.lifecycle.state`, `state.serverName`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `showMainMenu` | `dynamic` | — | Whether disconnecting also queues the main-menu action. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L520)

<a id="function-function-mq3-client-client-main-cl-disconnect-f-function-cl-disconnect-f-state-services-src-mq3-client-client-main-ml-1934675415"></a>
### CL_Disconnect_f

```ml
function CL_Disconnect_f(state, services)
```

Adapts `mq3.client.client_main.CL_Disconnect` to client main `CL_Disconnect_f`, returning its result for `state, services, true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.client_main.CL_Disconnect`. |
| `services` | `dynamic` | — | Argument 2 of `mq3.client.client_main.CL_Disconnect`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L554)

<a id="function-function-mq3-client-client-main-cl-disconnectpacket-function-cl-disconnectpacket-state-services-address-src-mq3-client-client-main-ml-1919189735"></a>
### CL_DisconnectPacket

```ml
function CL_DisconnectPacket(state, services, address)
```

Accepts a disconnect only from the current server after three seconds without packets, then tears down the connection.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.lifecycle.state`, `state.serverName`, `state.lifecycle.realtime`, `state.lifecycle.lastPacketTime`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `address` | `dynamic` | — | Value used by `if state.lifecycle.state<CA_AUTHORIZING or not addressEqual(address,state.serverName) or state.lifecycle.realtime-state.lifecycle.lastPacketTi...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L467)

<a id="function-function-mq3-client-client-main-cl-downloadscomplete-function-cl-downloadscomplete-state-services-src-mq3-client-client-main-ml-368886621"></a>
### CL_DownloadsComplete

```ml
function CL_DownloadsComplete(state, services)
```

Clears active download names, marks completion and performs a pending filesystem restart.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.downloads.completed`, `state.downloads.name`, `state.downloads.tempName`, `state.downloads.restarted`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L702)

<a id="function-function-mq3-client-client-main-cl-flushmemory-function-cl-flushmemory-state-services-src-mq3-client-client-main-ml-1640736385"></a>
### CL_FlushMemory

```ml
function CL_FlushMemory(state, services)
```

Shuts down hunk users, emits the hunk-clear action and restarts the renderer/sound users.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client main state passed to the helper calls in `CL_FlushMemory`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L630)

<a id="function-function-mq3-client-client-main-cl-forwardcommandtoserver-function-cl-forwardcommandtoserver-state-services-command-src-mq3-client-client-main-ml-166464796"></a>
### CL_ForwardCommandToServer

```ml
function CL_ForwardCommandToServer(state, services, command)
```

Queues and emits a reliable command only while connected, ignoring empty text and key-release commands beginning with a minus sign.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.lifecycle.state`, `state.serverName`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `command` | `dynamic` | — | Command text; empty strings and key-release commands beginning with a minus sign are ignored. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L537)

<a id="function-function-mq3-client-client-main-cl-forwardtoserver-f-function-cl-forwardtoserver-f-state-services-args-src-mq3-client-client-main-ml-613026534"></a>
### CL_ForwardToServer_f

```ml
function CL_ForwardToServer_f(state, services, args)
```

Adapts `mq3.client.client_main.CL_ForwardCommandToServer` to client main `CL_ForwardToServer_f`, returning its result for `state, services, args`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.client_main.CL_ForwardCommandToServer`. |
| `services` | `dynamic` | — | Argument 2 of `mq3.client.client_main.CL_ForwardCommandToServer`. |
| `args` | `dynamic` | — | Argument 3 of `mq3.client.client_main.CL_ForwardCommandToServer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L544)

<a id="function-function-mq3-client-client-main-cl-frame-function-cl-frame-state-services-msec-src-mq3-client-client-main-ml-889513977"></a>
### CL_Frame

```ml
function CL_Frame(state, services, msec)
```

Advances an initialized client frame, synchronizing the attached frame runtime or running timeout, retry and send-command actions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.lifecycle.realtime`, `state.lifecycle.framecount`, `state.lifecycle.state`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `msec` | `dynamic` | — | Time interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L671)

<a id="function-function-mq3-client-client-main-cl-getfreeping-function-cl-getfreeping-state-src-mq3-client-client-main-ml-2035700901"></a>
### CL_GetFreePing

```ml
function CL_GetFreePing(state)
```

Allocates a ping slot up to MAX_PINGREQUESTS, then reuses an empty, expired or oldest slot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.pings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L763)

<a id="function-function-mq3-client-client-main-cl-getping-function-cl-getping-state-n-maxping-src-mq3-client-client-main-ml-345079069"></a>
### CL_GetPing

```ml
function CL_GetPing(state, n, maxPing)
```

Returns a ping slot's address/latency pair, treating overdue unanswered requests as elapsed-time pings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.pings`, `state.lifecycle.realtime`. |
| `n` | `dynamic` | — | Zero-based ping slot; invalid or cleared slots return an empty address and zero time. |
| `maxPing` | `dynamic` | — | Unanswered-request timeout in milliseconds, clamped to at least 100. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L775)

<a id="function-function-mq3-client-client-main-cl-getpinginfo-function-cl-getpinginfo-state-n-src-mq3-client-client-main-ml-1482081153"></a>
### CL_GetPingInfo

```ml
function CL_GetPingInfo(state, n)
```

Returns a valid active ping slot's info string, or an empty string for an invalid/cleared slot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.pings`. |
| `n` | `dynamic` | — | Value tested by `n<0 or n>=len(state.pings) or state.pings[n].address==""` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L781)

<a id="function-function-mq3-client-client-main-cl-getpingqueuecount-function-cl-getpingqueuecount-state-src-mq3-client-client-main-ml-1329900229"></a>
### CL_GetPingQueueCount

```ml
function CL_GetPingQueueCount(state)
```

Counts ping slots whose address has not been cleared.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.pings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L760)

<a id="function-function-mq3-client-client-main-cl-getserverstatus-function-cl-getserverstatus-state-address-src-mq3-client-client-main-ml-876605155"></a>
### CL_GetServerStatus

```ml
function CL_GetServerStatus(state, address)
```

Returns cached status text for the address, or an empty string when no request entry exists.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.statuses`. |
| `address` | `dynamic` | — | Value used by `index=findStatus(state,address)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L812)

<a id="function-function-mq3-client-client-main-cl-globalservers-f-function-cl-globalservers-f-state-services-master-protocol-keywords-src-mq3-client-client-main-ml-1618259675"></a>
### CL_GlobalServers_f

```ml
function CL_GlobalServers_f(state, services, master, protocol, keywords)
```

Clears the browser and emits a protocol/keyword getservers query to the selected master server.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.servers`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `master` | `dynamic` | — | Value used by `emit(state,services,"master","getservers "+str(protocol)+" "+keywords,master)`. |
| `protocol` | `dynamic` | — | Value used by `emit(state,services,"master","getservers "+str(protocol)+" "+keywords,master)`. |
| `keywords` | `dynamic` | — | Value used by `emit(state,services,"master","getservers "+str(protocol)+" "+keywords,master)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L756)

<a id="function-function-mq3-client-client-main-cl-init-function-cl-init-state-services-src-mq3-client-client-main-ml-1991654077"></a>
### CL_Init

```ml
function CL_Init(state, services)
```

Initializes the client once, enters the disconnected state and starts its hunk users.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.lifecycle.initialized`, `state.lifecycle.state`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L634)

<a id="function-function-mq3-client-client-main-cl-initdownloads-function-cl-initdownloads-state-services-downloads-src-mq3-client-client-main-ml-1511575912"></a>
### CL_InitDownloads

```ml
function CL_InitDownloads(state, services, downloads)
```

Replaces and rewinds the download queue, then starts its first item or completes an empty queue.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.downloads.queue`, `state.downloads.index`, `state.downloads.completed`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `downloads` | `dynamic` | — | Mutable client main record/storage; this routine assigns `downloads.queue`, `downloads.index`, `downloads.completed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L696)

<a id="function-function-mq3-client-client-main-cl-initref-function-cl-initref-state-services-src-mq3-client-client-main-ml-53698429"></a>
### CL_InitRef

```ml
function CL_InitRef(state, services)
```

Marks the renderer initialized and emits its initialization action.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.lifecycle.renderer`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L598)

<a id="function-function-mq3-client-client-main-cl-initrenderer-function-cl-initrenderer-state-services-src-mq3-client-client-main-ml-332511151"></a>
### CL_InitRenderer

```ml
function CL_InitRenderer(state, services)
```

Initializes the renderer if necessary and emits the renderer-registration action.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.lifecycle.renderer`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L606)

<a id="function-function-mq3-client-client-main-cl-initserverinfo-function-cl-initserverinfo-address-src-mq3-client-client-main-ml-283403876"></a>
### CL_InitServerInfo

```ml
function CL_InitServerInfo(address)
```

Creates a visible server-browser record with unknown ping and empty descriptive fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Value used to initialize `ServerInfo.address`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L708)

<a id="function-function-mq3-client-client-main-cl-localservers-f-function-cl-localservers-f-state-services-src-mq3-client-client-main-ml-1730676257"></a>
### CL_LocalServers_f

```ml
function CL_LocalServers_f(state, services)
```

Clears the browser and sends two getinfo broadcasts to each of four consecutive default server ports.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.servers`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L749)

<a id="function-function-mq3-client-client-main-cl-maploading-function-cl-maploading-state-services-mapname-src-mq3-client-client-main-ml-2029028936"></a>
### CL_MapLoading

```ml
function CL_MapLoading(state, services, mapName)
```

Reuses the matching connected map or disconnects and prepares a localhost challenge for the requested map.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.lifecycle.state`, `state.lifecycle.lastPacketTime`, `state.serverName`, `state.userinfo`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `mapName` | `dynamic` | — | Map name used to select the level and its associated assets. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L529)

<a id="function-function-mq3-client-client-main-cl-motdpacket-function-cl-motdpacket-state-services-address-text-src-mq3-client-client-main-ml-1569690210"></a>
### CL_MotdPacket

```ml
function CL_MotdPacket(state, services, address, text)
```

Records the received message-of-the-day text as an action and returns that text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client main state passed to the helper calls in `CL_MotdPacket`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `address` | `dynamic` | — | Value used by `emit(state,services,"motd",text,address)`. |
| `text` | `dynamic` | — | Text consumed or emitted by `CL_MotdPacket` in the client main path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L831)

<a id="function-function-mq3-client-client-main-cl-nextdemo-function-cl-nextdemo-state-services-src-mq3-client-client-main-ml-1195344701"></a>
### CL_NextDemo

```ml
function CL_NextDemo(state, services)
```

Consumes the pending next-demo command and queues it with a newline when nonempty.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.demo.nextDemo`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L461)

<a id="function-function-mq3-client-client-main-cl-nextdownload-function-cl-nextdownload-state-services-src-mq3-client-client-main-ml-1205251375"></a>
### CL_NextDownload

```ml
function CL_NextDownload(state, services)
```

Starts the next queued download or finalizes the download session when the queue is exhausted.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.downloads.index`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L688)

<a id="function-function-mq3-client-client-main-cl-openedpk3list-f-function-cl-openedpk3list-f-state-services-src-mq3-client-client-main-ml-619827061"></a>
### CL_OpenedPK3List_f

```ml
function CL_OpenedPK3List_f(state, services)
```

Emits the opened-package list with a trailing newline and returns the list text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.openedPaks`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L844)

<a id="function-function-mq3-client-client-main-cl-packetevent-function-cl-packetevent-state-services-address-command-payload-src-mq3-client-client-main-ml-1435922928"></a>
### CL_PacketEvent

```ml
function CL_PacketEvent(state, services, address, command, payload)
```

Refreshes the last-packet timestamp and routes a packet either to connectionless dispatch or the sequenced-message action.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.lifecycle.lastPacketTime`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `address` | `dynamic` | — | Value used by `if command!="" then return CL_ConnectionlessPacket(state,services,address,command,payload) end if`. |
| `command` | `dynamic` | — | Value used by `if command!="" then return CL_ConnectionlessPacket(state,services,address,command,payload) end if`. |
| `payload` | `dynamic` | — | Value used by `if command!="" then return CL_ConnectionlessPacket(state,services,address,command,payload) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L507)

<a id="function-function-mq3-client-client-main-cl-packeteventlive-function-cl-packeteventlive-state-address-data-src-mq3-client-client-main-ml-123910275"></a>
### CL_PacketEventLive

```ml
function CL_PacketEventLive(state, address, data)
```

Synchronizes the incoming-packet clock and passes the datagram to live client ingress; rejects a missing ingress runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.packetRuntime`, `state.lifecycle.realtime`. |
| `address` | `dynamic` | — | Value used by `return networkIngress.clientPacket(state.packetRuntime,address,data)`. |
| `data` | `dynamic` | — | Value used by `return networkIngress.clientPacket(state.packetRuntime,address,data)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L379)

<a id="function-function-mq3-client-client-main-cl-ping-f-function-cl-ping-f-state-services-address-src-mq3-client-client-main-ml-1085036817"></a>
### CL_Ping_f

```ml
function CL_Ping_f(state, services, address)
```

Initializes a ping slot at the current time and emits a getinfo request to its address.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.pings[index]`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `address` | `dynamic` | — | Value used by `state.pings[index]=Ping(address,state.lifecycle.realtime,0,"")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L786)

<a id="function-function-mq3-client-client-main-cl-playdemo-f-function-cl-playdemo-f-state-services-name-data-src-mq3-client-client-main-ml-1062568784"></a>
### CL_PlayDemo_f

```ml
function CL_PlayDemo_f(state, services, name, data)
```

Marks a demo as playing, resets its offset and places the client in the connected state before emitting the playback action.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.demo.playing`, `state.demo.name`, `state.demo.offset`, `state.lifecycle.state`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `name` | `dynamic` | — | Value assigned to `state.demo.name`. |
| `data` | `dynamic` | — | Value used by `return data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L445)

<a id="function-function-mq3-client-client-main-cl-rcon-f-function-cl-rcon-f-state-services-password-command-address-src-mq3-client-client-main-ml-1796385621"></a>
### CL_Rcon_f

```ml
function CL_Rcon_f(state, services, password, command, address)
```

Emits an out-of-band rcon request to the explicit or current server, requiring both a target and a password.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.serverName`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `password` | `dynamic` | — | Server rcon password included in the outgoing command; an empty password cancels the request. |
| `command` | `dynamic` | — | Value used by `emit(state,services,"oob","rcon "+password+" "+command,target)`. |
| `address` | `dynamic` | — | Explicit rcon target; an empty string selects the current server. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L574)

<a id="function-function-mq3-client-client-main-cl-readdemomessage-function-cl-readdemomessage-state-data-src-mq3-client-client-main-ml-2074435481"></a>
### CL_ReadDemoMessage

```ml
function CL_ReadDemoMessage(state, data)
```

Reads the next demo record and carries its offset, server sequence and completion status back into outer-client state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.demo.offset`, `state.demo.serverMessageSequence`, `state.demo.playing`. |
| `data` | `dynamic` | — | Value used by `result=demo.readDemoMessage(playback,data,state.lifecycle.realtime)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L451)

<a id="function-function-mq3-client-client-main-cl-reconnect-f-function-cl-reconnect-f-state-services-src-mq3-client-client-main-ml-459938705"></a>
### CL_Reconnect_f

```ml
function CL_Reconnect_f(state, services)
```

Starts a new connection to the stored reconnect address, or returns false if no address was saved.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.reconnectName`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L558)

<a id="function-function-mq3-client-client-main-cl-record-f-function-cl-record-f-state-services-name-file-src-mq3-client-client-main-ml-1208083194"></a>
### CL_Record_f

```ml
function CL_Record_f(state, services, name, file)
```

Starts recording to the supplied file only while the client is active and no recording is already running.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.demo.name`, `state.demo.file`, `state.demo.recording`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `name` | `dynamic` | — | Value assigned to `state.demo.name`. |
| `file` | `dynamic` | — | Already opened recording file handle passed to host write/close callbacks. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L421)

<a id="function-function-mq3-client-client-main-cl-referencedpk3list-f-function-cl-referencedpk3list-f-state-services-src-mq3-client-client-main-ml-1242891901"></a>
### CL_ReferencedPK3List_f

```ml
function CL_ReferencedPK3List_f(state, services)
```

Emits the referenced-package list with a trailing newline and returns the list text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.referencedPaks`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L848)

<a id="function-function-mq3-client-client-main-cl-refmalloc-function-cl-refmalloc-state-services-size-src-mq3-client-client-main-ml-1423382010"></a>
### CL_RefMalloc

```ml
function CL_RefMalloc(state, services, size)
```

Allocates renderer storage through the host allocator when supplied, otherwise creates a zero-filled byte buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Accepted for compatibility with `CL_RefMalloc`; the current implementation does not read it. |
| `services` | `dynamic` | — | Record read through `services.allocFn`, `services.context`. |
| `size` | `dynamic` | — | Value used by `if services!=void and services.allocFn!=void then return services.allocFn(services.context,size) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L594)

<a id="function-function-mq3-client-client-main-cl-refprintf-function-cl-refprintf-state-services-level-text-src-mq3-client-client-main-ml-1986695080"></a>
### CL_RefPrintf

```ml
function CL_RefPrintf(state, services, level, text)
```

Adapts `mq3.client.client_main.emit` to client main `CL_RefPrintf`, returning its result for `state, services, "refprint", str(level)+":"+text, ""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.client_main.emit`. |
| `services` | `dynamic` | — | Argument 2 of `mq3.client.client_main.emit`. |
| `level` | `dynamic` | — | Argument 4 of `mq3.client.client_main.emit`; passed as `str(level)+":"+text`. |
| `text` | `dynamic` | — | Argument 4 of `mq3.client.client_main.emit`; passed as `str(level)+":"+text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L589)

<a id="function-function-mq3-client-client-main-cl-requestmotd-function-cl-requestmotd-state-services-address-challenge-src-mq3-client-client-main-ml-2073565602"></a>
### CL_RequestMotd

```ml
function CL_RequestMotd(state, services, address, challenge)
```

Sends an out-of-band getmotd request carrying the supplied challenge.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client main state passed to the helper calls in `CL_RequestMotd`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `address` | `dynamic` | — | Value used by `emit(state,services,"oob","getmotd "+challenge,address)`. |
| `challenge` | `dynamic` | — | Value used by `emit(state,services,"oob","getmotd "+challenge,address)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L854)

<a id="function-function-mq3-client-client-main-cl-resetpureclientatserver-function-cl-resetpureclientatserver-state-services-src-mq3-client-client-main-ml-1583878717"></a>
### CL_ResetPureClientAtServer

```ml
function CL_ResetPureClientAtServer(state, services)
```

Forwards the reliable vdr command to reset server-side pure-client verification.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.client_main.CL_ForwardCommandToServer`. |
| `services` | `dynamic` | — | Argument 2 of `mq3.client.client_main.CL_ForwardCommandToServer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L840)

<a id="function-function-mq3-client-client-main-cl-scaledmilliseconds-function-cl-scaledmilliseconds-state-services-timescale-src-mq3-client-client-main-ml-1990245820"></a>
### CL_ScaledMilliseconds

```ml
function CL_ScaledMilliseconds(state, services, timeScale)
```

Multiplies the selected millisecond clock by the requested time scale.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client main state passed to the helper calls in `CL_ScaledMilliseconds`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `timeScale` | `dynamic` | — | Multiplier applied to the selected millisecond clock. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L650)

<a id="function-function-mq3-client-client-main-cl-sendpurechecksums-function-cl-sendpurechecksums-state-services-src-mq3-client-client-main-ml-76455745"></a>
### CL_SendPureChecksums

```ml
function CL_SendPureChecksums(state, services)
```

Forwards the current package checksums in a reliable cp command.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.pureChecksums`. |
| `services` | `dynamic` | — | Argument 2 of `mq3.client.client_main.CL_ForwardCommandToServer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L836)

<a id="function-function-mq3-client-client-main-cl-serverinfopacket-function-cl-serverinfopacket-state-services-address-infotext-src-mq3-client-client-main-ml-774600316"></a>
### CL_ServerInfoPacket

```ml
function CL_ServerInfoPacket(state, services, address, infoText)
```

Updates the browser entry for an info response and emits the server-info action.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client main state passed to the helper calls in `CL_ServerInfoPacket`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `address` | `dynamic` | — | Value used by `CL_SetServerInfoByAddress(state,address,infoText,0)`. |
| `infoText` | `dynamic` | — | Value used by `CL_SetServerInfoByAddress(state,address,infoText,0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L738)

<a id="function-function-mq3-client-client-main-cl-serversresponsepacket-function-cl-serversresponsepacket-state-services-addresses-src-mq3-client-client-main-ml-1376172859"></a>
### CL_ServersResponsePacket

```ml
function CL_ServersResponsePacket(state, services, addresses)
```

Adds previously unseen master-server addresses and reports how many entries were inserted.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.servers`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `addresses` | `dynamic` | — | Value used by `for each address in addresses if findServer(state,address)<0 then state.servers=state.servers+[CL_InitServerInfo(address)]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L743)

<a id="function-function-mq3-client-client-main-cl-serverstatus-function-cl-serverstatus-state-services-address-resendtime-src-mq3-client-client-main-ml-1268749439"></a>
### CL_ServerStatus

```ml
function CL_ServerStatus(state, services, address, resendTime)
```

Returns cached status text when available, otherwise starts or retransmits a timed getstatus request.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.statuses`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `address` | `dynamic` | — | Value used by `index=findStatus(state,address)`. |
| `resendTime` | `dynamic` | — | Minimum interval in milliseconds before retransmitting an unanswered status request. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L806)

<a id="function-function-mq3-client-client-main-cl-serverstatus-f-function-cl-serverstatus-f-state-services-address-src-mq3-client-client-main-ml-1093899095"></a>
### CL_ServerStatus_f

```ml
function CL_ServerStatus_f(state, services, address)
```

Queries server status with a 750-millisecond retransmission interval.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.client_main.CL_ServerStatus`. |
| `services` | `dynamic` | — | Argument 2 of `mq3.client.client_main.CL_ServerStatus`. |
| `address` | `dynamic` | — | Argument 3 of `mq3.client.client_main.CL_ServerStatus`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L825)

<a id="function-function-mq3-client-client-main-cl-serverstatusresponse-function-cl-serverstatusresponse-state-services-address-text-src-mq3-client-client-main-ml-635812182"></a>
### CL_ServerStatusResponse

```ml
function CL_ServerStatusResponse(state, services, address, text)
```

Creates or updates a status response, clears its pending flag and emits a server-status action.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.statuses`, `state.statuses[index].text`, `state.statuses[index].pending`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `address` | `dynamic` | — | Value used by `index=findStatus(state,address)`. |
| `text` | `dynamic` | — | Text consumed or emitted by `CL_ServerStatusResponse` in the client main path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L818)

<a id="function-function-mq3-client-client-main-cl-setenv-f-function-cl-setenv-f-state-services-name-value-src-mq3-client-client-main-ml-2076052419"></a>
### CL_Setenv_f

```ml
function CL_Setenv_f(state, services, name, value)
```

Emits a host environment-variable assignment as name=value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client main state passed to the helper calls in `CL_Setenv_f`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `name` | `dynamic` | — | Name used to select or register the corresponding client main resource. |
| `value` | `dynamic` | — | Value used by `emit(state,services,"setenv",name+"="+value,"")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L550)

<a id="function-function-mq3-client-client-main-cl-setmodel-f-function-cl-setmodel-f-state-services-model-headmodel-src-mq3-client-client-main-ml-25479209"></a>
### CL_SetModel_f

```ml
function CL_SetModel_f(state, services, model, headmodel)
```

Replaces the userinfo model/headmodel entries and emits the resulting userinfo string.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.userinfo`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this client main operation. |
| `headmodel` | `dynamic` | — | Value used by `state.userinfo="\\\\model\\\\"+model+"\\\\headmodel\\\\"+headmodel`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L582)

<a id="function-function-mq3-client-client-main-cl-setserverinfo-function-cl-setserverinfo-server-infotext-ping-src-mq3-client-client-main-ml-1162160958"></a>
### CL_SetServerInfo

```ml
function CL_SetServerInfo(server, infoText, ping)
```

Parses nonempty server info into browser fields and always updates the supplied ping value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — | Mutable client main record/storage; this routine assigns `server.clients`, `server.hostName`, `server.mapName`, `server.maxClients` and additional values. |
| `infoText` | `dynamic` | — | Value used by `if infoText!="" then server.clients=toInt(infoValue(infoText,"clients"))`. |
| `ping` | `dynamic` | — | Value assigned to `server.ping`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L713)

<a id="function-function-mq3-client-client-main-cl-setserverinfobyaddress-function-cl-setserverinfobyaddress-state-address-infotext-ping-src-mq3-client-client-main-ml-1943431874"></a>
### CL_SetServerInfoByAddress

```ml
function CL_SetServerInfoByAddress(state, address, infoText, ping)
```

Creates a missing server-browser entry and updates its info string and ping.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.servers`. |
| `address` | `dynamic` | — | Value used by `index=findServer(state,address)`. |
| `infoText` | `dynamic` | — | Value used by `return CL_SetServerInfo(state.servers[index],infoText,ping)`. |
| `ping` | `dynamic` | — | Value used by `return CL_SetServerInfo(state.servers[index],infoText,ping)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L726)

<a id="function-function-mq3-client-client-main-cl-showip-f-function-cl-showip-f-state-services-addresses-src-mq3-client-client-main-ml-341924869"></a>
### CL_ShowIP_f

```ml
function CL_ShowIP_f(state, services, addresses)
```

Returns the number of supplied local addresses; this adapter does not itself print them.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Accepted for compatibility with `CL_ShowIP_f`; the current implementation does not read it. |
| `services` | `dynamic` | — | Accepted for compatibility with `CL_ShowIP_f`; the current implementation does not read it. |
| `addresses` | `dynamic` | — | Argument 1 of `len`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L859)

<a id="function-function-mq3-client-client-main-cl-shutdown-function-cl-shutdown-state-services-src-mq3-client-client-main-ml-1265833117"></a>
### CL_Shutdown

```ml
function CL_Shutdown(state, services)
```

Disconnects and releases an initialized client, then returns it to the uninitialized state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.lifecycle.initialized`, `state.lifecycle.state`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L640)

<a id="function-function-mq3-client-client-main-cl-shutdownall-function-cl-shutdownall-state-services-src-mq3-client-client-main-ml-276441385"></a>
### CL_ShutdownAll

```ml
function CL_ShutdownAll(state, services)
```

Clears cgame/UI ownership and shuts down renderer, sound and hunk lifecycle state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.lifecycle.cgameStarted`, `state.lifecycle.uiStarted`, `state.lifecycle.sound`, `state.lifecycle.hunk`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L626)

<a id="function-function-mq3-client-client-main-cl-shutdownref-function-cl-shutdownref-state-services-src-mq3-client-client-main-ml-1397677145"></a>
### CL_ShutdownRef

```ml
function CL_ShutdownRef(state, services)
```

Emits renderer shutdown when it was active and clears its initialized flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.lifecycle.renderer`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L602)

<a id="function-function-mq3-client-client-main-cl-snd-restart-f-function-cl-snd-restart-f-state-services-src-mq3-client-client-main-ml-1689623773"></a>
### CL_Snd_Restart_f

```ml
function CL_Snd_Restart_f(state, services)
```

Emits sound shutdown followed by sound initialization and restores the sound-active flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.lifecycle.sound`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L622)

<a id="function-function-mq3-client-client-main-cl-startdemoloop-function-cl-startdemoloop-state-services-src-mq3-client-client-main-ml-1079415429"></a>
### CL_StartDemoLoop

```ml
function CL_StartDemoLoop(state, services)
```

Queues the d1 command and immediately enters the next-demo path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.demo.nextDemo`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L457)

<a id="function-function-mq3-client-client-main-cl-starthunkusers-function-cl-starthunkusers-state-services-src-mq3-client-client-main-ml-763531313"></a>
### CL_StartHunkUsers

```ml
function CL_StartHunkUsers(state, services)
```

Starts renderer and sound users once when the client hunk is not yet active.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.lifecycle.hunk`, `state.lifecycle.sound`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L610)

<a id="function-function-mq3-client-client-main-cl-stoprecord-f-function-cl-stoprecord-f-state-services-src-mq3-client-client-main-ml-834923341"></a>
### CL_StopRecord_f

```ml
function CL_StopRecord_f(state, services)
```

Writes the demo end marker and closes the host file when available, then clears recording state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.demo.file`, `state.demo.recording`. |
| `services` | `dynamic` | — | Record read through `services.writeFn`, `services.context`, `services.closeFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L407)

<a id="function-function-mq3-client-client-main-cl-updateserverinfo-function-cl-updateserverinfo-state-n-src-mq3-client-client-main-ml-206665053"></a>
### CL_UpdateServerInfo

```ml
function CL_UpdateServerInfo(state, n)
```

Copies a valid ping slot's address, info and latency into the server browser.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.pings`. |
| `n` | `dynamic` | — | Value tested by `n<0 or n>=len(state.pings)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L732)

<a id="function-function-mq3-client-client-main-cl-updatevisiblepings-f-function-cl-updatevisiblepings-f-state-services-maxping-src-mq3-client-client-main-ml-19210755"></a>
### CL_UpdateVisiblePings_f

```ml
function CL_UpdateVisiblePings_f(state, services, maxPing)
```

Starts requests for visible servers with unknown ping until the ping queue is full.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.servers`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |
| `maxPing` | `dynamic` | — | Accepted for compatibility with `CL_UpdateVisiblePings_f`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L793)

<a id="function-function-mq3-client-client-main-cl-vid-restart-f-function-cl-vid-restart-f-state-services-src-mq3-client-client-main-ml-821848405"></a>
### CL_Vid_Restart_f

```ml
function CL_Vid_Restart_f(state, services)
```

Clears UI/cgame startup flags, shuts down the renderer, clears the hunk and restarts hunk users.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.lifecycle.uiStarted`, `state.lifecycle.cgameStarted`, `state.lifecycle.hunk`. |
| `services` | `dynamic` | — | services record passed to the client main helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L616)

<a id="function-function-mq3-client-client-main-cl-walkdemoext-function-cl-walkdemoext-state-services-base-protocols-src-mq3-client-client-main-ml-1994755209"></a>
### CL_WalkDemoExt

```ml
function CL_WalkDemoExt(state, services, base, protocols)
```

Tries protocol-specific .dm_ file names in order and returns the first file accepted by the host existence callback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Accepted for compatibility with `CL_WalkDemoExt`; the current implementation does not read it. |
| `services` | `dynamic` | — | Record read through `services.existsFn`, `services.context`. |
| `base` | `dynamic` | — | Demo filename without the protocol-specific .dm_ extension. |
| `protocols` | `dynamic` | — | Protocol numbers tried in order when constructing .dm_ file extensions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L437)

<a id="function-function-mq3-client-client-main-cl-writedemomessage-function-cl-writedemomessage-state-messagedata-headerbytes-src-mq3-client-client-main-ml-1264843388"></a>
### CL_WriteDemoMessage

```ml
function CL_WriteDemoMessage(state, messageData, headerBytes)
```

Encodes a demo record using the current server-message sequence and excludes the specified transport-header bytes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.demo.serverMessageSequence`. |
| `messageData` | `dynamic` | — | Argument 2 of `mq3.client.demo.encodeMessage`. |
| `headerBytes` | `dynamic` | — | Number of transport/header bytes preceding the recorded message payload. Forwarded to `mq3.client.demo.encodeMessage`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L401)

<a id="function-function-mq3-client-client-main-clamptext-function-clamptext-text-limit-src-mq3-client-client-main-ml-754446648"></a>
### clampText

```ml
function clampText(text, limit)
```

Truncates text to at most limit minus one bytes, preserving shorter strings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `clampText` in the client main path. |
| `limit` | `dynamic` | — | Upper limit applied while collecting or rendering the result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L336)

<a id="function-function-mq3-client-client-main-create-function-create-src-mq3-client-client-main-ml-802972014"></a>
### create

```ml
function create()
```

Initializes the outer client lifecycle, reliable-command ring, server-browser collections, downloads and demo state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L310)

- [mq3.client.client_main.DemoState](Type-mq3-client-client-main-demostate-1110775460.md) — struct
- [mq3.client.client_main.Downloads](Type-mq3-client-client-main-downloads-460635637.md) — struct
<a id="function-function-mq3-client-client-main-emit-function-emit-state-services-kind-text-address-src-mq3-client-client-main-ml-49344350"></a>
### emit

```ml
function emit(state, services, kind, text, address)
```

Records a client action and invokes the host action callback only when the retail QVM does not own its dispatch.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client main record/storage; this routine assigns `state.actions`. |
| `services` | `dynamic` | — | Record read through `services.actionFn`, `services.context`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the client main path. |
| `address` | `dynamic` | — | Value used by `action=Action(kind,text,address,dispatched)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L324)

<a id="function-function-mq3-client-client-main-findserver-function-findserver-state-address-src-mq3-client-client-main-ml-1755808675"></a>
### findServer

```ml
function findServer(state, address)
```

Finds a server-browser entry by case-insensitive endpoint, returning its index or minus one.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.servers`. |
| `address` | `dynamic` | — | Value used by `if len(state.servers)>0 then for i=0 to len(state.servers)-1 if addressEqual(state.servers[i].address,address) then return i end if end for en...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L720)

<a id="function-function-mq3-client-client-main-findstatus-function-findstatus-state-address-src-mq3-client-client-main-ml-924128743"></a>
### findStatus

```ml
function findStatus(state, address)
```

Finds a cached server-status request by case-insensitive endpoint, returning its index or minus one.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.statuses`. |
| `address` | `dynamic` | — | Value used by `if len(state.statuses)>0 then for i=0 to len(state.statuses)-1 if addressEqual(state.statuses[i].address,address) then return i end if end for...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L800)

<a id="function-function-mq3-client-client-main-hexdigit-function-hexdigit-value-src-mq3-client-client-main-ml-1552914225"></a>
### hexDigit

```ml
function hexDigit(value)
```

Converts a hexadecimal nibble to its lowercase ASCII digit code.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<10` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L359)

<a id="function-function-mq3-client-client-main-host-function-host-src-mq3-client-client-main-ml-1056585570"></a>
### host

```ml
function host()
```

Creates a `mq3.client.client_main.Host` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L235)

- [mq3.client.client_main.Host](Type-mq3-client-client-main-host-676246126.md) — struct
<a id="function-function-mq3-client-client-main-infovalue-function-infovalue-text-key-src-mq3-client-client-main-ml-1478237770"></a>
### infoValue

```ml
function infoValue(text, key)
```

Finds a key case-insensitively in a backslash-delimited Quake info string, returning an empty string when absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `infoValue` in the client main path. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding client main entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L349)

- [mq3.client.client_main.Lifecycle](Type-mq3-client-client-main-lifecycle-1626418376.md) — struct
<a id="function-function-mq3-client-client-main-lower-function-lower-text-src-mq3-client-client-main-ml-1890382953"></a>
### lower

```ml
function lower(text)
```

Converts ASCII uppercase bytes to lowercase while preserving all other text bytes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `lower` in the client main path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L341)

<a id="constant-constant-mq3-client-client-main-max-pingrequests-const-max-pingrequests-32-src-mq3-client-client-main-ml-522824764"></a>
### MAX_PINGREQUESTS

```ml
const MAX_PINGREQUESTS = 32
```

Capacity limit for the pingrequests collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L36)

<a id="constant-constant-mq3-client-client-main-max-reliable-commands-const-max-reliable-commands-64-src-mq3-client-client-main-ml-1480536715"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```

Capacity limit for the reliable commands collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L34)

<a id="constant-constant-mq3-client-client-main-max-serverstatusrequests-const-max-serverstatusrequests-16-src-mq3-client-client-main-ml-1929387052"></a>
### MAX_SERVERSTATUSREQUESTS

```ml
const MAX_SERVERSTATUSREQUESTS = 16
```

Capacity limit for the serverstatusrequests collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L39)

<a id="constant-constant-mq3-client-client-main-max-string-chars-const-max-string-chars-1024-src-mq3-client-client-main-ml-1270407420"></a>
### MAX_STRING_CHARS

```ml
const MAX_STRING_CHARS = 1024
```

Maximum length of a protocol, command, or configuration string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L41)

<a id="function-function-mq3-client-client-main-now-function-now-state-services-src-mq3-client-client-main-ml-1813582377"></a>
### now

```ml
function now(state, services)
```

Reads the host millisecond clock when available, otherwise returns the lifecycle real-time clock.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.lifecycle.realtime`. |
| `services` | `dynamic` | — | Record read through `services.millisecondsFn`, `services.context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L332)

<a id="function-function-mq3-client-client-main-packets-function-packets-state-src-mq3-client-client-main-ml-1684672447"></a>
### packets

```ml
function packets(state)
```

Static storage marker from the C file. Kept explicit for source/ledger parity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.lifecycle.framecount`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L900)

- [mq3.client.client_main.Ping](Type-mq3-client-client-main-ping-234912884.md) — struct
<a id="constant-constant-mq3-client-client-main-port-server-const-port-server-27960-src-mq3-client-client-main-ml-299171429"></a>
### PORT_SERVER

```ml
const PORT_SERVER = 27960
```

Default UDP port used by a Quake game server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L43)

- [mq3.client.client_main.Reliable](Type-mq3-client-client-main-reliable-1941908786.md) — struct
<a id="constant-constant-mq3-client-client-main-retransmit-timeout-const-retransmit-timeout-clientabi-retransmit-timeout-src-mq3-client-client-main-ml-1950487519"></a>
### RETRANSMIT_TIMEOUT

```ml
const RETRANSMIT_TIMEOUT = clientAbi.RETRANSMIT_TIMEOUT
```

Connection-handshake retransmission interval in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L45)

- [mq3.client.client_main.ServerInfo](Type-mq3-client-client-main-serverinfo-496674891.md) — struct
- [mq3.client.client_main.ServerStatus](Type-mq3-client-client-main-serverstatus-1222122377.md) — struct
- [mq3.client.client_main.State](Type-mq3-client-client-main-state-468161889.md) — struct
<a id="function-function-mq3-client-client-main-toint-function-toint-text-src-mq3-client-client-main-ml-1861746679"></a>
### toInt

```ml
function toInt(text)
```

Parses an optional minus sign followed by decimal digits; empty or nonnumeric text yields zero.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `toInt` in the client main path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L356)
