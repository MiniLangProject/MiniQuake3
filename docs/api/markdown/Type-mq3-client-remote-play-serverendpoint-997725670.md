# `mq3.client.remote_play.ServerEndpoint`

[Home](README.md) · [Source file](File-src-mq3-client-remote-play-ml-1364331402.md)

<a id="struct-struct-mq3-client-remote-play-serverendpoint-struct-serverendpoint-src-mq3-client-remote-play-ml-2000703311"></a>
## ServerEndpoint

```ml
struct ServerEndpoint
```

Stores remote play server endpoint record, including `host`, `port`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L32)

## Members

<a id="field-field-mq3-client-remote-play-serverendpoint-host-host-src-mq3-client-remote-play-ml-1921451291"></a>
### host

```ml
host
```

Host-adapter callbacks and context used to execute the module's engine operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L34)

<a id="field-field-mq3-client-remote-play-serverendpoint-port-port-src-mq3-client-remote-play-ml-866610981"></a>
### port

```ml
port
```

When constructing this record, `parseEndpoint` supplies `port` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L36)
