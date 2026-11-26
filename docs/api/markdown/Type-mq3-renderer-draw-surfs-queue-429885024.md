# `mq3.renderer.draw_surfs.Queue`

[Home](README.md) · [Source file](File-src-mq3-renderer-draw-surfs-ml-75092385.md)

<a id="struct-struct-mq3-renderer-draw-surfs-queue-struct-queue-src-mq3-renderer-draw-surfs-ml-120744771"></a>
## Queue

```ml
struct Queue
```

Data record for `mq3.renderer.draw_surfs.Queue`; groups `drawSurfs`, `capacity`, `numDrawSurfs`, `nextOrdinal`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L41)

## Members

<a id="field-field-mq3-renderer-draw-surfs-queue-capacity-capacity-src-mq3-renderer-draw-surfs-ml-1928107344"></a>
### capacity

```ml
capacity
```

Maximum number of draw-surface records retained in the queue.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L45)

<a id="field-field-mq3-renderer-draw-surfs-queue-drawsurfs-drawsurfs-src-mq3-renderer-draw-surfs-ml-1794440340"></a>
### drawSurfs

```ml
drawSurfs
```

Surfaces queued for ordering and drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L43)

<a id="field-field-mq3-renderer-draw-surfs-queue-nextordinal-nextordinal-src-mq3-renderer-draw-surfs-ml-121494036"></a>
### nextOrdinal

```ml
nextOrdinal
```

Insertion-order number assigned to the next queued surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L49)

<a id="field-field-mq3-renderer-draw-surfs-queue-numdrawsurfs-numdrawsurfs-src-mq3-renderer-draw-surfs-ml-1323254914"></a>
### numDrawSurfs

```ml
numDrawSurfs
```

Number of draw surfaces currently queued.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L47)
