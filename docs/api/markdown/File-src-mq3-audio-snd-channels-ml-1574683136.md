# `src/mq3/audio/snd_channels.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.snd_channels`](Package-mq3-audio-snd-channels-759543294.md)

Reachable from entry: **yes**

## Imports

- `mq3/audio/snd_local.ml` as `sndLocal` → [src/mq3/audio/snd_local.ml](File-src-mq3-audio-snd-local-ml-298173627.md)

## Declarations

<a id="function-function-mq3-audio-snd-channels-activecount-function-activecount-state-src-mq3-audio-snd-channels-ml-1961484505"></a>
### activeCount

```ml
function activeCount(state)
```

Count mixer-channel records whose active flag is set.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Channel pool containing the active flags to count. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L77)

<a id="function-function-mq3-audio-snd-channels-advance-function-advance-state-milliseconds-src-mq3-audio-snd-channels-ml-616922669"></a>
### advance

```ml
function advance(state, milliseconds)
```

Advance snd channels in audio.snd_channels; the normal completion returns `state.time`.

Direct state writes: `state.time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `time`. Updated in place: `time`. |
| `milliseconds` | `dynamic` | — | Milliseconds used in `(milliseconds > 0)` and `(state.time + milliseconds)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L73)

<a id="constant-constant-mq3-audio-snd-channels-chan-announcer-const-chan-announcer-7-src-mq3-audio-snd-channels-ml-1658312664"></a>
### CHAN_ANNOUNCER

```ml
const CHAN_ANNOUNCER = 7
```

Entity-channel identifier reserved for announcer audio.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L10)

- [mq3.audio.snd_channels.Channel](Type-mq3-audio-snd-channels-channel-424757083.md) — struct
<a id="function-function-mq3-audio-snd-channels-create-function-create-src-mq3-audio-snd-channels-ml-1744450608"></a>
### create

```ml
function create()
```

Create snd channels in audio.snd_channels; the normal completion returns `State(channels, free, 0, 0)`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L49)

<a id="constant-constant-mq3-audio-snd-channels-max-channels-const-max-channels-sndlocal-max-channels-src-mq3-audio-snd-channels-ml-469506884"></a>
### MAX_CHANNELS

```ml
const MAX_CHANNELS = sndLocal.MAX_CHANNELS
```

Maximum number of simultaneously allocated sound channels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L8)

<a id="function-function-mq3-audio-snd-channels-release-function-release-state-slot-src-mq3-audio-snd-channels-ml-829735849"></a>
### release

```ml
function release(state, slot)
```

Release snd channels in audio.snd_channels; the normal completion returns `true`.

Direct state writes: `state.freeSlots`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `channels`, `freeSlots`. Updated in place: `freeSlots`. |
| `slot` | `dynamic` | — | Zero-based index into `state.channels`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L86)

<a id="function-function-mq3-audio-snd-channels-setlistener-function-setlistener-state-entity-src-mq3-audio-snd-channels-ml-1322003246"></a>
### setListener

```ml
function setListener(state, entity)
```

Set listener in audio.snd_channels; updates `state.listener`.

Direct state writes: `state.listener`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `listener`. |
| `entity` | `dynamic` | — | Entity operand used by `setListener`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L61)

<a id="function-function-mq3-audio-snd-channels-settime-function-settime-state-milliseconds-src-mq3-audio-snd-channels-ml-185905951"></a>
### setTime

```ml
function setTime(state, milliseconds)
```

Set time in audio.snd_channels; updates `state.time`.

Direct state writes: `state.time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `time`. |
| `milliseconds` | `dynamic` | — | Milliseconds operand used by `setTime`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L67)

<a id="function-function-mq3-audio-snd-channels-start-function-start-state-entity-handle-entchannel-src-mq3-audio-snd-channels-ml-864241112"></a>
### start

```ml
function start(state, entity, handle, entchannel)
```

Start snd channels in audio.snd_channels; the normal completion returns `Start(true, chosen, true, "replace")`.

Direct state writes: `state.freeSlots`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `channels`, `time`, `listener`, `freeSlots`. Updated in place: `freeSlots`. |
| `entity` | `dynamic` | — | Entity used in `(channel.entity == entity)` and `(entity == state.listener)`. |
| `handle` | `dynamic` | — | Handle used in `(handle <= 0)` and `(channel.handle == handle)`. |
| `entchannel` | `dynamic` | — | Entchannel used in `(channel.entchannel != CHAN_ANNOUNCER)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L98)

- [mq3.audio.snd_channels.Start](Type-mq3-audio-snd-channels-start-1995314412.md) — struct
- [mq3.audio.snd_channels.State](Type-mq3-audio-snd-channels-state-1811746341.md) — struct
