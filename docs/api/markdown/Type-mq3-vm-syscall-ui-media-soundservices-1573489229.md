# `mq3.vm.syscall_ui_media.SoundServices`

[Home](README.md) · [Source file](File-src-mq3-vm-syscall-ui-media-ml-1111712958.md)

<a id="struct-struct-mq3-vm-syscall-ui-media-soundservices-struct-soundservices-src-mq3-vm-syscall-ui-media-ml-1153434937"></a>
## SoundServices

```ml
struct SoundServices
```

SoundServices record for vm.syscall_ui_media, containing `registerFn`, `startLocalFn`, `stopBackgroundFn`, `startBackgroundFn`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L13)

## Members

<a id="field-field-mq3-vm-syscall-ui-media-soundservices-registerfn-registerfn-src-mq3-vm-syscall-ui-media-ml-1275152854"></a>
### registerFn

```ml
registerFn
```

Injected callback for register; invoked through the SoundServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L15)

<a id="field-field-mq3-vm-syscall-ui-media-soundservices-startbackgroundfn-startbackgroundfn-src-mq3-vm-syscall-ui-media-ml-1734230076"></a>
### startBackgroundFn

```ml
startBackgroundFn
```

Injected callback for start background; invoked through the SoundServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L21)

<a id="field-field-mq3-vm-syscall-ui-media-soundservices-startlocalfn-startlocalfn-src-mq3-vm-syscall-ui-media-ml-1565405882"></a>
### startLocalFn

```ml
startLocalFn
```

Injected callback for start local; invoked through the SoundServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L17)

<a id="field-field-mq3-vm-syscall-ui-media-soundservices-stopbackgroundfn-stopbackgroundfn-src-mq3-vm-syscall-ui-media-ml-400329536"></a>
### stopBackgroundFn

```ml
stopBackgroundFn
```

Injected callback for stop background; invoked through the SoundServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L19)
