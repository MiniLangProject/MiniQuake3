# `src/mq3/renderer/retained_world_batch.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.retained_world_batch`](Package-mq3-renderer-retained-world-batch-1627470649.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/native_world_selection.ml` as `nativeWorld` → [src/mq3/renderer/native_world_selection.ml](File-src-mq3-renderer-native-world-selection-ml-472887706.md)
- `mq3/renderer/playable_dynamic_lights.ml` as `lights` → [src/mq3/renderer/playable_dynamic_lights.ml](File-src-mq3-renderer-playable-dynamic-lights-ml-229722941.md)
- `mq3/renderer/playable_fog.ml` as `fog` → [src/mq3/renderer/playable_fog.ml](File-src-mq3-renderer-playable-fog-ml-140703890.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/renderer/playable_world_batch.ml` as `batches` → [src/mq3/renderer/playable_world_batch.ml](File-src-mq3-renderer-playable-world-batch-ml-1411140007.md)
- `mq3/renderer/world_surface_selection.ml` as `selection` → [src/mq3/renderer/world_surface_selection.ml](File-src-mq3-renderer-world-surface-selection-ml-1945526598.md)

## Declarations

<a id="function-function-mq3-renderer-retained-world-batch-blank-function-blank-world-catalog-skyflags-fogcatalog-lightcatalog-receiveflags-src-mq3-renderer-retained-world-batch-ml-1481510697"></a>
### blank

```ml
function blank(world, catalog, skyFlags, fogCatalog, lightCatalog, receiveFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `skyFlags` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `lightCatalog` | `dynamic` | — |  |
| `receiveFlags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L17)

- [mq3.renderer.retained_world_batch.Cache](Type-mq3-renderer-retained-world-batch-cache-1396367957.md) — struct
<a id="function-function-mq3-renderer-retained-world-batch-counters-function-counters-batch-src-mq3-renderer-retained-world-batch-ml-63605840"></a>
### counters

```ml
function counters(batch)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L148)

<a id="function-function-mq3-renderer-retained-world-batch-create-function-create-world-catalog-skyflags-fogcatalog-lightcatalog-receiveflags-src-mq3-renderer-retained-world-batch-ml-1821349217"></a>
### create

```ml
function create(world, catalog, skyFlags, fogCatalog, lightCatalog, receiveFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `skyFlags` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `lightCatalog` | `dynamic` | — |  |
| `receiveFlags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L62)

<a id="function-function-mq3-renderer-retained-world-batch-fail-function-fail-text-src-mq3-renderer-retained-world-batch-ml-2375865"></a>
### fail

```ml
function fail(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L16)

<a id="function-function-mq3-renderer-retained-world-batch-gather-function-gather-stream-packed-count-src-mq3-renderer-retained-world-batch-ml-730939491"></a>
### gather

```ml
function gather(stream, packed, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stream` | `dynamic` | — |  |
| `packed` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L98)

<a id="extern_function-extern-function-mq3-renderer-retained-world-batch-gathernative-extern-function-gathernative-source-as-ptr-sourcebytes-as-i32-sourcecount-as-i32-target-as-ptr-targetbytes-as-i32-runs-as-ptr-runbytes-as-i32-selected-as-ptr-selectedbytes-as-i32-selectedcount-as-i32-from-playable-window-dll-symbol-playable-window-gather-world-records-returns-i32-src-mq3-renderer-retained-world-batch-ml-1287534101"></a>
### gatherNative

```ml
extern function gatherNative(source as ptr, sourceBytes as i32, sourceCount as i32, target as ptr, targetBytes as i32, runs as ptr, runBytes as i32, selected as ptr, selectedBytes as i32, selectedCount as i32) from "playable_window.dll" symbol "playable_window_gather_world_records" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `ptr` | — |  |
| `sourceBytes` | `i32` | — |  |
| `sourceCount` | `i32` | — |  |
| `target` | `ptr` | — |  |
| `targetBytes` | `i32` | — |  |
| `runs` | `ptr` | — |  |
| `runBytes` | `i32` | — |  |
| `selected` | `ptr` | — |  |
| `selectedBytes` | `i32` | — |  |
| `selectedCount` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L13)

<a id="function-function-mq3-renderer-retained-world-batch-legacy-function-legacy-state-chosen-src-mq3-renderer-retained-world-batch-ml-1374813235"></a>
### legacy

```ml
function legacy(state, chosen)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chosen` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L142)

<a id="function-function-mq3-renderer-retained-world-batch-makestream-function-makestream-state-data-commands-pass-mode-lookup-src-mq3-renderer-retained-world-batch-ml-1970372387"></a>
### makeStream

```ml
function makeStream(state, data, commands, pass, mode, lookup)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `commands` | `dynamic` | — |  |
| `pass` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `lookup` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L31)

<a id="function-function-mq3-renderer-retained-world-batch-refreshfog-function-refreshfog-state-faces-src-mq3-renderer-retained-world-batch-ml-1161668439"></a>
### refreshFog

```ml
function refreshFog(state, faces)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `faces` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L123)

<a id="function-function-mq3-renderer-retained-world-batch-refreshlights-function-refreshlights-state-data-src-mq3-renderer-retained-world-batch-ml-1935399517"></a>
### refreshLights

```ml
function refreshLights(state, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L133)

<a id="function-function-mq3-renderer-retained-world-batch-select-function-select-state-chosen-src-mq3-renderer-retained-world-batch-ml-1758893451"></a>
### select

```ml
function select(state, chosen)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chosen` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L168)

<a id="function-function-mq3-renderer-retained-world-batch-stagesources-function-stagesources-stream-faces-fogcatalog-src-mq3-renderer-retained-world-batch-ml-1269340501"></a>
### stageSources

```ml
function stageSources(stream, faces, fogCatalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stream` | `dynamic` | — |  |
| `faces` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L103)

<a id="function-function-mq3-renderer-retained-world-batch-stageview-function-stageview-full-commands-src-mq3-renderer-retained-world-batch-ml-441673435"></a>
### stageView

```ml
function stageView(full, commands)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `full` | `dynamic` | — |  |
| `commands` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L23)

- [mq3.renderer.retained_world_batch.Stream](Type-mq3-renderer-retained-world-batch-stream-1344965909.md) — struct
<a id="function-function-mq3-renderer-retained-world-batch-unsupported-function-unsupported-material-src-mq3-renderer-retained-world-batch-ml-710349877"></a>
### unsupported

```ml
function unsupported(material)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `material` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L20)
