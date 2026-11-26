# `mq3.client.cgame_players.Animation`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-players-ml-1793263463.md)

<a id="struct-struct-mq3-client-cgame-players-animation-struct-animation-src-mq3-client-cgame-players-ml-147856385"></a>
## Animation

```ml
struct Animation
```

Stores client game players animation record, including `firstFrame`, `numFrames`, `loopFrames`, `frameLerp`, `initialLerp`, `reversed` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L127)

## Members

<a id="field-field-mq3-client-cgame-players-animation-firstframe-firstframe-src-mq3-client-cgame-players-ml-1063305823"></a>
### firstFrame

```ml
firstFrame
```

Index of the first model frame belonging to the animation sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L129)

<a id="field-field-mq3-client-cgame-players-animation-flipflop-flipflop-src-mq3-client-cgame-players-ml-525323157"></a>
### flipflop

```ml
flipflop
```

True when the animation returns through its frames in reverse after reaching the end.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L141)

<a id="field-field-mq3-client-cgame-players-animation-framelerp-framelerp-src-mq3-client-cgame-players-ml-522636065"></a>
### frameLerp

```ml
frameLerp
```

Interval in milliseconds between successive animation frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L135)

<a id="field-field-mq3-client-cgame-players-animation-initiallerp-initiallerp-src-mq3-client-cgame-players-ml-1599150573"></a>
### initialLerp

```ml
initialLerp
```

Time in milliseconds used to reach the first frame of a newly selected animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L137)

<a id="field-field-mq3-client-cgame-players-animation-loopframes-loopframes-src-mq3-client-cgame-players-ml-971402701"></a>
### loopFrames

```ml
loopFrames
```

Number of trailing animation frames repeated after the initial sequence; zero disables looping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L133)

<a id="field-field-mq3-client-cgame-players-animation-numframes-numframes-src-mq3-client-cgame-players-ml-555616429"></a>
### numFrames

```ml
numFrames
```

Number of model frames belonging to the animation sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L131)

<a id="field-field-mq3-client-cgame-players-animation-reversed-reversed-src-mq3-client-cgame-players-ml-762405609"></a>
### reversed

```ml
reversed
```

True when animation frames are traversed in reverse order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L139)
