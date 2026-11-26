# `mq3.vm.syscall_ui_media.PlatformServices`

[Home](README.md) · [Source file](File-src-mq3-vm-syscall-ui-media-ml-1111712958.md)

<a id="struct-struct-mq3-vm-syscall-ui-media-platformservices-struct-platformservices-src-mq3-vm-syscall-ui-media-ml-537088293"></a>
## PlatformServices

```ml
struct PlatformServices
```

PlatformServices record for vm.syscall_ui_media, containing `realTimeFn`, `remapShaderFn`, `getCdKeyFn`, `setCdKeyFn`, `verifyCdKeyFn`, `seekFn`, and 1 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L37)

## Members

<a id="field-field-mq3-vm-syscall-ui-media-platformservices-getcdkeyfn-getcdkeyfn-src-mq3-vm-syscall-ui-media-ml-618108612"></a>
### getCdKeyFn

```ml
getCdKeyFn
```

Injected callback for get cd key; invoked through the PlatformServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L43)

<a id="field-field-mq3-vm-syscall-ui-media-platformservices-pbstatusfn-pbstatusfn-src-mq3-vm-syscall-ui-media-ml-446704164"></a>
### pbStatusFn

```ml
pbStatusFn
```

Injected callback for pb status; invoked through the PlatformServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L51)

<a id="field-field-mq3-vm-syscall-ui-media-platformservices-realtimefn-realtimefn-src-mq3-vm-syscall-ui-media-ml-670509166"></a>
### realTimeFn

```ml
realTimeFn
```

Injected callback for real time; invoked through the PlatformServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L39)

<a id="field-field-mq3-vm-syscall-ui-media-platformservices-remapshaderfn-remapshaderfn-src-mq3-vm-syscall-ui-media-ml-1642660632"></a>
### remapShaderFn

```ml
remapShaderFn
```

Injected callback for remap shader; invoked through the PlatformServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L41)

<a id="field-field-mq3-vm-syscall-ui-media-platformservices-seekfn-seekfn-src-mq3-vm-syscall-ui-media-ml-1070936276"></a>
### seekFn

```ml
seekFn
```

Injected callback for seek; invoked through the PlatformServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L49)

<a id="field-field-mq3-vm-syscall-ui-media-platformservices-setcdkeyfn-setcdkeyfn-src-mq3-vm-syscall-ui-media-ml-1799119428"></a>
### setCdKeyFn

```ml
setCdKeyFn
```

Injected callback for set cd key; invoked through the PlatformServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L45)

<a id="field-field-mq3-vm-syscall-ui-media-platformservices-verifycdkeyfn-verifycdkeyfn-src-mq3-vm-syscall-ui-media-ml-1881614372"></a>
### verifyCdKeyFn

```ml
verifyCdKeyFn
```

Injected callback for verify cd key; invoked through the PlatformServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L47)
