# `src/mq3/client/ui_sp_arena.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_sp_arena`](Package-mq3-client-ui-sp-arena-1777836015.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/textnumbers.ml` as `textNumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/info.ml` as `arenaInfo` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-client-ui-sp-arena-arenas-per-tier-const-arenas-per-tier-4-src-mq3-client-ui-sp-arena-ml-538230663"></a>
### ARENAS_PER_TIER

```ml
const ARENAS_PER_TIER = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sp_arena.ml#L10)

<a id="constant-constant-mq3-client-ui-sp-arena-exec-append-const-exec-append-2-src-mq3-client-ui-sp-arena-ml-1121505725"></a>
### EXEC_APPEND

```ml
const EXEC_APPEND = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sp_arena.ml#L11)

- [mq3.client.ui_sp_arena.Result](Type-mq3-client-ui-sp-arena-result-1369793754.md) — struct
<a id="function-function-mq3-client-ui-sp-arena-services-function-services-context-variablevaluefn-setvaluefn-numtiersfn-executetextfn-src-mq3-client-ui-sp-arena-ml-1077336476"></a>
### services

```ml
function services(context, variableValueFn, setValueFn, numTiersFn, executeTextFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `variableValueFn` | `dynamic` | — |  |
| `setValueFn` | `dynamic` | — |  |
| `numTiersFn` | `dynamic` | — |  |
| `executeTextFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sp_arena.ml#L16)

- [mq3.client.ui_sp_arena.Services](Type-mq3-client-ui-sp-arena-services-942175455.md) — struct
<a id="function-function-mq3-client-ui-sp-arena-start-function-start-host-infotext-src-mq3-client-ui-sp-arena-ml-934303825"></a>
### start

```ml
function start(host, infoText)
```

UI_SPArena_Start. Host callbacks are the four original trap/UI boundaries.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `infoText` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sp_arena.ml#L21)
