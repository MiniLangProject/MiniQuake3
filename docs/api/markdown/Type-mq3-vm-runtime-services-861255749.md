# `mq3.vm.runtime.Services`

[Home](README.md) · [Source file](File-src-mq3-vm-runtime-ml-288435087.md)

<a id="struct-struct-mq3-vm-runtime-services-struct-services-src-mq3-vm-runtime-ml-1936286403"></a>
## Services

```ml
struct Services
```

Services record for vm.runtime, containing `loadFn`, `symbolFn`, `developerFn`, `diagnosticFn`, `registerCvarFn`, `addCommandFn`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L60)

## Members

<a id="field-field-mq3-vm-runtime-services-addcommandfn-addcommandfn-src-mq3-vm-runtime-ml-977036521"></a>
### addCommandFn

```ml
addCommandFn
```

Injected callback for add command; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L73)

<a id="field-field-mq3-vm-runtime-services-context-context-src-mq3-vm-runtime-ml-474816809"></a>
### context

```ml
context
```

Opaque caller-supplied context available to VM image loading, symbol lookup, registration, and diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L78)

<a id="field-field-mq3-vm-runtime-services-developerfn-developerfn-src-mq3-vm-runtime-ml-920036913"></a>
### developerFn

```ml
developerFn
```

Injected callback for developer; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L66)

<a id="field-field-mq3-vm-runtime-services-diagnosticfn-diagnosticfn-src-mq3-vm-runtime-ml-978583251"></a>
### diagnosticFn

```ml
diagnosticFn
```

Injected callback for diagnostic; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L68)

<a id="field-field-mq3-vm-runtime-services-loadfn-loadfn-src-mq3-vm-runtime-ml-420152529"></a>
### loadFn

```ml
loadFn
```

Injected callback for load; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L62)

<a id="field-field-mq3-vm-runtime-services-logfn-logfn-src-mq3-vm-runtime-ml-675450289"></a>
### logFn

```ml
logFn
```

Injected callback for log; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L75)

<a id="field-field-mq3-vm-runtime-services-registercvarfn-registercvarfn-src-mq3-vm-runtime-ml-1364273875"></a>
### registerCvarFn

```ml
registerCvarFn
```

Injected callback for register console variable; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L71)

<a id="field-field-mq3-vm-runtime-services-symbolfn-symbolfn-src-mq3-vm-runtime-ml-500913425"></a>
### symbolFn

```ml
symbolFn
```

Injected callback for symbol; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L64)
