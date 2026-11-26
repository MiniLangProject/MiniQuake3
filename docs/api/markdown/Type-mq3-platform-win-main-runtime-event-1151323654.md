# `mq3.platform.win_main_runtime.Event`

[Home](README.md) · [Source file](File-src-mq3-platform-win-main-runtime-ml-2060063046.md)

<a id="struct-struct-mq3-platform-win-main-runtime-event-struct-event-src-mq3-platform-win-main-runtime-ml-891023"></a>
## Event

```ml
struct Event
```

Data record for `mq3.platform.win_main_runtime.Event`; groups `time`, `type`, `value`, `value2`, `ptrLength`, `data`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L100)

## Members

<a id="field-field-mq3-platform-win-main-runtime-event-data-data-src-mq3-platform-win-main-runtime-ml-2123787913"></a>
### data

```ml
data
```

Optional byte payload carried by a console or network system event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L112)

<a id="field-field-mq3-platform-win-main-runtime-event-ptrlength-ptrlength-src-mq3-platform-win-main-runtime-ml-357438029"></a>
### ptrLength

```ml
ptrLength
```

Length in bytes of the optional payload carried by the system event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L110)

<a id="field-field-mq3-platform-win-main-runtime-event-time-time-src-mq3-platform-win-main-runtime-ml-574694571"></a>
### time

```ml
time
```

Windows system-event timestamp in milliseconds, filled from the host clock when needed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L102)

<a id="field-field-mq3-platform-win-main-runtime-event-type-type-src-mq3-platform-win-main-runtime-ml-1041443385"></a>
### type

```ml
type
```

System-event category selecting how the accompanying values are interpreted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L104)

<a id="field-field-mq3-platform-win-main-runtime-event-value-value-src-mq3-platform-win-main-runtime-ml-283052969"></a>
### value

```ml
value
```

Primary event value: a key or character code, horizontal motion, or joystick-axis selector.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L106)

<a id="field-field-mq3-platform-win-main-runtime-event-value2-value2-src-mq3-platform-win-main-runtime-ml-1513290383"></a>
### value2

```ml
value2
```

Secondary event value: key press state, vertical motion, or joystick-axis magnitude.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L108)
