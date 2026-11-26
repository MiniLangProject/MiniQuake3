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

Calls `mq3.client.playable_fps_title.State`, `mq3.client.playable_fps_title.title` from playable FPS title `create`. The final path returns `State(mapName,now,0,0,false,now,title(mapName,-1))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mapName` | `dynamic` | — | Map name used to select the level and its associated assets. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_fps_title.ml#L48)

<a id="function-function-mq3-client-playable-fps-title-fail-function-fail-message-src-mq3-client-playable-fps-title-ml-1271069423"></a>
### fail

```ml
function fail(message)
```

Creates the playable FPS title error `7590` with diagnostic text `"preview FPS title: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"preview FPS title: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_fps_title.ml#L34)

<a id="function-function-mq3-client-playable-fps-title-frame-function-frame-state-now-src-mq3-client-playable-fps-title-ml-443779021"></a>
### frame

```ml
function frame(state, now)
```

Call exactly once after each presented frame. A string return value means the native title should be changed; void deliberately avoids per-frame Win32 work.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable FPS title record/storage; this routine assigns `state.lastTime`, `state.frameCount`, `state.smoothedFps`, `state.initialized` and additional values. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_fps_title.ml#L58)

<a id="function-function-mq3-client-playable-fps-title-initialtitle-function-initialtitle-state-src-mq3-client-playable-fps-title-ml-1235990061"></a>
### initialTitle

```ml
function initialTitle(state)
```

Evaluates playable FPS title `initialTitle` and returns `fail("state is required")`, `state.currentTitle` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentTitle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_fps_title.ml#L80)

- [mq3.client.playable_fps_title.State](Type-mq3-client-playable-fps-title-state-931417205.md) — struct
<a id="function-function-mq3-client-playable-fps-title-title-function-title-mapname-fps-src-mq3-client-playable-fps-title-ml-724630776"></a>
### title

```ml
function title(mapName, fps)
```

Evaluates playable FPS title `title` and returns `"MiniQuake3 | "+value+" FPS | "+mapName` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mapName` | `dynamic` | — | Map name used to select the level and its associated assets. |
| `fps` | `dynamic` | — | Value used by `if fps>=0 then value=str(fps) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_fps_title.ml#L39)

<a id="constant-constant-mq3-client-playable-fps-title-update-interval-milliseconds-const-update-interval-milliseconds-500-src-mq3-client-playable-fps-title-ml-688857202"></a>
### UPDATE_INTERVAL_MILLISECONDS

```ml
const UPDATE_INTERVAL_MILLISECONDS = 500
```

Duration or scheduling interval in milliseconds controlling update interval.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_fps_title.ml#L7)
