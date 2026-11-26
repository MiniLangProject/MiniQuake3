# `src/mq3/renderer/pvs_query.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.pvs_query`](Package-mq3-renderer-pvs-query-549906635.md)

Reachable from entry: **yes**

## Imports

- `mq3/collision/visibility.ml` as `visibility` → [src/mq3/collision/visibility.ml](File-src-mq3-collision-visibility-ml-1423508826.md)
- `mq3/collision/world.ml` as `collision` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)

## Declarations

<a id="function-function-mq3-renderer-pvs-query-inpvs-function-inpvs-world-firstpoint-secondpoint-src-mq3-renderer-pvs-query-ml-550807928"></a>
### inPVS

```ml
function inPVS(world, firstPoint, secondPoint)
```

Computes `inPVS` from `(mask[secondCluster>>3]&(1<<(secondCluster&7)))!=0` using `mq3.collision.world.pointLeafnum`, `mq3.collision.visibility.leafCluster`, `mq3.collision.visibility.clusterPVS`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record providing `world.visibility`. |
| `firstPoint` | `dynamic` | — | Argument 2 supplied to `mq3.collision.world.pointLeafnum`. |
| `secondPoint` | `dynamic` | — | Argument 2 supplied to `mq3.collision.world.pointLeafnum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/pvs_query.ml#L14)
