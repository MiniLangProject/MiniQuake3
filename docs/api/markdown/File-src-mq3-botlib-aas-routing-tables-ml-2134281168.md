# `src/mq3/botlib/aas_routing_tables.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_routing_tables`](Package-mq3-botlib-aas-routing-tables-1878438830.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/aas_routing.ml` as `routing` → [src/mq3/botlib/aas_routing.ml](File-src-mq3-botlib-aas-routing-ml-230871418.md)
- `mq3/format/aas.ml` as `aas` → [src/mq3/format/aas.ml](File-src-mq3-format-aas-ml-835678928.md)

## Declarations

<a id="function-function-mq3-botlib-aas-routing-tables-areatraveltime-function-areatraveltime-tables-areanum-outgoingoffset-incomingoffset-src-mq3-botlib-aas-routing-tables-ml-831244526"></a>
### areaTravelTime

```ml
function areaTravelTime(tables, areaNum, outgoingOffset, incomingOffset)
```

Read the precomputed travel time between the requested incoming and outgoing area edges, returning zero for invalid indices.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tables` | `dynamic` | — | Tables record; accesses `areaTravelTimes`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `outgoingOffset` | `dynamic` | — | Value used by `areaTravelTime` in `if outgoingOffset<0 or outgoingOffset>=len(rows) then return 0 end if`. |
| `incomingOffset` | `dynamic` | — | Operand used to evaluate the returned expression `row[incomingOffset]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_tables.ml#L86)

<a id="function-function-mq3-botlib-aas-routing-tables-create-function-create-router-src-mq3-botlib-aas-routing-tables-ml-645791741"></a>
### create

```ml
function create(router)
```

Build the `mq3.botlib.aas_routing_tables.Tables` result for `create`. Return paths include `Tables(router,reversed,areaTimes,portalMax,total,truncated,reachSources)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `runtime`, `settings` and `reaches`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_tables.ml#L42)

<a id="function-function-mq3-botlib-aas-routing-tables-empty-function-empty-router-src-mq3-botlib-aas-routing-tables-ml-1109838279"></a>
### empty

```ml
function empty(router)
```

Create a `mq3.botlib.aas_routing_tables.Tables` record, initializing `router` from `router`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_routing_tables.Tables.router`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_tables.ml#L39)

<a id="function-function-mq3-botlib-aas-routing-tables-incoming-function-incoming-tables-areanum-src-mq3-botlib-aas-routing-tables-ml-1665051576"></a>
### incoming

```ml
function incoming(tables, areaNum)
```

Read the reversed reachability list for an area, returning an empty list for invalid table access.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tables` | `dynamic` | — | Tables record; accesses `reversed`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_tables.ml#L80)

<a id="constant-constant-mq3-botlib-aas-routing-tables-max-area-reachabilities-const-max-area-reachabilities-128-src-mq3-botlib-aas-routing-tables-ml-693402598"></a>
### MAX_AREA_REACHABILITIES

```ml
const MAX_AREA_REACHABILITIES = 128
```

Maximum outgoing reachabilities represented in an area travel-time table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_tables.ml#L10)

<a id="function-function-mq3-botlib-aas-routing-tables-portalmaxtraveltime-function-portalmaxtraveltime-tables-portalnum-src-mq3-botlib-aas-routing-tables-ml-977661235"></a>
### portalMaxTravelTime

```ml
function portalMaxTravelTime(tables, portalNum)
```

Read a portal maximum-travel-time entry, returning zero when the table or index is invalid.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tables` | `dynamic` | — | Tables record; accesses `portalMaxTravelTimes`. |
| `portalNum` | `dynamic` | — | Operand used to evaluate the returned expression `tables.portalMaxTravelTimes[portalNum]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_tables.ml#L92)

- [mq3.botlib.aas_routing_tables.ReverseLink](Type-mq3-botlib-aas-routing-tables-reverselink-216415502.md) — struct
- [mq3.botlib.aas_routing_tables.Tables](Type-mq3-botlib-aas-routing-tables-tables-348828821.md) — struct
