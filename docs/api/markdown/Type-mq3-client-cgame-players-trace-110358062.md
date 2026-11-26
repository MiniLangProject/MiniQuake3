# `mq3.client.cgame_players.Trace`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-players-ml-1793263463.md)

<a id="struct-struct-mq3-client-cgame-players-trace-struct-trace-src-mq3-client-cgame-players-ml-4210455"></a>
## Trace

```ml
struct Trace
```

Stores client game players trace record, including `fraction`, `endpos`, `normal`, `startsolid`, `allsolid`, `surfaceFlags`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L273)

## Members

<a id="field-field-mq3-client-cgame-players-trace-allsolid-allsolid-src-mq3-client-cgame-players-ml-1432598366"></a>
### allsolid

```ml
allsolid
```

True when the trace remains fully enclosed by solid geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L283)

<a id="field-field-mq3-client-cgame-players-trace-endpos-endpos-src-mq3-client-cgame-players-ml-1459580376"></a>
### endpos

```ml
endpos
```

Final world-space position reached by the collision trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L277)

<a id="field-field-mq3-client-cgame-players-trace-fraction-fraction-src-mq3-client-cgame-players-ml-1058646870"></a>
### fraction

```ml
fraction
```

Fraction of the requested trace distance completed before the first collision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L275)

<a id="field-field-mq3-client-cgame-players-trace-normal-normal-src-mq3-client-cgame-players-ml-1457929856"></a>
### normal

```ml
normal
```

Ground-trace plane normal available to player-shadow and contact-effect calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L279)

<a id="field-field-mq3-client-cgame-players-trace-startsolid-startsolid-src-mq3-client-cgame-players-ml-287360644"></a>
### startsolid

```ml
startsolid
```

True when the collision trace begins inside solid geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L281)

<a id="field-field-mq3-client-cgame-players-trace-surfaceflags-surfaceflags-src-mq3-client-cgame-players-ml-1205933238"></a>
### surfaceFlags

```ml
surfaceFlags
```

Surface-property bits returned by the collision trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L285)
