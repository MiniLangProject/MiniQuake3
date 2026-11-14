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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L194)

<a id="function-function-mq3-game-ip-filters-addip-function-addip-level-text-src-mq3-game-ip-filters-ml-322498025"></a>
### addIP

```ml
function addIP(level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L112)

<a id="function-function-mq3-game-ip-filters-banbytes-function-banbytes-level-src-mq3-game-ip-filters-ml-1400601874"></a>
### banBytes

```ml
function banBytes(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L152)

<a id="function-function-mq3-game-ip-filters-bindvm-function-bindvm-level-banvm-filterbanvm-src-mq3-game-ip-filters-ml-611841668"></a>
### bindVm

```ml
function bindVm(level, banVm, filterBanVm)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `banVm` | `dynamic` | — |  |
| `filterBanVm` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L35)

- [mq3.game.ip_filters.Filter](Type-mq3-game-ip-filters-filter-581928805.md) — struct
<a id="function-function-mq3-game-ip-filters-filterbyte-function-filterbyte-data-index-src-mq3-game-ip-filters-ml-1005770952"></a>
### filterByte

```ml
function filterByte(data, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L62)

<a id="function-function-mq3-game-ip-filters-filtercount-function-filtercount-state-src-mq3-game-ip-filters-ml-1698448311"></a>
### filterCount

```ml
function filterCount(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L58)

<a id="function-function-mq3-game-ip-filters-filterpacket-function-filterpacket-level-address-src-mq3-game-ip-filters-ml-1951513808"></a>
### filterPacket

```ml
function filterPacket(level, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L125)

<a id="function-function-mq3-game-ip-filters-filterprint-function-filterprint-level-text-src-mq3-game-ip-filters-ml-1325422087"></a>
### filterPrint

```ml
function filterPrint(level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L51)

<a id="function-function-mq3-game-ip-filters-filtervm-function-filtervm-level-name-src-mq3-game-ip-filters-ml-668665249"></a>
### filterVm

```ml
function filterVm(level, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L39)

<a id="function-function-mq3-game-ip-filters-get-function-get-level-src-mq3-game-ip-filters-ml-1746379526"></a>
### get

```ml
function get(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L25)

<a id="function-function-mq3-game-ip-filters-processbans-function-processbans-level-src-mq3-game-ip-filters-ml-931168808"></a>
### processBans

```ml
function processBans(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L167)

<a id="function-function-mq3-game-ip-filters-removecommand-function-removecommand-level-argv-src-mq3-game-ip-filters-ml-881617334"></a>
### removeCommand

```ml
function removeCommand(level, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L198)

- [mq3.game.ip_filters.State](Type-mq3-game-ip-filters-state-1800235932.md) — struct
<a id="function-function-mq3-game-ip-filters-stringtofilter-function-stringtofilter-level-text-filter-src-mq3-game-ip-filters-ml-1744175447"></a>
### stringToFilter

```ml
function stringToFilter(level, text, filter)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `filter` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L66)

<a id="function-function-mq3-game-ip-filters-updatebans-function-updatebans-level-src-mq3-game-ip-filters-ml-2112014634"></a>
### updateBans

```ml
function updateBans(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L94)
