# `src/mq3/client/key_binding_dispatch.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.key_binding_dispatch`](Package-mq3-client-key-binding-dispatch-275330337.md)

Reachable from entry: **yes**

## Imports

- `std/string.ml` as `bindingStrings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.key_binding_dispatch.Command](Type-mq3-client-key-binding-dispatch-command-2053604602.md) — struct
<a id="function-function-mq3-client-key-binding-dispatch-commands-function-commands-binding-key-down-time-src-mq3-client-key-binding-dispatch-ml-1529206747"></a>
### commands

```ml
function commands(binding, key, down, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `binding` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/key_binding_dispatch.ml#L30)

<a id="function-function-mq3-client-key-binding-dispatch-emit-function-emit-segment-key-time-down-src-mq3-client-key-binding-dispatch-ml-1243351783"></a>
### emit

```ml
function emit(segment, key, time, down)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `segment` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/key_binding_dispatch.ml#L10)

<a id="function-function-mq3-client-key-binding-dispatch-segments-function-segments-binding-src-mq3-client-key-binding-dispatch-ml-1121134409"></a>
### segments

```ml
function segments(binding)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `binding` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/key_binding_dispatch.ml#L18)
