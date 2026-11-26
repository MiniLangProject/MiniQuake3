# `src/mq3/client/connectionless.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.connectionless`](Package-mq3-client-connectionless-836354932.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/textnumbers.ml` as `textnumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/qcommon/command_buffer.ml` as `commandBuffer` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/netchan.ml` as `netchan` → [src/mq3/qcommon/netchan.ml](File-src-mq3-qcommon-netchan-ml-1381353623.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

<a id="function-function-mq3-client-connectionless-addressequal-function-addressequal-a-b-includeport-src-mq3-client-connectionless-ml-864182974"></a>
### addressEqual

```ml
function addressEqual(a, b, includePort)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `includePort` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L50)

<a id="constant-constant-mq3-client-connectionless-ca-active-const-ca-active-8-src-mq3-client-connectionless-ml-469475829"></a>
### CA_ACTIVE

```ml
const CA_ACTIVE = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L19)

<a id="constant-constant-mq3-client-connectionless-ca-authorizing-const-ca-authorizing-2-src-mq3-client-connectionless-ml-244222447"></a>
### CA_AUTHORIZING

```ml
const CA_AUTHORIZING = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L13)

<a id="constant-constant-mq3-client-connectionless-ca-challenging-const-ca-challenging-4-src-mq3-client-connectionless-ml-1825104305"></a>
### CA_CHALLENGING

```ml
const CA_CHALLENGING = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L15)

<a id="constant-constant-mq3-client-connectionless-ca-cinematic-const-ca-cinematic-9-src-mq3-client-connectionless-ml-672836282"></a>
### CA_CINEMATIC

```ml
const CA_CINEMATIC = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L20)

<a id="constant-constant-mq3-client-connectionless-ca-connected-const-ca-connected-5-src-mq3-client-connectionless-ml-2130063470"></a>
### CA_CONNECTED

```ml
const CA_CONNECTED = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L16)

<a id="constant-constant-mq3-client-connectionless-ca-connecting-const-ca-connecting-3-src-mq3-client-connectionless-ml-304994166"></a>
### CA_CONNECTING

```ml
const CA_CONNECTING = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L14)

<a id="constant-constant-mq3-client-connectionless-ca-disconnected-const-ca-disconnected-1-src-mq3-client-connectionless-ml-74425328"></a>
### CA_DISCONNECTED

```ml
const CA_DISCONNECTED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L12)

<a id="constant-constant-mq3-client-connectionless-ca-loading-const-ca-loading-6-src-mq3-client-connectionless-ml-1985533531"></a>
### CA_LOADING

```ml
const CA_LOADING = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L17)

<a id="constant-constant-mq3-client-connectionless-ca-primed-const-ca-primed-7-src-mq3-client-connectionless-ml-126569994"></a>
### CA_PRIMED

```ml
const CA_PRIMED = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L18)

<a id="constant-constant-mq3-client-connectionless-ca-uninitialized-const-ca-uninitialized-0-src-mq3-client-connectionless-ml-1396581971"></a>
### CA_UNINITIALIZED

```ml
const CA_UNINITIALIZED = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L11)

<a id="function-function-mq3-client-connectionless-checkforresend-function-checkforresend-state-host-src-mq3-client-connectionless-ml-240059339"></a>
### checkForResend

```ml
function checkForResend(state, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L67)

<a id="function-function-mq3-client-connectionless-create-function-create-address-src-mq3-client-connectionless-ml-1941720080"></a>
### create

```ml
function create(address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L34)

<a id="function-function-mq3-client-connectionless-disconnectpacket-function-disconnectpacket-state-host-source-src-mq3-client-connectionless-ml-211632334"></a>
### disconnectPacket

```ml
function disconnectPacket(state, host, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L57)

<a id="function-function-mq3-client-connectionless-dispatch-function-dispatch-state-host-source-msg-src-mq3-client-connectionless-ml-1798771667"></a>
### dispatch

```ml
function dispatch(state, host, source, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L89)

<a id="function-function-mq3-client-connectionless-lowerascii-function-lowerascii-text-src-mq3-client-connectionless-ml-258004247"></a>
### lowerAscii

```ml
function lowerAscii(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L39)

<a id="constant-constant-mq3-client-connectionless-max-string-tokens-const-max-string-tokens-1024-src-mq3-client-connectionless-ml-956411172"></a>
### MAX_STRING_TOKENS

```ml
const MAX_STRING_TOKENS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L21)

<a id="constant-constant-mq3-client-connectionless-protocol-version-const-protocol-version-68-src-mq3-client-connectionless-ml-341628895"></a>
### PROTOCOL_VERSION

```ml
const PROTOCOL_VERSION = 68
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L23)

<a id="constant-constant-mq3-client-connectionless-retransmit-timeout-const-retransmit-timeout-3000-src-mq3-client-connectionless-ml-648147008"></a>
### RETRANSMIT_TIMEOUT

```ml
const RETRANSMIT_TIMEOUT = 3000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L22)

<a id="function-function-mq3-client-connectionless-services-function-services-src-mq3-client-connectionless-ml-406009708"></a>
### services

```ml
function services()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L37)

- [mq3.client.connectionless.Services](Type-mq3-client-connectionless-services-831468066.md) — struct
<a id="function-function-mq3-client-connectionless-startswith-function-startswith-text-prefix-src-mq3-client-connectionless-ml-1006722643"></a>
### startsWith

```ml
function startsWith(text, prefix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `prefix` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L44)

- [mq3.client.connectionless.State](Type-mq3-client-connectionless-state-260944787.md) — struct
