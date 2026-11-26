# `mq3.renderer.command_queue.Backend`

[Home](README.md) · [Source file](File-src-mq3-renderer-command-queue-ml-1425855282.md)

<a id="struct-struct-mq3-renderer-command-queue-backend-struct-backend-src-mq3-renderer-command-queue-ml-62502621"></a>
## Backend

```ml
struct Backend
```

Data record for `mq3.renderer.command_queue.Backend`; groups `color2D`, `projection2D`, `shader`, `numIndexes`, `finishCalled`, `clearOnDrawBuffer`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L86)

## Members

<a id="field-field-mq3-renderer-command-queue-backend-clearondrawbuffer-clearondrawbuffer-src-mq3-renderer-command-queue-ml-1478439201"></a>
### clearOnDrawBuffer

```ml
clearOnDrawBuffer
```

Whether selecting a draw buffer also clears it.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L98)

<a id="field-field-mq3-renderer-command-queue-backend-color2d-color2d-src-mq3-renderer-command-queue-ml-1854519761"></a>
### color2D

```ml
color2D
```

RGBA modulation color used for two-dimensional drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L88)

<a id="field-field-mq3-renderer-command-queue-backend-finishcalled-finishcalled-src-mq3-renderer-command-queue-ml-2097750617"></a>
### finishCalled

```ml
finishCalled
```

Whether a graphics completion barrier was already issued for this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L96)

<a id="field-field-mq3-renderer-command-queue-backend-numindexes-numindexes-src-mq3-renderer-command-queue-ml-1780736993"></a>
### numIndexes

```ml
numIndexes
```

Number of indices currently stored or submitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L94)

<a id="field-field-mq3-renderer-command-queue-backend-projection2d-projection2d-src-mq3-renderer-command-queue-ml-867372987"></a>
### projection2D

```ml
projection2D
```

Whether the backend currently uses its two-dimensional projection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L90)

<a id="field-field-mq3-renderer-command-queue-backend-services-services-src-mq3-renderer-command-queue-ml-753051873"></a>
### services

```ml
services
```

Injected host operations used by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L100)

<a id="field-field-mq3-renderer-command-queue-backend-shader-shader-src-mq3-renderer-command-queue-ml-940749959"></a>
### shader

```ml
shader
```

Resolved shader record or handle used for this drawing operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L92)
