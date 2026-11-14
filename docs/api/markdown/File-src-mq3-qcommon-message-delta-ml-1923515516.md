# `src/mq3/qcommon/message_delta.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.message_delta`](Package-mq3-qcommon-message-delta-1519350044.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)

## Declarations

<a id="function-function-mq3-qcommon-message-delta-keymask-function-keymask-bits-src-mq3-qcommon-message-delta-ml-566216412"></a>
### keyMask

```ml
function keyMask(bits)
```

This is deliberately the original table rather than a derived bits-wide mask: MSG_ReadDeltaKey indexes kbitmask with bits, not bits-1.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_delta.ml#L44)

<a id="function-function-mq3-qcommon-message-delta-readdelta-function-readdelta-msg-oldv-bits-src-mq3-qcommon-message-delta-ml-1326931842"></a>
### readDelta

```ml
function readDelta(msg, oldV, bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `oldV` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_delta.ml#L27)

<a id="function-function-mq3-qcommon-message-delta-readdeltafloat-function-readdeltafloat-msg-oldv-src-mq3-qcommon-message-delta-ml-256136974"></a>
### readDeltaFloat

```ml
function readDeltaFloat(msg, oldV)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `oldV` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_delta.ml#L37)

<a id="function-function-mq3-qcommon-message-delta-readdeltakey-function-readdeltakey-msg-key-oldv-bits-src-mq3-qcommon-message-delta-ml-1207172771"></a>
### readDeltaKey

```ml
function readDeltaKey(msg, key, oldV, bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `oldV` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_delta.ml#L54)

<a id="function-function-mq3-qcommon-message-delta-readdeltakeyfloat-function-readdeltakeyfloat-msg-key-oldv-src-mq3-qcommon-message-delta-ml-1152147885"></a>
### readDeltaKeyFloat

```ml
function readDeltaKeyFloat(msg, key, oldV)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `oldV` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_delta.ml#L64)

<a id="function-function-mq3-qcommon-message-delta-readdeltausercmd-function-readdeltausercmd-msg-previous-src-mq3-qcommon-message-delta-ml-431531710"></a>
### readDeltaUsercmd

```ml
function readDeltaUsercmd(msg, previous)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_delta.ml#L97)

<a id="function-function-mq3-qcommon-message-delta-readdeltausercmdkey-function-readdeltausercmdkey-msg-key-previous-src-mq3-qcommon-message-delta-ml-1287439015"></a>
### readDeltaUsercmdKey

```ml
function readDeltaUsercmdKey(msg, key, previous)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_delta.ml#L129)

<a id="function-function-mq3-qcommon-message-delta-readtime-function-readtime-msg-previous-src-mq3-qcommon-message-delta-ml-644700842"></a>
### readTime

```ml
function readTime(msg, previous)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_delta.ml#L79)

<a id="function-function-mq3-qcommon-message-delta-samepayload-function-samepayload-previous-current-src-mq3-qcommon-message-delta-ml-2009529520"></a>
### samePayload

```ml
function samePayload(previous, current)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `previous` | `dynamic` | — |  |
| `current` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_delta.ml#L110)

<a id="function-function-mq3-qcommon-message-delta-usercommand-function-usercommand-servertime-angle0-angle1-angle2-buttons-weapon-forwardmove-rightmove-upmove-src-mq3-qcommon-message-delta-ml-498368130"></a>
### userCommand

```ml
function userCommand(serverTime, angle0, angle1, angle2, buttons, weapon, forwardmove, rightmove, upmove)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverTime` | `dynamic` | — |  |
| `angle0` | `dynamic` | — |  |
| `angle1` | `dynamic` | — |  |
| `angle2` | `dynamic` | — |  |
| `buttons` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |
| `forwardmove` | `dynamic` | — |  |
| `rightmove` | `dynamic` | — |  |
| `upmove` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_delta.ml#L18)

- [mq3.qcommon.message_delta.UserCommand](Type-mq3-qcommon-message-delta-usercommand-1975432902.md) — struct
<a id="function-function-mq3-qcommon-message-delta-writedelta-function-writedelta-msg-oldv-newv-bits-src-mq3-qcommon-message-delta-ml-472027750"></a>
### writeDelta

```ml
function writeDelta(msg, oldV, newV, bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `oldV` | `dynamic` | — |  |
| `newV` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_delta.ml#L22)

<a id="function-function-mq3-qcommon-message-delta-writedeltafloat-function-writedeltafloat-msg-oldv-newv-src-mq3-qcommon-message-delta-ml-920023740"></a>
### writeDeltaFloat

```ml
function writeDeltaFloat(msg, oldV, newV)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `oldV` | `dynamic` | — |  |
| `newV` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_delta.ml#L32)

<a id="function-function-mq3-qcommon-message-delta-writedeltakey-function-writedeltakey-msg-key-oldv-newv-bits-src-mq3-qcommon-message-delta-ml-1498465007"></a>
### writeDeltaKey

```ml
function writeDeltaKey(msg, key, oldV, newV, bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `oldV` | `dynamic` | — |  |
| `newV` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_delta.ml#L49)

<a id="function-function-mq3-qcommon-message-delta-writedeltakeyfloat-function-writedeltakeyfloat-msg-key-oldv-newv-src-mq3-qcommon-message-delta-ml-1211293559"></a>
### writeDeltaKeyFloat

```ml
function writeDeltaKeyFloat(msg, key, oldV, newV)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `oldV` | `dynamic` | — |  |
| `newV` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_delta.ml#L59)

<a id="function-function-mq3-qcommon-message-delta-writedeltausercmd-function-writedeltausercmd-msg-previous-current-src-mq3-qcommon-message-delta-ml-479836271"></a>
### writeDeltaUsercmd

```ml
function writeDeltaUsercmd(msg, previous, current)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |
| `current` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_delta.ml#L84)

<a id="function-function-mq3-qcommon-message-delta-writedeltausercmdkey-function-writedeltausercmdkey-msg-key-previous-current-src-mq3-qcommon-message-delta-ml-1541067500"></a>
### writeDeltaUsercmdKey

```ml
function writeDeltaUsercmdKey(msg, key, previous, current)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |
| `current` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_delta.ml#L114)

<a id="function-function-mq3-qcommon-message-delta-writetime-function-writetime-msg-previous-current-src-mq3-qcommon-message-delta-ml-1991314083"></a>
### writeTime

```ml
function writeTime(msg, previous, current)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |
| `current` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_delta.ml#L69)
