# `mq3.botlib.be_aas_route.RoutingCache`

[Home](README.md) · [Source file](File-src-mq3-botlib-be-aas-route-ml-448925219.md)

<a id="struct-struct-mq3-botlib-be-aas-route-routingcache-struct-routingcache-src-mq3-botlib-be-aas-route-ml-719934479"></a>
## RoutingCache

```ml
struct RoutingCache
```

`RoutingCache` record for be aas route, containing `size`, `cluster`, `areaNum`, `travelFlags` and `travelTimes` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L38)

## Members

<a id="field-field-mq3-botlib-be-aas-route-routingcache-areanum-areanum-src-mq3-botlib-be-aas-route-ml-974272367"></a>
### areaNum

```ml
areaNum
```

Goal area for which this legacy routing-cache record stores travel costs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L44)

<a id="field-field-mq3-botlib-be-aas-route-routingcache-cluster-cluster-src-mq3-botlib-be-aas-route-ml-1358482991"></a>
### cluster

```ml
cluster
```

Cluster the cache is for.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L42)

<a id="field-field-mq3-botlib-be-aas-route-routingcache-linked-linked-src-mq3-botlib-be-aas-route-ml-912715157"></a>
### linked

```ml
linked
```

True when this entity or resource is linked into the world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L54)

<a id="field-field-mq3-botlib-be-aas-route-routingcache-payloadtype-payloadtype-src-mq3-botlib-be-aas-route-ml-1843024655"></a>
### payloadType

```ml
payloadType
```

Discriminator selecting the area or portal routing-table payload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L56)

<a id="field-field-mq3-botlib-be-aas-route-routingcache-reachabilities-reachabilities-src-mq3-botlib-be-aas-route-ml-342612673"></a>
### reachabilities

```ml
reachabilities
```

Reachabilities used for routing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L50)

<a id="field-field-mq3-botlib-be-aas-route-routingcache-size-size-src-mq3-botlib-be-aas-route-ml-1485163241"></a>
### size

```ml
size
```

Size of the routing cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L40)

<a id="field-field-mq3-botlib-be-aas-route-routingcache-time-time-src-mq3-botlib-be-aas-route-ml-1559646441"></a>
### time

```ml
time
```

Last time accessed or updated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L52)

<a id="field-field-mq3-botlib-be-aas-route-routingcache-travelflags-travelflags-src-mq3-botlib-be-aas-route-ml-1199593215"></a>
### travelFlags

```ml
travelFlags
```

Combined AAS travel permissions used to select routes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L46)

<a id="field-field-mq3-botlib-be-aas-route-routingcache-traveltimes-traveltimes-src-mq3-botlib-be-aas-route-ml-517596479"></a>
### travelTimes

```ml
travelTimes
```

Travel time for every area (variable sized).


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L48)
