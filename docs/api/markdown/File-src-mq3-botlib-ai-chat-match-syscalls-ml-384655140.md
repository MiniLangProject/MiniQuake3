# `src/mq3/botlib/ai_chat_match_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_chat_match_syscalls`](Package-mq3-botlib-ai-chat-match-syscalls-1191163614.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_chat_matches.ml` as `matches` → [src/mq3/botlib/ai_chat_matches.ml](File-src-mq3-botlib-ai-chat-matches-ml-369456329.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-botlib-ai-chat-match-syscalls-dispatch-function-dispatch-state-vm-base-op-src-mq3-botlib-ai-chat-match-syscalls-ml-743112710"></a>
### dispatch

```ml
function dispatch(state, vm, base, op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_match_syscalls.ml#L23)

<a id="function-function-mq3-botlib-ai-chat-match-syscalls-readmatch-function-readmatch-vm-address-src-mq3-botlib-ai-chat-match-syscalls-ml-1007464697"></a>
### readMatch

```ml
function readMatch(vm, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_match_syscalls.ml#L17)

<a id="function-function-mq3-botlib-ai-chat-match-syscalls-signedbyte-function-signedbyte-value-src-mq3-botlib-ai-chat-match-syscalls-ml-676905953"></a>
### signedByte

```ml
function signedByte(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_match_syscalls.ml#L9)

<a id="function-function-mq3-botlib-ai-chat-match-syscalls-writematch-function-writematch-vm-address-match-src-mq3-botlib-ai-chat-match-syscalls-ml-312164104"></a>
### writeMatch

```ml
function writeMatch(vm, address, match)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `match` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_match_syscalls.ml#L10)
