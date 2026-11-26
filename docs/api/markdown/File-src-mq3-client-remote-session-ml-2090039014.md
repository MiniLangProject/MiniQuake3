# `src/mq3/client/remote_session.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.remote_session`](Package-mq3-client-remote-session-972490808.md)

Reachable from entry: **no**

## Imports

- `mq3/client/connectionless.ml` as `connectionless` → [src/mq3/client/connectionless.ml](File-src-mq3-client-connectionless-ml-1561502254.md)
- `mq3/client/gamestate.ml` as `gamestate` → [src/mq3/client/gamestate.ml](File-src-mq3-client-gamestate-ml-1690167636.md)
- `mq3/client/netchan.ml` as `clientNet` → [src/mq3/client/netchan.ml](File-src-mq3-client-netchan-ml-1745063016.md)
- `mq3/client/network_ingress.ml` as `ingress` → [src/mq3/client/network_ingress.ml](File-src-mq3-client-network-ingress-ml-1289633455.md)
- `mq3/client/protocol_runtime.ml` as `protocol` → [src/mq3/client/protocol_runtime.ml](File-src-mq3-client-protocol-runtime-ml-1085434472.md)
- `mq3/client/send_cmd.ml` as `sendCmd` → [src/mq3/client/send_cmd.ml](File-src-mq3-client-send-cmd-ml-1342588170.md)
- `mq3/client/server_command_stream.ml` as `serverCommands` → [src/mq3/client/server_command_stream.ml](File-src-mq3-client-server-command-stream-ml-1493457615.md)
- `mq3/client/snapshot_command.ml` as `snapshots` → [src/mq3/client/snapshot_command.ml](File-src-mq3-client-snapshot-command-ml-285373799.md)
- `mq3/qcommon/net_transport.ml` as `transport` → [src/mq3/qcommon/net_transport.ml](File-src-mq3-qcommon-net-transport-ml-1557933377.md)
- `mq3/qcommon/netchan.ml` as `net` → [src/mq3/qcommon/netchan.ml](File-src-mq3-qcommon-netchan-ml-1381353623.md)
- `mq3/qcommon/network_pump.ml` as `pump` → [src/mq3/qcommon/network_pump.ml](File-src-mq3-qcommon-network-pump-ml-493477247.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

<a id="function-function-mq3-client-remote-session-acceptunpuregamestate-function-acceptunpuregamestate-session-src-mq3-client-remote-session-ml-564270512"></a>
### acceptUnpureGamestate

```ml
function acceptUnpureGamestate(session)
```

Accepts the current unpure gamestate after application asset preparation and returns void. Requires a received gamestate in loading state and an exact `sv_pure` value of `"0"`; otherwise returns error 7982. Sets the accepted generation and enters primed state, possibly becoming active immediately if an active snapshot is already available. This entry point implements no pure-server checksum validation or download negotiation; the application must load and validate assets first.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Session awaiting explicit acceptance of its current gamestate generation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L242)

<a id="function-function-mq3-client-remote-session-clearusercmds-function-clearusercmds-session-src-mq3-client-remote-session-ml-1760289186"></a>
### clearUsercmds

```ml
function clearUsercmds(session)
```

Replaces every retained user command with a zero command and returns void without resetting sequence counters.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Session whose outgoing `CMD_BACKUP` command slots are cleared. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L108)

<a id="function-function-mq3-client-remote-session-configstringchanged-function-configstringchanged-session-index-value-src-mq3-client-remote-session-ml-159799683"></a>
### configstringChanged

```ml
function configstringChanged(session, index, value)
```

Applies a reliable configstring change to packed gamestate storage. Returns true when storage changes, false for identical text, or the gamestate validation error.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Session whose parser owns the mutable gamestate storage. |
| `index` | `dynamic` | — | Configstring slot in the range zero through `MAX_CONFIGSTRINGS - 1`. |
| `value` | `dynamic` | — | Replacement text; embedded zero bytes and storage overflow are rejected. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L124)

<a id="function-function-mq3-client-remote-session-create-function-create-socket-address-qport-initialuserinfo-src-mq3-client-remote-session-ml-449787888"></a>
### create

```ml
function create(socket, address, qport, initialUserinfo)
```

Creates a remote session in connecting state with transport, parsing and command callbacks wired together. Returns a Session, or error 7982 for a missing socket/address or qport outside 0..65535. Creation does not poll, send the handshake, load assets or accept a gamestate.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — | Borrowed nonblocking UDP socket; its lifetime remains the application's responsibility. |
| `address` | `dynamic` | — | Server network address, including the remote endpoint type and port. |
| `qport` | `dynamic` | — | Protocol client identifier carried by the handshake and client netchan headers. |
| `initialUserinfo` | `dynamic` | — | Userinfo string supplied to subsequent connect requests. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L169)

<a id="function-function-mq3-client-remote-session-disconnected-function-disconnected-host-state-show-text-src-mq3-client-remote-session-ml-524651653"></a>
### disconnected

```ml
function disconnected(host, state, show, text)
```

Applies a connectionless disconnect callback to the session and returns void.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Connectionless services record whose context identifies the session to stop. |
| `state` | `dynamic` | — | Handshake callback argument retained for signature compatibility; unused here. |
| `show` | `dynamic` | — | Callback display flag; this adapter retains the text regardless of its value. |
| `text` | `dynamic` | — | Disconnect explanation forwarded to `stop`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L104)

<a id="function-function-mq3-client-remote-session-gamestateready-function-gamestateready-state-src-mq3-client-remote-session-ml-1587625689"></a>
### gameStateReady

```ml
function gameStateReady(state)
```

Starts a new loading generation after a complete gamestate and returns void. Resets outgoing user commands and packet timing, copies current configstrings, and refreshes the server ID and checksum feed. The reliable execution cursor and partial large-configstring assembly survive so commands received before the gamestate can still be consumed at the application boundary.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Parsed gamestate record whose context is the Session receiving this callback. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L145)

<a id="function-function-mq3-client-remote-session-poll-function-poll-session-realtime-maxpackets-src-mq3-client-remote-session-ml-1098273350"></a>
### poll

```ml
function poll(session, realtime, maxPackets)
```

Advances the handshake and receives at most the requested number of datagrams at the supplied realtime. Synchronizes state after each packet so a connect response can precede encrypted traffic in one poll. Returns the processed-datagram count, error 7982 for invalid input, or a receive/processing error. A zero packet budget still checks handshake retransmission and synchronizes the session.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Session to poll; must not be void. |
| `realtime` | `dynamic` | — | Nonnegative client clock value in milliseconds used for resend and packet timing. |
| `maxPackets` | `dynamic` | — | Nonnegative maximum number of received datagrams to process before returning. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L220)

<a id="function-function-mq3-client-remote-session-printed-function-printed-host-state-text-src-mq3-client-remote-session-ml-945542436"></a>
### printed

```ml
function printed(host, state, text)
```

Retains the latest server print text in the session and returns void.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Connectionless services record whose context receives the retained text. |
| `state` | `dynamic` | — | Handshake callback argument retained for signature compatibility; unused here. |
| `text` | `dynamic` | — | Server text to store without printing it to a terminal. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L86)

<a id="function-function-mq3-client-remote-session-queuecommand-function-queuecommand-session-text-src-mq3-client-remote-session-ml-654566655"></a>
### queueCommand

```ml
function queueCommand(session, text)
```

Enqueues one reliable client command and returns its newly assigned sequence number. Returns error 7982 for missing input, text of 1,024 bytes or more, or a full unacknowledged ring. Queuing synchronizes protocol sequence state but does not itself send a datagram.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Session whose outgoing reliable-command ring receives the command. |
| `text` | `dynamic` | — | Command text shorter than 1,024 encoded bytes; an empty string is permitted. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L291)

<a id="function-function-mq3-client-remote-session-restarted-function-restarted-session-src-mq3-client-remote-session-ml-1121853344"></a>
### restarted

```ml
function restarted(session)
```

Clears pending user commands for a consumed map restart, increments `restartCount`, and returns void.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Session supplied as the command-consumer callback context. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L115)

<a id="function-function-mq3-client-remote-session-runservercommands-function-runservercommands-session-throughsequence-src-mq3-client-remote-session-ml-160079792"></a>
### runServerCommands

```ml
function runServerCommands(session, throughSequence)
```

Consumes reliable server commands through an explicit application-selected sequence boundary. Requires a primed or active session with its current gamestate accepted. Returns the number of sequence entries consumed, including internal configstring fragments, or zero for an already consumed boundary. Invalid state/boundaries return error 7982; command or application-callback errors stop the session and propagate. Stops early if a callback ends the session or changes its gamestate generation. Packet receipt alone never delivers commands beyond the requested boundary. `serverCommandFn` receives transient tokenized arguments; retained values must be copied during the callback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Session whose consumer borrows the parser's reliable-command ring for this call. |
| `throughSequence` | `dynamic` | — | Last sequence to consume, normally the adopted snapshot's server-command number. Must be nonnegative and no greater than the latest received sequence. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L261)

<a id="function-function-mq3-client-remote-session-sendframe-function-sendframe-session-servertime-src-mq3-client-remote-session-ml-308379772"></a>
### sendFrame

```ml
function sendFrame(session, serverTime)
```

Runs one outgoing client-frame send attempt and updates snapshot acknowledgement timing for a sent packet. Returns a sender WriteResult or the no-send string `"disconnected"`, `"paused"` or `"choked"`. Sender errors propagate; a missing session produces error 7982. Packet history is copied only when the outgoing sequence advances.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Session providing user commands, reliable commands, transport and packet history. |
| `serverTime` | `dynamic` | — | Game/server time in milliseconds attached to the outgoing user command. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L306)

<a id="function-function-mq3-client-remote-session-sendoob-function-sendoob-host-state-address-text-src-mq3-client-remote-session-ml-1429231202"></a>
### sendOob

```ml
function sendOob(host, state, address, text)
```

Sends a connectionless text packet through the session socket and returns the encoded datagram bytes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Connectionless services record whose context is the owning Session. |
| `state` | `dynamic` | — | Handshake callback argument retained for signature compatibility; unused here. |
| `address` | `dynamic` | — | Destination network address for the outgoing datagram. |
| `text` | `dynamic` | — | Command text placed after the four-byte connectionless prefix. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L68)

<a id="function-function-mq3-client-remote-session-sendoobdata-function-sendoobdata-host-state-address-data-src-mq3-client-remote-session-ml-2036651333"></a>
### sendOobData

```ml
function sendOobData(host, state, address, data)
```

Sends a connectionless data packet using the connect-message Huffman format and returns its encoded bytes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Connectionless services record whose context supplies the borrowed UDP socket. |
| `state` | `dynamic` | — | Handshake callback argument retained for signature compatibility; unused here. |
| `address` | `dynamic` | — | Destination network address for the outgoing datagram. |
| `data` | `dynamic` | — | Connect-request bytes; the transport preserves the packet's 12-byte prefix before compression. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L75)

- [mq3.client.remote_session.Session](Type-mq3-client-remote-session-session-968249478.md) — struct
<a id="constant-constant-mq3-client-remote-session-snapflag-not-active-const-snapflag-not-active-2-src-mq3-client-remote-session-ml-37927695"></a>
### SNAPFLAG_NOT_ACTIVE

```ml
const SNAPFLAG_NOT_ACTIVE = 2
```

Snapshot flag marking a server snapshot that must not activate a primed remote client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L19)

<a id="function-function-mq3-client-remote-session-stop-function-stop-session-text-src-mq3-client-remote-session-ml-1528590779"></a>
### stop

```ml
function stop(session, text)
```

Marks both connection and sender disconnected, invalidates asset readiness, and retains the reason. Returns void without closing the application-owned socket. Existing snapshots cannot reactivate the session because promotion requires a primed connection and an accepted gamestate generation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Mutable session whose connection state and prepared generation are cleared. |
| `text` | `dynamic` | — | Terminal-session explanation stored in `serverPrint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L93)

<a id="function-function-mq3-client-remote-session-synchronize-function-synchronize-session-src-mq3-client-remote-session-ml-530578160"></a>
### synchronize

```ml
function synchronize(session)
```

Synchronizes connection, acknowledgement, reliable-ring and snapshot state with the outgoing sender. Returns void. A primed session becomes active only after a valid active snapshot for its accepted gamestate generation; loading or disconnected sessions remain in their current lifecycle state. Reliable-command arrays are shared with the wire codec rather than copied.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Mutable session whose parser, connection, codec and sender state must agree. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L193)

<a id="function-function-mq3-client-remote-session-systeminfochanged-function-systeminfochanged-session-src-mq3-client-remote-session-ml-2090104266"></a>
### systemInfoChanged

```ml
function systemInfoChanged(session)
```

Refreshes the outgoing server ID from systeminfo and returns void when the session remains usable. An already accepted session stops with error 7982 if `sv_pure` is no longer exactly `"0"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Session whose gamestate systeminfo and outgoing server ID are synchronized. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L131)

<a id="function-function-mq3-client-remote-session-userinfo-function-userinfo-host-state-src-mq3-client-remote-session-ml-1452365771"></a>
### userinfo

```ml
function userinfo(host, state)
```

Returns the session's current userinfo text to the connection handshake.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Connectionless services record whose context is the owning Session. |
| `state` | `dynamic` | — | Handshake callback argument retained for signature compatibility; unused here. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L80)
