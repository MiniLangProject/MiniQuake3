# `mq3.botlib.ai_map_goals.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-map-goals-ml-805849506.md)

<a id="struct-struct-mq3-botlib-ai-map-goals-state-struct-state-src-mq3-botlib-ai-map-goals-ml-1284658061"></a>
## State

```ml
struct State
```

`State` record for ai map goals, containing `aas`, `bspEntities`, `locations`, `campSpots` and `initialized`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L42)

## Members

<a id="field-field-mq3-botlib-ai-map-goals-state-aas-aas-src-mq3-botlib-ai-map-goals-ml-1384862102"></a>
### aas

```ml
aas
```

AAS navigation runtime used for area and route queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L44)

<a id="field-field-mq3-botlib-ai-map-goals-state-bspentities-bspentities-src-mq3-botlib-ai-map-goals-ml-1482199834"></a>
### bspEntities

```ml
bspEntities
```

Parsed key/value definitions from the BSP entity lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L46)

<a id="field-field-mq3-botlib-ai-map-goals-state-campspots-campspots-src-mq3-botlib-ai-map-goals-ml-913895498"></a>
### campSpots

```ml
campSpots
```

Camp goals parsed from BSP entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L50)

<a id="field-field-mq3-botlib-ai-map-goals-state-initialized-initialized-src-mq3-botlib-ai-map-goals-ml-1802588906"></a>
### initialized

```ml
initialized
```

True after map locations and camp spots have been collected.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L52)

<a id="field-field-mq3-botlib-ai-map-goals-state-locations-locations-src-mq3-botlib-ai-map-goals-ml-1189624022"></a>
### locations

```ml
locations
```

Named map-location goals parsed from BSP entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L48)
