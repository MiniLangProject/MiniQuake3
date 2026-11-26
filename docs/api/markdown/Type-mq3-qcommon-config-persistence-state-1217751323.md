# `mq3.qcommon.config_persistence.State`

[Home](README.md) · [Source file](File-src-mq3-qcommon-config-persistence-ml-1954559630.md)

<a id="struct-struct-mq3-qcommon-config-persistence-state-struct-state-src-mq3-qcommon-config-persistence-ml-1213372385"></a>
## State

```ml
struct State
```

State record for qcommon.config_persistence, containing `registry`, `services`, `fullyInitialized`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/config_persistence.ml#L25)

## Members

<a id="field-field-mq3-qcommon-config-persistence-state-fullyinitialized-fullyinitialized-src-mq3-qcommon-config-persistence-ml-979275042"></a>
### fullyInitialized

```ml
fullyInitialized
```

True when initialization is complete and automatic configuration writes are allowed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/config_persistence.ml#L31)

<a id="field-field-mq3-qcommon-config-persistence-state-registry-registry-src-mq3-qcommon-config-persistence-ml-540318672"></a>
### registry

```ml
registry
```

Registry used to resolve registered names, handles, or runtime definitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/config_persistence.ml#L27)

<a id="field-field-mq3-qcommon-config-persistence-state-services-services-src-mq3-qcommon-config-persistence-ml-1442456938"></a>
### services

```ml
services
```

File-writing, binding-serialization, and diagnostic services used to save configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/config_persistence.ml#L29)
