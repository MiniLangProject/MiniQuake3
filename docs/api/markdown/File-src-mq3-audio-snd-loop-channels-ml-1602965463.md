# `src/mq3/audio/snd_loop_channels.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.snd_loop_channels`](Package-mq3-audio-snd-loop-channels-1956055057.md)

Reachable from entry: **yes**

## Imports

- `mq3/audio/snd_spatialize.ml` as `loopSpatial` → [src/mq3/audio/snd_spatialize.ml](File-src-mq3-audio-snd-spatialize-ml-2009248822.md)

## Declarations

<a id="function-function-mq3-audio-snd-loop-channels-build-function-build-entries-listenerorigin-listeneraxis-src-mq3-audio-snd-loop-channels-ml-1608301461"></a>
### build

```ml
function build(entries, listenerOrigin, listenerAxis)
```

Group active loop sounds by matching source while accumulating their spatialized channel volumes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entries` | `dynamic` | — | Entries used in `len(entries)` and `entries[index]`. |
| `listenerOrigin` | `dynamic` | — | Listener origin passed as `listenerOrigin` to `mq3.audio.snd_spatialize.spatialize`. |
| `listenerAxis` | `dynamic` | — | Listener axis passed as `listenerAxis` to `mq3.audio.snd_spatialize.spatialize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_loop_channels.ml#L18)

- [mq3.audio.snd_loop_channels.Entry](Type-mq3-audio-snd-loop-channels-entry-1333255851.md) — struct
- [mq3.audio.snd_loop_channels.Group](Type-mq3-audio-snd-loop-channels-group-732355124.md) — struct
<a id="constant-constant-mq3-audio-snd-loop-channels-max-channels-const-max-channels-96-src-mq3-audio-snd-loop-channels-ml-1443888712"></a>
### MAX_CHANNELS

```ml
const MAX_CHANNELS = 96
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_loop_channels.ml#L7)
