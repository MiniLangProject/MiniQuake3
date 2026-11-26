# `mq3.server.connectionless.Services`

[Home](README.md) · [Source file](File-src-mq3-server-connectionless-ml-1112827538.md)

<a id="struct-struct-mq3-server-connectionless-services-struct-services-src-mq3-server-connectionless-ml-2039880973"></a>
## Services

```ml
struct Services
```

Host callbacks for connectionless packets; callbacks receive this record and can access its context.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/connectionless.ml#L11)

## Members

<a id="field-field-mq3-server-connectionless-services-authorizefn-authorizefn-src-mq3-server-connectionless-ml-1141817077"></a>
### authorizeFn

```ml
authorizeFn
```

Optional callback `(host, sourceAddress, args)` for ipAuthorize packets; this dispatcher does not\n+  /// validate the authorization source before invoking it.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/connectionless.ml#L20)

<a id="field-field-mq3-server-connectionless-services-context-context-src-mq3-server-connectionless-ml-141957949"></a>
### context

```ml
context
```

Caller-owned data accessible inside the callbacks through `host.context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/connectionless.ml#L26)

<a id="field-field-mq3-server-connectionless-services-decompressfn-decompressfn-src-mq3-server-connectionless-ml-410084571"></a>
### decompressFn

```ml
decompressFn
```

Optional callback `(host, msg, offset)` decompressing a connect packet in place from byte offset 12.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/connectionless.ml#L22)

<a id="field-field-mq3-server-connectionless-services-diagnosticfn-diagnosticfn-src-mq3-server-connectionless-ml-342345831"></a>
### diagnosticFn

```ml
diagnosticFn
```

Optional callback `(host, sourceAddress, text)` for an unrecognized connectionless command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/connectionless.ml#L24)

<a id="field-field-mq3-server-connectionless-services-infofn-infofn-src-mq3-server-connectionless-ml-1647304997"></a>
### infoFn

```ml
infoFn
```

Optional callback `(host, sourceAddress, args)` for a tokenized getinfo request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/connectionless.ml#L15)

<a id="field-field-mq3-server-connectionless-services-rconfn-rconfn-src-mq3-server-connectionless-ml-1251775357"></a>
### rconFn

```ml
rconFn
```

Optional callback `(host, sourceAddress, msg, text, args)` receiving an unverified rcon request. The callback must perform any password checks and rate limiting before executing its command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/connectionless.ml#L18)

<a id="field-field-mq3-server-connectionless-services-statusfn-statusfn-src-mq3-server-connectionless-ml-153119941"></a>
### statusFn

```ml
statusFn
```

Optional callback `(host, sourceAddress, args)` for a tokenized getstatus request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/connectionless.ml#L13)
