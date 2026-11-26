# `mq3.botlib.aas_runtime.Runtime`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-runtime-ml-1322908116.md)

<a id="struct-struct-mq3-botlib-aas-runtime-runtime-struct-runtime-src-mq3-botlib-aas-runtime-ml-2004835349"></a>
## Runtime

```ml
struct Runtime
```

`Runtime` record for aas runtime, containing `map`, `initialized`, `disabled`, `time` and `cacheInvalidations` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L18)

## Members

<a id="field-field-mq3-botlib-aas-runtime-runtime-cacheinvalidations-cacheinvalidations-src-mq3-botlib-aas-runtime-ml-879215123"></a>
### cacheInvalidations

```ml
cacheInvalidations
```

Number of routing-cache invalidations caused by area changes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L28)

<a id="field-field-mq3-botlib-aas-runtime-runtime-disabled-disabled-src-mq3-botlib-aas-runtime-ml-1055457125"></a>
### disabled

```ml
disabled
```

Area-indexed flags excluding selected areas from route calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L24)

<a id="field-field-mq3-botlib-aas-runtime-runtime-initialized-initialized-src-mq3-botlib-aas-runtime-ml-550450169"></a>
### initialized

```ml
initialized
```

True when the loaded navigation map is ready for area and reachability queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L22)

<a id="field-field-mq3-botlib-aas-runtime-runtime-map-map-src-mq3-botlib-aas-runtime-ml-606002921"></a>
### map

```ml
map
```

Parsed AAS navigation map used by the runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L20)

<a id="field-field-mq3-botlib-aas-runtime-runtime-nodecache-nodecache-src-mq3-botlib-aas-runtime-ml-489173481"></a>
### nodeCache

```ml
nodeCache
```

Cached decoded BSP/AAS node records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L30)

<a id="field-field-mq3-botlib-aas-runtime-runtime-planecache-planecache-src-mq3-botlib-aas-runtime-ml-1994228937"></a>
### planeCache

```ml
planeCache
```

Cached decoded AAS plane records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L32)

<a id="field-field-mq3-botlib-aas-runtime-runtime-time-time-src-mq3-botlib-aas-runtime-ml-1027724231"></a>
### time

```ml
time
```

Current AAS simulation time supplied by the bot frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L26)
