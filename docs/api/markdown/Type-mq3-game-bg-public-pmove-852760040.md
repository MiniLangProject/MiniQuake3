# `mq3.game.bg_public.Pmove`

[Home](README.md) · [Source file](File-src-mq3-game-bg-public-ml-2091356861.md)

<a id="struct-struct-mq3-game-bg-public-pmove-struct-pmove-src-mq3-game-bg-public-ml-1898631767"></a>
## Pmove

```ml
struct Pmove
```

`Pmove` record for bg public, containing `ps`, `cmd`, `tracemask`, `debugLevel` and `noFootsteps` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L167)

## Members

<a id="field-field-mq3-game-bg-public-pmove-cmd-cmd-src-mq3-game-bg-public-ml-1614658698"></a>
### cmd

```ml
cmd
```

Current user-command input supplied to movement or client processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L171)

<a id="field-field-mq3-game-bg-public-pmove-debuglevel-debuglevel-src-mq3-game-bg-public-ml-627780380"></a>
### debugLevel

```ml
debugLevel
```

Diagnostic verbosity level used by the module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L175)

<a id="field-field-mq3-game-bg-public-pmove-framecount-framecount-src-mq3-game-bg-public-ml-1642433030"></a>
### framecount

```ml
framecount
```

Counter of completed movement or game update frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L181)

<a id="field-field-mq3-game-bg-public-pmove-gauntlethit-gauntlethit-src-mq3-game-bg-public-ml-1900821438"></a>
### gauntletHit

```ml
gauntletHit
```

Nonzero when the current gauntlet attack can hit a target.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L179)

<a id="field-field-mq3-game-bg-public-pmove-maxs-maxs-src-mq3-game-bg-public-ml-638906140"></a>
### maxs

```ml
maxs
```

Upper player hull bound supplied through the public movement interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L189)

<a id="field-field-mq3-game-bg-public-pmove-mins-mins-src-mq3-game-bg-public-ml-1445608660"></a>
### mins

```ml
mins
```

Lower player hull bound supplied through the public movement interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L187)

<a id="field-field-mq3-game-bg-public-pmove-nofootsteps-nofootsteps-src-mq3-game-bg-public-ml-1125496782"></a>
### noFootsteps

```ml
noFootsteps
```

Nonzero when server/game settings suppress footstep events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L177)

<a id="field-field-mq3-game-bg-public-pmove-numtouch-numtouch-src-mq3-game-bg-public-ml-723200336"></a>
### numtouch

```ml
numtouch
```

Number of distinct entity contacts collected by the movement step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L183)

<a id="field-field-mq3-game-bg-public-pmove-pmovefixed-pmovefixed-src-mq3-game-bg-public-ml-463164524"></a>
### pmoveFixed

```ml
pmoveFixed
```

Nonzero when player movement uses a fixed simulation step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L197)

<a id="field-field-mq3-game-bg-public-pmove-pmovemsec-pmovemsec-src-mq3-game-bg-public-ml-883940602"></a>
### pmoveMsec

```ml
pmoveMsec
```

Fixed movement-step duration in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L199)

<a id="field-field-mq3-game-bg-public-pmove-pointcontentsfn-pointcontentsfn-src-mq3-game-bg-public-ml-1649347594"></a>
### pointContentsFn

```ml
pointContentsFn
```

Injected callback for point contents; invoked through the Pmove service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L203)

<a id="field-field-mq3-game-bg-public-pmove-ps-ps-src-mq3-game-bg-public-ml-677990160"></a>
### ps

```ml
ps
```

Authoritative player state used for movement, prediction, and snapshot delivery.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L169)

<a id="field-field-mq3-game-bg-public-pmove-touchents-touchents-src-mq3-game-bg-public-ml-1355344918"></a>
### touchents

```ml
touchents
```

Entity numbers contacted during the movement step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L185)

<a id="field-field-mq3-game-bg-public-pmove-tracefn-tracefn-src-mq3-game-bg-public-ml-42746706"></a>
### traceFn

```ml
traceFn
```

Injected callback for trace; invoked through the Pmove service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L201)

<a id="field-field-mq3-game-bg-public-pmove-tracemask-tracemask-src-mq3-game-bg-public-ml-689161290"></a>
### tracemask

```ml
tracemask
```

Contents mask used by the player or bot collision traces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L173)

<a id="field-field-mq3-game-bg-public-pmove-waterlevel-waterlevel-src-mq3-game-bg-public-ml-553175924"></a>
### waterlevel

```ml
waterlevel
```

Depth classification of the player immersion in liquid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L193)

<a id="field-field-mq3-game-bg-public-pmove-watertype-watertype-src-mq3-game-bg-public-ml-374020858"></a>
### watertype

```ml
watertype
```

CONTENTS_* mask identifying the liquid around the player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L191)

<a id="field-field-mq3-game-bg-public-pmove-xyspeed-xyspeed-src-mq3-game-bg-public-ml-801546638"></a>
### xyspeed

```ml
xyspeed
```

Horizontal speed used to select movement and footstep behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L195)
