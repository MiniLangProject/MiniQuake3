# `mq3.client.ui_lan_queries.Services`

[Home](README.md) · [Source file](File-src-mq3-client-ui-lan-queries-ml-738625990.md)

<a id="struct-struct-mq3-client-ui-lan-queries-services-struct-services-src-mq3-client-ui-lan-queries-ml-313685281"></a>
## Services

```ml
struct Services
```

sendFn(context,sock,address,packet) owns the actual UDP socket. resolveFn returns a netchan.Address and is only needed for DNS names.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_queries.ml#L22)

## Members

<a id="field-field-mq3-client-ui-lan-queries-services-context-context-src-mq3-client-ui-lan-queries-ml-761500629"></a>
### context

```ml
context
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_queries.ml#L22)

<a id="field-field-mq3-client-ui-lan-queries-services-resolvefn-resolvefn-src-mq3-client-ui-lan-queries-ml-1855641213"></a>
### resolveFn

```ml
resolveFn
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_queries.ml#L22)

<a id="field-field-mq3-client-ui-lan-queries-services-sendfn-sendfn-src-mq3-client-ui-lan-queries-ml-602511877"></a>
### sendFn

```ml
sendFn
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_queries.ml#L22)
