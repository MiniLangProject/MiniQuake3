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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tables` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `outgoingOffset` | `dynamic` | — |  |
| `incomingOffset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_tables.ml#L51)

<a id="function-function-mq3-botlib-aas-routing-tables-create-function-create-router-src-mq3-botlib-aas-routing-tables-ml-645791741"></a>
### create

```ml
function create(router)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_tables.ml#L15)

<a id="function-function-mq3-botlib-aas-routing-tables-empty-function-empty-router-src-mq3-botlib-aas-routing-tables-ml-1109838279"></a>
### empty

```ml
function empty(router)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_tables.ml#L14)

<a id="function-function-mq3-botlib-aas-routing-tables-incoming-function-incoming-tables-areanum-src-mq3-botlib-aas-routing-tables-ml-1665051576"></a>
### incoming

```ml
function incoming(tables, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tables` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_tables.ml#L50)

<a id="constant-constant-mq3-botlib-aas-routing-tables-max-area-reachabilities-const-max-area-reachabilities-128-src-mq3-botlib-aas-routing-tables-ml-693402598"></a>
### MAX_AREA_REACHABILITIES

```ml
const MAX_AREA_REACHABILITIES = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_tables.ml#L9)

<a id="function-function-mq3-botlib-aas-routing-tables-portalmaxtraveltime-function-portalmaxtraveltime-tables-portalnum-src-mq3-botlib-aas-routing-tables-ml-977661235"></a>
### portalMaxTravelTime

```ml
function portalMaxTravelTime(tables, portalNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tables` | `dynamic` | — |  |
| `portalNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_routing_tables.ml#L54)

- [mq3.botlib.aas_routing_tables.ReverseLink](Type-mq3-botlib-aas-routing-tables-reverselink-216415502.md) — struct
- [mq3.botlib.aas_routing_tables.Tables](Type-mq3-botlib-aas-routing-tables-tables-348828821.md) — struct
