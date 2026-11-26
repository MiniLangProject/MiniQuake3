# `mq3.game.ai_dmnet.MissionServices`

[Home](README.md) · [Source file](File-src-mq3-game-ai-dmnet-ml-1223783669.md)

<a id="struct-struct-mq3-game-ai-dmnet-missionservices-struct-missionservices-src-mq3-game-ai-dmnet-ml-733054573"></a>
## MissionServices

```ml
struct MissionServices
```

`MissionServices` record for ai dmnet, containing `missionpack`, `teamFn`, `neutralFlagGoalFn`, `redFlagGoalFn` and `blueFlagGoalFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L124)

## Members

<a id="field-field-mq3-game-ai-dmnet-missionservices-alternateroutefn-alternateroutefn-src-mq3-game-ai-dmnet-ml-1049428481"></a>
### alternateRouteFn

```ml
alternateRouteFn
```

Injected callback for alternate route; invoked through the MissionServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L149)

<a id="field-field-mq3-game-ai-dmnet-missionservices-blueflaggoalfn-blueflaggoalfn-src-mq3-game-ai-dmnet-ml-1657547537"></a>
### blueFlagGoalFn

```ml
blueFlagGoalFn
```

Injected callback for blue flag goal; invoked through the MissionServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L134)

<a id="field-field-mq3-game-ai-dmnet-missionservices-blueobeliskgoalfn-blueobeliskgoalfn-src-mq3-game-ai-dmnet-ml-724909251"></a>
### blueObeliskGoalFn

```ml
blueObeliskGoalFn
```

Injected callback for blue obelisk goal; invoked through the MissionServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L138)

<a id="field-field-mq3-game-ai-dmnet-missionservices-carryingcubesfn-carryingcubesfn-src-mq3-game-ai-dmnet-ml-1014536279"></a>
### carryingCubesFn

```ml
carryingCubesFn
```

Injected callback for carrying cubes; invoked through the MissionServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L145)

<a id="field-field-mq3-game-ai-dmnet-missionservices-carryingneutralfn-carryingneutralfn-src-mq3-game-ai-dmnet-ml-1997231751"></a>
### carryingNeutralFn

```ml
carryingNeutralFn
```

Injected callback for carrying neutral; invoked through the MissionServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L143)

<a id="field-field-mq3-game-ai-dmnet-missionservices-context-context-src-mq3-game-ai-dmnet-ml-1312237691"></a>
### context

```ml
context
```

Opaque caller-supplied context available to mission-pack team, objective, alternate-route, and harvesting callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L154)

<a id="field-field-mq3-game-ai-dmnet-missionservices-feelingbadfn-feelingbadfn-src-mq3-game-ai-dmnet-ml-1537262073"></a>
### feelingBadFn

```ml
feelingBadFn
```

Injected callback for feeling bad; invoked through the MissionServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L147)

<a id="field-field-mq3-game-ai-dmnet-missionservices-goharvestfn-goharvestfn-src-mq3-game-ai-dmnet-ml-1828754967"></a>
### goHarvestFn

```ml
goHarvestFn
```

Injected callback for go harvest; invoked through the MissionServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L151)

<a id="field-field-mq3-game-ai-dmnet-missionservices-missionpack-missionpack-src-mq3-game-ai-dmnet-ml-1794373243"></a>
### missionpack

```ml
missionpack
```

Nonzero when mission-pack rules and content are enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L126)

<a id="field-field-mq3-game-ai-dmnet-missionservices-neutralflaggoalfn-neutralflaggoalfn-src-mq3-game-ai-dmnet-ml-163560147"></a>
### neutralFlagGoalFn

```ml
neutralFlagGoalFn
```

Injected callback for neutral flag goal; invoked through the MissionServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L130)

<a id="field-field-mq3-game-ai-dmnet-missionservices-neutralobeliskgoalfn-neutralobeliskgoalfn-src-mq3-game-ai-dmnet-ml-986238349"></a>
### neutralObeliskGoalFn

```ml
neutralObeliskGoalFn
```

Injected callback for neutral obelisk goal; invoked through the MissionServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L141)

<a id="field-field-mq3-game-ai-dmnet-missionservices-redflaggoalfn-redflaggoalfn-src-mq3-game-ai-dmnet-ml-603342459"></a>
### redFlagGoalFn

```ml
redFlagGoalFn
```

Injected callback for red flag goal; invoked through the MissionServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L132)

<a id="field-field-mq3-game-ai-dmnet-missionservices-redobeliskgoalfn-redobeliskgoalfn-src-mq3-game-ai-dmnet-ml-1047771225"></a>
### redObeliskGoalFn

```ml
redObeliskGoalFn
```

Injected callback for red obelisk goal; invoked through the MissionServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L136)

<a id="field-field-mq3-game-ai-dmnet-missionservices-teamfn-teamfn-src-mq3-game-ai-dmnet-ml-596103689"></a>
### teamFn

```ml
teamFn
```

Injected callback for team; invoked through the MissionServices service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L128)
