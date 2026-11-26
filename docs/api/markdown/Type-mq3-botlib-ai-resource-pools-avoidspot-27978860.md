# `mq3.botlib.ai_resource_pools.AvoidSpot`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)

<a id="struct-struct-mq3-botlib-ai-resource-pools-avoidspot-struct-avoidspot-src-mq3-botlib-ai-resource-pools-ml-1553201587"></a>
## AvoidSpot

```ml
struct AvoidSpot
```

`AvoidSpot` record for ai resource pools, containing `origin`, `radius` and `type`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L109)

## Members

<a id="field-field-mq3-botlib-ai-resource-pools-avoidspot-origin-origin-src-mq3-botlib-ai-resource-pools-ml-360264894"></a>
### origin

```ml
origin
```

World-space center of the spatial region the bot should avoid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L111)

<a id="field-field-mq3-botlib-ai-resource-pools-avoidspot-radius-radius-src-mq3-botlib-ai-resource-pools-ml-262004350"></a>
### radius

```ml
radius
```

Radius of the represented sphere or capsule.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L113)

<a id="field-field-mq3-botlib-ai-resource-pools-avoidspot-type-type-src-mq3-botlib-ai-resource-pools-ml-1000261250"></a>
### type

```ml
type
```

Avoidance policy deciding whether this spot blocks or only influences movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L115)
