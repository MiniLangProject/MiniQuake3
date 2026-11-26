# `mq3.qcommon.common.Allocation`

[Home](README.md) · [Source file](File-src-mq3-qcommon-common-ml-778957851.md)

<a id="struct-struct-mq3-qcommon-common-allocation-struct-allocation-src-mq3-qcommon-common-ml-634563901"></a>
## Allocation

```ml
struct Allocation
```

Allocation record for qcommon.common, containing `handle`, `data`, `size`, `tag`, `temporary`, `bank`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L122)

## Members

<a id="field-field-mq3-qcommon-common-allocation-bank-bank-src-mq3-qcommon-common-ml-1871520189"></a>
### bank

```ml
bank
```

Low or high hunk bank charged for this allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L134)

<a id="field-field-mq3-qcommon-common-allocation-data-data-src-mq3-qcommon-common-ml-1485068789"></a>
### data

```ml
data
```

Usable byte storage owned by this allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L126)

<a id="field-field-mq3-qcommon-common-allocation-freed-freed-src-mq3-qcommon-common-ml-511063213"></a>
### freed

```ml
freed
```

True after this managed resource has been released.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L136)

<a id="field-field-mq3-qcommon-common-allocation-handle-handle-src-mq3-qcommon-common-ml-202670581"></a>
### handle

```ml
handle
```

Managed identifier of this memory allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L124)

<a id="field-field-mq3-qcommon-common-allocation-label-label-src-mq3-qcommon-common-ml-617811509"></a>
### label

```ml
label
```

Human-readable label identifying the allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L138)

<a id="field-field-mq3-qcommon-common-allocation-size-size-src-mq3-qcommon-common-ml-1199057543"></a>
### size

```ml
size
```

Allocated byte count charged to the owning memory arena.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L128)

<a id="field-field-mq3-qcommon-common-allocation-tag-tag-src-mq3-qcommon-common-ml-566299001"></a>
### tag

```ml
tag
```

Allocation category used for selective freeing and accounting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L130)

<a id="field-field-mq3-qcommon-common-allocation-temporary-temporary-src-mq3-qcommon-common-ml-259532009"></a>
### temporary

```ml
temporary
```

True when the allocation belongs to temporary hunk storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L132)
