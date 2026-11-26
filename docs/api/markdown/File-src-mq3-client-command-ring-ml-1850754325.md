# `src/mq3/client/command_ring.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.command_ring`](Package-mq3-client-command-ring-369746593.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-client-command-ring-advance-function-advance-connectionstate-frametime-oldframetime-commandnumber-src-mq3-client-command-ring-ml-929935532"></a>
### advance

```ml
function advance(connectionState, frameTime, oldFrameTime, commandNumber)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connectionState` | `dynamic` | — |  |
| `frameTime` | `dynamic` | — |  |
| `oldFrameTime` | `dynamic` | — |  |
| `commandNumber` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/command_ring.ml#L16)

- [mq3.client.command_ring.AdvanceResult](Type-mq3-client-command-ring-advanceresult-836658100.md) — struct
<a id="constant-constant-mq3-client-command-ring-ca-primed-const-ca-primed-7-src-mq3-client-command-ring-ml-40888798"></a>
### CA_PRIMED

```ml
const CA_PRIMED = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/command_ring.ml#L8)

<a id="function-function-mq3-client-command-ring-clear-function-clear-commands-src-mq3-client-command-ring-ml-1599684594"></a>
### clear

```ml
function clear(commands)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/command_ring.ml#L37)

<a id="constant-constant-mq3-client-command-ring-cmd-backup-const-cmd-backup-64-src-mq3-client-command-ring-ml-1447291733"></a>
### CMD_BACKUP

```ml
const CMD_BACKUP = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/command_ring.ml#L9)

<a id="constant-constant-mq3-client-command-ring-cmd-mask-const-cmd-mask-63-src-mq3-client-command-ring-ml-1179558806"></a>
### CMD_MASK

```ml
const CMD_MASK = 63
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/command_ring.ml#L10)

<a id="function-function-mq3-client-command-ring-create-function-create-src-mq3-client-command-ring-ml-1544894542"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/command_ring.ml#L14)

<a id="function-function-mq3-client-command-ring-get-function-get-commands-currentnumber-commandnumber-src-mq3-client-command-ring-ml-1934642780"></a>
### get

```ml
function get(commands, currentNumber, commandNumber)
```

A future command is a protocol/engine error in Baseq3. A command that has already wrapped out of the 64-entry ring is an ordinary cache miss.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — |  |
| `currentNumber` | `dynamic` | — |  |
| `commandNumber` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/command_ring.ml#L30)

<a id="function-function-mq3-client-command-ring-store-function-store-commands-commandnumber-command-src-mq3-client-command-ring-ml-2094089815"></a>
### store

```ml
function store(commands, commandNumber, command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — |  |
| `commandNumber` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/command_ring.ml#L23)
