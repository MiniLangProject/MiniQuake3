# `mq3.server.world.Sector`

[Home](README.md) · [Source file](File-src-mq3-server-world-ml-118313937.md)

<a id="struct-struct-mq3-server-world-sector-struct-sector-src-mq3-server-world-ml-214375139"></a>
## Sector

```ml
struct Sector
```

Sector record for server.world, containing `axis`, `distance`, `children`, `head`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L67)

## Members

<a id="field-field-mq3-server-world-sector-axis-axis-src-mq3-server-world-ml-1129843489"></a>
### axis

```ml
axis
```

Coordinate-axis index along which this spatial sector is split.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L69)

<a id="field-field-mq3-server-world-sector-children-children-src-mq3-server-world-ml-399861345"></a>
### children

```ml
children
```

Child sector indexes on either side of the split.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L73)

<a id="field-field-mq3-server-world-sector-distance-distance-src-mq3-server-world-ml-662497629"></a>
### distance

```ml
distance
```

Coordinate value of the sector's splitting plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L71)

<a id="field-field-mq3-server-world-sector-head-head-src-mq3-server-world-ml-1957710387"></a>
### head

```ml
head
```

First entity linked into this sector.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L75)
