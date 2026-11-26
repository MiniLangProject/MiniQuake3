# `mq3.botlib.aas_routing_cache.Scratch`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-routing-cache-ml-1923771141.md)

<a id="struct-struct-mq3-botlib-aas-routing-cache-scratch-struct-scratch-src-mq3-botlib-aas-routing-cache-ml-1652065681"></a>
## Scratch

```ml
struct Scratch
```

`Scratch` record for aas routing cache, containing `areaQueue`, `areaQueued`, `areaTimes`, `areaOutgoing` and `portalQueue` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L276)

## Members

<a id="field-field-mq3-botlib-aas-routing-cache-scratch-areaoutgoing-areaoutgoing-src-mq3-botlib-aas-routing-cache-ml-2050180999"></a>
### areaOutgoing

```ml
areaOutgoing
```

Temporary outgoing reachability lists used by the area solver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L284)

<a id="field-field-mq3-botlib-aas-routing-cache-scratch-areaqueue-areaqueue-src-mq3-botlib-aas-routing-cache-ml-1589070533"></a>
### areaQueue

```ml
areaQueue
```

Area indexes awaiting routing-cost propagation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L278)

<a id="field-field-mq3-botlib-aas-routing-cache-scratch-areaqueued-areaqueued-src-mq3-botlib-aas-routing-cache-ml-464381529"></a>
### areaQueued

```ml
areaQueued
```

Membership flags for areas already queued for propagation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L280)

<a id="field-field-mq3-botlib-aas-routing-cache-scratch-areatimes-areatimes-src-mq3-botlib-aas-routing-cache-ml-789526861"></a>
### areaTimes

```ml
areaTimes
```

Temporary travel costs accumulated for each area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L282)

<a id="field-field-mq3-botlib-aas-routing-cache-scratch-portalqueue-portalqueue-src-mq3-botlib-aas-routing-cache-ml-1407699037"></a>
### portalQueue

```ml
portalQueue
```

Portal updates awaiting cost propagation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L286)

<a id="field-field-mq3-botlib-aas-routing-cache-scratch-portalqueued-portalqueued-src-mq3-botlib-aas-routing-cache-ml-1952449279"></a>
### portalQueued

```ml
portalQueued
```

Membership flags for portals already queued for propagation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L288)

<a id="field-field-mq3-botlib-aas-routing-cache-scratch-portalupdates-portalupdates-src-mq3-botlib-aas-routing-cache-ml-1049930837"></a>
### portalUpdates

```ml
portalUpdates
```

Reusable update records indexed by portal number.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_cache.ml#L290)
