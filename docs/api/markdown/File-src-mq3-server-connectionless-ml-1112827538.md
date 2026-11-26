# `src/mq3/server/connectionless.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.connectionless`](Package-mq3-server-connectionless-2081411696.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/command_buffer.ml` as `commandBuffer` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/server/oob_connect.ml` as `oobConnect` → [src/mq3/server/oob_connect.ml](File-src-mq3-server-oob-connect-ml-829458266.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-server-connectionless-connectprefix-function-connectprefix-msg-src-mq3-server-connectionless-ml-980026313"></a>
### connectPrefix

```ml
function connectPrefix(msg)
```

Check whether bytes 4 through 10 of the message storage contain the case-sensitive text `connect`. Returns false for storage shorter than eleven bytes. This prefix check does not validate the OOB marker, require a word boundary, or inspect the message's cursize; `dispatch` separately validates the marker.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Message exposing the backing data bytes used to recognize compressed connect requests. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/connectionless.ml#L34)

<a id="function-function-mq3-server-connectionless-dispatch-function-dispatch-runtime-host-sourceaddress-msg-src-mq3-server-connectionless-ml-1807300734"></a>
### dispatch

```ml
function dispatch(runtime, host, sourceAddress, msg)
```

Read and route one connectionless packet after validating its -1 OOB marker. Recognizes getstatus, getinfo, getchallenge, connect, ipAuthorize, rcon, and disconnect. Returns the recognized command name, or `unknown` for empty/unrecognized input; recognition does not imply that an optional callback was installed or that authentication succeeded. Command matching is case-insensitive. Connect packets with a matching lowercase raw prefix invoke the optional decompressor before tokenization. The rcon callback receives unverified text and arguments and owns authentication and command execution.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Out-of-band connection runtime used by getchallenge and direct-connect handling. |
| `host` | `dynamic` | — | Connectionless Services whose callbacks receive this same record as their first argument. |
| `sourceAddress` | `dynamic` | — | Sender's network address, forwarded to connection handling and host callbacks. |
| `msg` | `dynamic` | — | Mutable message containing the OOB marker and command bytes; its read cursor is advanced. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/connectionless.ml#L58)

<a id="function-function-mq3-server-connectionless-services-function-services-src-mq3-server-connectionless-ml-104543780"></a>
### services

```ml
function services()
```

Create a connectionless callback bundle with all callbacks and context initially unset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/connectionless.ml#L29)

- [mq3.server.connectionless.Services](Type-mq3-server-connectionless-services-775299350.md) — struct
<a id="function-function-mq3-server-connectionless-tokens-function-tokens-text-src-mq3-server-connectionless-ml-1651922383"></a>
### tokens

```ml
function tokens(text)
```

Tokenize a connectionless command line with the engine's command parser. Returns an ordered array of argument strings, including the command name at index zero, or an empty array.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Decoded command line to parse with Quake command quoting rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/connectionless.ml#L43)
