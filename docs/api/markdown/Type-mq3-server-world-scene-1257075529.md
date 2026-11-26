# `mq3.server.world.Scene`

[Home](README.md) · [Source file](File-src-mq3-server-world-ml-118313937.md)

<a id="struct-struct-mq3-server-world-scene-struct-scene-src-mq3-server-world-ml-1231888565"></a>
## Scene

```ml
struct Scene
```

Scene record for server.world, containing `world`, `entities`, `sectors`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L78)

## Members

<a id="field-field-mq3-server-world-scene-entities-entities-src-mq3-server-world-ml-1066331449"></a>
### entities

```ml
entities
```

Game or BSP entity records tracked by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L82)

<a id="field-field-mq3-server-world-scene-sectors-sectors-src-mq3-server-world-ml-804508123"></a>
### sectors

```ml
sectors
```

Spatial partition sectors used to find linked game entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L84)

<a id="field-field-mq3-server-world-scene-world-world-src-mq3-server-world-ml-617615719"></a>
### world

```ml
world
```

Collision or navigation world used by this operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L80)
