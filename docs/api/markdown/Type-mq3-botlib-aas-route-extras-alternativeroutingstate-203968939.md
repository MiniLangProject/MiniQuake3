# `mq3.botlib.aas_route_extras.AlternativeRoutingState`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-route-extras-ml-1580573357.md)

<a id="struct-struct-mq3-botlib-aas-route-extras-alternativeroutingstate-struct-alternativeroutingstate-src-mq3-botlib-aas-route-extras-ml-1913511217"></a>
## AlternativeRoutingState

```ml
struct AlternativeRoutingState
```

`AlternativeRoutingState` record for aas route extras, containing `valid`, `clusterAreas`, `numClusterAreas` and `initialized`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L75)

## Members

<a id="field-field-mq3-botlib-aas-route-extras-alternativeroutingstate-clusterareas-clusterareas-src-mq3-botlib-aas-route-extras-ml-444592533"></a>
### clusterAreas

```ml
clusterAreas
```

Area indexes considered while generating alternative cluster routes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L79)

<a id="field-field-mq3-botlib-aas-route-extras-alternativeroutingstate-initialized-initialized-src-mq3-botlib-aas-route-extras-ml-1426269141"></a>
### initialized

```ml
initialized
```

True when alternative-route area membership and cluster working data are ready.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L83)

<a id="field-field-mq3-botlib-aas-route-extras-alternativeroutingstate-numclusterareas-numclusterareas-src-mq3-botlib-aas-route-extras-ml-1687868461"></a>
### numClusterAreas

```ml
numClusterAreas
```

Number of cluster areas represented by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L81)

<a id="field-field-mq3-botlib-aas-route-extras-alternativeroutingstate-valid-valid-src-mq3-botlib-aas-route-extras-ml-1130768053"></a>
### valid

```ml
valid
```

True when the represented entry contains usable data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L77)
