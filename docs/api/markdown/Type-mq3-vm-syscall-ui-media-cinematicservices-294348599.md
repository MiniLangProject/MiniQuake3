# `mq3.vm.syscall_ui_media.CinematicServices`

[Home](README.md) · [Source file](File-src-mq3-vm-syscall-ui-media-ml-1111712958.md)

<a id="struct-struct-mq3-vm-syscall-ui-media-cinematicservices-struct-cinematicservices-src-mq3-vm-syscall-ui-media-ml-1027723937"></a>
## CinematicServices

```ml
struct CinematicServices
```

CinematicServices record for vm.syscall_ui_media, containing `playFn`, `stopFn`, `runFn`, `drawFn`, `setExtentsFn`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L24)

## Members

<a id="field-field-mq3-vm-syscall-ui-media-cinematicservices-drawfn-drawfn-src-mq3-vm-syscall-ui-media-ml-1489336606"></a>
### drawFn

```ml
drawFn
```

Injected callback for draw; invoked through the CinematicServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L32)

<a id="field-field-mq3-vm-syscall-ui-media-cinematicservices-playfn-playfn-src-mq3-vm-syscall-ui-media-ml-615760310"></a>
### playFn

```ml
playFn
```

Injected callback for play; invoked through the CinematicServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L26)

<a id="field-field-mq3-vm-syscall-ui-media-cinematicservices-runfn-runfn-src-mq3-vm-syscall-ui-media-ml-429200734"></a>
### runFn

```ml
runFn
```

Injected callback for run; invoked through the CinematicServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L30)

<a id="field-field-mq3-vm-syscall-ui-media-cinematicservices-setextentsfn-setextentsfn-src-mq3-vm-syscall-ui-media-ml-529225660"></a>
### setExtentsFn

```ml
setExtentsFn
```

Injected callback for set extents; invoked through the CinematicServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L34)

<a id="field-field-mq3-vm-syscall-ui-media-cinematicservices-stopfn-stopfn-src-mq3-vm-syscall-ui-media-ml-110873858"></a>
### stopFn

```ml
stopFn
```

Injected callback for stop; invoked through the CinematicServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L28)
