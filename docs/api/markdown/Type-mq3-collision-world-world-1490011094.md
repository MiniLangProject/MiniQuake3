# `mq3.collision.world.World`

[Home](README.md) · [Source file](File-src-mq3-collision-world-ml-863162236.md)

<a id="struct-struct-mq3-collision-world-world-struct-world-src-mq3-collision-world-ml-1572894925"></a>
## World

```ml
struct World
```

World record for collision.world, containing `brushes`, `nodes`, `leaves`, `models`, `surfaces`, `patchesReady`, and 8 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L120)

## Members

<a id="field-field-mq3-collision-world-world-bounds-bounds-src-mq3-collision-world-ml-1611163329"></a>
### bounds

```ml
bounds
```

Minimum and maximum bounds for each inline collision model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L136)

<a id="field-field-mq3-collision-world-world-brushes-brushes-src-mq3-collision-world-ml-1104169503"></a>
### brushes

```ml
brushes
```

Convex collision brushes loaded from the BSP.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L122)

<a id="field-field-mq3-collision-world-world-checksum-checksum-src-mq3-collision-world-ml-1904695109"></a>
### checksum

```ml
checksum
```

Checksum used to validate or identify the represented data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L146)

<a id="field-field-mq3-collision-world-world-entitystring-entitystring-src-mq3-collision-world-ml-1780612639"></a>
### entityString

```ml
entityString
```

Textual entity definitions extracted from the BSP entity lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L142)

<a id="field-field-mq3-collision-world-world-leaves-leaves-src-mq3-collision-world-ml-1672671563"></a>
### leaves

```ml
leaves
```

BSP leaves referencing collision brushes and patch surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L126)

<a id="field-field-mq3-collision-world-world-models-models-src-mq3-collision-world-ml-1787104991"></a>
### models

```ml
models
```

Submodel records associated with the loaded map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L128)

<a id="field-field-mq3-collision-world-world-name-name-src-mq3-collision-world-ml-440243253"></a>
### name

```ml
name
```

Name of the currently loaded collision map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L148)

<a id="field-field-mq3-collision-world-world-nodes-nodes-src-mq3-collision-world-ml-1233042143"></a>
### nodes

```ml
nodes
```

BSP nodes used to partition the collision or navigation world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L124)

<a id="field-field-mq3-collision-world-world-patchesready-patchesready-src-mq3-collision-world-ml-38269305"></a>
### patchesReady

```ml
patchesReady
```

True after curved-surface collision meshes have been built.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L132)

<a id="field-field-mq3-collision-world-world-playercurveclip-playercurveclip-src-mq3-collision-world-ml-1867318271"></a>
### playerCurveClip

```ml
playerCurveClip
```

True when player traces include curved patch collision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L134)

<a id="field-field-mq3-collision-world-world-shaders-shaders-src-mq3-collision-world-ml-342675735"></a>
### shaders

```ml
shaders
```

Shader flags and contents used by collision surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L144)

<a id="field-field-mq3-collision-world-world-surfaces-surfaces-src-mq3-collision-world-ml-1466420967"></a>
### surfaces

```ml
surfaces
```

Collision-surface records indexed by BSP surface number; non-patch entries have no patch geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L130)

<a id="field-field-mq3-collision-world-world-temporary-temporary-src-mq3-collision-world-ml-1250195235"></a>
### temporary

```ml
temporary
```

Reusable temporary box and capsule collision-model state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L138)

<a id="field-field-mq3-collision-world-world-visibility-visibility-src-mq3-collision-world-ml-1341189663"></a>
### visibility

```ml
visibility
```

Cluster and portal-area visibility data for the loaded map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L140)
