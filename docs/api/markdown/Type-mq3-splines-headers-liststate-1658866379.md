# `mq3.splines.headers.ListState`

[Home](README.md) · [Source file](File-src-mq3-splines-headers-ml-550180384.md)

<a id="struct-struct-mq3-splines-headers-liststate-struct-liststate-src-mq3-splines-headers-ml-68936515"></a>
## ListState

```ml
struct ListState
```

ListState record for splines.headers, containing `values`, `size`, `granularity`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L61)

## Members

<a id="field-field-mq3-splines-headers-liststate-granularity-granularity-src-mq3-splines-headers-ml-344193996"></a>
### granularity

```ml
granularity
```

Allocation growth increment used by list storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L67)

<a id="field-field-mq3-splines-headers-liststate-size-size-src-mq3-splines-headers-ml-938989158"></a>
### size

```ml
size
```

Allocated element capacity of the list; the used element count is len(values).


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L65)

<a id="field-field-mq3-splines-headers-liststate-values-values-src-mq3-splines-headers-ml-368154816"></a>
### values

```ml
values
```

List elements currently in use.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L63)
