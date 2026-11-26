# `mq3.vm.syscall_ui_media.Services`

[Home](README.md) · [Source file](File-src-mq3-vm-syscall-ui-media-ml-1111712958.md)

<a id="struct-struct-mq3-vm-syscall-ui-media-services-struct-services-src-mq3-vm-syscall-ui-media-ml-1926707941"></a>
## Services

```ml
struct Services
```

Services record for vm.syscall_ui_media, containing `context`, `sound`, `cinematic`, `platform`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L54)

## Members

<a id="field-field-mq3-vm-syscall-ui-media-services-cinematic-cinematic-src-mq3-vm-syscall-ui-media-ml-109017825"></a>
### cinematic

```ml
cinematic
```

Cinematic playback service bundle used by UI media calls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L60)

<a id="field-field-mq3-vm-syscall-ui-media-services-context-context-src-mq3-vm-syscall-ui-media-ml-1911365701"></a>
### context

```ml
context
```

Opaque caller-supplied context available to UI VM sound, cinematic, and platform services.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L56)

<a id="field-field-mq3-vm-syscall-ui-media-services-platform-platform-src-mq3-vm-syscall-ui-media-ml-1190184879"></a>
### platform

```ml
platform
```

Platform service bundle providing operating-system operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L62)

<a id="field-field-mq3-vm-syscall-ui-media-services-sound-sound-src-mq3-vm-syscall-ui-media-ml-1034288665"></a>
### sound

```ml
sound
```

Sound service bundle used by media and playback operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L58)
