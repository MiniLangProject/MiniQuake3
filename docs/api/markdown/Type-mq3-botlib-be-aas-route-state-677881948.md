# `mq3.botlib.be_aas_route.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-be-aas-route-ml-448925219.md)

<a id="struct-struct-mq3-botlib-be-aas-route-state-struct-state-src-mq3-botlib-be-aas-route-ml-1647206843"></a>
## State

```ml
struct State
```

`State` record for be aas route, containing `runtime`, `router`, `cache`, `staticTables` and `areaContentTravelFlags` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L59)

## Members

<a id="field-field-mq3-botlib-be-aas-route-state-areacontenttravelflags-areacontenttravelflags-src-mq3-botlib-be-aas-route-ml-369040008"></a>
### areaContentTravelFlags

```ml
areaContentTravelFlags
```

Travel-permission masks derived from each area's contents.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L69)

<a id="field-field-mq3-botlib-be-aas-route-state-cache-cache-src-mq3-botlib-be-aas-route-ml-1733490482"></a>
### cache

```ml
cache
```

Cached lookup or routing data reused by subsequent requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L65)

<a id="field-field-mq3-botlib-be-aas-route-state-initialized-initialized-src-mq3-botlib-be-aas-route-ml-1022763362"></a>
### initialized

```ml
initialized
```

True after routing flags, reverse links, caches, and travel-time tables have been built.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L77)

<a id="field-field-mq3-botlib-be-aas-route-state-lru-lru-src-mq3-botlib-be-aas-route-ml-285507818"></a>
### lru

```ml
lru
```

Least-recently-used ordering of cached routes or areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L75)

<a id="field-field-mq3-botlib-be-aas-route-state-maxroutingcachesize-maxroutingcachesize-src-mq3-botlib-be-aas-route-ml-927320510"></a>
### maxRoutingCacheSize

```ml
maxRoutingCacheSize
```

Maximum size allowed for cached routing data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L81)

<a id="field-field-mq3-botlib-be-aas-route-state-reachabilityareaindex-reachabilityareaindex-src-mq3-botlib-be-aas-route-ml-100720450"></a>
### reachabilityAreaIndex

```ml
reachabilityAreaIndex
```

Index used to look up areas associated with each reachability.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L73)

<a id="field-field-mq3-botlib-be-aas-route-state-reachabilityareas-reachabilityareas-src-mq3-botlib-be-aas-route-ml-1763419214"></a>
### reachabilityAreas

```ml
reachabilityAreas
```

Area membership information associated with stored reachabilities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L71)

<a id="field-field-mq3-botlib-be-aas-route-state-router-router-src-mq3-botlib-be-aas-route-ml-250680704"></a>
### router

```ml
router
```

AAS navigation state supplying area settings and reachabilities for route searches.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L63)

<a id="field-field-mq3-botlib-be-aas-route-state-routingcachesize-routingcachesize-src-mq3-botlib-be-aas-route-ml-1659092644"></a>
### routingCacheSize

```ml
routingCacheSize
```

Current size charged to cached routing data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L79)

<a id="field-field-mq3-botlib-be-aas-route-state-runtime-runtime-src-mq3-botlib-be-aas-route-ml-995406826"></a>
### runtime

```ml
runtime
```

Navigation runtime supplying map geometry and area availability to the routing facade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L61)

<a id="field-field-mq3-botlib-be-aas-route-state-services-services-src-mq3-botlib-be-aas-route-ml-1935560490"></a>
### services

```ml
services
```

Visibility, crossed-area, and random-choice services used by the routing facade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L83)

<a id="field-field-mq3-botlib-be-aas-route-state-statictables-statictables-src-mq3-botlib-be-aas-route-ml-705925180"></a>
### staticTables

```ml
staticTables
```

Precomputed reverse-link and portal travel-time tables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_route.ml#L67)
