# `mq3.qcommon.common.Zone`

[Home](README.md) · [Source file](File-src-mq3-qcommon-common-ml-778957851.md)

<a id="struct-struct-mq3-qcommon-common-zone-struct-zone-src-mq3-qcommon-common-ml-590086145"></a>
## Zone

```ml
struct Zone
```

Zone record for qcommon.common, containing `capacity`, `used`, `nextHandle`, `allocations`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L141)

## Members

<a id="field-field-mq3-qcommon-common-zone-allocations-allocations-src-mq3-qcommon-common-ml-31653697"></a>
### allocations

```ml
allocations
```

Managed allocations owned by this memory zone.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L149)

<a id="field-field-mq3-qcommon-common-zone-capacity-capacity-src-mq3-qcommon-common-ml-1989971565"></a>
### capacity

```ml
capacity
```

Maximum number of entries allowed in the managed collection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L143)

<a id="field-field-mq3-qcommon-common-zone-nexthandle-nexthandle-src-mq3-qcommon-common-ml-949425543"></a>
### nextHandle

```ml
nextHandle
```

Handle to assign to the next allocated managed resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L147)

<a id="field-field-mq3-qcommon-common-zone-used-used-src-mq3-qcommon-common-ml-1433523123"></a>
### used

```ml
used
```

Bytes currently charged to active allocations in this zone.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L145)
