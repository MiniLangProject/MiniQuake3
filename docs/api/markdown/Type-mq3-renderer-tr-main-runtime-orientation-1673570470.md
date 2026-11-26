# `mq3.renderer.tr_main_runtime.Orientation`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-main-runtime-ml-668641946.md)

<a id="struct-struct-mq3-renderer-tr-main-runtime-orientation-struct-orientation-src-mq3-renderer-tr-main-runtime-ml-1801148777"></a>
## Orientation

```ml
struct Orientation
```

Data record for `mq3.renderer.tr_main_runtime.Orientation`; groups `origin`, `axis`, `viewOrigin`, `modelMatrix`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L49)

## Members

<a id="field-field-mq3-renderer-tr-main-runtime-orientation-axis-axis-src-mq3-renderer-tr-main-runtime-ml-1304586501"></a>
### axis

```ml
axis
```

Frontend orientation basis used to construct the model matrix and local viewing origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L53)

<a id="field-field-mq3-renderer-tr-main-runtime-orientation-modelmatrix-modelmatrix-src-mq3-renderer-tr-main-runtime-ml-825074491"></a>
### modelMatrix

```ml
modelMatrix
```

Matrix placing the model in the current view or world coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L57)

<a id="field-field-mq3-renderer-tr-main-runtime-orientation-origin-origin-src-mq3-renderer-tr-main-runtime-ml-438882523"></a>
### origin

```ml
origin
```

World-space translation associated with the frontend model transform.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L51)

<a id="field-field-mq3-renderer-tr-main-runtime-orientation-vieworigin-vieworigin-src-mq3-renderer-tr-main-runtime-ml-487546373"></a>
### viewOrigin

```ml
viewOrigin
```

Camera origin expressed in the current model's coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L55)
