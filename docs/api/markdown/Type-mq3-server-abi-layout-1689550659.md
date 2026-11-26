# `mq3.server.abi.Layout`

[Home](README.md) · [Source file](File-src-mq3-server-abi-ml-141226179.md)

<a id="struct-struct-mq3-server-abi-layout-struct-layout-src-mq3-server-abi-ml-653106759"></a>
## Layout

```ml
struct Layout
```

Layout record for server.abi, containing `name`, `size`, `fields`, `offsets`, `arrayFields`, `arrayCounts`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L71)

## Members

<a id="field-field-mq3-server-abi-layout-arraycounts-arraycounts-src-mq3-server-abi-ml-2108742363"></a>
### arrayCounts

```ml
arrayCounts
```

Element counts corresponding to the fixed-size array fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L83)

<a id="field-field-mq3-server-abi-layout-arrayfields-arrayfields-src-mq3-server-abi-ml-1546774707"></a>
### arrayFields

```ml
arrayFields
```

Names of fields represented as fixed-size ABI arrays.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L81)

<a id="field-field-mq3-server-abi-layout-fields-fields-src-mq3-server-abi-ml-1821003501"></a>
### fields

```ml
fields
```

Field names included in the ABI layout descriptor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L77)

<a id="field-field-mq3-server-abi-layout-name-name-src-mq3-server-abi-ml-1798644189"></a>
### name

```ml
name
```

Native C record name whose byte offsets are described by this ABI layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L73)

<a id="field-field-mq3-server-abi-layout-offsets-offsets-src-mq3-server-abi-ml-391377839"></a>
### offsets

```ml
offsets
```

Byte offsets of fields from the beginning of the ABI record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L79)

<a id="field-field-mq3-server-abi-layout-size-size-src-mq3-server-abi-ml-1081154953"></a>
### size

```ml
size
```

Total byte size of the described server ABI record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L75)
