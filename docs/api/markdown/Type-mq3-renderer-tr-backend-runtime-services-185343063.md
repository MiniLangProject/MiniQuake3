# `mq3.renderer.tr_backend_runtime.Services`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-backend-runtime-ml-370216411.md)

<a id="struct-struct-mq3-renderer-tr-backend-runtime-services-struct-services-src-mq3-renderer-tr-backend-runtime-ml-363646879"></a>
## Services

```ml
struct Services
```

Callback table for `mq3.renderer.tr_backend_runtime.Services`; exposes `eventFn`, `surfaceFn`, `screenshotFn`, `sleepFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L206)

## Members

<a id="field-field-mq3-renderer-tr-backend-runtime-services-context-context-src-mq3-renderer-tr-backend-runtime-ml-2003772515"></a>
### context

```ml
context
```

Render-backend host state supplied to event, surface, screenshot, and sleep callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L216)

<a id="field-field-mq3-renderer-tr-backend-runtime-services-eventfn-eventfn-src-mq3-renderer-tr-backend-runtime-ml-1403626451"></a>
### eventFn

```ml
eventFn
```

Host callback used to perform event operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L208)

<a id="field-field-mq3-renderer-tr-backend-runtime-services-screenshotfn-screenshotfn-src-mq3-renderer-tr-backend-runtime-ml-144360619"></a>
### screenshotFn

```ml
screenshotFn
```

Host callback used to perform screenshot operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L212)

<a id="field-field-mq3-renderer-tr-backend-runtime-services-sleepfn-sleepfn-src-mq3-renderer-tr-backend-runtime-ml-657107563"></a>
### sleepFn

```ml
sleepFn
```

Host callback used to perform sleep operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L214)

<a id="field-field-mq3-renderer-tr-backend-runtime-services-surfacefn-surfacefn-src-mq3-renderer-tr-backend-runtime-ml-428025411"></a>
### surfaceFn

```ml
surfaceFn
```

Host callback used to perform surface operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L210)
