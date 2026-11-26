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

Updates `state.serverId`, `state.connectedPure` during system info `apply`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable system info record/storage; this routine assigns `state.serverId`, `state.connectedPure`. |
| `host` | `dynamic` | — | Record read through `host.cheatResetFn`, `host.loadedPaksFn`, `host.referencedPaksFn`, `host.setCvarFn` and additional values. |
| `systemInfo` | `dynamic` | — | Value used by `state.serverId=textnumbers.atoi(info.value(systemInfo,"sv_serverid"))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/system_info.ml#L39)

- [mq3.client.system_info.Binding](Type-mq3-client-system-info-binding-1433800738.md) — struct
<a id="function-function-mq3-client-system-info-create-function-create-src-mq3-client-system-info-ml-122528206"></a>
### create

```ml
function create()
```

Creates a `mq3.client.system_info.State` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/system_info.ml#L18)

<a id="function-function-mq3-client-system-info-gamestatechanged-function-gamestatechanged-gamestate-src-mq3-client-system-info-ml-1956102561"></a>
### gamestateChanged

```ml
function gamestateChanged(gameState)
```

Calls `mq3.client.system_info.apply`, `mq3.client.gamestate.configString` from system info `gamestateChanged`. The final path returns `apply(binding.state,binding.services,gamestate.configString(gameState,1))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gameState` | `dynamic` | — | Record read through `gameState.context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/system_info.ml#L60)

<a id="function-function-mq3-client-system-info-install-function-install-gamestate-state-host-src-mq3-client-system-info-ml-673591242"></a>
### install

```ml
function install(gameState, state, host)
```

Updates `gameState.context`, `gameState.systemInfoFn` during system info `install`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gameState` | `dynamic` | — | Mutable system info record/storage; this routine assigns `gameState.context`, `gameState.systemInfoFn`. |
| `state` | `dynamic` | — | Shared system info state passed to the helper calls in `install`. |
| `host` | `dynamic` | — | host record passed to the system info helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/system_info.ml#L70)

<a id="function-function-mq3-client-system-info-pairs-function-pairs-systeminfo-src-mq3-client-system-info-ml-1618875903"></a>
### pairs

```ml
function pairs(systemInfo)
```

Calls `std.string.split` from system info `pairs`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `systemInfo` | `dynamic` | — | Value used by `fields=strings.split(systemInfo,"\\\\")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/system_info.ml#L24)

<a id="function-function-mq3-client-system-info-services-function-services-src-mq3-client-system-info-ml-354141090"></a>
### services

```ml
function services()
```

Creates a `mq3.client.system_info.Services` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/system_info.ml#L20)

- [mq3.client.system_info.Services](Type-mq3-client-system-info-services-378977525.md) — struct
- [mq3.client.system_info.State](Type-mq3-client-system-info-state-965689014.md) — struct
