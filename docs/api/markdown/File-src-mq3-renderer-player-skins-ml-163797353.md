# `src/mq3/renderer/player_skins.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.player_skins`](Package-mq3-renderer-player-skins-912100497.md)

Reachable from entry: **yes**

## Imports

- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-player-skins-addunique-function-addunique-names-skin-src-mq3-renderer-player-skins-ml-1675173217"></a>
### addUnique

```ml
function addUnique(names, skin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `names` | `dynamic` | — |  |
| `skin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L94)

- [mq3.renderer.player_skins.Binding](Type-mq3-renderer-player-skins-binding-1155315162.md) — struct
<a id="function-function-mq3-renderer-player-skins-fail-function-fail-message-src-mq3-renderer-player-skins-ml-1246416311"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L19)

<a id="function-function-mq3-renderer-player-skins-load-function-load-archive-path-src-mq3-renderer-player-skins-ml-1369817137"></a>
### load

```ml
function load(archive, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L68)

<a id="function-function-mq3-renderer-player-skins-loadresolved-function-loadresolved-archive-path-shaderindex-src-mq3-renderer-player-skins-ml-380292910"></a>
### loadResolved

```ml
function loadResolved(archive, path, shaderIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |
| `shaderIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L89)

<a id="function-function-mq3-renderer-player-skins-loadsargedefault-function-loadsargedefault-archive-src-mq3-renderer-player-skins-ml-1467851746"></a>
### loadSargeDefault

```ml
function loadSargeDefault(archive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L103)

- [mq3.renderer.player_skins.Mapping](Type-mq3-renderer-player-skins-mapping-1412834829.md) — struct
<a id="constant-constant-mq3-renderer-player-skins-max-qpath-const-max-qpath-64-src-mq3-renderer-player-skins-ml-1582895865"></a>
### MAX_QPATH

```ml
const MAX_QPATH = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L8)

<a id="function-function-mq3-renderer-player-skins-parse-function-parse-text-src-mq3-renderer-player-skins-ml-355326699"></a>
### parse

```ml
function parse(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L51)

<a id="function-function-mq3-renderer-player-skins-parseline-function-parseline-data-first-last-linenumber-mappings-tags-src-mq3-renderer-player-skins-ml-649129437"></a>
### parseLine

```ml
function parseLine(data, first, last, lineNumber, mappings, tags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |
| `last` | `dynamic` | — |  |
| `lineNumber` | `dynamic` | — |  |
| `mappings` | `dynamic` | — |  |
| `tags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L27)

<a id="function-function-mq3-renderer-player-skins-resolve-function-resolve-archive-skin-shaderindex-src-mq3-renderer-player-skins-ml-1104093404"></a>
### resolve

```ml
function resolve(archive, skin, shaderIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `skin` | `dynamic` | — |  |
| `shaderIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L75)

- [mq3.renderer.player_skins.ResolvedSkin](Type-mq3-renderer-player-skins-resolvedskin-455522992.md) — struct
<a id="constant-constant-mq3-renderer-player-skins-sarge-head-const-sarge-head-models-players-sarge-head-default-skin-src-mq3-renderer-player-skins-ml-536444845"></a>
### SARGE_HEAD

```ml
const SARGE_HEAD = "models/players/sarge/head_default.skin"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L11)

<a id="constant-constant-mq3-renderer-player-skins-sarge-lower-const-sarge-lower-models-players-sarge-lower-default-skin-src-mq3-renderer-player-skins-ml-355355752"></a>
### SARGE_LOWER

```ml
const SARGE_LOWER = "models/players/sarge/lower_default.skin"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L9)

<a id="constant-constant-mq3-renderer-player-skins-sarge-upper-const-sarge-upper-models-players-sarge-upper-default-skin-src-mq3-renderer-player-skins-ml-395690911"></a>
### SARGE_UPPER

```ml
const SARGE_UPPER = "models/players/sarge/upper_default.skin"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L10)

- [mq3.renderer.player_skins.SargeDefault](Type-mq3-renderer-player-skins-sargedefault-1698247702.md) — struct
- [mq3.renderer.player_skins.Skin](Type-mq3-renderer-player-skins-skin-223438000.md) — struct
<a id="function-function-mq3-renderer-player-skins-textrange-function-textrange-data-first-last-src-mq3-renderer-player-skins-ml-488729238"></a>
### textRange

```ml
function textRange(data, first, last)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |
| `last` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L21)
