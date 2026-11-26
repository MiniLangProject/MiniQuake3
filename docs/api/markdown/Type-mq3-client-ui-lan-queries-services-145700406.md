# `mq3.client.ui_lan_queries.Services`

[Home](README.md) · [Source file](File-src-mq3-client-ui-lan-queries-ml-738625990.md)

<a id="struct-struct-mq3-client-ui-lan-queries-services-struct-services-src-mq3-client-ui-lan-queries-ml-313685281"></a>
## Services

```ml
struct Services
```

sendFn(context,sock,address,packet) owns the actual UDP socket. resolveFn returns a netchan.Address and is only needed for DNS names.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_queries.ml#L29)

## Members

<a id="field-field-mq3-client-ui-lan-queries-services-context-context-src-mq3-client-ui-lan-queries-ml-761500629"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for LAN server status and ping queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_queries.ml#L36)

<a id="field-field-mq3-client-ui-lan-queries-services-resolvefn-resolvefn-src-mq3-client-ui-lan-queries-ml-1855641213"></a>
### resolveFn

```ml
resolveFn
```

Host callback for the resolve operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_queries.ml#L33)

<a id="field-field-mq3-client-ui-lan-queries-services-sendfn-sendfn-src-mq3-client-ui-lan-queries-ml-602511877"></a>
### sendFn

```ml
sendFn
```

Host callback for the send operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_queries.ml#L31)
