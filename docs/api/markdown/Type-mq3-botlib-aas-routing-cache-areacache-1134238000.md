# `mq3.botlib.aas_routing_cache.AreaCache`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-routing-cache-ml-1923771141.md)

<a id="struct-struct-mq3-botlib-aas-routing-cache-areacache-struct-areacache-src-mq3-botlib-aas-routing-cache-ml-188450075"></a>
## AreaCache

```ml
struct AreaCache
```

`AreaCache` record for aas routing cache, containing `cluster`, `goalAreaNum`, `travelFlags`, `travelTimes` and `reachabilities` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L75)

## Members

<a id="field-field-mq3-botlib-aas-routing-cache-areacache-cluster-cluster-src-mq3-botlib-aas-routing-cache-ml-1973774594"></a>
### cluster

```ml
cluster
```

AAS cluster for which these within-cluster costs were computed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L77)

<a id="field-field-mq3-botlib-aas-routing-cache-areacache-generation-generation-src-mq3-botlib-aas-routing-cache-ml-12553306"></a>
### generation

```ml
generation
```

Generation counter used to distinguish refreshed state from older entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L87)

<a id="field-field-mq3-botlib-aas-routing-cache-areacache-goalareanum-goalareanum-src-mq3-botlib-aas-routing-cache-ml-151407266"></a>
### goalAreaNum

```ml
goalAreaNum
```

AAS area containing the destination of this route or goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L79)

<a id="field-field-mq3-botlib-aas-routing-cache-areacache-reachabilities-reachabilities-src-mq3-botlib-aas-routing-cache-ml-184561868"></a>
### reachabilities

```ml
reachabilities
```

Reachabilities used for routing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L85)

<a id="field-field-mq3-botlib-aas-routing-cache-areacache-serial-serial-src-mq3-botlib-aas-routing-cache-ml-1189689926"></a>
### serial

```ml
serial
```

Serial number identifying the current update or allocation generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L89)

<a id="field-field-mq3-botlib-aas-routing-cache-areacache-travelflags-travelflags-src-mq3-botlib-aas-routing-cache-ml-1402411226"></a>
### travelFlags

```ml
travelFlags
```

Combined AAS travel permissions used to select routes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L81)

<a id="field-field-mq3-botlib-aas-routing-cache-areacache-traveltimes-traveltimes-src-mq3-botlib-aas-routing-cache-ml-1283337026"></a>
### travelTimes

```ml
travelTimes
```

Travel time for every area (variable sized).


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L83)
