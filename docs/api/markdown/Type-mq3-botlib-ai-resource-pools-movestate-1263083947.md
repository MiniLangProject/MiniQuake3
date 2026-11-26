# `mq3.botlib.ai_resource_pools.MoveState`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)

<a id="struct-struct-mq3-botlib-ai-resource-pools-movestate-struct-movestate-src-mq3-botlib-ai-resource-pools-ml-2139445737"></a>
## MoveState

```ml
struct MoveState
```

`MoveState` record for ai resource pools, containing `origin`, `velocity`, `viewOffset`, `entityNum` and `client` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L118)

## Members

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-areanum-areanum-src-mq3-botlib-ai-resource-pools-ml-610528693"></a>
### areaNum

```ml
areaNum
```

Navigation area currently occupied by the moving bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L136)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-avoidreach-avoidreach-src-mq3-botlib-ai-resource-pools-ml-1804866805"></a>
### avoidReach

```ml
avoidReach
```

Reachabilities to avoid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L158)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-avoidreachtimes-avoidreachtimes-src-mq3-botlib-ai-resource-pools-ml-924348981"></a>
### avoidReachTimes

```ml
avoidReachTimes
```

Times to avoid the reachabilities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L160)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-avoidreachtries-avoidreachtries-src-mq3-botlib-ai-resource-pools-ml-1119487217"></a>
### avoidReachTries

```ml
avoidReachTries
```

Number of tries before avoiding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L162)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-avoidspots-avoidspots-src-mq3-botlib-ai-resource-pools-ml-544240701"></a>
### avoidSpots

```ml
avoidSpots
```

Spots to avoid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L164)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-client-client-src-mq3-botlib-ai-resource-pools-ml-1989368115"></a>
### client

```ml
client
```

Client number of the bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L128)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-entitynum-entitynum-src-mq3-botlib-ai-resource-pools-ml-1986338465"></a>
### entityNum

```ml
entityNum
```

Number of the game entity associated with this result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L126)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-grapplevisibletime-grapplevisibletime-src-mq3-botlib-ai-resource-pools-ml-786812517"></a>
### grappleVisibleTime

```ml
grappleVisibleTime
```

Last time the grapple was visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L152)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-jumpreach-jumpreach-src-mq3-botlib-ai-resource-pools-ml-1116005285"></a>
### jumpReach

```ml
jumpReach
```

Set when jumped.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L150)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-lastareanum-lastareanum-src-mq3-botlib-ai-resource-pools-ml-736002125"></a>
### lastAreaNum

```ml
lastAreaNum
```

Last area the bot was in.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L138)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-lastgoalareanum-lastgoalareanum-src-mq3-botlib-ai-resource-pools-ml-807459381"></a>
### lastGoalAreaNum

```ml
lastGoalAreaNum
```

Last goal area number.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L140)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-lastgrappledist-lastgrappledist-src-mq3-botlib-ai-resource-pools-ml-1360961705"></a>
### lastGrappleDist

```ml
lastGrappleDist
```

Last distance to the grapple end.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L154)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-lastorigin-lastorigin-src-mq3-botlib-ai-resource-pools-ml-1324953093"></a>
### lastOrigin

```ml
lastOrigin
```

Origin previous cycle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L144)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-lastreachnum-lastreachnum-src-mq3-botlib-ai-resource-pools-ml-393311843"></a>
### lastReachNum

```ml
lastReachNum
```

Last reachability number.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L142)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-moveflags-moveflags-src-mq3-botlib-ai-resource-pools-ml-1265499961"></a>
### moveFlags

```ml
moveFlags
```

Bit mask describing the bot's current movement state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L148)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-numavoidspots-numavoidspots-src-mq3-botlib-ai-resource-pools-ml-1274346349"></a>
### numAvoidSpots

```ml
numAvoidSpots
```

Number of avoid spots represented by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L166)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-origin-origin-src-mq3-botlib-ai-resource-pools-ml-1780803201"></a>
### origin

```ml
origin
```

Current bot position used by navigation and movement decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L120)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-presencetype-presencetype-src-mq3-botlib-ai-resource-pools-ml-370890415"></a>
### presenceType

```ml
presenceType
```

Presence-type mask describing the bot hull or stance allowed here.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L132)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-reachabilitytime-reachabilitytime-src-mq3-botlib-ai-resource-pools-ml-531727501"></a>
### reachabilityTime

```ml
reachabilityTime
```

Time to use current reachability.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L156)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-reachareanum-reachareanum-src-mq3-botlib-ai-resource-pools-ml-2138442745"></a>
### reachAreaNum

```ml
reachAreaNum
```

Area number of the reachabilty.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L146)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-thinktime-thinktime-src-mq3-botlib-ai-resource-pools-ml-1501620425"></a>
### thinkTime

```ml
thinkTime
```

Time the bot thinks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L130)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-velocity-velocity-src-mq3-botlib-ai-resource-pools-ml-1036084883"></a>
### velocity

```ml
velocity
```

World-space linear velocity associated with the moving entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L122)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-viewangles-viewangles-src-mq3-botlib-ai-resource-pools-ml-290065943"></a>
### viewAngles

```ml
viewAngles
```

Pitch, yaw, and roll angles describing the current view direction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L134)

<a id="field-field-mq3-botlib-ai-resource-pools-movestate-viewoffset-viewoffset-src-mq3-botlib-ai-resource-pools-ml-858605617"></a>
### viewOffset

```ml
viewOffset
```

Offset from the entity origin to the viewing position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_resource_pools.ml#L124)
