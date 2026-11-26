# `mq3.game.pmove.PmoveContext`

[Home](README.md) · [Source file](File-src-mq3-game-pmove-ml-1046301421.md)

<a id="struct-struct-mq3-game-pmove-pmovecontext-struct-pmovecontext-src-mq3-game-pmove-ml-1933884459"></a>
## PmoveContext

```ml
struct PmoveContext
```

`PmoveContext` record for pmove, containing `ps`, `cmd`, `k`, `noFootsteps` and `gauntletHit` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L35)

## Members

<a id="field-field-mq3-game-pmove-pmovecontext-cmd-cmd-src-mq3-game-pmove-ml-496014301"></a>
### cmd

```ml
cmd
```

Current user-command input supplied to movement or client processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L39)

<a id="field-field-mq3-game-pmove-pmovecontext-context-context-src-mq3-game-pmove-ml-632895777"></a>
### context

```ml
context
```

Opaque caller-supplied context available to player-movement trace and point-contents callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L77)

<a id="field-field-mq3-game-pmove-pmovecontext-fixed-fixed-src-mq3-game-pmove-ml-2057904273"></a>
### fixed

```ml
fixed
```

Nonzero when movement uses fixed-duration simulation steps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L47)

<a id="field-field-mq3-game-pmove-pmovecontext-fixedmsec-fixedmsec-src-mq3-game-pmove-ml-1194522465"></a>
### fixedMsec

```ml
fixedMsec
```

Fixed movement-step duration in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L51)

<a id="field-field-mq3-game-pmove-pmovecontext-forward-forward-src-mq3-game-pmove-ml-1139440097"></a>
### forward

```ml
forward
```

Forward direction vector derived from the current view orientation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L57)

<a id="field-field-mq3-game-pmove-pmovecontext-gauntlethit-gauntlethit-src-mq3-game-pmove-ml-999989945"></a>
### gauntletHit

```ml
gauntletHit
```

Nonzero when the current gauntlet attack can hit a target.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L45)

<a id="field-field-mq3-game-pmove-pmovecontext-groundtrace-groundtrace-src-mq3-game-pmove-ml-1779674009"></a>
### groundTrace

```ml
groundTrace
```

Trace result used to determine ground contact for the current movement step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L65)

<a id="field-field-mq3-game-pmove-pmovecontext-k-k-src-mq3-game-pmove-ml-286953877"></a>
### k

```ml
k
```

Low-level kinematic state used by the player movement solver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L41)

<a id="field-field-mq3-game-pmove-pmovecontext-missionpack-missionpack-src-mq3-game-pmove-ml-1729163969"></a>
### missionpack

```ml
missionpack
```

Nonzero when mission-pack rules and content are enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L49)

<a id="field-field-mq3-game-pmove-pmovecontext-msec-msec-src-mq3-game-pmove-ml-908742849"></a>
### msec

```ml
msec
```

Duration of the current movement step in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L63)

<a id="field-field-mq3-game-pmove-pmovecontext-nofootsteps-nofootsteps-src-mq3-game-pmove-ml-1597326377"></a>
### noFootsteps

```ml
noFootsteps
```

Nonzero when server/game settings suppress footstep events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L43)

<a id="field-field-mq3-game-pmove-pmovecontext-pointfn-pointfn-src-mq3-game-pmove-ml-1783987041"></a>
### pointFn

```ml
pointFn
```

Injected callback for point; invoked through the PmoveContext service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L75)

<a id="field-field-mq3-game-pmove-pmovecontext-previousorigin-previousorigin-src-mq3-game-pmove-ml-442612731"></a>
### previousOrigin

```ml
previousOrigin
```

Position retained from the preceding movement step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L67)

<a id="field-field-mq3-game-pmove-pmovecontext-previousvelocity-previousvelocity-src-mq3-game-pmove-ml-99828921"></a>
### previousVelocity

```ml
previousVelocity
```

Velocity retained from the preceding movement step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L69)

<a id="field-field-mq3-game-pmove-pmovecontext-previouswaterlevel-previouswaterlevel-src-mq3-game-pmove-ml-1334956545"></a>
### previousWaterlevel

```ml
previousWaterlevel
```

Liquid-immersion classification retained from the preceding step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L71)

<a id="field-field-mq3-game-pmove-pmovecontext-ps-ps-src-mq3-game-pmove-ml-789269667"></a>
### ps

```ml
ps
```

Authoritative player state used for movement, prediction, and snapshot delivery.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L37)

<a id="field-field-mq3-game-pmove-pmovecontext-right-right-src-mq3-game-pmove-ml-1916551137"></a>
### right

```ml
right
```

Right direction vector derived from the current view orientation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L59)

<a id="field-field-mq3-game-pmove-pmovecontext-tracefn-tracefn-src-mq3-game-pmove-ml-2017743221"></a>
### traceFn

```ml
traceFn
```

Injected callback for trace; invoked through the PmoveContext service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L73)

<a id="field-field-mq3-game-pmove-pmovecontext-up-up-src-mq3-game-pmove-ml-2128271727"></a>
### up

```ml
up
```

Up direction vector derived from the current view orientation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L61)

<a id="field-field-mq3-game-pmove-pmovecontext-watertype-watertype-src-mq3-game-pmove-ml-1140805021"></a>
### watertype

```ml
watertype
```

CONTENTS_* mask identifying the liquid around the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L53)

<a id="field-field-mq3-game-pmove-pmovecontext-xyspeed-xyspeed-src-mq3-game-pmove-ml-1060874529"></a>
### xyspeed

```ml
xyspeed
```

Horizontal speed used to select movement and footstep behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/pmove.ml#L55)
