# `mq3.botlib.ai_goal_selection.Services`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-goal-selection-ml-603097719.md)

<a id="struct-struct-mq3-botlib-ai-goal-selection-services-struct-services-src-mq3-botlib-ai-goal-selection-ml-1051990675"></a>
## Services

```ml
struct Services
```

`Services` record for ai goal selection, containing `context`, `reachabilityAreaFn`, `areaReachabilityFn`, `travelTimeFn` and `traceFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L52)

## Members

<a id="field-field-mq3-botlib-ai-goal-selection-services-areareachabilityfn-areareachabilityfn-src-mq3-botlib-ai-goal-selection-ml-564679433"></a>
### areaReachabilityFn

```ml
areaReachabilityFn
```

Host callback that reports whether an AAS area has usable outgoing reachabilities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L59)

<a id="field-field-mq3-botlib-ai-goal-selection-services-context-context-src-mq3-botlib-ai-goal-selection-ml-1355006949"></a>
### context

```ml
context
```

Caller-supplied data associated with navigation, collision, and entity queries used to score item goals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L55)

<a id="field-field-mq3-botlib-ai-goal-selection-services-entityinfofn-entityinfofn-src-mq3-botlib-ai-goal-selection-ml-144345387"></a>
### entityInfoFn

```ml
entityInfoFn
```

Host callback that retrieves navigation-relevant information about an entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L65)

<a id="field-field-mq3-botlib-ai-goal-selection-services-itemqueryfn-itemqueryfn-src-mq3-botlib-ai-goal-selection-ml-1953384289"></a>
### itemQueryFn

```ml
itemQueryFn
```

Host callback that retrieves information about a map item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L67)

<a id="field-field-mq3-botlib-ai-goal-selection-services-reachabilityareafn-reachabilityareafn-src-mq3-botlib-ai-goal-selection-ml-648402481"></a>
### reachabilityAreaFn

```ml
reachabilityAreaFn
```

Host callback that finds an AAS area suitable for the current movement request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L57)

<a id="field-field-mq3-botlib-ai-goal-selection-services-tracefn-tracefn-src-mq3-botlib-ai-goal-selection-ml-1486668697"></a>
### traceFn

```ml
traceFn
```

Host callback that performs a collision sweep through the host world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L63)

<a id="field-field-mq3-botlib-ai-goal-selection-services-traveltimefn-traveltimefn-src-mq3-botlib-ai-goal-selection-ml-1225818679"></a>
### travelTimeFn

```ml
travelTimeFn
```

Host callback that returns travel cost for a candidate movement link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L61)
