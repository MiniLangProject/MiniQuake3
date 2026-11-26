# `mq3.botlib.aas_routing_tables.Tables`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-routing-tables-ml-2134281168.md)

<a id="struct-struct-mq3-botlib-aas-routing-tables-tables-struct-tables-src-mq3-botlib-aas-routing-tables-ml-1982647885"></a>
## Tables

```ml
struct Tables
```

`Tables` record for aas routing tables, containing `router`, `reversed`, `areaTravelTimes`, `portalMaxTravelTimes` and `totalLinks` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_tables.ml#L20)

## Members

<a id="field-field-mq3-botlib-aas-routing-tables-tables-areatraveltimes-areatraveltimes-src-mq3-botlib-aas-routing-tables-ml-558775650"></a>
### areaTravelTimes

```ml
areaTravelTimes
```

Travel times within the area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_tables.ml#L26)

<a id="field-field-mq3-botlib-aas-routing-tables-tables-portalmaxtraveltimes-portalmaxtraveltimes-src-mq3-botlib-aas-routing-tables-ml-647689902"></a>
### portalMaxTravelTimes

```ml
portalMaxTravelTimes
```

Precomputed upper travel-time bounds for cluster portals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_tables.ml#L28)

<a id="field-field-mq3-botlib-aas-routing-tables-tables-reachsources-reachsources-src-mq3-botlib-aas-routing-tables-ml-1535388280"></a>
### reachSources

```ml
reachSources
```

Source-area numbers associated with stored reachability records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_tables.ml#L34)

<a id="field-field-mq3-botlib-aas-routing-tables-tables-reversed-reversed-src-mq3-botlib-aas-routing-tables-ml-861629146"></a>
### reversed

```ml
reversed
```

Incoming reachability lists indexed by destination area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_tables.ml#L24)

<a id="field-field-mq3-botlib-aas-routing-tables-tables-router-router-src-mq3-botlib-aas-routing-tables-ml-1094371252"></a>
### router

```ml
router
```

AAS navigation state supplying area settings and reachabilities for route searches.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_tables.ml#L22)

<a id="field-field-mq3-botlib-aas-routing-tables-tables-totallinks-totallinks-src-mq3-botlib-aas-routing-tables-ml-1045722008"></a>
### totalLinks

```ml
totalLinks
```

Total number of reverse reachability links stored in the tables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_tables.ml#L30)

<a id="field-field-mq3-botlib-aas-routing-tables-tables-truncatedsources-truncatedsources-src-mq3-botlib-aas-routing-tables-ml-1680253758"></a>
### truncatedSources

```ml
truncatedSources
```

Source areas whose reachability lists exceeded the supported bound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_tables.ml#L32)
