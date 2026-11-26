# `mq3.client.ui_lan_cache.Services`

[Home](README.md) · [Source file](File-src-mq3-client-ui-lan-cache-ml-483900424.md)

<a id="struct-struct-mq3-client-ui-lan-cache-services-struct-services-src-mq3-client-ui-lan-cache-ml-1761930785"></a>
## Services

```ml
struct Services
```

Stores UI LAN cache host-service callbacks, including `readFn`, `writeFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L38)

## Members

<a id="field-field-mq3-client-ui-lan-cache-services-context-context-src-mq3-client-ui-lan-cache-ml-586066505"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for server-browser cache persistence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L45)

<a id="field-field-mq3-client-ui-lan-cache-services-readfn-readfn-src-mq3-client-ui-lan-cache-ml-1613170457"></a>
### readFn

```ml
readFn
```

Host callback for the read operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L40)

<a id="field-field-mq3-client-ui-lan-cache-services-writefn-writefn-src-mq3-client-ui-lan-cache-ml-694088061"></a>
### writeFn

```ml
writeFn
```

Host callback for the write operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_cache.ml#L42)
