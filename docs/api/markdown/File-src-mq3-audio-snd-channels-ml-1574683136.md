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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L25)

<a id="function-function-mq3-audio-snd-channels-advance-function-advance-state-milliseconds-src-mq3-audio-snd-channels-ml-616922669"></a>
### advance

```ml
function advance(state, milliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `milliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L23)

<a id="constant-constant-mq3-audio-snd-channels-chan-announcer-const-chan-announcer-7-src-mq3-audio-snd-channels-ml-1658312664"></a>
### CHAN_ANNOUNCER

```ml
const CHAN_ANNOUNCER = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L8)

- [mq3.audio.snd_channels.Channel](Type-mq3-audio-snd-channels-channel-424757083.md) — struct
<a id="function-function-mq3-audio-snd-channels-create-function-create-src-mq3-audio-snd-channels-ml-1744450608"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L14)

<a id="constant-constant-mq3-audio-snd-channels-max-channels-const-max-channels-sndlocal-max-channels-src-mq3-audio-snd-channels-ml-469506884"></a>
### MAX_CHANNELS

```ml
const MAX_CHANNELS = sndLocal.MAX_CHANNELS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L7)

<a id="function-function-mq3-audio-snd-channels-release-function-release-state-slot-src-mq3-audio-snd-channels-ml-829735849"></a>
### release

```ml
function release(state, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L29)

<a id="function-function-mq3-audio-snd-channels-setlistener-function-setlistener-state-entity-src-mq3-audio-snd-channels-ml-1322003246"></a>
### setListener

```ml
function setListener(state, entity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L21)

<a id="function-function-mq3-audio-snd-channels-settime-function-settime-state-milliseconds-src-mq3-audio-snd-channels-ml-185905951"></a>
### setTime

```ml
function setTime(state, milliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `milliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L22)

<a id="function-function-mq3-audio-snd-channels-start-function-start-state-entity-handle-entchannel-src-mq3-audio-snd-channels-ml-864241112"></a>
### start

```ml
function start(state, entity, handle, entchannel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `entchannel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_channels.ml#L34)

- [mq3.audio.snd_channels.Start](Type-mq3-audio-snd-channels-start-1995314412.md) — struct
- [mq3.audio.snd_channels.State](Type-mq3-audio-snd-channels-state-1811746341.md) — struct
