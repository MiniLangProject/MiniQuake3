# `mq3.platform.desktop_frame_host.Services`

[Home](README.md) · [Source file](File-src-mq3-platform-desktop-frame-host-ml-537034802.md)

<a id="struct-struct-mq3-platform-desktop-frame-host-services-struct-services-src-mq3-platform-desktop-frame-host-ml-1774007905"></a>
## Services

```ml
struct Services
```

All effects are explicit so startup rollback and frame ordering can be checked without substituting the protocol or UDP implementations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L25)

## Members

<a id="field-field-mq3-platform-desktop-frame-host-services-bindfn-bindfn-src-mq3-platform-desktop-frame-host-ml-1321398839"></a>
### bindFn

```ml
bindFn
```

Host callback used to perform bind operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L31)

<a id="field-field-mq3-platform-desktop-frame-host-services-cleanupfn-cleanupfn-src-mq3-platform-desktop-frame-host-ml-1855646965"></a>
### cleanupFn

```ml
cleanupFn
```

Host callback used to perform cleanup operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L35)

<a id="field-field-mq3-platform-desktop-frame-host-services-clientframefn-clientframefn-src-mq3-platform-desktop-frame-host-ml-656984109"></a>
### clientFrameFn

```ml
clientFrameFn
```

Host callback used to perform client frame operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L45)

<a id="field-field-mq3-platform-desktop-frame-host-services-closefn-closefn-src-mq3-platform-desktop-frame-host-ml-1349810049"></a>
### closeFn

```ml
closeFn
```

Host callback used to perform close operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L33)

<a id="field-field-mq3-platform-desktop-frame-host-services-context-context-src-mq3-platform-desktop-frame-host-ml-296852749"></a>
### context

```ml
context
```

State supplied to the UDP lifecycle, packet-pump, and engine-frame callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L47)

<a id="field-field-mq3-platform-desktop-frame-host-services-createpumpfn-createpumpfn-src-mq3-platform-desktop-frame-host-ml-1958937645"></a>
### createPumpFn

```ml
createPumpFn
```

Host callback used to perform create pump operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L37)

<a id="field-field-mq3-platform-desktop-frame-host-services-drainfn-drainfn-src-mq3-platform-desktop-frame-host-ml-607171421"></a>
### drainFn

```ml
drainFn
```

Host callback used to perform drain operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L41)

<a id="field-field-mq3-platform-desktop-frame-host-services-openfn-openfn-src-mq3-platform-desktop-frame-host-ml-1375369697"></a>
### openFn

```ml
openFn
```

Host callback used to perform open operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L29)

<a id="field-field-mq3-platform-desktop-frame-host-services-serverframefn-serverframefn-src-mq3-platform-desktop-frame-host-ml-142834901"></a>
### serverFrameFn

```ml
serverFrameFn
```

Host callback used to perform server frame operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L43)

<a id="field-field-mq3-platform-desktop-frame-host-services-settimefn-settimefn-src-mq3-platform-desktop-frame-host-ml-1419971509"></a>
### setTimeFn

```ml
setTimeFn
```

Host callback used to perform set time operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L39)

<a id="field-field-mq3-platform-desktop-frame-host-services-startupfn-startupfn-src-mq3-platform-desktop-frame-host-ml-1862174365"></a>
### startupFn

```ml
startupFn
```

Host callback used to perform startup operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/desktop_frame_host.ml#L27)
