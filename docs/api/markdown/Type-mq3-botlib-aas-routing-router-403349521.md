# `mq3.botlib.aas_routing.Router`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-routing-ml-230871418.md)

<a id="struct-struct-mq3-botlib-aas-routing-router-struct-router-src-mq3-botlib-aas-routing-ml-1947269315"></a>
## Router

```ml
struct Router
```

`Router` record for aas routing, containing `runtime`, `settings`, `reaches`, `travelTypeFlags` and `areaFlags`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing.ml#L132)

## Members

<a id="field-field-mq3-botlib-aas-routing-router-areaflags-areaflags-src-mq3-botlib-aas-routing-ml-24796152"></a>
### areaFlags

```ml
areaFlags
```

Per-area travel-permission masks derived from area contents.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing.ml#L142)

<a id="field-field-mq3-botlib-aas-routing-router-reaches-reaches-src-mq3-botlib-aas-routing-ml-1535762088"></a>
### reaches

```ml
reaches
```

Reachability records and their source areas used by route searches.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing.ml#L138)

<a id="field-field-mq3-botlib-aas-routing-router-runtime-runtime-src-mq3-botlib-aas-routing-ml-115257400"></a>
### runtime

```ml
runtime
```

AAS geometry and area-availability runtime used by route searches.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing.ml#L134)

<a id="field-field-mq3-botlib-aas-routing-router-settings-settings-src-mq3-botlib-aas-routing-ml-678992710"></a>
### settings

```ml
settings
```

Area or runtime settings controlling navigation behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing.ml#L136)

<a id="field-field-mq3-botlib-aas-routing-router-traveltypeflags-traveltypeflags-src-mq3-botlib-aas-routing-ml-510596488"></a>
### travelTypeFlags

```ml
travelTypeFlags
```

Mapping from travel-type identifiers to required route-permission masks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_routing.ml#L140)
