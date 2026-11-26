# `mq3.server.world.Entity`

[Home](README.md) · [Source file](File-src-mq3-server-world-ml-118313937.md)

<a id="struct-struct-mq3-server-world-entity-struct-entity-src-mq3-server-world-ml-1029457155"></a>
## Entity

```ml
struct Entity
```

Entity record for server.world, containing `number`, `modelindex`, `solid`, `origin`, `angles`, `linked`, and 18 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L16)

## Members

<a id="field-field-mq3-server-world-entity-absmax-absmax-src-mq3-server-world-ml-1368131898"></a>
### absmax

```ml
absmax
```

Maximum corner of the entity's world-space collision bounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L44)

<a id="field-field-mq3-server-world-entity-absmin-absmin-src-mq3-server-world-ml-1127465594"></a>
### absmin

```ml
absmin
```

Minimum corner of the entity's world-space collision bounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L42)

<a id="field-field-mq3-server-world-entity-angles-angles-src-mq3-server-world-ml-2048899258"></a>
### angles

```ml
angles
```

Pitch, yaw, and roll values carried by the entity or user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L26)

<a id="field-field-mq3-server-world-entity-areanum-areanum-src-mq3-server-world-ml-865409866"></a>
### areanum

```ml
areanum
```

Primary collision area reached while linking this entity into the server world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L60)

<a id="field-field-mq3-server-world-entity-areanum2-areanum2-src-mq3-server-world-ml-678398032"></a>
### areanum2

```ml
areanum2
```

Second AAS area number used by the operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L62)

<a id="field-field-mq3-server-world-entity-bmodel-bmodel-src-mq3-server-world-ml-501930256"></a>
### bmodel

```ml
bmodel
```

True when the entity uses a brush-model collision hull.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L34)

<a id="field-field-mq3-server-world-entity-clusters-clusters-src-mq3-server-world-ml-840661432"></a>
### clusters

```ml
clusters
```

Cluster records or assignments used to group navigation and visibility areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L56)

<a id="field-field-mq3-server-world-entity-contents-contents-src-mq3-server-world-ml-815868466"></a>
### contents

```ml
contents
```

Collision or AAS contents flags describing the represented volume.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L40)

<a id="field-field-mq3-server-world-entity-currentangles-currentangles-src-mq3-server-world-ml-1303913290"></a>
### currentAngles

```ml
currentAngles
```

Current orientation angles used for collision and mover queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L48)

<a id="field-field-mq3-server-world-entity-currentorigin-currentorigin-src-mq3-server-world-ml-1303783642"></a>
### currentOrigin

```ml
currentOrigin
```

Current world-space position used for collision and mover queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L46)

<a id="field-field-mq3-server-world-entity-lastcluster-lastcluster-src-mq3-server-world-ml-538617010"></a>
### lastCluster

```ml
lastCluster
```

Final visibility cluster used when the explicit cluster list overflows.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L58)

<a id="field-field-mq3-server-world-entity-linkcount-linkcount-src-mq3-server-world-ml-295827610"></a>
### linkcount

```ml
linkcount
```

Number of times the entity has been linked or relinked into the world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L30)

<a id="field-field-mq3-server-world-entity-linked-linked-src-mq3-server-world-ml-415764404"></a>
### linked

```ml
linked
```

True when this entity or resource is linked into the world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L28)

<a id="field-field-mq3-server-world-entity-maxs-maxs-src-mq3-server-world-ml-1821216764"></a>
### maxs

```ml
maxs
```

Maximum XYZ corner of the linked server entity collision hull relative to its origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L38)

<a id="field-field-mq3-server-world-entity-mins-mins-src-mq3-server-world-ml-1418967252"></a>
### mins

```ml
mins
```

Minimum XYZ corner of the linked server entity collision hull relative to its origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L36)

<a id="field-field-mq3-server-world-entity-modelindex-modelindex-src-mq3-server-world-ml-2072545868"></a>
### modelindex

```ml
modelindex
```

Model index used to associate this entity or item with registered model data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L20)

<a id="field-field-mq3-server-world-entity-nextentity-nextentity-src-mq3-server-world-ml-2090283370"></a>
### nextEntity

```ml
nextEntity
```

Next entity in the same spatial-sector linked list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L54)

<a id="field-field-mq3-server-world-entity-number-number-src-mq3-server-world-ml-1135662660"></a>
### number

```ml
number
```

Game-entity number used by collision and linking queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L18)

<a id="field-field-mq3-server-world-entity-origin-origin-src-mq3-server-world-ml-139437730"></a>
### origin

```ml
origin
```

World-space reference position used to link the server entity collision hull.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L24)

<a id="field-field-mq3-server-world-entity-ownernum-ownernum-src-mq3-server-world-ml-2037136404"></a>
### ownerNum

```ml
ownerNum
```

Entity number of the owner excluded from selected collision tests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L50)

<a id="field-field-mq3-server-world-entity-sector-sector-src-mq3-server-world-ml-726402674"></a>
### sector

```ml
sector
```

Spatial sector containing this linked entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L52)

<a id="field-field-mq3-server-world-entity-singleclient-singleclient-src-mq3-server-world-ml-487639540"></a>
### singleClient

```ml
singleClient
```

Client number selected or excluded by the entity's single-client visibility flags.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L64)

<a id="field-field-mq3-server-world-entity-solid-solid-src-mq3-server-world-ml-307270474"></a>
### solid

```ml
solid
```

Encoded collision-hull or solidity value associated with the entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L22)

<a id="field-field-mq3-server-world-entity-svflags-svflags-src-mq3-server-world-ml-1003748022"></a>
### svFlags

```ml
svFlags
```

Server-side visibility and entity-behavior flags.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/world.ml#L32)
