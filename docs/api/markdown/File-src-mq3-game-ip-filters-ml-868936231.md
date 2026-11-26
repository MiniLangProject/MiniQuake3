# `src/mq3/game/ip_filters.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.ip_filters`](Package-mq3-game-ip-filters-292189559.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/command_args.ml` as `commandArgs` → [src/mq3/game/command_args.ml](File-src-mq3-game-command-args-ml-1980826409.md)
- `mq3/shared/info.ml` as `infoStrings` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

<a id="function-function-mq3-game-ip-filters-addcommand-function-addcommand-level-argv-src-mq3-game-ip-filters-ml-1187665132"></a>
### addCommand

```ml
function addCommand(level, argv)
```

Apply `mq3.game.ip_filters.filterPrint`, `mq3.game.ip_filters.addIP` and `mq3.game.command_args.argument` while evaluating `addCommand`. Return paths include `addIP(level,commandArgs.argument(argv,1,1024))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L243)

<a id="function-function-mq3-game-ip-filters-addip-function-addip-level-text-src-mq3-game-ip-filters-ml-322498025"></a>
### addIP

```ml
function addIP(level, text)
```

Apply `mq3.game.ip_filters.get`, `mq3.game.ip_filters.filterCount` and `mq3.game.ip_filters.filterPrint` while evaluating `addIP`. Return paths include `updateBans(level)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `ipFilters`. May update `level.ipFilters` in place. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L151)

<a id="function-function-mq3-game-ip-filters-banbytes-function-banbytes-level-src-mq3-game-ip-filters-ml-1400601874"></a>
### banBytes

```ml
function banBytes(level)
```

Apply `mq3.game.ip_filters.get`, `mq3.game.ip_filters.filterVm` and `mq3.shared.info.textBytes` while evaluating `banBytes`. Return paths include `state.banBuffer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `ipFilters`. May update `level.ipFilters` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L196)

<a id="function-function-mq3-game-ip-filters-bindvm-function-bindvm-level-banvm-filterbanvm-src-mq3-game-ip-filters-ml-611841668"></a>
### bindVm

```ml
function bindVm(level, banVm, filterBanVm)
```

Apply `mq3.game.ip_filters.get` while evaluating `bindVm`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `ipFilters`. May update `level.ipFilters` in place. |
| `banVm` | `dynamic` | — | Value used by `bindVm` in `state.banVm = banVm`. |
| `filterBanVm` | `dynamic` | — | Value used by `bindVm` in `state.filterBanVm = filterBanVm`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L54)

- [mq3.game.ip_filters.Filter](Type-mq3-game-ip-filters-filter-581928805.md) — struct
<a id="function-function-mq3-game-ip-filters-filterbyte-function-filterbyte-data-index-src-mq3-game-ip-filters-ml-1005770952"></a>
### filterByte

```ml
function filterByte(data, index)
```

Read an IP-filter byte, using zero when the requested index lies beyond the supplied data.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L92)

<a id="function-function-mq3-game-ip-filters-filtercount-function-filtercount-state-src-mq3-game-ip-filters-ml-1698448311"></a>
### filterCount

```ml
function filterCount(state)
```

Validate and return the number of active IP-filter entries within the fixed filter capacity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Ip filters state; accesses `count`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L85)

<a id="function-function-mq3-game-ip-filters-filterpacket-function-filterpacket-level-address-src-mq3-game-ip-filters-ml-1951513808"></a>
### filterPacket

```ml
function filterPacket(level, address)
```

Apply `mq3.shared.info.textBytes`, `mq3.game.ip_filters.filterByte` and `mq3.game.ip_filters.get` while evaluating `filterPacket`. Return paths include `filterVm(level,"g_filterBan").integer == 0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `ipFilters`. May update `level.ipFilters` in place. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L167)

<a id="function-function-mq3-game-ip-filters-filterprint-function-filterprint-level-text-src-mq3-game-ip-filters-ml-1325422087"></a>
### filterPrint

```ml
function filterPrint(level, text)
```

Use `level.gamePrintFn` to perform `filterPrint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L76)

<a id="function-function-mq3-game-ip-filters-filtervm-function-filtervm-level-name-src-mq3-game-ip-filters-ml-668665249"></a>
### filterVm

```ml
function filterVm(level, name)
```

Apply `mq3.game.ip_filters.get` while evaluating `filterVm`. Return paths include `vm`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gameCvars`. |
| `name` | `dynamic` | — | Lookup text matched against `row.vmName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L61)

<a id="function-function-mq3-game-ip-filters-get-function-get-level-src-mq3-game-ip-filters-ml-1746379526"></a>
### get

```ml
function get(level)
```

Set `level.ipFilters` to `State(filters,0,bytes(256,0),void,void,void,0,"",0)` in `mq3.game.ip_filters.get`. Return paths include `level.ipFilters`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `ipFilters`. May update `level.ipFilters` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L40)

<a id="function-function-mq3-game-ip-filters-processbans-function-processbans-level-src-mq3-game-ip-filters-ml-931168808"></a>
### processBans

```ml
function processBans(level)
```

Apply `mq3.game.ip_filters.get`, `mq3.game.ip_filters.banBytes` and `mq3.game.ip_filters.filterVm` while evaluating `processBans`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `ipFilters`. May update `level.ipFilters` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L213)

<a id="function-function-mq3-game-ip-filters-removecommand-function-removecommand-level-argv-src-mq3-game-ip-filters-ml-881617334"></a>
### removeCommand

```ml
function removeCommand(level, argv)
```

Apply `mq3.game.ip_filters.filterPrint`, `mq3.game.command_args.argument` and `mq3.game.ip_filters.stringToFilter` while evaluating `removeCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L250)

- [mq3.game.ip_filters.State](Type-mq3-game-ip-filters-state-1800235932.md) — struct
<a id="function-function-mq3-game-ip-filters-stringtofilter-function-stringtofilter-level-text-filter-src-mq3-game-ip-filters-ml-1744175447"></a>
### stringToFilter

```ml
function stringToFilter(level, text, filter)
```

Set `filter.mask` to `n.u32(mask)` and `filter.compare` to `n.u32(compare)` in `mq3.game.ip_filters.stringToFilter`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `filter` | `dynamic` | — | Filter record; accesses `mask` and `compare`. May update `filter.mask` and `filter.compare` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L100)

<a id="function-function-mq3-game-ip-filters-updatebans-function-updatebans-level-src-mq3-game-ip-filters-ml-2112014634"></a>
### updateBans

```ml
function updateBans(level)
```

Use `level.cvarSetFn` to perform `updateBans`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cvarSetFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L130)
