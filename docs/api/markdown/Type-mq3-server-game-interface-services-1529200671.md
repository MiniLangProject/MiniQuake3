# `mq3.server.game_interface.Services`

[Home](README.md) · [Source file](File-src-mq3-server-game-interface-ml-1640517219.md)

<a id="struct-struct-mq3-server-game-interface-services-struct-services-src-mq3-server-game-interface-ml-587330771"></a>
## Services

```ml
struct Services
```

Services record for server.game_interface, containing `errorFn`, `printFn`, `sendServerCommandFn`, `dropClientFn`, `pointLeafnumFn`, `leafClusterFn`, and 5 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L62)

## Members

<a id="field-field-mq3-server-game-interface-services-adjustareaportalfn-adjustareaportalfn-src-mq3-server-game-interface-ml-557580263"></a>
### adjustAreaPortalFn

```ml
adjustAreaPortalFn
```

Host callback that changes connectivity through an area portal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L80)

<a id="field-field-mq3-server-game-interface-services-clusterpvsfn-clusterpvsfn-src-mq3-server-game-interface-ml-2020552449"></a>
### clusterPvsFn

```ml
clusterPvsFn
```

Host callback that returns the potentially visible set for a visibility cluster.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L78)

<a id="field-field-mq3-server-game-interface-services-context-context-src-mq3-server-game-interface-ml-163048223"></a>
### context

```ml
context
```

Caller-supplied data associated with server operations exposed to game VM system calls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L84)

<a id="field-field-mq3-server-game-interface-services-dropclientfn-dropclientfn-src-mq3-server-game-interface-ml-1847556155"></a>
### dropClientFn

```ml
dropClientFn
```

Host callback that disconnects a client with the supplied reason.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L70)

<a id="field-field-mq3-server-game-interface-services-errorfn-errorfn-src-mq3-server-game-interface-ml-1273367031"></a>
### errorFn

```ml
errorFn
```

Host callback that reports a host error using the requested error severity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L64)

<a id="field-field-mq3-server-game-interface-services-gamecommandfn-gamecommandfn-src-mq3-server-game-interface-ml-1978563143"></a>
### gameCommandFn

```ml
gameCommandFn
```

Host callback that delivers a client command to the game VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L82)

<a id="field-field-mq3-server-game-interface-services-leafareafn-leafareafn-src-mq3-server-game-interface-ml-1824098793"></a>
### leafAreaFn

```ml
leafAreaFn
```

Host callback that returns the portal area containing a BSP leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L76)

<a id="field-field-mq3-server-game-interface-services-leafclusterfn-leafclusterfn-src-mq3-server-game-interface-ml-1950267599"></a>
### leafClusterFn

```ml
leafClusterFn
```

Host callback that returns the visibility cluster containing a BSP leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L74)

<a id="field-field-mq3-server-game-interface-services-pointleafnumfn-pointleafnumfn-src-mq3-server-game-interface-ml-27907051"></a>
### pointLeafnumFn

```ml
pointLeafnumFn
```

Host callback that returns the numeric BSP leaf index for a point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L72)

<a id="field-field-mq3-server-game-interface-services-printfn-printfn-src-mq3-server-game-interface-ml-161418199"></a>
### printFn

```ml
printFn
```

Host callback that prints messages issued by game VM server system calls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L66)

<a id="field-field-mq3-server-game-interface-services-sendservercommandfn-sendservercommandfn-src-mq3-server-game-interface-ml-2125788639"></a>
### sendServerCommandFn

```ml
sendServerCommandFn
```

Host callback that queues a reliable server command for selected clients.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L68)
