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

Apply `mq3.vm.syscall_common.readString`, `mq3.vm.syscall_common.argument` and `mq3.botlib.ai_chat_matches.stringContains` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat matches state; accesses `templates`. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_match_syscalls.ml#L37)

<a id="function-function-mq3-botlib-ai-chat-match-syscalls-readmatch-function-readmatch-vm-address-src-mq3-botlib-ai-chat-match-syscalls-ml-1007464697"></a>
### readMatch

```ml
function readMatch(vm, address)
```

Build the `mq3.botlib.ai_chat_matches.Match` result for `readMatch`. Return paths include `matches.Match(text,n.readI32(vm.data,at+256),n.readI32(vm.data,at+260),offsets,lengths)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_match_syscalls.ml#L26)

<a id="function-function-mq3-botlib-ai-chat-match-syscalls-signedbyte-function-signedbyte-value-src-mq3-botlib-ai-chat-match-syscalls-ml-676905953"></a>
### signedByte

```ml
function signedByte(value)
```

Interpret an unsigned byte value as a signed eight-bit match offset.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value-256`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_match_syscalls.ml#L11)

<a id="function-function-mq3-botlib-ai-chat-match-syscalls-writematch-function-writematch-vm-address-match-src-mq3-botlib-ai-chat-match-syscalls-ml-312164104"></a>
### writeMatch

```ml
function writeMatch(vm, address, match)
```

Set `vm.data[at+index]` to `0` and `vm.data[at+264+index*8]` to `match.offsets[index]&255` in `mq3.botlib.ai_chat_match_syscalls.writeMatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm record; accesses `data`. May update `vm.data[at+index]` and `vm.data[at+264+index*8]` in place. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `match` | `dynamic` | — | Parsed match record; accesses `string`, `type`, `subtype`, `offsets` and `lengths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_match_syscalls.ml#L16)
