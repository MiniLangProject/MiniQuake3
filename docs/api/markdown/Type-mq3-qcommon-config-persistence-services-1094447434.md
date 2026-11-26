# `mq3.qcommon.config_persistence.Services`

[Home](README.md) · [Source file](File-src-mq3-qcommon-config-persistence-ml-1954559630.md)

<a id="struct-struct-mq3-qcommon-config-persistence-services-struct-services-src-mq3-qcommon-config-persistence-ml-52057945"></a>
## Services

```ml
struct Services
```

Services record for qcommon.config_persistence, containing `writeFn`, `bindingTextFn`, `printFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/config_persistence.ml#L12)

## Members

<a id="field-field-mq3-qcommon-config-persistence-services-bindingtextfn-bindingtextfn-src-mq3-qcommon-config-persistence-ml-358851051"></a>
### bindingTextFn

```ml
bindingTextFn
```

Host callback that serializes the current input bindings for configuration persistence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/config_persistence.ml#L16)

<a id="field-field-mq3-qcommon-config-persistence-services-context-context-src-mq3-qcommon-config-persistence-ml-304943403"></a>
### context

```ml
context
```

Caller-supplied data associated with configuration-file writing, key-binding serialization, and save diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/config_persistence.ml#L21)

<a id="field-field-mq3-qcommon-config-persistence-services-printfn-printfn-src-mq3-qcommon-config-persistence-ml-616648131"></a>
### printFn

```ml
printFn
```

Host callback that prints configuration-save progress and write failures.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/config_persistence.ml#L18)

<a id="field-field-mq3-qcommon-config-persistence-services-writefn-writefn-src-mq3-qcommon-config-persistence-ml-1950348447"></a>
### writeFn

```ml
writeFn
```

Host callback that writes data through the host output interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/config_persistence.ml#L14)
