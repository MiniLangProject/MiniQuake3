# `mq3.botlib.aas_route_extras.PredictRoute`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-route-extras-ml-1580573357.md)

<a id="struct-struct-mq3-botlib-aas-route-extras-predictroute-struct-predictroute-src-mq3-botlib-aas-route-extras-ml-1084339483"></a>
## PredictRoute

```ml
struct PredictRoute
```

`PredictRoute` record for aas route extras, containing `endPos`, `endArea`, `stopEvent`, `endContents` and `endTravelFlags` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L58)

## Members

<a id="field-field-mq3-botlib-aas-route-extras-predictroute-endarea-endarea-src-mq3-botlib-aas-route-extras-ml-1283593513"></a>
### endArea

```ml
endArea
```

Area at end of movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L62)

<a id="field-field-mq3-botlib-aas-route-extras-predictroute-endcontents-endcontents-src-mq3-botlib-aas-route-extras-ml-2110897449"></a>
### endContents

```ml
endContents
```

Contents at the end of movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L66)

<a id="field-field-mq3-botlib-aas-route-extras-predictroute-endpos-endpos-src-mq3-botlib-aas-route-extras-ml-147915391"></a>
### endPos

```ml
endPos
```

End position reached by the collision trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L60)

<a id="field-field-mq3-botlib-aas-route-extras-predictroute-endtravelflags-endtravelflags-src-mq3-botlib-aas-route-extras-ml-706135177"></a>
### endTravelFlags

```ml
endTravelFlags
```

Travel flags of the reachability or area at which route prediction ended.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L68)

<a id="field-field-mq3-botlib-aas-route-extras-predictroute-numareas-numareas-src-mq3-botlib-aas-route-extras-ml-499461505"></a>
### numAreas

```ml
numAreas
```

Number of portal or navigation areas represented by the loaded map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L70)

<a id="field-field-mq3-botlib-aas-route-extras-predictroute-stopevent-stopevent-src-mq3-botlib-aas-route-extras-ml-333357841"></a>
### stopEvent

```ml
stopEvent
```

Event that made the prediction stop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L64)

<a id="field-field-mq3-botlib-aas-route-extras-predictroute-time-time-src-mq3-botlib-aas-route-extras-ml-1801371567"></a>
### time

```ml
time
```

Time predicted ahead (in hundreth of a sec).


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L72)
