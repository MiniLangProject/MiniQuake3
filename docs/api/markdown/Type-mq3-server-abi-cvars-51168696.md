# `mq3.server.abi.Cvars`

[Home](README.md) · [Source file](File-src-mq3-server-abi-ml-141226179.md)

<a id="struct-struct-mq3-server-abi-cvars-struct-cvars-src-mq3-server-abi-ml-1770383287"></a>
## Cvars

```ml
struct Cvars
```

Cvars record for server.abi, containing `fps`, `timeout`, `zombietime`, `rconPassword`, `privatePassword`, `allowDownload`, and 19 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L401)

## Members

<a id="field-field-mq3-server-abi-cvars-allowdownload-allowdownload-src-mq3-server-abi-ml-1996238220"></a>
### allowDownload

```ml
allowDownload
```

True when clients may request files from the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L413)

<a id="field-field-mq3-server-abi-cvars-floodprotect-floodprotect-src-mq3-server-abi-ml-1030442946"></a>
### floodProtect

```ml
floodProtect
```

True when repeated client commands are rate limited.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L447)

<a id="field-field-mq3-server-abi-cvars-fps-fps-src-mq3-server-abi-ml-1845915736"></a>
### fps

```ml
fps
```

Requested server simulation frames per second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L403)

<a id="field-field-mq3-server-abi-cvars-gametype-gametype-src-mq3-server-abi-ml-1018056524"></a>
### gametype

```ml
gametype
```

Game-mode identifier used when applying mode-specific rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L443)

<a id="field-field-mq3-server-abi-cvars-hostname-hostname-src-mq3-server-abi-ml-1177527946"></a>
### hostname

```ml
hostname
```

Server display name advertised to clients and directory services.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L419)

<a id="field-field-mq3-server-abi-cvars-killserver-killserver-src-mq3-server-abi-ml-612777538"></a>
### killserver

```ml
killserver
```

Configuration variable requesting server shutdown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L429)

<a id="field-field-mq3-server-abi-cvars-lanforcerate-lanforcerate-src-mq3-server-abi-ml-944280336"></a>
### lanForceRate

```ml
lanForceRate
```

True when LAN clients bypass the normal rate limit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L449)

<a id="field-field-mq3-server-abi-cvars-mapchecksum-mapchecksum-src-mq3-server-abi-ml-1348861188"></a>
### mapChecksum

```ml
mapChecksum
```

Checksum of the currently loaded BSP map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L433)

<a id="field-field-mq3-server-abi-cvars-mapname-mapname-src-mq3-server-abi-ml-66405300"></a>
### mapname

```ml
mapname
```

Name of the current game map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L431)

<a id="field-field-mq3-server-abi-cvars-masters-masters-src-mq3-server-abi-ml-261934916"></a>
### masters

```ml
masters
```

Configured master-server addresses receiving heartbeats.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L421)

<a id="field-field-mq3-server-abi-cvars-maxclients-maxclients-src-mq3-server-abi-ml-1985876380"></a>
### maxclients

```ml
maxclients
```

Native-compatible server configuration value controlling the client-slot limit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L415)

<a id="field-field-mq3-server-abi-cvars-maxping-maxping-src-mq3-server-abi-ml-363546268"></a>
### maxPing

```ml
maxPing
```

Maximum client latency accepted by the connection policy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L441)

<a id="field-field-mq3-server-abi-cvars-maxrate-maxrate-src-mq3-server-abi-ml-1334319640"></a>
### maxRate

```ml
maxRate
```

Upper bound on the client transmission rate, in bytes per second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L437)

<a id="field-field-mq3-server-abi-cvars-minping-minping-src-mq3-server-abi-ml-2103471032"></a>
### minPing

```ml
minPing
```

Minimum client latency accepted by the connection policy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L439)

<a id="field-field-mq3-server-abi-cvars-padpackets-padpackets-src-mq3-server-abi-ml-1859172868"></a>
### padPackets

```ml
padPackets
```

Additional padding requested for outgoing snapshot messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L427)

<a id="field-field-mq3-server-abi-cvars-privateclients-privateclients-src-mq3-server-abi-ml-884560682"></a>
### privateClients

```ml
privateClients
```

Number of client slots reserved for clients with the private password.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L417)

<a id="field-field-mq3-server-abi-cvars-privatepassword-privatepassword-src-mq3-server-abi-ml-605858524"></a>
### privatePassword

```ml
privatePassword
```

Password required to use the reserved private client slots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L411)

<a id="field-field-mq3-server-abi-cvars-pure-pure-src-mq3-server-abi-ml-1801546812"></a>
### pure

```ml
pure
```

True when clients must use the server-approved package checksums.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L445)

<a id="field-field-mq3-server-abi-cvars-rconpassword-rconpassword-src-mq3-server-abi-ml-1437870354"></a>
### rconPassword

```ml
rconPassword
```

Password required to accept a remote-console command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L409)

<a id="field-field-mq3-server-abi-cvars-reconnectlimit-reconnectlimit-src-mq3-server-abi-ml-600765840"></a>
### reconnectlimit

```ml
reconnectlimit
```

Minimum interval required before a client may reconnect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L423)

<a id="field-field-mq3-server-abi-cvars-serverid-serverid-src-mq3-server-abi-ml-1774085212"></a>
### serverid

```ml
serverid
```

Identifier distinguishing the current server or map session.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L435)

<a id="field-field-mq3-server-abi-cvars-showloss-showloss-src-mq3-server-abi-ml-1311928972"></a>
### showloss

```ml
showloss
```

Configuration variable enabling packet-loss diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L425)

<a id="field-field-mq3-server-abi-cvars-strictauth-strictauth-src-mq3-server-abi-ml-1462512034"></a>
### strictAuth

```ml
strictAuth
```

True when the server requires successful external authorization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L451)

<a id="field-field-mq3-server-abi-cvars-timeout-timeout-src-mq3-server-abi-ml-843255480"></a>
### timeout

```ml
timeout
```

Configuration variable controlling client inactivity timeout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L405)

<a id="field-field-mq3-server-abi-cvars-zombietime-zombietime-src-mq3-server-abi-ml-1188159074"></a>
### zombietime

```ml
zombietime
```

Configuration variable controlling disconnected-client retention.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L407)
