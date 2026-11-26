# `mq3.botlib.aas_client_movement.Services`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-client-movement-ml-551897611.md)

<a id="struct-struct-mq3-botlib-aas-client-movement-services-struct-services-src-mq3-botlib-aas-client-movement-ml-2022008035"></a>
## Services

```ml
struct Services
```

`Services` record for aas client movement, containing `context`, `traceFn`, `pointContentsFn`, `pointAreaFn` and `pointPresenceFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L142)

## Members

<a id="field-field-mq3-botlib-aas-client-movement-services-areacontentsfn-areacontentsfn-src-mq3-botlib-aas-client-movement-ml-312950343"></a>
### areaContentsFn

```ml
areaContentsFn
```

Host callback that returns the contents flags for an AAS area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L155)

<a id="field-field-mq3-botlib-aas-client-movement-services-context-context-src-mq3-botlib-aas-client-movement-ml-764843893"></a>
### context

```ml
context
```

Caller-supplied data associated with collision, contents, presence, and area queries during movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L145)

<a id="field-field-mq3-botlib-aas-client-movement-services-pointareafn-pointareafn-src-mq3-botlib-aas-client-movement-ml-537499397"></a>
### pointAreaFn

```ml
pointAreaFn
```

Host callback that returns the AAS area containing a point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L151)

<a id="field-field-mq3-botlib-aas-client-movement-services-pointcontentsfn-pointcontentsfn-src-mq3-botlib-aas-client-movement-ml-1658942737"></a>
### pointContentsFn

```ml
pointContentsFn
```

Host callback that queries world contents at a supplied point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L149)

<a id="field-field-mq3-botlib-aas-client-movement-services-pointpresencefn-pointpresencefn-src-mq3-botlib-aas-client-movement-ml-118517865"></a>
### pointPresenceFn

```ml
pointPresenceFn
```

Host callback that returns the presence types allowed at a position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L153)

<a id="field-field-mq3-botlib-aas-client-movement-services-settings-settings-src-mq3-botlib-aas-client-movement-ml-1811305571"></a>
### settings

```ml
settings
```

Area or runtime settings controlling navigation behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L159)

<a id="field-field-mq3-botlib-aas-client-movement-services-traceareasfn-traceareasfn-src-mq3-botlib-aas-client-movement-ml-667372731"></a>
### traceAreasFn

```ml
traceAreasFn
```

Host callback that finds AAS areas crossed by a line segment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L157)

<a id="field-field-mq3-botlib-aas-client-movement-services-tracefn-tracefn-src-mq3-botlib-aas-client-movement-ml-1894855457"></a>
### traceFn

```ml
traceFn
```

Host callback that performs a collision sweep through the host world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L147)
