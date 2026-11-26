# `mq3.server.pipeline.Pipeline`

[Home](README.md) · [Source file](File-src-mq3-server-pipeline-ml-1429392167.md)

<a id="struct-struct-mq3-server-pipeline-pipeline-struct-pipeline-src-mq3-server-pipeline-ml-1804983839"></a>
## Pipeline

```ml
struct Pipeline
```

Pipeline record for server.pipeline, containing `runtime`, `runtimeLevel`, `client`, `server`, `downloadState`, `downloadServer`, and 7 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L11)

## Members

<a id="field-field-mq3-server-pipeline-pipeline-client-client-src-mq3-server-pipeline-ml-822809763"></a>
### client

```ml
client
```

Client-specific reliable-command and snapshot state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L17)

<a id="field-field-mq3-server-pipeline-pipeline-clientnum-clientnum-src-mq3-server-pipeline-ml-1013092645"></a>
### clientNum

```ml
clientNum
```

Server client-slot number associated with this runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L31)

<a id="field-field-mq3-server-pipeline-pipeline-downloadhost-downloadhost-src-mq3-server-pipeline-ml-300483749"></a>
### downloadHost

```ml
downloadHost
```

Host callbacks that open, read, and close downloadable files.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L25)

<a id="field-field-mq3-server-pipeline-pipeline-downloadserver-downloadserver-src-mq3-server-pipeline-ml-59532903"></a>
### downloadServer

```ml
downloadServer
```

Server download policy and timing values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L23)

<a id="field-field-mq3-server-pipeline-pipeline-downloadstate-downloadstate-src-mq3-server-pipeline-ml-199825289"></a>
### downloadState

```ml
downloadState
```

Current download window for this client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L21)

<a id="field-field-mq3-server-pipeline-pipeline-fragments-fragments-src-mq3-server-pipeline-ml-645985653"></a>
### fragments

```ml
fragments
```

Outgoing fragments waiting to be transmitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L33)

<a id="field-field-mq3-server-pipeline-pipeline-lan-lan-src-mq3-server-pipeline-ml-592338309"></a>
### lan

```ml
lan
```

True when this connection is classified as belonging to the local network.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L37)

<a id="field-field-mq3-server-pipeline-pipeline-local-local-src-mq3-server-pipeline-ml-658483945"></a>
### local

```ml
local
```

True when this connection or destination is local to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L35)

<a id="field-field-mq3-server-pipeline-pipeline-netchannel-netchannel-src-mq3-server-pipeline-ml-449437301"></a>
### netChannel

```ml
netChannel
```

Sequenced channel carrying this client's outgoing messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L29)

<a id="field-field-mq3-server-pipeline-pipeline-netruntime-netruntime-src-mq3-server-pipeline-ml-906480947"></a>
### netRuntime

```ml
netRuntime
```

Host packet-transmission runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L27)

<a id="field-field-mq3-server-pipeline-pipeline-runtime-runtime-src-mq3-server-pipeline-ml-491231977"></a>
### runtime

```ml
runtime
```

Shared snapshot runtime used to build frames and access the snapshot-entity ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L13)

<a id="field-field-mq3-server-pipeline-pipeline-runtimelevel-runtimelevel-src-mq3-server-pipeline-ml-181938417"></a>
### runtimeLevel

```ml
runtimeLevel
```

Server level state shared by the snapshot and message pipeline.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L15)

<a id="field-field-mq3-server-pipeline-pipeline-server-server-src-mq3-server-pipeline-ml-472002339"></a>
### server

```ml
server
```

Server timing and snapshot state used when sending messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L19)
