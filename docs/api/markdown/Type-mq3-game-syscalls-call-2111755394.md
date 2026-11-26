# `mq3.game.syscalls.Call`

[Home](README.md) · [Source file](File-src-mq3-game-syscalls-ml-1705577754.md)

<a id="struct-struct-mq3-game-syscalls-call-struct-call-src-mq3-game-syscalls-ml-1605655533"></a>
## Call

```ml
struct Call
```

`Call` record for syscalls, containing `opcode`, `arguments` and `result`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/syscalls.ml#L9)

## Members

<a id="field-field-mq3-game-syscalls-call-arguments-arguments-src-mq3-game-syscalls-ml-600939137"></a>
### arguments

```ml
arguments
```

Token sequences supplied as actual macro arguments.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/syscalls.ml#L13)

<a id="field-field-mq3-game-syscalls-call-opcode-opcode-src-mq3-game-syscalls-ml-1853550809"></a>
### opcode

```ml
opcode
```

Game syscall opcode recorded for dispatch or replay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/syscalls.ml#L11)

<a id="field-field-mq3-game-syscalls-call-result-result-src-mq3-game-syscalls-ml-1958565819"></a>
### result

```ml
result
```

Return value of the recorded syscall or host operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/syscalls.ml#L15)
