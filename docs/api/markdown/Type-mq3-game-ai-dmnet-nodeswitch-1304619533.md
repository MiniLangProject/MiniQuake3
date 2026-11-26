# `mq3.game.ai_dmnet.NodeSwitch`

[Home](README.md) · [Source file](File-src-mq3-game-ai-dmnet-ml-1223783669.md)

<a id="struct-struct-mq3-game-ai-dmnet-nodeswitch-struct-nodeswitch-src-mq3-game-ai-dmnet-ml-940728167"></a>
## NodeSwitch

```ml
struct NodeSwitch
```

`NodeSwitch` record for ai dmnet, containing `client`, `name`, `time`, `node` and `detail` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L96)

## Members

<a id="field-field-mq3-game-ai-dmnet-nodeswitch-client-client-src-mq3-game-ai-dmnet-ml-880937161"></a>
### client

```ml
client
```

Client slot of the bot whose decision-network transition was recorded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L98)

<a id="field-field-mq3-game-ai-dmnet-nodeswitch-detail-detail-src-mq3-game-ai-dmnet-ml-255451481"></a>
### detail

```ml
detail
```

Additional diagnostic or action detail supplied by the bot controller.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L106)

<a id="field-field-mq3-game-ai-dmnet-nodeswitch-name-name-src-mq3-game-ai-dmnet-ml-1676645917"></a>
### name

```ml
name
```

Bot/player name included in the node-switch diagnostic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L100)

<a id="field-field-mq3-game-ai-dmnet-nodeswitch-node-node-src-mq3-game-ai-dmnet-ml-1257316431"></a>
### node

```ml
node
```

Name or identifier of the active bot decision-network node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L104)

<a id="field-field-mq3-game-ai-dmnet-nodeswitch-source-source-src-mq3-game-ai-dmnet-ml-159893921"></a>
### source

```ml
source
```

Source/condition label explaining why this node transition was recorded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L108)

<a id="field-field-mq3-game-ai-dmnet-nodeswitch-time-time-src-mq3-game-ai-dmnet-ml-62489145"></a>
### time

```ml
time
```

Time at which the decision-network transition occurred.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L102)
