# `mq3.botlib.ai_move_runtime.Services`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-move-runtime-ml-1991141291.md)

<a id="struct-struct-mq3-botlib-ai-move-runtime-services-struct-services-src-mq3-botlib-ai-move-runtime-ml-1339327403"></a>
## Services

```ml
struct Services
```

`Services` record for ai move runtime, containing `context`, `groundTraceFn`, `entityModelFn`, `modelTypeFn` and `modelReachabilityFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L129)

## Members

<a id="field-field-mq3-botlib-ai-move-runtime-services-againstladderfn-againstladderfn-src-mq3-botlib-ai-move-runtime-ml-565070161"></a>
### againstLadderFn

```ml
againstLadderFn
```

Host callback that reports whether the bot hull is against a climbable ladder.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L152)

<a id="field-field-mq3-botlib-ai-move-runtime-services-barrierjumpfn-barrierjumpfn-src-mq3-botlib-ai-move-runtime-ml-1157971289"></a>
### barrierJumpFn

```ml
barrierJumpFn
```

Host callback that evaluates a jump over a low movement barrier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L168)

<a id="field-field-mq3-botlib-ai-move-runtime-services-blocktracefn-blocktracefn-src-mq3-botlib-ai-move-runtime-ml-2115424453"></a>
### blockTraceFn

```ml
blockTraceFn
```

Host callback that tests movement against blocking geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L156)

<a id="field-field-mq3-botlib-ai-move-runtime-services-clienttracefn-clienttracefn-src-mq3-botlib-ai-move-runtime-ml-595061785"></a>
### clientTraceFn

```ml
clientTraceFn
```

Host callback that traces a bot or client hull through the collision world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L144)

<a id="field-field-mq3-botlib-ai-move-runtime-services-context-context-src-mq3-botlib-ai-move-runtime-ml-1162629153"></a>
### context

```ml
context
```

Caller-supplied data associated with bot movement traces, mover queries, route choices, and movement settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L132)

<a id="field-field-mq3-botlib-ai-move-runtime-services-elementaryactions-elementaryactions-src-mq3-botlib-ai-move-runtime-ml-1637218077"></a>
### elementaryActions

```ml
elementaryActions
```

Elementary-action interface used to emit movement and view input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L148)

<a id="field-field-mq3-botlib-ai-move-runtime-services-elevatorstatefn-elevatorstatefn-src-mq3-botlib-ai-move-runtime-ml-371273529"></a>
### elevatorStateFn

```ml
elevatorStateFn
```

Host callback that queries the current movement state of an elevator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L166)

<a id="field-field-mq3-botlib-ai-move-runtime-services-entitymodelfn-entitymodelfn-src-mq3-botlib-ai-move-runtime-ml-1069848521"></a>
### entityModelFn

```ml
entityModelFn
```

Host callback that returns the collision model associated with an entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L136)

<a id="field-field-mq3-botlib-ai-move-runtime-services-funcbobstatefn-funcbobstatefn-src-mq3-botlib-ai-move-runtime-ml-1476814137"></a>
### funcBobStateFn

```ml
funcBobStateFn
```

Host callback that queries a bobbing mover's endpoints and current position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L176)

<a id="field-field-mq3-botlib-ai-move-runtime-services-gapdistancefn-gapdistancefn-src-mq3-botlib-ai-move-runtime-ml-1821399921"></a>
### gapDistanceFn

```ml
gapDistanceFn
```

Host callback that measures a gap along a proposed movement direction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L154)

<a id="field-field-mq3-botlib-ai-move-runtime-services-grappleconfigfn-grappleconfigfn-src-mq3-botlib-ai-move-runtime-ml-1155133237"></a>
### grappleConfigFn

```ml
grappleConfigFn
```

Host callback that returns grappling-hook movement settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L178)

<a id="field-field-mq3-botlib-ai-move-runtime-services-grapplestatefn-grapplestatefn-src-mq3-botlib-ai-move-runtime-ml-241283273"></a>
### grappleStateFn

```ml
grappleStateFn
```

Host callback that reports the current grappling-hook movement state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L180)

<a id="field-field-mq3-botlib-ai-move-runtime-services-grappletracefn-grappletracefn-src-mq3-botlib-ai-move-runtime-ml-1759015913"></a>
### grappleTraceFn

```ml
grappleTraceFn
```

Host callback that tests the path of a proposed grappling-hook movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L182)

<a id="field-field-mq3-botlib-ai-move-runtime-services-gravityfn-gravityfn-src-mq3-botlib-ai-move-runtime-ml-1053817177"></a>
### gravityFn

```ml
gravityFn
```

Host callback that returns the gravity used for movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L162)

<a id="field-field-mq3-botlib-ai-move-runtime-services-groundtracefn-groundtracefn-src-mq3-botlib-ai-move-runtime-ml-76226481"></a>
### groundTraceFn

```ml
groundTraceFn
```

Host callback that tests the ground below the moving bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L134)

<a id="field-field-mq3-botlib-ai-move-runtime-services-horizontalvelocityforjumpfn-horizontalvelocityforjumpfn-src-mq3-botlib-ai-move-runtime-ml-1652859201"></a>
### horizontalVelocityForJumpFn

```ml
horizontalVelocityForJumpFn
```

Host callback that computes horizontal speed needed to reach a jump destination.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L164)

<a id="field-field-mq3-botlib-ai-move-runtime-services-jumprunstartfn-jumprunstartfn-src-mq3-botlib-ai-move-runtime-ml-1380598139"></a>
### jumpRunStartFn

```ml
jumpRunStartFn
```

Host callback that finds a run-up position for a planned jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L160)

<a id="field-field-mq3-botlib-ai-move-runtime-services-modelreachabilityfn-modelreachabilityfn-src-mq3-botlib-ai-move-runtime-ml-4726913"></a>
### modelReachabilityFn

```ml
modelReachabilityFn
```

Host callback that finds reachabilities associated with a mover model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L140)

<a id="field-field-mq3-botlib-ai-move-runtime-services-modeltypefn-modeltypefn-src-mq3-botlib-ai-move-runtime-ml-199912045"></a>
### modelTypeFn

```ml
modelTypeFn
```

Host callback that classifies the movement behavior of a model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L138)

<a id="field-field-mq3-botlib-ai-move-runtime-services-nextreachabilityfn-nextreachabilityfn-src-mq3-botlib-ai-move-runtime-ml-622369229"></a>
### nextReachabilityFn

```ml
nextReachabilityFn
```

Host callback that iterates outgoing reachabilities of an AAS area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L146)

<a id="field-field-mq3-botlib-ai-move-runtime-services-ongroundfn-ongroundfn-src-mq3-botlib-ai-move-runtime-ml-23916357"></a>
### onGroundFn

```ml
onGroundFn
```

Host callback that tests whether the bot hull is resting on the ground.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L150)

<a id="field-field-mq3-botlib-ai-move-runtime-services-pointcontentsfn-pointcontentsfn-src-mq3-botlib-ai-move-runtime-ml-507439893"></a>
### pointContentsFn

```ml
pointContentsFn
```

Host callback that queries world contents at a supplied point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L174)

<a id="field-field-mq3-botlib-ai-move-runtime-services-randomfn-randomfn-src-mq3-botlib-ai-move-runtime-ml-2078611927"></a>
### randomFn

```ml
randomFn
```

Host callback that supplies the random values used by bot selection and fuzzy logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L172)

<a id="field-field-mq3-botlib-ai-move-runtime-services-routereachabilityfn-routereachabilityfn-src-mq3-botlib-ai-move-runtime-ml-497106377"></a>
### routeReachabilityFn

```ml
routeReachabilityFn
```

Host callback that selects a reachability along the requested route.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L170)

<a id="field-field-mq3-botlib-ai-move-runtime-services-routetraveltimefn-routetraveltimefn-src-mq3-botlib-ai-move-runtime-ml-2121745001"></a>
### routeTravelTimeFn

```ml
routeTravelTimeFn
```

Host callback that returns estimated AAS travel time between route positions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L184)

<a id="field-field-mq3-botlib-ai-move-runtime-services-swimmingfn-swimmingfn-src-mq3-botlib-ai-move-runtime-ml-309951851"></a>
### swimmingFn

```ml
swimmingFn
```

Host callback that tests whether the bot is currently swimming.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L142)

<a id="field-field-mq3-botlib-ai-move-runtime-services-walkdirectionfn-walkdirectionfn-src-mq3-botlib-ai-move-runtime-ml-943710249"></a>
### walkDirectionFn

```ml
walkDirectionFn
```

Host callback that tests walking along a proposed direction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L158)
