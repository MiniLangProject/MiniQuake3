# `src/mq3/game/rank_sort.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.rank_sort`](Package-mq3-game-rank-sort-259771733.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-game-rank-sort-exchange-function-exchange-indices-a-b-src-mq3-game-rank-sort-ml-753714018"></a>
### exchange

```ml
function exchange(indices, a, b)
```

Swap two entries of the rank-index array in place.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `indices` | `dynamic` | — | Array or byte sequence accessed at `a` and `b`. Entries are written in place. |
| `a` | `dynamic` | — | Value used by `exchange` in `saved = indices[a]`. |
| `b` | `dynamic` | — | Value used by `exchange` in `indices[a] = indices[b]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rank_sort.ml#L10)

<a id="function-function-mq3-game-rank-sort-rangesort-function-rangesort-level-indices-low-high-compare-src-mq3-game-rank-sort-ml-1193293874"></a>
### rangeSort

```ml
function rangeSort(level, indices, low, high, compare)
```

Apply `mq3.game.rank_sort.exchange` and `mq3.game.rank_sort.rangeSort` while evaluating `rangeSort`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `compare`. |
| `indices` | `dynamic` | — | Array or byte sequence accessed at `a` and `b`. Entries are written in place. |
| `low` | `dynamic` | — | Value used by `exchange` in `saved = indices[a]`. |
| `high` | `dynamic` | — | Value used by `exchange` in `indices[a] = indices[b]`. |
| `compare` | `dynamic` | — | Value passed as argument 5 to `mq3.game.rank_sort.rangeSort`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rank_sort.ml#L20)

<a id="function-function-mq3-game-rank-sort-sortindices-function-sortindices-level-indices-count-compare-src-mq3-game-rank-sort-ml-1148496387"></a>
### sortIndices

```ml
function sortIndices(level, indices, count, compare)
```

Sort client indices using the rank comparison callback without moving the underlying client records.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `compare`. |
| `indices` | `dynamic` | — | Array or byte sequence accessed at `a` and `b`. Entries are written in place. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |
| `compare` | `dynamic` | — | Value passed as argument 5 to `mq3.game.rank_sort.rangeSort`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/rank_sort.ml#L87)
