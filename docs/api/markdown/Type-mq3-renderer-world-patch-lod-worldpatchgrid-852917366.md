# `mq3.renderer.world_patch_lod.WorldPatchGrid`

[Home](README.md) · [Source file](File-src-mq3-renderer-world-patch-lod-ml-389439102.md)

<a id="struct-struct-mq3-renderer-world-patch-lod-worldpatchgrid-struct-worldpatchgrid-src-mq3-renderer-world-patch-lod-ml-1175420555"></a>
## WorldPatchGrid

```ml
struct WorldPatchGrid
```

Data record for `mq3.renderer.world_patch_lod.WorldPatchGrid`; groups `control`, `width`, `height`, `widthLodError`, `heightLodError`, `lodOrigin`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L29)

## Members

<a id="field-field-mq3-renderer-world-patch-lod-worldpatchgrid-control-control-src-mq3-renderer-world-patch-lod-ml-2021859263"></a>
### control

```ml
control
```

Original control-point grid retained for patch retessellation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L31)

<a id="field-field-mq3-renderer-world-patch-lod-worldpatchgrid-height-height-src-mq3-renderer-world-patch-lod-ml-709352909"></a>
### height

```ml
height
```

Number of rows in the patch vertex grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L35)

<a id="field-field-mq3-renderer-world-patch-lod-worldpatchgrid-heightloderror-heightloderror-src-mq3-renderer-world-patch-lod-ml-462257015"></a>
### heightLodError

```ml
heightLodError
```

Per-row geometric error used when selecting patch detail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L39)

<a id="field-field-mq3-renderer-world-patch-lod-worldpatchgrid-lodfixed-lodfixed-src-mq3-renderer-world-patch-lod-ml-2037571841"></a>
### lodFixed

```ml
lodFixed
```

Whether patch edge detail has been reconciled with neighboring patches.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L45)

<a id="field-field-mq3-renderer-world-patch-lod-worldpatchgrid-lodorigin-lodorigin-src-mq3-renderer-world-patch-lod-ml-429608735"></a>
### lodOrigin

```ml
lodOrigin
```

Reference origin used when evaluating patch level of detail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L41)

<a id="field-field-mq3-renderer-world-patch-lod-worldpatchgrid-lodradius-lodradius-src-mq3-renderer-world-patch-lod-ml-1697486551"></a>
### lodRadius

```ml
lodRadius
```

Reference radius used when evaluating patch level of detail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L43)

<a id="field-field-mq3-renderer-world-patch-lod-worldpatchgrid-lodstitched-lodstitched-src-mq3-renderer-world-patch-lod-ml-996486203"></a>
### lodStitched

```ml
lodStitched
```

Whether the patch grid has been stitched to adjacent geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L47)

<a id="field-field-mq3-renderer-world-patch-lod-worldpatchgrid-width-width-src-mq3-renderer-world-patch-lod-ml-996080991"></a>
### width

```ml
width
```

Number of columns in the patch vertex grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L33)

<a id="field-field-mq3-renderer-world-patch-lod-worldpatchgrid-widthloderror-widthloderror-src-mq3-renderer-world-patch-lod-ml-1096152407"></a>
### widthLodError

```ml
widthLodError
```

Per-column geometric error used when selecting patch detail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_patch_lod.ml#L37)
