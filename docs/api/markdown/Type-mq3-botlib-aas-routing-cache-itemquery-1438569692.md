# `mq3.botlib.aas_routing_cache.ItemQuery`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-routing-cache-ml-1923771141.md)

<a id="struct-struct-mq3-botlib-aas-routing-cache-itemquery-struct-itemquery-src-mq3-botlib-aas-routing-cache-ml-1564364931"></a>
## ItemQuery

```ml
struct ItemQuery
```

`ItemQuery` record for aas routing cache, containing `cache`, `area`, `origin`, `flags` and `times` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L37)

## Members

<a id="field-field-mq3-botlib-aas-routing-cache-itemquery-area-area-src-mq3-botlib-aas-routing-cache-ml-901287256"></a>
### area

```ml
area
```

Starting AAS area for the cached group of item-route queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L41)

<a id="field-field-mq3-botlib-aas-routing-cache-itemquery-cache-cache-src-mq3-botlib-aas-routing-cache-ml-1915463078"></a>
### cache

```ml
cache
```

Cached lookup or routing data reused by subsequent requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L39)

<a id="field-field-mq3-botlib-aas-routing-cache-itemquery-entertimes-entertimes-src-mq3-botlib-aas-routing-cache-ml-1290339606"></a>
### enterTimes

```ml
enterTimes
```

Costs of entering candidate goal areas from the query origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L49)

<a id="field-field-mq3-botlib-aas-routing-cache-itemquery-flags-flags-src-mq3-botlib-aas-routing-cache-ml-428537726"></a>
### flags

```ml
flags
```

Travel permissions applied to every item destination in this query.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L45)

<a id="field-field-mq3-botlib-aas-routing-cache-itemquery-origin-origin-src-mq3-botlib-aas-routing-cache-ml-1249079238"></a>
### origin

```ml
origin
```

Bot position within the starting area used to include local travel cost in item queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L43)

<a id="field-field-mq3-botlib-aas-routing-cache-itemquery-times-times-src-mq3-botlib-aas-routing-cache-ml-1893868598"></a>
### times

```ml
times
```

Cached route travel costs used while evaluating item goals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L47)
