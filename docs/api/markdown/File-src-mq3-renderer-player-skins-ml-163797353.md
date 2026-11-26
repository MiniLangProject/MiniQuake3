# `src/mq3/renderer/player_skins.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.player_skins`](Package-mq3-renderer-player-skins-912100497.md)

Reachable from entry: **yes**

## Imports

- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-player-skins-addunique-function-addunique-names-skin-src-mq3-renderer-player-skins-ml-1675173217"></a>
### addUnique

```ml
function addUnique(names, skin)
```

Computes `addUnique` from `names+[binding.imageName]` using `stringEqualsIgnoreCaseAscii`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `names` | `dynamic` | — | Sequence traversed as `name` while producing this result. |
| `skin` | `dynamic` | — | Record providing `skin.bindings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L171)

- [mq3.renderer.player_skins.Binding](Type-mq3-renderer-player-skins-binding-1155315162.md) — struct
<a id="function-function-mq3-renderer-player-skins-fail-function-fail-message-src-mq3-renderer-player-skins-ml-1246416311"></a>
### fail

```ml
function fail(message)
```

Creates error `7520` with message `"player skin: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7520,"player skin: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L69)

<a id="function-function-mq3-renderer-player-skins-load-function-load-archive-path-src-mq3-renderer-player-skins-ml-1369817137"></a>
### load

```ml
function load(archive, path)
```

Builds `skin.path` in `mq3.renderer.player_skins.load`; returns `skin`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Argument 1 supplied to `mq3.format.pk3.read`. |
| `path` | `dynamic` | — | Value assigned to `skin.path`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L134)

<a id="function-function-mq3-renderer-player-skins-loadresolved-function-loadresolved-archive-path-shaderindex-src-mq3-renderer-player-skins-ml-380292910"></a>
### loadResolved

```ml
function loadResolved(archive, path, shaderIndex)
```

Returns `resolve(archive,skin,shaderIndex)` from `mq3.renderer.player_skins.loadResolved`; earlier branches return `skin`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Value forwarded as `archive` to `mq3.renderer.player_skins.load`. |
| `path` | `dynamic` | — | Value forwarded as `path` to `mq3.renderer.player_skins.load`. |
| `shaderIndex` | `dynamic` | — | Value forwarded as `shaderIndex` to `mq3.renderer.player_skins.resolve`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L163)

<a id="function-function-mq3-renderer-player-skins-loadsargedefault-function-loadsargedefault-archive-src-mq3-renderer-player-skins-ml-1467851746"></a>
### loadSargeDefault

```ml
function loadSargeDefault(archive)
```

Builds `mq3.renderer.player_skins.SargeDefault` using `mq3.renderer.playable_materials.buildScriptIndex`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_materials.buildScriptIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L182)

- [mq3.renderer.player_skins.Mapping](Type-mq3-renderer-player-skins-mapping-1412834829.md) — struct
<a id="constant-constant-mq3-renderer-player-skins-max-qpath-const-max-qpath-64-src-mq3-renderer-player-skins-ml-1582895865"></a>
### MAX_QPATH

```ml
const MAX_QPATH = 64
```

Capacity of a Quake virtual-path buffer, including the terminating byte in the native ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L9)

<a id="function-function-mq3-renderer-player-skins-parse-function-parse-text-src-mq3-renderer-player-skins-ml-355326699"></a>
### parse

```ml
function parse(text)
```

Builds `mq3.renderer.player_skins.Skin` for `mq3.renderer.player_skins.parse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Input tested by `text==void`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L114)

<a id="function-function-mq3-renderer-player-skins-parseline-function-parseline-data-first-last-linenumber-mappings-tags-src-mq3-renderer-player-skins-ml-649129437"></a>
### parseLine

```ml
function parseLine(data, first, last, lineNumber, mappings, tags)
```

Computes `parseLine` from `[mappings+[Mapping(surface,shaderName)],tags]` using `mq3.renderer.player_skins.textRange`, `std.string.startsWith`, `std.string.toLowerAscii`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value forwarded as `data` to `mq3.renderer.player_skins.textRange`. |
| `first` | `dynamic` | — | Value forwarded as `first` to `mq3.renderer.player_skins.textRange`. |
| `last` | `dynamic` | — | Value forwarded as `last` to `mq3.renderer.player_skins.textRange`. |
| `lineNumber` | `dynamic` | — | Input tested by `comma<0`. |
| `mappings` | `dynamic` | — | Input tested by `first==last`. |
| `tags` | `dynamic` | — | Input tested by `first==last`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L88)

<a id="function-function-mq3-renderer-player-skins-resolve-function-resolve-archive-skin-shaderindex-src-mq3-renderer-player-skins-ml-1104093404"></a>
### resolve

```ml
function resolve(archive, skin, shaderIndex)
```

Builds `mq3.renderer.player_skins.ResolvedSkin` using `mq3.renderer.playable_materials.mappedImageName`, `mq3.renderer.playable_materials.loadImage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_materials.loadImage`. |
| `skin` | `dynamic` | — | Record providing `skin.mappings`, `skin.path`, `skin.tags`. |
| `shaderIndex` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_materials.mappedImageName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L145)

- [mq3.renderer.player_skins.ResolvedSkin](Type-mq3-renderer-player-skins-resolvedskin-455522992.md) — struct
<a id="constant-constant-mq3-renderer-player-skins-sarge-head-const-sarge-head-models-players-sarge-head-default-skin-src-mq3-renderer-player-skins-ml-536444845"></a>
### SARGE_HEAD

```ml
const SARGE_HEAD = "models/players/sarge/head_default.skin"
```

Default virtual path of the Sarge head MD3 model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L15)

<a id="constant-constant-mq3-renderer-player-skins-sarge-lower-const-sarge-lower-models-players-sarge-lower-default-skin-src-mq3-renderer-player-skins-ml-355355752"></a>
### SARGE_LOWER

```ml
const SARGE_LOWER = "models/players/sarge/lower_default.skin"
```

Default virtual path of the Sarge lower-body MD3 model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L11)

<a id="constant-constant-mq3-renderer-player-skins-sarge-upper-const-sarge-upper-models-players-sarge-upper-default-skin-src-mq3-renderer-player-skins-ml-395690911"></a>
### SARGE_UPPER

```ml
const SARGE_UPPER = "models/players/sarge/upper_default.skin"
```

Default virtual path of the Sarge upper-body MD3 model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L13)

- [mq3.renderer.player_skins.SargeDefault](Type-mq3-renderer-player-skins-sargedefault-1698247702.md) — struct
- [mq3.renderer.player_skins.Skin](Type-mq3-renderer-player-skins-skin-223438000.md) — struct
<a id="function-function-mq3-renderer-player-skins-textrange-function-textrange-data-first-last-src-mq3-renderer-player-skins-ml-488729238"></a>
### textRange

```ml
function textRange(data, first, last)
```

Returns `decode(slice(data,first,last-first))` from `mq3.renderer.player_skins.textRange`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 supplied to `slice`. |
| `first` | `dynamic` | — | Argument 2 supplied to `slice`. |
| `last` | `dynamic` | — | Input used by `while first<last and data[first]<=32 first=first+1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_skins.ml#L75)
