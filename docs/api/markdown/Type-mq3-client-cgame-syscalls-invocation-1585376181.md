# `mq3.client.cgame_syscalls.Invocation`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-syscalls-ml-1820570659.md)

<a id="struct-struct-mq3-client-cgame-syscalls-invocation-struct-invocation-src-mq3-client-cgame-syscalls-ml-460268403"></a>
## Invocation

```ml
struct Invocation
```

Stores client game syscalls invocation record, including `opcode`, `arguments`, `result`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_syscalls.ml#L203)

## Members

<a id="field-field-mq3-client-cgame-syscalls-invocation-arguments-arguments-src-mq3-client-cgame-syscalls-ml-948905705"></a>
### arguments

```ml
arguments
```

When constructing this record, `invoke` supplies `arguments` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_syscalls.ml#L207)

<a id="field-field-mq3-client-cgame-syscalls-invocation-dispatched-dispatched-src-mq3-client-cgame-syscalls-ml-122831939"></a>
### dispatched

```ml
dispatched
```

True when this recorded CGame syscall invocation is dispatched through the native host gateway.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_syscalls.ml#L211)

<a id="field-field-mq3-client-cgame-syscalls-invocation-opcode-opcode-src-mq3-client-cgame-syscalls-ml-644628617"></a>
### opcode

```ml
opcode
```

When constructing this record, `invoke` supplies `opcode` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_syscalls.ml#L205)

<a id="field-field-mq3-client-cgame-syscalls-invocation-result-result-src-mq3-client-cgame-syscalls-ml-955114979"></a>
### result

```ml
result
```

When constructing this record, `invoke` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_syscalls.ml#L209)
