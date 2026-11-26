# `mq3.server.client_lifecycle.Runtime`

[Home](README.md) · [Source file](File-src-mq3-server-client-lifecycle-ml-743240113.md)

<a id="struct-struct-mq3-server-client-lifecycle-runtime-struct-runtime-src-mq3-server-client-lifecycle-ml-2127704785"></a>
## Runtime

```ml
struct Runtime
```

Runtime record for server.client_lifecycle, containing `server`, `host`, `clientNum`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L388)

## Members

<a id="field-field-mq3-server-client-lifecycle-runtime-clientnum-clientnum-src-mq3-server-client-lifecycle-ml-1134551365"></a>
### clientNum

```ml
clientNum
```

Server client-slot number associated with this runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L394)

<a id="field-field-mq3-server-client-lifecycle-runtime-host-host-src-mq3-server-client-lifecycle-ml-760992877"></a>
### host

```ml
host
```

Host callback interface supplying external services to this runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L392)

<a id="field-field-mq3-server-client-lifecycle-runtime-server-server-src-mq3-server-client-lifecycle-ml-231671599"></a>
### server

```ml
server
```

Server policy and package-checksum state used by client lifecycle operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L390)
