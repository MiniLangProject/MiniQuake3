# `mq3.botlib.aas_client_movement.Trace`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-client-movement-ml-551897611.md)

<a id="struct-struct-mq3-botlib-aas-client-movement-trace-struct-trace-src-mq3-botlib-aas-client-movement-ml-1793710207"></a>
## Trace

```ml
struct Trace
```

`Trace` record for aas client movement, containing `startsolid`, `fraction`, `endpos`, `ent` and `lastarea` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L93)

## Members

<a id="field-field-mq3-botlib-aas-client-movement-trace-area-area-src-mq3-botlib-aas-client-movement-ml-1968835452"></a>
### area

```ml
area
```

Area blocking the trace (zero if none).


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L105)

<a id="field-field-mq3-botlib-aas-client-movement-trace-endpos-endpos-src-mq3-botlib-aas-client-movement-ml-1938366632"></a>
### endpos

```ml
endpos
```

End position reached by the collision trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L99)

<a id="field-field-mq3-botlib-aas-client-movement-trace-ent-ent-src-mq3-botlib-aas-client-movement-ml-1799341438"></a>
### ent

```ml
ent
```

Entity blocking the trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L101)

<a id="field-field-mq3-botlib-aas-client-movement-trace-fraction-fraction-src-mq3-botlib-aas-client-movement-ml-48662078"></a>
### fraction

```ml
fraction
```

Fraction of the requested trace segment completed before the first collision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L97)

<a id="field-field-mq3-botlib-aas-client-movement-trace-lastarea-lastarea-src-mq3-botlib-aas-client-movement-ml-469869688"></a>
### lastarea

```ml
lastarea
```

Last area the trace was in (zero if none).


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L103)

<a id="field-field-mq3-botlib-aas-client-movement-trace-normal-normal-src-mq3-botlib-aas-client-movement-ml-439990720"></a>
### normal

```ml
normal
```

Collision-plane normal returned to the client movement predictor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L109)

<a id="field-field-mq3-botlib-aas-client-movement-trace-planenum-planenum-src-mq3-botlib-aas-client-movement-ml-1925620942"></a>
### planenum

```ml
planenum
```

Navigation plane identifier returned by the collision query used in movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L107)

<a id="field-field-mq3-botlib-aas-client-movement-trace-startsolid-startsolid-src-mq3-botlib-aas-client-movement-ml-275235420"></a>
### startsolid

```ml
startsolid
```

True when the initial trace position lies inside solid geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement.ml#L95)
