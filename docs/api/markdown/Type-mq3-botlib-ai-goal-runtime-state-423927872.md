# `mq3.botlib.ai_goal_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-goal-runtime-ml-319872757.md)

<a id="struct-struct-mq3-botlib-ai-goal-runtime-state-struct-state-src-mq3-botlib-ai-goal-runtime-ml-1629022387"></a>
## State

```ml
struct State
```

`State` record for ai goal runtime, containing `pools`, `itemWeights`, `levelItems`, `goals` and `selection` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L32)

## Members

<a id="field-field-mq3-botlib-ai-goal-runtime-state-aas-aas-src-mq3-botlib-ai-goal-runtime-ml-1957313242"></a>
### aas

```ml
aas
```

AAS navigation runtime used for area and route queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L50)

<a id="field-field-mq3-botlib-ai-goal-runtime-state-aasentities-aasentities-src-mq3-botlib-ai-goal-runtime-ml-1480397458"></a>
### aasEntities

```ml
aasEntities
```

Navigation entity information used to track live map items.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L48)

<a id="field-field-mq3-botlib-ai-goal-runtime-state-bspentities-bspentities-src-mq3-botlib-ai-goal-runtime-ml-221023502"></a>
### bspEntities

```ml
bspEntities
```

Parsed key/value definitions from the BSP entity lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L52)

<a id="field-field-mq3-botlib-ai-goal-runtime-state-freelevelitems-freelevelitems-src-mq3-botlib-ai-goal-runtime-ml-843755250"></a>
### freeLevelItems

```ml
freeLevelItems
```

Level-item records available for reuse.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L58)

<a id="field-field-mq3-botlib-ai-goal-runtime-state-gametype-gametype-src-mq3-botlib-ai-goal-runtime-ml-412559614"></a>
### gameType

```ml
gameType
```

Game-mode identifier used when applying mode-specific rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L54)

<a id="field-field-mq3-botlib-ai-goal-runtime-state-goals-goals-src-mq3-botlib-ai-goal-runtime-ml-1624512538"></a>
### goals

```ml
goals
```

Per-bot goal-stack and avoidance-state runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L40)

<a id="field-field-mq3-botlib-ai-goal-runtime-state-host-host-src-mq3-botlib-ai-goal-runtime-ml-718043278"></a>
### host

```ml
host
```

Host callback interface supplying external services to this runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L46)

<a id="field-field-mq3-botlib-ai-goal-runtime-state-itemweights-itemweights-src-mq3-botlib-ai-goal-runtime-ml-1229445378"></a>
### itemWeights

```ml
itemWeights
```

Fuzzy item-weight runtime used by the goal subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L36)

<a id="field-field-mq3-botlib-ai-goal-runtime-state-levelitems-levelitems-src-mq3-botlib-ai-goal-runtime-ml-1951474702"></a>
### levelItems

```ml
levelItems
```

Current item goals discovered from the map and its dynamic entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L38)

<a id="field-field-mq3-botlib-ai-goal-runtime-state-mapgoals-mapgoals-src-mq3-botlib-ai-goal-runtime-ml-1559735102"></a>
### mapGoals

```ml
mapGoals
```

Named locations and camp spots parsed from the map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L44)

<a id="field-field-mq3-botlib-ai-goal-runtime-state-placefn-placefn-src-mq3-botlib-ai-goal-runtime-ml-52566730"></a>
### placeFn

```ml
placeFn
```

Host callback that places a discovered item goal in a usable AAS area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L56)

<a id="field-field-mq3-botlib-ai-goal-runtime-state-pools-pools-src-mq3-botlib-ai-goal-runtime-ml-1902048606"></a>
### pools

```ml
pools
```

Managed pools containing bot chat, goal, movement, and weapon resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L34)

<a id="field-field-mq3-botlib-ai-goal-runtime-state-selection-selection-src-mq3-botlib-ai-goal-runtime-ml-1397100614"></a>
### selection

```ml
selection
```

Goal-selection runtime combining item weights with route costs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L42)

<a id="field-field-mq3-botlib-ai-goal-runtime-state-setup-setup-src-mq3-botlib-ai-goal-runtime-ml-1879517306"></a>
### setup

```ml
setup
```

True after the bot-library setup sequence has completed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L60)
