# `mq3.qcommon.common.Hunk`

[Home](README.md) · [Source file](File-src-mq3-qcommon-common-ml-778957851.md)

<a id="struct-struct-mq3-qcommon-common-hunk-struct-hunk-src-mq3-qcommon-common-ml-1519759649"></a>
## Hunk

```ml
struct Hunk
```

Hunk record for qcommon.common, containing `capacity`, `lowPermanent`, `highPermanent`, `lowTemp`, `highTemp`, `markLow`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L152)

## Members

<a id="field-field-mq3-qcommon-common-hunk-allocations-allocations-src-mq3-qcommon-common-ml-506663575"></a>
### allocations

```ml
allocations
```

Managed allocations owned by the hunk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L172)

<a id="field-field-mq3-qcommon-common-hunk-capacity-capacity-src-mq3-qcommon-common-ml-245751811"></a>
### capacity

```ml
capacity
```

Maximum number of entries allowed in the managed collection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L154)

<a id="field-field-mq3-qcommon-common-hunk-highpermanent-highpermanent-src-mq3-qcommon-common-ml-1323505147"></a>
### highPermanent

```ml
highPermanent
```

Permanent bytes allocated from the high hunk bank.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L158)

<a id="field-field-mq3-qcommon-common-hunk-hightemp-hightemp-src-mq3-qcommon-common-ml-409928787"></a>
### highTemp

```ml
highTemp
```

Temporary bytes allocated from the high hunk bank.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L162)

<a id="field-field-mq3-qcommon-common-hunk-lowpermanent-lowpermanent-src-mq3-qcommon-common-ml-1884547011"></a>
### lowPermanent

```ml
lowPermanent
```

Permanent bytes allocated from the low hunk bank.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L156)

<a id="field-field-mq3-qcommon-common-hunk-lowtemp-lowtemp-src-mq3-qcommon-common-ml-1892947859"></a>
### lowTemp

```ml
lowTemp
```

Temporary bytes allocated from the low hunk bank.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L160)

<a id="field-field-mq3-qcommon-common-hunk-markhandle-markhandle-src-mq3-qcommon-common-ml-1955686509"></a>
### markHandle

```ml
markHandle
```

Allocation handle saved at the hunk mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L168)

<a id="field-field-mq3-qcommon-common-hunk-markhigh-markhigh-src-mq3-qcommon-common-ml-173894385"></a>
### markHigh

```ml
markHigh
```

High-bank allocation position saved at the hunk mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L166)

<a id="field-field-mq3-qcommon-common-hunk-marklow-marklow-src-mq3-qcommon-common-ml-733329331"></a>
### markLow

```ml
markLow
```

Low-bank allocation position saved at the hunk mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L164)

<a id="field-field-mq3-qcommon-common-hunk-nexthandle-nexthandle-src-mq3-qcommon-common-ml-1852868949"></a>
### nextHandle

```ml
nextHandle
```

Handle to assign to the next allocated managed resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L170)

<a id="field-field-mq3-qcommon-common-hunk-permanentbank-permanentbank-src-mq3-qcommon-common-ml-1028934131"></a>
### permanentBank

```ml
permanentBank
```

Bank selected for subsequent permanent hunk allocations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L174)

<a id="field-field-mq3-qcommon-common-hunk-tempbank-tempbank-src-mq3-qcommon-common-ml-1754639195"></a>
### tempBank

```ml
tempBank
```

Bank selected for subsequent temporary hunk allocations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L176)
