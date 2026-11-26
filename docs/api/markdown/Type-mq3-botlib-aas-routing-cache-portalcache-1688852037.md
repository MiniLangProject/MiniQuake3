# `mq3.botlib.aas_routing_cache.PortalCache`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-routing-cache-ml-1923771141.md)

<a id="struct-struct-mq3-botlib-aas-routing-cache-portalcache-struct-portalcache-src-mq3-botlib-aas-routing-cache-ml-82715449"></a>
## PortalCache

```ml
struct PortalCache
```

`PortalCache` record for aas routing cache, containing `cluster`, `goalAreaNum`, `travelFlags`, `travelTimes` and `reachabilities` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L92)

## Members

<a id="field-field-mq3-botlib-aas-routing-cache-portalcache-cluster-cluster-src-mq3-botlib-aas-routing-cache-ml-1685036295"></a>
### cluster

```ml
cluster
```

Goal cluster for which these inter-portal costs were computed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L94)

<a id="field-field-mq3-botlib-aas-routing-cache-portalcache-generation-generation-src-mq3-botlib-aas-routing-cache-ml-314991655"></a>
### generation

```ml
generation
```

Generation counter used to distinguish refreshed state from older entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L104)

<a id="field-field-mq3-botlib-aas-routing-cache-portalcache-goalareanum-goalareanum-src-mq3-botlib-aas-routing-cache-ml-2124360455"></a>
### goalAreaNum

```ml
goalAreaNum
```

AAS area containing the destination of this route or goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L96)

<a id="field-field-mq3-botlib-aas-routing-cache-portalcache-reachabilities-reachabilities-src-mq3-botlib-aas-routing-cache-ml-1931482297"></a>
### reachabilities

```ml
reachabilities
```

Reachabilities used for routing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L102)

<a id="field-field-mq3-botlib-aas-routing-cache-portalcache-serial-serial-src-mq3-botlib-aas-routing-cache-ml-1359065159"></a>
### serial

```ml
serial
```

Serial number identifying the current update or allocation generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L106)

<a id="field-field-mq3-botlib-aas-routing-cache-portalcache-travelflags-travelflags-src-mq3-botlib-aas-routing-cache-ml-1205924143"></a>
### travelFlags

```ml
travelFlags
```

Combined AAS travel permissions used to select routes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L98)

<a id="field-field-mq3-botlib-aas-routing-cache-portalcache-traveltimes-traveltimes-src-mq3-botlib-aas-routing-cache-ml-519577015"></a>
### travelTimes

```ml
travelTimes
```

Travel cost to the goal indexed by AAS portal number.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L100)
