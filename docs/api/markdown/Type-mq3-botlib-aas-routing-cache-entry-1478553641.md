# `mq3.botlib.aas_routing_cache.Entry`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-routing-cache-ml-1923771141.md)

<a id="struct-struct-mq3-botlib-aas-routing-cache-entry-struct-entry-src-mq3-botlib-aas-routing-cache-ml-623663645"></a>
## Entry

```ml
struct Entry
```

`Entry` record for aas routing cache, containing `type`, `cluster`, `areaNum`, `goalAreaNum` and `travelFlags` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L52)

## Members

<a id="field-field-mq3-botlib-aas-routing-cache-entry-areanum-areanum-src-mq3-botlib-aas-routing-cache-ml-1757780299"></a>
### areaNum

```ml
areaNum
```

Starting navigation area of the route represented by this cache entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L58)

<a id="field-field-mq3-botlib-aas-routing-cache-entry-cluster-cluster-src-mq3-botlib-aas-routing-cache-ml-1262464611"></a>
### cluster

```ml
cluster
```

AAS cluster for which this cached route was calculated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L56)

<a id="field-field-mq3-botlib-aas-routing-cache-entry-generation-generation-src-mq3-botlib-aas-routing-cache-ml-913816931"></a>
### generation

```ml
generation
```

Generation counter used to distinguish refreshed state from older entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L70)

<a id="field-field-mq3-botlib-aas-routing-cache-entry-goalareanum-goalareanum-src-mq3-botlib-aas-routing-cache-ml-1256875555"></a>
### goalAreaNum

```ml
goalAreaNum
```

AAS area containing the destination of this route or goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L60)

<a id="field-field-mq3-botlib-aas-routing-cache-entry-hasorigin-hasorigin-src-mq3-botlib-aas-routing-cache-ml-489982835"></a>
### hasOrigin

```ml
hasOrigin
```

True when the cache key includes a specific within-area origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L64)

<a id="field-field-mq3-botlib-aas-routing-cache-entry-originbits-originbits-src-mq3-botlib-aas-routing-cache-ml-513205487"></a>
### originBits

```ml
originBits
```

Bit-preserving coordinate representation used in the route cache key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L66)

<a id="field-field-mq3-botlib-aas-routing-cache-entry-route-route-src-mq3-botlib-aas-routing-cache-ml-796757551"></a>
### route

```ml
route
```

Calculated route result retained by this entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L68)

<a id="field-field-mq3-botlib-aas-routing-cache-entry-serial-serial-src-mq3-botlib-aas-routing-cache-ml-327580899"></a>
### serial

```ml
serial
```

Serial number identifying the current update or allocation generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L72)

<a id="field-field-mq3-botlib-aas-routing-cache-entry-travelflags-travelflags-src-mq3-botlib-aas-routing-cache-ml-1200403227"></a>
### travelFlags

```ml
travelFlags
```

Combined AAS travel permissions used to select routes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L62)

<a id="field-field-mq3-botlib-aas-routing-cache-entry-type-type-src-mq3-botlib-aas-routing-cache-ml-1788751843"></a>
### type

```ml
type
```

Cache-entry discriminator selecting an area or portal route.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L54)
