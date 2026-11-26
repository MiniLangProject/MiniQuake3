# `mq3.renderer.world_patch_lod.WorldLodPatch`

[Home](README.md) · [Source file](File-src-mq3-renderer-world-patch-lod-ml-389439102.md)

<a id="struct-struct-mq3-renderer-world-patch-lod-worldlodpatch-struct-worldlodpatch-src-mq3-renderer-world-patch-lod-ml-1184211951"></a>
## WorldLodPatch

```ml
struct WorldLodPatch
```

Data record for `mq3.renderer.world_patch_lod.WorldLodPatch`; groups `face`, `texture`, `lightmap`, `fog`, `grid`, `variants`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L14)

## Members

<a id="field-field-mq3-renderer-world-patch-lod-worldlodpatch-face-face-src-mq3-renderer-world-patch-lod-ml-475064632"></a>
### face

```ml
face
```

Source BSP face index identifying this patch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L16)

<a id="field-field-mq3-renderer-world-patch-lod-worldlodpatch-fog-fog-src-mq3-renderer-world-patch-lod-ml-1358478734"></a>
### fog

```ml
fog
```

Renderer fog index for this patch; zero means no fog volume.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L22)

<a id="field-field-mq3-renderer-world-patch-lod-worldlodpatch-grid-grid-src-mq3-renderer-world-patch-lod-ml-546090986"></a>
### grid

```ml
grid
```

Tessellated curved-patch grid and its detail-selection data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L24)

<a id="field-field-mq3-renderer-world-patch-lod-worldlodpatch-lightmap-lightmap-src-mq3-renderer-world-patch-lod-ml-1429914658"></a>
### lightmap

```ml
lightmap
```

BSP lightmap index assigned to the patch, or a negative no-lightmap selector.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L20)

<a id="field-field-mq3-renderer-world-patch-lod-worldlodpatch-texture-texture-src-mq3-renderer-world-patch-lod-ml-1392026234"></a>
### texture

```ml
texture
```

BSP shader index assigned to the patch surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L18)

<a id="field-field-mq3-renderer-world-patch-lod-worldlodpatch-variants-variants-src-mq3-renderer-world-patch-lod-ml-491172054"></a>
### variants

```ml
variants
```

Cached tessellation variants for different patch detail thresholds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L26)
