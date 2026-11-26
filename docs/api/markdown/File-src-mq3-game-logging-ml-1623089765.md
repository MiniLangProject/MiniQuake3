# `src/mq3/game/logging.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.logging`](Package-mq3-game-logging-1388961691.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-game-logging-logdivide-function-logdivide-value-divisor-src-mq3-game-logging-ml-1727354391"></a>
### logDivide

```ml
function logDivide(value, divisor)
```

Perform signed integer division with truncation toward zero for game log timestamps.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.quotient`. |
| `divisor` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.quotient`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/logging.ml#L10)

<a id="function-function-mq3-game-logging-write-function-write-level-payload-src-mq3-game-logging-ml-833326284"></a>
### write

```ml
function write(level, payload)
```

Use `level.gamePrintFn` and `level.logWriteFn` to perform `write`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `dedicated`, `gamePrintFn`, `logFile` and `logWriteFn`. |
| `payload` | `dynamic` | — | Value passed as argument 1 to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/logging.ml#L17)
