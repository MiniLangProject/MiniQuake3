# `mq3.platform.playable_window.TriangleBatch`

[Home](README.md) · [Source file](File-src-mq3-platform-playable-window-ml-933960264.md)

<a id="struct-struct-mq3-platform-playable-window-trianglebatch-struct-trianglebatch-src-mq3-platform-playable-window-ml-1321185241"></a>
## TriangleBatch

```ml
struct TriangleBatch
```

Data record for `mq3.platform.playable_window.TriangleBatch`; groups `data`, `capacity`, `count`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L595)

## Members

<a id="field-field-mq3-platform-playable-window-trianglebatch-capacity-capacity-src-mq3-platform-playable-window-ml-1887491909"></a>
### capacity

```ml
capacity
```

Maximum number of packed triangle records that fit in the batch buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L599)

<a id="field-field-mq3-platform-playable-window-trianglebatch-count-count-src-mq3-platform-playable-window-ml-908131661"></a>
### count

```ml
count
```

Number of initialized triangle records in the native batch buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L601)

<a id="field-field-mq3-platform-playable-window-trianglebatch-data-data-src-mq3-platform-playable-window-ml-1954034701"></a>
### data

```ml
data
```

Packed triangle records passed directly to the native graphics backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L597)
