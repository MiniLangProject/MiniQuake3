# `mq3.botlib.ai_map_goals.CampSpot`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-map-goals-ml-805849506.md)

<a id="struct-struct-mq3-botlib-ai-map-goals-campspot-struct-campspot-src-mq3-botlib-ai-map-goals-ml-558490545"></a>
## CampSpot

```ml
struct CampSpot
```

`CampSpot` record for ai map goals, containing `name`, `range`, `weight`, `wait` and `random` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L27)

## Members

<a id="field-field-mq3-botlib-ai-map-goals-campspot-goal-goal-src-mq3-botlib-ai-map-goals-ml-1307896828"></a>
### goal

```ml
goal
```

Bot goal record describing the location to reach.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L39)

<a id="field-field-mq3-botlib-ai-map-goals-campspot-name-name-src-mq3-botlib-ai-map-goals-ml-589646780"></a>
### name

```ml
name
```

Map-authored name identifying this camp spot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L29)

<a id="field-field-mq3-botlib-ai-map-goals-campspot-random-random-src-mq3-botlib-ai-map-goals-ml-1575891660"></a>
### random

```ml
random
```

Random waiting-time variation configured for the camp spot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L37)

<a id="field-field-mq3-botlib-ai-map-goals-campspot-range-range-src-mq3-botlib-ai-map-goals-ml-1098874786"></a>
### range

```ml
range
```

Distance range associated with the camp spot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L31)

<a id="field-field-mq3-botlib-ai-map-goals-campspot-wait-wait-src-mq3-botlib-ai-map-goals-ml-1058544232"></a>
### wait

```ml
wait
```

Configured waiting interval before the operation or camp behavior continues.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L35)

<a id="field-field-mq3-botlib-ai-map-goals-campspot-weight-weight-src-mq3-botlib-ai-map-goals-ml-65529698"></a>
### weight

```ml
weight
```

Configured desirability weight of this map camp spot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L33)
