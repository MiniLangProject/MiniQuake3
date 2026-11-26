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

Calls `mq3.client.command_ring.AdvanceResult`, `mq3.compat.numeric.i32` from command ring `advance`. The final path returns `AdvanceResult(true,msec,frameTime,number,number&CMD_MASK)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connectionState` | `dynamic` | — | Value used by `if connectionState<CA_PRIMED then return AdvanceResult(false,0,oldFrameTime,commandNumber,-1) end if`. |
| `frameTime` | `dynamic` | — | Value used by `msec=n.i32(frameTime-oldFrameTime)`. |
| `oldFrameTime` | `dynamic` | — | Value used by `if connectionState<CA_PRIMED then return AdvanceResult(false,0,oldFrameTime,commandNumber,-1) end if`. |
| `commandNumber` | `dynamic` | — | Value used by `if connectionState<CA_PRIMED then return AdvanceResult(false,0,oldFrameTime,commandNumber,-1) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/command_ring.ml#L37)

- [mq3.client.command_ring.AdvanceResult](Type-mq3-client-command-ring-advanceresult-836658100.md) — struct
<a id="constant-constant-mq3-client-command-ring-ca-primed-const-ca-primed-7-src-mq3-client-command-ring-ml-40888798"></a>
### CA_PRIMED

```ml
const CA_PRIMED = 7
```

Client connection state with game state loaded, awaiting a playable snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/command_ring.ml#L9)

<a id="function-function-mq3-client-command-ring-clear-function-clear-commands-src-mq3-client-command-ring-ml-1599684594"></a>
### clear

```ml
function clear(commands)
```

Updates `commands[index]` during command ring `clear`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — | Mutable sequence; this routine writes `commands[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/command_ring.ml#L67)

<a id="constant-constant-mq3-client-command-ring-cmd-backup-const-cmd-backup-64-src-mq3-client-command-ring-ml-1447291733"></a>
### CMD_BACKUP

```ml
const CMD_BACKUP = 64
```

Number of recent user commands retained in the command-history ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/command_ring.ml#L11)

<a id="constant-constant-mq3-client-command-ring-cmd-mask-const-cmd-mask-63-src-mq3-client-command-ring-ml-1179558806"></a>
### CMD_MASK

```ml
const CMD_MASK = 63
```

Mask that maps a user-command sequence number into the command-history ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/command_ring.ml#L13)

<a id="function-function-mq3-client-command-ring-create-function-create-src-mq3-client-command-ring-ml-1544894542"></a>
### create

```ml
function create()
```

Creates an array from `CMD_BACKUP, void` for command ring `create`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/command_ring.ml#L30)

<a id="function-function-mq3-client-command-ring-get-function-get-commands-currentnumber-commandnumber-src-mq3-client-command-ring-ml-1934642780"></a>
### get

```ml
function get(commands, currentNumber, commandNumber)
```

A future command is a protocol/engine error in Baseq3. A command that has already wrapped out of the 64-entry ring is an ordinary cache miss.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — | Sequence read at `commands[commandNumber&CMD_MASK]`. |
| `currentNumber` | `dynamic` | — | Value used by `if commandNumber>currentNumber then return error(7730,"client command ring: future command") end if`. |
| `commandNumber` | `dynamic` | — | Value used by `if commandNumber>currentNumber then return error(7730,"client command ring: future command") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/command_ring.ml#L58)

<a id="function-function-mq3-client-command-ring-store-function-store-commands-commandnumber-command-src-mq3-client-command-ring-ml-2094089815"></a>
### store

```ml
function store(commands, commandNumber, command)
```

Updates `commands[commandNumber&CMD_MASK]` during command ring `store`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — | Mutable sequence; this routine writes `commands[commandNumber&CMD_MASK]`. |
| `commandNumber` | `dynamic` | — | Value used by `commands[commandNumber&CMD_MASK]=command`. |
| `command` | `dynamic` | — | Value used by `commands[commandNumber&CMD_MASK]=command`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/command_ring.ml#L48)
