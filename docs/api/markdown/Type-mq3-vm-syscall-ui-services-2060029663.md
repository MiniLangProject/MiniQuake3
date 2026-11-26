# `mq3.vm.syscall_ui.Services`

[Home](README.md) · [Source file](File-src-mq3-vm-syscall-ui-ml-839264043.md)

<a id="struct-struct-mq3-vm-syscall-ui-services-struct-services-src-mq3-vm-syscall-ui-ml-1386760927"></a>
## Services

```ml
struct Services
```

Services record for vm.syscall_ui, containing `shared`, `context`, `client`, `keys`, `renderer`, `lan`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L104)

## Members

<a id="field-field-mq3-vm-syscall-ui-services-client-client-src-mq3-vm-syscall-ui-ml-1250431669"></a>
### client

```ml
client
```

Client-state service bundle supplied to UI syscalls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L111)

<a id="field-field-mq3-vm-syscall-ui-services-context-context-src-mq3-vm-syscall-ui-ml-303507403"></a>
### context

```ml
context
```

Opaque caller-supplied context available to UI VM client, keyboard, renderer, and server-browser services.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L109)

<a id="field-field-mq3-vm-syscall-ui-services-extendedfn-extendedfn-src-mq3-vm-syscall-ui-ml-170424177"></a>
### extendedFn

```ml
extendedFn
```

Injected callback for extended; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L125)

<a id="field-field-mq3-vm-syscall-ui-services-filelistfn-filelistfn-src-mq3-vm-syscall-ui-ml-913158647"></a>
### fileListFn

```ml
fileListFn
```

Injected callback for file list; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L119)

<a id="field-field-mq3-vm-syscall-ui-services-keys-keys-src-mq3-vm-syscall-ui-ml-802313963"></a>
### keys

```ml
keys
```

Keyboard-state service bundle supplied to UI operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L113)

<a id="field-field-mq3-vm-syscall-ui-services-lan-lan-src-mq3-vm-syscall-ui-ml-1998364447"></a>
### lan

```ml
lan
```

Local-network browser service bundle used by the UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L117)

<a id="field-field-mq3-vm-syscall-ui-services-mediaservices-mediaservices-src-mq3-vm-syscall-ui-ml-245431991"></a>
### mediaServices

```ml
mediaServices
```

Media-registration and rendering callback bundle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L123)

<a id="field-field-mq3-vm-syscall-ui-services-memoryremainingfn-memoryremainingfn-src-mq3-vm-syscall-ui-ml-763752275"></a>
### memoryRemainingFn

```ml
memoryRemainingFn
```

Injected callback for memory remaining; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L121)

<a id="field-field-mq3-vm-syscall-ui-services-renderer-renderer-src-mq3-vm-syscall-ui-ml-1986181397"></a>
### renderer

```ml
renderer
```

Renderer service bundle used to register media and submit drawing operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L115)

<a id="field-field-mq3-vm-syscall-ui-services-shared-shared-src-mq3-vm-syscall-ui-ml-329689545"></a>
### shared

```ml
shared
```

Shared host service bundle used by the VM syscall adapters.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L106)
