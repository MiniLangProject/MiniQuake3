# `mq3.client.ui_players_missionpack.Animation`

[Home](README.md) · [Source file](File-src-mq3-client-ui-players-missionpack-ml-1990652480.md)

<a id="struct-struct-mq3-client-ui-players-missionpack-animation-struct-animation-src-mq3-client-ui-players-missionpack-ml-1510617471"></a>
## Animation

```ml
struct Animation
```

Stores UI players missionpack animation record, including `firstFrame`, `numFrames`, `loopFrames`, `frameLerp`, `initialLerp`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L112)

## Members

<a id="field-field-mq3-client-ui-players-missionpack-animation-firstframe-firstframe-src-mq3-client-ui-players-missionpack-ml-1632507341"></a>
### firstFrame

```ml
firstFrame
```

Index of the first model frame belonging to the animation sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L114)

<a id="field-field-mq3-client-ui-players-missionpack-animation-framelerp-framelerp-src-mq3-client-ui-players-missionpack-ml-393800619"></a>
### frameLerp

```ml
frameLerp
```

Interval in milliseconds between successive animation frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L120)

<a id="field-field-mq3-client-ui-players-missionpack-animation-initiallerp-initiallerp-src-mq3-client-ui-players-missionpack-ml-2110461719"></a>
### initialLerp

```ml
initialLerp
```

Time in milliseconds used to reach the first frame of a newly selected animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L122)

<a id="field-field-mq3-client-ui-players-missionpack-animation-loopframes-loopframes-src-mq3-client-ui-players-missionpack-ml-427009503"></a>
### loopFrames

```ml
loopFrames
```

Number of trailing animation frames repeated after the initial sequence; zero disables looping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L118)

<a id="field-field-mq3-client-ui-players-missionpack-animation-numframes-numframes-src-mq3-client-ui-players-missionpack-ml-2110626479"></a>
### numFrames

```ml
numFrames
```

Number of model frames belonging to the animation sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L116)
