# `mq3.renderer.command_queue.Services`

[Home](README.md) · [Source file](File-src-mq3-renderer-command-queue-ml-1425855282.md)

<a id="struct-struct-mq3-renderer-command-queue-services-struct-services-src-mq3-renderer-command-queue-ml-1160557131"></a>
## Services

```ml
struct Services
```

Callback table for `mq3.renderer.command_queue.Services`; exposes `set2DFn`, `endSurfaceFn`, `beginSurfaceFn`, `quadFn`, `drawBufferFn`, `clearFn`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L63)

## Members

<a id="field-field-mq3-renderer-command-queue-services-beginsurfacefn-beginsurfacefn-src-mq3-renderer-command-queue-ml-1810188337"></a>
### beginSurfaceFn

```ml
beginSurfaceFn
```

Host callback used to perform begin surface operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L69)

<a id="field-field-mq3-renderer-command-queue-services-clearfn-clearfn-src-mq3-renderer-command-queue-ml-2028708309"></a>
### clearFn

```ml
clearFn
```

Host callback used to perform clear operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L75)

<a id="field-field-mq3-renderer-command-queue-services-context-context-src-mq3-renderer-command-queue-ml-772238705"></a>
### context

```ml
context
```

Backend state passed while executing queued 2D drawing and buffer-management commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L83)

<a id="field-field-mq3-renderer-command-queue-services-diagnosticfn-diagnosticfn-src-mq3-renderer-command-queue-ml-179074763"></a>
### diagnosticFn

```ml
diagnosticFn
```

Host callback used to perform diagnostic operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L81)

<a id="field-field-mq3-renderer-command-queue-services-drawbufferfn-drawbufferfn-src-mq3-renderer-command-queue-ml-1099635269"></a>
### drawBufferFn

```ml
drawBufferFn
```

Host callback used to perform draw buffer operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L73)

<a id="field-field-mq3-renderer-command-queue-services-endframefn-endframefn-src-mq3-renderer-command-queue-ml-996385081"></a>
### endFrameFn

```ml
endFrameFn
```

Host callback used to perform end frame operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L79)

<a id="field-field-mq3-renderer-command-queue-services-endsurfacefn-endsurfacefn-src-mq3-renderer-command-queue-ml-1631360937"></a>
### endSurfaceFn

```ml
endSurfaceFn
```

Host callback used to perform end surface operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L67)

<a id="field-field-mq3-renderer-command-queue-services-finishfn-finishfn-src-mq3-renderer-command-queue-ml-1985834575"></a>
### finishFn

```ml
finishFn
```

Host callback used to perform finish operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L77)

<a id="field-field-mq3-renderer-command-queue-services-quadfn-quadfn-src-mq3-renderer-command-queue-ml-2010866879"></a>
### quadFn

```ml
quadFn
```

Host callback used to perform quad operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L71)

<a id="field-field-mq3-renderer-command-queue-services-set2dfn-set2dfn-src-mq3-renderer-command-queue-ml-1366399401"></a>
### set2DFn

```ml
set2DFn
```

Host callback used to perform set2 d operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L65)
