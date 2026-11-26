# `mq3.game.bg_lib.ScanResult`

[Home](README.md) · [Source file](File-src-mq3-game-bg-lib-ml-1529060793.md)

<a id="struct-struct-mq3-game-bg-lib-scanresult-struct-scanresult-src-mq3-game-bg-lib-ml-1050010895"></a>
## ScanResult

```ml
struct ScanResult
```

`ScanResult` record for bg lib, containing `count`, `values` and `next`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L43)

## Members

<a id="field-field-mq3-game-bg-lib-scanresult-count-count-src-mq3-game-bg-lib-ml-1840580967"></a>
### count

```ml
count
```

Number of conversions successfully matched by the scanner.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L45)

<a id="field-field-mq3-game-bg-lib-scanresult-next-next-src-mq3-game-bg-lib-ml-1703995661"></a>
### next

```ml
next
```

Position immediately after the consumed input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L49)

<a id="field-field-mq3-game-bg-lib-scanresult-values-values-src-mq3-game-bg-lib-ml-564716271"></a>
### values

```ml
values
```

Values captured by successful format conversions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L47)
