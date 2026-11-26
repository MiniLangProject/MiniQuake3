# `mq3.qcommon.common.Services`

[Home](README.md) · [Source file](File-src-mq3-qcommon-common-ml-778957851.md)

<a id="struct-struct-mq3-qcommon-common-services-struct-services-src-mq3-qcommon-common-ml-439931773"></a>
## Services

```ml
struct Services
```

Services record for qcommon.common, containing `context`, `printFn`, `errorFn`, `quitFn`, `clockFn`, `realTimeFn`, and 12 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L49)

## Members

<a id="field-field-mq3-qcommon-common-services-appendfn-appendfn-src-mq3-qcommon-common-ml-1808109199"></a>
### appendFn

```ml
appendFn
```

Host callback that appends text to the host command buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L70)

<a id="field-field-mq3-qcommon-common-services-clockfn-clockfn-src-mq3-qcommon-common-ml-929682087"></a>
### clockFn

```ml
clockFn
```

Host callback that returns the host clock used for frame scheduling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L60)

<a id="field-field-mq3-qcommon-common-services-consoleeventfn-consoleeventfn-src-mq3-qcommon-common-ml-255863761"></a>
### consoleEventFn

```ml
consoleEventFn
```

Host callback that handles a host console-input event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L84)

<a id="field-field-mq3-qcommon-common-services-context-context-src-mq3-qcommon-common-ml-2062114407"></a>
### context

```ml
context
```

Caller-supplied data associated with common-engine output, events, file access, timing, and subsystem lifecycle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L52)

<a id="field-field-mq3-qcommon-common-services-errorfn-errorfn-src-mq3-qcommon-common-ml-813973295"></a>
### errorFn

```ml
errorFn
```

Host callback that reports a host error using the requested error severity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L56)

<a id="field-field-mq3-qcommon-common-services-initfn-initfn-src-mq3-qcommon-common-ml-957937519"></a>
### initFn

```ml
initFn
```

Host callback that initializes the host subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L80)

<a id="field-field-mq3-qcommon-common-services-packeteventfn-packeteventfn-src-mq3-qcommon-common-ml-1725090887"></a>
### packetEventFn

```ml
packetEventFn
```

Host callback that handles an incoming host network event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L86)

<a id="field-field-mq3-qcommon-common-services-printfn-printfn-src-mq3-qcommon-common-ml-1847229903"></a>
### printFn

```ml
printFn
```

Host callback that writes common-engine console messages to the host output channel.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L54)

<a id="field-field-mq3-qcommon-common-services-quitfn-quitfn-src-mq3-qcommon-common-ml-672610453"></a>
### quitFn

```ml
quitFn
```

Host callback that terminates the host application.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L58)

<a id="field-field-mq3-qcommon-common-services-readfn-readfn-src-mq3-qcommon-common-ml-252457831"></a>
### readFn

```ml
readFn
```

Host callback that reads common-engine files such as event journals and configuration data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L66)

<a id="field-field-mq3-qcommon-common-services-realeventfn-realeventfn-src-mq3-qcommon-common-ml-1134466675"></a>
### realEventFn

```ml
realEventFn
```

Host callback that obtains the next event from the host event queue.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L64)

<a id="field-field-mq3-qcommon-common-services-realtimefn-realtimefn-src-mq3-qcommon-common-ml-136967613"></a>
### realTimeFn

```ml
realTimeFn
```

Host callback that returns the host calendar time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L62)

<a id="field-field-mq3-qcommon-common-services-shutdownclientfn-shutdownclientfn-src-mq3-qcommon-common-ml-408151205"></a>
### shutdownClientFn

```ml
shutdownClientFn
```

Host callback that shuts down the host client subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L74)

<a id="field-field-mq3-qcommon-common-services-shutdownfn-shutdownfn-src-mq3-qcommon-common-ml-1718122139"></a>
### shutdownFn

```ml
shutdownFn
```

Host callback that shuts down the host subsystem and releases its resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L82)

<a id="field-field-mq3-qcommon-common-services-shutdownfsfn-shutdownfsfn-src-mq3-qcommon-common-ml-239480241"></a>
### shutdownFsFn

```ml
shutdownFsFn
```

Host callback that shuts down the host filesystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L78)

<a id="field-field-mq3-qcommon-common-services-shutdownserverfn-shutdownserverfn-src-mq3-qcommon-common-ml-1781835309"></a>
### shutdownServerFn

```ml
shutdownServerFn
```

Host callback that shuts down the host server subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L76)

<a id="field-field-mq3-qcommon-common-services-validatekeyfn-validatekeyfn-src-mq3-qcommon-common-ml-268443691"></a>
### validateKeyFn

```ml
validateKeyFn
```

Host callback that checks the supplied game key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L72)

<a id="field-field-mq3-qcommon-common-services-writefn-writefn-src-mq3-qcommon-common-ml-1165357131"></a>
### writeFn

```ml
writeFn
```

Host callback that writes data through the host output interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L68)
