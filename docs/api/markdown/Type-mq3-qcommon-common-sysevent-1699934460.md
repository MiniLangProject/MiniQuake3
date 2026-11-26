# `mq3.qcommon.common.SysEvent`

[Home](README.md) · [Source file](File-src-mq3-qcommon-common-ml-778957851.md)

<a id="struct-struct-mq3-qcommon-common-sysevent-struct-sysevent-src-mq3-qcommon-common-ml-2123283133"></a>
## SysEvent

```ml
struct SysEvent
```

SysEvent record for qcommon.common, containing `time`, `type`, `value`, `value2`, `data`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L89)

## Members

<a id="field-field-mq3-qcommon-common-sysevent-data-data-src-mq3-qcommon-common-ml-363117708"></a>
### data

```ml
data
```

Optional event payload, such as console text or packet bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L99)

<a id="field-field-mq3-qcommon-common-sysevent-time-time-src-mq3-qcommon-common-ml-1154509698"></a>
### time

```ml
time
```

Host timestamp attached to this input or network event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L91)

<a id="field-field-mq3-qcommon-common-sysevent-type-type-src-mq3-qcommon-common-ml-1568543820"></a>
### type

```ml
type
```

Event-kind identifier selecting the interpretation of the payload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L93)

<a id="field-field-mq3-qcommon-common-sysevent-value-value-src-mq3-qcommon-common-ml-752788420"></a>
### value

```ml
value
```

First integer event argument, such as a key or movement value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L95)

<a id="field-field-mq3-qcommon-common-sysevent-value2-value2-src-mq3-qcommon-common-ml-1432071430"></a>
### value2

```ml
value2
```

Second integer event argument associated with the event kind.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L97)
