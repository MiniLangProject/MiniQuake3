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
| `bits` | `dynamic` | — | Zero-based index into `masks`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_delta.ml#L72)

<a id="function-function-mq3-qcommon-message-delta-readdelta-function-readdelta-msg-oldv-bits-src-mq3-qcommon-message-delta-ml-1326931842"></a>
### readDelta

```ml
function readDelta(msg, oldV, bits)
```

Read delta in qcommon.message_delta; the normal completion returns `oldV`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readBits`. |
| `oldV` | `dynamic` | — | Value returned unchanged by this function. |
| `bits` | `dynamic` | — | Bits passed as `bits` to `mq3.qcommon.message.readBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_delta.ml#L47)

<a id="function-function-mq3-qcommon-message-delta-readdeltafloat-function-readdeltafloat-msg-oldv-src-mq3-qcommon-message-delta-ml-256136974"></a>
### readDeltaFloat

```ml
function readDeltaFloat(msg, oldV)
```

Read delta float in qcommon.message_delta; the normal completion returns `oldV`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readBits`. |
| `oldV` | `dynamic` | — | Value returned unchanged by this function. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_delta.ml#L64)

<a id="function-function-mq3-qcommon-message-delta-readdeltakey-function-readdeltakey-msg-key-oldv-bits-src-mq3-qcommon-message-delta-ml-1207172771"></a>
### readDeltaKey

```ml
function readDeltaKey(msg, key, oldV, bits)
```

Read delta key in qcommon.message_delta; the normal completion returns `oldV`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readBits`. |
| `key` | `dynamic` | — | Key used in `(key & keyMask(bits))` and `(message.readBits(msg, bits) ^ (key & keyMask(bits)))`. |
| `oldV` | `dynamic` | — | Value returned unchanged by this function. |
| `bits` | `dynamic` | — | Bits passed as `bits` to `mq3.qcommon.message.readBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_delta.ml#L93)

<a id="function-function-mq3-qcommon-message-delta-readdeltakeyfloat-function-readdeltakeyfloat-msg-key-oldv-src-mq3-qcommon-message-delta-ml-1152147885"></a>
### readDeltaKeyFloat

```ml
function readDeltaKeyFloat(msg, key, oldV)
```

Read delta key float in qcommon.message_delta; the normal completion returns `oldV`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readBits`. |
| `key` | `dynamic` | — | Key used in `(message.readBits(msg, 32) ^ key)` and `n.bitsFloat((message.readBits(msg, 32) ^ key))`. |
| `oldV` | `dynamic` | — | Value returned unchanged by this function. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_delta.ml#L112)

<a id="function-function-mq3-qcommon-message-delta-readdeltausercmd-function-readdeltausercmd-msg-previous-src-mq3-qcommon-message-delta-ml-431531710"></a>
### readDeltaUsercmd

```ml
function readDeltaUsercmd(msg, previous)
```

Read delta usercmd in qcommon.message_delta; the normal completion returns `current`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_delta.readTime`. |
| `previous` | `dynamic` | — | Record exposing `angles`, `forwardmove`, `rightmove`, `upmove`, `buttons`, `weapon`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_delta.ml#L159)

<a id="function-function-mq3-qcommon-message-delta-readdeltausercmdkey-function-readdeltausercmdkey-msg-key-previous-src-mq3-qcommon-message-delta-ml-1287439015"></a>
### readDeltaUsercmdKey

```ml
function readDeltaUsercmdKey(msg, key, previous)
```

Read delta usercmd key in qcommon.message_delta; the normal completion returns `current`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_delta.readTime`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.qcommon.message_delta.readDeltaKey`. |
| `previous` | `dynamic` | — | Record exposing `angles`, `forwardmove`, `rightmove`, `upmove`, `buttons`, `weapon`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_delta.ml#L203)

<a id="function-function-mq3-qcommon-message-delta-readtime-function-readtime-msg-previous-src-mq3-qcommon-message-delta-ml-644700842"></a>
### readTime

```ml
function readTime(msg, previous)
```

Read time in qcommon.message_delta; the normal completion returns `message.readBits(msg, 32)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readBits`. |
| `previous` | `dynamic` | — | Record exposing `serverTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_delta.ml#L134)

<a id="function-function-mq3-qcommon-message-delta-samepayload-function-samepayload-previous-current-src-mq3-qcommon-message-delta-ml-2009529520"></a>
### samePayload

```ml
function samePayload(previous, current)
```

Compare user-command angles, movement axes, buttons, and weapon while excluding the server timestamp.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `previous` | `dynamic` | — | Previous user-command payload. |
| `current` | `dynamic` | — | Current user-command payload to compare. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_delta.ml#L175)

<a id="function-function-mq3-qcommon-message-delta-usercommand-function-usercommand-servertime-angle0-angle1-angle2-buttons-weapon-forwardmove-rightmove-upmove-src-mq3-qcommon-message-delta-ml-498368130"></a>
### userCommand

```ml
function userCommand(serverTime, angle0, angle1, angle2, buttons, weapon, forwardmove, rightmove, upmove)
```

Create `mq3.qcommon.message_delta.UserCommand` with serverTime=serverTime; angles=[angle0, angle1, angle2]; buttons=buttons; weapon=weapon; forwardmove=forwardmove; rightmove=rightmove; upmove=upmove.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverTime` | `dynamic` | — | Initial `serverTime` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record. |
| `angle0` | `dynamic` | — | Angle 0 used in `UserCommand(serverTime, [angle0, angle1, angle2], buttons, weapon, forwardmove, rightmove, upmove)`. |
| `angle1` | `dynamic` | — | Angle 1 used in `UserCommand(serverTime, [angle0, angle1, angle2], buttons, weapon, forwardmove, rightmove, upmove)`. |
| `angle2` | `dynamic` | — | Angle 2 used in `UserCommand(serverTime, [angle0, angle1, angle2], buttons, weapon, forwardmove, rightmove, upmove)`. |
| `buttons` | `dynamic` | — | Initial `buttons` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record. |
| `weapon` | `dynamic` | — | Initial `weapon` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record. |
| `forwardmove` | `dynamic` | — | Initial `forwardmove` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record. |
| `rightmove` | `dynamic` | — | Initial `rightmove` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record. |
| `upmove` | `dynamic` | — | Initial `upmove` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_delta.ml#L29)

- [mq3.qcommon.message_delta.UserCommand](Type-mq3-qcommon-message-delta-usercommand-1975432902.md) — struct
<a id="function-function-mq3-qcommon-message-delta-writedelta-function-writedelta-msg-oldv-newv-bits-src-mq3-qcommon-message-delta-ml-472027750"></a>
### writeDelta

```ml
function writeDelta(msg, oldV, newV, bits)
```

Write delta in qcommon.message_delta.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeBits`. |
| `oldV` | `dynamic` | — | Old v used in `(oldV == newV)`. |
| `newV` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.message.writeBits`. |
| `bits` | `dynamic` | — | Bits passed as `bits` to `mq3.qcommon.message.writeBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_delta.ml#L38)

<a id="function-function-mq3-qcommon-message-delta-writedeltafloat-function-writedeltafloat-msg-oldv-newv-src-mq3-qcommon-message-delta-ml-920023740"></a>
### writeDeltaFloat

```ml
function writeDeltaFloat(msg, oldV, newV)
```

Write delta float in qcommon.message_delta.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeBits`. |
| `oldV` | `dynamic` | — | Old v used in `(oldV == newV)`. |
| `newV` | `dynamic` | — | Floating-point value to narrow and reinterpret. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_delta.ml#L56)

<a id="function-function-mq3-qcommon-message-delta-writedeltakey-function-writedeltakey-msg-key-oldv-newv-bits-src-mq3-qcommon-message-delta-ml-1498465007"></a>
### writeDeltaKey

```ml
function writeDeltaKey(msg, key, oldV, newV, bits)
```

Write delta key in qcommon.message_delta.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeBits`. |
| `key` | `dynamic` | — | Key used in `(newV ^ key)` and `message.writeBits(msg, (newV ^ key), bits)`. |
| `oldV` | `dynamic` | — | Old v used in `(oldV == newV)`. |
| `newV` | `dynamic` | — | New v used in `(newV ^ key)` and `(oldV == newV)`. |
| `bits` | `dynamic` | — | Bits passed as `bits` to `mq3.qcommon.message.writeBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_delta.ml#L83)

<a id="function-function-mq3-qcommon-message-delta-writedeltakeyfloat-function-writedeltakeyfloat-msg-key-oldv-newv-src-mq3-qcommon-message-delta-ml-1211293559"></a>
### writeDeltaKeyFloat

```ml
function writeDeltaKeyFloat(msg, key, oldV, newV)
```

Write delta key float in qcommon.message_delta.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeBits`. |
| `key` | `dynamic` | — | Key used in `(n.floatBits(newV) ^ key)` and `message.writeBits(msg, (n.floatBits(newV) ^ key), 32)`. |
| `oldV` | `dynamic` | — | Old v used in `(oldV == newV)`. |
| `newV` | `dynamic` | — | Floating-point value to narrow and reinterpret. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_delta.ml#L103)

<a id="function-function-mq3-qcommon-message-delta-writedeltausercmd-function-writedeltausercmd-msg-previous-current-src-mq3-qcommon-message-delta-ml-479836271"></a>
### writeDeltaUsercmd

```ml
function writeDeltaUsercmd(msg, previous, current)
```

Write delta usercmd in qcommon.message_delta.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_delta.writeTime`. |
| `previous` | `dynamic` | — | Record exposing `angles`, `forwardmove`, `rightmove`, `upmove`, `buttons`, `weapon`. |
| `current` | `dynamic` | — | Record exposing `angles`, `forwardmove`, `rightmove`, `upmove`, `buttons`, `weapon`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_delta.ml#L143)

<a id="function-function-mq3-qcommon-message-delta-writedeltausercmdkey-function-writedeltausercmdkey-msg-key-previous-current-src-mq3-qcommon-message-delta-ml-1541067500"></a>
### writeDeltaUsercmdKey

```ml
function writeDeltaUsercmdKey(msg, key, previous, current)
```

Write delta usercmd key in qcommon.message_delta.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_delta.writeTime`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.qcommon.message_delta.writeDeltaKey`. |
| `previous` | `dynamic` | — | Record exposing `angles`, `forwardmove`, `rightmove`, `upmove`, `buttons`, `weapon`. |
| `current` | `dynamic` | — | Record exposing `serverTime`, `angles`, `forwardmove`, `rightmove`, `upmove`, `buttons`, `weapon`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_delta.ml#L184)

<a id="function-function-mq3-qcommon-message-delta-writetime-function-writetime-msg-previous-current-src-mq3-qcommon-message-delta-ml-1991314083"></a>
### writeTime

```ml
function writeTime(msg, previous, current)
```

Write time in qcommon.message_delta.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeBits`. |
| `previous` | `dynamic` | — | Record exposing `serverTime`. |
| `current` | `dynamic` | — | Record exposing `serverTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_delta.ml#L121)
