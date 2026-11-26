# `mq3.botlib.aas_routing_cache.Cache`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-routing-cache-ml-1923771141.md)

<a id="struct-struct-mq3-botlib-aas-routing-cache-cache-struct-cache-src-mq3-botlib-aas-routing-cache-ml-362311561"></a>
## Cache

```ml
struct Cache
```

`Cache` record for aas routing cache, containing `router`, `entries`, `areaCaches`, `portalCaches` and `generation` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L109)

## Members

<a id="field-field-mq3-botlib-aas-routing-cache-cache-areacaches-areacaches-src-mq3-botlib-aas-routing-cache-ml-241755469"></a>
### areaCaches

```ml
areaCaches
```

Cached travel-cost tables for routes inside a cluster.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L115)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-areaevictions-areaevictions-src-mq3-botlib-aas-routing-cache-ml-731137473"></a>
### areaEvictions

```ml
areaEvictions
```

Area routing tables removed to enforce cache capacity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L139)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-areahits-areahits-src-mq3-botlib-aas-routing-cache-ml-1319937747"></a>
### areaHits

```ml
areaHits
```

Area-table lookups satisfied by an existing cached table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L133)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-areaindex-areaindex-src-mq3-botlib-aas-routing-cache-ml-1033269021"></a>
### areaIndex

```ml
areaIndex
```

Index from area-table keys to cached tables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L153)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-arealru-arealru-src-mq3-botlib-aas-routing-cache-ml-1654111033"></a>
### areaLru

```ml
areaLru
```

Least-recently-used ordering of area-routing tables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L163)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-areamisses-areamisses-src-mq3-botlib-aas-routing-cache-ml-565120391"></a>
### areaMisses

```ml
areaMisses
```

Area-table lookups requiring a new table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L135)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-areaupdates-areaupdates-src-mq3-botlib-aas-routing-cache-ml-1446489157"></a>
### areaUpdates

```ml
areaUpdates
```

Area routing tables built or refreshed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L137)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-destinationcosts-destinationcosts-src-mq3-botlib-aas-routing-cache-ml-903128765"></a>
### destinationCosts

```ml
destinationCosts
```

Cached cost maps keyed by destination and travel restrictions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L169)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-destinationlru-destinationlru-src-mq3-botlib-aas-routing-cache-ml-503157971"></a>
### destinationLru

```ml
destinationLru
```

Least-recently-used ordering of destination-specific cost maps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L167)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-entries-entries-src-mq3-botlib-aas-routing-cache-ml-1334144949"></a>
### entries

```ml
entries
```

Cached complete route results and their lookup keys.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L113)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-evictions-evictions-src-mq3-botlib-aas-routing-cache-ml-1617233961"></a>
### evictions

```ml
evictions
```

Complete-route entries removed to enforce cache capacity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L129)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-generation-generation-src-mq3-botlib-aas-routing-cache-ml-941949817"></a>
### generation

```ml
generation
```

Generation counter used to distinguish refreshed state from older entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L119)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-hits-hits-src-mq3-botlib-aas-routing-cache-ml-61644977"></a>
### hits

```ml
hits
```

Complete-route lookups satisfied by an existing cache entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L125)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-invalidations-invalidations-src-mq3-botlib-aas-routing-cache-ml-1534258933"></a>
### invalidations

```ml
invalidations
```

Cache invalidations caused by changed area or route state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L131)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-maxentries-maxentries-src-mq3-botlib-aas-routing-cache-ml-264642697"></a>
### maxEntries

```ml
maxEntries
```

Maximum number of complete route entries retained by the cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L123)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-misses-misses-src-mq3-botlib-aas-routing-cache-ml-2024827289"></a>
### misses

```ml
misses
```

Complete-route lookups requiring a new calculation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L127)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-portalcaches-portalcaches-src-mq3-botlib-aas-routing-cache-ml-1480487179"></a>
### portalCaches

```ml
portalCaches
```

Cached travel-cost tables between cluster portals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L117)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-portalevictions-portalevictions-src-mq3-botlib-aas-routing-cache-ml-1945085573"></a>
### portalEvictions

```ml
portalEvictions
```

Portal routing tables removed to enforce cache capacity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L147)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-portalhits-portalhits-src-mq3-botlib-aas-routing-cache-ml-1154887785"></a>
### portalHits

```ml
portalHits
```

Portal-table lookups satisfied by an existing cached table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L141)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-portalindex-portalindex-src-mq3-botlib-aas-routing-cache-ml-921421633"></a>
### portalIndex

```ml
portalIndex
```

Lookup from cluster, goal-area, and travel-flag keys to cached portal-routing tables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L155)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-portallru-portallru-src-mq3-botlib-aas-routing-cache-ml-182175045"></a>
### portalLru

```ml
portalLru
```

Least-recently-used ordering of portal-routing tables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L165)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-portalmisses-portalmisses-src-mq3-botlib-aas-routing-cache-ml-2008499321"></a>
### portalMisses

```ml
portalMisses
```

Portal-table lookups requiring a new table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L143)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-portalupdates-portalupdates-src-mq3-botlib-aas-routing-cache-ml-2111933573"></a>
### portalUpdates

```ml
portalUpdates
```

Portal routing tables built or refreshed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L145)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-routeindex-routeindex-src-mq3-botlib-aas-routing-cache-ml-215527435"></a>
### routeIndex

```ml
routeIndex
```

Index from complete-route keys to cache entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L151)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-routelru-routelru-src-mq3-botlib-aas-routing-cache-ml-1635309265"></a>
### routeLru

```ml
routeLru
```

Least-recently-used ordering of complete-route entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L161)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-router-router-src-mq3-botlib-aas-routing-cache-ml-1542316939"></a>
### router

```ml
router
```

AAS navigation state supplying area settings and reachabilities for route searches.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L111)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-scratch-scratch-src-mq3-botlib-aas-routing-cache-ml-1459063097"></a>
### scratch

```ml
scratch
```

Reusable queues and temporary costs for routing-table construction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L157)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-scratchbuilds-scratchbuilds-src-mq3-botlib-aas-routing-cache-ml-1232854529"></a>
### scratchBuilds

```ml
scratchBuilds
```

Number of temporary routing workspaces constructed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L159)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-serial-serial-src-mq3-botlib-aas-routing-cache-ml-1136366313"></a>
### serial

```ml
serial
```

Serial number identifying the current update or allocation generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L121)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-statictables-statictables-src-mq3-botlib-aas-routing-cache-ml-236475947"></a>
### staticTables

```ml
staticTables
```

Precomputed reverse-link and portal travel-time tables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L149)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-weightedbuilds-weightedbuilds-src-mq3-botlib-aas-routing-cache-ml-453541313"></a>
### weightedBuilds

```ml
weightedBuilds
```

Weighted destination-cost maps built by the optimized route path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L171)

<a id="field-field-mq3-botlib-aas-routing-cache-cache-weightedfallbacks-weightedfallbacks-src-mq3-botlib-aas-routing-cache-ml-2097034989"></a>
### weightedFallbacks

```ml
weightedFallbacks
```

Route queries that required the fallback weighted search.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L173)
