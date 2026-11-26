# `mq3.botlib.aas_client_trace.Trace`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-client-trace-ml-566175929.md)

<a id="struct-struct-mq3-botlib-aas-client-trace-trace-struct-trace-src-mq3-botlib-aas-client-trace-ml-710519491"></a>
## Trace

```ml
struct Trace
```

`Trace` record for aas client trace, containing `startsolid`, `fraction`, `endpos`, `ent` and `lastarea` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L27)

## Members

<a id="field-field-mq3-botlib-aas-client-trace-trace-area-area-src-mq3-botlib-aas-client-trace-ml-1408252940"></a>
### area

```ml
area
```

Area blocking the trace (zero if none).


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L39)

<a id="field-field-mq3-botlib-aas-client-trace-trace-endpos-endpos-src-mq3-botlib-aas-client-trace-ml-585137360"></a>
### endpos

```ml
endpos
```

End position reached by the collision trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L33)

<a id="field-field-mq3-botlib-aas-client-trace-trace-ent-ent-src-mq3-botlib-aas-client-trace-ml-1528591726"></a>
### ent

```ml
ent
```

Entity blocking the trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L35)

<a id="field-field-mq3-botlib-aas-client-trace-trace-fraction-fraction-src-mq3-botlib-aas-client-trace-ml-1065700430"></a>
### fraction

```ml
fraction
```

Fraction of the requested trace segment completed before the first collision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L31)

<a id="field-field-mq3-botlib-aas-client-trace-trace-lastarea-lastarea-src-mq3-botlib-aas-client-trace-ml-1501644464"></a>
### lastarea

```ml
lastarea
```

Last area the trace was in (zero if none).


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L37)

<a id="field-field-mq3-botlib-aas-client-trace-trace-normal-normal-src-mq3-botlib-aas-client-trace-ml-275499544"></a>
### normal

```ml
normal
```

Normal of the AAS boundary plane that stopped the presence-shape trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L43)

<a id="field-field-mq3-botlib-aas-client-trace-trace-planenum-planenum-src-mq3-botlib-aas-client-trace-ml-1164199246"></a>
### planenum

```ml
planenum
```

AAS plane index of the boundary that stopped this navigation trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L41)

<a id="field-field-mq3-botlib-aas-client-trace-trace-startsolid-startsolid-src-mq3-botlib-aas-client-trace-ml-1211642652"></a>
### startsolid

```ml
startsolid
```

True when the initial trace position lies inside solid geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_trace.ml#L29)
