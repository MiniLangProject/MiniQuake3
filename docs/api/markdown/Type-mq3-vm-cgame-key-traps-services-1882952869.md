# `mq3.vm.cgame_key_traps.Services`

[Home](README.md) · [Source file](File-src-mq3-vm-cgame-key-traps-ml-2020826655.md)

<a id="struct-struct-mq3-vm-cgame-key-traps-services-struct-services-src-mq3-vm-cgame-key-traps-ml-1247334535"></a>
## Services

```ml
struct Services
```

Services record for vm.cgame_key_traps, containing `context`, `isDownFn`, `getCatcherFn`, `setCatcherFn`, `getKeyFn`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L20)

## Members

<a id="field-field-mq3-vm-cgame-key-traps-services-context-context-src-mq3-vm-cgame-key-traps-ml-821217129"></a>
### context

```ml
context
```

Opaque caller-supplied context available to client-game key-state and input-catcher callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L22)

<a id="field-field-mq3-vm-cgame-key-traps-services-getcatcherfn-getcatcherfn-src-mq3-vm-cgame-key-traps-ml-1790889633"></a>
### getCatcherFn

```ml
getCatcherFn
```

Injected callback for get catcher; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L26)

<a id="field-field-mq3-vm-cgame-key-traps-services-getkeyfn-getkeyfn-src-mq3-vm-cgame-key-traps-ml-1419534667"></a>
### getKeyFn

```ml
getKeyFn
```

Injected callback for get key; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L30)

<a id="field-field-mq3-vm-cgame-key-traps-services-isdownfn-isdownfn-src-mq3-vm-cgame-key-traps-ml-1667749153"></a>
### isDownFn

```ml
isDownFn
```

Injected callback for is down; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L24)

<a id="field-field-mq3-vm-cgame-key-traps-services-setcatcherfn-setcatcherfn-src-mq3-vm-cgame-key-traps-ml-1074097457"></a>
### setCatcherFn

```ml
setCatcherFn
```

Injected callback for set catcher; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L28)
