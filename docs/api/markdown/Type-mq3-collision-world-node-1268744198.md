# `mq3.collision.world.Node`

[Home](README.md) · [Source file](File-src-mq3-collision-world-ml-863162236.md)

<a id="struct-struct-mq3-collision-world-node-struct-node-src-mq3-collision-world-ml-1573349263"></a>
## Node

```ml
struct Node
```

Node record for collision.world, containing `plane`, `axis`, `children`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L95)

## Members

<a id="field-field-mq3-collision-world-node-axis-axis-src-mq3-collision-world-ml-2132116741"></a>
### axis

```ml
axis
```

Coordinate-axis index used by the optimized BSP split test.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L99)

<a id="field-field-mq3-collision-world-node-children-children-src-mq3-collision-world-ml-666683477"></a>
### children

```ml
children
```

Child BSP node indices; negative values encode leaf indices as minus one minus the leaf number.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L101)

<a id="field-field-mq3-collision-world-node-plane-plane-src-mq3-collision-world-ml-2097012479"></a>
### plane

```ml
plane
```

BSP splitting plane used to classify positions between the two child nodes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L97)
