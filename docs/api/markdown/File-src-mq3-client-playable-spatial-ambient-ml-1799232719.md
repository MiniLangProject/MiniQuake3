# `src/mq3/client/playable_spatial_ambient.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_spatial_ambient`](Package-mq3-client-playable-spatial-ambient-1513958731.md)

Reachable from entry: **yes**

## Imports

- `mq3/audio/spatial_mixer.ml` as `mixer` → [src/mq3/audio/spatial_mixer.ml](File-src-mq3-audio-spatial-mixer-ml-1696381376.md)
- `mq3/platform/playable_ambient.ml` as `output` → [src/mq3/platform/playable_ambient.ml](File-src-mq3-platform-playable-ambient-ml-1461563654.md)

## Declarations

<a id="constant-constant-mq3-client-playable-spatial-ambient-chunk-frames-const-chunk-frames-1024-src-mq3-client-playable-spatial-ambient-ml-2006689692"></a>
### CHUNK_FRAMES

```ml
const CHUNK_FRAMES = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_spatial_ambient.ml#L9)

<a id="function-function-mq3-client-playable-spatial-ambient-create-function-create-catalog-src-mq3-client-playable-spatial-ambient-ml-8725623"></a>
### create

```ml
function create(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_spatial_ambient.ml#L13)

<a id="constant-constant-mq3-client-playable-spatial-ambient-output-rate-const-output-rate-22050-src-mq3-client-playable-spatial-ambient-ml-372507770"></a>
### OUTPUT_RATE

```ml
const OUTPUT_RATE = 22050
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_spatial_ambient.ml#L8)

<a id="function-function-mq3-client-playable-spatial-ambient-pump-function-pump-runtime-listenerorigin-listenerright-src-mq3-client-playable-spatial-ambient-ml-379720670"></a>
### pump

```ml
function pump(runtime, listenerOrigin, listenerRight)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `listenerOrigin` | `dynamic` | — |  |
| `listenerRight` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_spatial_ambient.ml#L30)

- [mq3.client.playable_spatial_ambient.Runtime](Type-mq3-client-playable-spatial-ambient-runtime-1789148433.md) — struct
<a id="function-function-mq3-client-playable-spatial-ambient-shutdown-function-shutdown-runtime-src-mq3-client-playable-spatial-ambient-ml-871534464"></a>
### shutdown

```ml
function shutdown(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_spatial_ambient.ml#L42)

<a id="function-function-mq3-client-playable-spatial-ambient-start-function-start-runtime-src-mq3-client-playable-spatial-ambient-ml-756160296"></a>
### start

```ml
function start(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_spatial_ambient.ml#L24)

<a id="function-function-mq3-client-playable-spatial-ambient-stop-function-stop-runtime-src-mq3-client-playable-spatial-ambient-ml-687035268"></a>
### stop

```ml
function stop(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_spatial_ambient.ml#L38)
