# `mq3.renderer.qvm_scene_materials.Texture`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-scene-materials-ml-310916497.md)

<a id="struct-struct-mq3-renderer-qvm-scene-materials-texture-struct-texture-src-mq3-renderer-qvm-scene-materials-ml-1540220047"></a>
## Texture

```ml
struct Texture
```

Data record for `mq3.renderer.qvm_scene_materials.Texture`; groups `imageName`, `image`, `slot`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L36)

## Members

<a id="field-field-mq3-renderer-qvm-scene-materials-texture-image-image-src-mq3-renderer-qvm-scene-materials-ml-1221200492"></a>
### image

```ml
image
```

Decoded texture image assigned a native slot for scene-entity drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L40)

<a id="field-field-mq3-renderer-qvm-scene-materials-texture-imagename-imagename-src-mq3-renderer-qvm-scene-materials-ml-35619548"></a>
### imageName

```ml
imageName
```

Virtual image path selected for this texture or material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L38)

<a id="field-field-mq3-renderer-qvm-scene-materials-texture-slot-slot-src-mq3-renderer-qvm-scene-materials-ml-415607008"></a>
### slot

```ml
slot
```

Texture slot reserved for this image in the native drawing backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L42)
