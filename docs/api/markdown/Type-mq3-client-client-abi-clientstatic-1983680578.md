# `mq3.client.client_abi.ClientStatic`

[Home](README.md) · [Source file](File-src-mq3-client-client-abi-ml-362324391.md)

<a id="struct-struct-mq3-client-client-abi-clientstatic-struct-clientstatic-src-mq3-client-client-abi-ml-1475790239"></a>
## ClientStatic

```ml
struct ClientStatic
```

Stores client ABI client static record, including `state`, `keyCatchers`, `cddialog`, `servername`, `rendererStarted`, `soundStarted` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L244)

## Members

<a id="field-field-mq3-client-client-abi-clientstatic-authorizeserver-authorizeserver-src-mq3-client-client-abi-ml-642518616"></a>
### authorizeServer

```ml
authorizeServer
```

Compatibility member corresponding to native `clientStatic_t.authorizeServer`; the original declaration is `netadr_t authorizeServer`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L324)

<a id="field-field-mq3-client-client-abi-clientstatic-cddialog-cddialog-src-mq3-client-client-abi-ml-1994333854"></a>
### cddialog

```ml
cddialog
```

True when the missing-CD dialog should be shown on the next client frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L251)

<a id="field-field-mq3-client-client-abi-clientstatic-cgamestarted-cgamestarted-src-mq3-client-client-abi-ml-76959376"></a>
### cgameStarted

```ml
cgameStarted
```

Compatibility member corresponding to native `clientStatic_t.cgameStarted`; the original declaration is `qboolean cgameStarted`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L269)

<a id="field-field-mq3-client-client-abi-clientstatic-charsetshader-charsetshader-src-mq3-client-client-abi-ml-1538351656"></a>
### charSetShader

```ml
charSetShader
```

Shader resource selected for char set rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L328)

<a id="field-field-mq3-client-client-abi-clientstatic-consoleshader-consoleshader-src-mq3-client-client-abi-ml-272540528"></a>
### consoleShader

```ml
consoleShader
```

Shader resource selected for console rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L332)

<a id="field-field-mq3-client-client-abi-clientstatic-favoriteservers-favoriteservers-src-mq3-client-client-abi-ml-214594696"></a>
### favoriteServers

```ml
favoriteServers
```

Compatibility member corresponding to native `clientStatic_t.favoriteServers`; the original declaration is `serverInfo_t favoriteServers[MAX_OTHER_SERVERS]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L300)

<a id="field-field-mq3-client-client-abi-clientstatic-framecount-framecount-src-mq3-client-client-abi-ml-1967133836"></a>
### framecount

```ml
framecount
```

Compatibility member corresponding to native `clientStatic_t.framecount`; the original declaration is `int framecount`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L272)

<a id="field-field-mq3-client-client-abi-clientstatic-frametime-frametime-src-mq3-client-client-abi-ml-554536196"></a>
### frametime

```ml
frametime
```

Elapsed client time in milliseconds since the preceding frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L274)

<a id="field-field-mq3-client-client-abi-clientstatic-glconfig-glconfig-src-mq3-client-client-abi-ml-1802284030"></a>
### glconfig

```ml
glconfig
```

Renderer configuration reported by the engine for the current display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L326)

<a id="field-field-mq3-client-client-abi-clientstatic-globalserveraddresses-globalserveraddresses-src-mq3-client-client-abi-ml-1543820768"></a>
### globalServerAddresses

```ml
globalServerAddresses
```

Compatibility member corresponding to native `clientStatic_t.globalServerAddresses`; the original declaration is `serverAddress_t globalServerAddresses[MAX_GLOBAL_SERVERS]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L295)

<a id="field-field-mq3-client-client-abi-clientstatic-globalservers-globalservers-src-mq3-client-client-abi-ml-621096000"></a>
### globalServers

```ml
globalServers
```

Compatibility member corresponding to native `clientStatic_t.globalServers`; the original declaration is `serverInfo_t globalServers[MAX_GLOBAL_SERVERS]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L289)

<a id="field-field-mq3-client-client-abi-clientstatic-keycatchers-keycatchers-src-mq3-client-client-abi-ml-982330980"></a>
### keyCatchers

```ml
keyCatchers
```

Bitmask selecting which subsystems currently intercept keyboard input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L249)

<a id="field-field-mq3-client-client-abi-clientstatic-localservers-localservers-src-mq3-client-client-abi-ml-516122582"></a>
### localServers

```ml
localServers
```

Compatibility member corresponding to native `clientStatic_t.localServers`; the original declaration is `serverInfo_t localServers[MAX_OTHER_SERVERS]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L284)

<a id="field-field-mq3-client-client-abi-clientstatic-masternum-masternum-src-mq3-client-client-abi-ml-578102412"></a>
### masterNum

```ml
masterNum
```

Compatibility member corresponding to native `clientStatic_t.masterNum`; the original declaration is `int masterNum`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L312)

<a id="field-field-mq3-client-client-abi-clientstatic-mplayerservers-mplayerservers-src-mq3-client-client-abi-ml-1736172564"></a>
### mplayerServers

```ml
mplayerServers
```

Compatibility member corresponding to native `clientStatic_t.mplayerServers`; the original declaration is `serverInfo_t mplayerServers[MAX_OTHER_SERVERS]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L306)

<a id="field-field-mq3-client-client-abi-clientstatic-numfavoriteservers-numfavoriteservers-src-mq3-client-client-abi-ml-47923088"></a>
### numfavoriteservers

```ml
numfavoriteservers
```

Number of valid entries in the cached favorite-server list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L297)

<a id="field-field-mq3-client-client-abi-clientstatic-numglobalserveraddresses-numglobalserveraddresses-src-mq3-client-client-abi-ml-833565400"></a>
### numGlobalServerAddresses

```ml
numGlobalServerAddresses
```

Compatibility member corresponding to native `clientStatic_t.numGlobalServerAddresses`; the original declaration is `int numGlobalServerAddresses`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L292)

<a id="field-field-mq3-client-client-abi-clientstatic-numglobalservers-numglobalservers-src-mq3-client-client-abi-ml-1012139194"></a>
### numglobalservers

```ml
numglobalservers
```

Number of valid entries in the cached global-server list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L286)

<a id="field-field-mq3-client-client-abi-clientstatic-numlocalservers-numlocalservers-src-mq3-client-client-abi-ml-1919980024"></a>
### numlocalservers

```ml
numlocalservers
```

Number of valid entries discovered on the local network.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L281)

<a id="field-field-mq3-client-client-abi-clientstatic-nummplayerservers-nummplayerservers-src-mq3-client-client-abi-ml-1104242292"></a>
### nummplayerservers

```ml
nummplayerservers
```

Compatibility member corresponding to native `clientStatic_t.nummplayerservers`; the original declaration is `int nummplayerservers`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L303)

<a id="field-field-mq3-client-client-abi-clientstatic-pingupdatesource-pingupdatesource-src-mq3-client-client-abi-ml-984723808"></a>
### pingUpdateSource

```ml
pingUpdateSource
```

Compatibility member corresponding to native `clientStatic_t.pingUpdateSource`; the original declaration is `int pingUpdateSource`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L309)

<a id="field-field-mq3-client-client-abi-clientstatic-realframetime-realframetime-src-mq3-client-client-abi-ml-1715827472"></a>
### realFrametime

```ml
realFrametime
```

Compatibility member corresponding to native `clientStatic_t.realFrametime`; the original declaration is `int realFrametime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L279)

<a id="field-field-mq3-client-client-abi-clientstatic-realtime-realtime-src-mq3-client-client-abi-ml-101840838"></a>
### realtime

```ml
realtime
```

Persistent client runtime clock in milliseconds, independent of map server-time synchronization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L276)

<a id="field-field-mq3-client-client-abi-clientstatic-rendererstarted-rendererstarted-src-mq3-client-client-abi-ml-1665258308"></a>
### rendererStarted

```ml
rendererStarted
```

Compatibility member corresponding to native `clientStatic_t.rendererStarted`; the original declaration is `qboolean rendererStarted`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L257)

<a id="field-field-mq3-client-client-abi-clientstatic-servername-servername-src-mq3-client-client-abi-ml-2016383132"></a>
### servername

```ml
servername
```

Compatibility member corresponding to native `clientStatic_t.servername`; the original declaration is `char servername[MAX_OSPATH]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L254)

<a id="field-field-mq3-client-client-abi-clientstatic-soundregistered-soundregistered-src-mq3-client-client-abi-ml-1432425140"></a>
### soundRegistered

```ml
soundRegistered
```

Compatibility member corresponding to native `clientStatic_t.soundRegistered`; the original declaration is `qboolean soundRegistered`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L263)

<a id="field-field-mq3-client-client-abi-clientstatic-soundstarted-soundstarted-src-mq3-client-client-abi-ml-1777698372"></a>
### soundStarted

```ml
soundStarted
```

Compatibility member corresponding to native `clientStatic_t.soundStarted`; the original declaration is `qboolean soundStarted`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L260)

<a id="field-field-mq3-client-client-abi-clientstatic-state-state-src-mq3-client-client-abi-ml-1506842152"></a>
### state

```ml
state
```

Compatibility member corresponding to native `clientStatic_t.state`; the original declaration is `connstate_t state`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L247)

<a id="field-field-mq3-client-client-abi-clientstatic-uistarted-uistarted-src-mq3-client-client-abi-ml-666449964"></a>
### uiStarted

```ml
uiStarted
```

Compatibility member corresponding to native `clientStatic_t.uiStarted`; the original declaration is `qboolean uiStarted`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L266)

<a id="field-field-mq3-client-client-abi-clientstatic-updatechallenge-updatechallenge-src-mq3-client-client-abi-ml-57066964"></a>
### updateChallenge

```ml
updateChallenge
```

Compatibility member corresponding to native `clientStatic_t.updateChallenge`; the original declaration is `char updateChallenge[MAX_TOKEN_CHARS]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L318)

<a id="field-field-mq3-client-client-abi-clientstatic-updateinfostring-updateinfostring-src-mq3-client-client-abi-ml-2103762108"></a>
### updateInfoString

```ml
updateInfoString
```

Compatibility member corresponding to native `clientStatic_t.updateInfoString`; the original declaration is `char updateInfoString[MAX_INFO_STRING]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L321)

<a id="field-field-mq3-client-client-abi-clientstatic-updateserver-updateserver-src-mq3-client-client-abi-ml-635167132"></a>
### updateServer

```ml
updateServer
```

Compatibility member corresponding to native `clientStatic_t.updateServer`; the original declaration is `netadr_t updateServer`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L315)

<a id="field-field-mq3-client-client-abi-clientstatic-whiteshader-whiteshader-src-mq3-client-client-abi-ml-2028466064"></a>
### whiteShader

```ml
whiteShader
```

Shader resource selected for white rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L330)
