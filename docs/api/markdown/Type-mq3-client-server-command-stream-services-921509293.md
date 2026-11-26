# `mq3.client.server_command_stream.Services`

[Home](README.md) · [Source file](File-src-mq3-client-server-command-stream-ml-1493457615.md)

<a id="struct-struct-mq3-client-server-command-stream-services-struct-services-src-mq3-client-server-command-stream-ml-718009267"></a>
## Services

```ml
struct Services
```

Stores server command stream host-service callbacks, including `context`, `configstringFn`, `systemInfoFn`, `clearNotifyFn`, `clearUsercmdsFn`, `closeConsoleFn` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L18)

## Members

<a id="field-field-mq3-client-server-command-stream-services-clearnotifyfn-clearnotifyfn-src-mq3-client-server-command-stream-ml-482701757"></a>
### clearNotifyFn

```ml
clearNotifyFn
```

Host callback for the clear notify operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L30)

<a id="field-field-mq3-client-server-command-stream-services-clearusercmdsfn-clearusercmdsfn-src-mq3-client-server-command-stream-ml-1184587613"></a>
### clearUsercmdsFn

```ml
clearUsercmdsFn
```

Host callback for the clear usercmds operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L33)

<a id="field-field-mq3-client-server-command-stream-services-closeconsolefn-closeconsolefn-src-mq3-client-server-command-stream-ml-1794709571"></a>
### closeConsoleFn

```ml
closeConsoleFn
```

Host callback for the close console operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L36)

<a id="field-field-mq3-client-server-command-stream-services-configstringfn-configstringfn-src-mq3-client-server-command-stream-ml-103712943"></a>
### configstringFn

```ml
configstringFn
```

Host callback for the configstring operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L24)

<a id="field-field-mq3-client-server-command-stream-services-context-context-src-mq3-client-server-command-stream-ml-719759785"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for reliable server-command delivery.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L21)

<a id="field-field-mq3-client-server-command-stream-services-queueconsolefn-queueconsolefn-src-mq3-client-server-command-stream-ml-2057323217"></a>
### queueConsoleFn

```ml
queueConsoleFn
```

Host callback for the queue console operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L39)

<a id="field-field-mq3-client-server-command-stream-services-serverrunning-serverrunning-src-mq3-client-server-command-stream-ml-379297225"></a>
### serverRunning

```ml
serverRunning
```

True when a local game server is running in the same engine instance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L41)

<a id="field-field-mq3-client-server-command-stream-services-systeminfofn-systeminfofn-src-mq3-client-server-command-stream-ml-211130187"></a>
### systemInfoFn

```ml
systemInfoFn
```

Host callback for the system info operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L27)
