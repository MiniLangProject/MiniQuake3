# `mq3.renderer.tr_cmds_runtime.Services`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-cmds-runtime-ml-2143950218.md)

<a id="struct-struct-mq3-renderer-tr-cmds-runtime-services-struct-services-src-mq3-renderer-tr-cmds-runtime-ml-906643947"></a>
## Services

```ml
struct Services
```

Callback table for `mq3.renderer.tr_cmds_runtime.Services`; exposes `eventFn`, `spawnThreadFn`, `frontEndSleepFn`, `wakeRendererFn`, `executeFn`, `textureModeFn`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L121)

## Members

<a id="field-field-mq3-renderer-tr-cmds-runtime-services-colormappingsfn-colormappingsfn-src-mq3-renderer-tr-cmds-runtime-ml-766386345"></a>
### colorMappingsFn

```ml
colorMappingsFn
```

Host callback used to perform color mappings operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L135)

<a id="field-field-mq3-renderer-tr-cmds-runtime-services-context-context-src-mq3-renderer-tr-cmds-runtime-ml-163633301"></a>
### context

```ml
context
```

Command-executor state shared by render-thread scheduling and graphics-setting callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L141)

<a id="field-field-mq3-renderer-tr-cmds-runtime-services-eventfn-eventfn-src-mq3-renderer-tr-cmds-runtime-ml-2082131573"></a>
### eventFn

```ml
eventFn
```

Host callback used to perform event operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L123)

<a id="field-field-mq3-renderer-tr-cmds-runtime-services-executefn-executefn-src-mq3-renderer-tr-cmds-runtime-ml-1584947641"></a>
### executeFn

```ml
executeFn
```

Host callback used to perform execute operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L131)

<a id="field-field-mq3-renderer-tr-cmds-runtime-services-frontendsleepfn-frontendsleepfn-src-mq3-renderer-tr-cmds-runtime-ml-1268191733"></a>
### frontEndSleepFn

```ml
frontEndSleepFn
```

Host callback used to perform front end sleep operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L127)

<a id="field-field-mq3-renderer-tr-cmds-runtime-services-geterrorfn-geterrorfn-src-mq3-renderer-tr-cmds-runtime-ml-2024397205"></a>
### getErrorFn

```ml
getErrorFn
```

Host callback used to perform get error operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L137)

<a id="field-field-mq3-renderer-tr-cmds-runtime-services-spawnthreadfn-spawnthreadfn-src-mq3-renderer-tr-cmds-runtime-ml-1203262021"></a>
### spawnThreadFn

```ml
spawnThreadFn
```

Host callback used to perform spawn thread operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L125)

<a id="field-field-mq3-renderer-tr-cmds-runtime-services-texturemodefn-texturemodefn-src-mq3-renderer-tr-cmds-runtime-ml-1714550205"></a>
### textureModeFn

```ml
textureModeFn
```

Host callback used to perform texture mode operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L133)

<a id="field-field-mq3-renderer-tr-cmds-runtime-services-togglesmpfn-togglesmpfn-src-mq3-renderer-tr-cmds-runtime-ml-311339669"></a>
### toggleSmpFn

```ml
toggleSmpFn
```

Host callback used to perform toggle smp operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L139)

<a id="field-field-mq3-renderer-tr-cmds-runtime-services-wakerendererfn-wakerendererfn-src-mq3-renderer-tr-cmds-runtime-ml-1788747191"></a>
### wakeRendererFn

```ml
wakeRendererFn
```

Host callback used to perform wake renderer operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L129)
