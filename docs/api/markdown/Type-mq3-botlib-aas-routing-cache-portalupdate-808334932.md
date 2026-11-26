# `mq3.botlib.aas_routing_cache.PortalUpdate`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-routing-cache-ml-1923771141.md)

<a id="struct-struct-mq3-botlib-aas-routing-cache-portalupdate-struct-portalupdate-src-mq3-botlib-aas-routing-cache-ml-65770855"></a>
## PortalUpdate

```ml
struct PortalUpdate
```

Area and portal builders have separate scratch space: portal propagation calls getAreaCache recursively and must not overwrite its own queue.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L267)

## Members

<a id="field-field-mq3-botlib-aas-routing-cache-portalupdate-area-area-src-mq3-botlib-aas-routing-cache-ml-1274814936"></a>
### area

```ml
area
```

Portal or goal area from which this cluster update propagates routing costs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L271)

<a id="field-field-mq3-botlib-aas-routing-cache-portalupdate-cluster-cluster-src-mq3-botlib-aas-routing-cache-ml-1298173350"></a>
### cluster

```ml
cluster
```

Cluster whose portal costs are being updated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L269)

<a id="field-field-mq3-botlib-aas-routing-cache-portalupdate-time-time-src-mq3-botlib-aas-routing-cache-ml-1540446952"></a>
### time

```ml
time
```

Accumulated travel cost propagated by this portal update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L273)
