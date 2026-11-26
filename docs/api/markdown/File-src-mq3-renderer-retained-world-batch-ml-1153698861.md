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

Constructs `mq3.renderer.retained_world_batch.Cache` with `full` = `void`, `base` = `void`, `streams` = `[]`, `fogStream` = `void` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Initial value for `mq3.renderer.retained_world_batch.Cache.world`. |
| `catalog` | `dynamic` | — | Initial value for `mq3.renderer.retained_world_batch.Cache.catalog`. |
| `skyFlags` | `dynamic` | — | Initial value for `mq3.renderer.retained_world_batch.Cache.skyFlags`. |
| `fogCatalog` | `dynamic` | — | Initial value for `mq3.renderer.retained_world_batch.Cache.fogCatalog`. |
| `lightCatalog` | `dynamic` | — | Initial value for `mq3.renderer.retained_world_batch.Cache.lightCatalog`. |
| `receiveFlags` | `dynamic` | — | Initial value for `mq3.renderer.retained_world_batch.Cache.receiveFlags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L113)

- [mq3.renderer.retained_world_batch.Cache](Type-mq3-renderer-retained-world-batch-cache-1396367957.md) — struct
<a id="function-function-mq3-renderer-retained-world-batch-counters-function-counters-batch-src-mq3-renderer-retained-world-batch-ml-63605840"></a>
### counters

```ml
function counters(batch)
```

Updates `batch.animatedPasses`, `batch.uvModifiedPasses`, `batch.blendedPasses`, `batch.generatorPasses`, `batch.alphaTestPasses` in `mq3.renderer.retained_world_batch.counters`; returns `batch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Mutable record or buffer; this call updates `batch.animatedPasses`, `batch.uvModifiedPasses`, `batch.blendedPasses`, `batch.generatorPasses`, `batch.alphaTestPasses`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L288)

<a id="function-function-mq3-renderer-retained-world-batch-create-function-create-world-catalog-skyflags-fogcatalog-lightcatalog-receiveflags-src-mq3-renderer-retained-world-batch-ml-1821349217"></a>
### create

```ml
function create(world, catalog, skyFlags, fogCatalog, lightCatalog, receiveFlags)
```

Builds `state.reason`, `indexes[index]`, `state.full`, `state.fallbackFaces`, `state.fallbackFaces[face]` in `mq3.renderer.retained_world_batch.create`; returns `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record providing `world.totalTriangleCount`, `world.trianglesByFace`, `world.faceTextureIndexes`. |
| `catalog` | `dynamic` | — | Value forwarded as `catalog` to `mq3.renderer.retained_world_batch.blank`. |
| `skyFlags` | `dynamic` | — | Value forwarded as `skyFlags` to `mq3.renderer.retained_world_batch.blank`. |
| `fogCatalog` | `dynamic` | — | Value forwarded as `fogCatalog` to `mq3.renderer.retained_world_batch.blank`. |
| `lightCatalog` | `dynamic` | — | Value forwarded as `lightCatalog` to `mq3.renderer.retained_world_batch.blank`. |
| `receiveFlags` | `dynamic` | — | Value forwarded as `receiveFlags` to `mq3.renderer.retained_world_batch.blank`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L178)

<a id="function-function-mq3-renderer-retained-world-batch-fail-function-fail-text-src-mq3-renderer-retained-world-batch-ml-2375865"></a>
### fail

```ml
function fail(text)
```

Creates error `7494` with message `"retained world batch: "+text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Input used in the result expression `error(7494,"retained world batch: "+text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L105)

<a id="function-function-mq3-renderer-retained-world-batch-gather-function-gather-stream-packed-count-src-mq3-renderer-retained-world-batch-ml-730939491"></a>
### gather

```ml
function gather(stream, packed, count)
```

Updates `stream.draw.count` in `mq3.renderer.retained_world_batch.gather`; returns `written`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stream` | `dynamic` | — | Mutable record or buffer; this call updates `stream.draw.count`. |
| `packed` | `dynamic` | — | Read-only selected face indices, packed as 32-bit integers in draw order. |
| `count` | `dynamic` | — | Value forwarded as `selectedCount` to `mq3.renderer.retained_world_batch.gatherNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L218)

<a id="extern_function-extern-function-mq3-renderer-retained-world-batch-gathernative-extern-function-gathernative-source-as-ptr-sourcebytes-as-i32-sourcecount-as-i32-target-as-ptr-targetbytes-as-i32-runs-as-ptr-runbytes-as-i32-selected-as-ptr-selectedbytes-as-i32-selectedcount-as-i32-from-playable-window-dll-symbol-playable-window-gather-world-records-returns-i32-src-mq3-renderer-retained-world-batch-ml-1287534101"></a>
### gatherNative

```ml
extern function gatherNative(source as ptr, sourceBytes as i32, sourceCount as i32, target as ptr, targetBytes as i32, runs as ptr, runBytes as i32, selected as ptr, selectedBytes as i32, selectedCount as i32) from "playable_window.dll" symbol "playable_window_gather_world_records" returns i32
```

Gathers selected face runs as 128-byte triangle records after validating all spans and overlap.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `ptr` | — | Read-only packed source records. |
| `sourceBytes` | `i32` | — | Available size of the source buffer in bytes. |
| `sourceCount` | `i32` | — | Number of source records available to the gather operation. |
| `target` | `ptr` | — | Writable destination storage; must not overlap any input range. |
| `targetBytes` | `i32` | — | Writable capacity of the destination buffer in bytes. |
| `runs` | `ptr` | — | Read-only eight-byte face-run records: first source record and record count. |
| `runBytes` | `i32` | — | Size of the per-face first/count table in bytes. |
| `selected` | `ptr` | — | Read-only packed 32-bit face indices, retained in this exact order. |
| `selectedBytes` | `i32` | — | Size of the selected-face index buffer in bytes. |
| `selectedCount` | `i32` | — | Number of 32-bit face indices to gather in selection order. |


**Returns:** Gathered record count; -1 invalid buffers, -2 face index, -3 source span, -4 capacity, or -5 overlap.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L25)

<a id="extern_function-extern-function-mq3-renderer-retained-world-batch-gatherspecularnative-extern-function-gatherspecularnative-source-as-ptr-sourcebytes-as-i32-sourcecount-as-i32-target-as-ptr-targetbytes-as-i32-runs-as-ptr-runbytes-as-i32-selected-as-ptr-selectedbytes-as-i32-selectedcount-as-i32-from-playable-window-dll-symbol-playable-window-gather-specular-normals-returns-i32-src-mq3-renderer-retained-world-batch-ml-389791938"></a>
### gatherSpecularNative

```ml
extern function gatherSpecularNative(source as ptr, sourceBytes as i32, sourceCount as i32, target as ptr, targetBytes as i32, runs as ptr, runBytes as i32, selected as ptr, selectedBytes as i32, selectedCount as i32) from "playable_window.dll" symbol "playable_window_gather_specular_normals" returns i32
```

Gathers selected face runs as 36-byte triangle-normal records after validating all spans and overlap.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `ptr` | — | Read-only packed source records. |
| `sourceBytes` | `i32` | — | Available size of the source buffer in bytes. |
| `sourceCount` | `i32` | — | Number of source records available to the gather operation. |
| `target` | `ptr` | — | Writable destination storage; must not overlap any input range. |
| `targetBytes` | `i32` | — | Writable capacity of the destination buffer in bytes. |
| `runs` | `ptr` | — | Read-only eight-byte face-run records: first source record and record count. |
| `runBytes` | `i32` | — | Size of the per-face first/count table in bytes. |
| `selected` | `ptr` | — | Read-only packed 32-bit face indices, retained in this exact order. |
| `selectedBytes` | `i32` | — | Size of the selected-face index buffer in bytes. |
| `selectedCount` | `i32` | — | Number of 32-bit face indices to gather in selection order. |


**Returns:** Gathered record count; -1 invalid buffers, -2 face index, -3 source span, -4 capacity, or -5 overlap.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L38)

<a id="function-function-mq3-renderer-retained-world-batch-legacy-function-legacy-state-chosen-src-mq3-renderer-retained-world-batch-ml-1374813235"></a>
### legacy

```ml
function legacy(state, chosen)
```

Updates `state.fallbacks` in `mq3.renderer.retained_world_batch.legacy`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.fallbacks`. |
| `chosen` | `dynamic` | — | Record providing `chosen.renderData`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L280)

<a id="function-function-mq3-renderer-retained-world-batch-makestream-function-makestream-state-data-commands-pass-mode-lookup-src-mq3-renderer-retained-world-batch-ml-1970372387"></a>
### makeStream

```ml
function makeStream(state, data, commands, pass, mode, lookup)
```

Builds `mq3.renderer.retained_world_batch.Stream` after updating `firsts[face]`, `counts[face]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.world`, `state.fogCatalog`, `state.skyFlags`. |
| `data` | `dynamic` | — | Record providing `data.triangles`. |
| `commands` | `dynamic` | — | Record providing `commands.count`, `commands.data`. |
| `pass` | `dynamic` | — | Initial value for `mq3.renderer.retained_world_batch.Stream.fullPass`. |
| `mode` | `dynamic` | — | Input tested by `mode==2`. |
| `lookup` | `dynamic` | — | Indexed input read at `triangle.textureIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L140)

<a id="function-function-mq3-renderer-retained-world-batch-refreshfog-function-refreshfog-state-faces-src-mq3-renderer-retained-world-batch-ml-1161668439"></a>
### refreshFog

```ml
function refreshFog(state, faces)
```

Builds `target.sourcePositions[outputIndex]`, `target.fogIndexes[outputIndex]` in `mq3.renderer.retained_world_batch.refreshFog`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.fogStream`, `state.full`, `state.active`. |
| `faces` | `dynamic` | — | Sequence traversed as `face` while producing this result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L255)

<a id="function-function-mq3-renderer-retained-world-batch-refreshlights-function-refreshlights-state-data-src-mq3-renderer-retained-world-batch-ml-1935399517"></a>
### refreshLights

```ml
function refreshLights(state, data)
```

Updates `state.active.dlightBatch.triangles` in `mq3.renderer.retained_world_batch.refreshLights`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.active.dlightBatch.triangles`. |
| `data` | `dynamic` | — | Record providing `data.triangles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L268)

<a id="function-function-mq3-renderer-retained-world-batch-select-function-select-state-chosen-src-mq3-renderer-retained-world-batch-ml-1758893451"></a>
### select

```ml
function select(state, chosen)
```

Updates `state.selections`, `state.faces`, `state.last` in `mq3.renderer.retained_world_batch.select`; returns `batch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.selections`, `state.faces`, `state.last`. |
| `chosen` | `dynamic` | — | Record providing `chosen.selection`, `chosen.renderData`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L311)

<a id="function-function-mq3-renderer-retained-world-batch-stagesources-function-stagesources-stream-faces-fogcatalog-src-mq3-renderer-retained-world-batch-ml-1269340501"></a>
### stageSources

```ml
function stageSources(stream, faces, fogCatalog)
```

Builds `active.fogIndexes`, `active.sourceUvs[outputIndex]`, `active.sourceDeformUvs[outputIndex]`, `active.sourcePositions[outputIndex]`, `active.sourceIndexes[outputIndex]` in `mq3.renderer.retained_world_batch.stageSources`; returns `active`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stream` | `dynamic` | — | Record providing `stream.fullPass`, `stream.activePass`, `stream.draw`, `stream.firsts`, `stream.counts`, `stream.primed`. |
| `faces` | `dynamic` | — | Sequence traversed as `face` while producing this result. |
| `fogCatalog` | `dynamic` | — | Input tested by `fogCatalog!=void`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L232)

<a id="function-function-mq3-renderer-retained-world-batch-stageview-function-stageview-full-commands-src-mq3-renderer-retained-world-batch-ml-441673435"></a>
### stageView

```ml
function stageView(full, commands)
```

Creates a mutable draw-stage view with fresh per-triangle arrays while preserving the full stage's shader configuration.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `full` | `dynamic` | — | Record providing `full.commands`, `full.vertexCache`, `full.specularNormals`, `full.fogAdjustment`, `full.stage`, `full.textureIndex`. |
| `commands` | `dynamic` | — | Record providing `commands.count`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L124)

- [mq3.renderer.retained_world_batch.Stream](Type-mq3-renderer-retained-world-batch-stream-1344965909.md) — struct
<a id="function-function-mq3-renderer-retained-world-batch-unsupported-function-unsupported-material-src-mq3-renderer-retained-world-batch-ml-710349877"></a>
### unsupported

```ml
function unsupported(material)
```

Computes `material!=void and (batches.hasDeform(material.deforms,"autosprite") or batches.hasDeform(material.deforms,"autosprite2"))` for `mq3.renderer.retained_world_batch.unsupported`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `material` | `dynamic` | — | Record providing `material.deforms`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/retained_world_batch.ml#L118)
