# `mq3.botlib.aas_route_extras.AlternativeRouteGoal`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-route-extras-ml-1580573357.md)

<a id="struct-struct-mq3-botlib-aas-route-extras-alternativeroutegoal-struct-alternativeroutegoal-src-mq3-botlib-aas-route-extras-ml-1445347027"></a>
## AlternativeRouteGoal

```ml
struct AlternativeRouteGoal
```

`AlternativeRouteGoal` record for aas route extras, containing `origin`, `areaNum`, `startTravelTime`, `goalTravelTime` and `extraTravelTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L45)

## Members

<a id="field-field-mq3-botlib-aas-route-extras-alternativeroutegoal-areanum-areanum-src-mq3-botlib-aas-route-extras-ml-76883190"></a>
### areaNum

```ml
areaNum
```

Navigation area selected as an intermediate goal for an alternative route.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L49)

<a id="field-field-mq3-botlib-aas-route-extras-alternativeroutegoal-extratraveltime-extratraveltime-src-mq3-botlib-aas-route-extras-ml-1809885614"></a>
### extraTravelTime

```ml
extraTravelTime
```

Additional travel cost caused by taking the alternative route.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L55)

<a id="field-field-mq3-botlib-aas-route-extras-alternativeroutegoal-goaltraveltime-goaltraveltime-src-mq3-botlib-aas-route-extras-ml-1995148726"></a>
### goalTravelTime

```ml
goalTravelTime
```

Travel cost from the alternative goal to the requested destination.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L53)

<a id="field-field-mq3-botlib-aas-route-extras-alternativeroutegoal-origin-origin-src-mq3-botlib-aas-route-extras-ml-1986267366"></a>
### origin

```ml
origin
```

World-space waypoint selected as the intermediate alternative-route goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L47)

<a id="field-field-mq3-botlib-aas-route-extras-alternativeroutegoal-starttraveltime-starttraveltime-src-mq3-botlib-aas-route-extras-ml-449785946"></a>
### startTravelTime

```ml
startTravelTime
```

Travel time to start with.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L51)
