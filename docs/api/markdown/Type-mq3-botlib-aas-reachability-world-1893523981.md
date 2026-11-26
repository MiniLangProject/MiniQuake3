# `mq3.botlib.aas_reachability.World`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-reachability-ml-713478871.md)

<a id="struct-struct-mq3-botlib-aas-reachability-world-struct-world-src-mq3-botlib-aas-reachability-ml-755537197"></a>
## World

```ml
struct World
```

`World` record for aas reachability, containing `runtime`, `map`, `settings`, `areas` and `reachesByArea` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L153)

## Members

<a id="field-field-mq3-botlib-aas-reachability-world-actions-actions-src-mq3-botlib-aas-reachability-ml-1116856921"></a>
### actions

```ml
actions
```

Recorded generation events describing source and destination navigation areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L187)

<a id="field-field-mq3-botlib-aas-reachability-world-areas-areas-src-mq3-botlib-aas-reachability-ml-298623325"></a>
### areas

```ml
areas
```

Area records or area assignments used by navigation and visibility queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L161)

<a id="field-field-mq3-botlib-aas-reachability-world-calcgrapple-calcgrapple-src-mq3-botlib-aas-reachability-ml-301137421"></a>
### calcGrapple

```ml
calcGrapple
```

True when grappling-hook reachabilities should be generated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L179)

<a id="field-field-mq3-botlib-aas-reachability-world-forcereachability-forcereachability-src-mq3-botlib-aas-reachability-ml-561909073"></a>
### forceReachability

```ml
forceReachability
```

True when AAS reachabilities must be rebuilt even if cached data is present.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L177)

<a id="field-field-mq3-botlib-aas-reachability-world-heapcapacity-heapcapacity-src-mq3-botlib-aas-reachability-ml-907922761"></a>
### heapCapacity

```ml
heapCapacity
```

Maximum number of temporary reachability records available in the heap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L167)

<a id="field-field-mq3-botlib-aas-reachability-world-heapused-heapused-src-mq3-botlib-aas-reachability-ml-600375835"></a>
### heapUsed

```ml
heapUsed
```

Number of temporary reachability records currently allocated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L169)

<a id="field-field-mq3-botlib-aas-reachability-world-loaded-loaded-src-mq3-botlib-aas-reachability-ml-1712126375"></a>
### loaded

```ml
loaded
```

True when the navigation map is available for generating movement connections.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L171)

<a id="field-field-mq3-botlib-aas-reachability-world-map-map-src-mq3-botlib-aas-reachability-ml-1266751757"></a>
### map

```ml
map
```

Parsed AAS map used while constructing movement links.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L157)

<a id="field-field-mq3-botlib-aas-reachability-world-numreachabilityareas-numreachabilityareas-src-mq3-botlib-aas-reachability-ml-1482864439"></a>
### numReachabilityAreas

```ml
numReachabilityAreas
```

Number of areas with reachabilities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L175)

<a id="field-field-mq3-botlib-aas-reachability-world-physics-physics-src-mq3-botlib-aas-reachability-ml-1273969689"></a>
### physics

```ml
physics
```

Movement-physics settings used when constructing reachabilities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L181)

<a id="field-field-mq3-botlib-aas-reachability-world-reachesbyarea-reachesbyarea-src-mq3-botlib-aas-reachability-ml-1919510705"></a>
### reachesByArea

```ml
reachesByArea
```

Generated reachability lists indexed by their source area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L163)

<a id="field-field-mq3-botlib-aas-reachability-world-retailactive-retailactive-src-mq3-botlib-aas-reachability-ml-531050863"></a>
### retailActive

```ml
retailActive
```

Indicates whether the host-backed retail-compatible runtime path is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L189)

<a id="field-field-mq3-botlib-aas-reachability-world-runtime-runtime-src-mq3-botlib-aas-reachability-ml-1229084485"></a>
### runtime

```ml
runtime
```

Navigation geometry runtime used to measure areas and construct movement links.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L155)

<a id="field-field-mq3-botlib-aas-reachability-world-savefile-savefile-src-mq3-botlib-aas-reachability-ml-645351471"></a>
### saveFile

```ml
saveFile
```

True when the current AAS data should be saved back to a file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L173)

<a id="field-field-mq3-botlib-aas-reachability-world-services-services-src-mq3-botlib-aas-reachability-ml-259852869"></a>
### services

```ml
services
```

Host geometry and timing queries used while generating area connections.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L185)

<a id="field-field-mq3-botlib-aas-reachability-world-settings-settings-src-mq3-botlib-aas-reachability-ml-1203682443"></a>
### settings

```ml
settings
```

Area or runtime settings controlling navigation behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L159)

<a id="field-field-mq3-botlib-aas-reachability-world-specials-specials-src-mq3-botlib-aas-reachability-ml-845844957"></a>
### specials

```ml
specials
```

Special movers, teleporters, and jump pads considered during reachability generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L183)

<a id="field-field-mq3-botlib-aas-reachability-world-stored-stored-src-mq3-botlib-aas-reachability-ml-309110947"></a>
### stored

```ml
stored
```

Number of reachability records already copied into persistent map storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L165)
