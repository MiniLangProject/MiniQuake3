# `src/mq3/client/playable_fps_title.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_fps_title`](Package-mq3-client-playable-fps-title-878265454.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-client-playable-fps-title-create-function-create-mapname-now-src-mq3-client-playable-fps-title-ml-877434751"></a>
### create

```ml
function create(mapName, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mapName` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_fps_title.ml#L18)

<a id="function-function-mq3-client-playable-fps-title-fail-function-fail-message-src-mq3-client-playable-fps-title-ml-1271069423"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_fps_title.ml#L10)

<a id="function-function-mq3-client-playable-fps-title-frame-function-frame-state-now-src-mq3-client-playable-fps-title-ml-443779021"></a>
### frame

```ml
function frame(state, now)
```

Call exactly once after each presented frame. A string return value means the native title should be changed; void deliberately avoids per-frame Win32 work.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_fps_title.ml#L26)

<a id="function-function-mq3-client-playable-fps-title-initialtitle-function-initialtitle-state-src-mq3-client-playable-fps-title-ml-1235990061"></a>
### initialTitle

```ml
function initialTitle(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_fps_title.ml#L46)

- [mq3.client.playable_fps_title.State](Type-mq3-client-playable-fps-title-state-931417205.md) — struct
<a id="function-function-mq3-client-playable-fps-title-title-function-title-mapname-fps-src-mq3-client-playable-fps-title-ml-724630776"></a>
### title

```ml
function title(mapName, fps)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mapName` | `dynamic` | — |  |
| `fps` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_fps_title.ml#L12)

<a id="constant-constant-mq3-client-playable-fps-title-update-interval-milliseconds-const-update-interval-milliseconds-500-src-mq3-client-playable-fps-title-ml-688857202"></a>
### UPDATE_INTERVAL_MILLISECONDS

```ml
const UPDATE_INTERVAL_MILLISECONDS = 500
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_fps_title.ml#L6)
