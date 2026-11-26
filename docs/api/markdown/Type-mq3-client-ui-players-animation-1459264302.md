# `mq3.client.ui_players.Animation`

[Home](README.md) · [Source file](File-src-mq3-client-ui-players-ml-675454436.md)

<a id="struct-struct-mq3-client-ui-players-animation-struct-animation-src-mq3-client-ui-players-ml-1253886027"></a>
## Animation

```ml
struct Animation
```

Stores UI players animation record, including `firstFrame`, `numFrames`, `loopFrames`, `frameLerp`, `initialLerp`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L111)

## Members

<a id="field-field-mq3-client-ui-players-animation-firstframe-firstframe-src-mq3-client-ui-players-ml-98073049"></a>
### firstFrame

```ml
firstFrame
```

Index of the first model frame belonging to the animation sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L113)

<a id="field-field-mq3-client-ui-players-animation-framelerp-framelerp-src-mq3-client-ui-players-ml-1440648491"></a>
### frameLerp

```ml
frameLerp
```

Interval in milliseconds between successive animation frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L119)

<a id="field-field-mq3-client-ui-players-animation-initiallerp-initiallerp-src-mq3-client-ui-players-ml-1813786103"></a>
### initialLerp

```ml
initialLerp
```

Time in milliseconds used to reach the first frame of a newly selected animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L121)

<a id="field-field-mq3-client-ui-players-animation-loopframes-loopframes-src-mq3-client-ui-players-ml-613270527"></a>
### loopFrames

```ml
loopFrames
```

Number of trailing animation frames repeated after the initial sequence; zero disables looping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L117)

<a id="field-field-mq3-client-ui-players-animation-numframes-numframes-src-mq3-client-ui-players-ml-143736159"></a>
### numFrames

```ml
numFrames
```

Number of model frames belonging to the animation sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L115)
