# `src/mq3/client/system_info.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.system_info`](Package-mq3-client-system-info-1197875913.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/gamestate.ml` as `gamestate` → [src/mq3/client/gamestate.ml](File-src-mq3-client-gamestate-ml-1690167636.md)
- `mq3/compat/textnumbers.ml` as `textnumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-system-info-apply-function-apply-state-host-systeminfo-src-mq3-client-system-info-ml-1272409782"></a>
### apply

```ml
function apply(state, host, systemInfo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `systemInfo` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/system_info.ml#L28)

- [mq3.client.system_info.Binding](Type-mq3-client-system-info-binding-1433800738.md) — struct
<a id="function-function-mq3-client-system-info-create-function-create-src-mq3-client-system-info-ml-122528206"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/system_info.ml#L14)

<a id="function-function-mq3-client-system-info-gamestatechanged-function-gamestatechanged-gamestate-src-mq3-client-system-info-ml-1956102561"></a>
### gamestateChanged

```ml
function gamestateChanged(gameState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gameState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/system_info.ml#L47)

<a id="function-function-mq3-client-system-info-install-function-install-gamestate-state-host-src-mq3-client-system-info-ml-673591242"></a>
### install

```ml
function install(gameState, state, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gameState` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/system_info.ml#L53)

<a id="function-function-mq3-client-system-info-pairs-function-pairs-systeminfo-src-mq3-client-system-info-ml-1618875903"></a>
### pairs

```ml
function pairs(systemInfo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `systemInfo` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/system_info.ml#L17)

<a id="function-function-mq3-client-system-info-services-function-services-src-mq3-client-system-info-ml-354141090"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/system_info.ml#L15)

- [mq3.client.system_info.Services](Type-mq3-client-system-info-services-378977525.md) — struct
- [mq3.client.system_info.State](Type-mq3-client-system-info-state-965689014.md) — struct
