# `mq3.collision.winding.ManagedWinding`

[Home](README.md) · [Source file](File-src-mq3-collision-winding-ml-1357853358.md)

<a id="struct-struct-mq3-collision-winding-managedwinding-struct-managedwinding-src-mq3-collision-winding-ml-1495432563"></a>
## ManagedWinding

```ml
struct ManagedWinding
```

ManagedWinding record for collision.winding, containing `points`, `capacity`, `freed`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/winding.ml#L27)

## Members

<a id="field-field-mq3-collision-winding-managedwinding-capacity-capacity-src-mq3-collision-winding-ml-1913917724"></a>
### capacity

```ml
capacity
```

Maximum number of entries allowed in the managed collection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/winding.ml#L31)

<a id="field-field-mq3-collision-winding-managedwinding-freed-freed-src-mq3-collision-winding-ml-1600244428"></a>
### freed

```ml
freed
```

True after this managed resource has been released.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/winding.ml#L33)

<a id="field-field-mq3-collision-winding-managedwinding-points-points-src-mq3-collision-winding-ml-71190350"></a>
### points

```ml
points
```

XYZ points defining the debug shape, polygon, or winding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/winding.ml#L29)
