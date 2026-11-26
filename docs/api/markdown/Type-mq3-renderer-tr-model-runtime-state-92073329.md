# `mq3.renderer.tr_model_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-model-runtime-ml-2083580560.md)

<a id="struct-struct-mq3-renderer-tr-model-runtime-state-struct-state-src-mq3-renderer-tr-model-runtime-ml-642764397"></a>
## State

```ml
struct State
```

Data record for `mq3.renderer.tr_model_runtime.State`; groups `models`, `numModels`, `maxModels`, `archives`, `registered`, `viewCluster`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L81)

## Members

<a id="field-field-mq3-renderer-tr-model-runtime-state-archives-archives-src-mq3-renderer-tr-model-runtime-ml-2057416548"></a>
### archives

```ml
archives
```

Asset archives searched while resolving resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L89)

<a id="field-field-mq3-renderer-tr-model-runtime-state-flareclears-flareclears-src-mq3-renderer-tr-model-runtime-ml-1335686602"></a>
### flareClears

```ml
flareClears
```

Number of flare-state reset operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L99)

<a id="field-field-mq3-renderer-tr-model-runtime-state-glconfig-glconfig-src-mq3-renderer-tr-model-runtime-ml-1690153444"></a>
### glConfig

```ml
glConfig
```

Graphics configuration returned by renderer registration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L105)

<a id="field-field-mq3-renderer-tr-model-runtime-state-initcount-initcount-src-mq3-renderer-tr-model-runtime-ml-2100445494"></a>
### initCount

```ml
initCount
```

Number of renderer model-system initialization operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L95)

<a id="field-field-mq3-renderer-tr-model-runtime-state-maxmodels-maxmodels-src-mq3-renderer-tr-model-runtime-ml-1500077146"></a>
### maxModels

```ml
maxModels
```

Maximum number of model records accepted by the registry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L87)

<a id="field-field-mq3-renderer-tr-model-runtime-state-models-models-src-mq3-renderer-tr-model-runtime-ml-1879122870"></a>
### models

```ml
models
```

Registered models or model parts available to the subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L83)

<a id="field-field-mq3-renderer-tr-model-runtime-state-nummodels-nummodels-src-mq3-renderer-tr-model-runtime-ml-1470399906"></a>
### numModels

```ml
numModels
```

Number of model records registered in the model table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L85)

<a id="field-field-mq3-renderer-tr-model-runtime-state-registered-registered-src-mq3-renderer-tr-model-runtime-ml-136771978"></a>
### registered

```ml
registered
```

Whether the subsystem has completed resource registration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L91)

<a id="field-field-mq3-renderer-tr-model-runtime-state-sceneclears-sceneclears-src-mq3-renderer-tr-model-runtime-ml-778829834"></a>
### sceneClears

```ml
sceneClears
```

Number of scene-buffer reset operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L101)

<a id="field-field-mq3-renderer-tr-model-runtime-state-stretchprimes-stretchprimes-src-mq3-renderer-tr-model-runtime-ml-1905615882"></a>
### stretchPrimes

```ml
stretchPrimes
```

Number of initial two-dimensional draw operations used to prime renderer state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L103)

<a id="field-field-mq3-renderer-tr-model-runtime-state-synccount-synccount-src-mq3-renderer-tr-model-runtime-ml-841930474"></a>
### syncCount

```ml
syncCount
```

Number of render-thread synchronization operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L97)

<a id="field-field-mq3-renderer-tr-model-runtime-state-viewcluster-viewcluster-src-mq3-renderer-tr-model-runtime-ml-1291935406"></a>
### viewCluster

```ml
viewCluster
```

Visibility cluster used by the current world view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L93)
